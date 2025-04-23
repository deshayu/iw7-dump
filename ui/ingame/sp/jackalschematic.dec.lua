local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function JackalSchematic( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 340 * _1080p, 0, 340 * _1080p )
	self.id = "JackalSchematic"
	self._animationSets = {}
	self._sequences = {}
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local JackalSchematic = nil
	
	JackalSchematic = LUI.UIImage.new()
	JackalSchematic.id = "JackalSchematic"
	JackalSchematic:SetAlpha( 0, 0 )
	JackalSchematic:setImage( RegisterMaterial( "jackal_hack_schematic" ), 0 )
	JackalSchematic:SetBlendMode( BLEND_MODE.addWithAlpha )
	JackalSchematic:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 340, 0, _1080p * 340 )
	self:addElement( JackalSchematic )
	self.JackalSchematic = JackalSchematic
	
	local Ready30mm = nil
	
	Ready30mm = MenuBuilder.BuildRegisteredType( "JackalSchematicReadyBox", {
		controllerIndex = f1_local1
	} )
	Ready30mm.id = "Ready30mm"
	Ready30mm.StringReference:setText( ToUpperCase( Engine.Localize( "HUD_JACKAL_50MM" ) ), 0 )
	Ready30mm:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -143, _1080p * -43, _1080p * -48, _1080p * -26 )
	self:addElement( Ready30mm )
	self.Ready30mm = Ready30mm
	
	local ReadyA2G = nil
	
	ReadyA2G = MenuBuilder.BuildRegisteredType( "JackalSchematicReadyBox", {
		controllerIndex = f1_local1
	} )
	ReadyA2G.id = "ReadyA2G"
	ReadyA2G.StringReference:setText( ToUpperCase( Engine.Localize( "HUD_JACKAL_AIR_GROUND" ) ), 0 )
	ReadyA2G:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -100, 0, _1080p * 125.25, _1080p * 147.25 )
	self:addElement( ReadyA2G )
	self.ReadyA2G = ReadyA2G
	
	local Ready50mm = nil
	
	Ready50mm = MenuBuilder.BuildRegisteredType( "JackalSchematicReadyBox", {
		controllerIndex = f1_local1
	} )
	Ready50mm.id = "Ready50mm"
	Ready50mm.StringReference:setText( ToUpperCase( Engine.Localize( "HUD_JACKAL_30MM" ) ), 0 )
	Ready50mm:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -38, _1080p * 62, _1080p * -177.25, _1080p * -155.25 )
	self:addElement( Ready50mm )
	self.Ready50mm = Ready50mm
	
	local MarkerBox30mm = nil
	
	MarkerBox30mm = LUI.UIImage.new()
	MarkerBox30mm.id = "MarkerBox30mm"
	MarkerBox30mm:setImage( RegisterMaterial( "jackal_hack_schematic_square" ), 0 )
	MarkerBox30mm:SetUseAA( true )
	MarkerBox30mm:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 233, _1080p * 261, _1080p * 48, _1080p * 76 )
	self:addElement( MarkerBox30mm )
	self.MarkerBox30mm = MarkerBox30mm
	
	local MarkerBoxA2G = nil
	
	MarkerBoxA2G = LUI.UIImage.new()
	MarkerBoxA2G.id = "MarkerBoxA2G"
	MarkerBoxA2G:setImage( RegisterMaterial( "jackal_hack_schematic_square" ), 0 )
	MarkerBoxA2G:SetUseAA( true )
	MarkerBoxA2G:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 72, _1080p * 100, _1080p * 221, _1080p * 249 )
	self:addElement( MarkerBoxA2G )
	self.MarkerBoxA2G = MarkerBoxA2G
	
	local MarkerBox50mm = nil
	
	MarkerBox50mm = LUI.UIImage.new()
	MarkerBox50mm.id = "MarkerBox50mm"
	MarkerBox50mm:setImage( RegisterMaterial( "jackal_hack_schematic_square" ), 0 )
	MarkerBox50mm:SetUseAA( true )
	MarkerBox50mm:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 23.68, _1080p * 51.68, _1080p * 182.25, _1080p * 210.25 )
	self:addElement( MarkerBox50mm )
	self.MarkerBox50mm = MarkerBox50mm
	
	local Callout30mm = nil
	
	Callout30mm = MenuBuilder.BuildRegisteredType( "GenericBorderFrame", {
		controllerIndex = f1_local1
	} )
	Callout30mm.id = "Callout30mm"
	Callout30mm.Left:SetRight( _1080p * 2, 0 )
	Callout30mm.Right:SetLeft( _1080p * 0, 0 )
	Callout30mm.Top:SetBottom( _1080p * 0, 0 )
	Callout30mm.Bottom:SetTop( _1080p * -2, 0 )
	Callout30mm:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 181.9, _1080p * 234.08, _1080p * 13.75, _1080p * 61.75 )
	self:addElement( Callout30mm )
	self.Callout30mm = Callout30mm
	
	local CalloutA2G = nil
	
	CalloutA2G = MenuBuilder.BuildRegisteredType( "GenericBorderFrame", {
		controllerIndex = f1_local1
	} )
	CalloutA2G.id = "CalloutA2G"
	CalloutA2G.Left:SetRight( _1080p * 0, 0 )
	CalloutA2G.Right:SetLeft( _1080p * -2, 0 )
	CalloutA2G.Top:SetBottom( _1080p * 2, 0 )
	CalloutA2G.Bottom:SetTop( _1080p * 0, 0 )
	CalloutA2G:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 98.4, _1080p * 121.9, _1080p * 235.25, _1080p * 296.25 )
	self:addElement( CalloutA2G )
	self.CalloutA2G = CalloutA2G
	
	local Callout50mm = nil
	
	Callout50mm = MenuBuilder.BuildRegisteredType( "GenericBorderFrame", {
		controllerIndex = f1_local1
	} )
	Callout50mm.id = "Callout50mm"
	Callout50mm.Left:SetRight( _1080p * 0, 0 )
	Callout50mm.Right:SetLeft( _1080p * -2, 0 )
	Callout50mm.Top:SetBottom( _1080p * 0, 0 )
	Callout50mm.Bottom:SetTop( _1080p * -2, 0 )
	Callout50mm:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 51.54, _1080p * 79.45, _1080p * 142.75, _1080p * 197.25 )
	self:addElement( Callout50mm )
	self.Callout50mm = Callout50mm
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		JackalSchematic:RegisterAnimationSequence( "Bootup", {
			{
				function ()
					return self.JackalSchematic:SetAlpha( 0, 0 )
				end,
				function ()
					return self.JackalSchematic:SetAlpha( 0.6, 300, LUI.EASING.outBack )
				end
			},
			{
				function ()
					return self.JackalSchematic:SetScale( -1, 0 )
				end,
				function ()
					return self.JackalSchematic:SetScale( 0, 300, LUI.EASING.outBack )
				end
			}
		} )
		Ready30mm:RegisterAnimationSequence( "Bootup", {
			{
				function ()
					return self.Ready30mm:SetAlpha( 0, 0 )
				end,
				function ()
					return self.Ready30mm:SetAlpha( 0, 200 )
				end,
				function ()
					return self.Ready30mm:SetAlpha( 1, 200 )
				end
			}
		} )
		ReadyA2G:RegisterAnimationSequence( "Bootup", {
			{
				function ()
					return self.ReadyA2G:SetAlpha( 0, 0 )
				end,
				function ()
					return self.ReadyA2G:SetAlpha( 0, 200 )
				end,
				function ()
					return self.ReadyA2G:SetAlpha( 1, 200 )
				end
			}
		} )
		Ready50mm:RegisterAnimationSequence( "Bootup", {
			{
				function ()
					return self.Ready50mm:SetAlpha( 0, 0 )
				end,
				function ()
					return self.Ready50mm:SetAlpha( 0, 200 )
				end,
				function ()
					return self.Ready50mm:SetAlpha( 1, 200 )
				end
			}
		} )
		MarkerBox30mm:RegisterAnimationSequence( "Bootup", {
			{
				function ()
					return self.MarkerBox30mm:SetAlpha( 0, 0 )
				end,
				function ()
					return self.MarkerBox30mm:SetAlpha( 0, 300 )
				end,
				function ()
					return self.MarkerBox30mm:SetAlpha( 1, 200, LUI.EASING.outBack )
				end
			},
			{
				function ()
					return self.MarkerBox30mm:SetScale( 1, 300 )
				end,
				function ()
					return self.MarkerBox30mm:SetScale( 0, 200, LUI.EASING.outBack )
				end
			}
		} )
		MarkerBoxA2G:RegisterAnimationSequence( "Bootup", {
			{
				function ()
					return self.MarkerBoxA2G:SetAlpha( 0, 0 )
				end,
				function ()
					return self.MarkerBoxA2G:SetAlpha( 0, 350 )
				end,
				function ()
					return self.MarkerBoxA2G:SetAlpha( 1, 200, LUI.EASING.outBack )
				end
			},
			{
				function ()
					return self.MarkerBoxA2G:SetScale( 1, 350 )
				end,
				function ()
					return self.MarkerBoxA2G:SetScale( 0, 200, LUI.EASING.outBack )
				end
			}
		} )
		MarkerBox50mm:RegisterAnimationSequence( "Bootup", {
			{
				function ()
					return self.MarkerBox50mm:SetAlpha( 0, 0 )
				end,
				function ()
					return self.MarkerBox50mm:SetAlpha( 0, 400 )
				end,
				function ()
					return self.MarkerBox50mm:SetAlpha( 1, 200, LUI.EASING.outBack )
				end
			},
			{
				function ()
					return self.MarkerBox50mm:SetScale( 1, 400 )
				end,
				function ()
					return self.MarkerBox50mm:SetScale( 0, 200, LUI.EASING.outBack )
				end
			}
		} )
		Callout30mm:RegisterAnimationSequence( "Bootup", {
			{
				function ()
					return self.Callout30mm:SetAlpha( 0, 600 )
				end,
				function ()
					return self.Callout30mm:SetAlpha( 1, 10 )
				end
			},
			{
				function ()
					return self.Callout30mm:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 181.9, _1080p * 234.08, _1080p * 61.75, _1080p * 61.75, 610 )
				end,
				function ()
					return self.Callout30mm:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 181.9, _1080p * 234.08, _1080p * 13.75, _1080p * 61.75, 39 )
				end
			}
		} )
		CalloutA2G:RegisterAnimationSequence( "Bootup", {
			{
				function ()
					return self.CalloutA2G:SetAlpha( 0, 640 )
				end,
				function ()
					return self.CalloutA2G:SetAlpha( 1, 10 )
				end
			},
			{
				function ()
					return self.CalloutA2G:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 98.4, _1080p * 121.9, _1080p * 235.25, _1080p * 235.25, 649 )
				end,
				function ()
					return self.CalloutA2G:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 98.4, _1080p * 121.9, _1080p * 235.25, _1080p * 297.25, 50 )
				end
			}
		} )
		Callout50mm:RegisterAnimationSequence( "Bootup", {
			{
				function ()
					return self.Callout50mm:SetAlpha( 0, 690 )
				end,
				function ()
					return self.Callout50mm:SetAlpha( 1, 10 )
				end
			},
			{
				function ()
					return self.Callout50mm:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 51.54, _1080p * 79.45, _1080p * 197.25, _1080p * 197.25, 699 )
				end,
				function ()
					return self.Callout50mm:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 51.54, _1080p * 79.45, _1080p * 141.75, _1080p * 197.25, 50 )
				end
			}
		} )
		self._sequences.Bootup = function ()
			JackalSchematic:AnimateSequence( "Bootup" )
			Ready30mm:AnimateSequence( "Bootup" )
			ReadyA2G:AnimateSequence( "Bootup" )
			Ready50mm:AnimateSequence( "Bootup" )
			MarkerBox30mm:AnimateSequence( "Bootup" )
			MarkerBoxA2G:AnimateSequence( "Bootup" )
			MarkerBox50mm:AnimateSequence( "Bootup" )
			Callout30mm:AnimateSequence( "Bootup" )
			CalloutA2G:AnimateSequence( "Bootup" )
			Callout50mm:AnimateSequence( "Bootup" )
		end
		
		JackalSchematic:RegisterAnimationSequence( "Shutdown", {
			{
				function ()
					return self.JackalSchematic:SetAlpha( 0.6, 0 )
				end,
				function ()
					return self.JackalSchematic:SetAlpha( 0.6, 100 )
				end,
				function ()
					return self.JackalSchematic:SetAlpha( 0, 200, LUI.EASING.inBack )
				end
			},
			{
				function ()
					return self.JackalSchematic:SetScale( 0, 0 )
				end,
				function ()
					return self.JackalSchematic:SetScale( 0, 100 )
				end,
				function ()
					return self.JackalSchematic:SetScale( -1, 200, LUI.EASING.inBack )
				end
			}
		} )
		Ready30mm:RegisterAnimationSequence( "Shutdown", {
			{
				function ()
					return self.Ready30mm:SetAlpha( 1, 0 )
				end,
				function ()
					return self.Ready30mm:SetAlpha( 0, 200 )
				end
			}
		} )
		ReadyA2G:RegisterAnimationSequence( "Shutdown", {
			{
				function ()
					return self.ReadyA2G:SetAlpha( 1, 0 )
				end,
				function ()
					return self.ReadyA2G:SetAlpha( 0, 200 )
				end
			}
		} )
		Ready50mm:RegisterAnimationSequence( "Shutdown", {
			{
				function ()
					return self.Ready50mm:SetAlpha( 1, 0 )
				end,
				function ()
					return self.Ready50mm:SetAlpha( 0, 200 )
				end
			}
		} )
		MarkerBox30mm:RegisterAnimationSequence( "Shutdown", {
			{
				function ()
					return self.MarkerBox30mm:SetAlpha( 1, 0 )
				end,
				function ()
					return self.MarkerBox30mm:SetAlpha( 0, 200 )
				end
			}
		} )
		MarkerBoxA2G:RegisterAnimationSequence( "Shutdown", {
			{
				function ()
					return self.MarkerBoxA2G:SetAlpha( 1, 0 )
				end,
				function ()
					return self.MarkerBoxA2G:SetAlpha( 0, 200 )
				end
			}
		} )
		MarkerBox50mm:RegisterAnimationSequence( "Shutdown", {
			{
				function ()
					return self.MarkerBox50mm:SetAlpha( 1, 0 )
				end,
				function ()
					return self.MarkerBox50mm:SetAlpha( 0, 200 )
				end
			}
		} )
		Callout30mm:RegisterAnimationSequence( "Shutdown", {
			{
				function ()
					return self.Callout30mm:SetAlpha( 1, 0 )
				end,
				function ()
					return self.Callout30mm:SetAlpha( 0, 200 )
				end
			}
		} )
		CalloutA2G:RegisterAnimationSequence( "Shutdown", {
			{
				function ()
					return self.CalloutA2G:SetAlpha( 1, 0 )
				end,
				function ()
					return self.CalloutA2G:SetAlpha( 0, 200 )
				end
			}
		} )
		Callout50mm:RegisterAnimationSequence( "Shutdown", {
			{
				function ()
					return self.Callout50mm:SetAlpha( 1, 0 )
				end,
				function ()
					return self.Callout50mm:SetAlpha( 0, 200 )
				end
			}
		} )
		self._sequences.Shutdown = function ()
			JackalSchematic:AnimateSequence( "Shutdown" )
			Ready30mm:AnimateSequence( "Shutdown" )
			ReadyA2G:AnimateSequence( "Shutdown" )
			Ready50mm:AnimateSequence( "Shutdown" )
			MarkerBox30mm:AnimateSequence( "Shutdown" )
			MarkerBoxA2G:AnimateSequence( "Shutdown" )
			MarkerBox50mm:AnimateSequence( "Shutdown" )
			Callout30mm:AnimateSequence( "Shutdown" )
			CalloutA2G:AnimateSequence( "Shutdown" )
			Callout50mm:AnimateSequence( "Shutdown" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	self:addEventHandler( "hud_anim_shutdown_off", function ( f70_arg0, f70_arg1 )
		local f70_local0 = f70_arg1.controller or f1_local1
		ACTIONS.AnimateSequence( self, "Shutdown" )
	end )
	ACTIONS.AnimateSequence( self, "Bootup" )
	ACTIONS.AnimateSequenceByElement( self, {
		elementName = "ReadyA2G",
		sequenceName = "SetBottom",
		elementPath = "ReadyA2G"
	} )
	return self
end

MenuBuilder.registerType( "JackalSchematic", JackalSchematic )
LockTable( _M )
