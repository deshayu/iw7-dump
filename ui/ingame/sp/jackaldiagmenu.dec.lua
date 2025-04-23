local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function JackalDiagMenu( menu, controller )
	local self = LUI.UIVerticalNavigator.new()
	self.id = "JackalDiagMenu"
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
	ButtonHelperBar:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 1920, _1080p * 960, _1080p * 1080 )
	self:addElement( ButtonHelperBar )
	self.ButtonHelperBar = ButtonHelperBar
	
	local Chec2 = nil
	
	Chec2 = LUI.UIImage.new()
	Chec2.id = "Chec2"
	Chec2:setImage( RegisterMaterial( "jackal_hack_render_1" ), 0 )
	Chec2:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 848.34, _1080p * 1824, _1080p * 54, _1080p * 559 )
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
	
	local Label0 = nil
	
	Label0 = LUI.UIText.new()
	Label0.id = "Label0"
	Label0:setText( "When Full Press L2 and R2", 0 )
	Label0:SetFontSize( 45 * _1080p )
	Label0:SetFont( FONTS.GetFont( FONTS.Dev.File ) )
	Label0:SetAlignment( LUI.Alignment.Center )
	Label0:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1073.67, _1080p * 1718.67, _1080p * 626.04, _1080p * 671.04 )
	self:addElement( Label0 )
	self.Label0 = Label0
	
	local Label0Copy0 = nil
	
	Label0Copy0 = LUI.UIText.new()
	Label0Copy0.id = "Label0Copy0"
	Label0Copy0:setText( "Rotate Left Stick and Right Raise Levels", 0 )
	Label0Copy0:SetFontSize( 45 * _1080p )
	Label0Copy0:SetFont( FONTS.GetFont( FONTS.Dev.File ) )
	Label0Copy0:SetAlignment( LUI.Alignment.Center )
	Label0Copy0:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 469.5, _1080p * 1450.5, _1080p * 915, _1080p * 960 )
	self:addElement( Label0Copy0 )
	self.Label0Copy0 = Label0Copy0
	
	local EngineMeterWidget0 = nil
	
	EngineMeterWidget0 = MenuBuilder.BuildRegisteredType( "EngineMeterWidget", {
		controllerIndex = f1_local1
	} )
	EngineMeterWidget0.id = "EngineMeterWidget0"
	EngineMeterWidget0.Label0:setText( "ENGINE INTEGRITY", 0 )
	EngineMeterWidget0:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1196.17, _1080p * 1596.17, _1080p * 671.04, _1080p * 731.04 )
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
	EngineMeterWidgetCopy0:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 736.67, _1080p * 1136.67, _1080p * 749.04, _1080p * 809.04 )
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
	EngineMeterWidgetCopy1:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 736.67, _1080p * 1136.67, _1080p * 845.04, _1080p * 905.04 )
	EngineMeterWidgetCopy1:SubscribeToModel( DataSources.inGame.jackal.empalpha:GetModel( f1_local1 ), function ()
		local f4_local0 = DataSources.inGame.jackal.empalpha:GetValue( f1_local1 )
		if f4_local0 ~= nil then
			EngineMeterWidgetCopy1.Image0:SetRight( _1080p * Multiply( f4_local0, 400 ), 0 )
		end
	end )
	self:addElement( EngineMeterWidgetCopy1 )
	self.EngineMeterWidgetCopy1 = EngineMeterWidgetCopy1
	
	self:SubscribeToModel( DataSources.inGame.SP.shipCrib.dropshipTargetLock:GetModel( f1_local1 ), function ()
		if DataSources.inGame.SP.shipCrib.dropshipTargetLock:GetValue( f1_local1 ) ~= nil and DataSources.inGame.SP.shipCrib.dropshipTargetLock:GetValue( f1_local1 ) == 1 then
			ACTIONS.LeaveMenuByName( "JackalDiagMenu" )
		end
	end )
	return self
end

MenuBuilder.registerType( "JackalDiagMenu", JackalDiagMenu )
LockTable( _M )
