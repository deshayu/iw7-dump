local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function PostLoadFunc( f1_arg0, f1_arg1, f1_arg2 )
	local f1_local0 = DataSources.inGame.player.currentWeapon.inFullADS
	local f1_local1 = f1_arg0.Crosshairs
	f1_arg0:SubscribeToModel( f1_local0:GetModel( f1_arg1 ), function ( f2_arg0 )
		local f2_local0 = f1_local0:GetValue( f1_arg1 )
		local f2_local1
		if f2_local0 then
			f2_local1 = 30
			if not f2_local1 then
			
			else
				local f2_local2
				if f2_local0 then
					f2_local2 = -45
					if not f2_local2 then
					
					else
						f1_local1:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -f2_local1, _1080p * f2_local1, _1080p * -f2_local1, _1080p * f2_local1, 100 )
						f1_local1:SetZRotation( f2_local2, 100 )
					end
				end
				f2_local2 = 0
			end
		end
		f2_local1 = 50
	end, true )
	if GameX.IsSplitscreen() then
		assert( f1_arg0.Boosters )
		assert( f1_arg0.BoostersCopy0 )
		assert( f1_arg0.ScorestreakStatus )
		f1_arg0.Boosters:SetAnchorsAndPosition( 0, 1, 0.5, 0.5, _1080p * 194, _1080p * 494, _1080p * 87, _1080p * 127 )
		f1_arg0.BoostersCopy0:SetAnchorsAndPosition( 1, 0, 0.5, 0.5, _1080p * -494, _1080p * -194, _1080p * 87, _1080p * 127 )
		f1_arg0.ScorestreakStatus:SetAnchorsAndPosition( 0.5, 0.5, 1, 0, _1080p * -198, _1080p * 202, _1080p * -212, _1080p * -180 )
	end
end

function ApexScorestreak( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 1920 * _1080p, 0, 1080 * _1080p )
	self.id = "ApexScorestreak"
	self._animationSets = {}
	self._sequences = {}
	local f3_local1 = controller and controller.controllerIndex
	if not f3_local1 and not Engine.InFrontend() then
		f3_local1 = self:getRootController()
	end
	assert( f3_local1 )
	local f3_local2 = self
	local FrameBottom = nil
	
	FrameBottom = LUI.UIImage.new()
	FrameBottom.id = "FrameBottom"
	FrameBottom:setImage( RegisterMaterial( "hud_apex_frame_bottom" ), 0 )
	FrameBottom:SetBlendMode( BLEND_MODE.addWithAlpha )
	FrameBottom:SetAnchorsAndPosition( 0, 0, 1, 0, 0, 0, _1080p * -256, 0 )
	self:addElement( FrameBottom )
	self.FrameBottom = FrameBottom
	
	local FrameTop = nil
	
	FrameTop = LUI.UIImage.new()
	FrameTop.id = "FrameTop"
	FrameTop:setImage( RegisterMaterial( "hud_apex_frame_top" ), 0 )
	FrameTop:SetBlendMode( BLEND_MODE.addWithAlpha )
	FrameTop:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, _1080p * -10, _1080p * 246 )
	self:addElement( FrameTop )
	self.FrameTop = FrameTop
	
	local ArtificialHorizon = nil
	
	ArtificialHorizon = MenuBuilder.BuildRegisteredType( "ApexArtificialHorizon", {
		controllerIndex = f3_local1
	} )
	ArtificialHorizon.id = "ArtificialHorizon"
	ArtificialHorizon:SetRGBFromTable( SWATCHES.apex.stable, 0 )
	ArtificialHorizon:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -714, _1080p * 714, _1080p * -344, _1080p * 344 )
	ArtificialHorizon:BindZRotationToModel( DataSources.inGame.MP.scorestreakHuds.miniJackalRoll:GetModel( f3_local1 ) )
	self:addElement( ArtificialHorizon )
	self.ArtificialHorizon = ArtificialHorizon
	
	local Crosshairs = nil
	
	Crosshairs = MenuBuilder.BuildRegisteredType( "GenericReticleCrosshairs", {
		controllerIndex = f3_local1
	} )
	Crosshairs.id = "Crosshairs"
	Crosshairs:SetRGBFromTable( SWATCHES.apex.stable, 0 )
	Crosshairs.rightLine:SetLeft( _1080p * -20, 0 )
	Crosshairs.rightLine:SetTop( _1080p * -0.5, 0 )
	Crosshairs.rightLine:SetBottom( _1080p * 0.5, 0 )
	Crosshairs.leftLine:SetRight( _1080p * 20, 0 )
	Crosshairs.leftLine:SetTop( _1080p * -0.5, 0 )
	Crosshairs.leftLine:SetBottom( _1080p * 0.5, 0 )
	Crosshairs.bottomLine:SetLeft( _1080p * -0.5, 0 )
	Crosshairs.bottomLine:SetRight( _1080p * 0.5, 0 )
	Crosshairs.bottomLine:SetTop( _1080p * -20, 0 )
	Crosshairs.topLine:SetLeft( _1080p * -0.5, 0 )
	Crosshairs.topLine:SetRight( _1080p * 0.5, 0 )
	Crosshairs.topLine:SetBottom( _1080p * 20, 0 )
	Crosshairs:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -50, _1080p * 50, _1080p * -50, _1080p * 50 )
	self:addElement( Crosshairs )
	self.Crosshairs = Crosshairs
	
	local Boosters = nil
	
	Boosters = MenuBuilder.BuildRegisteredType( "ApexBoosters", {
		controllerIndex = f3_local1
	} )
	Boosters.id = "Boosters"
	Boosters:SetAnchorsAndPosition( 0, 1, 0.5, 0.5, _1080p * 194, _1080p * 494, _1080p * -65, _1080p * -25 )
	self:addElement( Boosters )
	self.Boosters = Boosters
	
	local Compass = nil
	
	Compass = MenuBuilder.BuildRegisteredType( "ApexCompass", {
		controllerIndex = f3_local1
	} )
	Compass.id = "Compass"
	Compass:SetRGBFromTable( SWATCHES.apex.warning, 0 )
	Compass:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -115, _1080p * 119, _1080p * 58, _1080p * 69 )
	self:addElement( Compass )
	self.Compass = Compass
	
	local ScorestreakStatus = nil
	
	ScorestreakStatus = MenuBuilder.BuildRegisteredType( "ScorestreakStatus", {
		controllerIndex = f3_local1
	} )
	ScorestreakStatus.id = "ScorestreakStatus"
	ScorestreakStatus.VenomOnlineText:setText( Engine.Localize( "LUA_MENU_MP_APEX_ONLINE" ), 0 )
	ScorestreakStatus:SetAnchorsAndPosition( 0.5, 0.5, 1, 0, _1080p * -178, _1080p * 222, _1080p * -210, _1080p * -178 )
	self:addElement( ScorestreakStatus )
	self.ScorestreakStatus = ScorestreakStatus
	
	local MissileIncomingWarning = nil
	
	MissileIncomingWarning = MenuBuilder.BuildRegisteredType( "MissileIncomingWarning", {
		controllerIndex = f3_local1
	} )
	MissileIncomingWarning.id = "MissileIncomingWarning"
	MissileIncomingWarning:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -512, _1080p * 512, _1080p * 55, _1080p * 311 )
	self:addElement( MissileIncomingWarning )
	self.MissileIncomingWarning = MissileIncomingWarning
	
	local ApexReloadingBar = nil
	
	ApexReloadingBar = MenuBuilder.BuildRegisteredType( "ApexReloadingBar", {
		controllerIndex = f3_local1
	} )
	ApexReloadingBar.id = "ApexReloadingBar"
	ApexReloadingBar:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -78, _1080p * 82, _1080p * 696.37, _1080p * 701.37 )
	self:addElement( ApexReloadingBar )
	self.ApexReloadingBar = ApexReloadingBar
	
	local BoostersCopy0 = nil
	
	BoostersCopy0 = MenuBuilder.BuildRegisteredType( "ApexBoosters", {
		controllerIndex = f3_local1
	} )
	BoostersCopy0.id = "BoostersCopy0"
	BoostersCopy0:SetAnchorsAndPosition( 1, 0, 0.5, 0.5, _1080p * -494, _1080p * -194, _1080p * -65, _1080p * -25 )
	self:addElement( BoostersCopy0 )
	self.BoostersCopy0 = BoostersCopy0
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		FrameTop:RegisterAnimationSequence( "BootupSpectator", {
			{
				function ()
					return self.FrameTop:SetAlpha( 0, 0 )
				end
			}
		} )
		Compass:RegisterAnimationSequence( "BootupSpectator", {
			{
				function ()
					return self.Compass:SetAlpha( 0, 0 )
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
			FrameTop:AnimateSequence( "BootupSpectator" )
			Compass:AnimateSequence( "BootupSpectator" )
			ScorestreakStatus:AnimateSequence( "BootupSpectator" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	self:SubscribeToModel( DataSources.inGame.MP.scorestreakHuds.miniJackalVisible:GetModel( f3_local1 ), function ()
		if not (DataSources.inGame.MP.scorestreakHuds.miniJackalVisible:GetValue( f3_local1 ) == nil or DataSources.inGame.MP.scorestreakHuds.miniJackalVisible:GetValue( f3_local1 ) ~= 1) or DataSources.inGame.MP.scorestreakHuds.miniJackalVisible:GetValue( f3_local1 ) ~= nil and DataSources.inGame.MP.scorestreakHuds.miniJackalVisible:GetValue( f3_local1 ) == 2 then
			ACTIONS.AnimateSequenceByElement( self, {
				elementName = "ScorestreakStatus",
				sequenceName = "YellowOrangeState",
				elementPath = "ScorestreakStatus"
			} )
		end
		if (not (DataSources.inGame.MP.scorestreakHuds.miniJackalVisible:GetValue( f3_local1 ) == nil or DataSources.inGame.MP.scorestreakHuds.miniJackalVisible:GetValue( f3_local1 ) ~= 1) or DataSources.inGame.MP.scorestreakHuds.miniJackalVisible:GetValue( f3_local1 ) ~= nil and DataSources.inGame.MP.scorestreakHuds.miniJackalVisible:GetValue( f3_local1 ) == 2) and (CONDITIONS.InKillCam( self ) or CONDITIONS.IsSpectating( self )) then
			ACTIONS.AnimateSequence( self, "BootupSpectator" )
		end
	end )
	PostLoadFunc( self, f3_local1, controller )
	return self
end

MenuBuilder.registerType( "ApexScorestreak", ApexScorestreak )
LockTable( _M )
