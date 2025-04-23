local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function colorSquaresBase( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 200 * _1080p, 0, 200 * _1080p )
	self.id = "colorSquaresBase"
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local blue = nil
	
	blue = LUI.UIImage.new()
	blue.id = "blue"
	blue:SetRGBFromInt( 6127045, 0 )
	blue:SetZRotation( -45, 0 )
	blue:SetScale( -0.45, 0 )
	blue:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -13.32, _1080p * 114.68, _1080p * 36, _1080p * 164 )
	self:addElement( blue )
	self.blue = blue
	
	local white = nil
	
	white = LUI.UIImage.new()
	white.id = "white"
	white:SetZRotation( -45, 0 )
	white:SetScale( -0.45, 0 )
	white:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 36, _1080p * 164, _1080p * 85.49, _1080p * 213.49 )
	self:addElement( white )
	self.white = white
	
	local red = nil
	
	red = LUI.UIImage.new()
	red.id = "red"
	red:SetRGBFromInt( 15937073, 0 )
	red:SetZRotation( -45, 0 )
	red:SetScale( -0.45, 0 )
	red:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 36, _1080p * 164, _1080p * -13.71, _1080p * 114.29 )
	self:addElement( red )
	self.red = red
	
	local yellow = nil
	
	yellow = LUI.UIImage.new()
	yellow.id = "yellow"
	yellow:SetRGBFromInt( 16575014, 0 )
	yellow:SetZRotation( -45, 0 )
	yellow:SetScale( -0.45, 0 )
	yellow:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 85.88, _1080p * 213.88, _1080p * 36, _1080p * 164 )
	self:addElement( yellow )
	self.yellow = yellow
	
	local line = nil
	
	line = LUI.UIImage.new()
	line.id = "line"
	line:SetRGBFromInt( 7171437, 0 )
	line:SetZRotation( 45, 0 )
	line:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 30.1, _1080p * 171, _1080p * 99, _1080p * 102 )
	self:addElement( line )
	self.line = line
	
	local line2 = nil
	
	line2 = LUI.UIImage.new()
	line2.id = "line2"
	line2:SetRGBFromInt( 7171437, 0 )
	line2:SetZRotation( -45, 0 )
	line2:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 29.1, _1080p * 170, _1080p * 99, _1080p * 102 )
	self:addElement( line2 )
	self.line2 = line2
	
	return self
end

MenuBuilder.registerType( "colorSquaresBase", colorSquaresBase )
LockTable( _M )
