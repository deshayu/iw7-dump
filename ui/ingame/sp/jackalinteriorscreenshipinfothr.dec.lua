local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function JackalInteriorScreenShipInfoThr( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 324 * _1080p, 0, 37 * _1080p )
	self.id = "JackalInteriorScreenShipInfoThr"
	self._animationSets = {}
	self._sequences = {}
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local THR1 = nil
	
	THR1 = LUI.UIImage.new()
	THR1.id = "THR1"
	THR1:setImage( RegisterMaterial( "hud_jackal_interior_ship_thr" ), 0 )
	THR1:SetAnchorsAndPosition( 0.5, 0.5, 1, 0, _1080p * -161.5, _1080p * -81.5, _1080p * -36, 0 )
	self:addElement( THR1 )
	self.THR1 = THR1
	
	local THR2 = nil
	
	THR2 = LUI.UIImage.new()
	THR2.id = "THR2"
	THR2:setImage( RegisterMaterial( "hud_jackal_interior_ship_thr" ), 0 )
	THR2:SetAnchorsAndPosition( 0.5, 0.5, 1, 0, _1080p * -80.5, _1080p * -0.5, _1080p * -36, 0 )
	self:addElement( THR2 )
	self.THR2 = THR2
	
	local THR3 = nil
	
	THR3 = LUI.UIImage.new()
	THR3.id = "THR3"
	THR3:setImage( RegisterMaterial( "hud_jackal_interior_ship_thr" ), 0 )
	THR3:SetAnchorsAndPosition( 0.5, 0.5, 1, 0, _1080p * 0.5, _1080p * 80.5, _1080p * -36, 0 )
	self:addElement( THR3 )
	self.THR3 = THR3
	
	local THR4 = nil
	
	THR4 = LUI.UIImage.new()
	THR4.id = "THR4"
	THR4:setImage( RegisterMaterial( "hud_jackal_interior_ship_thr" ), 0 )
	THR4:SetAnchorsAndPosition( 0.5, 0.5, 1, 0, _1080p * 81.5, _1080p * 161.5, _1080p * -36, 0 )
	self:addElement( THR4 )
	self.THR4 = THR4
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		THR1:RegisterAnimationSequence( "ThrustersOff", {
			{
				function ()
					return self.THR1:SetAlpha( 0, 0 )
				end
			}
		} )
		THR2:RegisterAnimationSequence( "ThrustersOff", {
			{
				function ()
					return self.THR2:SetAlpha( 0, 0 )
				end
			}
		} )
		THR3:RegisterAnimationSequence( "ThrustersOff", {
			{
				function ()
					return self.THR3:SetAlpha( 0, 0 )
				end
			}
		} )
		THR4:RegisterAnimationSequence( "ThrustersOff", {
			{
				function ()
					return self.THR4:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.ThrustersOff = function ()
			THR1:AnimateSequence( "ThrustersOff" )
			THR2:AnimateSequence( "ThrustersOff" )
			THR3:AnimateSequence( "ThrustersOff" )
			THR4:AnimateSequence( "ThrustersOff" )
		end
		
		THR1:RegisterAnimationSequence( "ThrustersOn", {
			{
				function ()
					return self.THR1:SetAlpha( 1, 0 )
				end
			}
		} )
		THR2:RegisterAnimationSequence( "ThrustersOn", {
			{
				function ()
					return self.THR2:SetAlpha( 1, 0 )
				end
			}
		} )
		THR3:RegisterAnimationSequence( "ThrustersOn", {
			{
				function ()
					return self.THR3:SetAlpha( 1, 0 )
				end
			}
		} )
		THR4:RegisterAnimationSequence( "ThrustersOn", {
			{
				function ()
					return self.THR4:SetAlpha( 1, 0 )
				end
			}
		} )
		self._sequences.ThrustersOn = function ()
			THR1:AnimateSequence( "ThrustersOn" )
			THR2:AnimateSequence( "ThrustersOn" )
			THR3:AnimateSequence( "ThrustersOn" )
			THR4:AnimateSequence( "ThrustersOn" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	self:SubscribeToModel( DataSources.inGame.jackal.isThrusting:GetModel( f1_local1 ), function ()
		if DataSources.inGame.jackal.isThrusting:GetValue( f1_local1 ) ~= nil and DataSources.inGame.jackal.isThrusting:GetValue( f1_local1 ) == true then
			ACTIONS.AnimateSequence( self, "ThrustersOn" )
		end
		if DataSources.inGame.jackal.isThrusting:GetValue( f1_local1 ) ~= nil and DataSources.inGame.jackal.isThrusting:GetValue( f1_local1 ) == false then
			ACTIONS.AnimateSequence( self, "ThrustersOff" )
		end
	end )
	ACTIONS.AnimateSequence( self, "ThrustersOff" )
	return self
end

MenuBuilder.registerType( "JackalInteriorScreenShipInfoThr", JackalInteriorScreenShipInfoThr )
LockTable( _M )
