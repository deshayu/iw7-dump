local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function radialActiveCardElement( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, -105 * _1080p, 0, 104 * _1080p )
	self.id = "radialActiveCardElement"
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local Image = nil
	
	Image = LUI.UIImage.new()
	Image.id = "Image"
	Image:SetScale( -0.46, 0 )
	Image:SetUseAA( true )
	Image:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -116.92, _1080p * 11.08, _1080p * -12.08, _1080p * 115.92 )
	Image:SubscribeToModelThroughElement( self, "icon", function ()
		local f2_local0 = self:GetDataSource()
		f2_local0 = f2_local0.icon:GetValue( f1_local1 )
		if f2_local0 ~= nil then
			Image:setImage( RegisterMaterial( f2_local0 ), 0 )
		end
	end )
	self:addElement( Image )
	self.Image = Image
	
	local Name = nil
	
	Name = LUI.UIText.new()
	Name.id = "Name"
	Name:SetAlpha( 0, 0 )
	Name:SetFontSize( 20 * _1080p )
	Name:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	Name:SetAlignment( LUI.Alignment.Center )
	Name:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -79.73, _1080p * -17.73, _1080p * -9.5, _1080p * 10.5 )
	Name:SubscribeToModelThroughElement( self, "name", function ()
		local f3_local0 = self:GetDataSource()
		f3_local0 = f3_local0.name:GetValue( f1_local1 )
		if f3_local0 ~= nil then
			Name:setText( f3_local0, 0 )
		end
	end )
	self:addElement( Name )
	self.Name = Name
	
	local radialAlphaLarge = nil
	
	radialAlphaLarge = MenuBuilder.BuildRegisteredType( "radialAlphaLarge", {
		controllerIndex = f1_local1
	} )
	radialAlphaLarge.id = "radialAlphaLarge"
	radialAlphaLarge:SetScale( -0.34, 0 )
	radialAlphaLarge:SetDataSourceThroughElement( self, "fill" )
	radialAlphaLarge:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -144.42, _1080p * 38.58, _1080p * -39.61, _1080p * 143.39 )
	radialAlphaLarge:SubscribeToModelThroughElement( self, "fill", function ()
		local f4_local0 = self:GetDataSource()
		f4_local0 = f4_local0.fill:GetValue( f1_local1 )
		if f4_local0 ~= nil then
			radialAlphaLarge.circleFill:SetProgress( f4_local0 )
		end
	end )
	self:addElement( radialAlphaLarge )
	self.radialAlphaLarge = radialAlphaLarge
	
	local redRingInner = nil
	
	redRingInner = LUI.UIImage.new()
	redRingInner.id = "redRingInner"
	redRingInner:SetScale( -0.67, 0 )
	redRingInner:setImage( RegisterMaterial( "zm_wc_red_hoop" ), 0 )
	redRingInner:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -180.5, _1080p * 75.5, _1080p * -76.08, _1080p * 179.92 )
	self:addElement( redRingInner )
	self.redRingInner = redRingInner
	
	local redRingOuter = nil
	
	redRingOuter = LUI.UIImage.new()
	redRingOuter.id = "redRingOuter"
	redRingOuter:SetScale( -0.58, 0 )
	redRingOuter:setImage( RegisterMaterial( "zm_wc_red_hoop" ), 0 )
	redRingOuter:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -180.5, _1080p * 75.5, _1080p * -76.08, _1080p * 179.92 )
	self:addElement( redRingOuter )
	self.redRingOuter = redRingOuter
	
	radialAlphaLarge:SetDataSourceThroughElement( self, "fill" )
	return self
end

MenuBuilder.registerType( "radialActiveCardElement", radialActiveCardElement )
LockTable( _M )
