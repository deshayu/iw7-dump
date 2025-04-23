local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function PostLoadFunc( f1_arg0, f1_arg1, f1_arg2 )
	local f1_local0 = assert
	local f1_local1 = f1_arg0.chyronName
	if f1_local1 then
		f1_local1 = f1_arg0.chyronTeam and f1_arg0.chyronLocation
	end
	f1_local0( f1_local1, "WARNING: Europa Chyron Items Are Missing..." )
	f1_local0 = "EUROPA_CHYRON_TITLE"
	f1_local1 = "EUROPA_CHYRON_NAME"
	local f1_local2 = "EUROPA_CHYRON_TEAM"
	local f1_local3 = f1_arg0:Wait( 1000 )
	f1_local3.onComplete = function ()
		f1_arg0.chyronExtra:setText( Engine.Localize( f1_local0 ), 0 )
		f1_local3 = f1_arg0:Wait( 400 )
		f1_arg0.chyronName:setText( Engine.Localize( f1_local1 ), 0 )
		f1_local3 = f1_arg0:Wait( 400 )
		f1_local3.onComplete = function ()
			f1_arg0.chyronTeam:setText( Engine.Localize( f1_local2 ), 0 )
		end
		
	end
	
end

function EuropaChyron( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 350 * _1080p, 0, 115 * _1080p )
	self.id = "EuropaChyron"
	self._animationSets = {}
	self._sequences = {}
	local f4_local1 = controller and controller.controllerIndex
	if not f4_local1 and not Engine.InFrontend() then
		f4_local1 = self:getRootController()
	end
	assert( f4_local1 )
	local f4_local2 = self
	local chyronTeam = nil
	
	chyronTeam = LUI.UIStyledText.new()
	chyronTeam.id = "chyronTeam"
	chyronTeam:setText( "", 0 )
	chyronTeam:SetFontSize( 30 * _1080p )
	chyronTeam:SetFont( FONTS.GetFont( FONTS.MainCondensed.File ) )
	chyronTeam:SetAlignment( LUI.Alignment.Left )
	chyronTeam:SetOptOutRightToLeftAlignmentFlip( true )
	chyronTeam:SetShadowMinDistance( -0.3, 0 )
	chyronTeam:SetShadowMaxDistance( 0.3, 0 )
	chyronTeam:SetShadowUOffset( 0, 0 )
	chyronTeam:SetShadowRGBFromInt( 11524607, 0 )
	chyronTeam:SetDecodeLetterLength( 75 )
	chyronTeam:SetDecodeMaxRandChars( 3 )
	chyronTeam:SetDecodeUpdatesPerLetter( 7 )
	chyronTeam:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 456, _1080p * 115, _1080p * 145 )
	self:addElement( chyronTeam )
	self.chyronTeam = chyronTeam
	
	local chyronName = nil
	
	chyronName = LUI.UIStyledText.new()
	chyronName.id = "chyronName"
	chyronName:setText( "", 0 )
	chyronName:SetFontSize( 30 * _1080p )
	chyronName:SetFont( FONTS.GetFont( FONTS.MainCondensed.File ) )
	chyronName:SetAlignment( LUI.Alignment.Left )
	chyronName:SetOptOutRightToLeftAlignmentFlip( true )
	chyronName:SetShadowMinDistance( -0.3, 0 )
	chyronName:SetShadowMaxDistance( 0.3, 0 )
	chyronName:SetShadowUOffset( 0, 0 )
	chyronName:SetShadowRGBFromInt( 11524607, 0 )
	chyronName:SetDecodeLetterLength( 75 )
	chyronName:SetDecodeMaxRandChars( 3 )
	chyronName:SetDecodeUpdatesPerLetter( 7 )
	chyronName:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 456, _1080p * 85, _1080p * 115 )
	self:addElement( chyronName )
	self.chyronName = chyronName
	
	local chyronExtra = nil
	
	chyronExtra = LUI.UIStyledText.new()
	chyronExtra.id = "chyronExtra"
	chyronExtra:setText( "", 0 )
	chyronExtra:SetFontSize( 30 * _1080p )
	chyronExtra:SetFont( FONTS.GetFont( FONTS.MainCondensed.File ) )
	chyronExtra:SetAlignment( LUI.Alignment.Left )
	chyronExtra:SetOptOutRightToLeftAlignmentFlip( true )
	chyronExtra:SetShadowMinDistance( -0.3, 0 )
	chyronExtra:SetShadowMaxDistance( 0.3, 0 )
	chyronExtra:SetShadowUOffset( 0, 0 )
	chyronExtra:SetShadowRGBFromInt( 11524607, 0 )
	chyronExtra:SetDecodeLetterLength( 75 )
	chyronExtra:SetDecodeMaxRandChars( 3 )
	chyronExtra:SetDecodeUpdatesPerLetter( 7 )
	chyronExtra:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 456, _1080p * 55, _1080p * 85 )
	self:addElement( chyronExtra )
	self.chyronExtra = chyronExtra
	
	local chyronLocation = nil
	
	chyronLocation = LUI.UIStyledText.new()
	chyronLocation.id = "chyronLocation"
	chyronLocation:setText( ToUpperCase( Engine.Localize( "EUROPA_CHYRON_LOCATION" ) ), 0 )
	chyronLocation:SetFontSize( 50 * _1080p )
	chyronLocation:SetFont( FONTS.GetFont( FONTS.MainExtended.File ) )
	chyronLocation:SetAlignment( LUI.Alignment.Left )
	chyronLocation:SetOptOutRightToLeftAlignmentFlip( true )
	chyronLocation:SetShadowMinDistance( -0.1, 0 )
	chyronLocation:SetShadowMaxDistance( 0.1, 0 )
	chyronLocation:SetShadowUOffset( 0, 0 )
	chyronLocation:SetShadowRGBFromInt( 11524607, 0 )
	chyronLocation:SetDecodeLetterLength( 50 )
	chyronLocation:SetDecodeMaxRandChars( 1 )
	chyronLocation:SetDecodeUpdatesPerLetter( 10 )
	chyronLocation:SetAnchorsAndPosition( 0, 0, 0, 1, 0, _1080p * 106, _1080p * 2, _1080p * 52 )
	self:addElement( chyronLocation )
	self.chyronLocation = chyronLocation
	
	local EuropaChyronBracket = nil
	
	EuropaChyronBracket = MenuBuilder.BuildRegisteredType( "EuropaChyronBracket", {
		controllerIndex = f4_local1
	} )
	EuropaChyronBracket.id = "EuropaChyronBracket"
	EuropaChyronBracket:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * -5, _1080p * -101, _1080p * 3.5, _1080p * 51.5 )
	self:addElement( EuropaChyronBracket )
	self.EuropaChyronBracket = EuropaChyronBracket
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		chyronTeam:RegisterAnimationSequence( "Sequence1", {
			{
				function ()
					return self.chyronTeam:SetAlpha( 1, 6000 )
				end,
				function ()
					return self.chyronTeam:SetAlpha( 0, 300 )
				end
			}
		} )
		chyronName:RegisterAnimationSequence( "Sequence1", {
			{
				function ()
					return self.chyronName:SetAlpha( 1, 6000 )
				end,
				function ()
					return self.chyronName:SetAlpha( 0, 300 )
				end
			}
		} )
		chyronLocation:RegisterAnimationSequence( "Sequence1", {
			{
				function ()
					return self.chyronLocation:SetAlpha( 0, 0 )
				end,
				function ()
					return self.chyronLocation:SetAlpha( 0, 580 )
				end,
				function ()
					return self.chyronLocation:SetAlpha( 1, 150 )
				end,
				function ()
					return self.chyronLocation:SetAlpha( 1, 5270 )
				end,
				function ()
					return self.chyronLocation:SetAlpha( 0, 300 )
				end
			}
		} )
		EuropaChyronBracket:RegisterAnimationSequence( "Sequence1", {
			{
				function ()
					return self.EuropaChyronBracket:SetAlpha( 0, 0 )
				end,
				function ()
					return self.EuropaChyronBracket:SetAlpha( 1, 40 )
				end,
				function ()
					return self.EuropaChyronBracket:SetAlpha( 0, 250 )
				end,
				function ()
					return self.EuropaChyronBracket:SetAlpha( 1, 50 )
				end
			},
			{
				function ()
					return self.EuropaChyronBracket.TTL:SetAlpha( 1, 40 )
				end,
				function ()
					return self.EuropaChyronBracket.TTL:SetAlpha( 0, 110 )
				end,
				function ()
					return self.EuropaChyronBracket.TTL:SetAlpha( 0, 30 )
				end,
				function ()
					return self.EuropaChyronBracket.TTL:SetAlpha( 1, 30 )
				end,
				function ()
					return self.EuropaChyronBracket.TTL:SetAlpha( 1, 40 )
				end,
				function ()
					return self.EuropaChyronBracket.TTL:SetAlpha( 1, 1170 )
				end,
				function ()
					return self.EuropaChyronBracket.TTL:SetAlpha( 1, 130 )
				end,
				function ()
					return self.EuropaChyronBracket.TTL:SetAlpha( 0, 110 )
				end
			},
			{
				function ()
					return self.EuropaChyronBracket.TL:SetAlpha( 1, 40 )
				end,
				function ()
					return self.EuropaChyronBracket.TL:SetAlpha( 0, 110 )
				end,
				function ()
					return self.EuropaChyronBracket.TL:SetAlpha( 0, 30 )
				end,
				function ()
					return self.EuropaChyronBracket.TL:SetAlpha( 1, 30 )
				end,
				function ()
					return self.EuropaChyronBracket.TL:SetAlpha( 1, 40 )
				end,
				function ()
					return self.EuropaChyronBracket.TL:SetAlpha( 1, 1170 )
				end,
				function ()
					return self.EuropaChyronBracket.TL:SetAlpha( 1, 130 )
				end,
				function ()
					return self.EuropaChyronBracket.TL:SetAlpha( 0, 110 )
				end
			},
			{
				function ()
					return self.EuropaChyronBracket.BBL:SetAlpha( 1, 40 )
				end,
				function ()
					return self.EuropaChyronBracket.BBL:SetAlpha( 0, 110 )
				end,
				function ()
					return self.EuropaChyronBracket.BBL:SetAlpha( 0, 30 )
				end,
				function ()
					return self.EuropaChyronBracket.BBL:SetAlpha( 1, 30 )
				end,
				function ()
					return self.EuropaChyronBracket.BBL:SetAlpha( 1, 40 )
				end,
				function ()
					return self.EuropaChyronBracket.BBL:SetAlpha( 1, 1170 )
				end,
				function ()
					return self.EuropaChyronBracket.BBL:SetAlpha( 1, 130 )
				end,
				function ()
					return self.EuropaChyronBracket.BBL:SetAlpha( 0, 110 )
				end
			},
			{
				function ()
					return self.EuropaChyronBracket.BL:SetAlpha( 1, 40 )
				end,
				function ()
					return self.EuropaChyronBracket.BL:SetAlpha( 0, 110 )
				end,
				function ()
					return self.EuropaChyronBracket.BL:SetAlpha( 0, 30 )
				end,
				function ()
					return self.EuropaChyronBracket.BL:SetAlpha( 1, 30 )
				end,
				function ()
					return self.EuropaChyronBracket.BL:SetAlpha( 1, 40 )
				end,
				function ()
					return self.EuropaChyronBracket.BL:SetAlpha( 1, 40 )
				end,
				function ()
					return self.EuropaChyronBracket.BL:SetAlpha( 1, 1130 )
				end,
				function ()
					return self.EuropaChyronBracket.BL:SetAlpha( 1, 130 )
				end,
				function ()
					return self.EuropaChyronBracket.BL:SetAlpha( 0, 110 )
				end
			},
			{
				function ()
					return self.EuropaChyronBracket.TTR:SetAlpha( 0, 70 )
				end,
				function ()
					return self.EuropaChyronBracket.TTR:SetAlpha( 1, 40 )
				end,
				function ()
					return self.EuropaChyronBracket.TTR:SetAlpha( 0, 40 )
				end,
				function ()
					return self.EuropaChyronBracket.TTR:SetAlpha( 1, 30 )
				end,
				function ()
					return self.EuropaChyronBracket.TTR:SetAlpha( 1, 70 )
				end,
				function ()
					return self.EuropaChyronBracket.TTR:SetAlpha( 1, 1170 )
				end,
				function ()
					return self.EuropaChyronBracket.TTR:SetAlpha( 1, 130 )
				end,
				function ()
					return self.EuropaChyronBracket.TTR:SetAlpha( 0, 310 )
				end
			},
			{
				function ()
					return self.EuropaChyronBracket.TR:SetAlpha( 0, 70 )
				end,
				function ()
					return self.EuropaChyronBracket.TR:SetAlpha( 1, 40 )
				end,
				function ()
					return self.EuropaChyronBracket.TR:SetAlpha( 0, 40 )
				end,
				function ()
					return self.EuropaChyronBracket.TR:SetAlpha( 1, 30 )
				end,
				function ()
					return self.EuropaChyronBracket.TR:SetAlpha( 1, 70 )
				end,
				function ()
					return self.EuropaChyronBracket.TR:SetAlpha( 1, 1170 )
				end,
				function ()
					return self.EuropaChyronBracket.TR:SetAlpha( 1, 130 )
				end,
				function ()
					return self.EuropaChyronBracket.TR:SetAlpha( 0, 310 )
				end
			},
			{
				function ()
					return self.EuropaChyronBracket.BBR:SetAlpha( 0, 70 )
				end,
				function ()
					return self.EuropaChyronBracket.BBR:SetAlpha( 1, 40 )
				end,
				function ()
					return self.EuropaChyronBracket.BBR:SetAlpha( 0, 40 )
				end,
				function ()
					return self.EuropaChyronBracket.BBR:SetAlpha( 1, 30 )
				end,
				function ()
					return self.EuropaChyronBracket.BBR:SetAlpha( 1, 70 )
				end,
				function ()
					return self.EuropaChyronBracket.BBR:SetAlpha( 1, 1170 )
				end,
				function ()
					return self.EuropaChyronBracket.BBR:SetAlpha( 1, 130 )
				end,
				function ()
					return self.EuropaChyronBracket.BBR:SetAlpha( 0, 310 )
				end
			},
			{
				function ()
					return self.EuropaChyronBracket.BR:SetAlpha( 0, 70 )
				end,
				function ()
					return self.EuropaChyronBracket.BR:SetAlpha( 1, 40 )
				end,
				function ()
					return self.EuropaChyronBracket.BR:SetAlpha( 0, 40 )
				end,
				function ()
					return self.EuropaChyronBracket.BR:SetAlpha( 1, 30 )
				end,
				function ()
					return self.EuropaChyronBracket.BR:SetAlpha( 1, 70 )
				end,
				function ()
					return self.EuropaChyronBracket.BR:SetAlpha( 1, 1170 )
				end,
				function ()
					return self.EuropaChyronBracket.BR:SetAlpha( 1, 130 )
				end,
				function ()
					return self.EuropaChyronBracket.BR:SetAlpha( 0, 310 )
				end
			},
			{
				function ()
					return self.EuropaChyronBracket:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -6, _1080p * 40, 0, _1080p * 51.5, 0 )
				end,
				function ()
					return self.EuropaChyronBracket:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -6, _1080p * 40, 0, _1080p * 51.5, 500 )
				end,
				function ()
					return self.EuropaChyronBracket:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -6, _1080p * 260, 0, _1080p * 51.5, 350, LUI.EASING.outQuintic )
				end
			}
		} )
		self._sequences.Sequence1 = function ()
			chyronTeam:AnimateSequence( "Sequence1" )
			chyronName:AnimateSequence( "Sequence1" )
			chyronLocation:AnimateSequence( "Sequence1" )
			EuropaChyronBracket:AnimateSequence( "Sequence1" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	PostLoadFunc( self, f4_local1, controller )
	ACTIONS.AnimateSequence( self, "Sequence1" )
	return self
end

MenuBuilder.registerType( "EuropaChyron", EuropaChyron )
LockTable( _M )
