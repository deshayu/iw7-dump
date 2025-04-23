local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function PostLoadFunc( f1_arg0, f1_arg1, f1_arg2 )
	f1_arg0:SetupInWorldElement( {
		entityNum = Game.GetOmnvar( "ui_jackal_entity" ),
		entityTag = "tag_cockpit_light_monitor3"
	} )
	f1_arg0:SetInWorldScale( 0.01 )
	f1_arg0:SetFollowTagAngles( true )
	f1_arg0:SetTagSpacePosition( 0, -0.07, 0 )
	f1_arg0:SetTagSpacePitch( -5 )
	f1_arg0:SetDelayedRender( true )
end

function JackalInteriorScreenLaptop( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 1550 * _1080p, 0, 580 * _1080p )
	self.id = "JackalInteriorScreenLaptop"
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
	Background:SetRGBFromInt( 0, 0 )
	self:addElement( Background )
	self.Background = Background
	
	local Base = nil
	
	Base = MenuBuilder.BuildRegisteredType( "JackalInteriorScreenLaptopBase", {
		controllerIndex = f2_local1
	} )
	Base.id = "Base"
	Base:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, 0, 0 )
	self:addElement( Base )
	self.Base = Base
	
	local DisplayOverlayLaptop = nil
	
	DisplayOverlayLaptop = MenuBuilder.BuildRegisteredType( "JackalInteriorDisplayOverlayLaptop", {
		controllerIndex = f2_local1
	} )
	DisplayOverlayLaptop.id = "DisplayOverlayLaptop"
	DisplayOverlayLaptop:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, _1080p * -70, _1080p * 78 )
	self:addElement( DisplayOverlayLaptop )
	self.DisplayOverlayLaptop = DisplayOverlayLaptop
	
	local Overlay = nil
	
	Overlay = LUI.UIImage.new()
	Overlay.id = "Overlay"
	Overlay:SetRGBFromTable( SWATCHES.jackalInteriors.fadeOutOverlay, 0 )
	Overlay:SetAlpha( 0, 0 )
	Overlay:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, _1080p * -10, _1080p * 10 )
	self:addElement( Overlay )
	self.Overlay = Overlay
	
	local Flare = nil
	
	Flare = LUI.UIImage.new()
	Flare.id = "Flare"
	Flare:SetAlpha( 0, 0 )
	Flare:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * 1550, 0, 0, 0 )
	self:addElement( Flare )
	self.Flare = Flare
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		Base:RegisterAnimationSequence( "Bootup", {
			{
				function ()
					return self.Base:SetAlpha( 0, 0 )
				end,
				function ()
					return self.Base:SetAlpha( 0, 710 )
				end,
				function ()
					return self.Base:SetAlpha( 0, 400 )
				end,
				function ()
					return self.Base:SetAlpha( 1, 600, LUI.EASING.outQuadratic )
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
					return self.Flare:SetAlpha( 1, 710 )
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
					return self.Flare:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * 775, _1080p * -774, _1080p * 290, _1080p * -289, 0 )
				end,
				function ()
					return self.Flare:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * 775, _1080p * -774, _1080p * 290, _1080p * -289, 709 )
				end,
				function ()
					return self.Flare:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, _1080p * 290, _1080p * -289, 200, LUI.EASING.inOutQuadratic )
				end,
				function ()
					return self.Flare:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, 0, 0, 199, LUI.EASING.inOutQuadratic )
				end
			}
		} )
		self._sequences.Bootup = function ()
			Base:AnimateSequence( "Bootup" )
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
	local f2_local8 = function ()
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
	
	self:SubscribeToModel( DataSources.inGame.jackal.cockpitScreens:GetModel( f2_local1 ), f2_local8 )
	self:SubscribeToModel( DataSources.inGame.jackal.cockpitScreensNoboot:GetModel( f2_local1 ), f2_local8 )
	PostLoadFunc( self, f2_local1, controller )
	return self
end

MenuBuilder.registerType( "JackalInteriorScreenLaptop", JackalInteriorScreenLaptop )
LockTable( _M )
