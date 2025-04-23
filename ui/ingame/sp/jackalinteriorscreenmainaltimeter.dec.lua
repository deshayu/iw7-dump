local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function JackalInteriorScreenMainAltimeter( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 512 * _1080p, 0, 512 * _1080p )
	self.id = "JackalInteriorScreenMainAltimeter"
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local Base = nil
	
	Base = MenuBuilder.BuildRegisteredType( "JackalInteriorMainAltimeterBase", {
		controllerIndex = f1_local1
	} )
	Base.id = "Base"
	Base:SetRGBFromTable( SWATCHES.jackal.stable, 0 )
	Base:SetAnchorsAndPosition( 0.5, 0.5, 1, 0, _1080p * -256, _1080p * 256, _1080p * -509, _1080p * -381 )
	self:addElement( Base )
	self.Base = Base
	
	local AltimeterCenter = nil
	
	AltimeterCenter = MenuBuilder.BuildRegisteredType( "JackalInteriorMainAltimeterCenter", {
		controllerIndex = f1_local1
	} )
	AltimeterCenter.id = "AltimeterCenter"
	AltimeterCenter:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -256, _1080p * 256, _1080p * 67, _1080p * 579 )
	self:addElement( AltimeterCenter )
	self.AltimeterCenter = AltimeterCenter
	
	local Frame = nil
	
	Frame = LUI.UIImage.new()
	Frame.id = "Frame"
	Frame:SetRGBFromTable( SWATCHES.jackal.stable, 0 )
	Frame:setImage( RegisterMaterial( "hud_jackal_interior_main_alt_frame" ), 0 )
	Frame:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, _1080p * 57, _1080p * 57 )
	self:addElement( Frame )
	self.Frame = Frame
	
	return self
end

MenuBuilder.registerType( "JackalInteriorScreenMainAltimeter", JackalInteriorScreenMainAltimeter )
LockTable( _M )
