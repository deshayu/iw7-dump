local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function ContextualGauge( menu, controller )
	local self = LUI.UIButton.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 150 * _1080p, 0, 25 * _1080p )
	self.id = "ContextualGauge"
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local GaugeFill = nil
	
	GaugeFill = LUI.UIImage.new()
	GaugeFill.id = "GaugeFill"
	GaugeFill:SetAnchors( 0, 1, 0, 1, 0 )
	GaugeFill:SetLeft( _1080p * 0, 0 )
	GaugeFill:SetTop( _1080p * 19, 0 )
	GaugeFill:SetBottom( _1080p * 25, 0 )
	GaugeFill:SetRGBFromTable( SWATCHES.contextualGauge.gaugeFill, 0 )
	GaugeFill:SubscribeToModel( DataSources.inGame.SP.contextualGauges.fill:GetModel( f1_local1 ), function ()
		local f2_local0 = DataSources.inGame.SP.contextualGauges.fill:GetValue( f1_local1 )
		if f2_local0 ~= nil then
			GaugeFill:SetRight( _1080p * Multiply( f2_local0, 150 ), 0 )
		end
	end )
	self:addElement( GaugeFill )
	self.GaugeFill = GaugeFill
	
	local GaugeFrame = nil
	
	GaugeFrame = LUI.UIBorder.new( {
		borderThicknessLeft = _1080p * 1,
		borderThicknessRight = _1080p * 1,
		borderThicknessTop = _1080p * 1,
		borderThicknessBottom = _1080p * 1
	} )
	GaugeFrame.id = "GaugeFrame"
	GaugeFrame:SetRGBFromTable( SWATCHES.contextualGauge.gaugeFill, 0 )
	GaugeFrame:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 150, _1080p * 19, _1080p * 25 )
	self:addElement( GaugeFrame )
	self.GaugeFrame = GaugeFrame
	
	local GaugeName = nil
	
	GaugeName = LUI.UIText.new()
	GaugeName.id = "GaugeName"
	GaugeName:SetRGBFromTable( SWATCHES.contextualGauge.gaugeText, 0 )
	GaugeName:SetFontSize( 16 * _1080p )
	GaugeName:SetFont( FONTS.GetFont( FONTS.Digital.File ) )
	GaugeName:SetAlignment( LUI.Alignment.Center )
	GaugeName:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 44.5, _1080p * 105.5, _1080p * 4, _1080p * 16 )
	GaugeName:SubscribeToModel( DataSources.inGame.SP.contextualGauges.gaugeName:GetModel( f1_local1 ), function ()
		local f3_local0 = DataSources.inGame.SP.contextualGauges.gaugeName:GetValue( f1_local1 )
		if f3_local0 ~= nil then
			GaugeName:setText( f3_local0, 0 )
		end
	end )
	self:addElement( GaugeName )
	self.GaugeName = GaugeName
	
	return self
end

MenuBuilder.registerType( "ContextualGauge", ContextualGauge )
LockTable( _M )
