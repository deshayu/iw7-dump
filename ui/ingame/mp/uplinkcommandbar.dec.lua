local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function UpdateHintTexts( f1_arg0 )
	f1_arg0.ThrowHint:setText( Engine.Localize( "^3[{+attack}]^7" ), 0 )
	f1_arg0.PassHint:setText( Engine.Localize( "^3[{+speed_throw,+toggleads_throw}]^7" ), 0 )
end

function PostLoadFunc( f2_arg0, f2_arg1, f2_arg2 )
	f2_arg0:SetXRotation( -25 * MP.SplitScreenRotModifier )
	if Engine.IsPC() then
		f2_arg0:registerEventHandler( "empty_menu_stack", function ( element, event )
			UpdateHintTexts( element )
			local f3_local0
			if DataSources.inGame.HUD.uplinkHUDEnabled:GetValue( f2_arg1 ) == nil or DataSources.inGame.HUD.uplinkHUDEnabled:GetValue( f2_arg1 ) ~= true then
				f3_local0 = false
			else
				f3_local0 = true
			end
			local f3_local1 = nil
			if DataSources.inGame.MP.match.gameType:GetValue( f2_arg1 ) ~= nil then
				f3_local1 = DataSources.inGame.MP.match.gameType:GetValue( f2_arg1 )
			end
			if f3_local0 and f3_local1 ~= nil and (f3_local1 == "tdef" or f3_local1 == "ball") then
				if Engine.IsGamepadEnabled() == 1 then
					ACTIONS.AnimateSequence( element, "ShowBar" )
				else
					ACTIONS.AnimateSequence( element, "ShowKBControls" )
				end
			end
		end )
		UpdateHintTexts( f2_arg0 )
	end
end

function UplinkCommandBar( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 380 * _1080p, 0, 54 * _1080p )
	self.id = "UplinkCommandBar"
	self._animationSets = {}
	self._sequences = {}
	local f4_local1 = controller and controller.controllerIndex
	if not f4_local1 and not Engine.InFrontend() then
		f4_local1 = self:getRootController()
	end
	assert( f4_local1 )
	local f4_local2 = self
	local ArmorIcon = nil
	
	ArmorIcon = LUI.UIImage.new()
	ArmorIcon.id = "ArmorIcon"
	ArmorIcon:setImage( RegisterMaterial( "hud_icon_uplink_armor" ), 0 )
	ArmorIcon:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 145, _1080p * 163, _1080p * 16, _1080p * 34 )
	self:addElement( ArmorIcon )
	self.ArmorIcon = ArmorIcon
	
	local ArmorText = nil
	
	ArmorText = LUI.UIText.new()
	ArmorText.id = "ArmorText"
	ArmorText:setText( ToUpperCase( Engine.Localize( "MPUI_UPLINK_ARMOR" ) ), 0 )
	ArmorText:SetFontSize( 22 * _1080p )
	ArmorText:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	ArmorText:setTextStyle( CoD.TextStyle.Shadowed )
	ArmorText:SetAlignment( LUI.Alignment.Left )
	ArmorText:SetOptOutRightToLeftAlignmentFlip( true )
	ArmorText:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 167, _1080p * 273, _1080p * 14.69, _1080p * 36.69 )
	self:addElement( ArmorText )
	self.ArmorText = ArmorText
	
	local ThrowButton = nil
	
	ThrowButton = LUI.UIImage.new()
	ThrowButton.id = "ThrowButton"
	ThrowButton:SetRGBFromTable( SWATCHES.HUD.normal, 0 )
	ThrowButton:SetAnchorsAndPosition( 1, 0, 1, 0, _1080p * -40, 0, _1080p * -25.62, _1080p * -1 )
	ThrowButton:SubscribeToModel( DataSources.alwaysLoaded.input.commands.attackIcon:GetModel( f4_local1 ), function ()
		local f5_local0 = DataSources.alwaysLoaded.input.commands.attackIcon:GetValue( f4_local1 )
		if f5_local0 ~= nil then
			ThrowButton:setImage( RegisterMaterial( f5_local0 ), 0 )
		end
	end )
	self:addElement( ThrowButton )
	self.ThrowButton = ThrowButton
	
	local ThrowText = nil
	
	ThrowText = LUI.UIText.new()
	ThrowText.id = "ThrowText"
	ThrowText:SetRGBFromTable( SWATCHES.HUD.normal, 0 )
	ThrowText:setText( ToUpperCase( Engine.Localize( "MPUI_UPLINK_THROW" ) ), 0 )
	ThrowText:SetFontSize( 22 * _1080p )
	ThrowText:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	ThrowText:setTextStyle( CoD.TextStyle.Shadowed )
	ThrowText:SetAlignment( LUI.Alignment.Right )
	ThrowText:SetAnchorsAndPosition( 1, 0, 1, 0, _1080p * -150, _1080p * -44, _1080p * -23, _1080p * -1 )
	self:addElement( ThrowText )
	self.ThrowText = ThrowText
	
	local PassButton = nil
	
	PassButton = LUI.UIImage.new()
	PassButton.id = "PassButton"
	PassButton:SetRGBFromTable( SWATCHES.HUD.normal, 0 )
	PassButton:SetAnchorsAndPosition( 0, 1, 1, 0, 0, _1080p * 40, _1080p * -25.62, _1080p * -1 )
	PassButton:SubscribeToModel( DataSources.alwaysLoaded.input.commands.speedThrowIcon:GetModel( f4_local1 ), function ()
		local f6_local0 = DataSources.alwaysLoaded.input.commands.speedThrowIcon:GetValue( f4_local1 )
		if f6_local0 ~= nil then
			PassButton:setImage( RegisterMaterial( f6_local0 ), 0 )
		end
	end )
	self:addElement( PassButton )
	self.PassButton = PassButton
	
	local PassLabel = nil
	
	PassLabel = LUI.UIText.new()
	PassLabel.id = "PassLabel"
	PassLabel:SetRGBFromTable( SWATCHES.HUD.normal, 0 )
	PassLabel:setText( ToUpperCase( Engine.Localize( "MPUI_UPLINK_PASS" ) ), 0 )
	PassLabel:SetFontSize( 22 * _1080p )
	PassLabel:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	PassLabel:setTextStyle( CoD.TextStyle.Shadowed )
	PassLabel:SetAlignment( LUI.Alignment.Left )
	PassLabel:SetOptOutRightToLeftAlignmentFlip( true )
	PassLabel:SetAnchorsAndPosition( 0, 1, 1, 0, _1080p * 46, _1080p * 148, _1080p * -23, _1080p * -1 )
	self:addElement( PassLabel )
	self.PassLabel = PassLabel
	
	local UplinkArmorMeter = nil
	
	UplinkArmorMeter = MenuBuilder.BuildRegisteredType( "UplinkArmorMeter", {
		controllerIndex = f4_local1
	} )
	UplinkArmorMeter.id = "UplinkArmorMeter"
	UplinkArmorMeter:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 40, _1080p * -40, 0, _1080p * 5 )
	self:addElement( UplinkArmorMeter )
	self.UplinkArmorMeter = UplinkArmorMeter
	
	local PassHint = nil
	
	PassHint = LUI.UIText.new()
	PassHint.id = "PassHint"
	PassHint:SetRGBFromTable( SWATCHES.HUD.normal, 0 )
	PassHint:setText( "", 0 )
	PassHint:SetFontSize( 22 * _1080p )
	PassHint:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	PassHint:setTextStyle( CoD.TextStyle.Shadowed )
	PassHint:SetAlignment( LUI.Alignment.Left )
	PassHint:SetAnchorsAndPosition( 0, 1, 1, 0, _1080p * -100, _1080p * 100, _1080p * -23, _1080p * -1 )
	self:addElement( PassHint )
	self.PassHint = PassHint
	
	local ThrowHint = nil
	
	ThrowHint = LUI.UIText.new()
	ThrowHint.id = "ThrowHint"
	ThrowHint:SetRGBFromTable( SWATCHES.HUD.normal, 0 )
	ThrowHint:setText( "", 0 )
	ThrowHint:SetFontSize( 22 * _1080p )
	ThrowHint:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	ThrowHint:setTextStyle( CoD.TextStyle.Shadowed )
	ThrowHint:SetAlignment( LUI.Alignment.Right )
	ThrowHint:SetAnchorsAndPosition( 1, 0, 1, 0, _1080p * -100, _1080p * 100, _1080p * -23, _1080p * -1 )
	self:addElement( ThrowHint )
	self.ThrowHint = ThrowHint
	
	local PassLabelPC = nil
	
	PassLabelPC = LUI.UIText.new()
	PassLabelPC.id = "PassLabelPC"
	PassLabelPC:SetRGBFromTable( SWATCHES.HUD.normal, 0 )
	PassLabelPC:setText( Engine.Localize( "MPUI_UPLINK_PASS" ), 0 )
	PassLabelPC:SetFontSize( 22 * _1080p )
	PassLabelPC:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	PassLabelPC:setTextStyle( CoD.TextStyle.Shadowed )
	PassLabelPC:SetAlignment( LUI.Alignment.Left )
	PassLabelPC:SetAnchorsAndPosition( 0, 1, 1, 0, 0, _1080p * 100, _1080p * 5, _1080p * 27 )
	self:addElement( PassLabelPC )
	self.PassLabelPC = PassLabelPC
	
	local ThrowTextPC = nil
	
	ThrowTextPC = LUI.UIText.new()
	ThrowTextPC.id = "ThrowTextPC"
	ThrowTextPC:SetRGBFromTable( SWATCHES.HUD.normal, 0 )
	ThrowTextPC:setText( Engine.Localize( "MPUI_UPLINK_THROW" ), 0 )
	ThrowTextPC:SetFontSize( 22 * _1080p )
	ThrowTextPC:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	ThrowTextPC:setTextStyle( CoD.TextStyle.Shadowed )
	ThrowTextPC:SetAlignment( LUI.Alignment.Right )
	ThrowTextPC:SetAnchorsAndPosition( 1, 0, 1, 0, _1080p * -100, _1080p * 6, _1080p * 5, _1080p * 27 )
	self:addElement( ThrowTextPC )
	self.ThrowTextPC = ThrowTextPC
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		ArmorIcon:RegisterAnimationSequence( "ShowBar", {
			{
				function ()
					return self.ArmorIcon:SetAlpha( 1, 300 )
				end
			}
		} )
		ArmorText:RegisterAnimationSequence( "ShowBar", {
			{
				function ()
					return self.ArmorText:SetAlpha( 1, 300 )
				end
			}
		} )
		ThrowButton:RegisterAnimationSequence( "ShowBar", {
			{
				function ()
					return self.ThrowButton:SetAlpha( 1, 300 )
				end
			}
		} )
		ThrowText:RegisterAnimationSequence( "ShowBar", {
			{
				function ()
					return self.ThrowText:SetAlpha( 1, 300 )
				end
			}
		} )
		PassButton:RegisterAnimationSequence( "ShowBar", {
			{
				function ()
					return self.PassButton:SetAlpha( 1, 300 )
				end
			}
		} )
		PassLabel:RegisterAnimationSequence( "ShowBar", {
			{
				function ()
					return self.PassLabel:SetAlpha( 1, 300 )
				end
			}
		} )
		UplinkArmorMeter:RegisterAnimationSequence( "ShowBar", {
			{
				function ()
					return self.UplinkArmorMeter:SetAlpha( 1, 300 )
				end
			}
		} )
		PassHint:RegisterAnimationSequence( "ShowBar", {
			{
				function ()
					return self.PassHint:SetAlpha( 0, 300 )
				end
			}
		} )
		ThrowHint:RegisterAnimationSequence( "ShowBar", {
			{
				function ()
					return self.ThrowHint:SetAlpha( 0, 300 )
				end
			}
		} )
		PassLabelPC:RegisterAnimationSequence( "ShowBar", {
			{
				function ()
					return self.PassLabelPC:SetAlpha( 0, 300 )
				end
			}
		} )
		ThrowTextPC:RegisterAnimationSequence( "ShowBar", {
			{
				function ()
					return self.ThrowTextPC:SetAlpha( 0, 300 )
				end
			}
		} )
		self._sequences.ShowBar = function ()
			ArmorIcon:AnimateSequence( "ShowBar" )
			ArmorText:AnimateSequence( "ShowBar" )
			ThrowButton:AnimateSequence( "ShowBar" )
			ThrowText:AnimateSequence( "ShowBar" )
			PassButton:AnimateSequence( "ShowBar" )
			PassLabel:AnimateSequence( "ShowBar" )
			UplinkArmorMeter:AnimateSequence( "ShowBar" )
			PassHint:AnimateSequence( "ShowBar" )
			ThrowHint:AnimateSequence( "ShowBar" )
			PassLabelPC:AnimateSequence( "ShowBar" )
			ThrowTextPC:AnimateSequence( "ShowBar" )
		end
		
		ArmorIcon:RegisterAnimationSequence( "HideBar", {
			{
				function ()
					return self.ArmorIcon:SetAlpha( 0, 300 )
				end
			}
		} )
		ArmorText:RegisterAnimationSequence( "HideBar", {
			{
				function ()
					return self.ArmorText:SetAlpha( 0, 300 )
				end
			}
		} )
		ThrowButton:RegisterAnimationSequence( "HideBar", {
			{
				function ()
					return self.ThrowButton:SetAlpha( 0, 300 )
				end
			}
		} )
		ThrowText:RegisterAnimationSequence( "HideBar", {
			{
				function ()
					return self.ThrowText:SetAlpha( 0, 300 )
				end
			}
		} )
		PassButton:RegisterAnimationSequence( "HideBar", {
			{
				function ()
					return self.PassButton:SetAlpha( 0, 300 )
				end
			}
		} )
		PassLabel:RegisterAnimationSequence( "HideBar", {
			{
				function ()
					return self.PassLabel:SetAlpha( 0, 300 )
				end
			}
		} )
		UplinkArmorMeter:RegisterAnimationSequence( "HideBar", {
			{
				function ()
					return self.UplinkArmorMeter:SetAlpha( 0, 300 )
				end
			}
		} )
		PassHint:RegisterAnimationSequence( "HideBar", {
			{
				function ()
					return self.PassHint:SetAlpha( 0, 300 )
				end
			}
		} )
		ThrowHint:RegisterAnimationSequence( "HideBar", {
			{
				function ()
					return self.ThrowHint:SetAlpha( 0, 300 )
				end
			}
		} )
		PassLabelPC:RegisterAnimationSequence( "HideBar", {
			{
				function ()
					return self.PassLabelPC:SetAlpha( 0, 300 )
				end
			}
		} )
		ThrowTextPC:RegisterAnimationSequence( "HideBar", {
			{
				function ()
					return self.ThrowTextPC:SetAlpha( 0, 300 )
				end
			}
		} )
		self._sequences.HideBar = function ()
			ArmorIcon:AnimateSequence( "HideBar" )
			ArmorText:AnimateSequence( "HideBar" )
			ThrowButton:AnimateSequence( "HideBar" )
			ThrowText:AnimateSequence( "HideBar" )
			PassButton:AnimateSequence( "HideBar" )
			PassLabel:AnimateSequence( "HideBar" )
			UplinkArmorMeter:AnimateSequence( "HideBar" )
			PassHint:AnimateSequence( "HideBar" )
			ThrowHint:AnimateSequence( "HideBar" )
			PassLabelPC:AnimateSequence( "HideBar" )
			ThrowTextPC:AnimateSequence( "HideBar" )
		end
		
		ArmorIcon:RegisterAnimationSequence( "FrontlineShowBar", {
			{
				function ()
					return self.ArmorIcon:SetAlpha( 1, 300 )
				end
			}
		} )
		ArmorText:RegisterAnimationSequence( "FrontlineShowBar", {
			{
				function ()
					return self.ArmorText:SetAlpha( 1, 300 )
				end
			}
		} )
		ThrowButton:RegisterAnimationSequence( "FrontlineShowBar", {
			{
				function ()
					return self.ThrowButton:SetAlpha( 0, 300 )
				end
			}
		} )
		ThrowText:RegisterAnimationSequence( "FrontlineShowBar", {
			{
				function ()
					return self.ThrowText:SetAlpha( 0, 300 )
				end
			}
		} )
		PassButton:RegisterAnimationSequence( "FrontlineShowBar", {
			{
				function ()
					return self.PassButton:SetAlpha( 0, 300 )
				end
			}
		} )
		PassLabel:RegisterAnimationSequence( "FrontlineShowBar", {
			{
				function ()
					return self.PassLabel:SetAlpha( 0, 300 )
				end
			}
		} )
		UplinkArmorMeter:RegisterAnimationSequence( "FrontlineShowBar", {
			{
				function ()
					return self.UplinkArmorMeter:SetAlpha( 1, 300 )
				end
			}
		} )
		PassHint:RegisterAnimationSequence( "FrontlineShowBar", {
			{
				function ()
					return self.PassHint:SetAlpha( 0, 300 )
				end
			}
		} )
		ThrowHint:RegisterAnimationSequence( "FrontlineShowBar", {
			{
				function ()
					return self.ThrowHint:SetAlpha( 0, 300 )
				end
			}
		} )
		PassLabelPC:RegisterAnimationSequence( "FrontlineShowBar", {
			{
				function ()
					return self.PassLabelPC:SetAlpha( 0, 300 )
				end
			}
		} )
		ThrowTextPC:RegisterAnimationSequence( "FrontlineShowBar", {
			{
				function ()
					return self.ThrowTextPC:SetAlpha( 0, 300 )
				end
			}
		} )
		self._sequences.FrontlineShowBar = function ()
			ArmorIcon:AnimateSequence( "FrontlineShowBar" )
			ArmorText:AnimateSequence( "FrontlineShowBar" )
			ThrowButton:AnimateSequence( "FrontlineShowBar" )
			ThrowText:AnimateSequence( "FrontlineShowBar" )
			PassButton:AnimateSequence( "FrontlineShowBar" )
			PassLabel:AnimateSequence( "FrontlineShowBar" )
			UplinkArmorMeter:AnimateSequence( "FrontlineShowBar" )
			PassHint:AnimateSequence( "FrontlineShowBar" )
			ThrowHint:AnimateSequence( "FrontlineShowBar" )
			PassLabelPC:AnimateSequence( "FrontlineShowBar" )
			ThrowTextPC:AnimateSequence( "FrontlineShowBar" )
		end
		
		ArmorIcon:RegisterAnimationSequence( "ShowKBControls", {
			{
				function ()
					return self.ArmorIcon:SetAlpha( 1, 300 )
				end
			}
		} )
		ArmorText:RegisterAnimationSequence( "ShowKBControls", {
			{
				function ()
					return self.ArmorText:SetAlpha( 1, 300 )
				end
			}
		} )
		ThrowButton:RegisterAnimationSequence( "ShowKBControls", {
			{
				function ()
					return self.ThrowButton:SetAlpha( 0, 300 )
				end
			}
		} )
		ThrowText:RegisterAnimationSequence( "ShowKBControls", {
			{
				function ()
					return self.ThrowText:SetAlpha( 0, 300 )
				end
			}
		} )
		PassButton:RegisterAnimationSequence( "ShowKBControls", {
			{
				function ()
					return self.PassButton:SetAlpha( 0, 300 )
				end
			}
		} )
		PassLabel:RegisterAnimationSequence( "ShowKBControls", {
			{
				function ()
					return self.PassLabel:SetAlpha( 0, 300 )
				end
			}
		} )
		UplinkArmorMeter:RegisterAnimationSequence( "ShowKBControls", {
			{
				function ()
					return self.UplinkArmorMeter:SetAlpha( 1, 300 )
				end
			}
		} )
		PassHint:RegisterAnimationSequence( "ShowKBControls", {
			{
				function ()
					return self.PassHint:SetAlpha( 1, 300 )
				end
			},
			{
				function ()
					return self.PassHint:SetAnchorsAndPosition( 0, 1, 1, 0, _1080p * 280, _1080p * 480, _1080p * -23, _1080p * -1, 300 )
				end
			}
		} )
		ThrowHint:RegisterAnimationSequence( "ShowKBControls", {
			{
				function ()
					return self.ThrowHint:SetAlpha( 1, 300 )
				end
			},
			{
				function ()
					return self.ThrowHint:SetAnchorsAndPosition( 1, 0, 1, 0, _1080p * -480, _1080p * -280, _1080p * -23, _1080p * -1, 300 )
				end
			}
		} )
		PassLabelPC:RegisterAnimationSequence( "ShowKBControls", {
			{
				function ()
					return self.PassLabelPC:SetAlpha( 1, 300 )
				end
			},
			{
				function ()
					return self.PassLabelPC:SetAnchorsAndPosition( 0, 1, 1, 0, _1080p * 280, _1080p * 386, _1080p * 5, _1080p * 27, 300 )
				end
			}
		} )
		ThrowTextPC:RegisterAnimationSequence( "ShowKBControls", {
			{
				function ()
					return self.ThrowTextPC:SetAlpha( 1, 300 )
				end
			},
			{
				function ()
					return self.ThrowTextPC:SetAnchorsAndPosition( 1, 0, 1, 0, _1080p * -386, _1080p * -280, _1080p * 5, _1080p * 27, 300 )
				end
			}
		} )
		self._sequences.ShowKBControls = function ()
			ArmorIcon:AnimateSequence( "ShowKBControls" )
			ArmorText:AnimateSequence( "ShowKBControls" )
			ThrowButton:AnimateSequence( "ShowKBControls" )
			ThrowText:AnimateSequence( "ShowKBControls" )
			PassButton:AnimateSequence( "ShowKBControls" )
			PassLabel:AnimateSequence( "ShowKBControls" )
			UplinkArmorMeter:AnimateSequence( "ShowKBControls" )
			PassHint:AnimateSequence( "ShowKBControls" )
			ThrowHint:AnimateSequence( "ShowKBControls" )
			PassLabelPC:AnimateSequence( "ShowKBControls" )
			ThrowTextPC:AnimateSequence( "ShowKBControls" )
		end
		
		ArmorIcon:RegisterAnimationSequence( "RightToLeft", {
			{
				function ()
					return self.ArmorIcon:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 170, _1080p * 188, _1080p * 16, _1080p * 34, 300 )
				end
			}
		} )
		ArmorText:RegisterAnimationSequence( "RightToLeft", {
			{
				function ()
					return self.ArmorText:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 192, _1080p * 298, _1080p * 14.69, _1080p * 36.69, 300 )
				end
			}
		} )
		self._sequences.RightToLeft = function ()
			ArmorIcon:AnimateSequence( "RightToLeft" )
			ArmorText:AnimateSequence( "RightToLeft" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	local f4_local14 = function ()
		if DataSources.inGame.HUD.uplinkHUDEnabled:GetValue( f4_local1 ) ~= nil and DataSources.inGame.HUD.uplinkHUDEnabled:GetValue( f4_local1 ) == true and DataSources.inGame.MP.match.gameType:GetValue( f4_local1 ) ~= nil and DataSources.inGame.MP.match.gameType:GetValue( f4_local1 ) == "ball" and CONDITIONS.IsGamepadEnabled( self ) then
			ACTIONS.AnimateSequence( self, "ShowBar" )
		end
		if DataSources.inGame.HUD.uplinkHUDEnabled:GetValue( f4_local1 ) ~= nil and DataSources.inGame.HUD.uplinkHUDEnabled:GetValue( f4_local1 ) == false then
			ACTIONS.AnimateSequence( self, "HideBar" )
		end
		if DataSources.inGame.MP.match.gameType:GetValue( f4_local1 ) ~= nil and DataSources.inGame.MP.match.gameType:GetValue( f4_local1 ) == "front" and DataSources.inGame.HUD.uplinkHUDEnabled:GetValue( f4_local1 ) ~= nil and DataSources.inGame.HUD.uplinkHUDEnabled:GetValue( f4_local1 ) == true then
			ACTIONS.AnimateSequence( self, "FrontlineShowBar" )
		end
		if DataSources.inGame.MP.match.gameType:GetValue( f4_local1 ) ~= nil and DataSources.inGame.MP.match.gameType:GetValue( f4_local1 ) == "tdef" and DataSources.inGame.HUD.uplinkHUDEnabled:GetValue( f4_local1 ) ~= nil and DataSources.inGame.HUD.uplinkHUDEnabled:GetValue( f4_local1 ) == true and CONDITIONS.IsGamepadEnabled( self ) then
			ACTIONS.AnimateSequence( self, "ShowBar" )
		end
		if DataSources.inGame.HUD.uplinkHUDEnabled:GetValue( f4_local1 ) ~= nil and DataSources.inGame.HUD.uplinkHUDEnabled:GetValue( f4_local1 ) == true and DataSources.inGame.MP.match.gameType:GetValue( f4_local1 ) ~= nil and DataSources.inGame.MP.match.gameType:GetValue( f4_local1 ) == "ball" and not CONDITIONS.IsGamepadEnabled( self ) then
			ACTIONS.AnimateSequence( self, "ShowKBControls" )
		end
		if DataSources.inGame.HUD.uplinkHUDEnabled:GetValue( f4_local1 ) ~= nil and DataSources.inGame.HUD.uplinkHUDEnabled:GetValue( f4_local1 ) == true and DataSources.inGame.MP.match.gameType:GetValue( f4_local1 ) ~= nil and DataSources.inGame.MP.match.gameType:GetValue( f4_local1 ) == "tdef" and not CONDITIONS.IsGamepadEnabled( self ) then
			ACTIONS.AnimateSequence( self, "ShowKBControls" )
		end
	end
	
	self:SubscribeToModel( DataSources.inGame.HUD.uplinkHUDEnabled:GetModel( f4_local1 ), f4_local14 )
	self:SubscribeToModel( DataSources.inGame.MP.match.gameType:GetModel( f4_local1 ), f4_local14 )
	PostLoadFunc( self, f4_local1, controller )
	if CONDITIONS.IsArabic( self ) then
		ACTIONS.AnimateSequence( self, "RightToLeft" )
	end
	return self
end

MenuBuilder.registerType( "UplinkCommandBar", UplinkCommandBar )
LockTable( _M )
