local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ( f1_arg0, f1_arg1, f1_arg2 )
	f1_arg0:SubscribeToModel( DataSources.inGame.HUD.pointsPopupNotify:GetModel( f1_arg1 ), function ()
		ACTIONS.AnimateSequence( f1_arg0, "ShowPointsPopup" )
	end, true )
	assert( f1_arg0.PlusText )
	assert( f1_arg0.PointsText )
	f1_arg0.PointsText:SetShadowVOffset( -0 )
	f1_arg0.PointsText:SetShadowUOffset( -0 )
	f1_arg0.PlusText:SetShadowVOffset( -0 )
	f1_arg0.PlusText:SetShadowUOffset( -0 )
end

function PointsPopup( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 124 * _1080p, 0, 64 * _1080p )
	self.id = "PointsPopup"
	self._animationSets = {}
	self._sequences = {}
	local f3_local1 = controller and controller.controllerIndex
	if not f3_local1 and not Engine.InFrontend() then
		f3_local1 = self:getRootController()
	end
	assert( f3_local1 )
	local f3_local2 = self
	local Glow = nil
	
	Glow = LUI.UIImage.new()
	Glow.id = "Glow"
	Glow:SetAlpha( 0, 0 )
	Glow:setImage( RegisterMaterial( "hud_glow" ), 0 )
	Glow:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -50, _1080p * 206, _1080p * 5, _1080p * 55 )
	self:addElement( Glow )
	self.Glow = Glow
	
	local PointsText = nil
	
	PointsText = LUI.UIStyledText.new()
	PointsText.id = "PointsText"
	PointsText:SetAlpha( 0, 0 )
	PointsText:SetGlitchEnabled( true )
	PointsText:SetGlitchAmount( 1, 0 )
	PointsText:SetGlitchBlockWidth( 10, 0 )
	PointsText:SetGlitchBlockHeight( 10, 0 )
	PointsText:SetGlitchDistortionRange( 16, 0 )
	PointsText:SetGlitchScanlinePitch( 1, 0 )
	PointsText:SetGlitchMaskPitch( 1, 0 )
	PointsText:SetFontSize( 30 * _1080p )
	PointsText:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	PointsText:SetAlignment( LUI.Alignment.Left )
	PointsText:SetOptOutRightToLeftAlignmentFlip( true )
	PointsText:SetShadowMinDistance( -0.2, 0 )
	PointsText:SetShadowMaxDistance( 0.2, 0 )
	PointsText:SetShadowRGBFromInt( 0, 0 )
	PointsText:SetAnchorsAndPosition( 0, 0, 0.5, 0.5, _1080p * 44, 0, _1080p * -17, _1080p * 13 )
	PointsText:SubscribeToModel( DataSources.inGame.HUD.pointsPopupNum:GetModel( f3_local1 ), function ()
		local f4_local0 = DataSources.inGame.HUD.pointsPopupNum:GetValue( f3_local1 )
		if f4_local0 ~= nil then
			PointsText:setText( f4_local0, 0 )
		end
	end )
	self:addElement( PointsText )
	self.PointsText = PointsText
	
	local PlusText = nil
	
	PlusText = LUI.UIStyledText.new()
	PlusText.id = "PlusText"
	PlusText:SetAlpha( 0, 0 )
	PlusText:SetGlitchEnabled( true )
	PlusText:SetGlitchAmount( 1, 0 )
	PlusText:SetGlitchBlockWidth( 50, 0 )
	PlusText:SetGlitchBlockHeight( 50, 0 )
	PlusText:SetGlitchDistortionRange( 16, 0 )
	PlusText:SetGlitchScanlinePitch( 1, 0 )
	PlusText:SetGlitchMaskPitch( 1, 0 )
	PlusText:setText( Engine.Localize( "MP_PLUS" ), 0 )
	PlusText:SetFontSize( 30 * _1080p )
	PlusText:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	PlusText:SetAlignment( LUI.Alignment.Right )
	PlusText:SetOptOutRightToLeftAlignmentFlip( true )
	PlusText:SetShadowMinDistance( -0.2, 0 )
	PlusText:SetShadowMaxDistance( 0.2, 0 )
	PlusText:SetShadowRGBFromInt( 0, 0 )
	PlusText:SetAnchorsAndPosition( 0, 0, 0.5, 0.5, _1080p * -67, _1080p * -84, _1080p * -17, _1080p * 13 )
	self:addElement( PlusText )
	self.PlusText = PlusText
	
	local ScoreEventFeed = nil
	
	ScoreEventFeed = MenuBuilder.BuildRegisteredType( "ScoreEventFeed", {
		controllerIndex = f3_local1
	} )
	ScoreEventFeed.id = "ScoreEventFeed"
	ScoreEventFeed:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 64, _1080p * 1203, _1080p * -14, _1080p * 220 )
	self:addElement( ScoreEventFeed )
	self.ScoreEventFeed = ScoreEventFeed
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		Glow:RegisterAnimationSequence( "ShowPointsPopup", {
			{
				function ()
					return self.Glow:SetAlpha( 1, 0 )
				end,
				function ()
					return self.Glow:SetAlpha( 0.6, 60 )
				end,
				function ()
					return self.Glow:SetAlpha( 0.4, 60, LUI.EASING.outQuadratic )
				end,
				function ()
					return self.Glow:SetAlpha( 0, 80 )
				end
			},
			{
				function ()
					return self.Glow:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 36.68, _1080p * 107.32, _1080p * 22, _1080p * 36, 0 )
				end,
				function ()
					return self.Glow:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -112.68, _1080p * 268.86, _1080p * 4, _1080p * 55, 59 )
				end,
				function ()
					return self.Glow:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 31, _1080p * 112.82, _1080p * 25.72, _1080p * 34.28, 59, LUI.EASING.outQuadratic )
				end
			}
		} )
		PointsText:RegisterAnimationSequence( "ShowPointsPopup", {
			{
				function ()
					return self.PointsText:SetAlpha( 1, 0 )
				end,
				function ()
					return self.PointsText:SetAlpha( 1, 1180 )
				end,
				function ()
					return self.PointsText:SetAlpha( 0, 270 )
				end
			},
			{
				function ()
					return self.PointsText:SetGlitchAmount( 0, 0 )
				end,
				function ()
					return self.PointsText:SetGlitchAmount( 0, 1180 )
				end,
				function ()
					return self.PointsText:SetGlitchAmount( 1, 270 )
				end
			},
			{
				function ()
					return self.PointsText:SetGlitchDistortionRange( 10, 1180 )
				end,
				function ()
					return self.PointsText:SetGlitchDistortionRange( 60, 120 )
				end,
				function ()
					return self.PointsText:SetGlitchDistortionRange( 15, 100 )
				end,
				function ()
					return self.PointsText:SetGlitchDistortionRange( 30, 50 )
				end
			},
			{
				function ()
					return self.PointsText:SetGlitchScanlinePitch( 30, 1180 )
				end,
				function ()
					return self.PointsText:SetGlitchScanlinePitch( 5, 120 )
				end,
				function ()
					return self.PointsText:SetGlitchScanlinePitch( 1, 100 )
				end,
				function ()
					return self.PointsText:SetGlitchScanlinePitch( 1, 50 )
				end
			},
			{
				function ()
					return self.PointsText:SetGlitchMaskPitch( 50, 1180 )
				end,
				function ()
					return self.PointsText:SetGlitchMaskPitch( 10, 120 )
				end,
				function ()
					return self.PointsText:SetGlitchMaskPitch( 2, 100 )
				end,
				function ()
					return self.PointsText:SetGlitchMaskPitch( 1, 50 )
				end
			},
			{
				function ()
					return self.PointsText:SetGlitchBlockWidth( 7, 1180 )
				end,
				function ()
					return self.PointsText:SetGlitchBlockWidth( 20, 120 )
				end,
				function ()
					return self.PointsText:SetGlitchBlockWidth( 8, 100 )
				end,
				function ()
					return self.PointsText:SetGlitchBlockWidth( 15, 50 )
				end
			},
			{
				function ()
					return self.PointsText:SetGlitchBlockHeight( 8, 1180 )
				end,
				function ()
					return self.PointsText:SetGlitchBlockHeight( 20, 120 )
				end,
				function ()
					return self.PointsText:SetGlitchBlockHeight( 8, 100 )
				end,
				function ()
					return self.PointsText:SetGlitchBlockHeight( 15, 50 )
				end
			},
			{
				function ()
					return self.PointsText:SetAnchorsAndPosition( 0, 0, 0.5, 0.5, _1080p * 50, _1080p * 32, _1080p * -14, _1080p * 8, 0 )
				end,
				function ()
					return self.PointsText:SetAnchorsAndPosition( 0, 0, 0.5, 0.5, _1080p * 34.5, _1080p * 47, _1080p * -23.5, _1080p * 18.5, 59 )
				end,
				function ()
					return self.PointsText:SetAnchorsAndPosition( 0, 0, 0.5, 0.5, _1080p * 43, _1080p * 26, _1080p * -17, _1080p * 13, 59 )
				end
			}
		} )
		PlusText:RegisterAnimationSequence( "ShowPointsPopup", {
			{
				function ()
					return self.PlusText:SetGlitchAmount( 0, 0 )
				end,
				function ()
					return self.PlusText:SetGlitchAmount( 0, 1180 )
				end,
				function ()
					return self.PlusText:SetGlitchAmount( 1, 270 )
				end
			},
			{
				function ()
					return self.PlusText:SetAlpha( 1, 0 )
				end,
				function ()
					return self.PlusText:SetAlpha( 1, 1180 )
				end,
				function ()
					return self.PlusText:SetAlpha( 0, 270 )
				end
			},
			{
				function ()
					return self.PlusText:SetAnchorsAndPosition( 0, 0, 0.5, 0.5, _1080p * -61, _1080p * -78, _1080p * -14, _1080p * 8, 0 )
				end,
				function ()
					return self.PlusText:SetAnchorsAndPosition( 0, 0, 0.5, 0.5, _1080p * -76.5, _1080p * -93.5, _1080p * -23.5, _1080p * 18.5, 59 )
				end,
				function ()
					return self.PlusText:SetAnchorsAndPosition( 0, 0, 0.5, 0.5, _1080p * -68, _1080p * -85, _1080p * -18, _1080p * 14, 59 )
				end
			}
		} )
		self._sequences.ShowPointsPopup = function ()
			Glow:AnimateSequence( "ShowPointsPopup" )
			PointsText:AnimateSequence( "ShowPointsPopup" )
			PlusText:AnimateSequence( "ShowPointsPopup" )
		end
		
		self._sequences.ShowPointsPopupDesc = function ()
			
		end
		
		PointsText:RegisterAnimationSequence( "HidePointsPopup", {
			{
				function ()
					return self.PointsText:SetAlpha( 0, 0 )
				end
			}
		} )
		PlusText:RegisterAnimationSequence( "HidePointsPopup", {
			{
				function ()
					return self.PlusText:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.HidePointsPopup = function ()
			PointsText:AnimateSequence( "HidePointsPopup" )
			PlusText:AnimateSequence( "HidePointsPopup" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	self:SubscribeToModel( DataSources.inGame.HUD.pointsPopupNum:GetModel( f3_local1 ), function ()
		if CONDITIONS.InKillCam( self ) or CONDITIONS.IsSpectatingNotCODCaster( self ) then
			ACTIONS.AnimateSequence( self, "HidePointsPopup" )
		end
	end )
	f0_local0( self, f3_local1, controller )
	return self
end

MenuBuilder.registerType( "PointsPopup", PointsPopup )
LockTable( _M )
