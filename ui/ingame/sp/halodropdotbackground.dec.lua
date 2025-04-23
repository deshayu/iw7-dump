local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function HaloDropDotBackground( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 1606 * _1080p, 0, 906 * _1080p )
	self.id = "HaloDropDotBackground"
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local Image6 = nil
	
	Image6 = LUI.UIImage.new()
	Image6.id = "Image6"
	Image6:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 6, 0, _1080p * 6 )
	self:addElement( Image6 )
	self.Image6 = Image6
	
	local Image6Copy0 = nil
	
	Image6Copy0 = LUI.UIImage.new()
	Image6Copy0.id = "Image6Copy0"
	Image6Copy0:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 6, _1080p * 300, _1080p * 306 )
	self:addElement( Image6Copy0 )
	self.Image6Copy0 = Image6Copy0
	
	local Image6Copy1 = nil
	
	Image6Copy1 = LUI.UIImage.new()
	Image6Copy1.id = "Image6Copy1"
	Image6Copy1:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 6, _1080p * 600, _1080p * 606 )
	self:addElement( Image6Copy1 )
	self.Image6Copy1 = Image6Copy1
	
	local Image6Copy2 = nil
	
	Image6Copy2 = LUI.UIImage.new()
	Image6Copy2.id = "Image6Copy2"
	Image6Copy2:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 6, _1080p * 900, _1080p * 906 )
	self:addElement( Image6Copy2 )
	self.Image6Copy2 = Image6Copy2
	
	local Image6Copy3 = nil
	
	Image6Copy3 = LUI.UIImage.new()
	Image6Copy3.id = "Image6Copy3"
	Image6Copy3:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 400, _1080p * 406, 0, _1080p * 6 )
	self:addElement( Image6Copy3 )
	self.Image6Copy3 = Image6Copy3
	
	local Image6Copy4 = nil
	
	Image6Copy4 = LUI.UIImage.new()
	Image6Copy4.id = "Image6Copy4"
	Image6Copy4:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 400, _1080p * 406, _1080p * 300, _1080p * 306 )
	self:addElement( Image6Copy4 )
	self.Image6Copy4 = Image6Copy4
	
	local Image6Copy5 = nil
	
	Image6Copy5 = LUI.UIImage.new()
	Image6Copy5.id = "Image6Copy5"
	Image6Copy5:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 400, _1080p * 406, _1080p * 600, _1080p * 606 )
	self:addElement( Image6Copy5 )
	self.Image6Copy5 = Image6Copy5
	
	local Image6Copy6 = nil
	
	Image6Copy6 = LUI.UIImage.new()
	Image6Copy6.id = "Image6Copy6"
	Image6Copy6:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 400, _1080p * 406, _1080p * 900, _1080p * 906 )
	self:addElement( Image6Copy6 )
	self.Image6Copy6 = Image6Copy6
	
	local Image6Copy7 = nil
	
	Image6Copy7 = LUI.UIImage.new()
	Image6Copy7.id = "Image6Copy7"
	Image6Copy7:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 800, _1080p * 806, 0, _1080p * 6 )
	self:addElement( Image6Copy7 )
	self.Image6Copy7 = Image6Copy7
	
	local Image6Copy10 = nil
	
	Image6Copy10 = LUI.UIImage.new()
	Image6Copy10.id = "Image6Copy10"
	Image6Copy10:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 800, _1080p * 806, _1080p * 900, _1080p * 906 )
	self:addElement( Image6Copy10 )
	self.Image6Copy10 = Image6Copy10
	
	local Image6Copy11 = nil
	
	Image6Copy11 = LUI.UIImage.new()
	Image6Copy11.id = "Image6Copy11"
	Image6Copy11:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1200, _1080p * 1206, 0, _1080p * 6 )
	self:addElement( Image6Copy11 )
	self.Image6Copy11 = Image6Copy11
	
	local Image6Copy12 = nil
	
	Image6Copy12 = LUI.UIImage.new()
	Image6Copy12.id = "Image6Copy12"
	Image6Copy12:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1200, _1080p * 1206, _1080p * 300, _1080p * 306 )
	self:addElement( Image6Copy12 )
	self.Image6Copy12 = Image6Copy12
	
	local Image6Copy13 = nil
	
	Image6Copy13 = LUI.UIImage.new()
	Image6Copy13.id = "Image6Copy13"
	Image6Copy13:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1200, _1080p * 1206, _1080p * 600, _1080p * 606 )
	self:addElement( Image6Copy13 )
	self.Image6Copy13 = Image6Copy13
	
	local Image6Copy14 = nil
	
	Image6Copy14 = LUI.UIImage.new()
	Image6Copy14.id = "Image6Copy14"
	Image6Copy14:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1200, _1080p * 1206, _1080p * 900, _1080p * 906 )
	self:addElement( Image6Copy14 )
	self.Image6Copy14 = Image6Copy14
	
	local Image6Copy15 = nil
	
	Image6Copy15 = LUI.UIImage.new()
	Image6Copy15.id = "Image6Copy15"
	Image6Copy15:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1600, _1080p * 1609, 0, _1080p * 6 )
	self:addElement( Image6Copy15 )
	self.Image6Copy15 = Image6Copy15
	
	local Image6Copy16 = nil
	
	Image6Copy16 = LUI.UIImage.new()
	Image6Copy16.id = "Image6Copy16"
	Image6Copy16:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1600, _1080p * 1606, _1080p * 300, _1080p * 306 )
	self:addElement( Image6Copy16 )
	self.Image6Copy16 = Image6Copy16
	
	local Image6Copy17 = nil
	
	Image6Copy17 = LUI.UIImage.new()
	Image6Copy17.id = "Image6Copy17"
	Image6Copy17:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1600, _1080p * 1606, _1080p * 600, _1080p * 606 )
	self:addElement( Image6Copy17 )
	self.Image6Copy17 = Image6Copy17
	
	local Image6Copy18 = nil
	
	Image6Copy18 = LUI.UIImage.new()
	Image6Copy18.id = "Image6Copy18"
	Image6Copy18:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1600, _1080p * 1606, _1080p * 900, _1080p * 906 )
	self:addElement( Image6Copy18 )
	self.Image6Copy18 = Image6Copy18
	
	return self
end

MenuBuilder.registerType( "HaloDropDotBackground", HaloDropDotBackground )
LockTable( _M )
