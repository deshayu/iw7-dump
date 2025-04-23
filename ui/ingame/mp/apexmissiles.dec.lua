local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function ApexMissiles( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 100 * _1080p, 0, 40 * _1080p )
	self.id = "ApexMissiles"
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local Background = nil
	
	Background = MenuBuilder.BuildRegisteredType( "GenericBackgroundGlow", {
		controllerIndex = f1_local1
	} )
	Background.id = "Background"
	Background:SetRGBFromTable( SWATCHES.apex.background, 0 )
	Background:SetAlpha( 0.16, 0 )
	Background:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * -10, _1080p * 10, _1080p * -10, _1080p * 10 )
	self:addElement( Background )
	self.Background = Background
	
	local Border = nil
	
	Border = LUI.UIBorder.new( {
		borderThicknessLeft = _1080p * 1,
		borderThicknessRight = _1080p * 1,
		borderThicknessTop = _1080p * 1,
		borderThicknessBottom = _1080p * 1
	} )
	Border.id = "Border"
	Border:SetRGBFromTable( SWATCHES.apex.stable, 0 )
	self:addElement( Border )
	self.Border = Border
	
	local MissileIcon = nil
	
	MissileIcon = LUI.UIImage.new()
	MissileIcon.id = "MissileIcon"
	MissileIcon:SetRGBFromTable( SWATCHES.apex.stable, 0 )
	MissileIcon:setImage( RegisterMaterial( "hud_jackal_missile" ), 0 )
	MissileIcon:SetAnchorsAndPosition( 0, 1, 0.5, 0.5, _1080p * 6, _1080p * 22, _1080p * -16, _1080p * 16 )
	self:addElement( MissileIcon )
	self.MissileIcon = MissileIcon
	
	local Count = nil
	
	Count = LUI.UIText.new()
	Count.id = "Count"
	Count:SetRGBFromTable( SWATCHES.apex.stable, 0 )
	Count:setText( "!?", 0 )
	Count:SetFontSize( 24 * _1080p )
	Count:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	Count:SetAlignment( LUI.Alignment.Center )
	Count:SetAnchorsAndPosition( 0, 0, 0.5, 0.5, _1080p * 25, _1080p * -5, _1080p * -12, _1080p * 12 )
	self:addElement( Count )
	self.Count = Count
	
	return self
end

MenuBuilder.registerType( "ApexMissiles", ApexMissiles )
LockTable( _M )
