local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ( f1_arg0, f1_arg1, f1_arg2 )
	local f1_local0 = CSV.ReadRow( CSV.zombieElements, Engine.TableLookupGetRowNum( CSV.zombieElements.file, CSV.zombieElements.cols.ref, f1_arg1 ) )
	if f1_arg2 == 1 then
		f1_arg0.heat:setText( f1_local0.heatA, 0 )
		f1_arg0.pressure:setText( f1_local0.pressureA, 0 )
	elseif f1_arg2 == 2 then
		f1_arg0.heat:setText( f1_local0.heatB, 0 )
		f1_arg0.pressure:setText( f1_local0.pressureB, 0 )
	elseif f1_arg2 == 3 then
		f1_arg0.heat:setText( f1_local0.heatC, 0 )
		f1_arg0.pressure:setText( f1_local0.pressureC, 0 )
	elseif f1_arg2 == 4 then
		f1_arg0.heat:setText( f1_local0.heatD, 0 )
		f1_arg0.pressure:setText( f1_local0.pressureD, 0 )
	elseif f1_arg2 == 5 then
		f1_arg0.heat:setText( f1_local0.heatE, 0 )
		f1_arg0.pressure:setText( f1_local0.pressureE, 0 )
	elseif f1_arg2 == 6 then
		f1_arg0.heat:setText( f1_local0.heatF, 0 )
		f1_arg0.pressure:setText( f1_local0.pressureF, 0 )
	end
	f1_arg0.yellow:setText( tostring( math.random( 1, 9 ) ), 0 )
	f1_arg0.white:setText( tostring( math.random( 1, 9 ) ), 0 )
end

f0_local1 = function ( f2_arg0, f2_arg1, f2_arg2 )
	local f2_local0 = CSV.ReadRow( CSV.zombieElements, Engine.TableLookupGetRowNum( CSV.zombieElements.file, CSV.zombieElements.cols.ref, f2_arg1 ) )
	if f2_arg2 == 1 then
		f2_arg0.heat:setText( f2_local0.bheatA, 0 )
		f2_arg0.pressure:setText( f2_local0.bpressureA, 0 )
	elseif f2_arg2 == 2 then
		f2_arg0.heat:setText( f2_local0.bheatB, 0 )
		f2_arg0.pressure:setText( f2_local0.bpressureB, 0 )
	elseif f2_arg2 == 3 then
		f2_arg0.heat:setText( f2_local0.bheatC, 0 )
		f2_arg0.pressure:setText( f2_local0.bpressureC, 0 )
	elseif f2_arg2 == 4 then
		f2_arg0.heat:setText( f2_local0.bheatD, 0 )
		f2_arg0.pressure:setText( f2_local0.bpressureD, 0 )
	elseif f2_arg2 == 5 then
		f2_arg0.heat:setText( f2_local0.bheatE, 0 )
		f2_arg0.pressure:setText( f2_local0.bpressureE, 0 )
	elseif f2_arg2 == 6 then
		f2_arg0.heat:setText( f2_local0.bheatF, 0 )
		f2_arg0.pressure:setText( f2_local0.bpressureF, 0 )
	end
	f2_arg0.yellow:setText( tostring( math.random( 1, 9 ) ), 0 )
	f2_arg0.white:setText( tostring( math.random( 1, 9 ) ), 0 )
end

f0_local2 = function ( f3_arg0, f3_arg1, f3_arg2 )
	f3_arg0.UpdateHeatNumbers = f0_local0
	f3_arg0.UpdateBadHeatNumbers = f0_local1
	f3_arg0.heat:SetGlitchEnabled( true )
	f3_arg0.pressure:SetGlitchEnabled( true )
	f3_arg0.white:SetGlitchEnabled( true )
	f3_arg0.yellow:SetGlitchEnabled( true )
	f3_arg0.heat:SetGlitchEnabled( false )
	f3_arg0.pressure:SetGlitchEnabled( false )
	f3_arg0.white:SetGlitchEnabled( false )
	f3_arg0.yellow:SetGlitchEnabled( false )
end

function colorSquares( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 80 * _1080p, 0, 80 * _1080p )
	self.id = "colorSquares"
	local f4_local1 = controller and controller.controllerIndex
	if not f4_local1 and not Engine.InFrontend() then
		f4_local1 = self:getRootController()
	end
	assert( f4_local1 )
	local f4_local2 = self
	local colorSquaresBase = nil
	
	colorSquaresBase = MenuBuilder.BuildRegisteredType( "colorSquaresBase", {
		controllerIndex = f4_local1
	} )
	colorSquaresBase.id = "colorSquaresBase"
	colorSquaresBase:SetScale( -0.6, 0 )
	colorSquaresBase:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -60, _1080p * 140, _1080p * -60, _1080p * 140 )
	self:addElement( colorSquaresBase )
	self.colorSquaresBase = colorSquaresBase
	
	local heat = nil
	
	heat = LUI.UIText.new()
	heat.id = "heat"
	heat:SetRGBFromInt( 0, 0 )
	heat:setText( "9", 0 )
	heat:SetFontSize( 36 * _1080p )
	heat:SetFont( FONTS.GetFont( FONTS.Dev.File ) )
	heat:SetAlignment( LUI.Alignment.Left )
	heat:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 31.5, _1080p * 50.5, _1080p * 0.5, _1080p * 36.5 )
	self:addElement( heat )
	self.heat = heat
	
	local pressure = nil
	
	pressure = LUI.UIText.new()
	pressure.id = "pressure"
	pressure:SetRGBFromInt( 0, 0 )
	pressure:setText( "9", 0 )
	pressure:SetFontSize( 36 * _1080p )
	pressure:SetFont( FONTS.GetFont( FONTS.Dev.File ) )
	pressure:SetAlignment( LUI.Alignment.Left )
	pressure:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 11, _1080p * 31.5, _1080p * 21.5, _1080p * 57.5 )
	self:addElement( pressure )
	self.pressure = pressure
	
	local white = nil
	
	white = LUI.UIText.new()
	white.id = "white"
	white:SetRGBFromInt( 0, 0 )
	white:setText( "9", 0 )
	white:SetFontSize( 36 * _1080p )
	white:SetFont( FONTS.GetFont( FONTS.Dev.File ) )
	white:SetAlignment( LUI.Alignment.Left )
	white:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 31.5, _1080p * 50.5, _1080p * 40, _1080p * 76 )
	self:addElement( white )
	self.white = white
	
	local yellow = nil
	
	yellow = LUI.UIText.new()
	yellow.id = "yellow"
	yellow:SetRGBFromInt( 0, 0 )
	yellow:setText( "9", 0 )
	yellow:SetFontSize( 36 * _1080p )
	yellow:SetFont( FONTS.GetFont( FONTS.Dev.File ) )
	yellow:SetAlignment( LUI.Alignment.Left )
	yellow:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 53, _1080p * 73, _1080p * 21.5, _1080p * 57.5 )
	self:addElement( yellow )
	self.yellow = yellow
	
	f0_local2( self, f4_local1, controller )
	return self
end

MenuBuilder.registerType( "colorSquares", colorSquares )
LockTable( _M )
