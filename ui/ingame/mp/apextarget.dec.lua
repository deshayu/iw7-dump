local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function PostLoadFunc( f1_arg0, f1_arg1 )
	f1_arg0:SetBlendMode( BLEND_MODE.addWithAlpha )
	local f1_local0 = DataSources.inGame.MP.scorestreakHuds.miniJackalLockTarget:GetModel( f1_arg1 )
	f1_arg0:SubscribeToModel( f1_local0, function ( f2_arg0 )
		f1_arg0:SetEntityNum( DataModel.GetModelValue( f2_arg0 ) )
	end, true )
	local f1_local1 = DataSources.inGame.MP.scorestreakHuds.miniJackalLockTargetTag:GetModel( f1_arg1 )
	f1_arg0:SubscribeToModel( f1_local1, function ( f3_arg0 )
		f1_arg0:SetEntityTag( DataModel.GetModelValue( f3_arg0 ) )
	end, true )
	f1_arg0:SetupAnchoredElement( {
		minScale = 1,
		maxScale = 1,
		entityNum = DataModel.GetModelValue( f1_local0 ),
		entityTag = DataModel.GetModelValue( f1_local1 )
	} )
end

function ApexTarget( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 40 * _1080p, 0, 40 * _1080p )
	self.id = "ApexTarget"
	local f4_local1 = controller and controller.controllerIndex
	if not f4_local1 and not Engine.InFrontend() then
		f4_local1 = self:getRootController()
	end
	assert( f4_local1 )
	local f4_local2 = self
	local Border = nil
	
	Border = LUI.UIBorder.new( {
		borderThicknessLeft = _1080p * 3,
		borderThicknessRight = _1080p * 3,
		borderThicknessTop = _1080p * 3,
		borderThicknessBottom = _1080p * 3
	} )
	Border.id = "Border"
	Border:SetRGBFromTable( SWATCHES.apex.warning, 0 )
	Border:SetBorderThicknessLeft( _1080p * 3, 0 )
	Border:SetBorderThicknessRight( _1080p * 3, 0 )
	Border:SetBorderThicknessTop( _1080p * 3, 0 )
	Border:SetBorderThicknessBottom( _1080p * 3, 0 )
	self:addElement( Border )
	self.Border = Border
	
	PostLoadFunc( self, f4_local1, controller )
	return self
end

MenuBuilder.registerType( "ApexTarget", ApexTarget )
LockTable( _M )
