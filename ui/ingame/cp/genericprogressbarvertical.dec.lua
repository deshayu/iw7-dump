local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ( f1_arg0, f1_arg1 )
	f1_arg0:SubscribeToModelThroughElement( f1_arg0, nil, function ()
		local f2_local0 = f1_arg0:GetDataSource()
		assert( f2_local0 )
		f1_arg0.Fill:SetAnchors( 0, 0, 1 - LUI.clamp( f2_local0:GetValue( f1_arg1 ), 0, 1 ), 0, 250 )
	end )
end

function GenericProgressBarVertical( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 10 * _1080p, 0, 100 * _1080p )
	self.id = "GenericProgressBarVertical"
	local f3_local1 = controller and controller.controllerIndex
	if not f3_local1 and not Engine.InFrontend() then
		f3_local1 = self:getRootController()
	end
	assert( f3_local1 )
	local f3_local2 = self
	local Fill = nil
	
	Fill = LUI.UIImage.new()
	Fill.id = "Fill"
	Fill:SetRGBFromTable( SWATCHES.CAC.weaponMeterMain, 0 )
	Fill:SetAnchorsAndPosition( 0, 0, 1, 0, 0, 0, 0, 0 )
	self:addElement( Fill )
	self.Fill = Fill
	
	local Frame = nil
	
	Frame = LUI.UIBorder.new( {
		borderThicknessLeft = _1080p * 1,
		borderThicknessRight = _1080p * 1,
		borderThicknessTop = _1080p * 1,
		borderThicknessBottom = _1080p * 1
	} )
	Frame.id = "Frame"
	Frame:SetAlpha( 0, 0 )
	self:addElement( Frame )
	self.Frame = Frame
	
	f0_local0( self, f3_local1, controller )
	return self
end

MenuBuilder.registerType( "GenericProgressBarVertical", GenericProgressBarVertical )
LockTable( _M )
