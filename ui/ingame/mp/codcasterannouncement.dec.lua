local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function CodCasterAnnouncement( menu, controller )
	local self = LUI.UIVerticalNavigator.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 600 * _1080p, 0, 100 * _1080p )
	self.id = "CodCasterAnnouncement"
	self._animationSets = {}
	self._sequences = {}
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local Blur = nil
	
	Blur = LUI.UIBlur.new()
	Blur.id = "Blur"
	Blur:SetAlpha( 0, 0 )
	Blur:setImage( RegisterMaterial( "codcaster_announcement_mask" ), 0 )
	Blur:SetBlurStrength( 0.75, 0 )
	Blur:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -34, _1080p * 400, _1080p * 10, _1080p * 50 )
	self:addElement( Blur )
	self.Blur = Blur
	
	local TeamColorImage = nil
	
	TeamColorImage = LUI.UIImage.new()
	TeamColorImage.id = "TeamColorImage"
	TeamColorImage:SetAlpha( 0, 0 )
	TeamColorImage:SetDotPitchEnabled( true )
	TeamColorImage:SetDotPitchX( 6, 0 )
	TeamColorImage:SetDotPitchY( 3, 0 )
	TeamColorImage:SetDotPitchContrast( 0.15, 0 )
	TeamColorImage:SetDotPitchMode( 0 )
	TeamColorImage:setImage( RegisterMaterial( "codcaster_announcement_bg" ), 0 )
	TeamColorImage:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -34, _1080p * 635, _1080p * 10, _1080p * 100 )
	self:addElement( TeamColorImage )
	self.TeamColorImage = TeamColorImage
	
	local Shine = nil
	
	Shine = LUI.UIImage.new()
	Shine.id = "Shine"
	Shine:SetRGBFromInt( 0, 0 )
	Shine:SetAlpha( 0, 0 )
	Shine:setImage( RegisterMaterial( "codcaster_shine" ), 0 )
	Shine:SetBlendMode( BLEND_MODE.add )
	Shine:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 60, _1080p * 156, _1080p * 1, _1080p * 97 )
	self:addElement( Shine )
	self.Shine = Shine
	
	local HighLightL = nil
	
	HighLightL = LUI.UIImage.new()
	HighLightL.id = "HighLightL"
	HighLightL:setImage( RegisterMaterial( "codcaster_announcement_header_highlight" ), 0 )
	HighLightL:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * -80, _1080p * -510, _1080p * 9, _1080p * 29 )
	self:addElement( HighLightL )
	self.HighLightL = HighLightL
	
	local HighLightR = nil
	
	HighLightR = LUI.UIImage.new()
	HighLightR.id = "HighLightR"
	HighLightR:setImage( RegisterMaterial( "codcaster_announcement_header_highlight" ), 0 )
	HighLightR:SetUMin( 1, 0 )
	HighLightR:SetUMax( 0, 0 )
	HighLightR:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 510, _1080p * 80, _1080p * 9, _1080p * 29 )
	self:addElement( HighLightR )
	self.HighLightR = HighLightR
	
	local DarkenerR = nil
	
	DarkenerR = LUI.UIImage.new()
	DarkenerR.id = "DarkenerR"
	DarkenerR:SetRGBFromInt( 0, 0 )
	DarkenerR:setImage( RegisterMaterial( "codcaster_announcement_header" ), 0 )
	DarkenerR:SetUMin( 1, 0 )
	DarkenerR:SetUMax( 0, 0 )
	DarkenerR:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 300, _1080p * 82, 0, _1080p * 27 )
	self:addElement( DarkenerR )
	self.DarkenerR = DarkenerR
	
	local DarkenerL = nil
	
	DarkenerL = LUI.UIImage.new()
	DarkenerL.id = "DarkenerL"
	DarkenerL:SetRGBFromInt( 0, 0 )
	DarkenerL:setImage( RegisterMaterial( "codcaster_announcement_header" ), 0 )
	DarkenerL:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * -82, _1080p * -300, 0, _1080p * 27 )
	self:addElement( DarkenerL )
	self.DarkenerL = DarkenerL
	
	local AnnouncementTextCopy = nil
	
	AnnouncementTextCopy = LUI.UIStyledText.new()
	AnnouncementTextCopy.id = "AnnouncementTextCopy"
	AnnouncementTextCopy:SetAlpha( 0, 0 )
	AnnouncementTextCopy:setText( Engine.Localize( "MP_DOM_NEUTRAL_FLAG_CAPTURED" ), 0 )
	AnnouncementTextCopy:SetFontSize( 60 * _1080p )
	AnnouncementTextCopy:SetFont( FONTS.GetFont( FONTS.MainExtended.File ) )
	AnnouncementTextCopy:SetAlignment( LUI.Alignment.Center )
	AnnouncementTextCopy:SetOptOutRightToLeftAlignmentFlip( true )
	AnnouncementTextCopy:SetOutlineMaxDistance( 1, 0 )
	AnnouncementTextCopy:SetDecodeLetterLength( 25 )
	AnnouncementTextCopy:SetDecodeMaxRandChars( 3 )
	AnnouncementTextCopy:SetDecodeUpdatesPerLetter( 4 )
	AnnouncementTextCopy:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 50, _1080p * -50, _1080p * 29, _1080p * 89 )
	self:addElement( AnnouncementTextCopy )
	self.AnnouncementTextCopy = AnnouncementTextCopy
	
	local AnnouncementText = nil
	
	AnnouncementText = LUI.UIStyledText.new()
	AnnouncementText.id = "AnnouncementText"
	AnnouncementText:SetAlpha( 0, 0 )
	AnnouncementText:setText( Engine.Localize( "MP_DOM_NEUTRAL_FLAG_CAPTURED" ), 0 )
	AnnouncementText:SetFontSize( 55 * _1080p )
	AnnouncementText:SetFont( FONTS.GetFont( FONTS.MainExtended.File ) )
	AnnouncementText:SetAlignment( LUI.Alignment.Center )
	AnnouncementText:SetOptOutRightToLeftAlignmentFlip( true )
	AnnouncementText:SetDecodeLetterLength( 25 )
	AnnouncementText:SetDecodeMaxRandChars( 3 )
	AnnouncementText:SetDecodeUpdatesPerLetter( 4 )
	AnnouncementText:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 50, _1080p * -50, _1080p * 33, _1080p * 88 )
	self:addElement( AnnouncementText )
	self.AnnouncementText = AnnouncementText
	
	local PlayerText = nil
	
	PlayerText = LUI.UIStyledText.new()
	PlayerText.id = "PlayerText"
	PlayerText:SetAlpha( 0.8, 0 )
	PlayerText:setText( "(WWWW)WWWWWWWWWWWWWW", 0 )
	PlayerText:SetFontSize( 26 * _1080p )
	PlayerText:SetFont( FONTS.GetFont( FONTS.MainExtended.File ) )
	PlayerText:SetAlignment( LUI.Alignment.Center )
	PlayerText:SetOptOutRightToLeftAlignmentFlip( true )
	PlayerText:SetDecodeLetterLength( 25 )
	PlayerText:SetDecodeMaxRandChars( 3 )
	PlayerText:SetDecodeUpdatesPerLetter( 4 )
	PlayerText:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, _1080p * 1, _1080p * 27 )
	self:addElement( PlayerText )
	self.PlayerText = PlayerText
	
	local FlareTop = nil
	
	FlareTop = LUI.UIImage.new()
	FlareTop.id = "FlareTop"
	FlareTop:SetRGBFromInt( 0, 0 )
	FlareTop:setImage( RegisterMaterial( "codcaster_flare" ), 0 )
	FlareTop:SetBlendMode( BLEND_MODE.add )
	FlareTop:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 249, _1080p * 761, _1080p * -20, _1080p * 70 )
	self:addElement( FlareTop )
	self.FlareTop = FlareTop
	
	local FlareBot = nil
	
	FlareBot = LUI.UIImage.new()
	FlareBot.id = "FlareBot"
	FlareBot:SetRGBFromInt( 0, 0 )
	FlareBot:setImage( RegisterMaterial( "codcaster_flare" ), 0 )
	FlareBot:SetBlendMode( BLEND_MODE.add )
	FlareBot:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -196, _1080p * 316, _1080p * 60, _1080p * 140 )
	self:addElement( FlareBot )
	self.FlareBot = FlareBot
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		Blur:RegisterAnimationSequence( "Team1Appear", {
			{
				function ()
					return self.Blur:SetAlpha( 0, 0 )
				end,
				function ()
					return self.Blur:SetAlpha( 0, 260 )
				end,
				function ()
					return self.Blur:SetAlpha( 1, 60 )
				end
			},
			{
				function ()
					return self.Blur:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -34, _1080p * 400, _1080p * 10, _1080p * 50, 259 )
				end,
				function ()
					return self.Blur:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -34, _1080p * 635, _1080p * 10, _1080p * 100, 60 )
				end
			}
		} )
		TeamColorImage:RegisterAnimationSequence( "Team1Appear", {
			{
				function ()
					return self.TeamColorImage:SetUMin( 0, 0 )
				end
			},
			{
				function ()
					return self.TeamColorImage:SetUMax( 1, 0 )
				end
			},
			{
				function ()
					return self.TeamColorImage:SetAlpha( 0, 0 )
				end,
				function ()
					return self.TeamColorImage:SetAlpha( 0, 260 )
				end,
				function ()
					return self.TeamColorImage:SetAlpha( 1, 60 )
				end
			},
			{
				function ()
					return self.TeamColorImage:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -34, _1080p * 400, _1080p * 10, _1080p * 50, 259 )
				end,
				function ()
					return self.TeamColorImage:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -34, _1080p * 635, _1080p * 10, _1080p * 100, 60 )
				end
			}
		} )
		Shine:RegisterAnimationSequence( "Team1Appear", {
			{
				function ()
					return self.Shine:SetUMin( 0, 0 )
				end
			},
			{
				function ()
					return self.Shine:SetUMax( 1, 0 )
				end
			},
			{
				function ()
					return self.Shine:SetRGBFromInt( 0, 340 )
				end,
				function ()
					return self.Shine:SetRGBFromInt( 16777215, 60 )
				end,
				function ()
					return self.Shine:SetRGBFromInt( 0, 430 )
				end
			},
			{
				function ()
					return self.Shine:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 96, _1080p * 1, _1080p * 97, 280 )
				end,
				function ()
					return self.Shine:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 225, _1080p * 400, _1080p * 1, _1080p * 97, 320 )
				end,
				function ()
					return self.Shine:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 239, _1080p * 602.94, _1080p * 1, _1080p * 97, 229 )
				end,
				function ()
					return self.Shine:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 600, _1080p * 700, _1080p * 1, _1080p * 97, 110 )
				end
			}
		} )
		HighLightL:RegisterAnimationSequence( "Team1Appear", {
			{
				function ()
					return self.HighLightL:SetAlpha( 0, 140 )
				end,
				function ()
					return self.HighLightL:SetAlpha( 1, 80 )
				end
			}
		} )
		HighLightR:RegisterAnimationSequence( "Team1Appear", {
			{
				function ()
					return self.HighLightR:SetAlpha( 0, 150 )
				end,
				function ()
					return self.HighLightR:SetAlpha( 1, 110 )
				end
			}
		} )
		AnnouncementTextCopy:RegisterAnimationSequence( "Team1Appear", {
			{
				function ()
					return self.AnnouncementTextCopy:SetAlpha( 0, 140 )
				end,
				function ()
					return self.AnnouncementTextCopy:SetAlpha( 0, 140 )
				end,
				function ()
					return self.AnnouncementTextCopy:SetAlpha( 0.3, 100 )
				end,
				function ()
					return self.AnnouncementTextCopy:SetAlpha( 0, 160 )
				end
			},
			{
				function ()
					return self.AnnouncementTextCopy:SetScale( 0, 280 )
				end,
				function ()
					return self.AnnouncementTextCopy:SetScale( 0.25, 260 )
				end
			}
		} )
		AnnouncementText:RegisterAnimationSequence( "Team1Appear", {
			{
				function ()
					return self.AnnouncementText:SetAlpha( 0, 140 )
				end,
				function ()
					return self.AnnouncementText:SetAlpha( 1, 240 )
				end
			},
			{
				function ()
					return self.AnnouncementText:SetScale( 0.25, 140 )
				end,
				function ()
					return self.AnnouncementText:SetScale( 0, 240 )
				end
			}
		} )
		PlayerText:RegisterAnimationSequence( "Team1Appear", {
			{
				function ()
					return self.PlayerText:SetAlpha( 0, 100 )
				end,
				function ()
					return self.PlayerText:SetAlpha( 1, 40 )
				end,
				function ()
					return self.PlayerText:SetAlpha( 0.8, 40 )
				end
			}
		} )
		FlareTop:RegisterAnimationSequence( "Team1Appear", {
			{
				function ()
					return self.FlareTop:SetRGBFromInt( 0, 100 )
				end,
				function ()
					return self.FlareTop:SetRGBFromInt( 13421772, 50 )
				end,
				function ()
					return self.FlareTop:SetRGBFromInt( 16777215, 110 )
				end,
				function ()
					return self.FlareTop:SetRGBFromInt( 0, 420 )
				end
			},
			{
				function ()
					return self.FlareTop:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 269, _1080p * 781, _1080p * -18, _1080p * 72, 100 )
				end,
				function ()
					return self.FlareTop:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -89.33, _1080p * 422.67, _1080p * -18, _1080p * 72, 440 )
				end,
				function ()
					return self.FlareTop:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -158, _1080p * 354, _1080p * -20, _1080p * 70, 139 )
				end
			}
		} )
		FlareBot:RegisterAnimationSequence( "Team1Appear", {
			{
				function ()
					return self.FlareBot:SetRGBFromInt( 0, 340 )
				end,
				function ()
					return self.FlareBot:SetRGBFromInt( 13421772, 100 )
				end,
				function ()
					return self.FlareBot:SetRGBFromInt( 16777215, 240 )
				end,
				function ()
					return self.FlareBot:SetRGBFromInt( 0, 260 )
				end
			},
			{
				function ()
					return self.FlareBot:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -158.41, _1080p * 353.6, _1080p * 60, _1080p * 140, 340 )
				end,
				function ()
					return self.FlareBot:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -108.81, _1080p * 403.19, _1080p * 60, _1080p * 140, 60 )
				end,
				function ()
					return self.FlareBot:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 239, _1080p * 751, _1080p * 60, _1080p * 140, 429 )
				end,
				function ()
					return self.FlareBot:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 282, _1080p * 794, _1080p * 60, _1080p * 140, 110 )
				end
			}
		} )
		self._sequences.Team1Appear = function ()
			Blur:AnimateSequence( "Team1Appear" )
			TeamColorImage:AnimateSequence( "Team1Appear" )
			Shine:AnimateSequence( "Team1Appear" )
			HighLightL:AnimateSequence( "Team1Appear" )
			HighLightR:AnimateSequence( "Team1Appear" )
			AnnouncementTextCopy:AnimateSequence( "Team1Appear" )
			AnnouncementText:AnimateSequence( "Team1Appear" )
			PlayerText:AnimateSequence( "Team1Appear" )
			FlareTop:AnimateSequence( "Team1Appear" )
			FlareBot:AnimateSequence( "Team1Appear" )
		end
		
		Blur:RegisterAnimationSequence( "Team2Appear", {
			{
				function ()
					return self.Blur:SetUMin( 1, 0 )
				end
			},
			{
				function ()
					return self.Blur:SetUMax( 0, 0 )
				end
			},
			{
				function ()
					return self.Blur:SetAlpha( 0, 260 )
				end,
				function ()
					return self.Blur:SetAlpha( 1, 60 )
				end
			},
			{
				function ()
					return self.Blur:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 200, _1080p * 635, _1080p * 10, _1080p * 50, 259 )
				end,
				function ()
					return self.Blur:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -34, _1080p * 635, _1080p * 10, _1080p * 100, 60 )
				end
			}
		} )
		TeamColorImage:RegisterAnimationSequence( "Team2Appear", {
			{
				function ()
					return self.TeamColorImage:SetUMin( 1, 0 )
				end
			},
			{
				function ()
					return self.TeamColorImage:SetUMax( 0, 0 )
				end
			},
			{
				function ()
					return self.TeamColorImage:SetAlpha( 0, 0 )
				end,
				function ()
					return self.TeamColorImage:SetAlpha( 1, 320 )
				end
			},
			{
				function ()
					return self.TeamColorImage:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 200, _1080p * 635, _1080p * 10, _1080p * 50, 259 )
				end,
				function ()
					return self.TeamColorImage:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -34, _1080p * 635, _1080p * 10, _1080p * 100, 60 )
				end
			}
		} )
		Shine:RegisterAnimationSequence( "Team2Appear", {
			{
				function ()
					return self.Shine:SetUMin( 1, 0 )
				end
			},
			{
				function ()
					return self.Shine:SetUMax( 0, 0 )
				end
			},
			{
				function ()
					return self.Shine:SetRGBFromInt( 0, 340 )
				end,
				function ()
					return self.Shine:SetRGBFromInt( 16777215, 60 )
				end,
				function ()
					return self.Shine:SetRGBFromInt( 0, 430 )
				end
			},
			{
				function ()
					return self.Shine:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 500, _1080p * 600, _1080p * 1, _1080p * 97, 280 )
				end,
				function ()
					return self.Shine:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 225, _1080p * 400, _1080p * 1, _1080p * 97, 320 )
				end,
				function ()
					return self.Shine:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 375, _1080p * 1, _1080p * 97, 229 )
				end,
				function ()
					return self.Shine:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 96, _1080p * 1, _1080p * 97, 90 )
				end
			}
		} )
		HighLightL:RegisterAnimationSequence( "Team2Appear", {
			{
				function ()
					return self.HighLightL:SetAlpha( 0, 150 )
				end,
				function ()
					return self.HighLightL:SetAlpha( 1, 110 )
				end
			}
		} )
		HighLightR:RegisterAnimationSequence( "Team2Appear", {
			{
				function ()
					return self.HighLightR:SetAlpha( 0, 140 )
				end,
				function ()
					return self.HighLightR:SetAlpha( 1, 80 )
				end
			}
		} )
		AnnouncementTextCopy:RegisterAnimationSequence( "Team2Appear", {
			{
				function ()
					return self.AnnouncementTextCopy:SetAlpha( 0, 140 )
				end,
				function ()
					return self.AnnouncementTextCopy:SetAlpha( 0, 140 )
				end,
				function ()
					return self.AnnouncementTextCopy:SetAlpha( 0.3, 100 )
				end,
				function ()
					return self.AnnouncementTextCopy:SetAlpha( 0, 160 )
				end
			},
			{
				function ()
					return self.AnnouncementTextCopy:SetScale( 0, 280 )
				end,
				function ()
					return self.AnnouncementTextCopy:SetScale( 0.25, 260 )
				end
			}
		} )
		AnnouncementText:RegisterAnimationSequence( "Team2Appear", {
			{
				function ()
					return self.AnnouncementText:SetAlpha( 0, 140 )
				end,
				function ()
					return self.AnnouncementText:SetAlpha( 1, 240 )
				end
			},
			{
				function ()
					return self.AnnouncementText:SetScale( 0.25, 140 )
				end,
				function ()
					return self.AnnouncementText:SetScale( 0, 240 )
				end
			}
		} )
		PlayerText:RegisterAnimationSequence( "Team2Appear", {
			{
				function ()
					return self.PlayerText:SetAlpha( 0, 100 )
				end,
				function ()
					return self.PlayerText:SetAlpha( 1, 40 )
				end,
				function ()
					return self.PlayerText:SetAlpha( 0.8, 40 )
				end
			}
		} )
		FlareTop:RegisterAnimationSequence( "Team2Appear", {
			{
				function ()
					return self.FlareTop:SetRGBFromInt( 0, 100 )
				end,
				function ()
					return self.FlareTop:SetRGBFromInt( 13421772, 50 )
				end,
				function ()
					return self.FlareTop:SetRGBFromInt( 16777215, 110 )
				end,
				function ()
					return self.FlareTop:SetRGBFromInt( 0, 420 )
				end
			},
			{
				function ()
					return self.FlareTop:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -158, _1080p * 354, _1080p * -20, _1080p * 70, 100 )
				end,
				function ()
					return self.FlareTop:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 158.67, _1080p * 670.67, _1080p * -18, _1080p * 72, 440 )
				end,
				function ()
					return self.FlareTop:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 269, _1080p * 781, _1080p * -18, _1080p * 72, 139 )
				end
			}
		} )
		FlareBot:RegisterAnimationSequence( "Team2Appear", {
			{
				function ()
					return self.FlareBot:SetRGBFromInt( 0, 340 )
				end,
				function ()
					return self.FlareBot:SetRGBFromInt( 13421772, 100 )
				end,
				function ()
					return self.FlareBot:SetRGBFromInt( 16777215, 240 )
				end,
				function ()
					return self.FlareBot:SetRGBFromInt( 0, 260 )
				end
			},
			{
				function ()
					return self.FlareBot:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 282, _1080p * 794, _1080p * 60, _1080p * 140, 340 )
				end,
				function ()
					return self.FlareBot:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 218, _1080p * 730, _1080p * 60, _1080p * 140, 99 )
				end,
				function ()
					return self.FlareBot:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -108.81, _1080p * 403.19, _1080p * 60, _1080p * 140, 379 )
				end,
				function ()
					return self.FlareBot:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -158.41, _1080p * 353.6, _1080p * 60, _1080p * 140, 219 )
				end
			}
		} )
		self._sequences.Team2Appear = function ()
			Blur:AnimateSequence( "Team2Appear" )
			TeamColorImage:AnimateSequence( "Team2Appear" )
			Shine:AnimateSequence( "Team2Appear" )
			HighLightL:AnimateSequence( "Team2Appear" )
			HighLightR:AnimateSequence( "Team2Appear" )
			AnnouncementTextCopy:AnimateSequence( "Team2Appear" )
			AnnouncementText:AnimateSequence( "Team2Appear" )
			PlayerText:AnimateSequence( "Team2Appear" )
			FlareTop:AnimateSequence( "Team2Appear" )
			FlareBot:AnimateSequence( "Team2Appear" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	return self
end

MenuBuilder.registerType( "CodCasterAnnouncement", CodCasterAnnouncement )
LockTable( _M )
