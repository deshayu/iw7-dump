local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function PostLoadFunc( f1_arg0, f1_arg1, f1_arg2 )
	f1_arg0:SetYRotation( -25 )
	f1_arg0:SetXRotation( -15 )
end

function BombCarrierIcon( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 64 * _1080p, 0, 64 * _1080p )
	self.id = "BombCarrierIcon"
	self._animationSets = {}
	self._sequences = {}
	local f2_local1 = controller and controller.controllerIndex
	if not f2_local1 and not Engine.InFrontend() then
		f2_local1 = self:getRootController()
	end
	assert( f2_local1 )
	local f2_local2 = self
	local Bomb = nil
	
	Bomb = LUI.UIImage.new()
	Bomb.id = "Bomb"
	Bomb:setImage( RegisterMaterial( "icon_snd_pickup_bomb" ), 0 )
	Bomb:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * -24, 0, _1080p * -10, _1080p * 10 )
	self:addElement( Bomb )
	self.Bomb = Bomb
	
	local Glow = nil
	
	Glow = LUI.UIImage.new()
	Glow.id = "Glow"
	Glow:SetRGBFromInt( 65535, 0 )
	Glow:SetAlpha( 0, 0 )
	Glow:setImage( RegisterMaterial( "icon_snd_pickup_bomb" ), 0 )
	Glow:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * -24, 0, _1080p * -10, _1080p * 10 )
	self:addElement( Glow )
	self.Glow = Glow
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		Bomb:RegisterAnimationSequence( "ShowBall", {
			{
				function ()
					return self.Bomb:SetRGBFromInt( 16777215, 250 )
				end
			},
			{
				function ()
					return self.Bomb:SetAlpha( 1, 250 )
				end
			}
		} )
		Glow:RegisterAnimationSequence( "ShowBall", {
			{
				function ()
					return self.Glow:SetAlpha( 0, 250 )
				end,
				function ()
					return self.Glow:SetAlpha( 0.22, 630, LUI.EASING.inBack )
				end,
				function ()
					return self.Glow:SetAlpha( 0.22, 120 )
				end,
				function ()
					return self.Glow:SetAlpha( 0, 510 )
				end,
				function ()
					return self.Glow:SetAlpha( 0, 990 )
				end
			}
		} )
		self._sequences.ShowBall = function ()
			Bomb:AnimateLoop( "ShowBall" )
			Glow:AnimateLoop( "ShowBall" )
		end
		
		Bomb:RegisterAnimationSequence( "HideBall", {
			{
				function ()
					return self.Bomb:SetAlpha( 0, 150 )
				end
			}
		} )
		Glow:RegisterAnimationSequence( "HideBall", {
			{
				function ()
					return self.Glow:SetAlpha( 0, 150 )
				end
			}
		} )
		self._sequences.HideBall = function ()
			Bomb:AnimateSequence( "HideBall" )
			Glow:AnimateSequence( "HideBall" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	self:SubscribeToModel( DataSources.inGame.HUD.searchDestroyBombCarrying:GetModel( f2_local1 ), function ()
		if DataSources.inGame.HUD.searchDestroyBombCarrying:GetValue( f2_local1 ) ~= nil and DataSources.inGame.HUD.searchDestroyBombCarrying:GetValue( f2_local1 ) == true then
			ACTIONS.AnimateSequence( self, "ShowBall" )
		end
		if DataSources.inGame.HUD.searchDestroyBombCarrying:GetValue( f2_local1 ) ~= nil and DataSources.inGame.HUD.searchDestroyBombCarrying:GetValue( f2_local1 ) == false then
			ACTIONS.AnimateSequence( self, "HideBall" )
		end
	end )
	PostLoadFunc( self, f2_local1, controller )
	return self
end

MenuBuilder.registerType( "BombCarrierIcon", BombCarrierIcon )
LockTable( _M )
