local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ( f1_arg0, f1_arg1 )
	ACTIONS.AnimateSequence( f1_arg0, "FadeOut" )
end

function PostLoadFunc( f2_arg0, f2_arg1 )
	local f2_local0 = DataSources.inGame.player.spawnCount
	f2_arg0:SubscribeToModel( f2_local0:GetModel( f2_arg1 ), function ()
		if f2_local0:GetValue( f2_arg1 ) and f2_local0:GetValue( f2_arg1 ) > 0 then
			f0_local0( f2_arg0, f2_arg1 )
		end
	end )
end

function HudFluffCurve( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 1920 * _1080p, 0, 1080 * _1080p )
	self.id = "HudFluffCurve"
	self._animationSets = {}
	self._sequences = {}
	local f4_local1 = controller and controller.controllerIndex
	if not f4_local1 and not Engine.InFrontend() then
		f4_local1 = self:getRootController()
	end
	assert( f4_local1 )
	local f4_local2 = self
	local CurveTopLeft = nil
	
	CurveTopLeft = LUI.UIImage.new()
	CurveTopLeft.id = "CurveTopLeft"
	CurveTopLeft:setImage( RegisterMaterial( "hud_fluff_curve" ), 0 )
	CurveTopLeft:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 890, 0, _1080p * -20, _1080p * 160 )
	self:addElement( CurveTopLeft )
	self.CurveTopLeft = CurveTopLeft
	
	local CurveTopRight = nil
	
	CurveTopRight = LUI.UIImage.new()
	CurveTopRight.id = "CurveTopRight"
	CurveTopRight:setImage( RegisterMaterial( "hud_fluff_curve" ), 0 )
	CurveTopRight:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -890, 0, _1080p * -20, _1080p * 160 )
	self:addElement( CurveTopRight )
	self.CurveTopRight = CurveTopRight
	
	local CurveBottomLeft = nil
	
	CurveBottomLeft = LUI.UIImage.new()
	CurveBottomLeft.id = "CurveBottomLeft"
	CurveBottomLeft:setImage( RegisterMaterial( "hud_fluff_curve" ), 0 )
	CurveBottomLeft:SetAnchorsAndPosition( 0, 1, 1, 0, _1080p * 890, 0, _1080p * 20, _1080p * -160 )
	self:addElement( CurveBottomLeft )
	self.CurveBottomLeft = CurveBottomLeft
	
	local CurveBottomRight = nil
	
	CurveBottomRight = LUI.UIImage.new()
	CurveBottomRight.id = "CurveBottomRight"
	CurveBottomRight:setImage( RegisterMaterial( "hud_fluff_curve" ), 0 )
	CurveBottomRight:SetAnchorsAndPosition( 1, 0, 1, 0, _1080p * -890, 0, _1080p * 20, _1080p * -160 )
	self:addElement( CurveBottomRight )
	self.CurveBottomRight = CurveBottomRight
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		CurveTopLeft:RegisterAnimationSequence( "FadeOut", {
			{
				function ()
					return self.CurveTopLeft:SetAlpha( 1, 0 )
				end,
				function ()
					return self.CurveTopLeft:SetAlpha( 0.2, 4000 )
				end
			}
		} )
		CurveTopRight:RegisterAnimationSequence( "FadeOut", {
			{
				function ()
					return self.CurveTopRight:SetAlpha( 1, 0 )
				end,
				function ()
					return self.CurveTopRight:SetAlpha( 0.2, 4000 )
				end
			}
		} )
		CurveBottomLeft:RegisterAnimationSequence( "FadeOut", {
			{
				function ()
					return self.CurveBottomLeft:SetAlpha( 1, 0 )
				end,
				function ()
					return self.CurveBottomLeft:SetAlpha( 0.2, 4000 )
				end
			}
		} )
		CurveBottomRight:RegisterAnimationSequence( "FadeOut", {
			{
				function ()
					return self.CurveBottomRight:SetAlpha( 1, 0 )
				end,
				function ()
					return self.CurveBottomRight:SetAlpha( 0.2, 4000 )
				end
			}
		} )
		self._sequences.FadeOut = function ()
			CurveTopLeft:AnimateSequence( "FadeOut" )
			CurveTopRight:AnimateSequence( "FadeOut" )
			CurveBottomLeft:AnimateSequence( "FadeOut" )
			CurveBottomRight:AnimateSequence( "FadeOut" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	PostLoadFunc( self, f4_local1, controller )
	ACTIONS.AnimateSequence( self, "FadeOut" )
	return self
end

MenuBuilder.registerType( "HudFluffCurve", HudFluffCurve )
LockTable( _M )
