local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function PostLoadFunc( f1_arg0, f1_arg1, f1_arg2 )
	f1_arg0.ArtificialHorizon:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 0, _1080p * 0, _1080p * 300, _1080p * 364, 100000 )
end

function DropshipOverlay( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 1920 * _1080p, 0, 1080 * _1080p )
	self.id = "DropshipOverlay"
	local f2_local1 = controller and controller.controllerIndex
	if not f2_local1 and not Engine.InFrontend() then
		f2_local1 = self:getRootController()
	end
	assert( f2_local1 )
	local f2_local2 = self
	local VerticalBarLeft = nil
	
	VerticalBarLeft = MenuBuilder.BuildRegisteredType( "DropshipVerticalBarLeft", {
		controllerIndex = f2_local1
	} )
	VerticalBarLeft.id = "VerticalBarLeft"
	VerticalBarLeft:SetAnchorsAndPosition( 0, 1, 0.5, 0.5, _1080p * 96, _1080p * 224, _1080p * -237, _1080p * 275 )
	self:addElement( VerticalBarLeft )
	self.VerticalBarLeft = VerticalBarLeft
	
	local VerticalBarRight = nil
	
	VerticalBarRight = MenuBuilder.BuildRegisteredType( "DropshipVerticalBarRight", {
		controllerIndex = f2_local1
	} )
	VerticalBarRight.id = "VerticalBarRight"
	VerticalBarRight:SetAnchorsAndPosition( 1, 0, 0.5, 0.5, _1080p * -242, _1080p * -114, _1080p * -237, _1080p * 275 )
	self:addElement( VerticalBarRight )
	self.VerticalBarRight = VerticalBarRight
	
	local ArtificialHorizon = nil
	
	ArtificialHorizon = MenuBuilder.BuildRegisteredType( "DropshipArtificialHorizon", {
		controllerIndex = f2_local1
	} )
	ArtificialHorizon.id = "ArtificialHorizon"
	ArtificialHorizon:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -509, _1080p * 515, _1080p * -32, _1080p * 32 )
	ArtificialHorizon:BindZRotationToModel( DataSources.inGame.jackal.roll:GetModel( f2_local1 ) )
	self:addElement( ArtificialHorizon )
	self.ArtificialHorizon = ArtificialHorizon
	
	PostLoadFunc( self, f2_local1, controller )
	return self
end

MenuBuilder.registerType( "DropshipOverlay", DropshipOverlay )
LockTable( _M )
