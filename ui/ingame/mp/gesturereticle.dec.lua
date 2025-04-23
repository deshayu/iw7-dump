local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function GestureReticle( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 1920 * _1080p, 0, 1080 * _1080p )
	self.id = "GestureReticle"
	self._animationSets = {}
	self._sequences = {}
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local Reticle = nil
	
	Reticle = LUI.UIImage.new()
	Reticle.id = "Reticle"
	Reticle:SetRGBFromTable( SWATCHES.HUD.normal, 0 )
	Reticle:setImage( RegisterMaterial( "hud_reticle_uplink" ), 0 )
	Reticle:SetUseAA( true )
	Reticle:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * 840, _1080p * -840, _1080p * 420, _1080p * -420 )
	self:addElement( Reticle )
	self.Reticle = Reticle
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		Reticle:RegisterAnimationSequence( "Show", {
			{
				function ()
					return self.Reticle:SetAlpha( 0, 0 )
				end,
				function ()
					return self.Reticle:SetAlpha( 1, 100 )
				end
			}
		} )
		self._sequences.Show = function ()
			Reticle:AnimateSequence( "Show" )
		end
		
		Reticle:RegisterAnimationSequence( "Hide", {
			{
				function ()
					return self.Reticle:SetAlpha( 1, 0 )
				end,
				function ()
					return self.Reticle:SetAlpha( 0, 100 )
				end
			}
		} )
		self._sequences.Hide = function ()
			Reticle:AnimateSequence( "Hide" )
		end
		
		Reticle:RegisterAnimationSequence( "Kill", {
			{
				function ()
					return self.Reticle:SetAlpha( 1, 0 )
				end,
				function ()
					return self.Reticle:SetAlpha( 0.5, 100 )
				end
			},
			{
				function ()
					return self.Reticle:SetRGBFromTable( SWATCHES.HUDWarnings.danger, 0 )
				end,
				function ()
					return self.Reticle:SetRGBFromTable( SWATCHES.HUDWarnings.danger, 100 )
				end
			},
			{
				function ()
					return self.Reticle:SetScale( 0, 0 )
				end,
				function ()
					return self.Reticle:SetScale( 0.2, 100 )
				end
			}
		} )
		self._sequences.Kill = function ()
			Reticle:AnimateSequence( "Kill" )
		end
		
		Reticle:RegisterAnimationSequence( "White", {
			{
				function ()
					return self.Reticle:SetRGBFromTable( SWATCHES.HUD.normal, 0 )
				end,
				function ()
					return self.Reticle:SetRGBFromTable( SWATCHES.HUD.normal, 50 )
				end
			},
			{
				function ()
					return self.Reticle:SetAlpha( 1, 0 )
				end,
				function ()
					return self.Reticle:SetAlpha( 1, 50 )
				end
			},
			{
				function ()
					return self.Reticle:SetScale( 0, 0 )
				end,
				function ()
					return self.Reticle:SetScale( 0, 50 )
				end
			}
		} )
		self._sequences.White = function ()
			Reticle:AnimateSequence( "White" )
		end
		
		Reticle:RegisterAnimationSequence( "Dumbfire", {
			{
				function ()
					return self.Reticle:SetRGBFromTable( SWATCHES.HUD.caution, 0 )
				end,
				function ()
					return self.Reticle:SetRGBFromTable( SWATCHES.HUD.caution, 100 )
				end
			},
			{
				function ()
					return self.Reticle:SetAlpha( 1, 0 )
				end,
				function ()
					return self.Reticle:SetAlpha( 0.5, 100 )
				end
			},
			{
				function ()
					return self.Reticle:SetScale( 0, 0 )
				end,
				function ()
					return self.Reticle:SetScale( 0.2, 100 )
				end
			}
		} )
		self._sequences.Dumbfire = function ()
			Reticle:AnimateSequence( "Dumbfire" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	self:SubscribeToModel( DataSources.inGame.HUD.gestureReticle:GetModel( f1_local1 ), function ()
		if DataSources.inGame.HUD.gestureReticle:GetValue( f1_local1 ) ~= nil and DataSources.inGame.HUD.gestureReticle:GetValue( f1_local1 ) == 1 then
			ACTIONS.AnimateSequence( self, "Dumbfire" )
		end
		if DataSources.inGame.HUD.gestureReticle:GetValue( f1_local1 ) ~= nil and DataSources.inGame.HUD.gestureReticle:GetValue( f1_local1 ) == 2 then
			ACTIONS.AnimateSequence( self, "Kill" )
		end
		if DataSources.inGame.HUD.gestureReticle:GetValue( f1_local1 ) ~= nil and DataSources.inGame.HUD.gestureReticle:GetValue( f1_local1 ) == 0 then
			ACTIONS.AnimateSequence( self, "White" )
		end
		if DataSources.inGame.HUD.gestureReticle:GetValue( f1_local1 ) ~= nil and DataSources.inGame.HUD.gestureReticle:GetValue( f1_local1 ) == -1 then
			ACTIONS.AnimateSequence( self, "Hide" )
		end
	end )
	return self
end

MenuBuilder.registerType( "GestureReticle", GestureReticle )
LockTable( _M )
