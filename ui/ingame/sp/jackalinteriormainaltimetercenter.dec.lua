local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function JackalInteriorMainAltimeterCenter( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 512 * _1080p, 0, 512 * _1080p )
	self.id = "JackalInteriorMainAltimeterCenter"
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local Background = nil
	
	Background = LUI.UIImage.new()
	Background.id = "Background"
	Background:setImage( RegisterMaterial( "hud_jackal_interior_alt_circle_color" ), 0 )
	Background:BindZRotationToModel( DataSources.inGame.jackal.roll:GetModel( f1_local1 ) )
	self:addElement( Background )
	self.Background = Background
	
	local TicsFrame = nil
	
	TicsFrame = LUI.UIImage.new()
	TicsFrame.id = "TicsFrame"
	TicsFrame:setImage( RegisterMaterial( "hud_jackal_interior_alt_circle_tics" ), 0 )
	self:addElement( TicsFrame )
	self.TicsFrame = TicsFrame
	
	local Arrows = nil
	
	Arrows = LUI.UIImage.new()
	Arrows.id = "Arrows"
	Arrows:SetRGBFromTable( SWATCHES.jackal.stable, 0 )
	Arrows:setImage( RegisterMaterial( "hud_jackal_interior_main_alt_circle_arrows" ), 0 )
	Arrows:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -256, _1080p * 256, _1080p * -32, _1080p * 32 )
	Arrows:BindZRotationToModel( DataSources.inGame.jackal.roll:GetModel( f1_local1 ) )
	self:addElement( Arrows )
	self.Arrows = Arrows
	
	local CenterArc = nil
	
	CenterArc = LUI.UIImage.new()
	CenterArc.id = "CenterArc"
	CenterArc:SetRGBFromTable( SWATCHES.jackal.stable, 0 )
	CenterArc:setImage( RegisterMaterial( "hud_jackal_interior_main_alt_meter_mid" ), 0 )
	CenterArc:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -150, _1080p * 150, _1080p * 30, _1080p * 158 )
	self:addElement( CenterArc )
	self.CenterArc = CenterArc
	
	return self
end

MenuBuilder.registerType( "JackalInteriorMainAltimeterCenter", JackalInteriorMainAltimeterCenter )
LockTable( _M )
