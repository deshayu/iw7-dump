local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function PostLoadFunc( f1_arg0, f1_arg1, f1_arg2 )
	f1_arg0:SetupInWorldElement( {
		entityNum = Game.GetOmnvar( "ui_jackal_entity" ),
		entityTag = "tag_cockpit_light_monitor5"
	} )
	f1_arg0:SetInWorldScale( 0.02 )
	f1_arg0:SetFollowTagAngles( true )
	f1_arg0:SetTagSpacePosition( 0, -0.08, 0 )
	f1_arg0:SetDelayedRender( true )
end

function JackalInteriorWarningUi( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 205 * _1080p, 0, 75 * _1080p )
	self.id = "JackalInteriorWarningUi"
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
	Background:setImage( RegisterMaterial( "hud_jackal_interior_status" ), 0 )
	self:addElement( Background )
	self.Background = Background
	
	local DisplayOverlay = nil
	
	DisplayOverlay = MenuBuilder.BuildRegisteredType( "JackalInteriorDisplayOverlaySmall", {
		controllerIndex = f2_local1
	} )
	DisplayOverlay.id = "DisplayOverlay"
	DisplayOverlay:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, 0, 0 )
	self:addElement( DisplayOverlay )
	self.DisplayOverlay = DisplayOverlay
	
	local BlackOverlay = nil
	
	BlackOverlay = LUI.UIImage.new()
	BlackOverlay.id = "BlackOverlay"
	BlackOverlay:SetRGBFromInt( 0, 0 )
	BlackOverlay:SetAlpha( 0, 0 )
	self:addElement( BlackOverlay )
	self.BlackOverlay = BlackOverlay
	
	local Flare = nil
	
	Flare = LUI.UIImage.new()
	Flare.id = "Flare"
	Flare:SetAlpha( 0, 0 )
	self:addElement( Flare )
	self.Flare = Flare
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		BlackOverlay:RegisterAnimationSequence( "Bootup", {
			{
				function ()
					return self.BlackOverlay:SetAlpha( 1, 0 )
				end,
				function ()
					return self.BlackOverlay:SetAlpha( 1, 400 )
				end,
				function ()
					return self.BlackOverlay:SetAlpha( 0, 600 )
				end
			}
		} )
		Flare:RegisterAnimationSequence( "Bootup", {
			{
				function ()
					return self.Flare:SetAlpha( 1, 0 )
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
					return self.Flare:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * 102, _1080p * -102, _1080p * 37, _1080p * -37, 0 )
				end,
				function ()
					return self.Flare:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, _1080p * 37, _1080p * -37, 200, LUI.EASING.inOutQuadratic )
				end,
				function ()
					return self.Flare:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, 0, 0, 200, LUI.EASING.inOutQuadratic )
				end
			}
		} )
		self._sequences.Bootup = function ()
			BlackOverlay:AnimateSequence( "Bootup" )
			Flare:AnimateSequence( "Bootup" )
		end
		
		BlackOverlay:RegisterAnimationSequence( "Off", {
			{
				function ()
					return self.BlackOverlay:SetAlpha( 0, 0 )
				end,
				function ()
					return self.BlackOverlay:SetAlpha( 1, 400 )
				end
			}
		} )
		self._sequences.Off = function ()
			BlackOverlay:AnimateSequence( "Off" )
		end
		
		Background:RegisterAnimationSequence( "Idle", {
			{
				function ()
					return self.Background:setImage( RegisterMaterial( "hud_jackal_interior_status" ), 0 )
				end
			},
			{
				function ()
					return self.Background:SetAlpha( 1, 0 )
				end
			}
		} )
		self._sequences.Idle = function ()
			Background:AnimateSequence( "Idle" )
		end
		
		Background:RegisterAnimationSequence( "Warning", {
			{
				function ()
					return self.Background:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.Background:setImage( RegisterMaterial( "hud_jackal_interior_warning_ui" ), 0 )
				end
			}
		} )
		BlackOverlay:RegisterAnimationSequence( "Warning", {
			{
				function ()
					return self.BlackOverlay:SetAlpha( 0, 0 )
				end,
				function ()
					return self.BlackOverlay:SetAlpha( 0.4, 50 )
				end,
				function ()
					return self.BlackOverlay:SetAlpha( 0, 50 )
				end
			}
		} )
		self._sequences.Warning = function ()
			Background:AnimateLoop( "Warning" )
			BlackOverlay:AnimateLoop( "Warning" )
		end
		
		self._sequences.on = function ()
			
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	local f2_local7 = function ()
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
	
	self:SubscribeToModel( DataSources.inGame.jackal.cockpitScreens:GetModel( f2_local1 ), f2_local7 )
	self:SubscribeToModel( DataSources.inGame.jackal.cockpitScreensNoboot:GetModel( f2_local1 ), f2_local7 )
	self:SubscribeToModel( DataSources.inGame.jackal.lowHealth:GetModel( f2_local1 ), function ()
		if DataSources.inGame.jackal.lowHealth:GetValue( f2_local1 ) ~= nil and DataSources.inGame.jackal.lowHealth:GetValue( f2_local1 ) == true then
			ACTIONS.AnimateSequence( self, "Warning" )
		end
		if DataSources.inGame.jackal.lowHealth:GetValue( f2_local1 ) ~= nil and DataSources.inGame.jackal.lowHealth:GetValue( f2_local1 ) == false then
			ACTIONS.AnimateSequence( self, "Idle" )
		end
	end )
	PostLoadFunc( self, f2_local1, controller )
	return self
end

MenuBuilder.registerType( "JackalInteriorWarningUi", JackalInteriorWarningUi )
LockTable( _M )
