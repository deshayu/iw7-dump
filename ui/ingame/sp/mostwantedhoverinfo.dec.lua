local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ( f1_arg0, f1_arg1, f1_arg2 )
	f1_arg0.BarCodeTop:SetMask( f1_arg0.BarCodeTopMask )
	f1_arg0:SetupAnchoredElement( {
		minScale = 1,
		maxScale = 1,
		screenOffsetX = 95,
		screenOffsetY = 105
	} )
	f1_arg0:SubscribeToModel( DataSources.inGame.SP.shipCrib.mostWantedBoard:GetModel( f1_arg1 ), function ( f2_arg0 )
		f1_arg0:SetEntityNum( DataModel.GetModelValue( f2_arg0 ) )
	end )
	f1_arg0:SubscribeToModel( DataSources.inGame.SP.shipCrib.mostWantedBoardTag:GetModel( f1_arg1 ), function ( f3_arg0 )
		f1_arg0:SetEntityTag( DataModel.GetModelValue( f3_arg0 ) )
	end )
	f1_arg0.Name:SubscribeToModelThroughElement( f1_arg0, "name", function ()
		ShipCribUtils.UpdateTargetName( f1_arg0, f1_arg0.Name, f1_arg1 )
	end )
	f1_arg0.Vessel:SubscribeToModelThroughElement( f1_arg0, "vessel", function ()
		ShipCribUtils.UpdateVesselName( f1_arg0, f1_arg0.Vessel, f1_arg1 )
	end )
	f1_arg0.Rank:SubscribeToModelThroughElement( f1_arg0, "rank", function ()
		local f6_local0 = f1_arg0:GetDataSource()
		f6_local0 = f6_local0.rank:GetValue( f1_arg1 )
		if f6_local0 ~= nil then
			f1_arg0.Rank:setText( ToUpperCase( Engine.Localize( "MOSTWANTED_LABEL_RANK", Engine.Localize( f6_local0 ) ) ), 0 )
		end
	end )
	if IsLanguageArabic() then
		ACTIONS.AnimateSequence( f1_arg0, "ReadsRightToLeft" )
	end
	if IsLanguageOversizedFont() then
		f1_arg0.Name:SetTop( _1080p * 10, 0 )
		f1_arg0.Name:SetBottom( _1080p * 28, 0 )
		f1_arg0.Rank:SetTop( _1080p * 40, 0 )
		f1_arg0.Rank:SetBottom( _1080p * 58, 0 )
		f1_arg0.Vessel:SetTop( _1080p * 68, 0 )
		f1_arg0.Vessel:SetBottom( _1080p * 86, 0 )
	end
end

function MostWantedHoverInfo( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 400 * _1080p, 0, 170 * _1080p )
	self.id = "MostWantedHoverInfo"
	self._animationSets = {}
	self._sequences = {}
	local f7_local1 = controller and controller.controllerIndex
	if not f7_local1 and not Engine.InFrontend() then
		f7_local1 = self:getRootController()
	end
	assert( f7_local1 )
	local f7_local2 = self
	local BlurBackground = nil
	
	BlurBackground = LUI.UIBlur.new()
	BlurBackground.id = "BlurBackground"
	BlurBackground:SetBlurStrength( 0.75, 0 )
	BlurBackground:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 10, _1080p * 410, _1080p * 11, _1080p * 96 )
	self:addElement( BlurBackground )
	self.BlurBackground = BlurBackground
	
	local BackgroundHeader = nil
	
	BackgroundHeader = LUI.UIImage.new()
	BackgroundHeader.id = "BackgroundHeader"
	BackgroundHeader:SetRGBFromInt( 5395026, 0 )
	BackgroundHeader:SetAlpha( 0.8, 0 )
	BackgroundHeader:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 5, _1080p * 405, _1080p * 1, _1080p * 31 )
	self:addElement( BackgroundHeader )
	self.BackgroundHeader = BackgroundHeader
	
	local Background = nil
	
	Background = LUI.UIImage.new()
	Background.id = "Background"
	Background:SetRGBFromInt( 6710886, 0 )
	Background:SetAlpha( 0.7, 0 )
	Background:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 5, _1080p * 405, _1080p * 36, _1080p * 92 )
	self:addElement( Background )
	self.Background = Background
	
	local Name = nil
	
	Name = LUI.UIStyledText.new()
	Name.id = "Name"
	Name:SetAlpha( 0.8, 0 )
	Name:setText( "Name", 0 )
	Name:SetFontSize( 30 * _1080p )
	Name:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	Name:SetAlignment( LUI.Alignment.Left )
	Name:SetStartupDelay( 1000 )
	Name:SetLineHoldTime( 400 )
	Name:SetAnimMoveTime( 150 )
	Name:SetEndDelay( 1000 )
	Name:SetCrossfadeTime( 400 )
	Name:SetAutoScrollStyle( LUI.UIStyledText.AutoScrollStyle.ScrollH )
	Name:SetMaxVisibleLines( 1 )
	Name:SetDecodeLetterLength( 20 )
	Name:SetDecodeMaxRandChars( 4 )
	Name:SetDecodeUpdatesPerLetter( 4 )
	Name:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 15, _1080p * 291, _1080p * 1, _1080p * 31 )
	self:addElement( Name )
	self.Name = Name
	
	local Rank = nil
	
	Rank = LUI.UIStyledText.new()
	Rank.id = "Rank"
	Rank:setText( "Rank", 0 )
	Rank:SetFontSize( 22 * _1080p )
	Rank:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	Rank:SetAlignment( LUI.Alignment.Left )
	Rank:SetDecodeLetterLength( 20 )
	Rank:SetDecodeMaxRandChars( 4 )
	Rank:SetDecodeUpdatesPerLetter( 4 )
	Rank:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 28, _1080p * 375, _1080p * 40, _1080p * 62 )
	self:addElement( Rank )
	self.Rank = Rank
	
	local Vessel = nil
	
	Vessel = LUI.UIStyledText.new()
	Vessel.id = "Vessel"
	Vessel:setText( "Vessel", 0 )
	Vessel:SetFontSize( 22 * _1080p )
	Vessel:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	Vessel:SetAlignment( LUI.Alignment.Left )
	Vessel:SetDecodeLetterLength( 20 )
	Vessel:SetDecodeMaxRandChars( 4 )
	Vessel:SetDecodeUpdatesPerLetter( 4 )
	Vessel:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 28, _1080p * 375, _1080p * 68, _1080p * 90 )
	self:addElement( Vessel )
	self.Vessel = Vessel
	
	local Divider1 = nil
	
	Divider1 = LUI.UIImage.new()
	Divider1.id = "Divider1"
	Divider1:SetAlpha( 0.4, 0 )
	Divider1:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 5, _1080p * 405, _1080p * 63, _1080p * 64 )
	self:addElement( Divider1 )
	self.Divider1 = Divider1
	
	local Divider2 = nil
	
	Divider2 = LUI.UIImage.new()
	Divider2.id = "Divider2"
	Divider2:SetAlpha( 0.4, 0 )
	Divider2:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 5, _1080p * 405, _1080p * 96, _1080p * 97 )
	self:addElement( Divider2 )
	self.Divider2 = Divider2
	
	local LeftLine = nil
	
	LeftLine = LUI.UIBorder.new( {
		borderThicknessLeft = _1080p * 1,
		borderThicknessRight = _1080p * 0,
		borderThicknessTop = _1080p * 1,
		borderThicknessBottom = _1080p * 1
	} )
	LeftLine.id = "LeftLine"
	LeftLine:SetAlpha( 0.4, 0 )
	LeftLine:SetBorderThicknessRight( _1080p * 0, 0 )
	LeftLine:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 5, _1080p * -140, _1080p * 97 )
	self:addElement( LeftLine )
	self.LeftLine = LeftLine
	
	local Bullet1 = nil
	
	Bullet1 = LUI.UIImage.new()
	Bullet1.id = "Bullet1"
	Bullet1:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 16, _1080p * 21, _1080p * 48, _1080p * 53 )
	self:addElement( Bullet1 )
	self.Bullet1 = Bullet1
	
	local Bullet2 = nil
	
	Bullet2 = LUI.UIImage.new()
	Bullet2.id = "Bullet2"
	Bullet2:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 16, _1080p * 21, _1080p * 76, _1080p * 81 )
	self:addElement( Bullet2 )
	self.Bullet2 = Bullet2
	
	local BarCodeTop = nil
	
	BarCodeTop = LUI.UIImage.new()
	BarCodeTop.id = "BarCodeTop"
	BarCodeTop:SetRGBFromInt( 0, 0 )
	BarCodeTop:SetAlpha( 0.45, 0 )
	BarCodeTop:setImage( RegisterMaterial( "hud_link_analysis_bar_code_top" ), 0 )
	BarCodeTop:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 273, _1080p * 405, _1080p * 6, _1080p * 36 )
	self:addElement( BarCodeTop )
	self.BarCodeTop = BarCodeTop
	
	local BarCodeTopMask = nil
	
	BarCodeTopMask = LUI.UIImage.new()
	BarCodeTopMask.id = "BarCodeTopMask"
	BarCodeTopMask:setImage( RegisterMaterial( "hud_jackal_launch_pitch_numbers_mask" ), 0 )
	BarCodeTopMask:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 263, _1080p * 415, _1080p * 1, _1080p * 41 )
	self:addElement( BarCodeTopMask )
	self.BarCodeTopMask = BarCodeTopMask
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		BarCodeTopMask:RegisterAnimationSequence( "RefreshData", {
			{
				function ()
					return self.BarCodeTopMask:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 263, _1080p * 264, _1080p * 1, _1080p * 41, 0 )
				end,
				function ()
					return self.BarCodeTopMask:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 263, _1080p * 264, _1080p * 1, _1080p * 41, 250 )
				end,
				function ()
					return self.BarCodeTopMask:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 263, _1080p * 415, _1080p * 1, _1080p * 41, 250 )
				end
			}
		} )
		self._sequences.RefreshData = function ()
			BarCodeTopMask:AnimateSequence( "RefreshData" )
		end
		
		Name:RegisterAnimationSequence( "ReadsRightToLeft", {
			{
				function ()
					return self.Name:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 154, _1080p * 402, _1080p * 1, _1080p * 31, 0 )
				end
			}
		} )
		Bullet1:RegisterAnimationSequence( "ReadsRightToLeft", {
			{
				function ()
					return self.Bullet1:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 395, _1080p * 400, _1080p * 48.5, _1080p * 53.5, 0 )
				end
			}
		} )
		Bullet2:RegisterAnimationSequence( "ReadsRightToLeft", {
			{
				function ()
					return self.Bullet2:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 395, _1080p * 400, _1080p * 76.5, _1080p * 81.5, 0 )
				end
			}
		} )
		BarCodeTop:RegisterAnimationSequence( "ReadsRightToLeft", {
			{
				function ()
					return self.BarCodeTop:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 10, _1080p * 142, _1080p * 6, _1080p * 36, 0 )
				end
			}
		} )
		BarCodeTopMask:RegisterAnimationSequence( "ReadsRightToLeft", {
			{
				function ()
					return self.BarCodeTopMask:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 152, _1080p * 1, _1080p * 41, 0 )
				end
			}
		} )
		self._sequences.ReadsRightToLeft = function ()
			Name:AnimateSequence( "ReadsRightToLeft" )
			Bullet1:AnimateSequence( "ReadsRightToLeft" )
			Bullet2:AnimateSequence( "ReadsRightToLeft" )
			BarCodeTop:AnimateSequence( "ReadsRightToLeft" )
			BarCodeTopMask:AnimateSequence( "ReadsRightToLeft" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	self:SubscribeToModelThroughElement( self, "identifier", function ()
		ACTIONS.AnimateSequence( self, "RefreshData" )
	end )
	f0_local0( self, f7_local1, controller )
	return self
end

MenuBuilder.registerType( "MostWantedHoverInfo", MostWantedHoverInfo )
LockTable( _M )
