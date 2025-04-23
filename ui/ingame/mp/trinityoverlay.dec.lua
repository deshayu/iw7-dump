local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ( f1_arg0, f1_arg1, f1_arg2 )
	local f1_local0 = DataSources.inGame.MP.scorestreakHuds.trinityMissileCount
	f1_arg0:SubscribeToModel( f1_local0:GetModel( f1_arg1 ), function ()
		if f1_local0:GetValue( f1_arg1 ) == 2 then
			ACTIONS.AnimateSequenceByElement( f1_arg0, {
				elementName = "TrinityMissile1",
				sequenceName = "Refill",
				elementPath = "TrinityMissile1"
			} )
			ACTIONS.AnimateSequenceByElement( f1_arg0, {
				elementName = "TrinityMissile2",
				sequenceName = "Refill",
				elementPath = "TrinityMissile2"
			} )
		end
	end, true )
end

function TrinityOverlay( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 1920 * _1080p, 0, 1080 * _1080p )
	self.id = "TrinityOverlay"
	self._animationSets = {}
	self._sequences = {}
	local f3_local1 = controller and controller.controllerIndex
	if not f3_local1 and not Engine.InFrontend() then
		f3_local1 = self:getRootController()
	end
	assert( f3_local1 )
	local f3_local2 = self
	local TrinityScreenElements = nil
	
	TrinityScreenElements = MenuBuilder.BuildRegisteredType( "TrinityScreenElements", {
		controllerIndex = f3_local1
	} )
	TrinityScreenElements.id = "TrinityScreenElements"
	TrinityScreenElements:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, 0, 0 )
	self:addElement( TrinityScreenElements )
	self.TrinityScreenElements = TrinityScreenElements
	
	local ScorestreakStatus = nil
	
	ScorestreakStatus = MenuBuilder.BuildRegisteredType( "ScorestreakStatus", {
		controllerIndex = f3_local1
	} )
	ScorestreakStatus.id = "ScorestreakStatus"
	ScorestreakStatus.VenomOnlineText:setText( Engine.Localize( "LUA_MENU_MP_TRINITY_ONLINE" ), 0 )
	ScorestreakStatus:SetAnchorsAndPosition( 0.5, 0.5, 1, 0, _1080p * -178, _1080p * 222, _1080p * -210, _1080p * -178 )
	self:addElement( ScorestreakStatus )
	self.ScorestreakStatus = ScorestreakStatus
	
	local BracketTL = nil
	
	BracketTL = LUI.UIBorder.new( {
		borderThicknessLeft = _1080p * 2,
		borderThicknessRight = _1080p * 0,
		borderThicknessTop = _1080p * 2,
		borderThicknessBottom = _1080p * 0
	} )
	BracketTL.id = "BracketTL"
	BracketTL:SetBorderThicknessLeft( _1080p * 2, 0 )
	BracketTL:SetBorderThicknessRight( _1080p * 0, 0 )
	BracketTL:SetBorderThicknessTop( _1080p * 2, 0 )
	BracketTL:SetBorderThicknessBottom( _1080p * 0, 0 )
	BracketTL:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -456, _1080p * -162, _1080p * -221, _1080p * -205 )
	self:addElement( BracketTL )
	self.BracketTL = BracketTL
	
	local BracketTR = nil
	
	BracketTR = LUI.UIBorder.new( {
		borderThicknessLeft = _1080p * 0,
		borderThicknessRight = _1080p * 2,
		borderThicknessTop = _1080p * 2,
		borderThicknessBottom = _1080p * 0
	} )
	BracketTR.id = "BracketTR"
	BracketTR:SetBorderThicknessLeft( _1080p * 0, 0 )
	BracketTR:SetBorderThicknessRight( _1080p * 2, 0 )
	BracketTR:SetBorderThicknessTop( _1080p * 2, 0 )
	BracketTR:SetBorderThicknessBottom( _1080p * 0, 0 )
	BracketTR:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 162, _1080p * 456, _1080p * -221, _1080p * -205 )
	self:addElement( BracketTR )
	self.BracketTR = BracketTR
	
	local BracketBR = nil
	
	BracketBR = LUI.UIBorder.new( {
		borderThicknessLeft = _1080p * 0,
		borderThicknessRight = _1080p * 2,
		borderThicknessTop = _1080p * 0,
		borderThicknessBottom = _1080p * 2
	} )
	BracketBR.id = "BracketBR"
	BracketBR:SetBorderThicknessLeft( _1080p * 0, 0 )
	BracketBR:SetBorderThicknessRight( _1080p * 2, 0 )
	BracketBR:SetBorderThicknessTop( _1080p * 0, 0 )
	BracketBR:SetBorderThicknessBottom( _1080p * 2, 0 )
	BracketBR:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 162, _1080p * 456, _1080p * 205, _1080p * 221 )
	self:addElement( BracketBR )
	self.BracketBR = BracketBR
	
	local BracketBL = nil
	
	BracketBL = LUI.UIBorder.new( {
		borderThicknessLeft = _1080p * 2,
		borderThicknessRight = _1080p * 0,
		borderThicknessTop = _1080p * 0,
		borderThicknessBottom = _1080p * 2
	} )
	BracketBL.id = "BracketBL"
	BracketBL:SetBorderThicknessLeft( _1080p * 2, 0 )
	BracketBL:SetBorderThicknessRight( _1080p * 0, 0 )
	BracketBL:SetBorderThicknessTop( _1080p * 0, 0 )
	BracketBL:SetBorderThicknessBottom( _1080p * 2, 0 )
	BracketBL:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -456, _1080p * -162, _1080p * 205, _1080p * 221 )
	self:addElement( BracketBL )
	self.BracketBL = BracketBL
	
	local TrackingText = nil
	
	TrackingText = LUI.UIText.new()
	TrackingText.id = "TrackingText"
	TrackingText:setText( ToUpperCase( Engine.Localize( "WEAPON_OSCOPE_ATTACHMENT" ) ), 0 )
	TrackingText:SetFontSize( 20 * _1080p )
	TrackingText:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	TrackingText:SetAlignment( LUI.Alignment.Left )
	TrackingText:SetOptOutRightToLeftAlignmentFlip( true )
	TrackingText:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -440, _1080p * 5, _1080p * -217.71, _1080p * -197.71 )
	self:addElement( TrackingText )
	self.TrackingText = TrackingText
	
	local RangeText = nil
	
	RangeText = LUI.UIText.new()
	RangeText.id = "RangeText"
	RangeText:setText( ToUpperCase( Engine.Localize( "MPUI_RANGE" ) ), 0 )
	RangeText:SetFontSize( 20 * _1080p )
	RangeText:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	RangeText:SetAlignment( LUI.Alignment.Right )
	RangeText:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -5, _1080p * 440, _1080p * -217.71, _1080p * -197.71 )
	self:addElement( RangeText )
	self.RangeText = RangeText
	
	local TechyDigitsTracking = nil
	
	TechyDigitsTracking = MenuBuilder.BuildRegisteredType( "UITechyDigits", {
		digits = 3,
		minValue = 0,
		maxValue = 100000000,
		longWait = 340,
		shortWaitMin = 20,
		shortWaitMax = 60,
		pulsesMin = 3,
		pulsesMax = 7,
		controllerIndex = f3_local1
	} )
	TechyDigitsTracking.id = "TechyDigitsTracking"
	TechyDigitsTracking:SetFontSize( 18 * _1080p )
	TechyDigitsTracking:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	TechyDigitsTracking:SetAlignment( LUI.Alignment.Left )
	TechyDigitsTracking:SetOptOutRightToLeftAlignmentFlip( true )
	TechyDigitsTracking:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -438, _1080p * -308, _1080p * -196, _1080p * -178 )
	self:addElement( TechyDigitsTracking )
	self.TechyDigitsTracking = TechyDigitsTracking
	
	local TechyDigitsRange = nil
	
	TechyDigitsRange = MenuBuilder.BuildRegisteredType( "UITechyDigits", {
		digits = 3,
		minValue = 0,
		maxValue = 100000000,
		longWait = 340,
		shortWaitMin = 20,
		shortWaitMax = 60,
		pulsesMin = 3,
		pulsesMax = 7,
		controllerIndex = f3_local1
	} )
	TechyDigitsRange.id = "TechyDigitsRange"
	TechyDigitsRange:SetFontSize( 18 * _1080p )
	TechyDigitsRange:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	TechyDigitsRange:SetAlignment( LUI.Alignment.Right )
	TechyDigitsRange:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 308, _1080p * 438, _1080p * -196, _1080p * -178 )
	self:addElement( TechyDigitsRange )
	self.TechyDigitsRange = TechyDigitsRange
	
	local Reticle = nil
	
	Reticle = LUI.UIImage.new()
	Reticle.id = "Reticle"
	Reticle:setImage( RegisterMaterial( "hud_trinity_reticle" ), 0 )
	Reticle:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -210, _1080p * 210, _1080p * -158, _1080p * 158 )
	self:addElement( Reticle )
	self.Reticle = Reticle
	
	local TrinityMissile1 = nil
	
	TrinityMissile1 = MenuBuilder.BuildRegisteredType( "TrinityMissile", {
		controllerIndex = f3_local1
	} )
	TrinityMissile1.id = "TrinityMissile1"
	TrinityMissile1.MissileNum:setText( "1", 0 )
	TrinityMissile1:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -358, _1080p * -258, _1080p * -100, _1080p * 100 )
	self:addElement( TrinityMissile1 )
	self.TrinityMissile1 = TrinityMissile1
	
	local TrinityMissile2 = nil
	
	TrinityMissile2 = MenuBuilder.BuildRegisteredType( "TrinityMissile", {
		controllerIndex = f3_local1
	} )
	TrinityMissile2.id = "TrinityMissile2"
	TrinityMissile2.MissileNum:setText( "2", 0 )
	TrinityMissile2:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 258, _1080p * 358, _1080p * -100, _1080p * 100 )
	self:addElement( TrinityMissile2 )
	self.TrinityMissile2 = TrinityMissile2
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		TrinityScreenElements:RegisterAnimationSequence( "BootupSpectator", {
			{
				function ()
					return self.TrinityScreenElements:SetAlpha( 0, 0 )
				end
			}
		} )
		ScorestreakStatus:RegisterAnimationSequence( "BootupSpectator", {
			{
				function ()
					return self.ScorestreakStatus:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.BootupSpectator = function ()
			TrinityScreenElements:AnimateSequence( "BootupSpectator" )
			ScorestreakStatus:AnimateSequence( "BootupSpectator" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	self:SubscribeToModel( DataSources.inGame.MP.scorestreakHuds.trinityMissileCount:GetModel( f3_local1 ), function ()
		if DataSources.inGame.MP.scorestreakHuds.trinityMissileCount:GetValue( f3_local1 ) ~= nil and DataSources.inGame.MP.scorestreakHuds.trinityMissileCount:GetValue( f3_local1 ) == 1 then
			ACTIONS.AnimateSequenceByElement( self, {
				elementName = "TrinityMissile1",
				sequenceName = "Empty",
				elementPath = "TrinityMissile1"
			} )
		end
		if DataSources.inGame.MP.scorestreakHuds.trinityMissileCount:GetValue( f3_local1 ) ~= nil and DataSources.inGame.MP.scorestreakHuds.trinityMissileCount:GetValue( f3_local1 ) == 0 then
			ACTIONS.AnimateSequenceByElement( self, {
				elementName = "TrinityMissile2",
				sequenceName = "Empty",
				elementPath = "TrinityMissile2"
			} )
		end
		if DataSources.inGame.MP.scorestreakHuds.trinityMissileCount:GetValue( f3_local1 ) ~= nil and DataSources.inGame.MP.scorestreakHuds.trinityMissileCount:GetValue( f3_local1 ) == -1 then
			ACTIONS.AnimateSequenceByElement( self, {
				elementName = "TrinityMissile1",
				sequenceName = "Empty",
				elementPath = "TrinityMissile1"
			} )
			ACTIONS.AnimateSequenceByElement( self, {
				elementName = "TrinityMissile2",
				sequenceName = "Empty",
				elementPath = "TrinityMissile2"
			} )
		end
	end )
	f0_local0( self, f3_local1, controller )
	ACTIONS.AnimateSequenceByElement( self, {
		elementName = "ScorestreakStatus",
		sequenceName = "GreyscaleState",
		elementPath = "ScorestreakStatus"
	} )
	if CONDITIONS.InKillCam( self ) or CONDITIONS.IsSpectating( self ) then
		ACTIONS.AnimateSequence( self, "BootupSpectator" )
	end
	return self
end

MenuBuilder.registerType( "TrinityOverlay", TrinityOverlay )
LockTable( _M )
