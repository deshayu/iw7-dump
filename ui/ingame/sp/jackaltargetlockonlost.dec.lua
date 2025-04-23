local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ( f1_arg0, f1_arg1, f1_arg2 )
	f1_arg0:SubscribeToModel( DataSources.inGame.jackal.lockBroke:GetModel( f1_arg1 ), function ()
		ACTIONS.AnimateSequence( f1_arg0, "Lost" )
	end, true )
end

function JackalTargetLockonLost( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 100 * _1080p, 0, 100 * _1080p )
	self.id = "JackalTargetLockonLost"
	self._animationSets = {}
	self._sequences = {}
	local f3_local1 = controller and controller.controllerIndex
	if not f3_local1 and not Engine.InFrontend() then
		f3_local1 = self:getRootController()
	end
	assert( f3_local1 )
	self.soundSet = "jackal"
	local f3_local2 = self
	local ReticleBrackets = nil
	
	ReticleBrackets = MenuBuilder.BuildRegisteredType( "GenericReticleBrackets", {
		controllerIndex = f3_local1
	} )
	ReticleBrackets.id = "ReticleBrackets"
	ReticleBrackets:SetRGBFromTable( SWATCHES.jackal.warning, 0 )
	ReticleBrackets:SetZRotation( -45, 0 )
	ReticleBrackets.BottomRightBracketHorzLine:SetLeft( _1080p * -40, 0 )
	ReticleBrackets.BottomRightBracketVertLine:SetTop( _1080p * -40, 0 )
	ReticleBrackets.BottomLeftBracketHorzLine:SetRight( _1080p * 40, 0 )
	ReticleBrackets.BottomLeftBracketVertLine:SetTop( _1080p * -40, 0 )
	ReticleBrackets.TopRightBracketHorzLine:SetLeft( _1080p * -40, 0 )
	ReticleBrackets.TopRightBracketVertLine:SetBottom( _1080p * 40, 0 )
	ReticleBrackets.TopLeftBracketHorzLine:SetRight( _1080p * 40, 0 )
	ReticleBrackets.TopLeftBracketVertLine:SetBottom( _1080p * 40, 0 )
	ReticleBrackets:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -40, _1080p * 40, _1080p * -40, _1080p * 40 )
	self:addElement( ReticleBrackets )
	self.ReticleBrackets = ReticleBrackets
	
	local LockOnFrame = nil
	
	LockOnFrame = MenuBuilder.BuildRegisteredType( "JackalLockOnFrame", {
		controllerIndex = f3_local1
	} )
	LockOnFrame.id = "LockOnFrame"
	LockOnFrame:SetZRotation( 45, 0 )
	LockOnFrame:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * 4, _1080p * -4, _1080p * 4, _1080p * -4 )
	self:addElement( LockOnFrame )
	self.LockOnFrame = LockOnFrame
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		ReticleBrackets:RegisterAnimationSequence( "Lost", {
			{
				function ()
					return self.ReticleBrackets.BottomRightBracketHorzLine:SetLeft( _1080p * -40, 0 )
				end,
				function ()
					return self.ReticleBrackets.BottomRightBracketHorzLine:SetLeft( _1080p * -40, 100 )
				end,
				function ()
					return self.ReticleBrackets.BottomRightBracketHorzLine:SetLeft( _1080p * 0, 200, LUI.EASING.outQuadratic )
				end
			},
			{
				function ()
					return self.ReticleBrackets.BottomLeftBracketHorzLine:SetRight( _1080p * 40, 0 )
				end,
				function ()
					return self.ReticleBrackets.BottomLeftBracketHorzLine:SetRight( _1080p * 40, 100 )
				end,
				function ()
					return self.ReticleBrackets.BottomLeftBracketHorzLine:SetRight( _1080p * 0, 200, LUI.EASING.outQuadratic )
				end
			},
			{
				function ()
					return self.ReticleBrackets.TopRightBracketHorzLine:SetLeft( _1080p * -40, 0 )
				end,
				function ()
					return self.ReticleBrackets.TopRightBracketHorzLine:SetLeft( _1080p * -40, 100 )
				end,
				function ()
					return self.ReticleBrackets.TopRightBracketHorzLine:SetLeft( _1080p * 0, 200, LUI.EASING.outQuadratic )
				end
			},
			{
				function ()
					return self.ReticleBrackets.TopLeftBracketHorzLine:SetRight( _1080p * 40, 0 )
				end,
				function ()
					return self.ReticleBrackets.TopLeftBracketHorzLine:SetRight( _1080p * 40, 100 )
				end,
				function ()
					return self.ReticleBrackets.TopLeftBracketHorzLine:SetRight( _1080p * 0, 200, LUI.EASING.outQuadratic )
				end
			},
			{
				function ()
					return self.ReticleBrackets:SetAlpha( 1, 0 )
				end,
				function ()
					return self.ReticleBrackets:SetAlpha( 1, 100 )
				end,
				function ()
					return self.ReticleBrackets:SetAlpha( 1, 200, LUI.EASING.outQuadratic )
				end,
				function ()
					return self.ReticleBrackets:SetAlpha( 0, 50 )
				end,
				function ()
					return self.ReticleBrackets:SetAlpha( 0, 100 )
				end
			},
			{
				function ()
					return self.ReticleBrackets.BottomRightBracketVertLine:SetTop( _1080p * -40, 0 )
				end,
				function ()
					return self.ReticleBrackets.BottomRightBracketVertLine:SetTop( _1080p * -40, 100 )
				end,
				function ()
					return self.ReticleBrackets.BottomRightBracketVertLine:SetTop( _1080p * 0, 200, LUI.EASING.outQuadratic )
				end
			},
			{
				function ()
					return self.ReticleBrackets.BottomLeftBracketVertLine:SetTop( _1080p * -40, 0 )
				end,
				function ()
					return self.ReticleBrackets.BottomLeftBracketVertLine:SetTop( _1080p * -40, 100 )
				end,
				function ()
					return self.ReticleBrackets.BottomLeftBracketVertLine:SetTop( _1080p * 0, 200, LUI.EASING.outQuadratic )
				end
			},
			{
				function ()
					return self.ReticleBrackets.TopRightBracketVertLine:SetBottom( _1080p * 40, 0 )
				end,
				function ()
					return self.ReticleBrackets.TopRightBracketVertLine:SetBottom( _1080p * 40, 100 )
				end,
				function ()
					return self.ReticleBrackets.TopRightBracketVertLine:SetBottom( _1080p * 0, 200, LUI.EASING.outQuadratic )
				end
			},
			{
				function ()
					return self.ReticleBrackets.TopLeftBracketVertLine:SetBottom( _1080p * 40, 0 )
				end,
				function ()
					return self.ReticleBrackets.TopLeftBracketVertLine:SetBottom( _1080p * 40, 100 )
				end,
				function ()
					return self.ReticleBrackets.TopLeftBracketVertLine:SetBottom( _1080p * 0, 200, LUI.EASING.outQuadratic )
				end
			},
			{
				function ()
					return self.ReticleBrackets:SetScale( 0, 0 )
				end,
				function ()
					return self.ReticleBrackets:SetScale( 0, 100 )
				end,
				function ()
					return self.ReticleBrackets:SetScale( 4, 200, LUI.EASING.outQuadratic )
				end
			}
		} )
		LockOnFrame:RegisterAnimationSequence( "Lost", {
			{
				function ()
					return self.LockOnFrame:SetAlpha( 1, 0 )
				end,
				function ()
					return self.LockOnFrame:SetAlpha( 1, 100 )
				end,
				function ()
					return self.LockOnFrame:SetAlpha( 0, 200 )
				end
			}
		} )
		self._sequences.Lost = function ()
			ReticleBrackets:AnimateSequence( "Lost" )
			LockOnFrame:AnimateSequence( "Lost" )
		end
		
		ReticleBrackets:RegisterAnimationSequence( "Default", {
			{
				function ()
					return self.ReticleBrackets:SetAlpha( 0, 0 )
				end
			}
		} )
		LockOnFrame:RegisterAnimationSequence( "Default", {
			{
				function ()
					return self.LockOnFrame:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.Default = function ()
			ReticleBrackets:AnimateSequence( "Default" )
			LockOnFrame:AnimateSequence( "Default" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	f0_local0( self, f3_local1, controller )
	ACTIONS.AnimateSequence( self, "Default" )
	return self
end

MenuBuilder.registerType( "JackalTargetLockonLost", JackalTargetLockonLost )
LockTable( _M )
