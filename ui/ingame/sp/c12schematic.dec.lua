local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function C12Schematic( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 400 * _1080p, 0, 550 * _1080p )
	self.id = "C12Schematic"
	self._animationSets = {}
	self._sequences = {}
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local Schematic = nil
	
	Schematic = LUI.UIImage.new()
	Schematic.id = "Schematic"
	Schematic:setImage( RegisterMaterial( "hud_c12_schematic" ), 0 )
	Schematic:SetBlendMode( BLEND_MODE.addWithAlpha )
	Schematic:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 400, 0, _1080p * 552 )
	self:addElement( Schematic )
	self.Schematic = Schematic
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		Schematic:RegisterAnimationSequence( "Bootup", {
			{
				function ()
					return self.Schematic:SetAlpha( 0, 0 )
				end,
				function ()
					return self.Schematic:SetAlpha( 1, 300 )
				end
			}
		} )
		self._sequences.Bootup = function ()
			Schematic:AnimateSequence( "Bootup" )
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

MenuBuilder.registerType( "C12Schematic", C12Schematic )
LockTable( _M )
