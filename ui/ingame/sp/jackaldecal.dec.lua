local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function PostLoadFunc( f1_arg0, f1_arg1, f1_arg2 )
	f1_arg0:addEventHandler( "lose_focus", function ( f2_arg0, f2_arg1 )
		local f2_local0 = assert
		local f2_local1 = f1_arg0:GetDataSource()
		f2_local0( f2_local1.stateDataSource )
		f2_local0 = f1_arg0:GetDataSource()
		f2_local0 = f2_local0.stateDataSource
		f2_local1 = f1_arg0:GetDataSource()
		if f2_local1.isScanned:GetValue( f1_arg1 ) then
			f2_local0:SetValue( f1_arg1, Cac.scannedSPItemStates.UNLOCKED )
		end
	end )
end

function JackalDecal( menu, controller )
	local self = LUI.UIButton.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 306 * _1080p, 0, 100.5 * _1080p )
	self.id = "JackalDecal"
	local f3_local1 = controller and controller.controllerIndex
	if not f3_local1 and not Engine.InFrontend() then
		f3_local1 = self:getRootController()
	end
	assert( f3_local1 )
	local f3_local2 = self
	self:setUseStencil( true )
	self:SubscribeToModelThroughElement( self, "isUnlocked", function ()
		local f4_local0 = self:GetDataSource()
		f4_local0 = f4_local0.isUnlocked:GetValue( f3_local1 )
		if f4_local0 ~= nil then
			self:SetButtonDisabled( Not( f4_local0 ) )
		end
	end )
	local Base = nil
	Base = MenuBuilder.BuildRegisteredType( "CaCButtonBaseImage", {
		controllerIndex = f3_local1
	} )
	Base.id = "Base"
	Base.Image:SetLeft( _1080p * -153, 0 )
	Base.Image:SetRight( _1080p * 153, 0 )
	Base.Image:SetTop( _1080p * -76.5, 0 )
	Base.Image:SetBottom( _1080p * 0, 0 )
	if Engine.IsMultiplayer() and not Engine.IsAliensMode() then
		Base.LevelBacker:SetAlpha( 0, 0 )
	end
	if Engine.IsMultiplayer() and not Engine.IsAliensMode() then
		Base.LevelFrame:SetAlpha( 0, 0 )
	end
	if Engine.IsMultiplayer() and not Engine.IsAliensMode() then
		Base.Level:SetAlpha( 0, 0 )
	end
	if Engine.IsMultiplayer() and not Engine.IsAliensMode() then
		Base.Level:setText( "", 0 )
	end
	Base.Name:SetAlignment( LUI.Alignment.Center )
	Base:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, 0, 0 )
	Base:SubscribeToModelThroughElement( self, "image", function ()
		local f5_local0 = self:GetDataSource()
		f5_local0 = f5_local0.image:GetValue( f3_local1 )
		if f5_local0 ~= nil then
			Base.Image:setImage( RegisterMaterial( f5_local0 ), 0 )
		end
	end )
	Base:SubscribeToModelThroughElement( self, "name", function ()
		local f6_local0 = self:GetDataSource()
		f6_local0 = f6_local0.name:GetValue( f3_local1 )
		if f6_local0 ~= nil then
			Base.Name:setText( ToUpperCase( LocalizeString( f6_local0 ) ), 0 )
		end
	end )
	self:addElement( Base )
	self.Base = Base
	
	local f3_local4 = function ()
		local f7_local0 = self:GetDataSource()
		if f7_local0.isUnlocked:GetValue( f3_local1 ) ~= nil then
			f7_local0 = self:GetDataSource()
			if f7_local0.isUnlocked:GetValue( f3_local1 ) == true then
				ACTIONS.AnimateSequenceByElement( self, {
					elementName = "Message",
					sequenceName = "Activate",
					elementPath = "Base.Message"
				} )
			end
		end
		f7_local0 = self:GetDataSource()
		if f7_local0.isEquipped:GetValue( f3_local1 ) ~= nil then
			f7_local0 = self:GetDataSource()
			if f7_local0.isEquipped:GetValue( f3_local1 ) == false then
				ACTIONS.AnimateSequenceByElement( self, {
					elementName = "Message",
					sequenceName = "Inactive",
					elementPath = "Base.Message"
				} )
			end
		end
	end
	
	self:SubscribeToModelThroughElement( self, "isUnlocked", f3_local4 )
	self:SubscribeToModelThroughElement( self, "isEquipped", f3_local4 )
	self:SubscribeToModelThroughElement( self, "isUnlocked", function ()
		local f8_local0 = self:GetDataSource()
		if f8_local0.isUnlocked:GetValue( f3_local1 ) ~= nil then
			f8_local0 = self:GetDataSource()
			if f8_local0.isUnlocked:GetValue( f3_local1 ) == false then
				ACTIONS.AnimateSequenceByElement( self, {
					elementName = "Base",
					sequenceName = "Locked",
					elementPath = "Base"
				} )
			end
		end
		f8_local0 = self:GetDataSource()
		if f8_local0.isUnlocked:GetValue( f3_local1 ) ~= nil then
			f8_local0 = self:GetDataSource()
			if f8_local0.isUnlocked:GetValue( f3_local1 ) == true then
				ACTIONS.AnimateSequenceByElement( self, {
					elementName = "Base",
					sequenceName = "Unlocked",
					elementPath = "Base"
				} )
			end
		end
	end )
	self:addEventHandler( "button_action", function ( f9_arg0, f9_arg1 )
		ACTIONS.EquipJackalDecal( self, f9_arg1.controller or f3_local1 )
		ACTIONS.LeaveMenu( self )
	end )
	self:SubscribeToModelThroughElement( self, "isScanned", function ()
		local f10_local0 = self:GetDataSource()
		if f10_local0.isScanned:GetValue( f3_local1 ) ~= nil then
			f10_local0 = self:GetDataSource()
			if f10_local0.isScanned:GetValue( f3_local1 ) == true then
				ACTIONS.AnimateSequenceByElement( self, {
					elementName = "Base",
					sequenceName = "IsNew",
					elementPath = "Base"
				} )
				ACTIONS.AnimateSequenceByElement( self, {
					elementName = "Base",
					sequenceName = "Unlocked",
					elementPath = "Base"
				} )
			end
		end
		f10_local0 = self:GetDataSource()
		if f10_local0.isScanned:GetValue( f3_local1 ) ~= nil then
			f10_local0 = self:GetDataSource()
			if f10_local0.isScanned:GetValue( f3_local1 ) == false then
				ACTIONS.AnimateSequenceByElement( self, {
					elementName = "Base",
					sequenceName = "IsNotNew",
					elementPath = "Base"
				} )
			end
		end
	end )
	PostLoadFunc( self, f3_local1, controller )
	return self
end

MenuBuilder.registerType( "JackalDecal", JackalDecal )
LockTable( _M )
