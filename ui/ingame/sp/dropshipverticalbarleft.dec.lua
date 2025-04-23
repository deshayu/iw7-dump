local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function PostLoadFunc( f1_arg0, f1_arg1, f1_arg2 )
	local f1_local0 = f1_arg0.Box
	local f1_local1 = f1_local0.Numbers
	local f1_local2 = DataSources.inGame.jackal.roll
	f1_arg0:SubscribeToModel( f1_local2:GetModel( f1_arg1 ), function ( f2_arg0 )
		local f2_local0 = math.ceil( f1_local2:GetValue( f1_arg1 ) )
		f1_local0:SetTop( _1080p * f2_local0 * 10 - 50 )
		f1_local1:setText( tostring( f2_local0 * -1 ) )
	end )
end

function DropshipVerticalBarLeft( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 128 * _1080p, 0, 512 * _1080p )
	self.id = "DropshipVerticalBarLeft"
	local f3_local1 = controller and controller.controllerIndex
	if not f3_local1 and not Engine.InFrontend() then
		f3_local1 = self:getRootController()
	end
	assert( f3_local1 )
	local f3_local2 = self
	local Background = nil
	
	Background = LUI.UIImage.new()
	Background.id = "Background"
	Background:setImage( RegisterMaterial( "dropship_hud_left_vertical_bar_1" ), 0 )
	Background:SetAnchorsAndPosition( 0, 1, 1, 0, 0, _1080p * 128, _1080p * -512, 0 )
	self:addElement( Background )
	self.Background = Background
	
	local Box = nil
	
	Box = MenuBuilder.BuildRegisteredType( "DropshipVerticalBarLeftBox", {
		controllerIndex = f3_local1
	} )
	Box.id = "Box"
	Box:SetAnchorsAndPosition( 0, 1, 0.5, 0.5, 0, _1080p * 64, _1080p * -57, _1080p * 7 )
	self:addElement( Box )
	self.Box = Box
	
	PostLoadFunc( self, f3_local1, controller )
	return self
end

MenuBuilder.registerType( "DropshipVerticalBarLeft", DropshipVerticalBarLeft )
LockTable( _M )
