local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function PostLoadFunc( f1_arg0, f1_arg1, f1_arg2 )
	assert( f1_arg0.Minimap )
	local f1_local0 = f1_arg0.Minimap
	f1_arg0:SubscribeToModel( DataSources.inGame.player.affectedByEMP:GetModel( f1_arg1 ), function ( f2_arg0 )
		if DataModel.GetModelValue( f2_arg0 ) then
			MP.StartEMPGlitch( f1_arg0 )
		else
			MP.StopEMPGlitch( f1_arg0 )
		end
	end )
	f1_arg0:SubscribeToModel( DataSources.inGame.player.isCUAVActive:GetModel( f1_arg1 ), function ( f3_arg0 )
		if DataModel.GetModelValue( f3_arg0 ) then
			MP.StartEMPGlitch( f1_local0 )
		else
			MP.StopEMPGlitch( f1_local0 )
		end
	end )
	f1_arg0:registerOmnvarHandler( "ui_hide_minimap", function ( f4_arg0, f4_arg1 )
		if f4_arg1.value then
			ACTIONS.AnimateSequence( f4_arg0, "SwipeOff" )
		else
			ACTIONS.AnimateSequence( f4_arg0, "ShowNow" )
		end
	end )
end

function Minimap( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 400 * _1080p, 0, 225 * _1080p )
	self.id = "Minimap"
	self._animationSets = {}
	self._sequences = {}
	local f5_local1 = controller and controller.controllerIndex
	if not f5_local1 and not Engine.InFrontend() then
		f5_local1 = self:getRootController()
	end
	assert( f5_local1 )
	local f5_local2 = self
	local Blur = nil
	
	Blur = LUI.UIBlur.new()
	Blur.id = "Blur"
	Blur:SetRGBFromInt( 13421772, 0 )
	Blur:SetUseAA( true )
	Blur:SetBlurStrength( 0.75, 0 )
	self:addElement( Blur )
	self.Blur = Blur
	
	local Background = nil
	
	Background = LUI.UIImage.new()
	Background.id = "Background"
	Background:SetAlpha( 0.4, 0 )
	Background:SetDepth( 10, 0 )
	Background:setImage( RegisterMaterial( "hud_minimap_background" ), 0 )
	Background:SetUseAA( true )
	Background:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -270, _1080p * 270, _1080p * -195, _1080p * 195 )
	self:addElement( Background )
	self.Background = Background
	
	local Compass = nil
	
	Compass = MenuBuilder.BuildRegisteredType( "Compass", {
		stretch = 0.85,
		controllerIndex = f5_local1
	} )
	Compass.id = "Compass"
	Compass:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, 0, _1080p * 15 )
	self:addElement( Compass )
	self.Compass = Compass
	
	local Minimap = nil
	
	Minimap = MenuBuilder.BuildRegisteredType( "MinimapContent", {
		mapAlpha = 0.5,
		compassType = CoD.CompassType.Partial,
		controllerIndex = f5_local1
	} )
	Minimap.id = "Minimap"
	Minimap:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, _1080p * 15, _1080p * 225 )
	self:addElement( Minimap )
	self.Minimap = Minimap
	
	local AreaCallout = nil
	
	AreaCallout = MenuBuilder.BuildRegisteredType( "MinimapAreaLabel", {
		controllerIndex = f5_local1
	} )
	AreaCallout.id = "AreaCallout"
	AreaCallout:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, _1080p * 230, _1080p * 250 )
	self:addElement( AreaCallout )
	self.AreaCallout = AreaCallout
	
	local Line = nil
	
	Line = LUI.UIImage.new()
	Line.id = "Line"
	Line:SetUseAA( true )
	Line:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, _1080p * 16, _1080p * 17 )
	self:addElement( Line )
	self.Line = Line
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		Blur:RegisterAnimationSequence( "SwipeOff", {
			{
				function ()
					return self.Blur:SetBlurStrength( 0, 0 )
				end
			},
			{
				function ()
					return self.Blur:SetAlpha( 0, 0 )
				end
			}
		} )
		Background:RegisterAnimationSequence( "SwipeOff", {
			{
				function ()
					return self.Background:SetAlpha( 0, 0 )
				end
			}
		} )
		Compass:RegisterAnimationSequence( "SwipeOff", {
			{
				function ()
					return self.Compass:SetAlpha( 1, 0 )
				end,
				function ()
					return self.Compass:SetAlpha( 0, 150, LUI.EASING.outQuintic )
				end
			},
			{
				function ()
					return self.Compass:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, 0, _1080p * 15, 0 )
				end,
				function ()
					return self.Compass:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 400, _1080p * 400, 0, _1080p * 15, 150, LUI.EASING.outQuintic )
				end
			}
		} )
		Minimap:RegisterAnimationSequence( "SwipeOff", {
			{
				function ()
					return self.Minimap:SetAlpha( 1, 0 )
				end,
				function ()
					return self.Minimap:SetAlpha( 0, 150, LUI.EASING.outQuintic )
				end
			},
			{
				function ()
					return self.Minimap:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, _1080p * 15, _1080p * 225, 0 )
				end,
				function ()
					return self.Minimap:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 400, _1080p * 400, _1080p * 15, _1080p * 225, 150, LUI.EASING.outQuintic )
				end
			}
		} )
		AreaCallout:RegisterAnimationSequence( "SwipeOff", {
			{
				function ()
					return self.AreaCallout:SetAlpha( 1, 0 )
				end,
				function ()
					return self.AreaCallout:SetAlpha( 0, 150, LUI.EASING.outQuartic )
				end
			},
			{
				function ()
					return self.AreaCallout:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, _1080p * 230, _1080p * 250, 0 )
				end,
				function ()
					return self.AreaCallout:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 401, _1080p * 401, _1080p * 230, _1080p * 250, 150, LUI.EASING.outQuartic )
				end
			}
		} )
		Line:RegisterAnimationSequence( "SwipeOff", {
			{
				function ()
					return self.Line:SetAlpha( 1, 0 )
				end,
				function ()
					return self.Line:SetAlpha( 0, 150, LUI.EASING.outQuartic )
				end
			},
			{
				function ()
					return self.Line:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, _1080p * 16, _1080p * 17, 0 )
				end,
				function ()
					return self.Line:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 400, _1080p * 400, _1080p * 16, _1080p * 17, 150, LUI.EASING.outQuartic )
				end
			}
		} )
		self._sequences.SwipeOff = function ()
			Blur:AnimateSequence( "SwipeOff" )
			Background:AnimateSequence( "SwipeOff" )
			Compass:AnimateSequence( "SwipeOff" )
			Minimap:AnimateSequence( "SwipeOff" )
			AreaCallout:AnimateSequence( "SwipeOff" )
			Line:AnimateSequence( "SwipeOff" )
		end
		
		Blur:RegisterAnimationSequence( "Bootup", {
			{
				function ()
					return self.Blur:SetBlurStrength( 0.75, 0 )
				end
			},
			{
				function ()
					return self.Blur:SetAlpha( 1, 0 )
				end
			}
		} )
		Background:RegisterAnimationSequence( "Bootup", {
			{
				function ()
					return self.Background:SetAlpha( 0, 0 )
				end
			}
		} )
		Compass:RegisterAnimationSequence( "Bootup", {
			{
				function ()
					return self.Compass:SetAlpha( 1, 0 )
				end,
				function ()
					return self.Compass:SetAlpha( 1, 1000 )
				end,
				function ()
					return self.Compass:SetAlpha( 1, 50 )
				end,
				function ()
					return self.Compass:SetAlpha( 0, 30 )
				end,
				function ()
					return self.Compass:SetAlpha( 1, 30 )
				end,
				function ()
					return self.Compass:SetAlpha( 0, 40 )
				end,
				function ()
					return self.Compass:SetAlpha( 0, 140 )
				end,
				function ()
					return self.Compass:SetAlpha( 1, 40 )
				end,
				function ()
					return self.Compass:SetAlpha( 0, 40 )
				end,
				function ()
					return self.Compass:SetAlpha( 1, 40 )
				end
			},
			{
				function ()
					return self.Compass:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, 0, _1080p * 15, 0 )
				end
			}
		} )
		Minimap:RegisterAnimationSequence( "Bootup", {
			{
				function ()
					return self.Minimap:SetAlpha( 0, 0 )
				end,
				function ()
					return self.Minimap:SetAlpha( 0, 1000 )
				end,
				function ()
					return self.Minimap:SetAlpha( 1, 50 )
				end,
				function ()
					return self.Minimap:SetAlpha( 0, 30 )
				end,
				function ()
					return self.Minimap:SetAlpha( 1, 30 )
				end,
				function ()
					return self.Minimap:SetAlpha( 0, 40 )
				end,
				function ()
					return self.Minimap:SetAlpha( 0, 140 )
				end,
				function ()
					return self.Minimap:SetAlpha( 1, 40 )
				end,
				function ()
					return self.Minimap:SetAlpha( 0, 40 )
				end,
				function ()
					return self.Minimap:SetAlpha( 1, 40 )
				end
			},
			{
				function ()
					return self.Minimap:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, _1080p * 15, _1080p * 225, 0 )
				end
			}
		} )
		AreaCallout:RegisterAnimationSequence( "Bootup", {
			{
				function ()
					return self.AreaCallout:SetAlpha( 0, 0 )
				end,
				function ()
					return self.AreaCallout:SetAlpha( 0, 1000 )
				end,
				function ()
					return self.AreaCallout:SetAlpha( 1, 50 )
				end,
				function ()
					return self.AreaCallout:SetAlpha( 0, 30 )
				end,
				function ()
					return self.AreaCallout:SetAlpha( 1, 30 )
				end,
				function ()
					return self.AreaCallout:SetAlpha( 0, 40 )
				end,
				function ()
					return self.AreaCallout:SetAlpha( 1, 20 )
				end,
				function ()
					return self.AreaCallout:SetAlpha( 0, 40 )
				end,
				function ()
					return self.AreaCallout:SetAlpha( 1, 40 )
				end,
				function ()
					return self.AreaCallout:SetAlpha( 0, 40 )
				end,
				function ()
					return self.AreaCallout:SetAlpha( 1, 40 )
				end,
				function ()
					return self.AreaCallout:SetAlpha( 0, 40 )
				end,
				function ()
					return self.AreaCallout:SetAlpha( 1, 40 )
				end
			},
			{
				function ()
					return self.AreaCallout:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, _1080p * 230, _1080p * 250, 0 )
				end
			}
		} )
		Line:RegisterAnimationSequence( "Bootup", {
			{
				function ()
					return self.Line:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.Line:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, _1080p * 16, _1080p * 17, 0 )
				end
			}
		} )
		self._sequences.Bootup = function ()
			Blur:AnimateSequence( "Bootup" )
			Background:AnimateSequence( "Bootup" )
			Compass:AnimateSequence( "Bootup" )
			Minimap:AnimateSequence( "Bootup" )
			AreaCallout:AnimateSequence( "Bootup" )
			Line:AnimateSequence( "Bootup" )
		end
		
		Blur:RegisterAnimationSequence( "ShowNow", {
			{
				function ()
					return self.Blur:SetBlurStrength( 0.75, 0 )
				end
			},
			{
				function ()
					return self.Blur:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.Blur:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, 0, 0, 0 )
				end
			}
		} )
		Background:RegisterAnimationSequence( "ShowNow", {
			{
				function ()
					return self.Background:SetAlpha( 0, 0 )
				end
			},
			{
				function ()
					return self.Background:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -270, _1080p * 270, _1080p * -195, _1080p * 195, 0 )
				end
			}
		} )
		Compass:RegisterAnimationSequence( "ShowNow", {
			{
				function ()
					return self.Compass:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.Compass:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, 0, _1080p * 15, 0 )
				end
			}
		} )
		Minimap:RegisterAnimationSequence( "ShowNow", {
			{
				function ()
					return self.Minimap:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.Minimap:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, _1080p * 15, _1080p * 225, 0 )
				end
			}
		} )
		AreaCallout:RegisterAnimationSequence( "ShowNow", {
			{
				function ()
					return self.AreaCallout:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.AreaCallout:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, _1080p * 230, _1080p * 250, 0 )
				end
			}
		} )
		Line:RegisterAnimationSequence( "ShowNow", {
			{
				function ()
					return self.Line:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.Line:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, _1080p * 16, _1080p * 17, 0 )
				end
			}
		} )
		self._sequences.ShowNow = function ()
			Blur:AnimateSequence( "ShowNow" )
			Background:AnimateSequence( "ShowNow" )
			Compass:AnimateSequence( "ShowNow" )
			Minimap:AnimateSequence( "ShowNow" )
			AreaCallout:AnimateSequence( "ShowNow" )
			Line:AnimateSequence( "ShowNow" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	self:addEventHandler( "hud_anim_bootup_on", function ( f84_arg0, f84_arg1 )
		local f84_local0 = f84_arg1.controller or f5_local1
		if not CONDITIONS.IsSpecificOmnvarTrue( "ui_hide_minimap" ) then
			ACTIONS.AnimateSequence( self, "Bootup" )
		end
	end )
	self:addEventHandler( "hud_anim_immediate_on", function ( f85_arg0, f85_arg1 )
		local f85_local0 = f85_arg1.controller or f5_local1
		if not CONDITIONS.IsSpecificOmnvarTrue( "ui_hide_minimap" ) then
			ACTIONS.AnimateSequence( self, "ShowNow" )
		end
	end )
	self:addEventHandler( "hud_anim_swipe_off", function ( f86_arg0, f86_arg1 )
		local f86_local0 = f86_arg1.controller or f5_local1
		if not CONDITIONS.IsSpecificOmnvarTrue( "ui_hide_minimap" ) then
			ACTIONS.AnimateSequence( self, "SwipeOff" )
		end
	end )
	PostLoadFunc( self, f5_local1, controller )
	return self
end

MenuBuilder.registerType( "Minimap", Minimap )
LockTable( _M )
