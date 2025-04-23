local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function tutorialPopup( menu, controller )
	local self = LUI.UIVerticalNavigator.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 901 * _1080p, 0, 933 * _1080p )
	self.id = "tutorialPopup"
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local Box = nil
	
	Box = LUI.UIImage.new()
	Box.id = "Box"
	Box:SetRGBFromInt( 16773734, 0 )
	Box:SetZRotation( -180, 0 )
	Box:SetScale( 0.21, 0 )
	Box:setImage( RegisterMaterial( "explosion_bubble" ), 0 )
	Box:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 72.21, _1080p * 808.21, _1080p * 63.36, _1080p * 850.37 )
	self:addElement( Box )
	self.Box = Box
	
	local Text = nil
	
	Text = LUI.UIText.new()
	Text.id = "Text"
	Text:SetRGBFromInt( 1381653, 0 )
	Text:SetFontSize( 26 * _1080p )
	Text:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	Text:SetAlignment( LUI.Alignment.Left )
	Text:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 262.71, _1080p * 652.16, _1080p * 281.48, _1080p * 307.48 )
	Text:SubscribeToModel( DataSources.inGame.CP.zombies.tutorials.tutorialText:GetModel( f1_local1 ), function ()
		local f2_local0 = DataSources.inGame.CP.zombies.tutorials.tutorialText:GetValue( f1_local1 )
		if f2_local0 ~= nil then
			Text:setText( f2_local0, 0 )
		end
	end )
	self:addElement( Text )
	self.Text = Text
	
	local Title = nil
	
	Title = LUI.UIStyledText.new()
	Title.id = "Title"
	Title:SetRGBFromInt( 430066, 0 )
	Title:SetFontSize( 30 * _1080p )
	Title:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	Title:SetAlignment( LUI.Alignment.Center )
	Title:SetOutlineMinDistance( -0.02, 0 )
	Title:SetOutlineRGBFromInt( 16721664, 0 )
	Title:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 215.26, _1080p * 665.16, _1080p * 236.93, _1080p * 266.93 )
	Title:SubscribeToModel( DataSources.inGame.CP.zombies.tutorials.tutorialTitle:GetModel( f1_local1 ), function ()
		local f3_local0 = DataSources.inGame.CP.zombies.tutorials.tutorialTitle:GetValue( f1_local1 )
		if f3_local0 ~= nil then
			Title:setText( ToUpperCase( f3_local0 ), 0 )
		end
	end )
	self:addElement( Title )
	self.Title = Title
	
	return self
end

MenuBuilder.registerType( "tutorialPopup", tutorialPopup )
LockTable( _M )
