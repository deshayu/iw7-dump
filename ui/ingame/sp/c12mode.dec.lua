local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function C12Mode( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 230 * _1080p, 0, 28 * _1080p )
	self.id = "C12Mode"
	self._animationSets = {}
	self._sequences = {}
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local Background = nil
	
	Background = LUI.UIImage.new()
	Background.id = "Background"
	Background:setImage( RegisterMaterial( "hud_c12_accent_flr" ), 0 )
	Background:SetUseAA( true )
	Background:SetBlendMode( BLEND_MODE.addWithAlpha )
	Background:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -256, 0, 0, _1080p * 32 )
	self:addElement( Background )
	self.Background = Background
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		Background:RegisterAnimationSequence( "Bootup", {
			{
				function ()
					return self.Background:SetAlpha( 0, 0 )
				end,
				function ()
					return self.Background:SetAlpha( 1, 200, LUI.EASING.outBack )
				end
			},
			{
				function ()
					return self.Background:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -97, _1080p * 159, 0, _1080p * 32, 0 )
				end,
				function ()
					return self.Background:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -256, 0, 0, _1080p * 32, 200, LUI.EASING.outBack )
				end
			}
		} )
		self._sequences.Bootup = function ()
			Background:AnimateSequence( "Bootup" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	self:SubscribeToModel( DataSources.inGame.HUD.overlay.isC12Active:GetModel( f1_local1 ), function ()
		if DataSources.inGame.HUD.overlay.isC12Active:GetValue( f1_local1 ) ~= nil and DataSources.inGame.HUD.overlay.isC12Active:GetValue( f1_local1 ) == 1 then
			ACTIONS.AnimateSequence( self, "Bootup" )
		end
	end )
	return self
end

MenuBuilder.registerType( "C12Mode", C12Mode )
LockTable( _M )
