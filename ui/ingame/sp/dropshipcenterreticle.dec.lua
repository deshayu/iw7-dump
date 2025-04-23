local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function DropshipCenterReticle( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 630 * _1080p, 0, 630 * _1080p )
	self.id = "DropshipCenterReticle"
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local CenterReticle = nil
	
	CenterReticle = LUI.UIImage.new()
	CenterReticle.id = "CenterReticle"
	CenterReticle:setImage( RegisterMaterial( "dropship_hud_main_circle_1" ), 0 )
	CenterReticle:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -512, _1080p * 512, _1080p * -512, _1080p * 512 )
	self:addElement( CenterReticle )
	self.CenterReticle = CenterReticle
	
	local Triangle = nil
	
	Triangle = MenuBuilder.BuildRegisteredType( "DropshipCenterReticleTriangle", {
		controllerIndex = f1_local1
	} )
	Triangle.id = "Triangle"
	Triangle:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -237, _1080p * 237, _1080p * -255, _1080p * 255 )
	Triangle:SubscribeToModel( DataSources.inGame.jackal.roll:GetModel( f1_local1 ), function ()
		local f2_local0 = DataSources.inGame.jackal.roll:GetValue( f1_local1 )
		if f2_local0 ~= nil then
			Triangle:SetZRotation( Multiply( f2_local0, 2.3 ), 0 )
		end
	end )
	self:addElement( Triangle )
	self.Triangle = Triangle
	
	return self
end

MenuBuilder.registerType( "DropshipCenterReticle", DropshipCenterReticle )
LockTable( _M )
