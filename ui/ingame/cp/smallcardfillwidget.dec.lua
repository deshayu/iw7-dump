local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function smallCardFillWidget( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, -105 * _1080p, 0, 134 * _1080p )
	self.id = "smallCardFillWidget"
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local base = nil
	
	base = LUI.UIImage.new()
	base.id = "base"
	base:SetAlpha( 0, 0 )
	base:SetScale( -0.59, 0 )
	base:setImage( RegisterMaterial( "zm_wc_base" ), 0 )
	base:SetUseAA( true )
	base:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -183.79, _1080p * 81.32, _1080p * -150.54, _1080p * 358.46 )
	self:addElement( base )
	self.base = base
	
	local fade = nil
	
	fade = LUI.UIImage.new()
	fade.id = "fade"
	fade:SetAlpha( 0, 0 )
	fade:setImage( RegisterMaterial( "zm_wc_back_gradient" ), 0 )
	fade:SetUseAA( true )
	fade:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -101, _1080p * -1.79, 0, _1080p * 134 )
	self:addElement( fade )
	self.fade = fade
	
	local fadeCopy0 = nil
	
	fadeCopy0 = LUI.UIImage.new()
	fadeCopy0.id = "fadeCopy0"
	fadeCopy0:SetZRotation( 180, 0 )
	fadeCopy0:setImage( RegisterMaterial( "zm_wc_back_gradient" ), 0 )
	fadeCopy0:SetUseAA( true )
	fadeCopy0:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -101, _1080p * -1.79, 0, _1080p * 134 )
	self:addElement( fadeCopy0 )
	self.fadeCopy0 = fadeCopy0
	
	local fill = nil
	
	fill = MenuBuilder.BuildRegisteredType( "GenericProgressBarVertical", {
		controllerIndex = f1_local1
	} )
	fill.id = "fill"
	fill:SetDataSourceThroughElement( self, "fill" )
	fill.Fill:SetRGBFromInt( 16775159, 0 )
	fill.Fill:SetAlpha( 0, 0 )
	fill.Fill:setImage( RegisterMaterial( "zm_wc_side_card_drain" ), 0 )
	fill:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -114.92, _1080p * 12.21, _1080p * 1.5, _1080p * 132.5 )
	self:addElement( fill )
	self.fill = fill
	
	local Image = nil
	
	Image = LUI.UIImage.new()
	Image.id = "Image"
	Image:SetScale( -0.46, 0 )
	Image:SetUseAA( true )
	Image:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -116.92, _1080p * 11.08, _1080p * 3.92, _1080p * 131.92 )
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
	Name:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -79.73, _1080p * -17.73, _1080p * 6.5, _1080p * 26.5 )
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
	radialAlphaLarge:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -144.42, _1080p * 38.58, _1080p * -23.61, _1080p * 159.39 )
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
	redRingInner:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -180.5, _1080p * 75.5, _1080p * -60.08, _1080p * 195.92 )
	self:addElement( redRingInner )
	self.redRingInner = redRingInner
	
	local redRingOuter = nil
	
	redRingOuter = LUI.UIImage.new()
	redRingOuter.id = "redRingOuter"
	redRingOuter:SetScale( -0.58, 0 )
	redRingOuter:setImage( RegisterMaterial( "zm_wc_red_hoop" ), 0 )
	redRingOuter:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -180.5, _1080p * 75.5, _1080p * -60.08, _1080p * 195.92 )
	self:addElement( redRingOuter )
	self.redRingOuter = redRingOuter
	
	fill:SetDataSourceThroughElement( self, "fill" )
	radialAlphaLarge:SetDataSourceThroughElement( self, "fill" )
	return self
end

MenuBuilder.registerType( "smallCardFillWidget", smallCardFillWidget )
LockTable( _M )
