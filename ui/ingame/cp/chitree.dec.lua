local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function chiTree( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 899 * _1080p, 0, 252 * _1080p )
	self.id = "chiTree"
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local dragonChiTree = nil
	
	dragonChiTree = MenuBuilder.BuildRegisteredType( "dragonChiTree", {
		controllerIndex = f1_local1
	} )
	dragonChiTree.id = "dragonChiTree"
	dragonChiTree:SetZRotation( -20, 0 )
	dragonChiTree:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 640.54, _1080p * 866.82, 0, _1080p * 251.96 )
	self:addElement( dragonChiTree )
	self.dragonChiTree = dragonChiTree
	
	local tigerChiTree = nil
	
	tigerChiTree = MenuBuilder.BuildRegisteredType( "tigerChiTree", {
		controllerIndex = f1_local1
	} )
	tigerChiTree.id = "tigerChiTree"
	tigerChiTree:SetZRotation( 20, 0 )
	tigerChiTree:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 437.04, _1080p * 661.04, _1080p * 1.04, _1080p * 253 )
	self:addElement( tigerChiTree )
	self.tigerChiTree = tigerChiTree
	
	local snakeChiTree = nil
	
	snakeChiTree = MenuBuilder.BuildRegisteredType( "snakeChiTree", {
		controllerIndex = f1_local1
	} )
	snakeChiTree.id = "snakeChiTree"
	snakeChiTree:SetZRotation( -8, 0 )
	snakeChiTree:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 197.08, _1080p * 430.04, _1080p * 9.54, _1080p * 261.5 )
	self:addElement( snakeChiTree )
	self.snakeChiTree = snakeChiTree
	
	local craneChiTree = nil
	
	craneChiTree = MenuBuilder.BuildRegisteredType( "craneChiTree", {
		controllerIndex = f1_local1
	} )
	craneChiTree.id = "craneChiTree"
	craneChiTree:SetZRotation( 5, 0 )
	craneChiTree:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 223, _1080p * 14.58, _1080p * 266.54 )
	self:addElement( craneChiTree )
	self.craneChiTree = craneChiTree
	
	return self
end

MenuBuilder.registerType( "chiTree", chiTree )
LockTable( _M )
