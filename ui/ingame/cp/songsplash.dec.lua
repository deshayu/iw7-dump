local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function SongSplash( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 1920 * _1080p, 0, 1080 * _1080p )
	self.id = "SongSplash"
	self._animationSets = {}
	self._sequences = {}
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local Arcane = nil
	
	Arcane = LUI.UIImage.new()
	Arcane.id = "Arcane"
	Arcane:SetScale( -0.73, 0 )
	Arcane:setImage( RegisterMaterial( "zm_tix_arcane_spinner" ), 0 )
	Arcane:SetUseAA( true )
	Arcane:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -191, _1080p * 319, _1080p * 94.69, _1080p * 606.69 )
	self:addElement( Arcane )
	self.Arcane = Arcane
	
	local Backing = nil
	
	Backing = LUI.UIImage.new()
	Backing.id = "Backing"
	Backing:setImage( RegisterMaterial( "cp_hud_song_widget_title_bg" ), 0 )
	Backing:SetUseAA( true )
	Backing:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 107.93, _1080p * 588.93, _1080p * 338.69, _1080p * 385.69 )
	self:addElement( Backing )
	self.Backing = Backing
	
	local Artist = nil
	
	Artist = LUI.UIText.new()
	Artist.id = "Artist"
	Artist:SetFontSize( 20 * _1080p )
	Artist:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	Artist:SetAlignment( LUI.Alignment.Left )
	Artist:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 205, _1080p * 520, _1080p * 384.69, _1080p * 404.69 )
	Artist:SubscribeToModel( DataSources.inGame.CP.zombies.songs.songPlayingArtist:GetModel( f1_local1 ), function ()
		local f2_local0 = DataSources.inGame.CP.zombies.songs.songPlayingArtist:GetValue( f1_local1 )
		if f2_local0 ~= nil then
			Artist:setText( ToUpperCase( LocalizeString( f2_local0 ) ), 0 )
		end
	end )
	self:addElement( Artist )
	self.Artist = Artist
	
	local Title = nil
	
	Title = LUI.UIText.new()
	Title.id = "Title"
	Title:SetRGBFromTable( SWATCHES.Zombies.menuHeader, 0 )
	Title:SetFontSize( 30 * _1080p )
	Title:SetFont( FONTS.GetFont( FONTS.ZmClean.File ) )
	Title:SetAlignment( LUI.Alignment.Left )
	Title:SetOptOutRightToLeftAlignmentFlip( true )
	Title:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 128, _1080p * 1257.14, _1080p * 347.19, _1080p * 377.19 )
	Title:SubscribeToModel( DataSources.inGame.CP.zombies.songs.songPlayingTitle:GetModel( f1_local1 ), function ()
		local f3_local0 = DataSources.inGame.CP.zombies.songs.songPlayingTitle:GetValue( f1_local1 )
		if f3_local0 ~= nil then
			Title:setText( LocalizeString( f3_local0 ), 0 )
		end
	end )
	self:addElement( Title )
	self.Title = Title
	
	local Blood = nil
	
	Blood = LUI.UIImage.new()
	Blood.id = "Blood"
	Blood:SetZRotation( -128, 0 )
	Blood:setImage( RegisterMaterial( "cp_main_button_blood_splatter" ), 0 )
	Blood:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -42, _1080p * 214, _1080p * 256.69, _1080p * 512.69 )
	self:addElement( Blood )
	self.Blood = Blood
	
	local CosmicTunes = nil
	
	CosmicTunes = LUI.UIImage.new()
	CosmicTunes.id = "CosmicTunes"
	CosmicTunes:SetScale( 0.23, 0 )
	CosmicTunes:setImage( RegisterMaterial( "cp_hud_song_widget" ), 0 )
	CosmicTunes:SetUseAA( true )
	CosmicTunes:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 128, _1080p * 286.69, _1080p * 414.69 )
	self:addElement( CosmicTunes )
	self.CosmicTunes = CosmicTunes
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		Arcane:RegisterAnimationSequence( "initial", {
			{
				function ()
					return self.Arcane:SetAlpha( 0, 0 )
				end
			}
		} )
		Backing:RegisterAnimationSequence( "initial", {
			{
				function ()
					return self.Backing:SetAlpha( 0, 0 )
				end
			}
		} )
		Artist:RegisterAnimationSequence( "initial", {
			{
				function ()
					return self.Artist:SetAlpha( 0, 0 )
				end
			}
		} )
		Title:RegisterAnimationSequence( "initial", {
			{
				function ()
					return self.Title:SetAlpha( 0, 0 )
				end
			}
		} )
		Blood:RegisterAnimationSequence( "initial", {
			{
				function ()
					return self.Blood:SetAlpha( 0, 0 )
				end
			}
		} )
		CosmicTunes:RegisterAnimationSequence( "initial", {
			{
				function ()
					return self.CosmicTunes:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.initial = function ()
			Arcane:AnimateSequence( "initial" )
			Backing:AnimateSequence( "initial" )
			Artist:AnimateSequence( "initial" )
			Title:AnimateSequence( "initial" )
			Blood:AnimateSequence( "initial" )
			CosmicTunes:AnimateSequence( "initial" )
		end
		
		Arcane:RegisterAnimationSequence( "slideIn", {
			{
				function ()
					return self.Arcane:SetAlpha( 1, 0 )
				end,
				function ()
					return self.Arcane:SetAlpha( 1, 3480 )
				end,
				function ()
					return self.Arcane:SetAlpha( 0, 70 )
				end
			},
			{
				function ()
					return self.Arcane:SetZRotation( 0, 0 )
				end,
				function ()
					return self.Arcane:SetZRotation( 180, 3550 )
				end
			},
			{
				function ()
					return self.Arcane:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -1053, _1080p * -543, _1080p * 94.69, _1080p * 606.69, 0 )
				end,
				function ()
					return self.Arcane:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -157, _1080p * 353, _1080p * 94.69, _1080p * 606.69, 560 )
				end,
				function ()
					return self.Arcane:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -75, _1080p * 435, _1080p * 94.69, _1080p * 606.69, 89 )
				end,
				function ()
					return self.Arcane:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -157, _1080p * 353, _1080p * 94.69, _1080p * 606.69, 80 )
				end,
				function ()
					return self.Arcane:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -157, _1080p * 353, _1080p * 94.69, _1080p * 606.69, 2269 )
				end,
				function ()
					return self.Arcane:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -75, _1080p * 435, _1080p * 94.69, _1080p * 606.69, 89 )
				end,
				function ()
					return self.Arcane:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -1088, _1080p * -578, _1080p * 94.69, _1080p * 606.69, 390 )
				end
			}
		} )
		Backing:RegisterAnimationSequence( "slideIn", {
			{
				function ()
					return self.Backing:SetAlpha( 1, 0 )
				end,
				function ()
					return self.Backing:SetAlpha( 1, 3480 )
				end,
				function ()
					return self.Backing:SetAlpha( 0, 70 )
				end
			},
			{
				function ()
					return self.Backing:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -754.07, _1080p * -273.07, _1080p * 336, _1080p * 385, 0 )
				end,
				function ()
					return self.Backing:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 141.93, _1080p * 622.93, _1080p * 336, _1080p * 385, 560 )
				end,
				function ()
					return self.Backing:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 223.93, _1080p * 704.93, _1080p * 336, _1080p * 385, 89 )
				end,
				function ()
					return self.Backing:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 141.93, _1080p * 622.93, _1080p * 336, _1080p * 385, 80 )
				end,
				function ()
					return self.Backing:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 141.93, _1080p * 622.93, _1080p * 336, _1080p * 385, 2269 )
				end,
				function ()
					return self.Backing:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 223.93, _1080p * 704.93, _1080p * 336, _1080p * 385, 89 )
				end,
				function ()
					return self.Backing:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -789.07, _1080p * -308.07, _1080p * 336, _1080p * 385, 390 )
				end
			}
		} )
		Artist:RegisterAnimationSequence( "slideIn", {
			{
				function ()
					return self.Artist:SetAlpha( 1, 0 )
				end,
				function ()
					return self.Artist:SetAlpha( 1, 3480 )
				end,
				function ()
					return self.Artist:SetAlpha( 0, 70 )
				end
			},
			{
				function ()
					return self.Artist:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -657, _1080p * -342, _1080p * 381.69, _1080p * 401.69, 0 )
				end,
				function ()
					return self.Artist:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 239, _1080p * 554, _1080p * 381.69, _1080p * 401.69, 560 )
				end,
				function ()
					return self.Artist:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 321, _1080p * 636, _1080p * 381.69, _1080p * 401.69, 89 )
				end,
				function ()
					return self.Artist:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 239, _1080p * 554, _1080p * 381.69, _1080p * 401.69, 80 )
				end,
				function ()
					return self.Artist:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 239, _1080p * 554, _1080p * 381.69, _1080p * 401.69, 2269 )
				end,
				function ()
					return self.Artist:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 321, _1080p * 636, _1080p * 381.69, _1080p * 401.69, 89 )
				end,
				function ()
					return self.Artist:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -692, _1080p * -377, _1080p * 381.69, _1080p * 401.69, 390 )
				end
			}
		} )
		Title:RegisterAnimationSequence( "slideIn", {
			{
				function ()
					return self.Title:SetAlpha( 1, 0 )
				end,
				function ()
					return self.Title:SetAlpha( 1, 3480 )
				end,
				function ()
					return self.Title:SetAlpha( 0, 70 )
				end
			},
			{
				function ()
					return self.Title:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -734, _1080p * 395.14, _1080p * 345.5, _1080p * 375.5, 0 )
				end,
				function ()
					return self.Title:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 162, _1080p * 1291.14, _1080p * 345.5, _1080p * 375.5, 560 )
				end,
				function ()
					return self.Title:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 244, _1080p * 1373.14, _1080p * 345.5, _1080p * 375.5, 89 )
				end,
				function ()
					return self.Title:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 162, _1080p * 1291.14, _1080p * 345.5, _1080p * 375.5, 80 )
				end,
				function ()
					return self.Title:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 162, _1080p * 1291.14, _1080p * 345.5, _1080p * 375.5, 2269 )
				end,
				function ()
					return self.Title:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 244, _1080p * 1373.14, _1080p * 345.5, _1080p * 375.5, 89 )
				end,
				function ()
					return self.Title:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -769, _1080p * 360.14, _1080p * 345.5, _1080p * 375.5, 390 )
				end,
				function ()
					return self.Title:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -769, _1080p * 360.14, _1080p * 345.5, _1080p * 375.5, 69 )
				end
			}
		} )
		Blood:RegisterAnimationSequence( "slideIn", {
			{
				function ()
					return self.Blood:SetAlpha( 1, 0 )
				end,
				function ()
					return self.Blood:SetAlpha( 1, 3480 )
				end,
				function ()
					return self.Blood:SetAlpha( 0, 70 )
				end
			},
			{
				function ()
					return self.Blood:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -904, _1080p * -648, _1080p * 256.69, _1080p * 512.69, 0 )
				end,
				function ()
					return self.Blood:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -8, _1080p * 248, _1080p * 256.69, _1080p * 512.69, 560 )
				end,
				function ()
					return self.Blood:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 74, _1080p * 330, _1080p * 256.69, _1080p * 512.69, 89 )
				end,
				function ()
					return self.Blood:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -8, _1080p * 248, _1080p * 256.69, _1080p * 512.69, 80 )
				end,
				function ()
					return self.Blood:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -8, _1080p * 248, _1080p * 256.69, _1080p * 512.69, 2269 )
				end,
				function ()
					return self.Blood:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 74, _1080p * 330, _1080p * 256.69, _1080p * 512.69, 89 )
				end,
				function ()
					return self.Blood:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -939, _1080p * -683, _1080p * 256.69, _1080p * 512.69, 390 )
				end
			}
		} )
		CosmicTunes:RegisterAnimationSequence( "slideIn", {
			{
				function ()
					return self.CosmicTunes:SetAlpha( 1, 0 )
				end,
				function ()
					return self.CosmicTunes:SetAlpha( 1, 3480 )
				end,
				function ()
					return self.CosmicTunes:SetAlpha( 0, 70 )
				end
			},
			{
				function ()
					return self.CosmicTunes:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -862, _1080p * -734, _1080p * 286.69, _1080p * 414.69, 0 )
				end,
				function ()
					return self.CosmicTunes:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 34, _1080p * 162, _1080p * 286.69, _1080p * 414.69, 560 )
				end,
				function ()
					return self.CosmicTunes:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 116, _1080p * 244, _1080p * 286.69, _1080p * 414.69, 89 )
				end,
				function ()
					return self.CosmicTunes:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 34, _1080p * 162, _1080p * 286.69, _1080p * 414.69, 80 )
				end,
				function ()
					return self.CosmicTunes:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 34, _1080p * 162, _1080p * 286.69, _1080p * 414.69, 2269 )
				end,
				function ()
					return self.CosmicTunes:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 116, _1080p * 244, _1080p * 286.69, _1080p * 414.69, 89 )
				end,
				function ()
					return self.CosmicTunes:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -897, _1080p * -769, _1080p * 286.69, _1080p * 414.69, 390 )
				end
			}
		} )
		self._sequences.slideIn = function ()
			Arcane:AnimateSequence( "slideIn" )
			Backing:AnimateSequence( "slideIn" )
			Artist:AnimateSequence( "slideIn" )
			Title:AnimateSequence( "slideIn" )
			Blood:AnimateSequence( "slideIn" )
			CosmicTunes:AnimateSequence( "slideIn" )
		end
		
		Arcane:RegisterAnimationSequence( "slideInSplitScreen", {
			{
				function ()
					return self.Arcane:SetAlpha( 0, 0 )
				end,
				function ()
					return self.Arcane:SetAlpha( 1, 210 )
				end,
				function ()
					return self.Arcane:SetAlpha( 1, 1930 )
				end,
				function ()
					return self.Arcane:SetAlpha( 0, 270 )
				end
			},
			{
				function ()
					return self.Arcane:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 106, _1080p * 616, _1080p * 94.69, _1080p * 606.69, 0 )
				end
			}
		} )
		Backing:RegisterAnimationSequence( "slideInSplitScreen", {
			{
				function ()
					return self.Backing:SetAlpha( 0, 0 )
				end,
				function ()
					return self.Backing:SetAlpha( 1, 210 )
				end,
				function ()
					return self.Backing:SetAlpha( 1, 1930 )
				end,
				function ()
					return self.Backing:SetAlpha( 0, 270 )
				end
			},
			{
				function ()
					return self.Backing:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 404.93, _1080p * 885.93, _1080p * 336, _1080p * 385, 0 )
				end
			}
		} )
		Artist:RegisterAnimationSequence( "slideInSplitScreen", {
			{
				function ()
					return self.Artist:SetAlpha( 0, 0 )
				end,
				function ()
					return self.Artist:SetAlpha( 1, 210 )
				end,
				function ()
					return self.Artist:SetAlpha( 1, 1930 )
				end,
				function ()
					return self.Artist:SetAlpha( 0, 270 )
				end
			},
			{
				function ()
					return self.Artist:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 502, _1080p * 817, _1080p * 381.69, _1080p * 401.69, 0 )
				end
			}
		} )
		Title:RegisterAnimationSequence( "slideInSplitScreen", {
			{
				function ()
					return self.Title:SetAlpha( 0, 0 )
				end,
				function ()
					return self.Title:SetAlpha( 1, 210 )
				end,
				function ()
					return self.Title:SetAlpha( 1, 1930 )
				end,
				function ()
					return self.Title:SetAlpha( 0, 270 )
				end
			},
			{
				function ()
					return self.Title:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 425, _1080p * 1554.14, _1080p * 345.5, _1080p * 375.5, 0 )
				end
			}
		} )
		Blood:RegisterAnimationSequence( "slideInSplitScreen", {
			{
				function ()
					return self.Blood:SetAlpha( 0, 0 )
				end,
				function ()
					return self.Blood:SetAlpha( 1, 210 )
				end,
				function ()
					return self.Blood:SetAlpha( 1, 1930 )
				end,
				function ()
					return self.Blood:SetAlpha( 0, 270 )
				end
			},
			{
				function ()
					return self.Blood:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 255, _1080p * 511, _1080p * 256.69, _1080p * 512.69, 0 )
				end
			}
		} )
		CosmicTunes:RegisterAnimationSequence( "slideInSplitScreen", {
			{
				function ()
					return self.CosmicTunes:SetAlpha( 0, 0 )
				end,
				function ()
					return self.CosmicTunes:SetAlpha( 1, 200 )
				end,
				function ()
					return self.CosmicTunes:SetAlpha( 1, 1940 )
				end,
				function ()
					return self.CosmicTunes:SetAlpha( 0, 270 )
				end
			},
			{
				function ()
					return self.CosmicTunes:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 297, _1080p * 425, _1080p * 286.69, _1080p * 414.69, 0 )
				end
			}
		} )
		self._sequences.slideInSplitScreen = function ()
			Arcane:AnimateSequence( "slideInSplitScreen" )
			Backing:AnimateSequence( "slideInSplitScreen" )
			Artist:AnimateSequence( "slideInSplitScreen" )
			Title:AnimateSequence( "slideInSplitScreen" )
			Blood:AnimateSequence( "slideInSplitScreen" )
			CosmicTunes:AnimateSequence( "slideInSplitScreen" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	self:SubscribeToModel( DataSources.inGame.CP.zombies.songs.songPlayingIndex:GetModel( f1_local1 ), function ()
		if CONDITIONS.MusicPlaylistOnCheck( f1_local1 ) and not CONDITIONS.IsSplitscreen( self ) then
			ACTIONS.AnimateSequence( self, "slideIn" )
		end
		if CONDITIONS.MusicPlaylistOnCheck( f1_local1 ) and CONDITIONS.IsSplitscreen( self ) then
			ACTIONS.AnimateSequence( self, "slideInSplitScreen" )
		end
	end )
	ACTIONS.AnimateSequence( self, "initial" )
	return self
end

MenuBuilder.registerType( "SongSplash", SongSplash )
LockTable( _M )
