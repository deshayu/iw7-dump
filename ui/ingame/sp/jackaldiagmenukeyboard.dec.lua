local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function JackalDiagMenuKeyboard( menu, controller )
	local self = LUI.UIVerticalNavigator.new()
	self.id = "JackalDiagMenuKeyboard"
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	self.soundSet = "shipLog"
	self:playSound( "menu_open" )
	local f1_local2 = self
	local BGImage = nil
	
	BGImage = LUI.UIImage.new()
	BGImage.id = "BGImage"
	BGImage:SetRGBFromInt( 0, 0 )
	BGImage:SetAlpha( 0.9, 0 )
	BGImage:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 1920, 0, _1080p * 1080 )
	self:addElement( BGImage )
	self.BGImage = BGImage
	
	local ButtonHelperBar = nil
	
	ButtonHelperBar = MenuBuilder.BuildRegisteredType( "ButtonHelperBar", {
		controllerIndex = f1_local1
	} )
	ButtonHelperBar.id = "ButtonHelperBar"
	ButtonHelperBar:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 1920, _1080p * 942, _1080p * 1080 )
	self:addElement( ButtonHelperBar )
	self.ButtonHelperBar = ButtonHelperBar
	
	local Chec2 = nil
	
	Chec2 = LUI.UIImage.new()
	Chec2.id = "Chec2"
	Chec2:setImage( RegisterMaterial( "jackal_hack_render_1" ), 0 )
	Chec2:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1004.34, _1080p * 1824, _1080p * 54, _1080p * 559 )
	self:addElement( Chec2 )
	self.Chec2 = Chec2
	
	local TitleBar = nil
	
	TitleBar = MenuBuilder.BuildRegisteredType( "GenericTitleBar", {
		controllerIndex = f1_local1
	} )
	TitleBar.id = "TitleBar"
	TitleBar.Title:setText( "Engine Diagnostics", 0 )
	TitleBar.Title:SetFont( FONTS.GetFont( FONTS.MainExtended.File ) )
	TitleBar:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 1920, 0, _1080p * 170 )
	self:addElement( TitleBar )
	self.TitleBar = TitleBar
	
	local EngineMeterWidget0 = nil
	
	EngineMeterWidget0 = MenuBuilder.BuildRegisteredType( "EngineMeterWidget", {
		controllerIndex = f1_local1
	} )
	EngineMeterWidget0.id = "EngineMeterWidget0"
	EngineMeterWidget0.Label0:setText( "ENGINE INTEGRITY", 0 )
	EngineMeterWidget0:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 575.5, _1080p * 975.5, _1080p * 755.04, _1080p * 815.04 )
	EngineMeterWidget0:SubscribeToModel( DataSources.inGame.SP.rogueAsteroid.temperature:GetModel( f1_local1 ), function ()
		local f2_local0 = DataSources.inGame.SP.rogueAsteroid.temperature:GetValue( f1_local1 )
		if f2_local0 ~= nil then
			EngineMeterWidget0.Image0:SetRight( _1080p * Multiply( f2_local0, 400 ), 0 )
		end
	end )
	self:addElement( EngineMeterWidget0 )
	self.EngineMeterWidget0 = EngineMeterWidget0
	
	local EngineMeterWidgetCopy0 = nil
	
	EngineMeterWidgetCopy0 = MenuBuilder.BuildRegisteredType( "EngineMeterWidget", {
		controllerIndex = f1_local1
	} )
	EngineMeterWidgetCopy0.id = "EngineMeterWidgetCopy0"
	EngineMeterWidgetCopy0.Label0:setText( "O2 ALIGN", 0 )
	EngineMeterWidgetCopy0:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 575.5, _1080p * 975.5, _1080p * 540, _1080p * 600 )
	EngineMeterWidgetCopy0:SubscribeToModel( DataSources.inGame.jackal.empenergy:GetModel( f1_local1 ), function ()
		local f3_local0 = DataSources.inGame.jackal.empenergy:GetValue( f1_local1 )
		if f3_local0 ~= nil then
			EngineMeterWidgetCopy0.Image0:SetRight( _1080p * Multiply( f3_local0, 400 ), 0 )
		end
	end )
	self:addElement( EngineMeterWidgetCopy0 )
	self.EngineMeterWidgetCopy0 = EngineMeterWidgetCopy0
	
	local EngineMeterWidgetCopy1 = nil
	
	EngineMeterWidgetCopy1 = MenuBuilder.BuildRegisteredType( "EngineMeterWidget", {
		controllerIndex = f1_local1
	} )
	EngineMeterWidgetCopy1.id = "EngineMeterWidgetCopy1"
	EngineMeterWidgetCopy1.Label0:setText( "FUEL ALIGN", 0 )
	EngineMeterWidgetCopy1:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 575.5, _1080p * 975.5, _1080p * 648.04, _1080p * 708.04 )
	EngineMeterWidgetCopy1:SubscribeToModel( DataSources.inGame.jackal.empalpha:GetModel( f1_local1 ), function ()
		local f4_local0 = DataSources.inGame.jackal.empalpha:GetValue( f1_local1 )
		if f4_local0 ~= nil then
			EngineMeterWidgetCopy1.Image0:SetRight( _1080p * Multiply( f4_local0, 400 ), 0 )
		end
	end )
	self:addElement( EngineMeterWidgetCopy1 )
	self.EngineMeterWidgetCopy1 = EngineMeterWidgetCopy1
	
	local KeyInputLabel = nil
	
	KeyInputLabel = LUI.UIText.new()
	KeyInputLabel.id = "KeyInputLabel"
	KeyInputLabel:setText( "Select System For Rebeoot", 0 )
	KeyInputLabel:SetFontSize( 45 * _1080p )
	KeyInputLabel:SetFont( FONTS.GetFont( FONTS.Dev.File ) )
	KeyInputLabel:SetAlignment( LUI.Alignment.Left )
	KeyInputLabel:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 191, _1080p * 1022, _1080p * 450.5, _1080p * 495.5 )
	self:addElement( KeyInputLabel )
	self.KeyInputLabel = KeyInputLabel
	
	local GenericButton0 = nil
	
	GenericButton0 = MenuBuilder.BuildRegisteredType( "GenericButton", {
		controllerIndex = f1_local1
	} )
	GenericButton0.id = "GenericButton0"
	GenericButton0.Text:setText( "Reboot", 0 )
	GenericButton0:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 241.1, _1080p * 541.1, _1080p * 540, _1080p * 601 )
	self:addElement( GenericButton0 )
	self.GenericButton0 = GenericButton0
	
	local GenericButtonCopy0 = nil
	
	GenericButtonCopy0 = MenuBuilder.BuildRegisteredType( "GenericButton", {
		controllerIndex = f1_local1
	} )
	GenericButtonCopy0.id = "GenericButtonCopy0"
	GenericButtonCopy0.Text:setText( "Reboot", 0 )
	GenericButtonCopy0:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 241.1, _1080p * 541.1, _1080p * 648.04, _1080p * 709.04 )
	self:addElement( GenericButtonCopy0 )
	self.GenericButtonCopy0 = GenericButtonCopy0
	
	local GenericButtonCopy1 = nil
	
	GenericButtonCopy1 = MenuBuilder.BuildRegisteredType( "GenericButton", {
		controllerIndex = f1_local1
	} )
	GenericButtonCopy1.id = "GenericButtonCopy1"
	GenericButtonCopy1.Text:setText( "Reboot", 0 )
	GenericButtonCopy1:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 241.1, _1080p * 541.1, _1080p * 755.04, _1080p * 816.04 )
	self:addElement( GenericButtonCopy1 )
	self.GenericButtonCopy1 = GenericButtonCopy1
	
	GenericButton0:addEventHandler( "button_action", function ( f5_arg0, f5_arg1 )
		local f5_local0 = f5_arg1.controller or f1_local1
		ACTIONS.ScriptNotify( "o2_button_down", 1 )
	end )
	GenericButtonCopy0:addEventHandler( "button_action", function ( f6_arg0, f6_arg1 )
		local f6_local0 = f6_arg1.controller or f1_local1
		ACTIONS.ScriptNotify( "fuel_button_down", 1 )
	end )
	GenericButtonCopy1:addEventHandler( "button_action", function ( f7_arg0, f7_arg1 )
		local f7_local0 = f7_arg1.controller or f1_local1
		ACTIONS.ScriptNotify( "engine_button_down", 1 )
	end )
	self:SubscribeToModel( DataSources.inGame.SP.shipCrib.dropshipTargetLock:GetModel( f1_local1 ), function ()
		if DataSources.inGame.SP.shipCrib.dropshipTargetLock:GetValue( f1_local1 ) ~= nil and DataSources.inGame.SP.shipCrib.dropshipTargetLock:GetValue( f1_local1 ) == 1 then
			ACTIONS.LeaveMenuByName( "JackalDiagMenuKeyboard" )
		end
	end )
	return self
end

MenuBuilder.registerType( "JackalDiagMenuKeyboard", JackalDiagMenuKeyboard )
LockTable( _M )
