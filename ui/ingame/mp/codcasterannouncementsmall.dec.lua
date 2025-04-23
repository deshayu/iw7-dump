local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function CodCasterAnnouncementSmall( menu, controller )
	local self = LUI.UIVerticalNavigator.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 600 * _1080p, 0, 60 * _1080p )
	self.id = "CodCasterAnnouncementSmall"
	self._animationSets = {}
	self._sequences = {}
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local TeamColorImage = nil
	
	TeamColorImage = LUI.UIImage.new()
	TeamColorImage.id = "TeamColorImage"
	TeamColorImage:SetRGBFromInt( 1710618, 0 )
	TeamColorImage:SetAlpha( 0, 0 )
	TeamColorImage:SetDotPitchEnabled( true )
	TeamColorImage:SetDotPitchX( 6, 0 )
	TeamColorImage:SetDotPitchY( 3, 0 )
	TeamColorImage:SetDotPitchContrast( 0.25, 0 )
	TeamColorImage:SetDotPitchMode( 0 )
	TeamColorImage:setImage( RegisterMaterial( "codcaster_announcement_mask" ), 0 )
	TeamColorImage:SetVMin( 0.4, 0 )
	TeamColorImage:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * -63.5, _1080p * 63.5, 0, _1080p * 30 )
	self:addElement( TeamColorImage )
	self.TeamColorImage = TeamColorImage
	
	local HighLightL = nil
	
	HighLightL = LUI.UIImage.new()
	HighLightL.id = "HighLightL"
	HighLightL:SetAlpha( 0, 0 )
	HighLightL:setImage( RegisterMaterial( "codcaster_announcement_header_highlight" ), 0 )
	HighLightL:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * -80, _1080p * -510, _1080p * 9, _1080p * 29 )
	self:addElement( HighLightL )
	self.HighLightL = HighLightL
	
	local HighLightR = nil
	
	HighLightR = LUI.UIImage.new()
	HighLightR.id = "HighLightR"
	HighLightR:SetAlpha( 0, 0 )
	HighLightR:setImage( RegisterMaterial( "codcaster_announcement_header_highlight" ), 0 )
	HighLightR:SetUMin( 1, 0 )
	HighLightR:SetUMax( 0, 0 )
	HighLightR:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 510, _1080p * 80, _1080p * 9, _1080p * 29 )
	self:addElement( HighLightR )
	self.HighLightR = HighLightR
	
	local DarkenerL = nil
	
	DarkenerL = LUI.UIImage.new()
	DarkenerL.id = "DarkenerL"
	DarkenerL:SetRGBFromInt( 0, 0 )
	DarkenerL:setImage( RegisterMaterial( "codcaster_announcement_header" ), 0 )
	DarkenerL:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * -82, _1080p * -300, 0, _1080p * 27 )
	self:addElement( DarkenerL )
	self.DarkenerL = DarkenerL
	
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
	
	local Shine = nil
	
	Shine = LUI.UIImage.new()
	Shine.id = "Shine"
	Shine:SetRGBFromInt( 0, 0 )
	Shine:setImage( RegisterMaterial( "codcaster_shine" ), 0 )
	Shine:SetBlendMode( BLEND_MODE.add )
	Shine:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 75.5, _1080p * 140.5, 0, _1080p * 29 )
	self:addElement( Shine )
	self.Shine = Shine
	
	local AnnouncementText = nil
	
	AnnouncementText = LUI.UIStyledText.new()
	AnnouncementText.id = "AnnouncementText"
	AnnouncementText:SetAlpha( 0, 0 )
	AnnouncementText:setText( Engine.Localize( "MP_DOM_NEUTRAL_FLAG_CAPTURED" ), 0 )
	AnnouncementText:SetFontSize( 26 * _1080p )
	AnnouncementText:SetFont( FONTS.GetFont( FONTS.MainExtended.File ) )
	AnnouncementText:SetAlignment( LUI.Alignment.Center )
	AnnouncementText:SetOptOutRightToLeftAlignmentFlip( true )
	AnnouncementText:SetDecodeLetterLength( 25 )
	AnnouncementText:SetDecodeMaxRandChars( 3 )
	AnnouncementText:SetDecodeUpdatesPerLetter( 4 )
	AnnouncementText:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, _1080p * 1, _1080p * 27 )
	self:addElement( AnnouncementText )
	self.AnnouncementText = AnnouncementText
	
	local PlayerText = nil
	
	PlayerText = LUI.UIStyledText.new()
	PlayerText.id = "PlayerText"
	PlayerText:SetRGBFromInt( 11776947, 0 )
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
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		TeamColorImage:RegisterAnimationSequence( "Appear", {
			{
				function ()
					return self.TeamColorImage:SetAlpha( 0, 0 )
				end,
				function ()
					return self.TeamColorImage:SetAlpha( 0.5, 200 )
				end
			},
			{
				function ()
					return self.TeamColorImage:SetVMin( 0.65, 0 )
				end
			},
			{
				function ()
					return self.TeamColorImage:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -363.5, _1080p * 363.5, 0, _1080p * 30, 0 )
				end
			}
		} )
		HighLightL:RegisterAnimationSequence( "Appear", {
			{
				function ()
					return self.HighLightL:SetAlpha( 0, 0 )
				end
			}
		} )
		HighLightR:RegisterAnimationSequence( "Appear", {
			{
				function ()
					return self.HighLightR:SetAlpha( 0, 0 )
				end
			}
		} )
		DarkenerL:RegisterAnimationSequence( "Appear", {
			{
				function ()
					return self.DarkenerL:SetAlpha( 0, 0 )
				end
			}
		} )
		DarkenerR:RegisterAnimationSequence( "Appear", {
			{
				function ()
					return self.DarkenerR:SetAlpha( 0, 0 )
				end
			}
		} )
		Shine:RegisterAnimationSequence( "Appear", {
			{
				function ()
					return self.Shine:SetRGBFromInt( 0, 200 )
				end,
				function ()
					return self.Shine:SetRGBFromInt( 16777215, 330 )
				end,
				function ()
					return self.Shine:SetRGBFromInt( 0, 320 )
				end
			},
			{
				function ()
					return self.Shine:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 56.5, _1080p * 121.5, 0, _1080p * 28, 0 )
				end,
				function ()
					return self.Shine:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 56.5, _1080p * 121.5, 0, _1080p * 28, 200 )
				end,
				function ()
					return self.Shine:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 225, _1080p * 375, 0, _1080p * 28, 329 )
				end,
				function ()
					return self.Shine:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 478, _1080p * 543, 0, _1080p * 28, 320 )
				end
			}
		} )
		AnnouncementText:RegisterAnimationSequence( "Appear", {
			{
				function ()
					return self.AnnouncementText:SetAlpha( 0, 0 )
				end,
				function ()
					return self.AnnouncementText:SetAlpha( 0, 200 )
				end,
				function ()
					return self.AnnouncementText:SetAlpha( 0.8, 650 )
				end
			},
			{
				function ()
					return self.AnnouncementText:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, _1080p * 1, _1080p * 27, 0 )
				end
			}
		} )
		PlayerText:RegisterAnimationSequence( "Appear", {
			{
				function ()
					return self.PlayerText:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.Appear = function ()
			TeamColorImage:AnimateSequence( "Appear" )
			HighLightL:AnimateSequence( "Appear" )
			HighLightR:AnimateSequence( "Appear" )
			DarkenerL:AnimateSequence( "Appear" )
			DarkenerR:AnimateSequence( "Appear" )
			Shine:AnimateSequence( "Appear" )
			AnnouncementText:AnimateSequence( "Appear" )
			PlayerText:AnimateSequence( "Appear" )
		end
		
		TeamColorImage:RegisterAnimationSequence( "AppearWithPlayer", {
			{
				function ()
					return self.TeamColorImage:SetAlpha( 0, 0 )
				end,
				function ()
					return self.TeamColorImage:SetAlpha( 0, 140 )
				end,
				function ()
					return self.TeamColorImage:SetAlpha( 0.5, 260 )
				end
			},
			{
				function ()
					return self.TeamColorImage:SetVMin( 0.4, 0 )
				end
			},
			{
				function ()
					return self.TeamColorImage:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -363.5, _1080p * 363.5, 0, _1080p * 64, 0 )
				end
			}
		} )
		HighLightL:RegisterAnimationSequence( "AppearWithPlayer", {
			{
				function ()
					return self.HighLightL:SetAlpha( 0, 0 )
				end
			}
		} )
		HighLightR:RegisterAnimationSequence( "AppearWithPlayer", {
			{
				function ()
					return self.HighLightR:SetAlpha( 0, 0 )
				end
			}
		} )
		DarkenerL:RegisterAnimationSequence( "AppearWithPlayer", {
			{
				function ()
					return self.DarkenerL:SetAlpha( 1, 0 )
				end
			}
		} )
		DarkenerR:RegisterAnimationSequence( "AppearWithPlayer", {
			{
				function ()
					return self.DarkenerR:SetAlpha( 1, 0 )
				end
			}
		} )
		Shine:RegisterAnimationSequence( "AppearWithPlayer", {
			{
				function ()
					return self.Shine:SetRGBFromInt( 0, 400 )
				end,
				function ()
					return self.Shine:SetRGBFromInt( 16777215, 330 )
				end,
				function ()
					return self.Shine:SetRGBFromInt( 0, 320 )
				end
			},
			{
				function ()
					return self.Shine:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 56.5, _1080p * 200, 0, _1080p * 60, 0 )
				end,
				function ()
					return self.Shine:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 56.5, _1080p * 200, 0, _1080p * 60, 400 )
				end,
				function ()
					return self.Shine:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 216.43, _1080p * 390.43, 0, _1080p * 60, 330 )
				end,
				function ()
					return self.Shine:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 350, _1080p * 543, 0, _1080p * 60, 319 )
				end
			}
		} )
		AnnouncementText:RegisterAnimationSequence( "AppearWithPlayer", {
			{
				function ()
					return self.AnnouncementText:SetAlpha( 0, 0 )
				end,
				function ()
					return self.AnnouncementText:SetAlpha( 0, 400 )
				end,
				function ()
					return self.AnnouncementText:SetAlpha( 0.8, 440 )
				end
			},
			{
				function ()
					return self.AnnouncementText:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, _1080p * 30, _1080p * 56, 0 )
				end
			}
		} )
		PlayerText:RegisterAnimationSequence( "AppearWithPlayer", {
			{
				function ()
					return self.PlayerText:SetAlpha( 0, 0 )
				end,
				function ()
					return self.PlayerText:SetAlpha( 0.8, 140 )
				end,
				function ()
					return self.PlayerText:SetAlpha( 0.8, 260 )
				end
			}
		} )
		self._sequences.AppearWithPlayer = function ()
			TeamColorImage:AnimateSequence( "AppearWithPlayer" )
			HighLightL:AnimateSequence( "AppearWithPlayer" )
			HighLightR:AnimateSequence( "AppearWithPlayer" )
			DarkenerL:AnimateSequence( "AppearWithPlayer" )
			DarkenerR:AnimateSequence( "AppearWithPlayer" )
			Shine:AnimateSequence( "AppearWithPlayer" )
			AnnouncementText:AnimateSequence( "AppearWithPlayer" )
			PlayerText:AnimateSequence( "AppearWithPlayer" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	return self
end

MenuBuilder.registerType( "CodCasterAnnouncementSmall", CodCasterAnnouncementSmall )
LockTable( _M )
