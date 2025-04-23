local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function ThorMissile( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 126 * _1080p, 0, 112 * _1080p )
	self.id = "ThorMissile"
	self._animationSets = {}
	self._sequences = {}
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local InactiveMissile = nil
	
	InactiveMissile = LUI.UIImage.new()
	InactiveMissile.id = "InactiveMissile"
	InactiveMissile:setImage( RegisterMaterial( "hud_icon_missle_disabled" ), 0 )
	InactiveMissile:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -28, _1080p * 28, _1080p * 4, _1080p * 111 )
	self:addElement( InactiveMissile )
	self.InactiveMissile = InactiveMissile
	
	local ActiveMissile = nil
	
	ActiveMissile = LUI.UIImage.new()
	ActiveMissile.id = "ActiveMissile"
	ActiveMissile:setImage( RegisterMaterial( "hud_icon_missle_enabled" ), 0 )
	ActiveMissile:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -28, _1080p * 28, _1080p * 2, _1080p * 110 )
	self:addElement( ActiveMissile )
	self.ActiveMissile = ActiveMissile
	
	local IDLabel = nil
	
	IDLabel = LUI.UIText.new()
	IDLabel.id = "IDLabel"
	IDLabel:SetFontSize( 24 * _1080p )
	IDLabel:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	IDLabel:SetAlignment( LUI.Alignment.Left )
	IDLabel:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 2.5, _1080p * 19.5, _1080p * 2, _1080p * 26 )
	IDLabel:SubscribeToModelThroughElement( self, "idValue", function ()
		local f2_local0 = self:GetDataSource()
		f2_local0 = f2_local0.idValue:GetValue( f1_local1 )
		if f2_local0 ~= nil then
			IDLabel:setText( f2_local0, 0 )
		end
	end )
	self:addElement( IDLabel )
	self.IDLabel = IDLabel
	
	local ReadyBracket = nil
	
	ReadyBracket = LUI.UIImage.new()
	ReadyBracket.id = "ReadyBracket"
	ReadyBracket:SetRGBFromTable( SWATCHES.HUD.enemyTeam, 0 )
	ReadyBracket:setImage( RegisterMaterial( "hud_scorestreak_thor_missile_bracket" ), 0 )
	ReadyBracket:SetBlendMode( BLEND_MODE.addWithAlpha )
	ReadyBracket:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -35, _1080p * 35, _1080p * -35, _1080p * 35 )
	self:addElement( ReadyBracket )
	self.ReadyBracket = ReadyBracket
	
	local ReloadX = nil
	
	ReloadX = LUI.UIImage.new()
	ReloadX.id = "ReloadX"
	ReloadX:SetRGBFromTable( SWATCHES.HUD.DamageFlash, 0 )
	ReloadX:setImage( RegisterMaterial( "hud_scorestreak_thor_missile_empty" ), 0 )
	ReloadX:SetBlendMode( BLEND_MODE.addWithAlpha )
	ReloadX:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -48, _1080p * 48, _1080p * -48, _1080p * 48 )
	self:addElement( ReloadX )
	self.ReloadX = ReloadX
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		InactiveMissile:RegisterAnimationSequence( "MissileReady", {
			{
				function ()
					return self.InactiveMissile:SetAlpha( 0.5, 0 )
				end,
				function ()
					return self.InactiveMissile:SetAlpha( 0.5, 790 )
				end,
				function ()
					return self.InactiveMissile:SetAlpha( 0, 10 )
				end
			}
		} )
		ActiveMissile:RegisterAnimationSequence( "MissileReady", {
			{
				function ()
					return self.ActiveMissile:SetAlpha( 1, 0 )
				end,
				function ()
					return self.ActiveMissile:SetAlpha( 0, 200 )
				end,
				function ()
					return self.ActiveMissile:SetAlpha( 1, 200 )
				end,
				function ()
					return self.ActiveMissile:SetAlpha( 0, 200 )
				end,
				function ()
					return self.ActiveMissile:SetAlpha( 1, 200 )
				end
			},
			{
				function ()
					return self.ActiveMissile:SetRGBFromInt( 16777215, 0 )
				end
			}
		} )
		IDLabel:RegisterAnimationSequence( "MissileReady", {
			{
				function ()
					return self.IDLabel:SetRGBFromTable( SWATCHES.HUD.warning, 0 )
				end,
				function ()
					return self.IDLabel:SetRGBFromTable( SWATCHES.HUD.warning, 790 )
				end,
				function ()
					return self.IDLabel:SetRGBFromInt( 16777215, 10 )
				end
			}
		} )
		ReadyBracket:RegisterAnimationSequence( "MissileReady", {
			{
				function ()
					return self.ReadyBracket:SetAlpha( 1, 0 )
				end,
				function ()
					return self.ReadyBracket:SetAlpha( 0, 200, LUI.EASING.inQuadratic )
				end,
				function ()
					return self.ReadyBracket:SetAlpha( 1, 200, LUI.EASING.outQuadratic )
				end,
				function ()
					return self.ReadyBracket:SetAlpha( 0, 200, LUI.EASING.inQuadratic )
				end,
				function ()
					return self.ReadyBracket:SetAlpha( 1, 190, LUI.EASING.outQuadratic )
				end
			},
			{
				function ()
					return self.ReadyBracket:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -63, _1080p * 60, _1080p * -51, _1080p * 54, 0 )
				end,
				function ()
					return self.ReadyBracket:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -35, _1080p * 35, _1080p * -35, _1080p * 35, 200, LUI.EASING.inQuadratic )
				end
			}
		} )
		ReloadX:RegisterAnimationSequence( "MissileReady", {
			{
				function ()
					return self.ReloadX:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.MissileReady = function ()
			InactiveMissile:AnimateSequence( "MissileReady" )
			ActiveMissile:AnimateSequence( "MissileReady" )
			IDLabel:AnimateSequence( "MissileReady" )
			ReadyBracket:AnimateSequence( "MissileReady" )
			ReloadX:AnimateSequence( "MissileReady" )
		end
		
		InactiveMissile:RegisterAnimationSequence( "MissileFired", {
			{
				function ()
					return self.InactiveMissile:SetAlpha( 0, 1000 )
				end,
				function ()
					return self.InactiveMissile:SetAlpha( 0.5, 10 )
				end
			}
		} )
		ActiveMissile:RegisterAnimationSequence( "MissileFired", {
			{
				function ()
					return self.ActiveMissile:SetRGBFromInt( 16777215, 0 )
				end,
				function ()
					return self.ActiveMissile:SetRGBFromTable( SWATCHES.c12.missileFired, 200 )
				end,
				function ()
					return self.ActiveMissile:SetRGBFromTable( SWATCHES.c12.missileNormal, 200 )
				end,
				function ()
					return self.ActiveMissile:SetRGBFromTable( SWATCHES.c12.missileFired, 200 )
				end,
				function ()
					return self.ActiveMissile:SetRGBFromTable( SWATCHES.c12.missileNormal, 200 )
				end,
				function ()
					return self.ActiveMissile:SetRGBFromTable( SWATCHES.c12.missileFired, 200 )
				end
			},
			{
				function ()
					return self.ActiveMissile:SetAlpha( 1, 1000 )
				end,
				function ()
					return self.ActiveMissile:SetAlpha( 0, 10 )
				end
			}
		} )
		IDLabel:RegisterAnimationSequence( "MissileFired", {
			{
				function ()
					return self.IDLabel:SetRGBFromInt( 16777215, 0 )
				end,
				function ()
					return self.IDLabel:SetRGBFromInt( 16777215, 1000 )
				end,
				function ()
					return self.IDLabel:SetRGBFromTable( SWATCHES.HUD.warning, 10 )
				end
			}
		} )
		ReadyBracket:RegisterAnimationSequence( "MissileFired", {
			{
				function ()
					return self.ReadyBracket:SetAlpha( 0, 0 )
				end
			}
		} )
		ReloadX:RegisterAnimationSequence( "MissileFired", {
			{
				function ()
					return self.ReloadX:SetAlpha( 1, 0 )
				end,
				function ()
					return self.ReloadX:SetAlpha( 0, 100 )
				end,
				function ()
					return self.ReloadX:SetAlpha( 1, 100 )
				end,
				function ()
					return self.ReloadX:SetAlpha( 0, 100 )
				end,
				function ()
					return self.ReloadX:SetAlpha( 1, 100 )
				end,
				function ()
					return self.ReloadX:SetAlpha( 0, 100 )
				end,
				function ()
					return self.ReloadX:SetAlpha( 1, 100 )
				end,
				function ()
					return self.ReloadX:SetAlpha( 0, 100 )
				end,
				function ()
					return self.ReloadX:SetAlpha( 1, 100 )
				end,
				function ()
					return self.ReloadX:SetAlpha( 0, 100 )
				end,
				function ()
					return self.ReloadX:SetAlpha( 1, 100 )
				end
			},
			{
				function ()
					return self.ReloadX:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -1, _1080p * 1, _1080p * -1, _1080p * 1, 0 )
				end,
				function ()
					return self.ReloadX:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -48, _1080p * 48, _1080p * -48, _1080p * 48, 500 )
				end
			}
		} )
		self._sequences.MissileFired = function ()
			InactiveMissile:AnimateSequence( "MissileFired" )
			ActiveMissile:AnimateSequence( "MissileFired" )
			IDLabel:AnimateSequence( "MissileFired" )
			ReadyBracket:AnimateSequence( "MissileFired" )
			ReloadX:AnimateSequence( "MissileFired" )
		end
		
		InactiveMissile:RegisterAnimationSequence( "MissileUsed", {
			{
				function ()
					return self.InactiveMissile:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.InactiveMissile:SetRGBFromTable( SWATCHES.HUD.warning, 0 )
				end
			}
		} )
		ActiveMissile:RegisterAnimationSequence( "MissileUsed", {
			{
				function ()
					return self.ActiveMissile:SetAlpha( 0, 0 )
				end
			}
		} )
		IDLabel:RegisterAnimationSequence( "MissileUsed", {
			{
				function ()
					return self.IDLabel:SetRGBFromTable( SWATCHES.HUD.warning, 0 )
				end
			}
		} )
		ReadyBracket:RegisterAnimationSequence( "MissileUsed", {
			{
				function ()
					return self.ReadyBracket:SetAlpha( 0, 0 )
				end
			}
		} )
		ReloadX:RegisterAnimationSequence( "MissileUsed", {
			{
				function ()
					return self.ReloadX:SetAlpha( 1, 0 )
				end
			}
		} )
		self._sequences.MissileUsed = function ()
			InactiveMissile:AnimateSequence( "MissileUsed" )
			ActiveMissile:AnimateSequence( "MissileUsed" )
			IDLabel:AnimateSequence( "MissileUsed" )
			ReadyBracket:AnimateSequence( "MissileUsed" )
			ReloadX:AnimateSequence( "MissileUsed" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	self:SubscribeToModelThroughElement( self, "state", function ()
		local f61_local0 = self:GetDataSource()
		if f61_local0.state:GetValue( f1_local1 ) ~= nil then
			f61_local0 = self:GetDataSource()
			if f61_local0.state:GetValue( f1_local1 ) == 0 then
				ACTIONS.AnimateSequence( self, "MissileReady" )
			end
		end
		f61_local0 = self:GetDataSource()
		if f61_local0.state:GetValue( f1_local1 ) ~= nil then
			f61_local0 = self:GetDataSource()
			if f61_local0.state:GetValue( f1_local1 ) == 1 then
				ACTIONS.AnimateSequence( self, "MissileFired" )
			end
		end
		f61_local0 = self:GetDataSource()
		if f61_local0.state:GetValue( f1_local1 ) ~= nil then
			f61_local0 = self:GetDataSource()
			if f61_local0.state:GetValue( f1_local1 ) == 2 then
				ACTIONS.AnimateSequence( self, "MissileUsed" )
			end
		end
	end )
	return self
end

MenuBuilder.registerType( "ThorMissile", ThorMissile )
LockTable( _M )
