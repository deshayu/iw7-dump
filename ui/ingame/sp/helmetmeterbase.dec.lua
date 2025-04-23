local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function HelmetMeterBase( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 50 * _1080p, 0, 50 * _1080p )
	self.id = "HelmetMeterBase"
	self._animationSets = {}
	self._sequences = {}
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local Divider = nil
	
	Divider = LUI.UIImage.new()
	Divider.id = "Divider"
	Divider:SetRGBFromTable( SWATCHES.HUD.stable, 0 )
	Divider:SetUseAA( true )
	Divider:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -25, _1080p * 25, _1080p * 2, _1080p * 3 )
	self:addElement( Divider )
	self.Divider = Divider
	
	local DividerCapR = nil
	
	DividerCapR = LUI.UIImage.new()
	DividerCapR.id = "DividerCapR"
	DividerCapR:SetUseAA( true )
	DividerCapR:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -26.5, _1080p * -23.5, _1080p * 1, _1080p * 4 )
	self:addElement( DividerCapR )
	self.DividerCapR = DividerCapR
	
	local DividerCapL = nil
	
	DividerCapL = LUI.UIImage.new()
	DividerCapL.id = "DividerCapL"
	DividerCapL:SetUseAA( true )
	DividerCapL:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 23.5, _1080p * 26.5, _1080p * 1, _1080p * 4 )
	self:addElement( DividerCapL )
	self.DividerCapL = DividerCapL
	
	local MeterFill = nil
	
	MeterFill = LUI.UIImage.new()
	MeterFill.id = "MeterFill"
	MeterFill:SetRGBFromTable( SWATCHES.HUD.active, 0 )
	MeterFill:SetUseAA( true )
	MeterFill:SetAnchorsAndPosition( 0, 1, 0.5, 0.5, 0, _1080p * 50, _1080p * -7.5, _1080p * -1.5 )
	self:addElement( MeterFill )
	self.MeterFill = MeterFill
	
	local MeterFrame = nil
	
	MeterFrame = LUI.UIBorder.new( {
		borderThicknessLeft = _1080p * 1,
		borderThicknessRight = _1080p * 1,
		borderThicknessTop = _1080p * 1,
		borderThicknessBottom = _1080p * 1
	} )
	MeterFrame.id = "MeterFrame"
	MeterFrame:SetRGBFromTable( SWATCHES.HUD.active, 0 )
	MeterFrame:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -25, _1080p * 25, _1080p * -7.5, _1080p * -1.5 )
	self:addElement( MeterFrame )
	self.MeterFrame = MeterFrame
	
	local GaugeName = nil
	
	GaugeName = LUI.UIText.new()
	GaugeName.id = "GaugeName"
	GaugeName:SetRGBFromTable( SWATCHES.HUD.stable, 0 )
	GaugeName:SetAlpha( 0.6, 0 )
	GaugeName:setText( "NAM", 0 )
	GaugeName:SetFontSize( 18 * _1080p )
	GaugeName:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	GaugeName:SetAlignment( LUI.Alignment.Center )
	GaugeName:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -30, _1080p * 30, _1080p * -25.5, _1080p * -7.5 )
	self:addElement( GaugeName )
	self.GaugeName = GaugeName
	
	local GaugeData = nil
	
	GaugeData = LUI.UIText.new()
	GaugeData.id = "GaugeData"
	GaugeData:SetRGBFromTable( SWATCHES.HUD.stable, 0 )
	GaugeData:setText( "100%", 0 )
	GaugeData:SetFontSize( 18 * _1080p )
	GaugeData:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	GaugeData:SetAlignment( LUI.Alignment.Center )
	GaugeData:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -30, _1080p * 30, _1080p * 7.21, _1080p * 25.21 )
	self:addElement( GaugeData )
	self.GaugeData = GaugeData
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		Divider:RegisterAnimationSequence( "Warning", {
			{
				function ()
					return self.Divider:SetRGBFromTable( SWATCHES.HUD.stable, 0 )
				end,
				function ()
					return self.Divider:SetRGBFromTable( SWATCHES.HUD.stable, 240 )
				end,
				function ()
					return self.Divider:SetRGBFromTable( SWATCHES.HUD.warning, 10 )
				end,
				function ()
					return self.Divider:SetRGBFromTable( SWATCHES.HUD.warning, 250 )
				end
			}
		} )
		DividerCapR:RegisterAnimationSequence( "Warning", {
			{
				function ()
					return self.DividerCapR:SetRGBFromInt( 16777215, 0 )
				end,
				function ()
					return self.DividerCapR:SetRGBFromInt( 16777215, 240 )
				end,
				function ()
					return self.DividerCapR:SetRGBFromTable( SWATCHES.HUD.warning, 10 )
				end,
				function ()
					return self.DividerCapR:SetRGBFromTable( SWATCHES.HUD.warning, 250 )
				end
			}
		} )
		DividerCapL:RegisterAnimationSequence( "Warning", {
			{
				function ()
					return self.DividerCapL:SetRGBFromInt( 16777215, 0 )
				end,
				function ()
					return self.DividerCapL:SetRGBFromInt( 16777215, 240 )
				end,
				function ()
					return self.DividerCapL:SetRGBFromTable( SWATCHES.HUD.warning, 10 )
				end,
				function ()
					return self.DividerCapL:SetRGBFromTable( SWATCHES.HUD.warning, 250 )
				end
			}
		} )
		MeterFill:RegisterAnimationSequence( "Warning", {
			{
				function ()
					return self.MeterFill:SetRGBFromTable( SWATCHES.HUD.active, 0 )
				end,
				function ()
					return self.MeterFill:SetRGBFromTable( SWATCHES.HUD.active, 240 )
				end,
				function ()
					return self.MeterFill:SetRGBFromTable( SWATCHES.HUD.warning, 10 )
				end,
				function ()
					return self.MeterFill:SetRGBFromTable( SWATCHES.HUD.warning, 250 )
				end
			}
		} )
		MeterFrame:RegisterAnimationSequence( "Warning", {
			{
				function ()
					return self.MeterFrame:SetRGBFromTable( SWATCHES.HUD.active, 0 )
				end,
				function ()
					return self.MeterFrame:SetRGBFromTable( SWATCHES.HUD.active, 240 )
				end,
				function ()
					return self.MeterFrame:SetRGBFromTable( SWATCHES.HUD.warning, 10 )
				end,
				function ()
					return self.MeterFrame:SetRGBFromTable( SWATCHES.HUD.warning, 250 )
				end
			}
		} )
		GaugeName:RegisterAnimationSequence( "Warning", {
			{
				function ()
					return self.GaugeName:SetRGBFromTable( SWATCHES.HUD.stable, 0 )
				end,
				function ()
					return self.GaugeName:SetRGBFromTable( SWATCHES.HUD.stable, 240 )
				end,
				function ()
					return self.GaugeName:SetRGBFromTable( SWATCHES.HUD.warning, 10 )
				end,
				function ()
					return self.GaugeName:SetRGBFromTable( SWATCHES.HUD.warning, 250 )
				end
			}
		} )
		GaugeData:RegisterAnimationSequence( "Warning", {
			{
				function ()
					return self.GaugeData:SetRGBFromTable( SWATCHES.HUD.stable, 0 )
				end,
				function ()
					return self.GaugeData:SetRGBFromTable( SWATCHES.HUD.stable, 240 )
				end,
				function ()
					return self.GaugeData:SetRGBFromTable( SWATCHES.HUD.warning, 10 )
				end,
				function ()
					return self.GaugeData:SetRGBFromTable( SWATCHES.HUD.warning, 250 )
				end
			}
		} )
		self._sequences.Warning = function ()
			Divider:AnimateLoop( "Warning" )
			DividerCapR:AnimateLoop( "Warning" )
			DividerCapL:AnimateLoop( "Warning" )
			MeterFill:AnimateLoop( "Warning" )
			MeterFrame:AnimateLoop( "Warning" )
			GaugeName:AnimateLoop( "Warning" )
			GaugeData:AnimateLoop( "Warning" )
		end
		
		Divider:RegisterAnimationSequence( "Stable", {
			{
				function ()
					return self.Divider:SetRGBFromTable( SWATCHES.HUD.stable, 0 )
				end
			}
		} )
		DividerCapR:RegisterAnimationSequence( "Stable", {
			{
				function ()
					return self.DividerCapR:SetRGBFromInt( 16777215, 0 )
				end
			}
		} )
		DividerCapL:RegisterAnimationSequence( "Stable", {
			{
				function ()
					return self.DividerCapL:SetRGBFromInt( 16777215, 0 )
				end
			}
		} )
		MeterFill:RegisterAnimationSequence( "Stable", {
			{
				function ()
					return self.MeterFill:SetRGBFromTable( SWATCHES.HUD.active, 0 )
				end
			}
		} )
		MeterFrame:RegisterAnimationSequence( "Stable", {
			{
				function ()
					return self.MeterFrame:SetRGBFromTable( SWATCHES.HUD.active, 0 )
				end
			}
		} )
		GaugeName:RegisterAnimationSequence( "Stable", {
			{
				function ()
					return self.GaugeName:SetRGBFromTable( SWATCHES.HUD.stable, 0 )
				end
			}
		} )
		GaugeData:RegisterAnimationSequence( "Stable", {
			{
				function ()
					return self.GaugeData:SetRGBFromTable( SWATCHES.HUD.stable, 0 )
				end
			}
		} )
		self._sequences.Stable = function ()
			Divider:AnimateSequence( "Stable" )
			DividerCapR:AnimateSequence( "Stable" )
			DividerCapL:AnimateSequence( "Stable" )
			MeterFill:AnimateSequence( "Stable" )
			MeterFrame:AnimateSequence( "Stable" )
			GaugeName:AnimateSequence( "Stable" )
			GaugeData:AnimateSequence( "Stable" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	return self
end

MenuBuilder.registerType( "HelmetMeterBase", HelmetMeterBase )
LockTable( _M )
