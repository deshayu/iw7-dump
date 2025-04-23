local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function JackalInteriorScreenShipInfoBooster( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 400 * _1080p, 0, 140 * _1080p )
	self.id = "JackalInteriorScreenShipInfoBooster"
	self._animationSets = {}
	self._sequences = {}
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local BSTR1 = nil
	
	BSTR1 = LUI.UIImage.new()
	BSTR1.id = "BSTR1"
	BSTR1:setImage( RegisterMaterial( "hud_jackal_interior_ship_bstr" ), 0 )
	BSTR1:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 40, 0, _1080p * 81 )
	self:addElement( BSTR1 )
	self.BSTR1 = BSTR1
	
	local BSTR6 = nil
	
	BSTR6 = LUI.UIImage.new()
	BSTR6.id = "BSTR6"
	BSTR6:setImage( RegisterMaterial( "hud_jackal_interior_ship_bstr" ), 0 )
	BSTR6:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -40, 0, 0, _1080p * 81 )
	self:addElement( BSTR6 )
	self.BSTR6 = BSTR6
	
	local BSTR2 = nil
	
	BSTR2 = LUI.UIImage.new()
	BSTR2.id = "BSTR2"
	BSTR2:setImage( RegisterMaterial( "hud_jackal_interior_ship_bstr" ), 0 )
	BSTR2:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 62, _1080p * 102, _1080p * 50, _1080p * 131 )
	self:addElement( BSTR2 )
	self.BSTR2 = BSTR2
	
	local BSTR5 = nil
	
	BSTR5 = LUI.UIImage.new()
	BSTR5.id = "BSTR5"
	BSTR5:setImage( RegisterMaterial( "hud_jackal_interior_ship_bstr" ), 0 )
	BSTR5:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -102, _1080p * -62, _1080p * 50, _1080p * 131 )
	self:addElement( BSTR5 )
	self.BSTR5 = BSTR5
	
	local BSTR3 = nil
	
	BSTR3 = LUI.UIImage.new()
	BSTR3.id = "BSTR3"
	BSTR3:setImage( RegisterMaterial( "hud_jackal_interior_ship_bstr" ), 0 )
	BSTR3:SetAnchorsAndPosition( 0, 1, 1, 0, _1080p * 125, _1080p * 165, _1080p * -81, 0 )
	self:addElement( BSTR3 )
	self.BSTR3 = BSTR3
	
	local BSTR4 = nil
	
	BSTR4 = LUI.UIImage.new()
	BSTR4.id = "BSTR4"
	BSTR4:setImage( RegisterMaterial( "hud_jackal_interior_ship_bstr" ), 0 )
	BSTR4:SetAnchorsAndPosition( 1, 0, 1, 0, _1080p * -165, _1080p * -125, _1080p * -81, 0 )
	self:addElement( BSTR4 )
	self.BSTR4 = BSTR4
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		BSTR1:RegisterAnimationSequence( "BoosterOn", {
			{
				function ()
					return self.BSTR1:SetAlpha( 1, 0 )
				end
			}
		} )
		BSTR6:RegisterAnimationSequence( "BoosterOn", {
			{
				function ()
					return self.BSTR6:SetAlpha( 1, 0 )
				end
			}
		} )
		BSTR2:RegisterAnimationSequence( "BoosterOn", {
			{
				function ()
					return self.BSTR2:SetAlpha( 1, 0 )
				end
			}
		} )
		BSTR5:RegisterAnimationSequence( "BoosterOn", {
			{
				function ()
					return self.BSTR5:SetAlpha( 1, 0 )
				end
			}
		} )
		BSTR3:RegisterAnimationSequence( "BoosterOn", {
			{
				function ()
					return self.BSTR3:SetAlpha( 1, 0 )
				end
			}
		} )
		BSTR4:RegisterAnimationSequence( "BoosterOn", {
			{
				function ()
					return self.BSTR4:SetAlpha( 1, 0 )
				end
			}
		} )
		self._sequences.BoosterOn = function ()
			BSTR1:AnimateSequence( "BoosterOn" )
			BSTR6:AnimateSequence( "BoosterOn" )
			BSTR2:AnimateSequence( "BoosterOn" )
			BSTR5:AnimateSequence( "BoosterOn" )
			BSTR3:AnimateSequence( "BoosterOn" )
			BSTR4:AnimateSequence( "BoosterOn" )
		end
		
		BSTR1:RegisterAnimationSequence( "BoosterOff", {
			{
				function ()
					return self.BSTR1:SetAlpha( 0, 0 )
				end
			}
		} )
		BSTR6:RegisterAnimationSequence( "BoosterOff", {
			{
				function ()
					return self.BSTR6:SetAlpha( 0, 0 )
				end
			}
		} )
		BSTR2:RegisterAnimationSequence( "BoosterOff", {
			{
				function ()
					return self.BSTR2:SetAlpha( 0, 0 )
				end
			}
		} )
		BSTR5:RegisterAnimationSequence( "BoosterOff", {
			{
				function ()
					return self.BSTR5:SetAlpha( 0, 0 )
				end
			}
		} )
		BSTR3:RegisterAnimationSequence( "BoosterOff", {
			{
				function ()
					return self.BSTR3:SetAlpha( 0, 0 )
				end
			}
		} )
		BSTR4:RegisterAnimationSequence( "BoosterOff", {
			{
				function ()
					return self.BSTR4:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.BoosterOff = function ()
			BSTR1:AnimateSequence( "BoosterOff" )
			BSTR6:AnimateSequence( "BoosterOff" )
			BSTR2:AnimateSequence( "BoosterOff" )
			BSTR5:AnimateSequence( "BoosterOff" )
			BSTR3:AnimateSequence( "BoosterOff" )
			BSTR4:AnimateSequence( "BoosterOff" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	self:SubscribeToModel( DataSources.inGame.jackal.atmoLaunch:GetModel( f1_local1 ), function ()
		if DataSources.inGame.jackal.atmoLaunch:GetValue( f1_local1 ) ~= nil and DataSources.inGame.jackal.atmoLaunch:GetValue( f1_local1 ) == true then
			ACTIONS.AnimateSequence( self, "BoosterOn" )
		end
		if DataSources.inGame.jackal.atmoLaunch:GetValue( f1_local1 ) ~= nil and DataSources.inGame.jackal.atmoLaunch:GetValue( f1_local1 ) == false then
			ACTIONS.AnimateSequence( self, "BoosterOff" )
		end
	end )
	ACTIONS.AnimateSequence( self, "BoosterOff" )
	return self
end

MenuBuilder.registerType( "JackalInteriorScreenShipInfoBooster", JackalInteriorScreenShipInfoBooster )
LockTable( _M )
