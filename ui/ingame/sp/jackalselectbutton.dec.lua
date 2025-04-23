local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function PostLoadFunc( f1_arg0, f1_arg1 )
	f1_arg0:addEventHandler( "lose_focus", function ( f2_arg0, f2_arg1 )
		local f2_local0 = f1_arg0:GetDataSource()
		f2_local0 = f2_local0.itemStateDataSource
		if f2_local0 and f2_local0:GetValue( f1_arg1 ) == Cac.spLockStates.SCANNED then
			f2_local0:SetValue( f1_arg1, Cac.spLockStates.UNLOCKED )
		end
	end )
end

function JackalSelectButton( menu, controller )
	local self = LUI.UIButton.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 250 * _1080p, 0, 140 * _1080p )
	self.id = "JackalSelectButton"
	local f3_local1 = controller and controller.controllerIndex
	if not f3_local1 and not Engine.InFrontend() then
		f3_local1 = self:getRootController()
	end
	assert( f3_local1 )
	local f3_local2 = self
	self:SubscribeToModelThroughElement( self, "isDisabled", function ()
		local f4_local0 = self:GetDataSource()
		f4_local0 = f4_local0.isDisabled:GetValue( f3_local1 )
		if f4_local0 ~= nil then
			self:SetButtonDisabled( f4_local0 )
		end
	end )
	local ButtonBase = nil
	ButtonBase = MenuBuilder.BuildRegisteredType( "CaCButtonBaseImage", {
		controllerIndex = f3_local1
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
	ButtonBase:SubscribeToModelThroughElement( self, "name", function ()
		local f5_local0 = self:GetDataSource()
		f5_local0 = f5_local0.name:GetValue( f3_local1 )
		if f5_local0 ~= nil then
			ButtonBase.Name:setText( ToUpperCase( LocalizeString( f5_local0 ) ), 0 )
		end
	end )
	ButtonBase:SubscribeToModelThroughElement( self, "image", function ()
		local f6_local0 = self:GetDataSource()
		f6_local0 = f6_local0.image:GetValue( f3_local1 )
		if f6_local0 ~= nil then
			ButtonBase.Image:setImage( RegisterMaterial( f6_local0 ), 0 )
		end
	end )
	self:addElement( ButtonBase )
	self.ButtonBase = ButtonBase
	
	self:addEventHandler( "button_action", function ( f7_arg0, f7_arg1 )
		ACTIONS.EquipJackalItem( self, f7_arg1.controller or f3_local1 )
		ACTIONS.LeaveMenu( self )
	end )
	self:SubscribeToModelThroughElement( self, "isDisabled", function ()
		local f8_local0 = self:GetDataSource()
		if f8_local0.isDisabled:GetValue( f3_local1 ) ~= nil then
			f8_local0 = self:GetDataSource()
			if f8_local0.isDisabled:GetValue( f3_local1 ) == true then
				ACTIONS.AnimateSequenceByElement( self, {
					elementName = "ButtonBase",
					sequenceName = "Disabled",
					elementPath = "ButtonBase"
				} )
			end
		end
		f8_local0 = self:GetDataSource()
		if f8_local0.isDisabled:GetValue( f3_local1 ) ~= nil then
			f8_local0 = self:GetDataSource()
			if f8_local0.isDisabled:GetValue( f3_local1 ) == false then
				ACTIONS.AnimateSequenceByElement( self, {
					elementName = "ButtonBase",
					sequenceName = "Enabled",
					elementPath = "ButtonBase"
				} )
			end
		end
	end )
	self:SubscribeToModelThroughElement( self, "selected", function ()
		local f9_local0 = self:GetDataSource()
		if f9_local0.selected:GetValue( f3_local1 ) ~= nil then
			f9_local0 = self:GetDataSource()
			if f9_local0.selected:GetValue( f3_local1 ) == true then
				ACTIONS.AnimateSequenceByElement( self, {
					elementName = "Message",
					sequenceName = "Activate",
					elementPath = "ButtonBase.Message"
				} )
			end
		end
	end )
	self:SubscribeToModelThroughElement( self, "isUnlocked", function ()
		local f10_local0 = self:GetDataSource()
		if f10_local0.isUnlocked:GetValue( f3_local1 ) ~= nil then
			f10_local0 = self:GetDataSource()
			if f10_local0.isUnlocked:GetValue( f3_local1 ) == true then
				ACTIONS.AnimateSequenceByElement( self, {
					elementName = "ButtonBase",
					sequenceName = "Unlocked",
					elementPath = "ButtonBase"
				} )
			end
		end
		f10_local0 = self:GetDataSource()
		if f10_local0.isUnlocked:GetValue( f3_local1 ) ~= nil then
			f10_local0 = self:GetDataSource()
			if f10_local0.isUnlocked:GetValue( f3_local1 ) == false then
				f10_local0 = self:GetDataSource()
				if f10_local0.isScanned:GetValue( f3_local1 ) ~= nil then
					f10_local0 = self:GetDataSource()
					if f10_local0.isScanned:GetValue( f3_local1 ) == false then
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
	self:SubscribeToModelThroughElement( self, "isScanned", function ()
		local f11_local0 = self:GetDataSource()
		if f11_local0.isScanned:GetValue( f3_local1 ) ~= nil then
			f11_local0 = self:GetDataSource()
			if f11_local0.isScanned:GetValue( f3_local1 ) == true then
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
		f11_local0 = self:GetDataSource()
		if f11_local0.isScanned:GetValue( f3_local1 ) ~= nil then
			f11_local0 = self:GetDataSource()
			if f11_local0.isScanned:GetValue( f3_local1 ) == false then
				ACTIONS.AnimateSequenceByElement( self, {
					elementName = "ButtonBase",
					sequenceName = "IsNotNew",
					elementPath = "ButtonBase"
				} )
			end
		end
	end )
	PostLoadFunc( self, f3_local1, controller )
	return self
end

MenuBuilder.registerType( "JackalSelectButton", JackalSelectButton )
LockTable( _M )
