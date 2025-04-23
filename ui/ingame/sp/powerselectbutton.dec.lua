local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ( f1_arg0, f1_arg1, f1_arg2 )
	assert( f1_arg0.SlotText, "WARNING: Power select button specific elements are missing..." )
	local f1_local0 = f1_arg0.SlotText
	f1_local0:SetShadowMinDistance( -0.2, 0 )
	f1_local0:SetShadowMaxDistance( 0.2, 0 )
	f1_local0:SetShadowRGBFromInt( 0, 0 )
	f1_local0:SetShadowUOffset( -0 )
	f1_local0:SetShadowVOffset( -0 )
	f1_local0:addEventHandler( "button_over", function ( f2_arg0, f2_arg1 )
		f1_local0:SetRGBFromTable( SWATCHES.genericButton.textFocus, 100 )
		f1_local0:SetAlpha( 1, 100 )
	end )
	f1_local0:addEventHandler( "button_up", function ( f3_arg0, f3_arg1 )
		f1_local0:SetRGBFromTable( SWATCHES.genericButton.textDefault, 100 )
		f1_local0:SetAlpha( 0.6, 100 )
	end )
	if Engine.IsSingleplayer() then
		f1_arg0:addEventHandler( "lose_focus", function ( f4_arg0, f4_arg1 )
			local f4_local0 = f1_arg0:GetDataSource()
			local f4_local1 = f4_local0.power.ref:GetValue( f1_arg1 )
			if f4_local0.power.isScanned:GetValue( f1_arg1 ) then
				DataSources.alwaysLoaded.playerData.SP.spData.equipmentState[f4_local1]:SetValue( f1_arg1, Cac.SPPowerState.UNLOCKED )
			end
		end )
	end
end

function PowerSelectButton( menu, controller )
	local self = LUI.UIButton.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 250 * _1080p, 0, 140 * _1080p )
	self.id = "PowerSelectButton"
	local f5_local1 = controller and controller.controllerIndex
	if not f5_local1 and not Engine.InFrontend() then
		f5_local1 = self:getRootController()
	end
	assert( f5_local1 )
	local f5_local2 = self
	self:SubscribeToModelThroughElement( self, "power.isDisabled", function ()
		local f6_local0 = self:GetDataSource()
		f6_local0 = f6_local0.power.isDisabled:GetValue( f5_local1 )
		if f6_local0 ~= nil then
			self:SetButtonDisabled( f6_local0 )
		end
	end )
	local ButtonBase = nil
	ButtonBase = MenuBuilder.BuildRegisteredType( "CaCButtonBaseImage", {
		controllerIndex = f5_local1
	} )
	ButtonBase.id = "ButtonBase"
	ButtonBase.Name:SetAlignment( LUI.Alignment.Left )
	ButtonBase.Image:SetLeft( _1080p * -50, 0 )
	ButtonBase.Image:SetRight( _1080p * 50, 0 )
	ButtonBase.Image:SetTop( _1080p * -108.5, 0 )
	ButtonBase.Image:SetBottom( _1080p * -8.5, 0 )
	if Engine.IsMultiplayer() and not Engine.IsAliensMode() then
		ButtonBase.LevelBacker:SetAlpha( 0, 0 )
	end
	if Engine.IsMultiplayer() and not Engine.IsAliensMode() then
		ButtonBase.LevelFrame:SetAlpha( 0, 0 )
	end
	if Engine.IsMultiplayer() and not Engine.IsAliensMode() then
		ButtonBase.Level:SetAlpha( 0, 0 )
	end
	if Engine.IsMultiplayer() and not Engine.IsAliensMode() then
		ButtonBase.Level:setText( "Level: 3", 0 )
	end
	ButtonBase:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, 0, 0 )
	ButtonBase:SubscribeToModelThroughElement( self, "power.name", function ()
		local f7_local0 = self:GetDataSource()
		f7_local0 = f7_local0.power.name:GetValue( f5_local1 )
		if f7_local0 ~= nil then
			ButtonBase.Name:setText( ToUpperCase( LocalizeString( f7_local0 ) ), 0 )
		end
	end )
	ButtonBase:SubscribeToModelThroughElement( self, "power.icon", function ()
		local f8_local0 = self:GetDataSource()
		f8_local0 = f8_local0.power.icon:GetValue( f5_local1 )
		if f8_local0 ~= nil then
			ButtonBase.Image:setImage( RegisterMaterial( f8_local0 ), 0 )
		end
	end )
	self:addElement( ButtonBase )
	self.ButtonBase = ButtonBase
	
	local SlotText = nil
	
	SlotText = LUI.UIStyledText.new()
	SlotText.id = "SlotText"
	SlotText:SetRGBFromTable( SWATCHES.genericButton.textDefault, 0 )
	SlotText:SetFontSize( 14 * _1080p )
	SlotText:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	SlotText:SetAlignment( LUI.Alignment.Left )
	SlotText:SetAnchorsAndPosition( 0, 0, 1, 0, _1080p * 10, _1080p * -10, _1080p * -114, _1080p * -100 )
	SlotText:SubscribeToModelThroughElement( self, "power.selectedAlpha", function ()
		local f9_local0 = self:GetDataSource()
		f9_local0 = f9_local0.power.selectedAlpha:GetValue( f5_local1 )
		if f9_local0 ~= nil then
			SlotText:SetAlpha( f9_local0, 0 )
		end
	end )
	SlotText:SubscribeToModelThroughElement( self, "power.slotText", function ()
		local f10_local0 = self:GetDataSource()
		f10_local0 = f10_local0.power.slotText:GetValue( f5_local1 )
		if f10_local0 ~= nil then
			SlotText:setText( ToUpperCase( f10_local0 ), 0 )
		end
	end )
	self:addElement( SlotText )
	self.SlotText = SlotText
	
	self:addEventHandler( "button_action", function ( f11_arg0, f11_arg1 )
		ACTIONS.EquipSPPower( self, f11_arg1.controller or f5_local1 )
		ACTIONS.LeaveMenu( self )
	end )
	self:SubscribeToModelThroughElement( self, "power.isUnlocked", function ()
		local f12_local0 = self:GetDataSource()
		if f12_local0.power.isUnlocked:GetValue( f5_local1 ) ~= nil then
			f12_local0 = self:GetDataSource()
			if f12_local0.power.isUnlocked:GetValue( f5_local1 ) == true then
				ACTIONS.AnimateSequenceByElement( self, {
					elementName = "ButtonBase",
					sequenceName = "Unlocked",
					elementPath = "ButtonBase"
				} )
			end
		end
		f12_local0 = self:GetDataSource()
		if f12_local0.power.isUnlocked:GetValue( f5_local1 ) ~= nil then
			f12_local0 = self:GetDataSource()
			if f12_local0.power.isUnlocked:GetValue( f5_local1 ) == false then
				f12_local0 = self:GetDataSource()
				if f12_local0.power.isScanned:GetValue( f5_local1 ) ~= nil then
					f12_local0 = self:GetDataSource()
					if f12_local0.power.isScanned:GetValue( f5_local1 ) == false then
						ACTIONS.AnimateSequenceByElement( self, {
							elementName = "ButtonBase",
							sequenceName = "Locked",
							elementPath = "ButtonBase"
						} )
					end
				end
			end
		end
	end )
	self:SubscribeToModelThroughElement( self, "power.isDisabled", function ()
		local f13_local0 = self:GetDataSource()
		if f13_local0.power.isDisabled:GetValue( f5_local1 ) ~= nil then
			f13_local0 = self:GetDataSource()
			if f13_local0.power.isDisabled:GetValue( f5_local1 ) == true then
				ACTIONS.AnimateSequenceByElement( self, {
					elementName = "ButtonBase",
					sequenceName = "Disabled",
					elementPath = "ButtonBase"
				} )
			end
		end
		f13_local0 = self:GetDataSource()
		if f13_local0.power.isDisabled:GetValue( f5_local1 ) ~= nil then
			f13_local0 = self:GetDataSource()
			if f13_local0.power.isDisabled:GetValue( f5_local1 ) == false then
				ACTIONS.AnimateSequenceByElement( self, {
					elementName = "ButtonBase",
					sequenceName = "Enabled",
					elementPath = "ButtonBase"
				} )
			end
		end
	end )
	self:SubscribeToModelThroughElement( self, "power.selected", function ()
		local f14_local0 = self:GetDataSource()
		if f14_local0.power.selected:GetValue( f5_local1 ) ~= nil then
			f14_local0 = self:GetDataSource()
			if f14_local0.power.selected:GetValue( f5_local1 ) == true then
				ACTIONS.AnimateSequenceByElement( self, {
					elementName = "Message",
					sequenceName = "Activate",
					elementPath = "ButtonBase.Message"
				} )
			end
		end
	end )
	self:SubscribeToModelThroughElement( self, "power.isScanned", function ()
		local f15_local0 = self:GetDataSource()
		if f15_local0.power.isScanned:GetValue( f5_local1 ) ~= nil then
			f15_local0 = self:GetDataSource()
			if f15_local0.power.isScanned:GetValue( f5_local1 ) == true then
				ACTIONS.AnimateSequenceByElement( self, {
					elementName = "ButtonBase",
					sequenceName = "IsNew",
					elementPath = "ButtonBase"
				} )
				ACTIONS.AnimateSequenceByElement( self, {
					elementName = "ButtonBase",
					sequenceName = "Unlocked",
					elementPath = "ButtonBase"
				} )
			end
		end
		f15_local0 = self:GetDataSource()
		if f15_local0.power.isScanned:GetValue( f5_local1 ) ~= nil then
			f15_local0 = self:GetDataSource()
			if f15_local0.power.isScanned:GetValue( f5_local1 ) == false then
				ACTIONS.AnimateSequenceByElement( self, {
					elementName = "ButtonBase",
					sequenceName = "IsNotNew",
					elementPath = "ButtonBase"
				} )
			end
		end
	end )
	f0_local0( self, f5_local1, controller )
	return self
end

MenuBuilder.registerType( "PowerSelectButton", PowerSelectButton )
LockTable( _M )
