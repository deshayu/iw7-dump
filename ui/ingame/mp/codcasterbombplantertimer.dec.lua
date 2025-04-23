local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function CodCasterBombPlanterTimer( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 75 * _1080p, 0, 37 * _1080p )
	self.id = "CodCasterBombPlanterTimer"
	self._animationSets = {}
	self._sequences = {}
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local BombPlantedAtA = nil
	
	BombPlantedAtA = LUI.UIText.new()
	BombPlantedAtA.id = "BombPlantedAtA"
	BombPlantedAtA:setText( Engine.Localize( "MP_BOMB_PLANT_A" ), 0 )
	BombPlantedAtA:SetFontSize( 36 * _1080p )
	BombPlantedAtA:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	BombPlantedAtA:SetAlignment( LUI.Alignment.Center )
	BombPlantedAtA:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 28, _1080p * 75, 0, _1080p * 36 )
	self:addElement( BombPlantedAtA )
	self.BombPlantedAtA = BombPlantedAtA
	
	local BombPlantedAtB = nil
	
	BombPlantedAtB = LUI.UIText.new()
	BombPlantedAtB.id = "BombPlantedAtB"
	BombPlantedAtB:setText( Engine.Localize( "MP_BOMB_PLANT_B" ), 0 )
	BombPlantedAtB:SetFontSize( 36 * _1080p )
	BombPlantedAtB:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	BombPlantedAtB:SetAlignment( LUI.Alignment.Center )
	BombPlantedAtB:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 28, _1080p * 75, 0, _1080p * 36 )
	self:addElement( BombPlantedAtB )
	self.BombPlantedAtB = BombPlantedAtB
	
	local Icon = nil
	
	Icon = LUI.UIImage.new()
	Icon.id = "Icon"
	Icon:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 32, _1080p * 2, _1080p * 34 )
	Icon:SubscribeToModel( DataSources.inGame.MP.match.gameModeIcon:GetModel( f1_local1 ), function ()
		local f2_local0 = DataSources.inGame.MP.match.gameModeIcon:GetValue( f1_local1 )
		if f2_local0 ~= nil then
			Icon:setImage( RegisterMaterial( f2_local0 ), 0 )
		end
	end )
	self:addElement( Icon )
	self.Icon = Icon
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		BombPlantedAtA:RegisterAnimationSequence( "PlantedAtA", {
			{
				function ()
					return self.BombPlantedAtA:SetAlpha( 1, 0 )
				end
			}
		} )
		BombPlantedAtB:RegisterAnimationSequence( "PlantedAtA", {
			{
				function ()
					return self.BombPlantedAtB:SetAlpha( 0, 0 )
				end
			}
		} )
		Icon:RegisterAnimationSequence( "PlantedAtA", {
			{
				function ()
					return self.Icon:SetAlpha( 1, 0 )
				end
			}
		} )
		self._sequences.PlantedAtA = function ()
			BombPlantedAtA:AnimateSequence( "PlantedAtA" )
			BombPlantedAtB:AnimateSequence( "PlantedAtA" )
			Icon:AnimateSequence( "PlantedAtA" )
		end
		
		BombPlantedAtA:RegisterAnimationSequence( "PlantedAtB", {
			{
				function ()
					return self.BombPlantedAtA:SetAlpha( 0, 0 )
				end
			}
		} )
		BombPlantedAtB:RegisterAnimationSequence( "PlantedAtB", {
			{
				function ()
					return self.BombPlantedAtB:SetAlpha( 1, 0 )
				end
			}
		} )
		Icon:RegisterAnimationSequence( "PlantedAtB", {
			{
				function ()
					return self.Icon:SetAlpha( 1, 0 )
				end
			}
		} )
		self._sequences.PlantedAtB = function ()
			BombPlantedAtA:AnimateSequence( "PlantedAtB" )
			BombPlantedAtB:AnimateSequence( "PlantedAtB" )
			Icon:AnimateSequence( "PlantedAtB" )
		end
		
		BombPlantedAtA:RegisterAnimationSequence( "HidePlantedA", {
			{
				function ()
					return self.BombPlantedAtA:SetAlpha( 0, 0 )
				end
			}
		} )
		Icon:RegisterAnimationSequence( "HidePlantedA", {
			{
				function ()
					return self.Icon:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.HidePlantedA = function ()
			BombPlantedAtA:AnimateSequence( "HidePlantedA" )
			Icon:AnimateSequence( "HidePlantedA" )
		end
		
		BombPlantedAtB:RegisterAnimationSequence( "HidePlantedB", {
			{
				function ()
					return self.BombPlantedAtB:SetAlpha( 0, 0 )
				end
			}
		} )
		Icon:RegisterAnimationSequence( "HidePlantedB", {
			{
				function ()
					return self.Icon:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.HidePlantedB = function ()
			BombPlantedAtB:AnimateSequence( "HidePlantedB" )
			Icon:AnimateSequence( "HidePlantedB" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	self:SubscribeToModel( DataSources.inGame.HUD.bombPlantedA:GetModel( f1_local1 ), function ()
		if DataSources.inGame.HUD.bombPlantedA:GetValue( f1_local1 ) ~= nil and DataSources.inGame.HUD.bombPlantedA:GetValue( f1_local1 ) == true then
			ACTIONS.AnimateSequence( self, "PlantedAtA" )
		end
		if DataSources.inGame.HUD.bombPlantedA:GetValue( f1_local1 ) ~= nil and DataSources.inGame.HUD.bombPlantedA:GetValue( f1_local1 ) == false then
			ACTIONS.AnimateSequence( self, "HidePlantedA" )
		end
	end )
	self:SubscribeToModel( DataSources.inGame.HUD.bombPlantedB:GetModel( f1_local1 ), function ()
		if DataSources.inGame.HUD.bombPlantedB:GetValue( f1_local1 ) ~= nil and DataSources.inGame.HUD.bombPlantedB:GetValue( f1_local1 ) == true then
			ACTIONS.AnimateSequence( self, "PlantedAtB" )
		end
		if DataSources.inGame.HUD.bombPlantedB:GetValue( f1_local1 ) ~= nil and DataSources.inGame.HUD.bombPlantedB:GetValue( f1_local1 ) == false then
			ACTIONS.AnimateSequence( self, "HidePlantedB" )
		end
	end )
	return self
end

MenuBuilder.registerType( "CodCasterBombPlanterTimer", CodCasterBombPlanterTimer )
LockTable( _M )
