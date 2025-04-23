local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function UplinkArmorMeter( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 300 * _1080p, 0, 5 * _1080p )
	self.id = "UplinkArmorMeter"
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local VisualHorizontalLine = nil
	
	VisualHorizontalLine = LUI.UIImage.new()
	VisualHorizontalLine.id = "VisualHorizontalLine"
	VisualHorizontalLine:SetRGBFromTable( SWATCHES.HUD.background, 0 )
	VisualHorizontalLine:SetAlpha( 0.4, 0 )
	VisualHorizontalLine:SetAnchorsAndPosition( 0, 0, 0.5, 0.5, 0, 0, _1080p * -3.5, _1080p * 3.5 )
	self:addElement( VisualHorizontalLine )
	self.VisualHorizontalLine = VisualHorizontalLine
	
	local Fill = nil
	
	Fill = LUI.UIImage.new()
	Fill.id = "Fill"
	Fill:SetAnchors( 0, 1, 0, 0, 0 )
	Fill:SetLeft( _1080p * 0, 0 )
	Fill:SetTop( _1080p * 0, 0 )
	Fill:SetBottom( _1080p * 0, 0 )
	Fill:SetRGBFromTable( SWATCHES.HUD.contested, 0 )
	Fill:SubscribeToModel( DataSources.inGame.HUD.uplinkCarrierArmor:GetModel( f1_local1 ), function ()
		local f2_local0 = DataSources.inGame.HUD.uplinkCarrierArmor:GetValue( f1_local1 )
		if f2_local0 ~= nil then
			Fill:SetRight( _1080p * Multiply( Divide( f2_local0, DataSources.inGame.HUD.uplinkCarrierArmorMax:GetValue( f1_local1 ) ), 300 ), 0 )
		end
	end )
	Fill:SubscribeToModel( DataSources.inGame.HUD.uplinkCarrierArmorMax:GetModel( f1_local1 ), function ()
		local f3_local0 = DataSources.inGame.HUD.uplinkCarrierArmor:GetValue( f1_local1 )
		if f3_local0 ~= nil then
			Fill:SetRight( _1080p * Multiply( Divide( f3_local0, DataSources.inGame.HUD.uplinkCarrierArmorMax:GetValue( f1_local1 ) ), 300 ), 0 )
		end
	end )
	self:addElement( Fill )
	self.Fill = Fill
	
	local FillGradient = nil
	
	FillGradient = LUI.UIImage.new()
	FillGradient.id = "FillGradient"
	FillGradient:SetAnchors( 0, 1, 0, 0, 0 )
	FillGradient:SetLeft( _1080p * 0, 0 )
	FillGradient:SetTop( _1080p * 0, 0 )
	FillGradient:SetBottom( _1080p * 0, 0 )
	FillGradient:SetRGBFromInt( 15707152, 0 )
	FillGradient:setImage( RegisterMaterial( "widg_gradient_left_to_right" ), 0 )
	FillGradient:SubscribeToModel( DataSources.inGame.HUD.uplinkCarrierArmor:GetModel( f1_local1 ), function ()
		local f4_local0 = DataSources.inGame.HUD.uplinkCarrierArmor:GetValue( f1_local1 )
		if f4_local0 ~= nil then
			FillGradient:SetRight( _1080p * Multiply( Divide( f4_local0, 200 ), 300 ), 0 )
		end
	end )
	self:addElement( FillGradient )
	self.FillGradient = FillGradient
	
	local VisualVerticalLineRight = nil
	
	VisualVerticalLineRight = LUI.UIImage.new()
	VisualVerticalLineRight.id = "VisualVerticalLineRight"
	VisualVerticalLineRight:SetRGBFromTable( SWATCHES.HUD.normal, 0 )
	VisualVerticalLineRight:SetAnchorsAndPosition( 1, 0, 0.5, 0.5, _1080p * 1, 0, _1080p * -3.5, _1080p * 3.5 )
	self:addElement( VisualVerticalLineRight )
	self.VisualVerticalLineRight = VisualVerticalLineRight
	
	local EndNodeRight = nil
	
	EndNodeRight = LUI.UIImage.new()
	EndNodeRight.id = "EndNodeRight"
	EndNodeRight:SetAnchors( 0, 1, 0, 0, 0 )
	EndNodeRight:SetTop( _1080p * 0, 0 )
	EndNodeRight:SetBottom( _1080p * 0, 0 )
	EndNodeRight:SetRGBFromTable( SWATCHES.HUD.normal, 0 )
	EndNodeRight:SubscribeToModel( DataSources.inGame.HUD.uplinkCarrierArmor:GetModel( f1_local1 ), function ()
		local f5_local0 = DataSources.inGame.HUD.uplinkCarrierArmor:GetValue( f1_local1 )
		if f5_local0 ~= nil then
			EndNodeRight:SetLeft( _1080p * Add( Multiply( Divide( f5_local0, DataSources.inGame.HUD.uplinkCarrierArmorMax:GetValue( f1_local1 ) ), 300 ), -1 ), 0 )
		end
	end )
	EndNodeRight:SubscribeToModel( DataSources.inGame.HUD.uplinkCarrierArmorMax:GetModel( f1_local1 ), function ()
		local f6_local0 = DataSources.inGame.HUD.uplinkCarrierArmor:GetValue( f1_local1 )
		if f6_local0 ~= nil then
			EndNodeRight:SetLeft( _1080p * Add( Multiply( Divide( f6_local0, DataSources.inGame.HUD.uplinkCarrierArmorMax:GetValue( f1_local1 ) ), 300 ), -1 ), 0 )
		end
	end )
	EndNodeRight:SubscribeToModel( DataSources.inGame.HUD.uplinkCarrierArmor:GetModel( f1_local1 ), function ()
		local f7_local0 = DataSources.inGame.HUD.uplinkCarrierArmor:GetValue( f1_local1 )
		if f7_local0 ~= nil then
			EndNodeRight:SetRight( _1080p * Add( Multiply( Divide( f7_local0, DataSources.inGame.HUD.uplinkCarrierArmorMax:GetValue( f1_local1 ) ), 300 ), 1 ), 0 )
		end
	end )
	EndNodeRight:SubscribeToModel( DataSources.inGame.HUD.uplinkCarrierArmorMax:GetModel( f1_local1 ), function ()
		local f8_local0 = DataSources.inGame.HUD.uplinkCarrierArmor:GetValue( f1_local1 )
		if f8_local0 ~= nil then
			EndNodeRight:SetRight( _1080p * Add( Multiply( Divide( f8_local0, DataSources.inGame.HUD.uplinkCarrierArmorMax:GetValue( f1_local1 ) ), 300 ), 1 ), 0 )
		end
	end )
	self:addElement( EndNodeRight )
	self.EndNodeRight = EndNodeRight
	
	local VisualVerticalLineLeft = nil
	
	VisualVerticalLineLeft = LUI.UIImage.new()
	VisualVerticalLineLeft.id = "VisualVerticalLineLeft"
	VisualVerticalLineLeft:SetRGBFromTable( SWATCHES.HUD.normal, 0 )
	VisualVerticalLineLeft:SetAnchorsAndPosition( 0, 1, 0.5, 0.5, _1080p * 1, 0, _1080p * -3.5, _1080p * 3.5 )
	self:addElement( VisualVerticalLineLeft )
	self.VisualVerticalLineLeft = VisualVerticalLineLeft
	
	return self
end

MenuBuilder.registerType( "UplinkArmorMeter", UplinkArmorMeter )
LockTable( _M )
