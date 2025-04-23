local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ( f1_arg0, f1_arg1, f1_arg2 )
	assert( f1_arg0.ImpactStatusValue )
	assert( f1_arg0.FluffTRBig )
	assert( f1_arg0.FluffTRSmall1 )
	assert( f1_arg0.FluffTRSmall2 )
	f1_arg0.ImpactStatusValue:SetUseGameClock( true )
	f1_arg0.FluffTRBig:SetUseGameClock( true )
	f1_arg0.FluffTRSmall1:SetUseGameClock( true )
	f1_arg0.FluffTRSmall2:SetUseGameClock( true )
end

function HaloDropScreenElements( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 1920 * _1080p, 0, 1080 * _1080p )
	self.id = "HaloDropScreenElements"
	self._animationSets = {}
	self._sequences = {}
	local f2_local1 = controller and controller.controllerIndex
	if not f2_local1 and not Engine.InFrontend() then
		f2_local1 = self:getRootController()
	end
	assert( f2_local1 )
	local f2_local2 = self
	local Image0 = nil
	
	Image0 = LUI.UIImage.new()
	Image0.id = "Image0"
	Image0:setImage( RegisterMaterial( "halo_top_bar_mid" ), 0 )
	Image0:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 540, _1080p * -540, _1080p * 20, _1080p * 68 )
	self:addElement( Image0 )
	self.Image0 = Image0
	
	local Image1 = nil
	
	Image1 = LUI.UIImage.new()
	Image1.id = "Image1"
	Image1:setImage( RegisterMaterial( "halo_top_bar_lt" ), 0 )
	Image1:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -42, _1080p * 488, _1080p * -4, _1080p * 124 )
	self:addElement( Image1 )
	self.Image1 = Image1
	
	local Image2 = nil
	
	Image2 = LUI.UIImage.new()
	Image2.id = "Image2"
	Image2:setImage( RegisterMaterial( "halo_top_bar_rt" ), 0 )
	Image2:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -488, _1080p * 42, _1080p * -4, _1080p * 76 )
	self:addElement( Image2 )
	self.Image2 = Image2
	
	local Image3 = nil
	
	Image3 = LUI.UIImage.new()
	Image3.id = "Image3"
	Image3:SetAlpha( 0.2, 0 )
	Image3:setImage( RegisterMaterial( "halo_dotted_band_bot" ), 0 )
	Image3:SetUMin( 1, 0 )
	Image3:SetUMax( 0, 0 )
	Image3:SetAnchorsAndPosition( 0, 1, 1, 0, _1080p * 40, _1080p * 808, _1080p * -140, _1080p * -60 )
	self:addElement( Image3 )
	self.Image3 = Image3
	
	local Image3Copy0 = nil
	
	Image3Copy0 = LUI.UIImage.new()
	Image3Copy0.id = "Image3Copy0"
	Image3Copy0:SetAlpha( 0.2, 0 )
	Image3Copy0:setImage( RegisterMaterial( "halo_dotted_band_bot" ), 0 )
	Image3Copy0:SetAnchorsAndPosition( 1, 0, 1, 0, _1080p * -808, _1080p * -40, _1080p * -140, _1080p * -60 )
	self:addElement( Image3Copy0 )
	self.Image3Copy0 = Image3Copy0
	
	local Image5 = nil
	
	Image5 = LUI.UIImage.new()
	Image5.id = "Image5"
	Image5:setImage( RegisterMaterial( "halo_bot_bar_lt" ), 0 )
	Image5:SetAnchorsAndPosition( 0, 1, 1, 0, _1080p * 89, _1080p * 153, _1080p * -129, _1080p * -81 )
	self:addElement( Image5 )
	self.Image5 = Image5
	
	local HaloDropBotInfoBox0 = nil
	
	HaloDropBotInfoBox0 = MenuBuilder.BuildRegisteredType( "HaloDropBotInfoBox", {
		controllerIndex = f2_local1
	} )
	HaloDropBotInfoBox0.id = "HaloDropBotInfoBox0"
	HaloDropBotInfoBox0:SetAnchorsAndPosition( 0.5, 0.5, 1, 0, _1080p * -293, _1080p * 293, _1080p * -77, _1080p * 18 )
	self:addElement( HaloDropBotInfoBox0 )
	self.HaloDropBotInfoBox0 = HaloDropBotInfoBox0
	
	local Image4 = nil
	
	Image4 = LUI.UIImage.new()
	Image4.id = "Image4"
	Image4:setImage( RegisterMaterial( "halo_bot_bar_rt" ), 0 )
	Image4:SetAnchorsAndPosition( 1, 0, 1, 0, _1080p * -212, _1080p * -84, _1080p * -129, _1080p * -113 )
	self:addElement( Image4 )
	self.Image4 = Image4
	
	local DistText = nil
	
	DistText = LUI.UIText.new()
	DistText.id = "DistText"
	DistText:SetAlpha( 0, 0 )
	DistText:SetFontSize( 36 * _1080p )
	DistText:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	DistText:SetAlignment( LUI.Alignment.Right )
	DistText:SetOptOutRightToLeftAlignmentFlip( true )
	DistText:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -135, _1080p * 30, _1080p * 142, _1080p * 178 )
	DistText:SubscribeToModel( DataSources.inGame.SP.europa.haloDropAltitude:GetModel( f2_local1 ), function ()
		local f3_local0 = DataSources.inGame.SP.europa.haloDropAltitude:GetValue( f2_local1 )
		if f3_local0 ~= nil then
			DistText:setText( f3_local0, 0 )
		end
	end )
	self:addElement( DistText )
	self.DistText = DistText
	
	local DistText2 = nil
	
	DistText2 = LUI.UIText.new()
	DistText2.id = "DistText2"
	DistText2:SetAlpha( 0, 0 )
	DistText2:setText( "m", 0 )
	DistText2:SetFontSize( 36 * _1080p )
	DistText2:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	DistText2:SetAlignment( LUI.Alignment.Left )
	DistText2:SetOptOutRightToLeftAlignmentFlip( true )
	DistText2:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * 38, _1080p * 308, _1080p * 142, _1080p * 178 )
	self:addElement( DistText2 )
	self.DistText2 = DistText2
	
	local TargetText = nil
	
	TargetText = LUI.UIText.new()
	TargetText.id = "TargetText"
	TargetText:SetAlpha( 0, 0 )
	TargetText:setText( Engine.Localize( "EUROPA_HALO_DROP_OBJECTIVE" ), 0 )
	TargetText:SetFontSize( 32 * _1080p )
	TargetText:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	TargetText:SetAlignment( LUI.Alignment.Center )
	TargetText:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -135, _1080p * 135, _1080p * 110, _1080p * 142 )
	self:addElement( TargetText )
	self.TargetText = TargetText
	
	local ImpactStatusLabel = nil
	
	ImpactStatusLabel = LUI.UIStyledText.new()
	ImpactStatusLabel.id = "ImpactStatusLabel"
	ImpactStatusLabel:SetAlpha( 0, 0 )
	ImpactStatusLabel:setText( ToUpperCase( Engine.Localize( "EUROPA_IMPACTSTATUS" ) ), 0 )
	ImpactStatusLabel:SetFontSize( 32 * _1080p )
	ImpactStatusLabel:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	ImpactStatusLabel:SetAlignment( LUI.Alignment.Left )
	ImpactStatusLabel:SetOptOutRightToLeftAlignmentFlip( true )
	ImpactStatusLabel:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 121, _1080p * 470, _1080p * 54, _1080p * 86 )
	self:addElement( ImpactStatusLabel )
	self.ImpactStatusLabel = ImpactStatusLabel
	
	local ImpactStatusValue = nil
	
	ImpactStatusValue = MenuBuilder.BuildRegisteredType( "UITechyDigits", {
		digits = 4,
		minValue = 2000,
		maxValue = 6000,
		longWait = 340,
		shortWaitMin = 20,
		shortWaitMax = 60,
		pulsesMin = 3,
		pulsesMax = 7,
		controllerIndex = f2_local1
	} )
	ImpactStatusValue.id = "ImpactStatusValue"
	ImpactStatusValue:SetAlpha( 0, 0 )
	ImpactStatusValue:SetFontSize( 50 * _1080p )
	ImpactStatusValue:SetFont( FONTS.GetFont( FONTS.MainExtended.File ) )
	ImpactStatusValue:SetAlignment( LUI.Alignment.Left )
	ImpactStatusValue:SetOptOutRightToLeftAlignmentFlip( true )
	ImpactStatusValue:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 121, _1080p * 621, _1080p * 86, _1080p * 136 )
	self:addElement( ImpactStatusValue )
	self.ImpactStatusValue = ImpactStatusValue
	
	local FluffTRBig = nil
	
	FluffTRBig = MenuBuilder.BuildRegisteredType( "UITechyDigits", {
		digits = 2,
		minValue = 20,
		maxValue = 80,
		longWait = 217,
		shortWaitMin = 52,
		shortWaitMax = 60,
		pulsesMin = 3,
		pulsesMax = 7,
		controllerIndex = f2_local1
	} )
	FluffTRBig.id = "FluffTRBig"
	FluffTRBig:SetAlpha( 0, 0 )
	FluffTRBig:SetFontSize( 50 * _1080p )
	FluffTRBig:SetFont( FONTS.GetFont( FONTS.MainExtended.File ) )
	FluffTRBig:SetAlignment( LUI.Alignment.Right )
	FluffTRBig:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -703, _1080p * -203, _1080p * 82, _1080p * 132 )
	self:addElement( FluffTRBig )
	self.FluffTRBig = FluffTRBig
	
	local FluffTRSmall1 = nil
	
	FluffTRSmall1 = MenuBuilder.BuildRegisteredType( "UITechyDigits", {
		digits = 3,
		minValue = 5,
		maxValue = 30,
		longWait = 142,
		shortWaitMin = 59,
		shortWaitMax = 60,
		pulsesMin = 3,
		pulsesMax = 7,
		controllerIndex = f2_local1
	} )
	FluffTRSmall1.id = "FluffTRSmall1"
	FluffTRSmall1:SetAlpha( 0, 0 )
	FluffTRSmall1:SetFontSize( 36 * _1080p )
	FluffTRSmall1:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	FluffTRSmall1:SetAlignment( LUI.Alignment.Left )
	FluffTRSmall1:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -193, _1080p * 307, _1080p * 92, _1080p * 128 )
	self:addElement( FluffTRSmall1 )
	self.FluffTRSmall1 = FluffTRSmall1
	
	local FluffTRSmall2 = nil
	
	FluffTRSmall2 = MenuBuilder.BuildRegisteredType( "UITechyDigits", {
		digits = 3,
		minValue = 63,
		maxValue = 95,
		longWait = 158,
		shortWaitMin = 75,
		shortWaitMax = 60,
		pulsesMin = 3,
		pulsesMax = 7,
		controllerIndex = f2_local1
	} )
	FluffTRSmall2.id = "FluffTRSmall2"
	FluffTRSmall2:SetAlpha( 0, 0 )
	FluffTRSmall2:SetFontSize( 36 * _1080p )
	FluffTRSmall2:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	FluffTRSmall2:SetAlignment( LUI.Alignment.Left )
	FluffTRSmall2:SetOptOutRightToLeftAlignmentFlip( true )
	FluffTRSmall2:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -193, _1080p * 307, _1080p * 123, _1080p * 159 )
	self:addElement( FluffTRSmall2 )
	self.FluffTRSmall2 = FluffTRSmall2
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		DistText:RegisterAnimationSequence( "StartDrop", {
			{
				function ()
					return self.DistText:SetAlpha( 0, 1500 )
				end,
				function ()
					return self.DistText:SetAlpha( 0.8, 100 )
				end
			}
		} )
		DistText2:RegisterAnimationSequence( "StartDrop", {
			{
				function ()
					return self.DistText2:SetAlpha( 0, 1500 )
				end,
				function ()
					return self.DistText2:SetAlpha( 0.8, 100 )
				end
			}
		} )
		TargetText:RegisterAnimationSequence( "StartDrop", {
			{
				function ()
					return self.TargetText:SetAlpha( 0, 1500 )
				end,
				function ()
					return self.TargetText:SetAlpha( 0.5, 100 )
				end
			}
		} )
		ImpactStatusLabel:RegisterAnimationSequence( "StartDrop", {
			{
				function ()
					return self.ImpactStatusLabel:SetAlpha( 0, 1500 )
				end,
				function ()
					return self.ImpactStatusLabel:SetAlpha( 0.05, 100 )
				end
			}
		} )
		ImpactStatusValue:RegisterAnimationSequence( "StartDrop", {
			{
				function ()
					return self.ImpactStatusValue:SetAlpha( 0, 1500 )
				end,
				function ()
					return self.ImpactStatusValue:SetAlpha( 0.1, 100 )
				end
			}
		} )
		FluffTRBig:RegisterAnimationSequence( "StartDrop", {
			{
				function ()
					return self.FluffTRBig:SetAlpha( 0, 1500 )
				end,
				function ()
					return self.FluffTRBig:SetAlpha( 0.1, 100 )
				end
			}
		} )
		FluffTRSmall1:RegisterAnimationSequence( "StartDrop", {
			{
				function ()
					return self.FluffTRSmall1:SetAlpha( 0, 1500 )
				end,
				function ()
					return self.FluffTRSmall1:SetAlpha( 0.1, 100 )
				end
			}
		} )
		FluffTRSmall2:RegisterAnimationSequence( "StartDrop", {
			{
				function ()
					return self.FluffTRSmall2:SetAlpha( 0, 1500 )
				end,
				function ()
					return self.FluffTRSmall2:SetAlpha( 0.1, 100 )
				end
			}
		} )
		self._sequences.StartDrop = function ()
			DistText:AnimateSequence( "StartDrop" )
			DistText2:AnimateSequence( "StartDrop" )
			TargetText:AnimateSequence( "StartDrop" )
			ImpactStatusLabel:AnimateSequence( "StartDrop" )
			ImpactStatusValue:AnimateSequence( "StartDrop" )
			FluffTRBig:AnimateSequence( "StartDrop" )
			FluffTRSmall1:AnimateSequence( "StartDrop" )
			FluffTRSmall2:AnimateSequence( "StartDrop" )
		end
		
		self._sequences.Landing = function ()
			
		end
		
		DistText:RegisterAnimationSequence( "LandingDone", {
			{
				function ()
					return self.DistText:SetAlpha( 0.8, 0 )
				end,
				function ()
					return self.DistText:SetAlpha( 0.8, 200 )
				end,
				function ()
					return self.DistText:SetAlpha( 0, 50 )
				end
			}
		} )
		DistText2:RegisterAnimationSequence( "LandingDone", {
			{
				function ()
					return self.DistText2:SetAlpha( 0.8, 0 )
				end,
				function ()
					return self.DistText2:SetAlpha( 0.8, 200 )
				end,
				function ()
					return self.DistText2:SetAlpha( 0, 50 )
				end
			}
		} )
		TargetText:RegisterAnimationSequence( "LandingDone", {
			{
				function ()
					return self.TargetText:SetAlpha( 0.5, 0 )
				end,
				function ()
					return self.TargetText:SetAlpha( 0.5, 200 )
				end,
				function ()
					return self.TargetText:SetAlpha( 0.8, 100 )
				end,
				function ()
					return self.TargetText:SetAlpha( 0.8, 150 )
				end,
				function ()
					return self.TargetText:SetAlpha( 0, 30 )
				end,
				function ()
					return self.TargetText:SetAlpha( 0.8, 30 )
				end,
				function ()
					return self.TargetText:SetAlpha( 0, 30 )
				end,
				function ()
					return self.TargetText:SetAlpha( 0.8, 30 )
				end,
				function ()
					return self.TargetText:SetAlpha( 0.8, 430 )
				end,
				function ()
					return self.TargetText:SetAlpha( 0, 200 )
				end
			},
			{
				function ()
					return self.TargetText:setText( Engine.Localize( "EUROPA_JUMP_TARGET" ), 0 )
				end,
				function ()
					return self.TargetText:setText( Engine.Localize( "EUROPA_JUMP_TARGET" ), 200 )
				end,
				function ()
					return self.TargetText:setText( Engine.Localize( "EUROPA_JUMP_SUCCESS" ), 50 )
				end
			},
			{
				function ()
					return self.TargetText:SetRGBFromInt( 15612963, 0 )
				end,
				function ()
					return self.TargetText:SetRGBFromInt( 15612963, 200 )
				end,
				function ()
					return self.TargetText:SetRGBFromTable( SWATCHES.icon.newIcon, 100 )
				end
			},
			{
				function ()
					return self.TargetText:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -135, _1080p * 135, _1080p * 110, _1080p * 142, 0 )
				end,
				function ()
					return self.TargetText:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -135, _1080p * 135, _1080p * 110, _1080p * 142, 200 )
				end
			}
		} )
		ImpactStatusLabel:RegisterAnimationSequence( "LandingDone", {
			{
				function ()
					return self.ImpactStatusLabel:SetAlpha( 0.05, 0 )
				end,
				function ()
					return self.ImpactStatusLabel:SetAlpha( 0.05, 200 )
				end,
				function ()
					return self.ImpactStatusLabel:SetAlpha( 0, 50 )
				end
			}
		} )
		ImpactStatusValue:RegisterAnimationSequence( "LandingDone", {
			{
				function ()
					return self.ImpactStatusValue:SetAlpha( 0.1, 0 )
				end,
				function ()
					return self.ImpactStatusValue:SetAlpha( 0.1, 200 )
				end,
				function ()
					return self.ImpactStatusValue:SetAlpha( 0, 50 )
				end
			}
		} )
		FluffTRBig:RegisterAnimationSequence( "LandingDone", {
			{
				function ()
					return self.FluffTRBig:SetAlpha( 0.1, 0 )
				end,
				function ()
					return self.FluffTRBig:SetAlpha( 0.1, 200 )
				end,
				function ()
					return self.FluffTRBig:SetAlpha( 0, 50 )
				end
			}
		} )
		FluffTRSmall1:RegisterAnimationSequence( "LandingDone", {
			{
				function ()
					return self.FluffTRSmall1:SetAlpha( 0.1, 0 )
				end,
				function ()
					return self.FluffTRSmall1:SetAlpha( 0.1, 200 )
				end,
				function ()
					return self.FluffTRSmall1:SetAlpha( 0, 50 )
				end
			}
		} )
		FluffTRSmall2:RegisterAnimationSequence( "LandingDone", {
			{
				function ()
					return self.FluffTRSmall2:SetAlpha( 0.1, 0 )
				end,
				function ()
					return self.FluffTRSmall2:SetAlpha( 0.1, 200 )
				end,
				function ()
					return self.FluffTRSmall2:SetAlpha( 0, 50 )
				end
			}
		} )
		self._sequences.LandingDone = function ()
			DistText:AnimateSequence( "LandingDone" )
			DistText2:AnimateSequence( "LandingDone" )
			TargetText:AnimateSequence( "LandingDone" )
			ImpactStatusLabel:AnimateSequence( "LandingDone" )
			ImpactStatusValue:AnimateSequence( "LandingDone" )
			FluffTRBig:AnimateSequence( "LandingDone" )
			FluffTRSmall1:AnimateSequence( "LandingDone" )
			FluffTRSmall2:AnimateSequence( "LandingDone" )
		end
		
		DistText:RegisterAnimationSequence( "LandingWarning", {
			{
				function ()
					return self.DistText:SetRGBFromInt( 16777215, 0 )
				end,
				function ()
					return self.DistText:SetRGBFromTable( SWATCHES.HUD.DamageFlash, 70 )
				end,
				function ()
					return self.DistText:SetRGBFromInt( 16777215, 70 )
				end,
				function ()
					return self.DistText:SetRGBFromTable( SWATCHES.HUD.DamageFlash, 70 )
				end,
				function ()
					return self.DistText:SetRGBFromInt( 16777215, 70 )
				end,
				function ()
					return self.DistText:SetRGBFromInt( 14697026, 70 )
				end
			},
			{
				function ()
					return self.DistText:SetAlpha( 0.8, 0 )
				end
			}
		} )
		DistText2:RegisterAnimationSequence( "LandingWarning", {
			{
				function ()
					return self.DistText2:SetRGBFromInt( 16777215, 0 )
				end,
				function ()
					return self.DistText2:SetRGBFromTable( SWATCHES.HUD.DamageFlash, 70 )
				end,
				function ()
					return self.DistText2:SetRGBFromInt( 16777215, 70 )
				end,
				function ()
					return self.DistText2:SetRGBFromTable( SWATCHES.HUD.DamageFlash, 70 )
				end,
				function ()
					return self.DistText2:SetRGBFromInt( 16777215, 70 )
				end,
				function ()
					return self.DistText2:SetRGBFromTable( SWATCHES.HUD.DamageFlash, 70 )
				end
			},
			{
				function ()
					return self.DistText2:SetAlpha( 0.8, 0 )
				end
			}
		} )
		TargetText:RegisterAnimationSequence( "LandingWarning", {
			{
				function ()
					return self.TargetText:SetRGBFromInt( 16777215, 0 )
				end,
				function ()
					return self.TargetText:SetRGBFromTable( SWATCHES.HUD.DamageFlash, 70 )
				end,
				function ()
					return self.TargetText:SetRGBFromInt( 16777215, 70 )
				end,
				function ()
					return self.TargetText:SetRGBFromTable( SWATCHES.HUD.DamageFlash, 70 )
				end,
				function ()
					return self.TargetText:SetRGBFromInt( 16777215, 70 )
				end,
				function ()
					return self.TargetText:SetRGBFromTable( SWATCHES.HUD.DamageFlash, 70 )
				end
			},
			{
				function ()
					return self.TargetText:SetAlpha( 0.5, 0 )
				end
			}
		} )
		ImpactStatusLabel:RegisterAnimationSequence( "LandingWarning", {
			{
				function ()
					return self.ImpactStatusLabel:SetAlpha( 0.05, 0 )
				end
			}
		} )
		ImpactStatusValue:RegisterAnimationSequence( "LandingWarning", {
			{
				function ()
					return self.ImpactStatusValue:SetAlpha( 0.1, 0 )
				end
			}
		} )
		FluffTRBig:RegisterAnimationSequence( "LandingWarning", {
			{
				function ()
					return self.FluffTRBig:SetAlpha( 0.1, 0 )
				end
			}
		} )
		FluffTRSmall1:RegisterAnimationSequence( "LandingWarning", {
			{
				function ()
					return self.FluffTRSmall1:SetAlpha( 0.1, 0 )
				end
			}
		} )
		FluffTRSmall2:RegisterAnimationSequence( "LandingWarning", {
			{
				function ()
					return self.FluffTRSmall2:SetAlpha( 0.1, 0 )
				end
			}
		} )
		self._sequences.LandingWarning = function ()
			DistText:AnimateSequence( "LandingWarning" )
			DistText2:AnimateSequence( "LandingWarning" )
			TargetText:AnimateSequence( "LandingWarning" )
			ImpactStatusLabel:AnimateSequence( "LandingWarning" )
			ImpactStatusValue:AnimateSequence( "LandingWarning" )
			FluffTRBig:AnimateSequence( "LandingWarning" )
			FluffTRSmall1:AnimateSequence( "LandingWarning" )
			FluffTRSmall2:AnimateSequence( "LandingWarning" )
		end
		
		DistText:RegisterAnimationSequence( "StartDropInstant", {
			{
				function ()
					return self.DistText:SetAlpha( 0.8, 0 )
				end
			}
		} )
		DistText2:RegisterAnimationSequence( "StartDropInstant", {
			{
				function ()
					return self.DistText2:SetAlpha( 0.8, 0 )
				end
			}
		} )
		TargetText:RegisterAnimationSequence( "StartDropInstant", {
			{
				function ()
					return self.TargetText:SetAlpha( 0.5, 0 )
				end
			}
		} )
		ImpactStatusLabel:RegisterAnimationSequence( "StartDropInstant", {
			{
				function ()
					return self.ImpactStatusLabel:SetAlpha( 0.05, 0 )
				end
			}
		} )
		ImpactStatusValue:RegisterAnimationSequence( "StartDropInstant", {
			{
				function ()
					return self.ImpactStatusValue:SetAlpha( 0.1, 0 )
				end
			}
		} )
		FluffTRBig:RegisterAnimationSequence( "StartDropInstant", {
			{
				function ()
					return self.FluffTRBig:SetAlpha( 0.1, 0 )
				end
			}
		} )
		FluffTRSmall1:RegisterAnimationSequence( "StartDropInstant", {
			{
				function ()
					return self.FluffTRSmall1:SetAlpha( 0.1, 0 )
				end
			}
		} )
		FluffTRSmall2:RegisterAnimationSequence( "StartDropInstant", {
			{
				function ()
					return self.FluffTRSmall2:SetAlpha( 0.1, 0 )
				end
			}
		} )
		self._sequences.StartDropInstant = function ()
			DistText:AnimateSequence( "StartDropInstant" )
			DistText2:AnimateSequence( "StartDropInstant" )
			TargetText:AnimateSequence( "StartDropInstant" )
			ImpactStatusLabel:AnimateSequence( "StartDropInstant" )
			ImpactStatusValue:AnimateSequence( "StartDropInstant" )
			FluffTRBig:AnimateSequence( "StartDropInstant" )
			FluffTRSmall1:AnimateSequence( "StartDropInstant" )
			FluffTRSmall2:AnimateSequence( "StartDropInstant" )
		end
		
		DistText:RegisterAnimationSequence( "Default", {
			{
				function ()
					return self.DistText:SetAlpha( 0, 0 )
				end
			},
			{
				function ()
					return self.DistText:SetRGBFromInt( 16777215, 0 )
				end
			}
		} )
		DistText2:RegisterAnimationSequence( "Default", {
			{
				function ()
					return self.DistText2:SetAlpha( 0, 0 )
				end
			},
			{
				function ()
					return self.DistText2:SetRGBFromInt( 16777215, 0 )
				end
			}
		} )
		TargetText:RegisterAnimationSequence( "Default", {
			{
				function ()
					return self.TargetText:SetAlpha( 0, 0 )
				end
			},
			{
				function ()
					return self.TargetText:SetRGBFromInt( 16777215, 0 )
				end
			}
		} )
		ImpactStatusLabel:RegisterAnimationSequence( "Default", {
			{
				function ()
					return self.ImpactStatusLabel:SetAlpha( 0, 0 )
				end
			}
		} )
		ImpactStatusValue:RegisterAnimationSequence( "Default", {
			{
				function ()
					return self.ImpactStatusValue:SetAlpha( 0, 0 )
				end
			}
		} )
		FluffTRBig:RegisterAnimationSequence( "Default", {
			{
				function ()
					return self.FluffTRBig:SetAlpha( 0, 0 )
				end
			}
		} )
		FluffTRSmall1:RegisterAnimationSequence( "Default", {
			{
				function ()
					return self.FluffTRSmall1:SetAlpha( 0, 0 )
				end
			}
		} )
		FluffTRSmall2:RegisterAnimationSequence( "Default", {
			{
				function ()
					return self.FluffTRSmall2:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.Default = function ()
			DistText:AnimateSequence( "Default" )
			DistText2:AnimateSequence( "Default" )
			TargetText:AnimateSequence( "Default" )
			ImpactStatusLabel:AnimateSequence( "Default" )
			ImpactStatusValue:AnimateSequence( "Default" )
			FluffTRBig:AnimateSequence( "Default" )
			FluffTRSmall1:AnimateSequence( "Default" )
			FluffTRSmall2:AnimateSequence( "Default" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	self:SubscribeToModel( DataSources.inGame.SP.europa.haloDropState:GetModel( f2_local1 ), function ()
		if DataSources.inGame.SP.europa.haloDropState:GetValue( f2_local1 ) ~= nil and DataSources.inGame.SP.europa.haloDropState:GetValue( f2_local1 ) == 1 then
			ACTIONS.AnimateSequenceByElement( self, {
				elementName = "HaloDropBotInfoBox0",
				sequenceName = "CheckGear",
				elementPath = "HaloDropBotInfoBox0"
			} )
			ACTIONS.AnimateSequence( self, "Default" )
		end
		if DataSources.inGame.SP.europa.haloDropState:GetValue( f2_local1 ) ~= nil and DataSources.inGame.SP.europa.haloDropState:GetValue( f2_local1 ) == 2 then
			ACTIONS.AnimateSequenceByElement( self, {
				elementName = "HaloDropBotInfoBox0",
				sequenceName = "WaitToDrop",
				elementPath = "HaloDropBotInfoBox0"
			} )
			ACTIONS.AnimateSequence( self, "Default" )
		end
		if DataSources.inGame.SP.europa.haloDropState:GetValue( f2_local1 ) ~= nil and DataSources.inGame.SP.europa.haloDropState:GetValue( f2_local1 ) == 3 then
			ACTIONS.AnimateSequenceByElement( self, {
				elementName = "HaloDropBotInfoBox0",
				sequenceName = "WaitToDrop",
				elementPath = "HaloDropBotInfoBox0"
			} )
			ACTIONS.AnimateSequence( self, "Default" )
		end
		if DataSources.inGame.SP.europa.haloDropState:GetValue( f2_local1 ) ~= nil and DataSources.inGame.SP.europa.haloDropState:GetValue( f2_local1 ) == 4 then
			ACTIONS.AnimateSequence( self, "StartDrop" )
		end
		if DataSources.inGame.SP.europa.haloDropState:GetValue( f2_local1 ) ~= nil and DataSources.inGame.SP.europa.haloDropState:GetValue( f2_local1 ) == 8 then
			ACTIONS.AnimateSequence( self, "Landing" )
		end
		if DataSources.inGame.SP.europa.haloDropState:GetValue( f2_local1 ) ~= nil and DataSources.inGame.SP.europa.haloDropState:GetValue( f2_local1 ) == 9 then
			ACTIONS.AnimateSequence( self, "LandingDone" )
		end
		if DataSources.inGame.SP.europa.haloDropState:GetValue( f2_local1 ) ~= nil and DataSources.inGame.SP.europa.haloDropState:GetValue( f2_local1 ) == 7 then
			ACTIONS.AnimateSequence( self, "LandingWarning" )
		end
		if DataSources.inGame.SP.europa.haloDropState:GetValue( f2_local1 ) ~= nil and DataSources.inGame.SP.europa.haloDropState:GetValue( f2_local1 ) >= 5 and DataSources.inGame.SP.europa.haloDropState:GetValue( f2_local1 ) ~= nil and DataSources.inGame.SP.europa.haloDropState:GetValue( f2_local1 ) <= 6 then
			ACTIONS.AnimateSequence( self, "StartDropInstant" )
		end
	end )
	f0_local0( self, f2_local1, controller )
	return self
end

MenuBuilder.registerType( "HaloDropScreenElements", HaloDropScreenElements )
LockTable( _M )
