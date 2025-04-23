local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ( f1_arg0 )
	
end

f0_local1 = function ( f2_arg0 )
	
end

f0_local2 = function ( f3_arg0 )
	f0_local1( f3_arg0 )
end

local f0_local3 = function ( f4_arg0, f4_arg1, f4_arg2, f4_arg3, f4_arg4, f4_arg5 )
	if f4_arg2 ~= nil then
		local f4_local0 = ""
		if f4_arg2 == ShipCribUtils.MostWantedStates.LOCKED then
			local f4_local1 = Engine.Localize
			local f4_local2 = f4_arg4
			local f4_local3 = Engine.Localize
			local f4_local4 = f4_arg0:GetDataSource()
			f4_local0 = f4_local1( f4_local2, f4_local3( f4_local4.bioIntelLocked:GetValue( f4_arg5 ) ) )
		elseif f4_arg2 == ShipCribUtils.MostWantedStates.VIEWED or f4_arg2 == ShipCribUtils.MostWantedStates.OBTAINED then
			local f4_local1 = Engine.Localize
			local f4_local2 = f4_arg4
			local f4_local3 = Engine.Localize
			local f4_local4 = f4_arg0:GetDataSource()
			f4_local0 = f4_local1( f4_local2, f4_local3( f4_local4.bioIntelUnlocked:GetValue( f4_arg5 ) ) )
		elseif f4_arg2 == ShipCribUtils.MostWantedStates.INTELVIEWED_1 or f4_arg2 == ShipCribUtils.MostWantedStates.INTELOBTAINED_1 then
			local f4_local1 = Engine.Localize
			local f4_local2 = f4_arg4
			local f4_local3 = Engine.Localize
			local f4_local4 = f4_arg0:GetDataSource()
			f4_local0 = f4_local1( f4_local2, f4_local3( f4_local4.bioIntel1:GetValue( f4_arg5 ) ) )
		elseif f4_arg2 == ShipCribUtils.MostWantedStates.INTELVIEWED_2 or f4_arg2 == ShipCribUtils.MostWantedStates.INTELOBTAINED_2 then
			local f4_local1 = Engine.Localize
			local f4_local2 = f4_arg4
			local f4_local3 = Engine.Localize
			local f4_local4 = f4_arg0:GetDataSource()
			f4_local0 = f4_local1( f4_local2, f4_local3( f4_local4.bioIntel2:GetValue( f4_arg5 ) ) )
		elseif f4_arg2 == ShipCribUtils.MostWantedStates.INTELVIEWED_3 or f4_arg2 == ShipCribUtils.MostWantedStates.INTELOBTAINED_3 then
			local f4_local1 = Engine.Localize
			local f4_local2 = f4_arg4
			local f4_local3 = Engine.Localize
			local f4_local4 = f4_arg0:GetDataSource()
			f4_local0 = f4_local1( f4_local2, f4_local3( f4_local4.bioIntel3:GetValue( f4_arg5 ) ) )
		elseif f4_arg2 == ShipCribUtils.MostWantedStates.INTELVIEWED_4 or f4_arg2 == ShipCribUtils.MostWantedStates.INTELOBTAINED_4 then
			local f4_local1 = Engine.Localize
			local f4_local2 = f4_arg4
			local f4_local3 = Engine.Localize
			local f4_local4 = f4_arg0:GetDataSource()
			f4_local0 = f4_local1( f4_local2, f4_local3( f4_local4.bioIntel4:GetValue( f4_arg5 ) ) )
		end
		f4_arg1:setText( f4_local0, 0 )
	end
end

function PostLoadFunc( f5_arg0, f5_arg1, f5_arg2 )
	f5_arg0:SubscribeToModelThroughElement( f5_arg0, "state", function ()
		local f6_local0 = f5_arg0:GetDataSource()
		f6_local0 = f6_local0.state:GetValue( f5_arg1 )
		if f6_local0 ~= nil then
			if f6_local0 == ShipCribUtils.MostWantedStates.LOCKED then
				f0_local0( f5_arg0 )
			elseif f6_local0 == ShipCribUtils.MostWantedStates.OBTAINED then
				f0_local1( f5_arg0 )
			elseif f6_local0 == ShipCribUtils.MostWantedStates.VIEWED then
				f0_local2( f5_arg0 )
			end
		end
	end )
	f5_arg0.Name:SubscribeToModelThroughElement( f5_arg0, "name", function ()
		ShipCribUtils.UpdateTargetName( f5_arg0, f5_arg0.Name, f5_arg1 )
	end )
	f5_arg0.Bio:SubscribeToModelThroughElement( f5_arg0, "bio", function ()
		local f8_local0 = f5_arg0:GetDataSource()
		f0_local3( f5_arg0, f5_arg0.Bio, f8_local0.state:GetValue( f5_arg1 ), "bio", "MOSTWANTED_LABEL_BIO", f5_arg1 )
	end )
	f5_arg0.Vessel:SubscribeToModelThroughElement( f5_arg0, "vessel", function ()
		ShipCribUtils.UpdateVesselName( f5_arg0, f5_arg0.Vessel, f5_arg1 )
	end )
	f5_arg0.Rank:SubscribeToModelThroughElement( f5_arg0, "rank", function ()
		local f10_local0 = f5_arg0:GetDataSource()
		f10_local0 = f10_local0.rank:GetValue( f5_arg1 )
		if f10_local0 ~= nil then
			f5_arg0.Rank:setText( ToUpperCase( Engine.Localize( "MOSTWANTED_LABEL_RANK", Engine.Localize( f10_local0 ) ) ), 0 )
		end
	end )
	f5_arg0.Status:SubscribeToModelThroughElement( f5_arg0, "state", function ()
		local f11_local0 = f5_arg0:GetDataSource()
		f11_local0 = f11_local0.state:GetValue( f5_arg1 )
		local f11_local1 = f5_arg0:GetDataSource()
		f11_local1 = f11_local1.identifier:GetValue( f5_arg1 )
		if f11_local0 ~= nil then
			local f11_local2 = "MOSTWANTED_STATUS_ALIVE"
			local f11_local3 = "StatusNormal"
			if f11_local0 == ShipCribUtils.MostWantedStates.LOCKED then
				if f11_local1 ~= ShipCribUtils.MostWantedSpecialCards.SALEN_KOCH and f11_local1 ~= ShipCribUtils.MostWantedSpecialCards.RIAH then
					f11_local2 = "MOSTWANTED_STATUS_UNKNOWN"
				end
			elseif f11_local0 == ShipCribUtils.MostWantedStates.OBTAINED or f11_local0 == ShipCribUtils.MostWantedStates.VIEWED then
				f11_local2 = "MOSTWANTED_STATUS_DECEASED"
				f11_local3 = "StatusDeceased"
			end
			f5_arg0.Status:setText( ToUpperCase( Engine.Localize( f11_local2 ), 0 ) )
			ACTIONS.AnimateSequence( f5_arg0, f11_local3 )
		end
	end )
	if IsLanguageOversizedFont() then
		f5_arg0.Name:SetTop( _1080p * 15, 0 )
		f5_arg0.Name:SetBottom( _1080p * 53, 0 )
		f5_arg0.Status:SetTop( _1080p * 665, 0 )
		f5_arg0.Status:SetBottom( _1080p * 700, 0 )
		f5_arg0.Rank:SetTop( _1080p * 160, 0 )
		f5_arg0.Rank:SetBottom( _1080p * 183, 0 )
		f5_arg0.Vessel:SetTop( _1080p * 210, 0 )
		f5_arg0.Vessel:SetBottom( _1080p * 233, 0 )
	end
end

function mostWantedCardsBoardWidget( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 1000 * _1080p, 0, 780 * _1080p )
	self.id = "mostWantedCardsBoardWidget"
	self._animationSets = {}
	self._sequences = {}
	local f12_local1 = controller and controller.controllerIndex
	if not f12_local1 and not Engine.InFrontend() then
		f12_local1 = self:getRootController()
	end
	assert( f12_local1 )
	local f12_local2 = self
	local BlurBG = nil
	
	BlurBG = LUI.UIBlur.new()
	BlurBG.id = "BlurBG"
	BlurBG:SetRGBFromInt( 2500134, 0 )
	BlurBG:SetUseAA( true )
	BlurBG:SetBlurStrength( 1, 0 )
	self:addElement( BlurBG )
	self.BlurBG = BlurBG
	
	local Background = nil
	
	Background = LUI.UIImage.new()
	Background.id = "Background"
	Background:SetRGBFromInt( 0, 0 )
	Background:SetAlpha( 0.2, 0 )
	Background:SetUseAA( true )
	self:addElement( Background )
	self.Background = Background
	
	local BackgroundHeader = nil
	
	BackgroundHeader = LUI.UIImage.new()
	BackgroundHeader.id = "BackgroundHeader"
	BackgroundHeader:SetRGBFromInt( 0, 0 )
	BackgroundHeader:SetAlpha( 0.82, 0 )
	BackgroundHeader:SetUseAA( true )
	BackgroundHeader:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * -5, _1080p * -5, _1080p * -5, _1080p * 75 )
	self:addElement( BackgroundHeader )
	self.BackgroundHeader = BackgroundHeader
	
	local BackgroundInfoReflect = nil
	
	BackgroundInfoReflect = LUI.UIImage.new()
	BackgroundInfoReflect.id = "BackgroundInfoReflect"
	BackgroundInfoReflect:SetRGBFromInt( 6710886, 0 )
	BackgroundInfoReflect:SetAlpha( 0.45, 0 )
	BackgroundInfoReflect:SetUseAA( true )
	BackgroundInfoReflect:SetBlendMode( BLEND_MODE.addWithAlpha )
	BackgroundInfoReflect:SetAnchorsAndPosition( 1, 0, 1, 0, _1080p * -450, 0, _1080p * -700, 0 )
	self:addElement( BackgroundInfoReflect )
	self.BackgroundInfoReflect = BackgroundInfoReflect
	
	local BackgroundInfo = nil
	
	BackgroundInfo = LUI.UIImage.new()
	BackgroundInfo.id = "BackgroundInfo"
	BackgroundInfo:SetRGBFromInt( 6710886, 0 )
	BackgroundInfo:SetAlpha( 0.25, 0 )
	BackgroundInfo:SetUseAA( true )
	BackgroundInfo:SetBlendMode( BLEND_MODE.addWithAlpha )
	BackgroundInfo:SetAnchorsAndPosition( 1, 0, 1, 0, _1080p * -454, _1080p * -4, _1080p * -710, _1080p * -10 )
	self:addElement( BackgroundInfo )
	self.BackgroundInfo = BackgroundInfo
	
	local BackgroundPortrait = nil
	
	BackgroundPortrait = LUI.UIImage.new()
	BackgroundPortrait.id = "BackgroundPortrait"
	BackgroundPortrait:SetRGBFromInt( 3355443, 0 )
	BackgroundPortrait:SetAlpha( 0.8, 0 )
	BackgroundPortrait:SetUseAA( true )
	BackgroundPortrait:SetBlendMode( BLEND_MODE.addWithAlpha )
	BackgroundPortrait:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 550, _1080p * 80, _1080p * 780 )
	self:addElement( BackgroundPortrait )
	self.BackgroundPortrait = BackgroundPortrait
	
	local ImageBottom = nil
	
	ImageBottom = LUI.UIImage.new()
	ImageBottom.id = "ImageBottom"
	ImageBottom:SetRGBFromInt( 0, 0 )
	ImageBottom:SetAlpha( 0.15, 0 )
	ImageBottom:SetUseAA( true )
	ImageBottom:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -15, _1080p * 505, _1080p * 590, _1080p * 745 )
	self:addElement( ImageBottom )
	self.ImageBottom = ImageBottom
	
	local Image = nil
	
	Image = LUI.UIImage.new()
	Image.id = "Image"
	Image:SetAlpha( 0.8, 0 )
	Image:SetDotPitchEnabled( true )
	Image:SetDotPitchX( 0, 0 )
	Image:SetDotPitchY( 0, 0 )
	Image:SetDotPitchContrast( 0, 0 )
	Image:SetDotPitchMode( 0 )
	Image:SetUseAA( true )
	Image:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 7, _1080p * 527, _1080p * 85, _1080p * 605 )
	Image:SubscribeToModelThroughElement( self, "image", function ()
		local f13_local0 = self:GetDataSource()
		f13_local0 = f13_local0.image:GetValue( f12_local1 )
		if f13_local0 ~= nil then
			Image:setImage( RegisterMaterial( f13_local0 ), 0 )
		end
	end )
	self:addElement( Image )
	self.Image = Image
	
	local ImageExpand = nil
	
	ImageExpand = LUI.UIImage.new()
	ImageExpand.id = "ImageExpand"
	ImageExpand:SetRGBFromInt( 3947580, 0 )
	ImageExpand:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 15, _1080p * 535, _1080p * 80, _1080p * 600 )
	self:addElement( ImageExpand )
	self.ImageExpand = ImageExpand
	
	local StatusBgDeceased = nil
	
	StatusBgDeceased = LUI.UIImage.new()
	StatusBgDeceased.id = "StatusBgDeceased"
	StatusBgDeceased:SetRGBFromInt( 14682891, 0 )
	StatusBgDeceased:SetAlpha( 0.9, 0 )
	StatusBgDeceased:SetUseAA( true )
	StatusBgDeceased:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 15, _1080p * 527, _1080p * 610, _1080p * 751 )
	self:addElement( StatusBgDeceased )
	self.StatusBgDeceased = StatusBgDeceased
	
	local StatusBg = nil
	
	StatusBg = LUI.UIImage.new()
	StatusBg.id = "StatusBg"
	StatusBg:SetRGBFromInt( 10027008, 0 )
	StatusBg:SetAlpha( 0.85, 0 )
	StatusBg:SetUseAA( true )
	StatusBg:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 15, _1080p * 527, _1080p * 611, _1080p * 751 )
	self:addElement( StatusBg )
	self.StatusBg = StatusBg
	
	local Rank = nil
	
	Rank = LUI.UIStyledText.new()
	Rank.id = "Rank"
	Rank:SetAlpha( 0.82, 0 )
	Rank:setText( "Captain", 0 )
	Rank:SetFontSize( 30 * _1080p )
	Rank:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	Rank:SetAlignment( LUI.Alignment.Left )
	Rank:SetDecodeLetterLength( 30 )
	Rank:SetDecodeMaxRandChars( 5 )
	Rank:SetDecodeUpdatesPerLetter( 5 )
	Rank:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 559, _1080p * -24, _1080p * 122, _1080p * 152 )
	self:addElement( Rank )
	self.Rank = Rank
	
	local Name = nil
	
	Name = LUI.UIStyledText.new()
	Name.id = "Name"
	Name:SetAlpha( 0.8, 0 )
	Name:setText( "Name", 0 )
	Name:SetFontSize( 50 * _1080p )
	Name:SetFont( FONTS.GetFont( FONTS.MainExtended.File ) )
	Name:SetAlignment( LUI.Alignment.Left )
	Name:SetDecodeLetterLength( 30 )
	Name:SetDecodeMaxRandChars( 5 )
	Name:SetDecodeUpdatesPerLetter( 5 )
	Name:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 15, _1080p * 530, _1080p * 7.5, _1080p * 57.5 )
	self:addElement( Name )
	self.Name = Name
	
	local Bio = nil
	
	Bio = LUI.UIStyledText.new()
	Bio.id = "Bio"
	Bio:SetAlpha( 0.8, 0 )
	Bio:setText( "Biography", 0 )
	Bio:SetFontSize( 24 * _1080p )
	Bio:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	Bio:SetAlignment( LUI.Alignment.Left )
	Bio:SetDecodeLetterLength( 30 )
	Bio:SetDecodeMaxRandChars( 5 )
	Bio:SetDecodeUpdatesPerLetter( 5 )
	Bio:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 559, _1080p * -24, _1080p * 333, _1080p * 357 )
	self:addElement( Bio )
	self.Bio = Bio
	
	local Vessel = nil
	
	Vessel = LUI.UIStyledText.new()
	Vessel.id = "Vessel"
	Vessel:SetAlpha( 0.8, 0 )
	Vessel:setText( "SDS Charon", 0 )
	Vessel:SetFontSize( 30 * _1080p )
	Vessel:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	Vessel:SetAlignment( LUI.Alignment.Left )
	Vessel:SetDecodeLetterLength( 30 )
	Vessel:SetDecodeMaxRandChars( 5 )
	Vessel:SetDecodeUpdatesPerLetter( 5 )
	Vessel:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 559.5, _1080p * -23.5, _1080p * 232, _1080p * 262 )
	self:addElement( Vessel )
	self.Vessel = Vessel
	
	local Status = nil
	
	Status = LUI.UIStyledText.new()
	Status.id = "Status"
	Status:SetAlpha( 0.8, 0 )
	Status:setText( "STATUS UNKNOWN", 0 )
	Status:SetFontSize( 38 * _1080p )
	Status:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	Status:SetAlignment( LUI.Alignment.Center )
	Status:SetDecodeLetterLength( 30 )
	Status:SetDecodeMaxRandChars( 5 )
	Status:SetDecodeUpdatesPerLetter( 5 )
	Status:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 15, _1080p * 515, _1080p * 661.5, _1080p * 699.5 )
	self:addElement( Status )
	self.Status = Status
	
	local Corner1 = nil
	
	Corner1 = LUI.UIBorder.new( {
		borderThicknessLeft = _1080p * 1,
		borderThicknessRight = _1080p * 1,
		borderThicknessTop = _1080p * 1,
		borderThicknessBottom = _1080p * 1
	} )
	Corner1.id = "Corner1"
	Corner1:SetAlpha( 0.6, 0 )
	Corner1:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -15, 0, _1080p * -15, 0 )
	self:addElement( Corner1 )
	self.Corner1 = Corner1
	
	local Corner2 = nil
	
	Corner2 = LUI.UIBorder.new( {
		borderThicknessLeft = _1080p * 1,
		borderThicknessRight = _1080p * 1,
		borderThicknessTop = _1080p * 1,
		borderThicknessBottom = _1080p * 1
	} )
	Corner2.id = "Corner2"
	Corner2:SetAlpha( 0.6, 0 )
	Corner2:SetAnchorsAndPosition( 1, 0, 0, 1, 0, _1080p * 15, _1080p * -15, 0 )
	self:addElement( Corner2 )
	self.Corner2 = Corner2
	
	local Corner4 = nil
	
	Corner4 = LUI.UIBorder.new( {
		borderThicknessLeft = _1080p * 1,
		borderThicknessRight = _1080p * 1,
		borderThicknessTop = _1080p * 1,
		borderThicknessBottom = _1080p * 1
	} )
	Corner4.id = "Corner4"
	Corner4:SetAlpha( 0.6, 0 )
	Corner4:SetAnchorsAndPosition( 0, 1, 1, 0, _1080p * -15, 0, 0, _1080p * 15 )
	self:addElement( Corner4 )
	self.Corner4 = Corner4
	
	local Corner3 = nil
	
	Corner3 = LUI.UIBorder.new( {
		borderThicknessLeft = _1080p * 1,
		borderThicknessRight = _1080p * 1,
		borderThicknessTop = _1080p * 1,
		borderThicknessBottom = _1080p * 1
	} )
	Corner3.id = "Corner3"
	Corner3:SetAlpha( 0.6, 0 )
	Corner3:SetAnchorsAndPosition( 1, 0, 1, 0, 0, _1080p * 15, 0, _1080p * 15 )
	self:addElement( Corner3 )
	self.Corner3 = Corner3
	
	local f12_local23 = nil
	if Engine.IsConsoleGame() then
		f12_local23 = LUI.UIBorder.new( {
			borderThicknessLeft = _1080p * 1,
			borderThicknessRight = _1080p * 0,
			borderThicknessTop = _1080p * 1,
			borderThicknessBottom = _1080p * 1
		} )
		f12_local23.id = "Edgeleft"
		f12_local23:SetAlpha( 0.6, 0 )
		f12_local23:SetBorderThicknessRight( _1080p * 0, 0 )
		f12_local23:SetAnchorsAndPosition( 0, 1, 0, 0, _1080p * -30, _1080p * -10, _1080p * 10, _1080p * -10 )
		self:addElement( f12_local23 )
		self.Edgeleft = f12_local23
	end
	local Edgeright = nil
	
	Edgeright = LUI.UIBorder.new( {
		borderThicknessLeft = _1080p * 0,
		borderThicknessRight = _1080p * 1,
		borderThicknessTop = _1080p * 1,
		borderThicknessBottom = _1080p * 1
	} )
	Edgeright.id = "Edgeright"
	Edgeright:SetAlpha( 0.6, 0 )
	Edgeright:SetBorderThicknessLeft( _1080p * 0, 0 )
	Edgeright:SetAnchorsAndPosition( 1, 0, 0, 0, _1080p * 10, _1080p * 30, _1080p * 10, _1080p * -10 )
	self:addElement( Edgeright )
	self.Edgeright = Edgeright
	
	local BarCodeTopReflect = nil
	
	BarCodeTopReflect = LUI.UIImage.new()
	BarCodeTopReflect.id = "BarCodeTopReflect"
	BarCodeTopReflect:SetAlpha( 0.4, 0 )
	BarCodeTopReflect:setImage( RegisterMaterial( "hud_link_analysis_bar_code_top" ), 0 )
	BarCodeTopReflect:SetBlendMode( BLEND_MODE.addWithAlpha )
	BarCodeTopReflect:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -457, _1080p * -7, 0, _1080p * 80 )
	self:addElement( BarCodeTopReflect )
	self.BarCodeTopReflect = BarCodeTopReflect
	
	local BarCodeTop = nil
	
	BarCodeTop = LUI.UIImage.new()
	BarCodeTop.id = "BarCodeTop"
	BarCodeTop:SetAlpha( 0.35, 0 )
	BarCodeTop:setImage( RegisterMaterial( "hud_link_analysis_bar_code_top" ), 0 )
	BarCodeTop:SetBlendMode( BLEND_MODE.blend )
	BarCodeTop:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -465, _1080p * -15, _1080p * -10, _1080p * 70 )
	self:addElement( BarCodeTop )
	self.BarCodeTop = BarCodeTop
	
	local BarCodeBottom = nil
	
	BarCodeBottom = LUI.UIImage.new()
	BarCodeBottom.id = "BarCodeBottom"
	BarCodeBottom:SetAlpha( 0.1, 0 )
	BarCodeBottom:setImage( RegisterMaterial( "hud_link_analysis_bar_code_bot" ), 0 )
	BarCodeBottom:SetAnchorsAndPosition( 1, 0, 1, 0, _1080p * -157.6, _1080p * -10, _1080p * -92, _1080p * -10 )
	self:addElement( BarCodeBottom )
	self.BarCodeBottom = BarCodeBottom
	
	local f12_local28 = nil
	if Engine.IsConsoleGame() then
		f12_local28 = LUI.UIImage.new()
		f12_local28.id = "QRCodeLine"
		f12_local28:SetUseAA( true )
		f12_local28:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -220, _1080p * -30, _1080p * 374, _1080p * 377 )
		self:addElement( f12_local28 )
		self.QRCodeLine = f12_local28
	end
	local f12_local29 = nil
	if Engine.IsConsoleGame() then
		f12_local29 = LUI.UIBorder.new( {
			borderThicknessLeft = _1080p * 3,
			borderThicknessRight = _1080p * 3,
			borderThicknessTop = _1080p * 3,
			borderThicknessBottom = _1080p * 3
		} )
		f12_local29.id = "Border"
		f12_local29:SetAlpha( 0.4, 0 )
		f12_local29:SetYRotation( 12, 0 )
		f12_local29:SetBorderThicknessLeft( _1080p * 3, 0 )
		f12_local29:SetBorderThicknessRight( _1080p * 3, 0 )
		f12_local29:SetBorderThicknessTop( _1080p * 3, 0 )
		f12_local29:SetBorderThicknessBottom( _1080p * 3, 0 )
		f12_local29:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -481, _1080p * -220, _1080p * 226, _1080p * 551 )
		self:addElement( f12_local29 )
		self.Border = f12_local29
	end
	local Divider2 = nil
	
	Divider2 = LUI.UIImage.new()
	Divider2.id = "Divider2"
	Divider2:SetAlpha( 0.4, 0 )
	Divider2:SetUseAA( true )
	Divider2:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -455, _1080p * -5, _1080p * 200, _1080p * 201 )
	self:addElement( Divider2 )
	self.Divider2 = Divider2
	
	local Divider3 = nil
	
	Divider3 = LUI.UIImage.new()
	Divider3.id = "Divider3"
	Divider3:SetAlpha( 0.4, 0 )
	Divider3:SetUseAA( true )
	Divider3:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -455, _1080p * -5, _1080p * 298, _1080p * 299 )
	self:addElement( Divider3 )
	self.Divider3 = Divider3
	
	local StatusBorderTop = nil
	
	StatusBorderTop = LUI.UIBorder.new( {
		borderThicknessLeft = _1080p * 1,
		borderThicknessRight = _1080p * 1,
		borderThicknessTop = _1080p * 1,
		borderThicknessBottom = _1080p * 0
	} )
	StatusBorderTop.id = "StatusBorderTop"
	StatusBorderTop:SetAlpha( 0.5, 0 )
	StatusBorderTop:SetBorderThicknessBottom( _1080p * 0, 0 )
	StatusBorderTop:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 35, _1080p * 507, _1080p * 655, _1080p * 670 )
	self:addElement( StatusBorderTop )
	self.StatusBorderTop = StatusBorderTop
	
	local StatusBorderBottom = nil
	
	StatusBorderBottom = LUI.UIBorder.new( {
		borderThicknessLeft = _1080p * 1,
		borderThicknessRight = _1080p * 1,
		borderThicknessTop = _1080p * 0,
		borderThicknessBottom = _1080p * 1
	} )
	StatusBorderBottom.id = "StatusBorderBottom"
	StatusBorderBottom:SetAlpha( 0.5, 0 )
	StatusBorderBottom:SetBorderThicknessTop( _1080p * 0, 0 )
	StatusBorderBottom:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 35, _1080p * 507, _1080p * 692, _1080p * 707 )
	self:addElement( StatusBorderBottom )
	self.StatusBorderBottom = StatusBorderBottom
	
	local StatusCornerBox1 = nil
	
	StatusCornerBox1 = LUI.UIImage.new()
	StatusCornerBox1.id = "StatusCornerBox1"
	StatusCornerBox1:SetAlpha( 0.5, 0 )
	StatusCornerBox1:setImage( RegisterMaterial( "halo_bot_bar_mid_box" ), 0 )
	StatusCornerBox1:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 21, _1080p * 31, _1080p * 660, _1080p * 670 )
	self:addElement( StatusCornerBox1 )
	self.StatusCornerBox1 = StatusCornerBox1
	
	local StatusCornerBox2 = nil
	
	StatusCornerBox2 = LUI.UIImage.new()
	StatusCornerBox2.id = "StatusCornerBox2"
	StatusCornerBox2:SetAlpha( 0.5, 0 )
	StatusCornerBox2:setImage( RegisterMaterial( "halo_bot_bar_mid_box" ), 0 )
	StatusCornerBox2:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 510, _1080p * 520, _1080p * 660, _1080p * 670 )
	self:addElement( StatusCornerBox2 )
	self.StatusCornerBox2 = StatusCornerBox2
	
	local StatusCornerBox3 = nil
	
	StatusCornerBox3 = LUI.UIImage.new()
	StatusCornerBox3.id = "StatusCornerBox3"
	StatusCornerBox3:SetAlpha( 0.5, 0 )
	StatusCornerBox3:setImage( RegisterMaterial( "halo_bot_bar_mid_box" ), 0 )
	StatusCornerBox3:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 510, _1080p * 520, _1080p * 692, _1080p * 702 )
	self:addElement( StatusCornerBox3 )
	self.StatusCornerBox3 = StatusCornerBox3
	
	local StatusCornerBox4 = nil
	
	StatusCornerBox4 = LUI.UIImage.new()
	StatusCornerBox4.id = "StatusCornerBox4"
	StatusCornerBox4:SetAlpha( 0.5, 0 )
	StatusCornerBox4:setImage( RegisterMaterial( "halo_bot_bar_mid_box" ), 0 )
	StatusCornerBox4:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 21, _1080p * 31, _1080p * 692, _1080p * 702 )
	self:addElement( StatusCornerBox4 )
	self.StatusCornerBox4 = StatusCornerBox4
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		ImageBottom:RegisterAnimationSequence( "RefreshData", {
			{
				function ()
					return self.ImageBottom:SetAlpha( 0, 0 )
				end,
				function ()
					return self.ImageBottom:SetAlpha( 0, 250 )
				end,
				function ()
					return self.ImageBottom:SetAlpha( 0.15, 250, LUI.EASING.outQuadratic )
				end
			},
			{
				function ()
					return self.ImageBottom:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 15, _1080p * 535, _1080p * 600, _1080p * 755, 250 )
				end,
				function ()
					return self.ImageBottom:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 15, _1080p * 535, _1080p * 600, _1080p * 755, 250, LUI.EASING.outQuadratic )
				end
			}
		} )
		Image:RegisterAnimationSequence( "RefreshData", {
			{
				function ()
					return self.Image:SetAlpha( 0, 0 )
				end,
				function ()
					return self.Image:SetAlpha( 0, 250 )
				end,
				function ()
					return self.Image:SetAlpha( 1, 60 )
				end,
				function ()
					return self.Image:SetAlpha( 0, 60 )
				end,
				function ()
					return self.Image:SetAlpha( 1, 60 )
				end,
				function ()
					return self.Image:SetAlpha( 0, 30 )
				end,
				function ()
					return self.Image:SetAlpha( 0.75, 40, LUI.EASING.outQuadratic )
				end
			},
			{
				function ()
					return self.Image:SetDotPitchX( 52, 0 )
				end,
				function ()
					return self.Image:SetDotPitchX( 52, 430 )
				end,
				function ()
					return self.Image:SetDotPitchX( 0, 70, LUI.EASING.outQuadratic )
				end
			},
			{
				function ()
					return self.Image:SetDotPitchY( 43, 0 )
				end,
				function ()
					return self.Image:SetDotPitchY( 43, 430 )
				end,
				function ()
					return self.Image:SetDotPitchY( 0, 70, LUI.EASING.outQuadratic )
				end
			},
			{
				function ()
					return self.Image:SetDotPitchContrast( 0.8, 0 )
				end,
				function ()
					return self.Image:SetDotPitchContrast( 0.8, 430 )
				end,
				function ()
					return self.Image:SetDotPitchContrast( 0, 70, LUI.EASING.outQuadratic )
				end
			},
			{
				function ()
					return self.Image:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 15, _1080p * 535, _1080p * 80, _1080p * 600, 250 )
				end,
				function ()
					return self.Image:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 15, _1080p * 535, _1080p * 80, _1080p * 600, 250, LUI.EASING.outQuadratic )
				end
			}
		} )
		ImageExpand:RegisterAnimationSequence( "RefreshData", {
			{
				function ()
					return self.ImageExpand:SetAlpha( 0.3, 0 )
				end,
				function ()
					return self.ImageExpand:SetAlpha( 0.3, 250, LUI.EASING.outQuadratic )
				end,
				function ()
					return self.ImageExpand:SetAlpha( 0, 250 )
				end
			},
			{
				function ()
					return self.ImageExpand:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 15, _1080p * 535, _1080p * 339, _1080p * 341, 0 )
				end,
				function ()
					return self.ImageExpand:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 15, _1080p * 535, _1080p * 80, _1080p * 600, 250, LUI.EASING.outQuadratic )
				end,
				function ()
					return self.ImageExpand:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -15, _1080p * 505, _1080p * 70, _1080p * 590, 250 )
				end
			}
		} )
		Corner1:RegisterAnimationSequence( "RefreshData", {
			{
				function ()
					return self.Corner1:SetBorderThicknessBottom( _1080p * 0, 0 )
				end,
				function ()
					return self.Corner1:SetBorderThicknessBottom( _1080p * 1, 850 )
				end
			},
			{
				function ()
					return self.Corner1:SetBorderThicknessTop( _1080p * 0, 0 )
				end,
				function ()
					return self.Corner1:SetBorderThicknessTop( _1080p * 0, 810 )
				end,
				function ()
					return self.Corner1:SetBorderThicknessTop( _1080p * 1, 40 )
				end
			},
			{
				function ()
					return self.Corner1:SetBorderThicknessRight( _1080p * 0, 0 )
				end,
				function ()
					return self.Corner1:SetBorderThicknessRight( _1080p * 0, 810 )
				end,
				function ()
					return self.Corner1:SetBorderThicknessRight( _1080p * 1, 40 )
				end
			},
			{
				function ()
					return self.Corner1:SetBorderThicknessLeft( _1080p * 0, 0 )
				end,
				function ()
					return self.Corner1:SetBorderThicknessLeft( _1080p * 0, 810 )
				end,
				function ()
					return self.Corner1:SetBorderThicknessLeft( _1080p * 1, 40 )
				end
			},
			{
				function ()
					return self.Corner1:SetAlpha( 0, 0 )
				end,
				function ()
					return self.Corner1:SetAlpha( 0, 800 )
				end,
				function ()
					return self.Corner1:SetAlpha( 0.6, 10 )
				end
			},
			{
				function ()
					return self.Corner1:SetRGBFromInt( 14876672, 580 )
				end
			}
		} )
		Corner2:RegisterAnimationSequence( "RefreshData", {
			{
				function ()
					return self.Corner2:SetRGBFromInt( 14876672, 580 )
				end
			}
		} )
		Corner4:RegisterAnimationSequence( "RefreshData", {
			{
				function ()
					return self.Corner4:SetBorderThicknessLeft( _1080p * 0, 0 )
				end,
				function ()
					return self.Corner4:SetBorderThicknessLeft( _1080p * 0, 810 )
				end,
				function ()
					return self.Corner4:SetBorderThicknessLeft( _1080p * 1, 40 )
				end
			},
			{
				function ()
					return self.Corner4:SetBorderThicknessRight( _1080p * 0, 0 )
				end,
				function ()
					return self.Corner4:SetBorderThicknessRight( _1080p * 0, 810 )
				end,
				function ()
					return self.Corner4:SetBorderThicknessRight( _1080p * 1, 40 )
				end
			},
			{
				function ()
					return self.Corner4:SetBorderThicknessTop( _1080p * 0, 0 )
				end,
				function ()
					return self.Corner4:SetBorderThicknessTop( _1080p * 0, 810 )
				end,
				function ()
					return self.Corner4:SetBorderThicknessTop( _1080p * 1, 40 )
				end
			},
			{
				function ()
					return self.Corner4:SetBorderThicknessBottom( _1080p * 0, 0 )
				end,
				function ()
					return self.Corner4:SetBorderThicknessBottom( _1080p * 0, 810 )
				end,
				function ()
					return self.Corner4:SetBorderThicknessBottom( _1080p * 1, 40 )
				end
			},
			{
				function ()
					return self.Corner4:SetAlpha( 0, 0 )
				end,
				function ()
					return self.Corner4:SetAlpha( 0, 800 )
				end,
				function ()
					return self.Corner4:SetAlpha( 0.6, 10 )
				end
			},
			{
				function ()
					return self.Corner4:SetRGBFromInt( 14876672, 580 )
				end
			}
		} )
		Corner3:RegisterAnimationSequence( "RefreshData", {
			{
				function ()
					return self.Corner3:SetRGBFromInt( 14876672, 580 )
				end
			}
		} )
		if Engine.IsConsoleGame() then
			f12_local23:RegisterAnimationSequence( "RefreshData", {
				{
					function ()
						return self.Edgeleft:SetAlpha( 0, 0 )
					end,
					function ()
						return self.Edgeleft:SetAlpha( 0, 700 )
					end,
					function ()
						return self.Edgeleft:SetAlpha( 0.6, 10 )
					end
				},
				{
					function ()
						return self.Edgeleft:SetRGBFromInt( 14876672, 580 )
					end
				},
				{
					function ()
						return self.Edgeleft:SetBorderThicknessLeft( _1080p * 3, 580 )
					end
				},
				{
					function ()
						return self.Edgeleft:SetBorderThicknessTop( _1080p * 3, 580 )
					end
				},
				{
					function ()
						return self.Edgeleft:SetBorderThicknessBottom( _1080p * 3, 580 )
					end
				},
				{
					function ()
						return self.Edgeleft:SetAnchorsAndPosition( 0, 1, 0, 0, _1080p * -30, _1080p * -10, _1080p * 374, _1080p * -403, 709 )
					end,
					function ()
						return self.Edgeleft:SetAnchorsAndPosition( 0, 1, 0, 0, _1080p * -30, _1080p * -10, _1080p * 10, _1080p * -10, 100 )
					end
				}
			} )
		end
		Edgeright:RegisterAnimationSequence( "RefreshData", {
			{
				function ()
					return self.Edgeright:SetRGBFromInt( 14876672, 580 )
				end
			},
			{
				function ()
					return self.Edgeright:SetBorderThicknessRight( _1080p * 3, 580 )
				end
			},
			{
				function ()
					return self.Edgeright:SetBorderThicknessTop( _1080p * 3, 580 )
				end
			},
			{
				function ()
					return self.Edgeright:SetBorderThicknessBottom( _1080p * 3, 580 )
				end
			}
		} )
		BarCodeTopReflect:RegisterAnimationSequence( "RefreshData", {
			{
				function ()
					return self.BarCodeTopReflect:SetAlpha( 0, 0 )
				end,
				function ()
					return self.BarCodeTopReflect:SetAlpha( 0, 500 )
				end,
				function ()
					return self.BarCodeTopReflect:SetAlpha( 0.2, 140 )
				end
			}
		} )
		BarCodeTop:RegisterAnimationSequence( "RefreshData", {
			{
				function ()
					return self.BarCodeTop:SetAlpha( 0, 0 )
				end,
				function ()
					return self.BarCodeTop:SetAlpha( 0, 500 )
				end,
				function ()
					return self.BarCodeTop:SetAlpha( 1, 20 )
				end,
				function ()
					return self.BarCodeTop:SetAlpha( 0, 20 )
				end,
				function ()
					return self.BarCodeTop:SetAlpha( 1, 20 )
				end,
				function ()
					return self.BarCodeTop:SetAlpha( 0, 20 )
				end,
				function ()
					return self.BarCodeTop:SetAlpha( 1, 20 )
				end,
				function ()
					return self.BarCodeTop:SetAlpha( 0, 20 )
				end,
				function ()
					return self.BarCodeTop:SetAlpha( 0.65, 20 )
				end
			}
		} )
		BarCodeBottom:RegisterAnimationSequence( "RefreshData", {
			{
				function ()
					return self.BarCodeBottom:SetAlpha( 0, 0 )
				end,
				function ()
					return self.BarCodeBottom:SetAlpha( 0, 640 )
				end,
				function ()
					return self.BarCodeBottom:SetAlpha( 0.2, 20 )
				end,
				function ()
					return self.BarCodeBottom:SetAlpha( 0, 20 )
				end,
				function ()
					return self.BarCodeBottom:SetAlpha( 0.2, 20 )
				end,
				function ()
					return self.BarCodeBottom:SetAlpha( 0, 20 )
				end,
				function ()
					return self.BarCodeBottom:SetAlpha( 0.2, 20 )
				end,
				function ()
					return self.BarCodeBottom:SetAlpha( 0, 20 )
				end,
				function ()
					return self.BarCodeBottom:SetAlpha( 0.2, 20 )
				end
			}
		} )
		if Engine.IsConsoleGame() then
			f12_local28:RegisterAnimationSequence( "RefreshData", {
				{
					function ()
						return self.QRCodeLine:SetAlpha( 0, 0 )
					end,
					function ()
						return self.QRCodeLine:SetAlpha( 0, 590 )
					end,
					function ()
						return self.QRCodeLine:SetAlpha( 0.6, 10 )
					end
				},
				{
					function ()
						return self.QRCodeLine:SetRGBFromInt( 14876672, 710 )
					end
				},
				{
					function ()
						return self.QRCodeLine:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -220.26, _1080p * -220.26, _1080p * 374, _1080p * 377, 589 )
					end,
					function ()
						return self.QRCodeLine:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -204, _1080p * -204, _1080p * 374, _1080p * 377, 10 )
					end,
					function ()
						return self.QRCodeLine:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -204, _1080p * -30, _1080p * 374, _1080p * 377, 109 )
					end
				}
			} )
		end
		if Engine.IsConsoleGame() then
			f12_local29:RegisterAnimationSequence( "RefreshData", {
				{
					function ()
						return self.Border:SetAlpha( 0, 0 )
					end,
					function ()
						return self.Border:SetAlpha( 0, 360 )
					end,
					function ()
						return self.Border:SetAlpha( 0.4, 20 )
					end,
					function ()
						return self.Border:SetAlpha( 0.6, 330 )
					end
				},
				{
					function ()
						return self.Border:SetRGBFromInt( 14876672, 710 )
					end
				},
				{
					function ()
						return self.Border:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -357.33, _1080p * -343.67, _1080p * 380, _1080p * 397, 379 )
					end,
					function ()
						return self.Border:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -481, _1080p * -217, _1080p * 226, _1080p * 551, 220, LUI.EASING.outQuadratic )
					end
				}
			} )
		end
		self._sequences.RefreshData = function ()
			ImageBottom:AnimateSequence( "RefreshData" )
			Image:AnimateSequence( "RefreshData" )
			ImageExpand:AnimateSequence( "RefreshData" )
			Corner1:AnimateSequence( "RefreshData" )
			Corner2:AnimateSequence( "RefreshData" )
			Corner4:AnimateSequence( "RefreshData" )
			Corner3:AnimateSequence( "RefreshData" )
			if Engine.IsConsoleGame() then
				f12_local23:AnimateSequence( "RefreshData" )
			end
			Edgeright:AnimateSequence( "RefreshData" )
			BarCodeTopReflect:AnimateSequence( "RefreshData" )
			BarCodeTop:AnimateSequence( "RefreshData" )
			BarCodeBottom:AnimateSequence( "RefreshData" )
			if Engine.IsConsoleGame() then
				f12_local28:AnimateSequence( "RefreshData" )
			end
			if Engine.IsConsoleGame() then
				f12_local29:AnimateSequence( "RefreshData" )
			end
		end
		
		StatusBgDeceased:RegisterAnimationSequence( "StatusDeceased", {
			{
				function ()
					return self.StatusBgDeceased:SetAlpha( 1, 0 )
				end,
				function ()
					return self.StatusBgDeceased:SetAlpha( 0.8, 500, LUI.EASING.outQuadratic )
				end
			},
			{
				function ()
					return self.StatusBgDeceased:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -5, _1080p * -4, _1080p * 605, _1080p * 760, 0 )
				end,
				function ()
					return self.StatusBgDeceased:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -5, _1080p * 555, _1080p * 605, _1080p * 760, 500, LUI.EASING.outQuadratic )
				end
			}
		} )
		StatusBg:RegisterAnimationSequence( "StatusDeceased", {
			{
				function ()
					return self.StatusBg:SetAlpha( 0.4, 0 )
				end,
				function ()
					return self.StatusBg:SetAlpha( 0, 500 )
				end
			}
		} )
		Status:RegisterAnimationSequence( "StatusDeceased", {
			{
				function ()
					return self.Status:SetRGBFromInt( 16777215, 0 )
				end,
				function ()
					return self.Status:SetRGBFromInt( 16777215, 500 )
				end
			},
			{
				function ()
					return self.Status:SetAlpha( 1, 0 )
				end
			}
		} )
		self._sequences.StatusDeceased = function ()
			StatusBgDeceased:AnimateSequence( "StatusDeceased" )
			StatusBg:AnimateSequence( "StatusDeceased" )
			Status:AnimateSequence( "StatusDeceased" )
		end
		
		StatusBgDeceased:RegisterAnimationSequence( "StatusNormal", {
			{
				function ()
					return self.StatusBgDeceased:SetAlpha( 0, 0 )
				end
			}
		} )
		StatusBg:RegisterAnimationSequence( "StatusNormal", {
			{
				function ()
					return self.StatusBg:SetAlpha( 0.4, 0 )
				end
			}
		} )
		Status:RegisterAnimationSequence( "StatusNormal", {
			{
				function ()
					return self.Status:SetRGBFromInt( 16777215, 0 )
				end
			},
			{
				function ()
					return self.Status:SetAlpha( 0.8, 0 )
				end
			}
		} )
		self._sequences.StatusNormal = function ()
			StatusBgDeceased:AnimateSequence( "StatusNormal" )
			StatusBg:AnimateSequence( "StatusNormal" )
			Status:AnimateSequence( "StatusNormal" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	Image:SubscribeToModelThroughElement( self, "name", function ()
		ACTIONS.AnimateSequence( self, "RefreshData" )
	end )
	PostLoadFunc( self, f12_local1, controller )
	return self
end

MenuBuilder.registerType( "mostWantedCardsBoardWidget", mostWantedCardsBoardWidget )
LockTable( _M )
