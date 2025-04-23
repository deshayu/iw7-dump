local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function JackalInteriorScreenMainCompass( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 480 * _1080p, 0, 305 * _1080p )
	self.id = "JackalInteriorScreenMainCompass"
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local Compass = nil
	
	Compass = LUI.UIImage.new()
	Compass.id = "Compass"
	Compass:setImage( RegisterMaterial( "hud_jackal_interior_main_compass" ), 0 )
	Compass:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -128, _1080p * 128, 0, _1080p * 256 )
	Compass:BindZRotationToModel( DataSources.inGame.HUD.compassRotation:GetModel( f1_local1 ) )
	self:addElement( Compass )
	self.Compass = Compass
	
	local LeftText = nil
	
	LeftText = LUI.UIImage.new()
	LeftText.id = "LeftText"
	LeftText:SetRGBFromTable( SWATCHES.jackal.stable, 0 )
	LeftText:setImage( RegisterMaterial( "hud_jackal_interior_main_compass_lt" ), 0 )
	LeftText:SetAnchorsAndPosition( 0, 1, 1, 0, 0, _1080p * 128, _1080p * -268, 0 )
	self:addElement( LeftText )
	self.LeftText = LeftText
	
	local RightText = nil
	
	RightText = LUI.UIImage.new()
	RightText.id = "RightText"
	RightText:SetRGBFromTable( SWATCHES.jackal.stable, 0 )
	RightText:setImage( RegisterMaterial( "hud_jackal_interior_main_compass_rt" ), 0 )
	RightText:SetAnchorsAndPosition( 1, 0, 1, 0, _1080p * -128, 0, _1080p * -274, _1080p * -6 )
	self:addElement( RightText )
	self.RightText = RightText
	
	local Triangle = nil
	
	Triangle = LUI.UIImage.new()
	Triangle.id = "Triangle"
	Triangle:SetRGBFromTable( SWATCHES.jackal.stable, 0 )
	Triangle:setImage( RegisterMaterial( "hud_jackal_interior_main_compass_arrow" ), 0 )
	Triangle:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -16, _1080p * 16, _1080p * 112, _1080p * 144 )
	self:addElement( Triangle )
	self.Triangle = Triangle
	
	return self
end

MenuBuilder.registerType( "JackalInteriorScreenMainCompass", JackalInteriorScreenMainCompass )
LockTable( _M )
