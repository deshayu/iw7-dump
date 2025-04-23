local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function PostLoadFunc( f1_arg0, f1_arg1, f1_arg2 )
	f1_arg0:addEventHandler( "bootup_anim", function ()
		ACTIONS.AnimateSequence( f1_arg0, "BootUp" )
	end )
end

function HackControlCrosshairLarge( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 1920 * _1080p, 0, 1080 * _1080p )
	self.id = "HackControlCrosshairLarge"
	self._animationSets = {}
	self._sequences = {}
	local f3_local1 = controller and controller.controllerIndex
	if not f3_local1 and not Engine.InFrontend() then
		f3_local1 = self:getRootController()
	end
	assert( f3_local1 )
	local f3_local2 = self
	local CrosshairRight = nil
	
	CrosshairRight = LUI.UIImage.new()
	CrosshairRight.id = "CrosshairRight"
	CrosshairRight:SetAlpha( 0.8, 0 )
	CrosshairRight:setImage( RegisterMaterial( "hud_robot_hack_crosshair_line" ), 0 )
	CrosshairRight:SetBlendMode( BLEND_MODE.addWithAlpha )
	CrosshairRight:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, 0, _1080p * 788, _1080p * -4, _1080p * 4 )
	self:addElement( CrosshairRight )
	self.CrosshairRight = CrosshairRight
	
	local CrosshairLeft = nil
	
	CrosshairLeft = LUI.UIImage.new()
	CrosshairLeft.id = "CrosshairLeft"
	CrosshairLeft:SetAlpha( 0.8, 0 )
	CrosshairLeft:SetZRotation( 180, 0 )
	CrosshairLeft:setImage( RegisterMaterial( "hud_robot_hack_crosshair_line" ), 0 )
	CrosshairLeft:SetBlendMode( BLEND_MODE.addWithAlpha )
	CrosshairLeft:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -788, 0, _1080p * -4, _1080p * 4 )
	self:addElement( CrosshairLeft )
	self.CrosshairLeft = CrosshairLeft
	
	local CrosshairTop = nil
	
	CrosshairTop = LUI.UIImage.new()
	CrosshairTop.id = "CrosshairTop"
	CrosshairTop:SetAlpha( 0.8, 0 )
	CrosshairTop:setImage( RegisterMaterial( "hud_robot_hack_crosshair_line_vert" ), 0 )
	CrosshairTop:SetBlendMode( BLEND_MODE.addWithAlpha )
	CrosshairTop:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -4, _1080p * 4, _1080p * -448, 0 )
	self:addElement( CrosshairTop )
	self.CrosshairTop = CrosshairTop
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		CrosshairRight:RegisterAnimationSequence( "Off", {
			{
				function ()
					return self.CrosshairRight:SetAlpha( 0, 0 )
				end
			}
		} )
		CrosshairLeft:RegisterAnimationSequence( "Off", {
			{
				function ()
					return self.CrosshairLeft:SetAlpha( 0, 0 )
				end
			}
		} )
		CrosshairTop:RegisterAnimationSequence( "Off", {
			{
				function ()
					return self.CrosshairTop:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.Off = function ()
			CrosshairRight:AnimateSequence( "Off" )
			CrosshairLeft:AnimateSequence( "Off" )
			CrosshairTop:AnimateSequence( "Off" )
		end
		
		CrosshairRight:RegisterAnimationSequence( "BootUp", {
			{
				function ()
					return self.CrosshairRight:SetAlpha( 0.4, 0 )
				end
			},
			{
				function ()
					return self.CrosshairRight:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, 0, _1080p * 2, _1080p * -4, _1080p * 4, 0 )
				end,
				function ()
					return self.CrosshairRight:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, 0, _1080p * 788, _1080p * -4, _1080p * 4, 250 )
				end
			}
		} )
		CrosshairLeft:RegisterAnimationSequence( "BootUp", {
			{
				function ()
					return self.CrosshairLeft:SetAlpha( 0.4, 0 )
				end
			},
			{
				function ()
					return self.CrosshairLeft:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -2, 0, _1080p * -4, _1080p * 4, 0 )
				end,
				function ()
					return self.CrosshairLeft:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -788, 0, _1080p * -4, _1080p * 4, 250 )
				end
			}
		} )
		CrosshairTop:RegisterAnimationSequence( "BootUp", {
			{
				function ()
					return self.CrosshairTop:SetAlpha( 0.4, 0 )
				end
			},
			{
				function ()
					return self.CrosshairTop:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -4, _1080p * 4, _1080p * -2, 0, 0 )
				end,
				function ()
					return self.CrosshairTop:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -4, _1080p * 4, _1080p * -448, 0, 250 )
				end
			}
		} )
		self._sequences.BootUp = function ()
			CrosshairRight:AnimateSequence( "BootUp" )
			CrosshairLeft:AnimateSequence( "BootUp" )
			CrosshairTop:AnimateSequence( "BootUp" )
		end
		
		CrosshairRight:RegisterAnimationSequence( "Outro", {
			{
				function ()
					return self.CrosshairRight:SetAlpha( 0.4, 0 )
				end,
				function ()
					return self.CrosshairRight:SetAlpha( 0, 150 )
				end
			}
		} )
		CrosshairLeft:RegisterAnimationSequence( "Outro", {
			{
				function ()
					return self.CrosshairLeft:SetAlpha( 0.4, 0 )
				end,
				function ()
					return self.CrosshairLeft:SetAlpha( 0, 150 )
				end
			}
		} )
		CrosshairTop:RegisterAnimationSequence( "Outro", {
			{
				function ()
					return self.CrosshairTop:SetAlpha( 0.4, 0 )
				end,
				function ()
					return self.CrosshairTop:SetAlpha( 0, 150 )
				end
			}
		} )
		self._sequences.Outro = function ()
			CrosshairRight:AnimateSequence( "Outro" )
			CrosshairLeft:AnimateSequence( "Outro" )
			CrosshairTop:AnimateSequence( "Outro" )
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

MenuBuilder.registerType( "HackControlCrosshairLarge", HackControlCrosshairLarge )
LockTable( _M )
