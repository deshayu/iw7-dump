local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function ThorMissileDistanceIndicator( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 100 * _1080p, 0, 40 * _1080p )
	self.id = "ThorMissileDistanceIndicator"
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local Background = nil
	
	Background = LUI.UIImage.new()
	Background.id = "Background"
	Background:SetRGBFromTable( SWATCHES.HUD.warning, 0 )
	self:addElement( Background )
	self.Background = Background
	
	local Distance = nil
	
	Distance = LUI.UIText.new()
	Distance.id = "Distance"
	Distance:SetFontSize( 38 * _1080p )
	Distance:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	Distance:SetAlignment( LUI.Alignment.Center )
	Distance:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, _1080p * 2, _1080p * 40 )
	Distance:SubscribeToModelThroughElement( self, "distance", function ()
		local f2_local0 = self:GetDataSource()
		f2_local0 = f2_local0.distance:GetValue( f1_local1 )
		if f2_local0 ~= nil then
			Distance:setText( f2_local0, 0 )
		end
	end )
	self:addElement( Distance )
	self.Distance = Distance
	
	local GenericBorderFrame0 = nil
	
	GenericBorderFrame0 = LUI.UIBorder.new( {
		borderThicknessLeft = _1080p * 2,
		borderThicknessRight = _1080p * 2,
		borderThicknessTop = _1080p * 2,
		borderThicknessBottom = _1080p * 2
	} )
	GenericBorderFrame0.id = "GenericBorderFrame0"
	GenericBorderFrame0:SetBorderThicknessLeft( _1080p * 2, 0 )
	GenericBorderFrame0:SetBorderThicknessRight( _1080p * 2, 0 )
	GenericBorderFrame0:SetBorderThicknessTop( _1080p * 2, 0 )
	GenericBorderFrame0:SetBorderThicknessBottom( _1080p * 2, 0 )
	self:addElement( GenericBorderFrame0 )
	self.GenericBorderFrame0 = GenericBorderFrame0
	
	return self
end

MenuBuilder.registerType( "ThorMissileDistanceIndicator", ThorMissileDistanceIndicator )
LockTable( _M )
