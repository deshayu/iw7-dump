local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ( f1_arg0, f1_arg1, f1_arg2, f1_arg3, f1_arg4, f1_arg5 )
	local f1_local0 = f1_arg2
	f1_arg1( f1_arg0, f1_arg2 )
	local f1_local1 = f1_arg2
	local f1_local2 = nil
	local f1_local3 = function ()
		if f1_local1 == f1_arg2 then
			f1_local1 = f1_arg3
		else
			f1_local1 = f1_arg2
		end
		local f2_local0 = f1_arg1
		local f2_local1 = f1_arg0
		local f2_local2 = f1_local1
		local f2_local3 = f1_arg4
		local f2_local4 = f1_arg5
		if not f2_local4 then
			f2_local4 = LUI.EASING.linear
		end
		f2_local0 = f2_local0( f2_local1, f2_local2, f2_local3, f2_local4 )
		f2_local0.onComplete = f1_local2
	end
	
	f1_local3()
end

function CompassCoords()
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, 0, 0, 36, 36 )
	self.id = "CompassCoords"
	local f3_local1 = 0.15
	local f3_local2 = LUI.UIImage.new( {
		material = RegisterMaterial( "ops_map_scr_ios_compass_letters" ),
		topAnchor = false,
		bottomAnchor = false,
		leftAnchor = false,
		rightAnchor = false,
		top = -f3_local1 * 32,
		bottom = f3_local1 * 32,
		left = -f3_local1 * 44,
		right = 0
	} )
	self:addElement( f3_local2 )
	local f3_local3 = LUI.UIImage.new( {
		material = RegisterMaterial( "ops_map_scr_ios_compass_numbers" ),
		topAnchor = false,
		bottomAnchor = false,
		leftAnchor = false,
		rightAnchor = false,
		top = -f3_local1 * 32,
		bottom = f3_local1 * 32,
		left = 0,
		right = f3_local1 * 64
	} )
	self:addElement( f3_local3 )
	local f3_local4 = 11
	local f3_local5 = LUI.DataSourceInControllerModel.new( "cg.SP.opsMap.cursorX" )
	f3_local2:SubscribeToModel( f3_local5:GetModel( 0 ), function ( f4_arg0 )
		local f4_local0 = DataModel.GetModelValue( f4_arg0 )
		if not f4_local0 then
			return 
		end
		f4_local0 = math.min( 1 - 1 / f3_local4, math.floor( (f4_local0 + 0.5) * f3_local4 ) / f3_local4 )
		if f4_local0 ~= f3_local2.last then
			f3_local2.last = f4_local0
			f3_local2:SetUMin( f4_local0, 120, LUI.EASING.inOutQuadratic )
			f3_local2:SetUMax( f4_local0 + 1 / f3_local4, 120, LUI.EASING.inOutQuadratic )
		end
	end )
	local f3_local6 = 9
	local f3_local7 = LUI.DataSourceInControllerModel.new( "cg.SP.opsMap.cursorY" )
	f3_local3:SubscribeToModel( f3_local7:GetModel( 0 ), function ( f5_arg0 )
		local f5_local0 = DataModel.GetModelValue( f5_arg0 )
		if not f5_local0 then
			return 
		end
		f5_local0 = math.min( 1 - 1 / f3_local6, math.floor( (1 - f5_local0 + 0.5) * f3_local6 ) / f3_local6 )
		if f5_local0 ~= f3_local3.last then
			f3_local3.last = f5_local0
			f3_local3:SetVMin( f5_local0, 120, LUI.EASING.inOutQuadratic )
			f3_local3:SetVMax( f5_local0 + 1 / f3_local6, 120, LUI.EASING.inOutQuadratic )
		end
	end )
	return self
end

function OpsMapOverlay2D()
	local self = LUI.UIElement.new()
	self.id = "OpsMapOverlay2D"
	local f6_local1 = LUI.UIImage.new( {
		material = RegisterMaterial( "ops_map_scr_ios_top_bar_1" ),
		topAnchor = true,
		bottomAnchor = false,
		leftAnchor = true,
		rightAnchor = true,
		top = 0,
		bottom = 128 * _1080p,
		left = 0,
		right = 0
	} )
	f6_local1.id = "top"
	self:addElement( f6_local1 )
	self:addElement( CompassCoords() )
	local f6_local2 = LUI.UIImage.new( {
		material = RegisterMaterial( "ops_map_scr_ios_bottom_bar_1" ),
		topAnchor = false,
		bottomAnchor = true,
		leftAnchor = true,
		rightAnchor = true,
		top = -128 * _1080p,
		bottom = 0,
		left = 0,
		right = 0
	} )
	f6_local2.id = "bottom"
	self:addElement( f6_local2 )
	self:SetDotPitchX( 6 )
	self:SetDotPitchY( 3 )
	self:SetDotPitchMode( 0 )
	self:SetDotPitchContrast( 0.2 )
	return self
end

function OpsMapSidePane()
	local f7_local0 = 350
	local f7_local1 = 5
	local f7_local2 = 0
	local self = LUI.UIElement.new( {
		topAnchor = false,
		bottomAnchor = false,
		leftAnchor = true,
		rightAnchor = false,
		top = 0,
		bottom = 0,
		left = 60,
		width = f7_local0
	} )
	self:SetAlpha( 0 )
	self.id = "SidePane"
	self:SetDotPitchX( 6 )
	self:SetDotPitchY( 3 )
	self:SetDotPitchMode( 0 )
	self:SetDotPitchContrast( 0.2 )
	local f7_local4 = LUI.UIVerticalList.new( {
		topAnchor = true,
		bottomAnchor = true,
		leftAnchor = true,
		rightAnchor = true,
		top = 0,
		bottom = 0,
		left = 0,
		right = 0,
		spacing = 4
	}, {
		adjustSizeToContent = true,
		ignoreStretchingChildren = true
	} )
	f7_local4:SetAlignment( LUI.Alignment.Middle )
	self:addElement( f7_local4 )
	f7_local4:addElement( LUI.UIElement.new( {
		topAnchor = true,
		bottomAnchor = false,
		leftAnchor = true,
		rightAnchor = true,
		top = 0,
		bottom = 3,
		left = 0,
		right = 0
	} ) )
	local f7_local5 = LUI.UIElement.new()
	f7_local4:addElement( f7_local5 )
	local f7_local6 = LUI.UIElement.new( {
		topAnchor = true,
		bottomAnchor = false,
		leftAnchor = true,
		rightAnchor = true,
		top = 0,
		bottom = 23,
		left = 0,
		right = 0
	} )
	f7_local6:setUseStencil( true )
	f7_local6:setPriority( f7_local2 )
	f7_local4:addElement( f7_local6 )
	f7_local2 = f7_local2 + 1
	f7_local6:addElement( LUI.UIImage.new( {
		material = RegisterMaterial( "ops_map_scr_gradient_1" ),
		alpha = 0.4
	} ) )
	local f7_local7 = LUI.UIStyledText.new( {
		alignment = LUI.Alignment.Left,
		font = FONTS.GetFont( FONTS.MainExtended.File ),
		topAnchor = true,
		bottomAnchor = false,
		leftAnchor = true,
		rightAnchor = true,
		left = 20,
		top = 3,
		right = -20,
		height = 17
	} )
	f7_local7:SetDecodeLetterLength( 30 )
	f7_local7:SetDecodeMaxRandChars( 3 )
	f7_local7:SetDecodeUpdatesPerLetter( 4 )
	f7_local6:addElement( f7_local7 )
	local f7_local8 = LUI.UIElement.new( {
		topAnchor = true,
		bottomAnchor = false,
		leftAnchor = true,
		rightAnchor = true,
		top = 0,
		bottom = 6,
		left = 0,
		right = 0
	} )
	f7_local8:setPriority( f7_local2 )
	f7_local4:addElement( f7_local8 )
	f7_local2 = f7_local2 + 1
	local f7_local9 = LUI.UIStyledText.new( {
		alignment = LUI.Alignment.Left,
		font = FONTS.GetFont( FONTS.MainMedium.File ),
		topAnchor = true,
		bottomAnchor = false,
		leftAnchor = true,
		rightAnchor = true,
		left = 20,
		top = 0,
		right = -15,
		height = 14,
		color = COLORS.grey140
	} )
	f7_local9:setPriority( f7_local2 )
	f7_local9:SetDecodeLetterLength( 8 )
	f7_local9:SetDecodeMaxRandChars( 8 )
	f7_local9:SetDecodeUpdatesPerLetter( 20 )
	f7_local9:SetShadowRGBFromInt( GetIntForColor( COLORS.white ), 0 )
	f7_local4:addElement( f7_local9 )
	f7_local2 = f7_local2 + 1
	local f7_local10 = LUI.UIElement.new( {
		topAnchor = true,
		bottomAnchor = false,
		leftAnchor = true,
		rightAnchor = true,
		top = 0,
		bottom = 26,
		left = 0,
		right = 0
	} )
	f7_local10:setPriority( f7_local2 )
	f7_local4:addElement( f7_local10 )
	f7_local2 = f7_local2 + 1
	local f7_local11 = {}
	for f7_local12 = 1, f7_local1, 1 do
		local f7_local15 = f7_local12
		local f7_local16 = LUI.UIText.new( {
			alignment = LUI.Alignment.Left,
			font = FONTS.GetFont( FONTS.MainCondensed.File ),
			topAnchor = true,
			bottomAnchor = false,
			leftAnchor = true,
			rightAnchor = true,
			left = 20,
			top = 0,
			right = -20,
			height = 11,
			color = COLORS.grey179
		} )
		f7_local16:setPriority( f7_local2 )
		f7_local4:addElement( f7_local16 )
		f7_local2 = f7_local2 + 1
		f7_local16:addElement( LUI.UIImage.new( {
			material = RegisterMaterial( "white" ),
			topAnchor = true,
			bottomAnchor = true,
			leftAnchor = true,
			rightAnchor = false,
			top = 0,
			bottom = 0,
			right = -4,
			width = 2
		} ) )
		table.insert( f7_local11, f7_local16 )
	end
	local f7_local12 = LUI.UIElement.new( {
		topAnchor = true,
		bottomAnchor = false,
		leftAnchor = true,
		rightAnchor = true,
		top = 0,
		bottom = 26,
		left = 0,
		right = 0
	} )
	f7_local12:setPriority( f7_local2 )
	f7_local4:addElement( f7_local12 )
	f7_local2 = f7_local2 + 1
	local f7_local13 = LUI.UIImage.new( {
		material = RegisterMaterial( "white" ),
		topAnchor = true,
		bottomAnchor = true,
		leftAnchor = true,
		rightAnchor = true,
		top = 0,
		bottom = 0,
		left = 0,
		right = 0,
		red = 0,
		green = 0,
		blue = 0,
		alpha = 0.85
	} )
	f7_local5:addElement( f7_local13 )
	local f7_local14 = 3
	local f7_local15 = 1
	local f7_local16 = LUI.UIImage.new( {
		material = RegisterMaterial( "white" ),
		topAnchor = true,
		bottomAnchor = false,
		leftAnchor = true,
		rightAnchor = true,
		top = -f7_local15 / 2,
		bottom = f7_local15 / 2,
		left = 0,
		right = 0,
		alpha = 0.5
	} )
	f7_local5:addElement( f7_local16 )
	local f7_local17 = LUI.UIImage.new( {
		material = RegisterMaterial( "white" ),
		topAnchor = false,
		bottomAnchor = true,
		leftAnchor = true,
		rightAnchor = true,
		top = -f7_local15 / 2,
		bottom = f7_local15 / 2,
		left = 0,
		right = 0,
		alpha = 0.5
	} )
	f7_local5:addElement( f7_local17 )
	self:addEventHandler( "slide_in", function ( f8_arg0, f8_arg1 )
		f8_arg0:SetAlpha( 1 )
		f7_local16:SetRightAnchor( 0 )
		f7_local16:SetLeftAnchor( 1 )
		f7_local16:SetLeftAnchor( 0, 450, LUI.EASING.inOutQuartic )
		f7_local17:SetLeftAnchor( 0 )
		f7_local17:SetRightAnchor( 1 )
		f7_local17:SetRightAnchor( 0, 350, LUI.EASING.inOutQuintic )
		f7_local13:SetBottomAnchor( 1 )
		f7_local13:SetBottomAnchor( 0, 200, LUI.EASING.inOutQuadratic )
		f7_local6:SetRightAnchor( 1 )
		f7_local6:SetRightAnchor( 0, 150, LUI.EASING.inOutQuadratic )
		local f8_local0 = f7_local4:getFirstChild()
		while f8_local0 do
			if f8_local0 ~= f7_local5 then
				local f8_local1 = f8_local0
				f8_local0:RegisterAnimationSequence( "on", {
					{
						function ()
							return f8_local1:SetAlpha( 1 )
						end,
						function ()
							return f8_local1:SetAlpha( 1, 10 + 150 * math.random() )
						end,
						function ()
							return f8_local1:SetAlpha( 0, 20 + 50 * math.random() )
						end,
						function ()
							return f8_local1:SetAlpha( 1, 20 + 50 * math.random() )
						end,
						function ()
							return f8_local1:SetAlpha( 0, 20 + 50 * math.random() )
						end,
						function ()
							return f8_local1:SetAlpha( 1, 20 + 50 * math.random() )
						end,
						function ()
							return f8_local1:SetAlpha( 1, 20 + 50 * math.random() )
						end
					},
					{
						function ()
							f8_local1:SetDotPitchContrast( 0.8, 80 )
							f8_local1:SetDotPitchY( 1 + 20 * math.random() )
							f8_local1:SetDotPitchX( 2 )
							return f8_local1:SetDotPitchX( 40, 200 )
						end,
						function ()
							f8_local1:SetDotPitchContrast( 0.2, 140 )
							f8_local1:SetDotPitchY( 3, 140 )
							return f8_local1:SetDotPitchX( 6, 120 )
						end
					}
				} )
				f8_local0:AnimateSequence( "on" )
			end
			f8_local0 = f8_local0:getNextSibling()
		end
	end )
	self:addEventHandler( "slide_out", function ( f18_arg0, f18_arg1 )
		f7_local16:SetRightAnchor( 1, 230, LUI.EASING.inOutQuartic )
		f7_local17:SetLeftAnchor( 1, 350, LUI.EASING.inOutQuintic )
		f7_local13:SetBottomAnchor( 1, 300, LUI.EASING.inOutCubic )
		local f18_local0 = f7_local4:getFirstChild()
		while f18_local0 do
			if f18_local0 ~= f7_local5 then
				local f18_local1 = f18_local0
				f18_local0:RegisterAnimationSequence( "off", {
					{
						function ()
							return f18_local1:SetAlpha( 0 )
						end,
						function ()
							return f18_local1:SetAlpha( 0, 10 + 150 * math.random() )
						end,
						function ()
							return f18_local1:SetAlpha( 0, 20 + 50 * math.random() )
						end,
						function ()
							return f18_local1:SetAlpha( 1, 20 + 50 * math.random() )
						end,
						function ()
							return f18_local1:SetAlpha( 0, 20 + 50 * math.random() )
						end,
						function ()
							return f18_local1:SetAlpha( 1, 20 + 50 * math.random() )
						end,
						function ()
							return f18_local1:SetAlpha( 0, 20 + 50 * math.random() )
						end
					},
					{
						function ()
							f18_local1:SetDotPitchContrast( 0, 80 )
							f18_local1:SetDotPitchContrast( 0.8, 300 )
							f18_local1:SetDotPitchY( 1 + 20 * math.random() )
							f18_local1:SetDotPitchX( 2 )
							return f18_local1:SetDotPitchX( 40, 200 )
						end,
						function ()
							f18_local1:SetDotPitchY( 14, 200 )
							return f18_local1:SetDotPitchX( 2, 300 )
						end
					}
				} )
				f18_local0:AnimateSequence( "off" )
			end
			f18_local0 = f18_local0:getNextSibling()
		end
	end )
	local f7_local18 = function ( f28_arg0 )
		if f28_arg0.removed then
			f7_local4:addElement( f28_arg0 )
			f28_arg0.removed = false
		end
	end
	
	local f7_local19 = function ( f29_arg0 )
		if not f29_arg0.removed then
			f7_local4:removeElement( f29_arg0 )
			f29_arg0.removed = true
		end
	end
	
	self:addEventHandler( "populate", function ( f30_arg0, f30_arg1 )
		assert( f30_arg1.poi )
		if #f30_arg1.poi.displayName > 0 then
			f7_local18( f7_local6 )
			f7_local7:setText( Engine.Localize( f30_arg1.poi.displayName ) )
		else
			f7_local19( f7_local6 )
		end
		if #f30_arg1.poi.description > 0 then
			f7_local18( f7_local9 )
			f7_local9:setText( Engine.LocalizeLong( f30_arg1.poi.description ) )
		else
			f7_local19( f7_local9 )
		end
		local f30_local0 = 0
		for f30_local1 = 1, f7_local1, 1 do
			local f30_local4 = f30_arg1.poi["fluff" .. f30_local1]
			local f30_local5 = f7_local11[f30_local1]
			if #f30_local4 > 0 then
				f7_local18( f30_local5 )
				f30_local5:setText( Engine.Localize( f30_local4 ) )
				f30_local0 = f30_local0 + 1
			else
				f7_local19( f30_local5 )
			end
		end
		if f30_local0 == 0 then
			f7_local19( f7_local10 )
		else
			f7_local18( f7_local10 )
		end
	end )
	return self
end

function POIName( f31_arg0, f31_arg1 )
	local f31_local0 = Engine.ToUpperCase( Engine.Localize( f31_arg1.poi.displayName ) )
	local self = LUI.UIText.new( {
		alignment = LUI.Alignment.Center,
		font = FONTS.GetFont( FONTS.MainCondensed.File ),
		topAnchor = true,
		bottomAnchor = false,
		leftAnchor = false,
		rightAnchor = false,
		left = 0,
		top = -9,
		right = 0,
		bottom = 0
	} )
	self:SetFontSize( 70 )
	self:setText( f31_local0 )
	return self
end

function PlanetLines( f32_arg0 )
	local self = LUI.UIElement.new()
	self.id = "PlanetLines"
	local f32_local1 = 0.15
	local f32_local2 = 0.2
	local f32_local3 = 0.7
	local f32_local4 = LUI.EASING.inOutCubic
	local f32_local5 = f32_arg0.category and 0.06 or 0.1
	local f32_local6 = f32_arg0.category and 10 or 20
	for f32_local7 = 1, f32_local6, 1 do
		local f32_local10 = f32_local7
		local f32_local11 = LUI.UILine.new()
		f32_local11:SetRGBFromTable( {
			r = 0.55,
			g = 0.55,
			b = 0.55
		} )
		f32_local11:SetAlpha( 0 )
		f32_local11:SetBlendMode( BLEND_MODE.addWithAlpha )
		f32_local11:SetThickness( f32_local5 * 1.5 )
		self:addElement( f32_local11 )
		local f32_local12 = LUI.UIImage.new( {
			material = RegisterMaterial( "white" ),
			topAnchor = false,
			bottomAnchor = false,
			leftAnchor = false,
			rightAnchor = false
		} )
		if f32_arg0.category == "moon" then
			f32_local12:SetRGBFromTable( {
				r = 0.8,
				g = 0.64,
				b = 0.16
			} )
		else
			f32_local12:SetRGBFromTable( {
				r = 0.26,
				g = 0.63,
				b = 0.63
			} )
		end
		self:addElement( f32_local12 )
		local f32_local13 = nil
		local f32_local14
		if math.random() > 0.5 then
			f32_local14 = 2
			if not f32_local14 then
			
			else
				if f32_local10 % 4 == 0 then
					f32_local13 = MenuBuilder.BuildRegisteredType( "UITechyDigits", DigiText1BuildOptions )
					f32_local13:SetFontSize( 14 * _1080p )
					f32_local13:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
					f32_local13:SetAlpha( 0 )
					self:addElement( f32_local13 )
				end
				local f32_local15 = f32_local11:Wait( 50 + math.random() * 1500 )
				f32_local15.onComplete = function ()
					local f33_local0 = nil
					local f33_local1 = function ()
						local f34_local0 = math.random()
						local f34_local1 = f32_local2 + (1 + (f34_local0 - 1) * (f34_local0 - 1) * (f34_local0 - 1)) * (f32_local3 - f32_local2)
						local f34_local2 = math.rad( 360 * math.random() )
						local f34_local3 = math.cos( f34_local2 )
						local f34_local4 = math.sin( f34_local2 )
						local f34_local5 = f32_local1 * f34_local1
						local f34_local6 = (2.5 - f34_local1) * f32_local5
						local f34_local7 = 0.5 + f34_local3 * f34_local1 / 2
						local f34_local8 = 0.5 + f34_local4 * f34_local1 / 2
						local f34_local9 = f34_local7 + f34_local3 * f34_local5
						local f34_local10 = f34_local8 + f34_local4 * f34_local5
						local f34_local11 = 600 + 1000 * math.random()
						if f32_local13 then
							f32_local13:SetAnchorsAndPosition( f34_local7, 1 - f34_local7, f34_local8, 1 - f34_local8, 5 * f32_local5, 400, -f32_local14 * f32_local5, f32_local14 * f32_local5 )
							f32_local13:SetAnchors( f34_local9, 1 - f34_local9, f34_local10, 1 - f34_local10, f34_local11 / 2, f32_local4 )
							f32_local13:SetAlpha( 0 )
							f32_local13:SetAlpha( 1, f34_local11 / 2, LUI.EASING.outQuadratic )
						end
						f32_local11:SetAlpha( 0.5 )
						f32_local11:SetVertexPosition( 0, f34_local7, f34_local8, 0, 0 )
						f32_local11:SetVertexPosition( 1, f34_local7, f34_local8, 0, 0 )
						f32_local12:SetAnchorsAndPosition( f34_local7, 1 - f34_local7, f34_local8, 1 - f34_local8, -f34_local6, f34_local6, -f34_local6, f34_local6 )
						f32_local12:SetAlpha( 0 )
						f32_local12:SetAnchors( f34_local9, 1 - f34_local9, f34_local10, 1 - f34_local10, f34_local11 / 2, f32_local4 )
						f32_local12:SetAlpha( 1, f34_local11 / 2 )
						local f34_local12 = f32_local11:SetVertexPosition( 1, f34_local9, f34_local10, 0, 0, f34_local11 / 2, f32_local4 )
						f34_local12.onComplete = function ()
							local f35_local0 = f32_local12:Wait( 550 + f32_local10 % 5 * 100 )
							f35_local0.onComplete = function ()
								f32_local12:SetAnchors( f34_local7, 1 - f34_local7, f34_local8, 1 - f34_local8, f34_local11 / 2, LUI.EASING.inCubic )
								local f36_local0 = f32_local11:SetVertexPosition( 1, f34_local7, f34_local8, 0, 0, f34_local11 / 2, f32_local4 )
								f36_local0.onComplete = f33_local0
								f32_local12:SetAlpha( 0, f34_local11 / 2, LUI.EASING.inCubic )
								if f32_local13 then
									f32_local13:SetAlpha( 0, f34_local11 / 2 )
								end
							end
							
						end
						
					end
					
					f33_local1()
				end
				
			end
		end
		f32_local14 = 4
	end
	return self
end

function PlanetNoise()
	local self = LUI.UIElement.new()
	self.id = "PlanetNoise"
	for f37_local1 = 0, 4, 1 do
		local f37_local4 = f37_local1
		local f37_local5, f37_local6, f37_local7 = nil
		if f37_local4 % 3 == 0 then
			local f37_local8 = 0.8
			local f37_local9 = 0.64
			f37_local7 = 0.16
			f37_local6 = f37_local9
			f37_local5 = f37_local8
		elseif f37_local4 % 3 == 1 then
			local f37_local8 = 0.26
			local f37_local9 = 0.63
			f37_local7 = 0.63
			f37_local6 = f37_local9
			f37_local5 = f37_local8
		else
			local f37_local8 = 1
			local f37_local9 = 1
			f37_local7 = 1
			f37_local6 = f37_local9
			f37_local5 = f37_local8
		end
		local f37_local8 = LUI.UIImage.new( {
			material = RegisterMaterial( "ops_map_planet_dots_0" ),
			topAnchor = true,
			bottomAnchor = true,
			leftAnchor = true,
			rightAnchor = true,
			top = 0,
			bottom = 0,
			left = 0,
			right = 0,
			red = f37_local5,
			green = f37_local6,
			blue = f37_local7,
			scale = 1.5,
			alpha = 0
		} )
		f37_local8.id = "fill"
		self:addElement( f37_local8 )
		f37_local8:SetBlendMode( BLEND_MODE.addWithAlpha )
		local f37_local9 = nil
		local f37_local10 = 1
		local f37_local11 = function ()
			if f37_local10 == 1 then
				f37_local10 = 0.1 + 0.2 * math.random()
			else
				f37_local10 = 1
				f37_local8:SetZRotation( 360 * math.random() )
			end
			local f38_local0 = f37_local8:SetAlpha( f37_local10, 900 + 500 * f37_local4 )
			f38_local0.onComplete = f37_local9
		end
		
		f37_local11()
	end
	return self
end

function PlanetPulseHL()
	local self = LUI.UIElement.new()
	self.id = "PlanetPulseHL"
	local f39_local1 = LUI.UIImage.new( {
		material = RegisterMaterial( "ops_map_scr_planet_orbit_1" ),
		topAnchor = true,
		bottomAnchor = true,
		leftAnchor = true,
		rightAnchor = true,
		top = 0,
		bottom = 0,
		left = 0,
		right = 0
	} )
	f39_local1:SetBlendMode( BLEND_MODE.addWithAlpha )
	f39_local1:SetAlpha( 0 )
	local f39_local2 = f39_local1:Wait( 400 )
	f39_local2.onComplete = function ()
		f39_local1:SetAlpha( 0.2 )
		f39_local1:SetXRotation( -80 )
		f39_local1:SetScale( 0 )
		f39_local1:SetAlpha( 0, 500, LUI.EASING.inQuadratic )
		f39_local1:SetScale( -1, 500, LUI.EASING.outQuadratic )
	end
	
	self:addElement( f39_local1 )
	local f39_local3 = LUI.UIImage.new( {
		material = RegisterMaterial( "ops_map_scr_planet_pulse_1" ),
		topAnchor = true,
		bottomAnchor = true,
		leftAnchor = true,
		rightAnchor = true,
		top = 0,
		bottom = 0,
		left = 0,
		right = 0
	} )
	f39_local3:SetBlendMode( BLEND_MODE.addWithAlpha )
	f39_local3:SetAlpha( 0 )
	local f39_local4 = f39_local3:Wait( 180 )
	f39_local4.onComplete = function ()
		local f41_local0 = f39_local3:SetAlpha( 0.5, 50, LUI.EASING.outQuadratic )
		f41_local0.onComplete = function ()
			f39_local3:SetAlpha( 0, 3000, LUI.EASING.outQuadratic )
		end
		
	end
	
	self:addElement( f39_local3 )
	return self
end

function PlanetFluffInfo( f43_arg0 )
	local self = LUI.UIElement.new()
	self:SetLeftAnchor( 0.7 )
	self.id = "PlanetFluffInfo"
	local f43_local1 = nil
	local f43_local2 = 0
	if f43_arg0.category == "moon" then
		f43_local1 = 0.03
	elseif f43_arg0.category == "planet" then
		f43_local1 = 0.05
	else
		f43_local2 = 40
		f43_local1 = 0.5
	end
	local f43_local3 = 120 * f43_local1
	local f43_local4 = 400 * f43_local1
	local f43_local5 = LUI.UIElement.new( {
		topAnchor = false,
		bottomAnchor = false,
		leftAnchor = true,
		rightAnchor = false,
		top = -f43_local3 / 2 + f43_local2,
		height = f43_local3,
		left = 0,
		width = f43_local4,
		alpha = 0.5
	} )
	self:addElement( f43_local5 )
	local f43_local6 = LUI.UIBorder.new( {
		borderThicknessLeft = 1 * f43_local1,
		borderThicknessRight = 1 * f43_local1,
		borderThicknessTop = 1 * f43_local1,
		borderThicknessBottom = 1 * f43_local1
	} )
	f43_local6:SetAlpha( 0.5 )
	f43_local6:SetScale( -1 )
	f43_local6:SetScale( 0, 200, LUI.EASING.outBack )
	f43_local5:addElement( f43_local6 )
	local f43_local7 = LUI.UIImage.new( {
		material = RegisterMaterial( "white" )
	} )
	f43_local7:SetAnchors( 0, 1, 0, 0.8 )
	local f43_local8 = LUI.UIImage.new()
	f43_local8:SetAnchorsAndPosition( 0, 1, 0, 0.8, 4 * f43_local1, 8 * f43_local1, 0, 0 )
	f43_local8:SetBlendMode( BLEND_MODE.addWithAlpha )
	f0_local0( f43_local8, f43_local8.SetAlpha, 1, 0, 80, LUI.EASING.inOutQuartic )
	f43_local5:addElement( f43_local8 )
	local f43_local9 = LUI.UIStyledText.new( {
		alignment = LUI.Alignment.Left,
		font = FONTS.GetFont( FONTS.MainExtended.File ),
		alpha = 0.7
	} )
	f43_local9:SetAnchorsAndPosition( 0, 0, 0, 0.8, 10 * f43_local1, -4 * f43_local1, 0, 0 )
	f43_local9:SetDecodeLetterLength( 25 )
	f43_local9:SetDecodeMaxRandChars( 3 )
	f43_local9:SetDecodeUpdatesPerLetter( 4 )
	f43_local5:addElement( f43_local9 )
	local f43_local10 = f43_local7:Wait( 180 )
	f43_local10.onComplete = function ()
		f43_local7:SetRightAnchor( 0, 200, LUI.EASING.outBack )
		f43_local9:setText( Engine.Localize( "OPS_MAP_FLUFF_TITLE" ) )
		local f44_local0 = f43_local7:SetAlpha( 1, 50, LUI.EASING.outQuadratic )
		f44_local0.onComplete = function ()
			f0_local0( f43_local9, f43_local9.SetAlpha, 0.7, 0.3, 500, LUI.EASING.inOutCubic )
			f0_local0( f43_local7, f43_local7.SetAlpha, 0.2, 0, 800, LUI.EASING.inOutQuadratic )
		end
		
	end
	
	f43_local7:SetBlendMode( BLEND_MODE.addWithAlpha )
	f43_local5:addElement( f43_local7 )
	local f43_local11 = LUI.UIStyledText.new( {
		alignment = LUI.Alignment.Left,
		font = FONTS.GetFont( FONTS.MainExtended.File )
	} )
	f43_local11:SetDecodeLetterLength( 25 )
	f43_local11:SetDecodeMaxRandChars( 3 )
	f43_local11:SetDecodeUpdatesPerLetter( 4 )
	f43_local11:SetAnchorsAndPosition( 0, 0, 0.2, 0.8, 4 * f43_local1, -4 * f43_local1, 2 * f43_local1, 14 * f43_local1 )
	f43_local5:addElement( f43_local11 )
	local f43_local12 = LUI.UIImage.new()
	f43_local12:SetAnchorsAndPosition( 0, 1, 1, 0, 0, 0, -16 * f43_local1, -15 * f43_local1 )
	f43_local12:SetRightAnchor( 0, 6000 )
	f43_local5:addElement( f43_local12 )
	local f43_local13 = nil
	if f43_arg0.category ~= "mission" then
		f43_local13 = LUI.UIStyledText.new( {
			alignment = LUI.Alignment.Left,
			font = FONTS.GetFont( FONTS.MainExtended.File )
		} )
		f43_local13:SetDecodeLetterLength( 80 )
		f43_local13:SetDecodeMaxRandChars( 8 )
		f43_local13:SetDecodeUpdatesPerLetter( 8 )
		f43_local13:SetAnchorsAndPosition( 0, 0, 1, 0, 4 * f43_local1, -4 * f43_local1, 2 * f43_local1, 14 * f43_local1 )
		f43_local5:addElement( f43_local13 )
	end
	f43_local5:SetAlpha( 0 )
	local f43_local14 = f43_local7:Wait( 180 )
	f43_local14.onComplete = function ()
		f43_local5:SetAlpha( 1, 50 )
		f43_local5:SetLeft( f43_local1 * 40, 200, LUI.EASING.inOutQuadratic )
		local f46_local0 = f43_local5:SetRight( f43_local1 * 40 + f43_local4, 200, LUI.EASING.inOutQuadratic )
		f43_local11:setText( Engine.Localize( "OPS_MAP_FLUFF_INITIAL" ) )
		f46_local0.onComplete = function ()
			local f47_local0 = f43_local5:Wait( 1200 )
			f47_local0.onComplete = function ()
				if f43_local13 then
					f43_local13:setText( Engine.Localize( "OPS_MAP_FLUFF_MORE" ) )
				end
				local f48_local0 = f43_local5:Wait( 4000 )
				f48_local0.onComplete = function ()
					f43_local5:SetAlpha( 0, 300, LUI.EASING.inQuadratic )
					f43_local5:SetLeft( -50 * f43_local1, 300, LUI.EASING.inQuadratic )
					f43_local5:SetRight( -50 * f43_local1 + f43_local4, 300, LUI.EASING.inQuadratic )
				end
				
			end
			
		end
		
	end
	
	return self
end

function PlanetDecorations( f50_arg0 )
	local self = LUI.UIElement.new()
	self.id = "PlanetDecorations"
	self:addElement( PlanetNoise() )
	self:addElement( PlanetLines( f50_arg0 ) )
	self:addElement( PlanetPulseHL() )
	self:addElement( PlanetFluffInfo( f50_arg0 ) )
	self:addElement( PlanetPolygons() )
	local f50_local1 = MenuBuilder.BuildRegisteredType( "PulseArray" )
	self:addElement( f50_local1 )
	f50_local1:SetAlpha( 0, 200, LUI.EASING.inCubic )
	f50_local1:StartOutwardsPulse()
	f50_local1:SetBlendMode( BLEND_MODE.addWithAlpha )
	return self
end

function SADecorations( f51_arg0 )
	local self = LUI.UIElement.new()
	self.id = "SADecorations"
	self:addElement( PlanetFluffInfo( f51_arg0 ) )
	return self
end

f0_local1 = function ( f52_arg0, f52_arg1, f52_arg2, f52_arg3 )
	local f52_local0 = 0
	local f52_local1 = nil
	local f52_local2 = function ()
		if f52_local0 == f52_arg2 then
			return f52_arg3()
		else
			f52_local1()
		end
	end
	
	local f52_local3 = function ()
		local f54_local0 = f52_arg0:SetAlpha( f52_local0 % 2, f52_arg1 )
		f52_local0 = f52_local0 + 1
		f54_local0.onComplete = f52_local2
	end
	
	f52_local3()
end

function PlanetPolygons()
	local self = LUI.UIElement.new()
	self.id = "PlanetPolygons"
	for f55_local1 = 0, 2, 1 do
		local f55_local4 = f55_local1
		local f55_local5 = LUI.UIImage.new( {
			material = RegisterMaterial( "ops_map_scr_planet_clouds_1" ),
			topAnchor = true,
			bottomAnchor = true,
			leftAnchor = true,
			rightAnchor = true,
			top = 0,
			bottom = 0,
			left = 0,
			right = 0
		} )
		self:addElement( f55_local5 )
		f55_local5:SetScale( -0.1 * f55_local4 )
		f55_local5:SetBlendMode( BLEND_MODE.addWithAlpha )
		local f55_local6, f55_local7, f55_local8 = nil
		if f55_local4 % 2 == 0 then
			local f55_local9 = 0.8
			local f55_local10 = 0.64
			f55_local8 = 0.16
			f55_local7 = f55_local10
			f55_local6 = f55_local9
		elseif f55_local4 % 2 == 1 then
			local f55_local9 = 0.26
			local f55_local10 = 0.63
			f55_local8 = 0.63
			f55_local7 = f55_local10
			f55_local6 = f55_local9
		end
		f55_local5:SetRGBFromTable( {
			r = f55_local6,
			g = f55_local7,
			b = f55_local8
		} )
		local f55_local9 = nil
		local f55_local10 = function ()
			local f56_local0 = f55_local5:Wait( 50 + 200 * f55_local4 )
			f56_local0.onComplete = function ()
				local f57_local0 = function ()
					f0_local1( f55_local5, 50, 3, f55_local9 )
				end
				
				f0_local1( f55_local5, 50, 2, function ()
					local f59_local0 = 360 * math.random()
					f55_local5:SetZRotation( f59_local0 )
					local f59_local1
					if math.random() > 0.5 then
						f59_local1 = 1
						if not f59_local1 then
						
						else
							local f59_local2 = f55_local5:SetZRotation( f59_local0 + f59_local1 * (10 + 60 * math.random()), 50 + 50 * math.random(), LUI.EASING.inOutQuartic )
							f59_local2.onComplete = function ()
								local f60_local0 = f55_local5:Wait( 2000 + 600 * f55_local4 )
								f60_local0.onComplete = f57_local0
							end
							
						end
					end
					f59_local1 = -1
				end )
			end
			
		end
		
		f55_local10()
	end
	return self
end

function SaturnRings()
	local self = LUI.UIImage.new( {
		material = RegisterMaterial( "ops_map_scr_planet_rings_1" )
	} )
	self:SetAlpha( 0.3 )
	self:SetRGBFromTable( {
		r = 0.26,
		g = 0.63,
		b = 0.63
	} )
	self:SetBlendMode( BLEND_MODE.addWithAlpha )
	self:SetAnchors( -0.6, -0.6, -0.6, -0.6 )
	self:SetXRotation( -80 )
	self:SetYRotation( -20 )
	return self
end

function UranusRings()
	local self = LUI.UIImage.new( {
		material = RegisterMaterial( "ops_map_scr_planet_rings_1" )
	} )
	self:SetRGBFromTable( {
		r = 0.26,
		g = 0.63,
		b = 0.63
	} )
	self:SetAlpha( 0.3 )
	self:SetBlendMode( BLEND_MODE.addWithAlpha )
	self:SetAnchors( -0.2, -0.2, -0.2, -0.2 )
	self:SetXRotation( 20 )
	self:SetYRotation( -100 )
	return self
end

function SunFlare()
	local self = LUI.UIImage.new( {
		material = RegisterMaterial( "ops_map_scr_sun_flare_1" )
	} )
	self:SetAlpha( 0 )
	self:SetBlendMode( BLEND_MODE.addWithAlpha )
	self:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, -500, 500, -100, 100 )
	local f63_local1 = LUI.DataSourceInControllerModel.new( "cg.SP.opsMap.distanceFromSun" )
	self:SubscribeToModel( f63_local1:GetModel( 0 ), function ( f64_arg0 )
		local f64_local0 = 1 - DataModel.GetModelValue( f64_arg0 )
		self:SetAlpha( f64_local0 * f64_local0 * f64_local0 )
	end )
	return self
end

function ShipAssaultCallout()
	local f65_local0 = MenuBuilder.BuildRegisteredType( "OpsMapIconSA", {
		controllerIndex = controllerIndex
	} )
	f65_local0:SetScale( -0.6 )
	return f65_local0
end

function JackalArenaCallout()
	local f66_local0 = MenuBuilder.BuildRegisteredType( "OpsMapIconJA", {
		controllerIndex = controllerIndex
	} )
	f66_local0:SetScale( -0.6 )
	return f66_local0
end

function MissionCallout()
	return MenuBuilder.BuildRegisteredType( "OpsMapIconML", {
		controllerIndex = controllerIndex
	} )
end

function POI( f68_arg0, f68_arg1 )
	local f68_local0 = string.match( f68_arg1.poi.map, "^sa_" )
	local f68_local1 = string.match( f68_arg1.poi.map, "^ja_" )
	local f68_local2 = f68_local0 or f68_local1
	local f68_local3 = f68_arg1.poi.category == "mission"
	local f68_local4 = f68_local3 and f68_arg1.poi.missionState == "complete"
	local self = LUI.UIElement.new( {
		topAnchor = true,
		bottomAnchor = true,
		leftAnchor = true,
		rightAnchor = true,
		top = 0,
		bottom = 0,
		left = 0,
		right = 0
	} )
	local f68_local6, f68_local7, f68_local8, f68_local9 = nil
	if not f68_local3 then
		local f68_local10 = f68_arg1.poi.image
		if f68_local4 and #f68_arg1.poi.imageComplete > 0 then
			f68_local10 = f68_arg1.poi.imageComplete
		end
		f68_local8 = f68_local10 and #f68_local10 > 0
		if f68_local8 then
			f68_local6 = LUI.UIImage.new( {
				material = RegisterMaterial( f68_local10 ),
				topAnchor = true,
				bottomAnchor = true,
				leftAnchor = true,
				rightAnchor = true,
				top = 0,
				bottom = 0,
				left = 0,
				right = 0
			} )
			if f68_local2 then
				f68_local6:SetScale( 0.25 )
			end
			f68_local6:SetBlendMode( BLEND_MODE.addWithAlpha )
			f68_local6:RegisterAnimationSequence( "flickerOff", {
				{
					function ()
						return f68_local6:SetAlpha( 0, 80 )
					end,
					function ()
						return f68_local6:SetAlpha( 1, 40 )
					end,
					function ()
						return f68_local6:SetAlpha( 0, 80 )
					end,
					function ()
						return f68_local6:SetAlpha( 1, 0 )
					end,
					function ()
						return f68_local6:SetAlpha( 0, 80 )
					end
				}
			} )
			f68_local6:RegisterAnimationSequence( "flickerOn", {
				{
					function ()
						return f68_local6:SetAlpha( 0, 80 )
					end,
					function ()
						return f68_local6:SetAlpha( 1, 40 )
					end,
					function ()
						return f68_local6:SetAlpha( 0, 120 )
					end,
					function ()
						return f68_local6:SetAlpha( 1, 0 )
					end,
					function ()
						return f68_local6:SetAlpha( 0, 80 )
					end,
					function ()
						return f68_local6:SetAlpha( 1, 40 )
					end
				}
			} )
			self:addElement( f68_local6 )
		end
		local f68_local11 = f68_arg1.poi.imageCloseUp
		if f68_local4 and #f68_arg1.poi.imageCompleteCloseUp > 0 then
			f68_local11 = f68_arg1.poi.imageCompleteCloseUp
		end
		f68_local9 = f68_local11 and #f68_local11 > 0
		if f68_local9 then
			f68_local7 = LUI.UIImage.new( {
				material = RegisterMaterial( f68_local11 ),
				alpha = 0
			} )
			if f68_local2 then
				local f68_local12 = 1
				local f68_local13 = 1.75
				f68_local7:SetLeftAnchor( -0.5 )
				f68_local7:SetRightAnchor( -0.5 )
				f68_local7:SetScale( f68_local12 )
				f68_local7:addEventHandler( "button_over", function ( f80_arg0, f80_arg1 )
					f80_arg0:SetScale( f68_local13, 100 )
				end )
				f68_local7:addEventHandler( "button_up", function ( f81_arg0, f81_arg1 )
					f81_arg0:SetScale( f68_local12, 100 )
				end )
			end
			f68_local7:SetBlendMode( BLEND_MODE.addWithAlpha )
			f68_local7:RegisterAnimationSequence( "resIn", {
				{
					function ()
						f68_local7:SetDotPitchX( 9 )
						f68_local7:SetDotPitchY( 14 )
						f68_local7:SetDotPitchMode( 0 )
						f68_local7:SetDotPitchContrast( 2 )
						f68_local7:SetAlpha( 1, 200 )
						f68_local7:SetDotPitchContrast( 1, 200 )
						return f68_local7:SetDotPitchX( 20, 200 )
					end,
					function ()
						f68_local7:SetDotPitchY( 40, 200 )
						return f68_local7:SetDotPitchX( 6, 200 )
					end,
					function ()
						f68_local7:SetDotPitchY( 2, 100 )
						return f68_local7:SetDotPitchContrast( 0, 100 )
					end
				}
			} )
			f68_local7:RegisterAnimationSequence( "flickerOff", {
				{
					function ()
						return f68_local7:SetAlpha( 0, 80 )
					end,
					function ()
						return f68_local7:SetAlpha( 1, 40 )
					end,
					function ()
						return f68_local7:SetAlpha( 0, 80 )
					end,
					function ()
						return f68_local7:SetAlpha( 1, 0 )
					end,
					function ()
						return f68_local7:SetAlpha( 0, 80 )
					end
				}
			} )
			self:addElement( f68_local7 )
		end
	end
	if f68_arg1.poi.name == "Saturn" then
		self:addElement( SaturnRings() )
	elseif f68_arg1.poi.name == "Uranus" then
		self:addElement( UranusRings() )
	elseif f68_arg1.poi.name == "Sun" then
		self:addElement( SunFlare() )
	end
	if f68_arg1.poi.name ~= "Sun" then
		self:SetDotPitchX( 6 )
		self:SetDotPitchY( 3 )
		self:SetDotPitchMode( 0 )
		self:SetDotPitchContrast( 0.2 )
	end
	if f68_local3 then
		local f68_local10 = nil
		if f68_local0 then
			f68_local10 = ShipAssaultCallout()
		elseif f68_local1 then
			f68_local10 = JackalArenaCallout()
		else
			f68_local10 = MissionCallout()
		end
		self:addElement( f68_local10 )
		if f68_local4 then
			self:SetAlpha( 0.3 )
			ACTIONS.AnimateSequence( f68_local10, "Completed" )
		else
			ACTIONS.AnimateSequence( f68_local10, "Animate" )
		end
	end
	local f68_local10 = f68_arg1.poi.category == "planet"
	local f68_local11 = f68_arg1.poi.category == "moon"
	if f68_local11 or f68_local10 or f68_local2 then
		self:registerEventHandler( "button_over", function ( element, event )
			if not element.decorations then
				if f68_local10 or f68_local11 then
					element.decorations = PlanetDecorations( f68_arg1.poi )
				elseif f68_local2 then
					element.decorations = SADecorations( f68_arg1.poi )
				end
				element:addElement( element.decorations )
			else
				element.decorations:SetAlpha( 1, 50 )
			end
			Engine.PlaySound( "ui_map_highlight" )
		end )
		self:registerEventHandler( "button_up", function ( element, event )
			if element.decorations then
				element.decorations:RegisterAnimationSequence( "off", {
					{
						function ()
							return element.decorations:SetAlpha( 0, 20 + math.random() * 50 )
						end,
						function ()
							return element.decorations:SetAlpha( 1, 20 + math.random() * 50 )
						end,
						function ()
							return element.decorations:SetAlpha( 0, 20 + math.random() * 50 )
						end,
						function ()
							return element.decorations:SetAlpha( 1, 20 + math.random() * 50 )
						end,
						function ()
							return element.decorations:SetAlpha( 0, 20 + math.random() * 50 )
						end,
						function ()
							element.decorations:closeTree()
							element.decorations = nil
						end
					}
				} )
				element.decorations:AnimateSequence( "off" )
			end
		end )
	elseif f68_local3 then
		self:registerEventHandler( "button_over", function ( element, event )
			Engine.PlaySound( "ui_map_highlight" )
		end )
	end
	self:registerEventHandler( "zoomed_in", function ( element, event )
		if f68_local8 and f68_local9 then
			f68_local6:AnimateSequence( "flickerOff" )
		end
		if f68_local9 then
			f68_local7:AnimateSequence( "resIn" )
		end
	end )
	self:registerEventHandler( "zoomed_out", function ( element, event )
		if f68_local8 and f68_local9 then
			f68_local6:AnimateSequence( "flickerOn" )
		end
		if f68_local9 then
			f68_local7:AnimateSequence( "flickerOff" )
		end
	end )
	return self
end

MenuBuilder.registerType( "POI", POI )
MenuBuilder.registerType( "POIName", POIName )
MenuBuilder.registerType( "OpsMapSidePane", OpsMapSidePane )
MenuBuilder.registerType( "OpsMapOverlay2D", OpsMapOverlay2D )
LockTable( _M )
