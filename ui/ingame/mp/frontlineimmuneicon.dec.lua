local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function FrontlineImmuneIcon( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 64 * _1080p, 0, 64 * _1080p )
	self.id = "FrontlineImmuneIcon"
	self._animationSets = {}
	self._sequences = {}
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local Glow = nil
	
	Glow = LUI.UIImage.new()
	Glow.id = "Glow"
	Glow:SetRGBFromInt( 65535, 0 )
	Glow:SetAlpha( 0, 0 )
	Glow:setImage( RegisterMaterial( "widg_glow_circle" ), 0 )
	Glow:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * -6, _1080p * 6, _1080p * -6, _1080p * 6 )
	self:addElement( Glow )
	self.Glow = Glow
	
	local Shield = nil
	
	Shield = LUI.UIImage.new()
	Shield.id = "Shield"
	Shield:setImage( RegisterMaterial( "hud_icon_frontline_shield" ), 0 )
	self:addElement( Shield )
	self.Shield = Shield
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		Glow:RegisterAnimationSequence( "ShowShield", {
			{
				function ()
					return self.Glow:SetAlpha( 0, 0 )
				end,
				function ()
					return self.Glow:SetAlpha( 0.3, 500, LUI.EASING.outQuadratic )
				end,
				function ()
					return self.Glow:SetAlpha( 0, 500, LUI.EASING.inQuadratic )
				end
			}
		} )
		Shield:RegisterAnimationSequence( "ShowShield", {
			{
				function ()
					return self.Shield:SetAlpha( 1, 0 )
				end
			}
		} )
		self._sequences.ShowShield = function ()
			Glow:AnimateLoop( "ShowShield" )
			Shield:AnimateLoop( "ShowShield" )
		end
		
		Glow:RegisterAnimationSequence( "HideShield", {
			{
				function ()
					return self.Glow:SetAlpha( 0, 0 )
				end
			}
		} )
		Shield:RegisterAnimationSequence( "HideShield", {
			{
				function ()
					return self.Shield:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.HideShield = function ()
			Glow:AnimateSequence( "HideShield" )
			Shield:AnimateSequence( "HideShield" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	self:SubscribeToModel( DataSources.inGame.HUD.uplinkHUDEnabled:GetModel( f1_local1 ), function ()
		if DataSources.inGame.HUD.uplinkHUDEnabled:GetValue( f1_local1 ) ~= nil and DataSources.inGame.HUD.uplinkHUDEnabled:GetValue( f1_local1 ) == true then
			ACTIONS.AnimateSequence( self, "ShowShield" )
		end
		if DataSources.inGame.HUD.uplinkHUDEnabled:GetValue( f1_local1 ) ~= nil and DataSources.inGame.HUD.uplinkHUDEnabled:GetValue( f1_local1 ) == false then
			ACTIONS.AnimateSequence( self, "HideShield" )
		end
	end )
	return self
end

MenuBuilder.registerType( "FrontlineImmuneIcon", FrontlineImmuneIcon )
LockTable( _M )
