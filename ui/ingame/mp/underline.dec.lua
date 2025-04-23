local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function Underline( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 275 * _1080p, 0, 4 * _1080p )
	self.id = "Underline"
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local Border0 = nil
	
	Border0 = LUI.UIBorder.new( {
		borderThicknessLeft = _1080p * 1,
		borderThicknessRight = _1080p * 1,
		borderThicknessTop = _1080p * 1,
		borderThicknessBottom = _1080p * 1
	} )
	Border0.id = "Border0"
	Border0:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 4, 0, _1080p * 4 )
	self:addElement( Border0 )
	self.Border0 = Border0
	
	local Image = nil
	
	Image = LUI.UIImage.new()
	Image.id = "Image"
	Image:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 4, _1080p * 275, _1080p * 2.68, _1080p * 1.32 )
	self:addElement( Image )
	self.Image = Image
	
	return self
end

MenuBuilder.registerType( "Underline", Underline )
LockTable( _M )
