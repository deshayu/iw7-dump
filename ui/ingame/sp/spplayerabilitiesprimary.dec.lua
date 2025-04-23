local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ( f1_arg0 )
	if Engine.IsGamepadEnabled() == 1 then
		ACTIONS.AnimateSequence( f1_arg0, "PrimaryAbilityAvailable" )
	else
		ACTIONS.AnimateSequence( f1_arg0, "PrimaryAbilityAvailablePC" )
	end
end

f0_local1 = function ( f2_arg0 )
	if Engine.IsGamepadEnabled() == 1 then
		ACTIONS.AnimateSequence( f2_arg0, "PrimaryAbilityUnavailable" )
	else
		ACTIONS.AnimateSequence( f2_arg0, "PrimaryAbilityUnavailablePC" )
	end
end

function PostLoadFunc( f3_arg0, f3_arg1, f3_arg2 )
	local f3_local0 = assert
	local f3_local1 = f3_arg0.Quantity
	if f3_local1 then
		f3_local1 = f3_arg0.KeyLabel
		if f3_local1 then
			f3_local1 = f3_arg0.ButtonRB
			if f3_local1 then
				f3_local1 = f3_arg0.Arrow and f3_arg0.Warning
			end
		end
	end
	f3_local0( f3_local1, "WARNING: SP Player Abilities Primary Items Are Missing..." )
	f3_arg0.Quantity:SetShadowUOffset( -0 )
	f3_arg0.Quantity:SetShadowVOffset( -0 )
	f3_arg0.KeyLabel:SetShadowUOffset( -0 )
	f3_arg0.KeyLabel:SetShadowVOffset( -0 )
	f3_local0 = DataSources.inGame.player.primaryPower.rechargeProgress
	f3_local1 = DataSources.inGame.player.primaryPower.type
	local f3_local2 = DataSources.inGame.player.primaryPower.powerDisabled
	local f3_local3 = DataSources.inGame.player.primaryPower.reference
	local f3_local4 = DataSources.inGame.player.primaryPower.lowPower
	local f3_local5 = DataSources.inGame.player.primaryPower.numCharges
	local f3_local6 = DataSources.inGame.player.primaryStoredPower.name
	local f3_local7 = function ()
		local f4_local0 = f3_local1:GetValue( f3_arg1 )
		local f4_local1 = false
		if f4_local0 == "drain" then
			local f4_local2 = f3_local0:GetValue( f3_arg1 )
			if f4_local2 ~= nil then
				f4_local1 = f4_local2 > 0
			end
		elseif f4_local0 == "charges" then
			local f4_local2 = f3_local5:GetValue( f3_arg1 )
			if f4_local2 ~= nil then
				f4_local1 = f4_local2 > 0
			end
		end
		if f4_local1 then
			f0_local0( f3_arg0 )
		else
			f0_local1( f3_arg0 )
		end
	end
	
	local f3_local8 = function ()
		local f5_local0 = DataSources.alwaysLoaded.input.commands.fragIcon:GetValue( f3_arg1 )
		if Engine.IsConsoleGame() then
			if f5_local0 ~= nil then
				if f5_local0 == "button_stick_right_up" or f5_local0 == "button_stick_right_down" then
					f3_arg0.ButtonRB:SetAnchorsAndPosition( 0.5, 0.5, 1, 0, _1080p * -29, _1080p * 29, _1080p * -30, _1080p * -5 )
				else
					f3_arg0.ButtonRB:SetAnchorsAndPosition( 0.5, 0.5, 1, 0, _1080p * -20, _1080p * 20, _1080p * -30, _1080p * -5 )
				end
				f3_arg0.ButtonRB:setImage( RegisterMaterial( f5_local0 ), 0 )
			end
		elseif f5_local0 ~= nil and Engine.IsGamepadEnabled() == 1 then
			f3_arg0.ButtonRB:setImage( RegisterMaterial( f5_local0 ), 0 )
			if f5_local0 == "button_stick_right_up" or f5_local0 == "button_stick_right_down" then
				f3_arg0.ButtonRB:SetAnchorsAndPosition( 0.5, 0.5, 1, 0, _1080p * -29, _1080p * 29, _1080p * -30, _1080p * -5 )
			else
				f3_arg0.ButtonRB:SetAnchorsAndPosition( 0.5, 0.5, 1, 0, _1080p * -20, _1080p * 20, _1080p * -30, _1080p * -5 )
			end
			f3_local7()
		else
			f3_arg0.ButtonRB:SetAlpha( 0, 0 )
		end
	end
	
	local f3_local9 = function ()
		if Engine.IsGamepadEnabled() == 1 then
			f3_arg0.KeyLabel:setText( "" )
		else
			local f6_local0 = Engine.GetKeyBindingLocalizedString( f3_arg1, "+frag", true )
			if string.len( f6_local0 ) < 6 then
				f3_arg0.KeyLabel:SetAnchorsAndPosition( 0, 0, 1, 0, 0, _1080p * 0, _1080p * -25, _1080p * -9 )
				f3_arg0.KeyLabel:SetAlignment( LUI.Alignment.Center )
			else
				f3_arg0.KeyLabel:SetAnchorsAndPosition( 0, 0, 1, 0, 0, _1080p * 30, _1080p * -25, _1080p * -9 )
				f3_arg0.KeyLabel:SetAlignment( LUI.Alignment.Left )
			end
			f3_arg0.KeyLabel:setText( f6_local0 )
		end
	end
	
	f3_arg0:registerEventHandler( "empty_menu_stack", function ( element, event )
		if not Engine.IsConsoleGame() then
			f3_local9()
		end
		f3_local8()
	end )
	if not Engine.IsConsoleGame() then
		f3_local9()
	else
		f3_arg0.KeyLabel:setText( "" )
	end
	f3_arg0.ButtonRB:SubscribeToModel( DataSources.alwaysLoaded.input.commands.fragIcon:GetModel( f3_arg1 ), f3_local8 )
	f3_arg0:SubscribeToModel( f3_local6:GetModel( f3_arg1 ), function ()
		if f3_local6:GetValue( f3_arg1 ) == "PERKS_NONE" then
			f3_arg0.Arrow:SetAlpha( 0 )
		else
			f3_arg0.Arrow:SetAlpha( 1 )
		end
	end )
	f3_arg0:SubscribeToModel( f3_local5:GetModel( f3_arg1 ), function ()
		local f9_local0 = f3_local5:GetValue( f3_arg1 )
		local f9_local1 = f3_local1:GetValue( f3_arg1 )
		local f9_local2 = f3_local3:GetValue( f3_arg1 )
		f3_arg0.Quantity:setText( f9_local0 )
		ACTIONS.AnimateSequence( f3_arg0, "UpdateCount" )
		if f9_local0 > 0 and f9_local1 == "charges" then
			f0_local0( f3_arg0 )
			ACTIONS.AnimateSequenceByElement( f3_arg0, {
				elementName = "PrimaryAbility",
				sequenceName = "Available",
				elementPath = ""
			} )
			ACTIONS.AnimateSequenceByElement( f3_arg0, {
				elementName = "PrimaryAbility",
				sequenceName = "UpdateAbility",
				elementPath = ""
			} )
		end
		if f9_local0 <= 0 and f9_local1 == "charges" and not f9_local2 == "none" then
			f0_local1( f3_arg0 )
			ACTIONS.AnimateSequenceByElement( f3_arg0, {
				elementName = "PrimaryAbility",
				sequenceName = "Unavailable",
				elementPath = ""
			} )
		end
	end )
	f3_arg0:SubscribeToModel( f3_local0:GetModel( f3_arg1 ), function ()
		local f10_local0 = f3_local0:GetValue( f3_arg1 )
		local f10_local1 = f3_local1:GetValue( f3_arg1 )
		local f10_local2 = f3_local3:GetValue( f3_arg1 )
		local f10_local3 = f3_local2:GetValue( f3_arg1 )
		local f10_local4 = f3_local4:GetValue( f3_arg1 ) * 1000
		if f10_local0 >= 1000 and f10_local1 == "drain" then
			ACTIONS.AnimateSequenceByElement( f3_arg0, {
				elementName = "PrimaryAbility",
				sequenceName = "Available",
				elementPath = ""
			} )
			ACTIONS.AnimateSequenceByElement( f3_arg0, {
				elementName = "PrimaryAbility",
				sequenceName = "UpdateAbility",
				elementPath = ""
			} )
			f0_local0( f3_arg0 )
		end
		if f10_local0 < 1000 and f10_local0 > 0 and f10_local1 == "drain" then
			ACTIONS.AnimateSequenceByElement( f3_arg0, {
				elementName = "PrimaryAbility",
				sequenceName = "AbilityInUse",
				elementPath = ""
			} )
		end
		if not (f10_local0 ~= 0 or f10_local1 ~= "drain" or not f10_local2 ~= "none") or f10_local3 then
			ACTIONS.AnimateSequenceByElement( f3_arg0, {
				elementName = "PrimaryAbility",
				sequenceName = "Unavailable",
				elementPath = ""
			} )
			f0_local1( f3_arg0 )
			f3_arg0.Warning:SetAlpha( 0, 0 )
		end
		if f10_local0 >= 0 and f10_local0 < f10_local4 and not f10_local3 and f10_local1 == "drain" then
			f3_arg0.Warning:SetAlpha( 1, 0 )
		end
		if f10_local4 < f10_local0 then
			f3_arg0.Warning:SetAlpha( 0, 0 )
		end
	end )
	f3_arg0:SubscribeToModel( f3_local3:GetModel( f3_arg1 ), function ()
		if f3_local3:GetValue( f3_arg1 ) == "none" then
			f0_local1( f3_arg0 )
			ACTIONS.AnimateSequenceByElement( f3_arg0, {
				elementName = "PrimaryAbility",
				sequenceName = "Unavailable",
				elementPath = "PrimaryAbility"
			} )
		else
			f3_local7()
			ACTIONS.AnimateSequenceByElement( f3_arg0, {
				elementName = "PrimaryAbility",
				sequenceName = "UpdateAbility",
				elementPath = "PrimaryAbility"
			} )
		end
	end )
end

function SPPlayerAbilitiesPrimary( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 70 * _1080p, 0, 115 * _1080p )
	self.id = "SPPlayerAbilitiesPrimary"
	self._animationSets = {}
	self._sequences = {}
	local f12_local1 = controller and controller.controllerIndex
	if not f12_local1 and not Engine.InFrontend() then
		f12_local1 = self:getRootController()
	end
	assert( f12_local1 )
	local f12_local2 = self
	local AccentBottom = nil
	
	AccentBottom = LUI.UIImage.new()
	AccentBottom.id = "AccentBottom"
	AccentBottom:SetRGBFromTable( SWATCHES.HUD.primary, 0 )
	AccentBottom:SetAlpha( 0.25, 0 )
	AccentBottom:setImage( RegisterMaterial( "hud_ability_accent" ), 0 )
	AccentBottom:SetBlendMode( BLEND_MODE.addWithAlpha )
	AccentBottom:SetAnchorsAndPosition( 0.5, 0.5, 1, 0, _1080p * -32, _1080p * 32, _1080p * -8, 0 )
	self:addElement( AccentBottom )
	self.AccentBottom = AccentBottom
	
	local Arrow = nil
	
	Arrow = LUI.UIImage.new()
	Arrow.id = "Arrow"
	Arrow:SetRGBFromTable( SWATCHES.HUD.primary, 0 )
	Arrow:SetZRotation( 90, 0 )
	Arrow:setImage( RegisterMaterial( "hud_arrow" ), 0 )
	Arrow:SetAnchorsAndPosition( 1, 0, 0.5, 0.5, _1080p * 10, _1080p * 30, 0, _1080p * 20 )
	self:addElement( Arrow )
	self.Arrow = Arrow
	
	local GlowBottom = nil
	
	GlowBottom = LUI.UIImage.new()
	GlowBottom.id = "GlowBottom"
	GlowBottom:SetRGBFromTable( SWATCHES.HUD.secondary, 0 )
	GlowBottom:SetAlpha( 0.5, 0 )
	GlowBottom:setImage( RegisterMaterial( "hud_ability_accent_glow" ), 0 )
	GlowBottom:SetUseAA( true )
	GlowBottom:SetAnchorsAndPosition( 0.5, 0.5, 1, 0, _1080p * -35, _1080p * 37, _1080p * -27, _1080p * -7 )
	self:addElement( GlowBottom )
	self.GlowBottom = GlowBottom
	
	local ButtonRB = nil
	
	ButtonRB = LUI.UIImage.new()
	ButtonRB.id = "ButtonRB"
	ButtonRB:SetRGBFromTable( SWATCHES.HUD.primary, 0 )
	ButtonRB:SetScale( -0.2, 0 )
	ButtonRB:setImage( RegisterMaterial( "hud_but_blank_r" ), 0 )
	ButtonRB:SetAnchorsAndPosition( 0.5, 0.5, 1, 0, _1080p * -20, _1080p * 20, _1080p * -30, _1080p * -5 )
	self:addElement( ButtonRB )
	self.ButtonRB = ButtonRB
	
	local KeyLabel = nil
	
	KeyLabel = LUI.UIStyledText.new()
	KeyLabel.id = "KeyLabel"
	KeyLabel:SetRGBFromTable( SWATCHES.HUD.primary, 0 )
	KeyLabel:setText( "", 0 )
	KeyLabel:SetFontSize( 16 * _1080p )
	KeyLabel:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	KeyLabel:SetAlignment( LUI.Alignment.Center )
	KeyLabel:SetShadowMinDistance( -0.01, 0 )
	KeyLabel:SetShadowMaxDistance( 0.01, 0 )
	KeyLabel:SetShadowRGBFromInt( 0, 0 )
	KeyLabel:SetAnchorsAndPosition( 0, 0, 1, 0, 0, 0, _1080p * -25, _1080p * -9 )
	self:addElement( KeyLabel )
	self.KeyLabel = KeyLabel
	
	local Frame = nil
	
	Frame = MenuBuilder.BuildRegisteredType( "SPPlayerAbilityFrame", {
		controllerIndex = f12_local1
	} )
	Frame.id = "Frame"
	Frame:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -32, _1080p * 32, _1080p * 19, _1080p * 83 )
	self:addElement( Frame )
	self.Frame = Frame
	
	local PrimaryAbility = nil
	
	PrimaryAbility = MenuBuilder.BuildRegisteredType( "PlayerAbilityBase", {
		controllerIndex = f12_local1
	} )
	PrimaryAbility.id = "PrimaryAbility"
	PrimaryAbility:SetAlpha( 0.75, 0 )
	PrimaryAbility:SetScale( -0.25, 0 )
	PrimaryAbility:SetDataSource( DataSources.inGame.player.primaryPower, f12_local1 )
	PrimaryAbility:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -40, _1080p * 40, _1080p * 11, _1080p * 91 )
	self:addElement( PrimaryAbility )
	self.PrimaryAbility = PrimaryAbility
	
	local Quantity = nil
	
	Quantity = LUI.UIStyledText.new()
	Quantity.id = "Quantity"
	Quantity:setText( "", 0 )
	Quantity:SetFontSize( 16 * _1080p )
	Quantity:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	Quantity:SetAlignment( LUI.Alignment.Center )
	Quantity:SetShadowMinDistance( -0.01, 0 )
	Quantity:SetShadowMaxDistance( 0.01, 0 )
	Quantity:SetShadowRGBFromInt( 0, 0 )
	Quantity:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, _1080p * 1, _1080p * 17 )
	Quantity:BindColorToModel( DataSources.inGame.player.primaryPower.color:GetModel( f12_local1 ) )
	Quantity:BindAlphaToModel( DataSources.inGame.player.primaryPower.numAlpha:GetModel( f12_local1 ) )
	self:addElement( Quantity )
	self.Quantity = Quantity
	
	local AccentTop = nil
	
	AccentTop = LUI.UIImage.new()
	AccentTop.id = "AccentTop"
	AccentTop:SetRGBFromTable( SWATCHES.HUD.primary, 0 )
	AccentTop:SetAlpha( 0.25, 0 )
	AccentTop:setImage( RegisterMaterial( "hud_ability_accent" ), 0 )
	AccentTop:SetBlendMode( BLEND_MODE.addWithAlpha )
	AccentTop:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -32, _1080p * 32, 0, _1080p * 8 )
	self:addElement( AccentTop )
	self.AccentTop = AccentTop
	
	local Warning = nil
	
	Warning = MenuBuilder.BuildRegisteredType( "PlayerAbilityWarning", {
		controllerIndex = f12_local1
	} )
	Warning.id = "Warning"
	Warning:SetAlpha( 0, 0 )
	Warning:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, _1080p * 41, _1080p * 61 )
	self:addElement( Warning )
	self.Warning = Warning
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		ButtonRB:RegisterAnimationSequence( "PrimaryAbilityAvailable", {
			{
				function ()
					return self.ButtonRB:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.ButtonRB:SetScale( 0.25, 0 )
				end,
				function ()
					return self.ButtonRB:SetScale( -0.2, 100 )
				end
			}
		} )
		self._sequences.PrimaryAbilityAvailable = function ()
			ButtonRB:AnimateSequence( "PrimaryAbilityAvailable" )
		end
		
		ButtonRB:RegisterAnimationSequence( "PrimaryAbilityUnavailable", {
			{
				function ()
					return self.ButtonRB:SetAlpha( 0.2, 0 )
				end
			}
		} )
		self._sequences.PrimaryAbilityUnavailable = function ()
			ButtonRB:AnimateSequence( "PrimaryAbilityUnavailable" )
		end
		
		Quantity:RegisterAnimationSequence( "UpdateCount", {
			{
				function ()
					return self.Quantity:SetScale( 1, 0 )
				end,
				function ()
					return self.Quantity:SetScale( 0, 100 )
				end
			}
		} )
		self._sequences.UpdateCount = function ()
			Quantity:AnimateSequence( "UpdateCount" )
		end
		
		KeyLabel:RegisterAnimationSequence( "PrimaryAbilityAvailablePC", {
			{
				function ()
					return self.KeyLabel:SetScale( 0.25, 0 )
				end,
				function ()
					return self.KeyLabel:SetScale( -0.2, 100 )
				end
			},
			{
				function ()
					return self.KeyLabel:SetAlpha( 1, 0 )
				end
			}
		} )
		self._sequences.PrimaryAbilityAvailablePC = function ()
			KeyLabel:AnimateSequence( "PrimaryAbilityAvailablePC" )
		end
		
		KeyLabel:RegisterAnimationSequence( "PrimaryAbilityUnavailablePC", {
			{
				function ()
					return self.KeyLabel:SetAlpha( 0.2, 0 )
				end
			}
		} )
		self._sequences.PrimaryAbilityUnavailablePC = function ()
			KeyLabel:AnimateSequence( "PrimaryAbilityUnavailablePC" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	PrimaryAbility:SetDataSource( DataSources.inGame.player.primaryPower, f12_local1 )
	PostLoadFunc( self, f12_local1, controller )
	return self
end

MenuBuilder.registerType( "SPPlayerAbilitiesPrimary", SPPlayerAbilitiesPrimary )
LockTable( _M )
