local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function PostLoadFunc( f1_arg0, f1_arg1, f1_arg2 )
	f1_arg0:addEventHandler( "bootup_anim", function ()
		ACTIONS.AnimateSequence( f1_arg0, "BootUp" )
	end )
end

function HackControlFrame( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 1920 * _1080p, 0, 1080 * _1080p )
	self.id = "HackControlFrame"
	self._animationSets = {}
	self._sequences = {}
	local f3_local1 = controller and controller.controllerIndex
	if not f3_local1 and not Engine.InFrontend() then
		f3_local1 = self:getRootController()
	end
	assert( f3_local1 )
	local f3_local2 = self
	local BottomMeter = nil
	
	BottomMeter = LUI.UIImage.new()
	BottomMeter.id = "BottomMeter"
	BottomMeter:setImage( RegisterMaterial( "hud_robot_hack_bottom_meter" ), 0 )
	BottomMeter:SetBlendMode( BLEND_MODE.addWithAlpha )
	BottomMeter:SetAnchorsAndPosition( 0.5, 0.5, 1, 0, _1080p * -710, _1080p * 710, _1080p * -38, _1080p * 38 )
	self:addElement( BottomMeter )
	self.BottomMeter = BottomMeter
	
	local TopMeter = nil
	
	TopMeter = LUI.UIImage.new()
	TopMeter.id = "TopMeter"
	TopMeter:setImage( RegisterMaterial( "hud_robot_hack_top_meter" ), 0 )
	TopMeter:SetBlendMode( BLEND_MODE.addWithAlpha )
	TopMeter:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -512, _1080p * 512, _1080p * -53, _1080p * 43 )
	self:addElement( TopMeter )
	self.TopMeter = TopMeter
	
	local CompassElementDup = nil
	
	CompassElementDup = MenuBuilder.BuildRegisteredType( "Compass", {
		stretch = 0.85,
		controllerIndex = f3_local1
	} )
	CompassElementDup.id = "CompassElementDup"
	CompassElementDup:SetRGBFromInt( 11033088, 0 )
	CompassElementDup:setImage( RegisterMaterial( "compass_tickertape_space" ), 0 )
	CompassElementDup:SetBlendMode( BLEND_MODE.addWithAlpha )
	CompassElementDup:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -256, _1080p * 256, _1080p * 32, _1080p * 48 )
	self:addElement( CompassElementDup )
	self.CompassElementDup = CompassElementDup
	
	local CompassElement = nil
	
	CompassElement = MenuBuilder.BuildRegisteredType( "Compass", {
		stretch = 0.85,
		controllerIndex = f3_local1
	} )
	CompassElement.id = "CompassElement"
	CompassElement:SetRGBFromInt( 16746752, 0 )
	CompassElement:SetAlpha( 0.2, 0 )
	CompassElement:setImage( RegisterMaterial( "compass_tickertape_space" ), 0 )
	CompassElement:SetBlendMode( BLEND_MODE.addWithAlpha )
	CompassElement:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -256, _1080p * 256, _1080p * 38, _1080p * 54 )
	self:addElement( CompassElement )
	self.CompassElement = CompassElement
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		BottomMeter:RegisterAnimationSequence( "Off", {
			{
				function ()
					return self.BottomMeter:SetAlpha( 0, 0 )
				end
			}
		} )
		TopMeter:RegisterAnimationSequence( "Off", {
			{
				function ()
					return self.TopMeter:SetAlpha( 0, 0 )
				end
			}
		} )
		CompassElementDup:RegisterAnimationSequence( "Off", {
			{
				function ()
					return self.CompassElementDup:SetAlpha( 0, 0 )
				end
			}
		} )
		CompassElement:RegisterAnimationSequence( "Off", {
			{
				function ()
					return self.CompassElement:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.Off = function ()
			BottomMeter:AnimateSequence( "Off" )
			TopMeter:AnimateSequence( "Off" )
			CompassElementDup:AnimateSequence( "Off" )
			CompassElement:AnimateSequence( "Off" )
		end
		
		BottomMeter:RegisterAnimationSequence( "BootUp", {
			{
				function ()
					return self.BottomMeter:SetAlpha( 0, 0 )
				end,
				function ()
					return self.BottomMeter:SetAlpha( 1, 250 )
				end
			}
		} )
		TopMeter:RegisterAnimationSequence( "BootUp", {
			{
				function ()
					return self.TopMeter:SetAlpha( 0, 0 )
				end,
				function ()
					return self.TopMeter:SetAlpha( 1, 250 )
				end
			}
		} )
		CompassElementDup:RegisterAnimationSequence( "BootUp", {
			{
				function ()
					return self.CompassElementDup:SetAlpha( 0, 0 )
				end,
				function ()
					return self.CompassElementDup:SetAlpha( 0.2, 250 )
				end
			},
			{
				function ()
					return self.CompassElementDup:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -256, _1080p * 256, _1080p * 26, _1080p * 42, 0 )
				end,
				function ()
					return self.CompassElementDup:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -256, _1080p * 256, _1080p * 32, _1080p * 48, 250 )
				end
			}
		} )
		CompassElement:RegisterAnimationSequence( "BootUp", {
			{
				function ()
					return self.CompassElement:SetAlpha( 0, 0 )
				end,
				function ()
					return self.CompassElement:SetAlpha( 1, 250 )
				end
			},
			{
				function ()
					return self.CompassElement:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -256, _1080p * 256, _1080p * 32, _1080p * 48, 0 )
				end,
				function ()
					return self.CompassElement:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -256, _1080p * 256, _1080p * 38, _1080p * 54, 250 )
				end
			}
		} )
		self._sequences.BootUp = function ()
			BottomMeter:AnimateSequence( "BootUp" )
			TopMeter:AnimateSequence( "BootUp" )
			CompassElementDup:AnimateSequence( "BootUp" )
			CompassElement:AnimateSequence( "BootUp" )
		end
		
		BottomMeter:RegisterAnimationSequence( "Outro", {
			{
				function ()
					return self.BottomMeter:SetAlpha( 1, 1100 )
				end,
				function ()
					return self.BottomMeter:SetAlpha( 0, 250 )
				end
			}
		} )
		TopMeter:RegisterAnimationSequence( "Outro", {
			{
				function ()
					return self.TopMeter:SetAlpha( 1, 1100 )
				end,
				function ()
					return self.TopMeter:SetAlpha( 0, 250 )
				end
			}
		} )
		CompassElementDup:RegisterAnimationSequence( "Outro", {
			{
				function ()
					return self.CompassElementDup:SetAlpha( 0.2, 1100 )
				end,
				function ()
					return self.CompassElementDup:SetAlpha( 0, 250 )
				end
			},
			{
				function ()
					return self.CompassElementDup:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -256, _1080p * 256, _1080p * 32, _1080p * 48, 1100 )
				end,
				function ()
					return self.CompassElementDup:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -256, _1080p * 256, _1080p * 26, _1080p * 42, 250 )
				end
			}
		} )
		CompassElement:RegisterAnimationSequence( "Outro", {
			{
				function ()
					return self.CompassElement:SetAlpha( 1, 1100 )
				end,
				function ()
					return self.CompassElement:SetAlpha( 0, 250 )
				end
			},
			{
				function ()
					return self.CompassElement:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -256, _1080p * 256, _1080p * 38, _1080p * 54, 1100 )
				end,
				function ()
					return self.CompassElement:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -256, _1080p * 256, _1080p * 32, _1080p * 48, 250 )
				end
			}
		} )
		self._sequences.Outro = function ()
			BottomMeter:AnimateSequence( "Outro" )
			TopMeter:AnimateSequence( "Outro" )
			CompassElementDup:AnimateSequence( "Outro" )
			CompassElement:AnimateSequence( "Outro" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	self:SubscribeToModel( DataSources.inGame.SP.hackControlOutro:GetModel( f3_local1 ), function ()
		if DataSources.inGame.SP.hackControlOutro:GetValue( f3_local1 ) ~= nil and DataSources.inGame.SP.hackControlOutro:GetValue( f3_local1 ) == 2 then
			ACTIONS.AnimateSequence( self, "Outro" )
		end
	end )
	PostLoadFunc( self, f3_local1, controller )
	ACTIONS.AnimateSequence( self, "Off" )
	return self
end

MenuBuilder.registerType( "HackControlFrame", HackControlFrame )
LockTable( _M )
