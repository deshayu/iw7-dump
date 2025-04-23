local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function HackTargetingMarkerFrame( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 100 * _1080p, 0, 100 * _1080p )
	self.id = "HackTargetingMarkerFrame"
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local HorzLine1 = nil
	
	HorzLine1 = LUI.UIImage.new()
	HorzLine1.id = "HorzLine1"
	HorzLine1:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 40, 0, _1080p * 3 )
	self:addElement( HorzLine1 )
	self.HorzLine1 = HorzLine1
	
	local HorzLine2 = nil
	
	HorzLine2 = LUI.UIImage.new()
	HorzLine2.id = "HorzLine2"
	HorzLine2:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -40, 0, 0, _1080p * 3 )
	self:addElement( HorzLine2 )
	self.HorzLine2 = HorzLine2
	
	local HorzLine3 = nil
	
	HorzLine3 = LUI.UIImage.new()
	HorzLine3.id = "HorzLine3"
	HorzLine3:SetAnchorsAndPosition( 0, 1, 1, 0, 0, _1080p * 40, _1080p * -3, 0 )
	self:addElement( HorzLine3 )
	self.HorzLine3 = HorzLine3
	
	local HorzLine4 = nil
	
	HorzLine4 = LUI.UIImage.new()
	HorzLine4.id = "HorzLine4"
	HorzLine4:SetAnchorsAndPosition( 1, 0, 1, 0, _1080p * -40, 0, _1080p * -3, 0 )
	self:addElement( HorzLine4 )
	self.HorzLine4 = HorzLine4
	
	local VertLine1 = nil
	
	VertLine1 = LUI.UIImage.new()
	VertLine1.id = "VertLine1"
	VertLine1:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 3, _1080p * 1, _1080p * 15 )
	self:addElement( VertLine1 )
	self.VertLine1 = VertLine1
	
	local VertLine2 = nil
	
	VertLine2 = LUI.UIImage.new()
	VertLine2.id = "VertLine2"
	VertLine2:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -3, 0, _1080p * 1, _1080p * 15 )
	self:addElement( VertLine2 )
	self.VertLine2 = VertLine2
	
	local VertLine3 = nil
	
	VertLine3 = LUI.UIImage.new()
	VertLine3.id = "VertLine3"
	VertLine3:SetAnchorsAndPosition( 0, 1, 1, 0, 0, _1080p * 3, _1080p * -15, _1080p * -1 )
	self:addElement( VertLine3 )
	self.VertLine3 = VertLine3
	
	local VertLine4 = nil
	
	VertLine4 = LUI.UIImage.new()
	VertLine4.id = "VertLine4"
	VertLine4:SetAnchorsAndPosition( 1, 0, 1, 0, _1080p * -3, 0, _1080p * -15, _1080p * -1 )
	self:addElement( VertLine4 )
	self.VertLine4 = VertLine4
	
	return self
end

MenuBuilder.registerType( "HackTargetingMarkerFrame", HackTargetingMarkerFrame )
LockTable( _M )
