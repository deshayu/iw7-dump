local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function AnnotationEnemyObjective( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 32 * _1080p, 0, 32 * _1080p )
	self.id = "AnnotationEnemyObjective"
	self._animationSets = {}
	self._sequences = {}
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local CaretSm = nil
	
	CaretSm = LUI.UIImage.new()
	CaretSm.id = "CaretSm"
	CaretSm:SetAlpha( 0, 0 )
	CaretSm:SetScale( -0.4, 0 )
	CaretSm:setImage( RegisterMaterial( "hud_jackal_offscreen_carrot_1_sm" ), 0 )
	CaretSm:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, _1080p * -12, _1080p * -12 )
	self:addElement( CaretSm )
	self.CaretSm = CaretSm
	
	local CaretMed = nil
	
	CaretMed = LUI.UIImage.new()
	CaretMed.id = "CaretMed"
	CaretMed:SetAlpha( 0, 0 )
	CaretMed:SetScale( -0.64, 0 )
	CaretMed:setImage( RegisterMaterial( "hud_jackal_offscreen_carrot_ax_med" ), 0 )
	CaretMed:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * -16, _1080p * 16, _1080p * -33, _1080p * -1 )
	self:addElement( CaretMed )
	self.CaretMed = CaretMed
	
	local Indicator = nil
	
	Indicator = MenuBuilder.BuildRegisteredType( "JackalOffscreenIndicatorEnemy", {
		controllerIndex = f1_local1
	} )
	Indicator.id = "Indicator"
	Indicator:SetAlpha( 0, 0 )
	Indicator:SetScale( -0.65, 0 )
	Indicator:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -48, _1080p * 48, _1080p * -48, _1080p * 48 )
	self:addElement( Indicator )
	self.Indicator = Indicator
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		CaretSm:RegisterAnimationSequence( "onscreen", {
			{
				function ()
					return self.CaretSm:SetAlpha( 1, 0 )
				end,
				function ()
					return self.CaretSm:SetAlpha( 0.5, 470 )
				end,
				function ()
					return self.CaretSm:SetAlpha( 1, 460 )
				end
			}
		} )
		CaretMed:RegisterAnimationSequence( "onscreen", {
			{
				function ()
					return self.CaretMed:SetAlpha( 0.85, 0 )
				end
			}
		} )
		Indicator:RegisterAnimationSequence( "onscreen", {
			{
				function ()
					return self.Indicator:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.onscreen = function ()
			CaretSm:AnimateLoop( "onscreen" )
			CaretMed:AnimateLoop( "onscreen" )
			Indicator:AnimateLoop( "onscreen" )
		end
		
		CaretSm:RegisterAnimationSequence( "offscreen", {
			{
				function ()
					return self.CaretSm:SetAlpha( 0, 0 )
				end
			}
		} )
		CaretMed:RegisterAnimationSequence( "offscreen", {
			{
				function ()
					return self.CaretMed:SetAlpha( 0, 0 )
				end
			}
		} )
		Indicator:RegisterAnimationSequence( "offscreen", {
			{
				function ()
					return self.Indicator:SetAlpha( 1, 0 )
				end
			}
		} )
		self._sequences.offscreen = function ()
			CaretSm:AnimateSequence( "offscreen" )
			CaretMed:AnimateSequence( "offscreen" )
			Indicator:AnimateSequence( "offscreen" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	self:addEventHandler( "anchor_on_screen", function ( f14_arg0, f14_arg1 )
		local f14_local0 = f14_arg1.controller or f1_local1
		ACTIONS.AnimateSequence( self, "onscreen" )
	end )
	self:addEventHandler( "anchor_off_screen", function ( f15_arg0, f15_arg1 )
		local f15_local0 = f15_arg1.controller or f1_local1
		ACTIONS.AnimateSequence( self, "offscreen" )
	end )
	return self
end

MenuBuilder.registerType( "AnnotationEnemyObjective", AnnotationEnemyObjective )
LockTable( _M )
