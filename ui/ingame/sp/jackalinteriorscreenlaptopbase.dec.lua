local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function JackalInteriorScreenLaptopBase( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 1550 * _1080p, 0, 580 * _1080p )
	self.id = "JackalInteriorScreenLaptopBase"
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local Base = nil
	
	Base = LUI.UIImage.new()
	Base.id = "Base"
	Base:setImage( RegisterMaterial( "hud_jackal_interior_laptop_base" ), 0 )
	Base:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, _1080p * -75, _1080p * 75 )
	self:addElement( Base )
	self.Base = Base
	
	local DosOutput = nil
	
	DosOutput = LUI.UIImage.new()
	DosOutput.id = "DosOutput"
	DosOutput:SetAlpha( 0.5, 0 )
	DosOutput:setImage( RegisterMaterial( "hud_jackal_interior_laptop_text_anim" ), 0 )
	DosOutput:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -858, _1080p * -528, _1080p * 46, _1080p * 289 )
	self:addElement( DosOutput )
	self.DosOutput = DosOutput
	
	local Gauge1 = nil
	
	Gauge1 = MenuBuilder.BuildRegisteredType( "JackalInteriorScreenLaptopGauge", {
		controllerIndex = f1_local1
	} )
	Gauge1.id = "Gauge1"
	Gauge1:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 143, _1080p * 277, _1080p * 307, _1080p * 563 )
	self:addElement( Gauge1 )
	self.Gauge1 = Gauge1
	
	local Gauge2 = nil
	
	Gauge2 = MenuBuilder.BuildRegisteredType( "JackalInteriorScreenLaptopGauge", {
		controllerIndex = f1_local1
	} )
	Gauge2.id = "Gauge2"
	Gauge2:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 389, _1080p * 522, _1080p * 307, _1080p * 563 )
	self:addElement( Gauge2 )
	self.Gauge2 = Gauge2
	
	local Gauge3 = nil
	
	Gauge3 = MenuBuilder.BuildRegisteredType( "JackalInteriorScreenLaptopGauge", {
		controllerIndex = f1_local1
	} )
	Gauge3.id = "Gauge3"
	Gauge3:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 635, _1080p * 768, _1080p * 307, _1080p * 563 )
	self:addElement( Gauge3 )
	self.Gauge3 = Gauge3
	
	local Gauge4 = nil
	
	Gauge4 = MenuBuilder.BuildRegisteredType( "JackalInteriorScreenLaptopGauge", {
		controllerIndex = f1_local1
	} )
	Gauge4.id = "Gauge4"
	Gauge4:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 880, _1080p * 1014, _1080p * 307, _1080p * 563 )
	self:addElement( Gauge4 )
	self.Gauge4 = Gauge4
	
	return self
end

MenuBuilder.registerType( "JackalInteriorScreenLaptopBase", JackalInteriorScreenLaptopBase )
LockTable( _M )
