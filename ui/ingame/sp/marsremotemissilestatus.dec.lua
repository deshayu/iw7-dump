local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = {
	Unavailable = 0,
	Available = 1,
	Active = 2
}
f0_local1 = function ( f1_arg0, f1_arg1, f1_arg2 )
	assert( f1_arg0.Fill and f1_arg0.StatusText, "WARNING: Mars Remote Missile Status Items Are Missing..." )
	local f1_local0 = f1_arg0.Fill
	local f1_local1 = f1_arg0.StatusText
	f1_local1:SetShadowUOffset( -0 )
	f1_local1:SetShadowVOffset( -0 )
	local f1_local2 = DataSources.inGame.SP.mars.marsRemoteMissileReady
	local f1_local3 = DataSources.inGame.SP.mars.marsRemoteMissileCooldown
	f1_local0:SubscribeToModel( f1_local3:GetModel( f1_arg1 ), function ()
		f1_local0:SetRightAnchor( 1 - f1_local3:GetValue( f1_arg1 ) )
	end )
	f1_arg0:SubscribeToModel( f1_local2:GetModel( f1_arg1 ), function ()
		local f3_local0 = f1_local2:GetValue( f1_arg1 )
		if f3_local0 then
			ACTIONS.AnimateSequence( f1_arg0, "Update" )
			if f3_local0 == f0_local0.Unavailable then
				f1_local0:SetRGBFromTable( SWATCHES.HUD.statusFill_Unavailable, 0 )
				f1_local1:SetRGBFromTable( SWATCHES.HUD.statusFill_Unavailable, 0 )
				f1_local1:setText( ToUpperCase( Engine.Localize( "MARSBASE_KILLSTREAK_NOT_READY" ) ), 0 )
			elseif f3_local0 == f0_local0.Available then
				f1_local0:SetRGBFromTable( SWATCHES.HUD.statusFill_Available, 0 )
				f1_local1:SetRGBFromTable( SWATCHES.HUD.statusFill_Available, 0 )
				f1_local1:setText( ToUpperCase( Engine.Localize( "MARSBASE_KILLSTREAK_READY" ) ), 0 )
				ACTIONS.AnimateSequence( f1_arg0, "NotifyOn" )
			elseif f3_local0 == f0_local0.Active then
				f1_local0:SetRGBFromTable( SWATCHES.HUD.statusFill_Active, 0 )
				f1_local1:SetRGBFromTable( SWATCHES.HUD.statusFill_Active, 0 )
				f1_local1:setText( ToUpperCase( Engine.Localize( "LUA_MENU_MP_TRANSPONDER_OUTOFRANGE" ) ), 0 )
				ACTIONS.AnimateSequence( f1_arg0, "NotifyOff" )
			end
		end
	end )
end

function MarsRemoteMissileStatus( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 130 * _1080p, 0, 16 * _1080p )
	self.id = "MarsRemoteMissileStatus"
	self._animationSets = {}
	self._sequences = {}
	local f4_local1 = controller and controller.controllerIndex
	if not f4_local1 and not Engine.InFrontend() then
		f4_local1 = self:getRootController()
	end
	assert( f4_local1 )
	local f4_local2 = self
	local Background = nil
	
	Background = LUI.UIImage.new()
	Background.id = "Background"
	Background:SetRGBFromInt( 0, 0 )
	Background:SetAlpha( 0.3, 0 )
	Background:setImage( RegisterMaterial( "ui_default_white" ), 0 )
	Background:SetUseAA( true )
	self:addElement( Background )
	self.Background = Background
	
	local Border = nil
	
	Border = LUI.UIBorder.new( {
		borderThicknessLeft = _1080p * 2,
		borderThicknessRight = _1080p * 2,
		borderThicknessTop = _1080p * 0,
		borderThicknessBottom = _1080p * 0
	} )
	Border.id = "Border"
	Border:SetBorderThicknessLeft( _1080p * 2, 0 )
	Border:SetBorderThicknessRight( _1080p * 2, 0 )
	Border:SetBorderThicknessTop( _1080p * 0, 0 )
	Border:SetBorderThicknessBottom( _1080p * 0, 0 )
	Border:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * -2, _1080p * 2, 0, 0 )
	self:addElement( Border )
	self.Border = Border
	
	local Fill = nil
	
	Fill = LUI.UIImage.new()
	Fill.id = "Fill"
	Fill:SetRGBFromTable( SWATCHES.HUD.statusFill_Available, 0 )
	Fill:SetAlpha( 0.3, 0 )
	Fill:setImage( RegisterMaterial( "ui_default_white" ), 0 )
	self:addElement( Fill )
	self.Fill = Fill
	
	local StatusText = nil
	
	StatusText = LUI.UIStyledText.new()
	StatusText.id = "StatusText"
	StatusText:SetRGBFromTable( SWATCHES.HUD.primary, 0 )
	StatusText:SetDepth( -5, 0 )
	StatusText:setText( Engine.Localize( "MARSBASE_KILLSTREAK_NOT_READY" ), 0 )
	StatusText:SetFontSize( 16 * _1080p )
	StatusText:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	StatusText:SetAlignment( LUI.Alignment.Center )
	StatusText:SetShadowMinDistance( -0.01, 0 )
	StatusText:SetShadowMaxDistance( 0.01, 0 )
	StatusText:SetShadowRGBFromInt( 0, 0 )
	StatusText:SetAnchorsAndPosition( 0, 0, 0.5, 0.5, 0, 0, _1080p * -8, _1080p * 8 )
	self:addElement( StatusText )
	self.StatusText = StatusText
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		Fill:RegisterAnimationSequence( "NotifyOn", {
			{
				function ()
					return self.Fill:SetAlpha( 0.3, 0 )
				end,
				function ()
					return self.Fill:SetAlpha( 0, 500 )
				end,
				function ()
					return self.Fill:SetAlpha( 0.3, 500 )
				end
			}
		} )
		self._sequences.NotifyOn = function ()
			Fill:AnimateLoop( "NotifyOn" )
		end
		
		Fill:RegisterAnimationSequence( "NotifyOff", {
			{
				function ()
					return self.Fill:SetAlpha( 0.3, 100 )
				end
			}
		} )
		self._sequences.NotifyOff = function ()
			Fill:AnimateSequence( "NotifyOff" )
		end
		
		StatusText:RegisterAnimationSequence( "Update", {
			{
				function ()
					return self.StatusText:SetAlpha( 1, 0 )
				end,
				function ()
					return self.StatusText:SetAlpha( 0, 50 )
				end,
				function ()
					return self.StatusText:SetAlpha( 1, 50 )
				end,
				function ()
					return self.StatusText:SetAlpha( 0, 50 )
				end,
				function ()
					return self.StatusText:SetAlpha( 1, 50 )
				end,
				function ()
					return self.StatusText:SetAlpha( 0, 50 )
				end,
				function ()
					return self.StatusText:SetAlpha( 1, 50 )
				end
			}
		} )
		self._sequences.Update = function ()
			StatusText:AnimateSequence( "Update" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	f0_local1( self, f4_local1, controller )
	return self
end

MenuBuilder.registerType( "MarsRemoteMissileStatus", MarsRemoteMissileStatus )
LockTable( _M )
