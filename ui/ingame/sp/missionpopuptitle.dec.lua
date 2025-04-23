local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function PostLoadFunc( f1_arg0, f1_arg1, f1_arg2 )
	if IsLanguageEnglish() then
		f1_arg0.MissionName:SetAnchorsAndPosition( 0, 0, 0.5, 0.5, _1080p * 53, _1080p * -5, _1080p * -27, _1080p * 3 )
	else
		f1_arg0.MissionName:SetAnchorsAndPosition( 0, 0, 0.5, 0.5, _1080p * 53, _1080p * -5, _1080p * -24, 0 )
	end
end

function MissionPopupTitle( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 450 * _1080p, 0, 54 * _1080p )
	self.id = "MissionPopupTitle"
	local f2_local1 = controller and controller.controllerIndex
	if not f2_local1 and not Engine.InFrontend() then
		f2_local1 = self:getRootController()
	end
	assert( f2_local1 )
	local f2_local2 = self
	local Background = nil
	
	Background = LUI.UIImage.new()
	Background.id = "Background"
	Background:SetRGBFromTable( SWATCHES.OpsMap.SideMission, 0 )
	self:addElement( Background )
	self.Background = Background
	
	local Text = nil
	
	Text = LUI.UIText.new()
	Text.id = "Text"
	Text:SetRGBFromInt( 0, 0 )
	Text:setText( "", 0 )
	Text:SetFontSize( 22 * _1080p )
	Text:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	Text:SetAlignment( LUI.Alignment.Right )
	Text:SetAnchorsAndPosition( 0, 0, 0.5, 0.5, _1080p * 53, _1080p * -5, _1080p * 3, _1080p * 25 )
	self:addElement( Text )
	self.Text = Text
	
	local MissionName = nil
	
	MissionName = LUI.UIText.new()
	MissionName.id = "MissionName"
	MissionName:SetRGBFromInt( 0, 0 )
	MissionName:setText( "", 0 )
	MissionName:SetFontSize( 30 * _1080p )
	MissionName:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	MissionName:SetAlignment( LUI.Alignment.Right )
	MissionName:SetAnchorsAndPosition( 0, 0, 0.5, 0.5, _1080p * 53, _1080p * -5, _1080p * -27, _1080p * 3 )
	self:addElement( MissionName )
	self.MissionName = MissionName
	
	PostLoadFunc( self, f2_local1, controller )
	return self
end

MenuBuilder.registerType( "MissionPopupTitle", MissionPopupTitle )
LockTable( _M )
