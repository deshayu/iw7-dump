local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function PostLoadFunc( f1_arg0, f1_arg1 )
	f1_arg0:SubscribeToModelThroughElement( f1_arg0, "missileCharge", function ( f2_arg0 )
		local f2_local0 = DataModel.GetModelValue( f2_arg0 )
		assert( f2_local0 )
		if f2_local0 < 1 and not f1_arg0._charging then
			ACTIONS.AnimateSequence( f1_arg0, "Charging" )
			f1_arg0._charging = true
		elseif f2_local0 >= 1 then
			f1_arg0._charging = false
		end
	end )
end

function C12Missile( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 70 * _1080p, 0, 90 * _1080p )
	self.id = "C12Missile"
	self._animationSets = {}
	self._sequences = {}
	local f3_local1 = controller and controller.controllerIndex
	if not f3_local1 and not Engine.InFrontend() then
		f3_local1 = self:getRootController()
	end
	assert( f3_local1 )
	local f3_local2 = self
	local ProgressBar = nil
	
	ProgressBar = LUI.UIImage.new()
	ProgressBar.id = "ProgressBar"
	ProgressBar:SetAnchors( 0, 0, 0, 1, 0 )
	ProgressBar:SetLeft( _1080p * 0, 0 )
	ProgressBar:SetRight( _1080p * 0, 0 )
	ProgressBar:SetBottom( _1080p * 64, 0 )
	ProgressBar:SetRGBFromTable( SWATCHES.c12.progressBarCharging, 0 )
	ProgressBar:SetAlpha( 0, 0 )
	ProgressBar:SubscribeToModelThroughElement( self, "missileCharge", function ()
		local f4_local0 = self:GetDataSource()
		f4_local0 = f4_local0.missileCharge:GetValue( f3_local1 )
		if f4_local0 ~= nil then
			ProgressBar:SetTop( _1080p * Multiply( Mirror( f4_local0, 0, 1 ), 64 ), 0 )
		end
	end )
	self:addElement( ProgressBar )
	self.ProgressBar = ProgressBar
	
	local MissileCharge = nil
	
	MissileCharge = LUI.UIText.new()
	MissileCharge.id = "MissileCharge"
	MissileCharge:SetRGBFromTable( SWATCHES.c12.chargingText, 0 )
	MissileCharge:SetFontSize( 16 * _1080p )
	MissileCharge:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	MissileCharge:SetAlignment( LUI.Alignment.Center )
	MissileCharge:SetAnchorsAndPosition( 0, 0, 1, 0, 0, 0, _1080p * -23.5, _1080p * -7.5 )
	MissileCharge:SubscribeToModelThroughElement( self, "progressText", function ()
		local f5_local0 = self:GetDataSource()
		f5_local0 = f5_local0.progressText:GetValue( f3_local1 )
		if f5_local0 ~= nil then
			MissileCharge:setText( f5_local0, 0 )
		end
	end )
	self:addElement( MissileCharge )
	self.MissileCharge = MissileCharge
	
	local Missile = nil
	
	Missile = LUI.UIImage.new()
	Missile.id = "Missile"
	Missile:setImage( RegisterMaterial( "hud_icon_missle_enabled" ), 0 )
	Missile:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 16, _1080p * -16, 0, _1080p * 64 )
	self:addElement( Missile )
	self.Missile = Missile
	
	local LockOn = nil
	
	LockOn = LUI.UIImage.new()
	LockOn.id = "LockOn"
	LockOn:SetRGBFromTable( SWATCHES.c12.lockOnIcon, 0 )
	LockOn:SetAlpha( 0, 0 )
	LockOn:setImage( RegisterMaterial( "viper_locking_box" ), 0 )
	LockOn:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -20, _1080p * 20, _1080p * 10.5, _1080p * 53.5 )
	self:addElement( LockOn )
	self.LockOn = LockOn
	
	local Frame = nil
	
	Frame = LUI.UIImage.new()
	Frame.id = "Frame"
	Frame:setImage( RegisterMaterial( "hud_c12_missile_frame" ), 0 )
	Frame:SetUseAA( true )
	Frame:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, 0, _1080p * 64 )
	self:addElement( Frame )
	self.Frame = Frame
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		ProgressBar:RegisterAnimationSequence( "Charging", {
			{
				function ()
					return self.ProgressBar:SetRGBFromTable( SWATCHES.c12.progressBarCharging, 0 )
				end
			},
			{
				function ()
					return self.ProgressBar:SetAlpha( 1, 0 )
				end
			}
		} )
		MissileCharge:RegisterAnimationSequence( "Charging", {
			{
				function ()
					return self.MissileCharge:SetRGBFromTable( SWATCHES.c12.chargingText, 0 )
				end
			}
		} )
		Missile:RegisterAnimationSequence( "Charging", {
			{
				function ()
					return self.Missile:setImage( RegisterMaterial( "hud_icon_missle_disabled" ), 0 )
				end
			},
			{
				function ()
					return self.Missile:SetAlpha( 0.5, 0 )
				end
			}
		} )
		self._sequences.Charging = function ()
			ProgressBar:AnimateSequence( "Charging" )
			MissileCharge:AnimateSequence( "Charging" )
			Missile:AnimateSequence( "Charging" )
		end
		
		MissileCharge:RegisterAnimationSequence( "TextReady", {
			{
				function ()
					return self.MissileCharge:SetAlpha( 1, 0 )
				end,
				function ()
					return self.MissileCharge:SetAlpha( 0.5, 500 )
				end,
				function ()
					return self.MissileCharge:SetAlpha( 1, 500 )
				end
			}
		} )
		self._sequences.TextReady = function ()
			MissileCharge:AnimateLoop( "TextReady" )
		end
		
		ProgressBar:RegisterAnimationSequence( "MissileReady", {
			{
				function ()
					return self.ProgressBar:SetRGBFromTable( SWATCHES.c12.progressBarFull, 0 )
				end
			},
			{
				function ()
					return self.ProgressBar:SetAlpha( 0, 400 )
				end
			}
		} )
		Missile:RegisterAnimationSequence( "MissileReady", {
			{
				function ()
					return self.Missile:SetAlpha( 1, 0 )
				end,
				function ()
					return self.Missile:SetAlpha( 0.5, 50 )
				end,
				function ()
					return self.Missile:SetAlpha( 1, 50 )
				end,
				function ()
					return self.Missile:SetAlpha( 0.5, 50 )
				end,
				function ()
					return self.Missile:SetAlpha( 1, 50 )
				end,
				function ()
					return self.Missile:SetAlpha( 0.5, 50 )
				end,
				function ()
					return self.Missile:SetAlpha( 1, 50 )
				end
			},
			{
				function ()
					return self.Missile:setImage( RegisterMaterial( "hud_icon_missle_enabled" ), 0 )
				end,
				function ()
					return self.Missile:setImage( RegisterMaterial( "hud_icon_missle_disabled" ), 50 )
				end,
				function ()
					return self.Missile:setImage( RegisterMaterial( "hud_icon_missle_enabled" ), 50 )
				end,
				function ()
					return self.Missile:setImage( RegisterMaterial( "hud_icon_missle_disabled" ), 50 )
				end,
				function ()
					return self.Missile:setImage( RegisterMaterial( "hud_icon_missle_enabled" ), 50 )
				end,
				function ()
					return self.Missile:setImage( RegisterMaterial( "hud_icon_missle_disabled" ), 50 )
				end,
				function ()
					return self.Missile:setImage( RegisterMaterial( "hud_icon_missle_enabled" ), 50 )
				end
			}
		} )
		self._sequences.MissileReady = function ()
			ProgressBar:AnimateSequence( "MissileReady" )
			Missile:AnimateSequence( "MissileReady" )
		end
		
		Missile:RegisterAnimationSequence( "MissileFired", {
			{
				function ()
					return self.Missile:setImage( RegisterMaterial( "hud_icon_missle_enabled" ), 0 )
				end,
				function ()
					return self.Missile:setImage( RegisterMaterial( "hud_icon_missle_enabled" ), 1000 )
				end,
				function ()
					return self.Missile:setImage( RegisterMaterial( "hud_icon_missle_disabled" ), 10 )
				end
			},
			{
				function ()
					return self.Missile:SetAlpha( 1, 0 )
				end,
				function ()
					return self.Missile:SetAlpha( 1, 1000 )
				end,
				function ()
					return self.Missile:SetAlpha( 0.5, 10 )
				end
			},
			{
				function ()
					return self.Missile:SetRGBFromInt( 16777215, 0 )
				end,
				function ()
					return self.Missile:SetRGBFromTable( SWATCHES.c12.missileFired, 200 )
				end,
				function ()
					return self.Missile:SetRGBFromInt( 16777215, 200 )
				end,
				function ()
					return self.Missile:SetRGBFromTable( SWATCHES.c12.missileFired, 200 )
				end,
				function ()
					return self.Missile:SetRGBFromInt( 16777215, 200 )
				end,
				function ()
					return self.Missile:SetRGBFromTable( SWATCHES.c12.missileFired, 200 )
				end,
				function ()
					return self.Missile:SetRGBFromInt( 16777215, 10 )
				end
			}
		} )
		self._sequences.MissileFired = function ()
			Missile:AnimateSequence( "MissileFired" )
		end
		
		LockOn:RegisterAnimationSequence( "ShowLock", {
			{
				function ()
					return self.LockOn:SetAlpha( 0, 0 )
				end,
				function ()
					return self.LockOn:SetAlpha( 1, 150, LUI.EASING.outBack )
				end
			},
			{
				function ()
					return self.LockOn:SetScale( 0.4, 0 )
				end,
				function ()
					return self.LockOn:SetScale( 0, 150, LUI.EASING.outBack )
				end
			}
		} )
		self._sequences.ShowLock = function ()
			LockOn:AnimateSequence( "ShowLock" )
		end
		
		LockOn:RegisterAnimationSequence( "HideLock", {
			{
				function ()
					return self.LockOn:SetAlpha( 1, 0 )
				end,
				function ()
					return self.LockOn:SetAlpha( 0, 150, LUI.EASING.inBack )
				end
			},
			{
				function ()
					return self.LockOn:SetScale( 0, 0 )
				end,
				function ()
					return self.LockOn:SetScale( 0.4, 150, LUI.EASING.inBack )
				end
			}
		} )
		self._sequences.HideLock = function ()
			LockOn:AnimateSequence( "HideLock" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	self:SubscribeToModelThroughElement( self, "missileFired", function ()
		local f59_local0 = self:GetDataSource()
		if f59_local0.missileFired:GetValue( f3_local1 ) ~= nil then
			f59_local0 = self:GetDataSource()
			if f59_local0.missileFired:GetValue( f3_local1 ) == true then
				ACTIONS.AnimateSequence( self, "MissileFired" )
			end
		end
	end )
	self:SubscribeToModelThroughElement( self, "missileReady", function ()
		local f60_local0 = self:GetDataSource()
		if f60_local0.missileReady:GetValue( f3_local1 ) ~= nil then
			f60_local0 = self:GetDataSource()
			if f60_local0.missileReady:GetValue( f3_local1 ) == true then
				ACTIONS.AnimateSequence( self, "MissileReady" )
				ACTIONS.AnimateSequence( self, "TextReady" )
			end
		end
	end )
	self:SubscribeToModelThroughElement( self, "lockState", function ()
		local f61_local0 = self:GetDataSource()
		if f61_local0.lockState:GetValue( f3_local1 ) ~= nil then
			f61_local0 = self:GetDataSource()
			if f61_local0.lockState:GetValue( f3_local1 ) == 1 then
				ACTIONS.AnimateSequence( self, "ShowLock" )
			end
		end
		f61_local0 = self:GetDataSource()
		if f61_local0.lockState:GetValue( f3_local1 ) ~= nil then
			f61_local0 = self:GetDataSource()
			if f61_local0.lockState:GetValue( f3_local1 ) == 0 then
				ACTIONS.AnimateSequence( self, "HideLock" )
			end
		end
	end )
	PostLoadFunc( self, f3_local1, controller )
	return self
end

MenuBuilder.registerType( "C12Missile", C12Missile )
LockTable( _M )
