local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function JackalLogo( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 250 * _1080p, 0, 125 * _1080p )
	self.id = "JackalLogo"
	self._animationSets = {}
	self._sequences = {}
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local UNSAlogo = nil
	
	UNSAlogo = LUI.UIImage.new()
	UNSAlogo.id = "UNSAlogo"
	UNSAlogo:SetAlpha( 0.5, 0 )
	UNSAlogo:SetYRotation( -20, 0 )
	UNSAlogo:setImage( RegisterMaterial( "unsa_logo_jackal" ), 0 )
	UNSAlogo:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -242, 0, 0, _1080p * 121 )
	self:addElement( UNSAlogo )
	self.UNSAlogo = UNSAlogo
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		UNSAlogo:RegisterAnimationSequence( "Bootup", {
			{
				function ()
					return self.UNSAlogo:SetAlpha( 0, 400 )
				end,
				function ()
					return self.UNSAlogo:SetAlpha( 0.2, 200, LUI.EASING.outBack )
				end
			},
			{
				function ()
					return self.UNSAlogo:SetAnchorsAndPosition( 1, 0, 0, 1, 0, _1080p * 242, 0, _1080p * 121, 0 )
				end,
				function ()
					return self.UNSAlogo:SetAnchorsAndPosition( 1, 0, 0, 1, 0, _1080p * 242, 0, _1080p * 121, 400 )
				end,
				function ()
					return self.UNSAlogo:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -242, 0, 0, _1080p * 121, 200, LUI.EASING.outBack )
				end
			}
		} )
		self._sequences.Bootup = function ()
			UNSAlogo:AnimateSequence( "Bootup" )
		end
		
		UNSAlogo:RegisterAnimationSequence( "Shutdown", {
			{
				function ()
					return self.UNSAlogo:SetAlpha( 0.5, 0 )
				end,
				function ()
					return self.UNSAlogo:SetAlpha( 0, 200, LUI.EASING.inBack )
				end
			},
			{
				function ()
					return self.UNSAlogo:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -242, 0, 0, _1080p * 121, 0 )
				end,
				function ()
					return self.UNSAlogo:SetAnchorsAndPosition( 1, 0, 0, 1, 0, _1080p * 242, 0, _1080p * 121, 200, LUI.EASING.inBack )
				end
			}
		} )
		self._sequences.Shutdown = function ()
			UNSAlogo:AnimateSequence( "Shutdown" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	self:SubscribeToModel( DataSources.inGame.HUD.overlay.jackalCallDownActive:GetModel( f1_local1 ), function ()
		if DataSources.inGame.HUD.overlay.jackalCallDownActive:GetValue( f1_local1 ) ~= nil and DataSources.inGame.HUD.overlay.jackalCallDownActive:GetValue( f1_local1 ) == true then
			ACTIONS.AnimateSequence( self, "Bootup" )
		end
	end )
	self:addEventHandler( "hud_anim_shutdown_off", function ( f16_arg0, f16_arg1 )
		local f16_local0 = f16_arg1.controller or f1_local1
		ACTIONS.AnimateSequence( self, "Shutdown" )
	end )
	return self
end

MenuBuilder.registerType( "JackalLogo", JackalLogo )
LockTable( _M )
