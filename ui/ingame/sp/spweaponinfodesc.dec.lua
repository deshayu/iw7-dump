local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ( f1_arg0 )
	if Engine.IsGamepadEnabled() == 1 then
		f1_arg0.ToggleHint:setText( Engine.Localize( "PLATFORM_UNDERBARREL_TOGGLE" ), 0 )
	else
		f1_arg0.ToggleHint:setText( Engine.Localize( "PLATFORM_UNDERBARREL_TOGGLE_MKB" ), 0 )
	end
end

f0_local1 = function ( f2_arg0, f2_arg1, f2_arg2 )
	local f2_local0 = assert
	local f2_local1 = f2_arg0.WeaponName
	if f2_local1 then
		f2_local1 = f2_arg0.AltMode
		if f2_local1 then
			f2_local1 = f2_arg0.ToggleHint and f2_arg0.Node
		end
	end
	f2_local0( f2_local1 )
	f2_local0 = f2_arg0.WeaponName
	f2_local1 = f2_arg0.AltMode
	local f2_local2 = f2_arg0.ToggleHint
	local f2_local3 = f2_arg0.Node
	f2_local0:SetShadowUOffset( -0 )
	f2_local0:SetShadowVOffset( -0 )
	f2_local1:SetShadowUOffset( -0 )
	f2_local1:SetShadowVOffset( -0 )
	f2_local2:SetShadowUOffset( -0 )
	f2_local2:SetShadowVOffset( -0 )
	local f2_local4 = DataSources.inGame.player.currentWeapon.displayName
	local f2_local5 = DataSources.inGame.player.currentWeapon.altModeDisplayName
	local f2_local6 = f2_local0:GetCurrentFont()
	local f2_local7, f2_local8, f2_local9, f2_local10 = f2_local0:getLocalRect()
	local f2_local11 = math.abs( f2_local10 - f2_local8 )
	local f2_local12 = _1080p * 6
	local f2_local13 = _1080p * 6
	local f2_local14 = function ()
		local f3_local0 = f2_local4:GetValue( f2_arg1 ) or ""
		local f3_local1 = f2_local5:GetValue( f2_arg1 ) or ""
		local f3_local2 = LocalizeString( f3_local0 )
		local f3_local3 = LocalizeString( f3_local1 )
		local f3_local4, f3_local5, f3_local6, f3_local7 = GetTextDimensions( f3_local2, f2_local6, f2_local11 )
		local f3_local8 = math.abs( f3_local6 - f3_local4 )
		local f3_local9, f3_local10, f3_local11, f3_local12 = GetTextDimensions( f3_local3, f2_local6, f2_local11 )
		local f3_local13 = math.abs( f3_local11 - f3_local9 )
		local f3_local14 = f3_local8 + f2_local12
		local f3_local15 = f3_local8 + f2_local12
		local f3_local16 = f2_local13 + f3_local15
		local f3_local17 = f3_local16 + f2_local12
		local f3_local18 = f3_local13 + f3_local17 + f2_local12
		f2_local0:SetAnchorsAndPosition( 1, 0, 0, 1, -f3_local14, 0, 0, _1080p * 20 )
		f2_local3:SetAnchorsAndPosition( 1, 0, 0, 1, -f3_local16, -f3_local15, _1080p * 7, _1080p * 13 )
		f2_local1:SetAnchorsAndPosition( 1, 0, 0, 1, -f3_local18, -f3_local17, 0, _1080p * 20 )
		f2_local0:setText( f3_local2, 0 )
		f2_local1:setText( f3_local3, 0 )
	end
	
	local f2_local15 = function ()
		local f4_local0 = CONDITIONS.WeaponHasAltMode( f2_arg1, f2_arg0 )
		local f4_local1 = CONDITIONS.IsSpectating( f2_arg0 )
		ACTIONS.AnimateSequence( f2_arg0, "UpdatedWeaponName" )
		ACTIONS.AnimateSequence( f2_arg0, "UpdatedAltModeName" )
		if f4_local0 and not f4_local1 then
			f2_local2:SetAlpha( 1, 500 )
		elseif not f4_local0 or f4_local1 then
			f2_local2:SetAlpha( 0 )
		end
	end
	
	f2_arg0:SubscribeToModel( f2_local4:GetModel( f2_arg1 ), function ()
		f2_local14()
		f2_local15()
	end )
	f2_arg0:SubscribeToModel( f2_local5:GetModel( f2_arg1 ), function ()
		f2_local14()
		f2_local15()
	end )
	f0_local0( f2_arg0 )
	f2_arg0:registerEventHandler( "empty_menu_stack", function ( element, event )
		f0_local0( element )
	end )
end

function SPWeaponInfoDesc( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 500 * _1080p, 0, 40 * _1080p )
	self.id = "SPWeaponInfoDesc"
	self._animationSets = {}
	self._sequences = {}
	local f8_local1 = controller and controller.controllerIndex
	if not f8_local1 and not Engine.InFrontend() then
		f8_local1 = self:getRootController()
	end
	assert( f8_local1 )
	local f8_local2 = self
	local WeaponName = nil
	
	WeaponName = LUI.UIStyledText.new()
	WeaponName.id = "WeaponName"
	WeaponName:SetRGBFromTable( SWATCHES.HUD.secondary, 0 )
	WeaponName:setText( "", 0 )
	WeaponName:SetFontSize( 20 * _1080p )
	WeaponName:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	WeaponName:SetAlignment( LUI.Alignment.Right )
	WeaponName:SetShadowMinDistance( -0.01, 0 )
	WeaponName:SetShadowMaxDistance( 0.01, 0 )
	WeaponName:SetShadowRGBFromInt( 0, 0 )
	WeaponName:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -135, 0, 0, _1080p * 20 )
	self:addElement( WeaponName )
	self.WeaponName = WeaponName
	
	local AltMode = nil
	
	AltMode = LUI.UIStyledText.new()
	AltMode.id = "AltMode"
	AltMode:SetRGBFromTable( SWATCHES.HUD.secondary, 0 )
	AltMode:setText( "", 0 )
	AltMode:SetFontSize( 20 * _1080p )
	AltMode:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	AltMode:SetAlignment( LUI.Alignment.Right )
	AltMode:SetShadowMinDistance( -0.01, 0 )
	AltMode:SetShadowMaxDistance( 0.01, 0 )
	AltMode:SetShadowRGBFromInt( 0, 0 )
	AltMode:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -291, _1080p * -172, 0, _1080p * 20 )
	self:addElement( AltMode )
	self.AltMode = AltMode
	
	local ToggleHint = nil
	
	ToggleHint = LUI.UIStyledText.new()
	ToggleHint.id = "ToggleHint"
	ToggleHint:SetRGBFromTable( SWATCHES.HUD.primary, 0 )
	ToggleHint:SetZRotation( 2, 0 )
	ToggleHint:setText( Engine.Localize( "PLATFORM_UNDERBARREL_TOGGLE" ), 0 )
	ToggleHint:SetFontSize( 20 * _1080p )
	ToggleHint:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	ToggleHint:SetAlignment( LUI.Alignment.Right )
	ToggleHint:SetShadowMinDistance( -0.01, 0 )
	ToggleHint:SetShadowMaxDistance( 0.01, 0 )
	ToggleHint:SetShadowRGBFromInt( 0, 0 )
	ToggleHint:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -500, 0, _1080p * 30, _1080p * 50 )
	self:addElement( ToggleHint )
	self.ToggleHint = ToggleHint
	
	local Node = nil
	
	Node = LUI.UIImage.new()
	Node.id = "Node"
	Node:SetRGBFromTable( SWATCHES.HUD.secondary, 0 )
	Node:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -156, _1080p * -150, _1080p * 7, _1080p * 13 )
	self:addElement( Node )
	self.Node = Node
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		WeaponName:RegisterAnimationSequence( "UpdatedWeaponName", {
			{
				function ()
					return self.WeaponName:SetAlpha( 1, 0 )
				end,
				function ()
					return self.WeaponName:SetAlpha( 1, 1000 )
				end,
				function ()
					return self.WeaponName:SetAlpha( 0, 1000 )
				end
			}
		} )
		self._sequences.UpdatedWeaponName = function ()
			WeaponName:AnimateSequence( "UpdatedWeaponName" )
		end
		
		AltMode:RegisterAnimationSequence( "UpdatedAltModeName", {
			{
				function ()
					return self.AltMode:SetAlpha( 1, 0 )
				end,
				function ()
					return self.AltMode:SetAlpha( 1, 1000 )
				end,
				function ()
					return self.AltMode:SetAlpha( 0, 1000 )
				end
			}
		} )
		Node:RegisterAnimationSequence( "UpdatedAltModeName", {
			{
				function ()
					return self.Node:SetAlpha( 1, 0 )
				end,
				function ()
					return self.Node:SetAlpha( 1, 1000 )
				end,
				function ()
					return self.Node:SetAlpha( 0, 1000 )
				end
			}
		} )
		self._sequences.UpdatedAltModeName = function ()
			AltMode:AnimateSequence( "UpdatedAltModeName" )
			Node:AnimateSequence( "UpdatedAltModeName" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	f0_local1( self, f8_local1, controller )
	return self
end

MenuBuilder.registerType( "SPWeaponInfoDesc", SPWeaponInfoDesc )
LockTable( _M )
