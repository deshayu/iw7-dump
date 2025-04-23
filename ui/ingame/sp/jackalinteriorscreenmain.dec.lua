local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function PostLoadFunc( f1_arg0, f1_arg1, f1_arg2 )
	f1_arg0:SetupInWorldElement( {
		entityNum = Game.GetOmnvar( "ui_jackal_entity" ),
		entityTag = "tag_cockpit_light_monitor2"
	} )
	f1_arg0:SetInWorldScale( 0.01 )
	f1_arg0:SetFollowTagAngles( true )
	f1_arg0:SetTagSpacePosition( 0, -0.08, 0 )
	f1_arg0:SetDelayedRender( true )
end

function JackalInteriorScreenMain( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 1920 * _1080p, 0, 1080 * _1080p )
	self.id = "JackalInteriorScreenMain"
	self._animationSets = {}
	self._sequences = {}
	local f2_local1 = controller and controller.controllerIndex
	if not f2_local1 and not Engine.InFrontend() then
		f2_local1 = self:getRootController()
	end
	assert( f2_local1 )
	local f2_local2 = self
	local Background = nil
	
	Background = LUI.UIImage.new()
	Background.id = "Background"
	Background:setImage( RegisterMaterial( "hud_jackal_interior_background" ), 0 )
	self:addElement( Background )
	self.Background = Background
	
	local RadarPing = nil
	
	RadarPing = MenuBuilder.BuildRegisteredType( "JackalInteriorScreenMainRadar", {
		controllerIndex = f2_local1
	} )
	RadarPing.id = "RadarPing"
	RadarPing:SetScale( 0.2, 0 )
	RadarPing:SetAnchorsAndPosition( 1, 0, 0, 0, _1080p * -1184, _1080p * -160, _1080p * 57, _1080p * 57 )
	self:addElement( RadarPing )
	self.RadarPing = RadarPing
	
	local AltimeterBG = nil
	
	AltimeterBG = LUI.UIImage.new()
	AltimeterBG.id = "AltimeterBG"
	AltimeterBG:SetScale( -0.25, 0 )
	AltimeterBG:setImage( RegisterMaterial( "hud_jackal_interior_alt_circle_color" ), 0 )
	AltimeterBG:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -915, _1080p * -403, _1080p * -492, _1080p * 20 )
	AltimeterBG:BindZRotationToModel( DataSources.inGame.jackal.roll:GetModel( f2_local1 ) )
	self:addElement( AltimeterBG )
	self.AltimeterBG = AltimeterBG
	
	local Base = nil
	
	Base = LUI.UIImage.new()
	Base.id = "Base"
	Base:setImage( RegisterMaterial( "hud_jackal_interior_main_base" ), 0 )
	Base:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 1920, 0, _1080p * 1080 )
	self:addElement( Base )
	self.Base = Base
	
	local AltimeterArrows = nil
	
	AltimeterArrows = LUI.UIImage.new()
	AltimeterArrows.id = "AltimeterArrows"
	AltimeterArrows:SetRGBFromTable( SWATCHES.jackal.stable, 0 )
	AltimeterArrows:SetScale( -0.25, 0 )
	AltimeterArrows:setImage( RegisterMaterial( "hud_jackal_interior_main_alt_circle_arrows" ), 0 )
	AltimeterArrows:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -916, _1080p * -404, _1080p * -269, _1080p * -205 )
	AltimeterArrows:BindZRotationToModel( DataSources.inGame.jackal.roll:GetModel( f2_local1 ) )
	self:addElement( AltimeterArrows )
	self.AltimeterArrows = AltimeterArrows
	
	local Compass = nil
	
	Compass = LUI.UIImage.new()
	Compass.id = "Compass"
	Compass:SetScale( -0.2, 0 )
	Compass:setImage( RegisterMaterial( "hud_jackal_interior_main_compass" ), 0 )
	Compass:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -787, _1080p * -531, _1080p * -93.5, _1080p * 162.5 )
	Compass:BindZRotationToModel( DataSources.inGame.HUD.compassRotation:GetModel( f2_local1 ) )
	self:addElement( Compass )
	self.Compass = Compass
	
	local DisplayOverlay = nil
	
	DisplayOverlay = MenuBuilder.BuildRegisteredType( "JackalInteriorDisplayOverlayLarge", {
		controllerIndex = f2_local1
	} )
	DisplayOverlay.id = "DisplayOverlay"
	DisplayOverlay:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, _1080p * 54, _1080p * -52 )
	self:addElement( DisplayOverlay )
	self.DisplayOverlay = DisplayOverlay
	
	local Overlay = nil
	
	Overlay = LUI.UIImage.new()
	Overlay.id = "Overlay"
	Overlay:SetRGBFromTable( SWATCHES.jackalInteriors.fadeOutOverlay, 0 )
	Overlay:SetAlpha( 0, 0 )
	self:addElement( Overlay )
	self.Overlay = Overlay
	
	local Flare = nil
	
	Flare = LUI.UIImage.new()
	Flare.id = "Flare"
	Flare:SetAlpha( 0, 0 )
	self:addElement( Flare )
	self.Flare = Flare
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		Background:RegisterAnimationSequence( "Bootup", {
			{
				function ()
					return self.Background:SetRGBFromInt( 0, 0 )
				end,
				function ()
					return self.Background:SetRGBFromInt( 0, 800 )
				end,
				function ()
					return self.Background:SetRGBFromInt( 16777215, 600, LUI.EASING.outQuadratic )
				end
			}
		} )
		RadarPing:RegisterAnimationSequence( "Bootup", {
			{
				function ()
					return self.RadarPing:SetAlpha( 0, 0 )
				end,
				function ()
					return self.RadarPing:SetAlpha( 0, 400 )
				end,
				function ()
					return self.RadarPing:SetAlpha( 0, 400 )
				end,
				function ()
					return self.RadarPing:SetAlpha( 1, 600, LUI.EASING.outQuadratic )
				end
			}
		} )
		AltimeterBG:RegisterAnimationSequence( "Bootup", {
			{
				function ()
					return self.AltimeterBG:SetAlpha( 0, 0 )
				end,
				function ()
					return self.AltimeterBG:SetAlpha( 0, 800 )
				end,
				function ()
					return self.AltimeterBG:SetAlpha( 1, 600, LUI.EASING.outQuadratic )
				end
			}
		} )
		Base:RegisterAnimationSequence( "Bootup", {
			{
				function ()
					return self.Base:SetAlpha( 0, 0 )
				end,
				function ()
					return self.Base:SetAlpha( 0, 800 )
				end,
				function ()
					return self.Base:SetAlpha( 1, 600, LUI.EASING.outQuadratic )
				end
			}
		} )
		AltimeterArrows:RegisterAnimationSequence( "Bootup", {
			{
				function ()
					return self.AltimeterArrows:SetAlpha( 0, 0 )
				end,
				function ()
					return self.AltimeterArrows:SetAlpha( 0, 800 )
				end,
				function ()
					return self.AltimeterArrows:SetAlpha( 1, 600, LUI.EASING.outQuadratic )
				end
			}
		} )
		Compass:RegisterAnimationSequence( "Bootup", {
			{
				function ()
					return self.Compass:SetAlpha( 0, 0 )
				end,
				function ()
					return self.Compass:SetAlpha( 0, 800 )
				end,
				function ()
					return self.Compass:SetAlpha( 1, 600, LUI.EASING.outQuadratic )
				end
			}
		} )
		Overlay:RegisterAnimationSequence( "Bootup", {
			{
				function ()
					return self.Overlay:SetAlpha( 0, 0 )
				end
			}
		} )
		Flare:RegisterAnimationSequence( "Bootup", {
			{
				function ()
					return self.Flare:SetAlpha( 1, 0 )
				end,
				function ()
					return self.Flare:SetAlpha( 1, 400 )
				end,
				function ()
					return self.Flare:SetAlpha( 1, 400, LUI.EASING.inOutQuadratic )
				end,
				function ()
					return self.Flare:SetAlpha( 0, 600, LUI.EASING.outQuadratic )
				end
			},
			{
				function ()
					return self.Flare:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * 959, _1080p * -959, _1080p * 539, _1080p * -539, 0 )
				end,
				function ()
					return self.Flare:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * 959, _1080p * -959, _1080p * 539, _1080p * -539, 400 )
				end,
				function ()
					return self.Flare:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, _1080p * 539, _1080p * -539, 200, LUI.EASING.inOutQuadratic )
				end,
				function ()
					return self.Flare:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, 0, 0, 199, LUI.EASING.inOutQuadratic )
				end
			}
		} )
		self._sequences.Bootup = function ()
			Background:AnimateSequence( "Bootup" )
			RadarPing:AnimateSequence( "Bootup" )
			AltimeterBG:AnimateSequence( "Bootup" )
			Base:AnimateSequence( "Bootup" )
			AltimeterArrows:AnimateSequence( "Bootup" )
			Compass:AnimateSequence( "Bootup" )
			Overlay:AnimateSequence( "Bootup" )
			Flare:AnimateSequence( "Bootup" )
		end
		
		Overlay:RegisterAnimationSequence( "Off", {
			{
				function ()
					return self.Overlay:SetAlpha( 0, 0 )
				end,
				function ()
					return self.Overlay:SetAlpha( 1, 400 )
				end
			}
		} )
		self._sequences.Off = function ()
			Overlay:AnimateSequence( "Off" )
		end
		
		Overlay:RegisterAnimationSequence( "on", {
			{
				function ()
					return self.Overlay:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.on = function ()
			Overlay:AnimateSequence( "on" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	local f2_local12 = function ()
		if DataSources.inGame.jackal.cockpitScreens:GetValue( f2_local1 ) ~= nil and DataSources.inGame.jackal.cockpitScreens:GetValue( f2_local1 ) == true and DataSources.inGame.jackal.cockpitScreensNoboot:GetValue( f2_local1 ) ~= nil and DataSources.inGame.jackal.cockpitScreensNoboot:GetValue( f2_local1 ) == false then
			ACTIONS.AnimateSequence( self, "Bootup" )
		end
		if DataSources.inGame.jackal.cockpitScreens:GetValue( f2_local1 ) ~= nil and DataSources.inGame.jackal.cockpitScreens:GetValue( f2_local1 ) == false then
			ACTIONS.AnimateSequence( self, "Off" )
		end
		if DataSources.inGame.jackal.cockpitScreens:GetValue( f2_local1 ) ~= nil and DataSources.inGame.jackal.cockpitScreens:GetValue( f2_local1 ) == true and DataSources.inGame.jackal.cockpitScreensNoboot:GetValue( f2_local1 ) ~= nil and DataSources.inGame.jackal.cockpitScreensNoboot:GetValue( f2_local1 ) == true then
			ACTIONS.AnimateSequence( self, "on" )
		end
	end
	
	self:SubscribeToModel( DataSources.inGame.jackal.cockpitScreens:GetModel( f2_local1 ), f2_local12 )
	self:SubscribeToModel( DataSources.inGame.jackal.cockpitScreensNoboot:GetModel( f2_local1 ), f2_local12 )
	PostLoadFunc( self, f2_local1, controller )
	return self
end

MenuBuilder.registerType( "JackalInteriorScreenMain", JackalInteriorScreenMain )
LockTable( _M )
