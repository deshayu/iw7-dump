local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function PostLoadFunc( f1_arg0, f1_arg1 )
	f1_arg0.downNum:SetGlitchEnabled( true )
	f1_arg0.downNum:SetGlitchEnabled( false )
	f1_arg0.upNum:SetGlitchEnabled( true )
	f1_arg0.upNum:SetGlitchEnabled( false )
	f1_arg0.leftNum:SetGlitchEnabled( true )
	f1_arg0.leftNum:SetGlitchEnabled( false )
	f1_arg0.rightNum:SetGlitchEnabled( true )
	f1_arg0.rightNum:SetGlitchEnabled( false )
end

function colorSquareEndGame( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 400 * _1080p, 0, 400 * _1080p )
	self.id = "colorSquareEndGame"
	local f2_local1 = controller and controller.controllerIndex
	if not f2_local1 and not Engine.InFrontend() then
		f2_local1 = self:getRootController()
	end
	assert( f2_local1 )
	local f2_local2 = self
	local colorSquaresBase = nil
	
	colorSquaresBase = MenuBuilder.BuildRegisteredType( "colorSquaresBase", {
		controllerIndex = f2_local1
	} )
	colorSquaresBase.id = "colorSquaresBase"
	colorSquaresBase:SetScale( 0.74, 0 )
	colorSquaresBase:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 100, _1080p * 300, _1080p * 100, _1080p * 300 )
	self:addElement( colorSquaresBase )
	self.colorSquaresBase = colorSquaresBase
	
	local downNum = nil
	
	downNum = LUI.UIText.new()
	downNum.id = "downNum"
	downNum:SetRGBFromInt( 0, 0 )
	downNum:setText( "1", 0 )
	downNum:SetFontSize( 80 * _1080p )
	downNum:SetFont( FONTS.GetFont( FONTS.Dev.File ) )
	downNum:SetAlignment( LUI.Alignment.Left )
	downNum:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 179, _1080p * 221, _1080p * 250, _1080p * 330 )
	self:addElement( downNum )
	self.downNum = downNum
	
	local leftNum = nil
	
	leftNum = LUI.UIText.new()
	leftNum.id = "leftNum"
	leftNum:SetRGBFromInt( 0, 0 )
	leftNum:setText( "1", 0 )
	leftNum:SetFontSize( 80 * _1080p )
	leftNum:SetFont( FONTS.GetFont( FONTS.Dev.File ) )
	leftNum:SetAlignment( LUI.Alignment.Left )
	leftNum:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 92, _1080p * 134, _1080p * 160, _1080p * 240 )
	self:addElement( leftNum )
	self.leftNum = leftNum
	
	local upNum = nil
	
	upNum = LUI.UIText.new()
	upNum.id = "upNum"
	upNum:SetRGBFromInt( 0, 0 )
	upNum:setText( "1", 0 )
	upNum:SetFontSize( 80 * _1080p )
	upNum:SetFont( FONTS.GetFont( FONTS.Dev.File ) )
	upNum:SetAlignment( LUI.Alignment.Left )
	upNum:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 179, _1080p * 236, _1080p * 67, _1080p * 147 )
	self:addElement( upNum )
	self.upNum = upNum
	
	local rightNum = nil
	
	rightNum = LUI.UIText.new()
	rightNum.id = "rightNum"
	rightNum:SetRGBFromInt( 0, 0 )
	rightNum:setText( "1", 0 )
	rightNum:SetFontSize( 80 * _1080p )
	rightNum:SetFont( FONTS.GetFont( FONTS.Dev.File ) )
	rightNum:SetAlignment( LUI.Alignment.Left )
	rightNum:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 270, _1080p * 312, _1080p * 159, _1080p * 239 )
	self:addElement( rightNum )
	self.rightNum = rightNum
	
	PostLoadFunc( self, f2_local1, controller )
	return self
end

MenuBuilder.registerType( "colorSquareEndGame", colorSquareEndGame )
LockTable( _M )
