local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function PostLoadFunc( f1_arg0, f1_arg1 )
	f1_arg0:SetupAnchoredElement( {
		minScale = 1,
		maxScale = 1,
		onObstruction = LUI.UIAnchoredElement.ON_OBSTRUCTION.hide
	} )
	if Engine.GetDvarBool( "g_specialistMode" ) then
		f1_arg0:SubscribeToModel( DataSources.inGame.jackal.missileLockTarget:GetModel( f1_arg1 ), function ( f2_arg0 )
			f1_arg0:SetEntityNum( DataModel.GetModelValue( f2_arg0 ) )
		end, true )
		f1_arg0:SubscribeToModel( DataSources.inGame.jackal.missileLockTargetTag:GetModel( f1_arg1 ), function ( f3_arg0 )
			f1_arg0:SetEntityTag( DataModel.GetModelValue( f3_arg0 ) )
		end, true )
		local f1_local0 = DataSources.inGame.jackal.specialistAds
		f1_arg0:SubscribeToModel( f1_local0:GetModel( f1_arg1 ), function ()
			if f1_local0:GetValue( f1_arg1 ) then
				ACTIONS.AnimateSequence( f1_arg0, "specialistAdsOn" )
			else
				ACTIONS.AnimateSequence( f1_arg0, "specialistAdsOff" )
			end
		end, true )
	else
		f1_arg0:SubscribeToModel( DataSources.inGame.jackal.missileLockTarget:GetModel( f1_arg1 ), function ( f5_arg0 )
			f1_arg0:SetEntityNum( DataModel.GetModelValue( f5_arg0 ) )
			ACTIONS.AnimateSequence( f1_arg0, "Default" )
		end, true )
		f1_arg0:SubscribeToModel( DataSources.inGame.jackal.missileLockTargetTag:GetModel( f1_arg1 ), function ( f6_arg0 )
			f1_arg0:SetEntityTag( DataModel.GetModelValue( f6_arg0 ) )
			ACTIONS.AnimateSequence( f1_arg0, "Default" )
		end, true )
		local f1_local0 = DataSources.inGame.jackal.inDogfight
		f1_arg0:SubscribeToModel( f1_local0:GetModel( f1_arg1 ), function ()
			if f1_local0:GetValue( f1_arg1 ) then
				ACTIONS.AnimateSequence( f1_arg0, "Dogfight" )
			else
				ACTIONS.AnimateSequence( f1_arg0, "Default" )
			end
		end, true )
	end
end

function JackalTargetLockon( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 100 * _1080p, 0, 100 * _1080p )
	self.id = "JackalTargetLockon"
	self._animationSets = {}
	self._sequences = {}
	local f8_local1 = controller and controller.controllerIndex
	if not f8_local1 and not Engine.InFrontend() then
		f8_local1 = self:getRootController()
	end
	assert( f8_local1 )
	self.soundSet = "jackal"
	local f8_local2 = self
	local ReticleBrackets = nil
	
	ReticleBrackets = MenuBuilder.BuildRegisteredType( "GenericReticleBrackets", {
		controllerIndex = f8_local1
	} )
	ReticleBrackets.id = "ReticleBrackets"
	ReticleBrackets:SetRGBFromTable( SWATCHES.jackal.warning, 0 )
	ReticleBrackets:SetAlpha( 0, 0 )
	ReticleBrackets.BottomRightBracketHorzLine:SetLeft( _1080p * -10, 0 )
	ReticleBrackets.BottomRightBracketVertLine:SetTop( _1080p * -40, 0 )
	ReticleBrackets.BottomLeftBracketHorzLine:SetRight( _1080p * 10, 0 )
	ReticleBrackets.BottomLeftBracketVertLine:SetTop( _1080p * -40, 0 )
	ReticleBrackets.TopRightBracketHorzLine:SetLeft( _1080p * -10, 0 )
	ReticleBrackets.TopRightBracketVertLine:SetBottom( _1080p * 40, 0 )
	ReticleBrackets.TopLeftBracketHorzLine:SetRight( _1080p * 10, 0 )
	ReticleBrackets.TopLeftBracketVertLine:SetBottom( _1080p * 40, 0 )
	ReticleBrackets:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -40, _1080p * 40, _1080p * -40, _1080p * 40 )
	self:addElement( ReticleBrackets )
	self.ReticleBrackets = ReticleBrackets
	
	local LockOnFrame = nil
	
	LockOnFrame = MenuBuilder.BuildRegisteredType( "JackalLockOnFrame", {
		controllerIndex = f8_local1
	} )
	LockOnFrame.id = "LockOnFrame"
	LockOnFrame:SetAlpha( 0, 0 )
	LockOnFrame:SetZRotation( 45, 0 )
	LockOnFrame:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * 4, _1080p * -4, _1080p * 4, _1080p * -4 )
	self:addElement( LockOnFrame )
	self.LockOnFrame = LockOnFrame
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		ReticleBrackets:RegisterAnimationSequence( "Lockon", {
			{
				function ()
					return self.ReticleBrackets.BottomRightBracketHorzLine:SetLeft( _1080p * -10, 0 )
				end,
				function ()
					return self.ReticleBrackets.BottomRightBracketHorzLine:SetLeft( _1080p * -40, 200, LUI.EASING.outBack )
				end
			},
			{
				function ()
					return self.ReticleBrackets.BottomRightBracketVertLine:SetTop( _1080p * -40, 0 )
				end
			},
			{
				function ()
					return self.ReticleBrackets.BottomLeftBracketHorzLine:SetRight( _1080p * 10, 0 )
				end,
				function ()
					return self.ReticleBrackets.BottomLeftBracketHorzLine:SetRight( _1080p * 40, 200, LUI.EASING.outBack )
				end
			},
			{
				function ()
					return self.ReticleBrackets.BottomLeftBracketVertLine:SetTop( _1080p * -40, 0 )
				end
			},
			{
				function ()
					return self.ReticleBrackets.TopRightBracketHorzLine:SetLeft( _1080p * -10, 0 )
				end,
				function ()
					return self.ReticleBrackets.TopRightBracketHorzLine:SetLeft( _1080p * -40, 200, LUI.EASING.outBack )
				end
			},
			{
				function ()
					return self.ReticleBrackets.TopRightBracketVertLine:SetBottom( _1080p * 40, 0 )
				end
			},
			{
				function ()
					return self.ReticleBrackets.TopLeftBracketHorzLine:SetRight( _1080p * 10, 0 )
				end,
				function ()
					return self.ReticleBrackets.TopLeftBracketHorzLine:SetRight( _1080p * 40, 200, LUI.EASING.outBack )
				end
			},
			{
				function ()
					return self.ReticleBrackets.TopLeftBracketVertLine:SetBottom( _1080p * 40, 0 )
				end
			},
			{
				function ()
					return self.ReticleBrackets:SetZRotation( 0, 0 )
				end,
				function ()
					return self.ReticleBrackets:SetZRotation( -45, 200, LUI.EASING.outBack )
				end
			},
			{
				function ()
					return self.ReticleBrackets:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.ReticleBrackets:SetRGBFromTable( SWATCHES.jackal.warning, 0 )
				end
			}
		} )
		self._sequences.Lockon = function ()
			ReticleBrackets:AnimateSequence( "Lockon" )
		end
		
		ReticleBrackets:RegisterAnimationSequence( "Default", {
			{
				function ()
					return self.ReticleBrackets:SetAlpha( 1, 100 )
				end
			},
			{
				function ()
					return self.ReticleBrackets:SetZRotation( 0, 100 )
				end
			},
			{
				function ()
					return self.ReticleBrackets.TopLeftBracketVertLine:SetBottom( _1080p * 40, 100 )
				end
			},
			{
				function ()
					return self.ReticleBrackets.TopLeftBracketHorzLine:SetRight( _1080p * 10, 100 )
				end
			},
			{
				function ()
					return self.ReticleBrackets.TopRightBracketVertLine:SetBottom( _1080p * 40, 100 )
				end
			},
			{
				function ()
					return self.ReticleBrackets.TopRightBracketHorzLine:SetLeft( _1080p * -10, 100 )
				end
			},
			{
				function ()
					return self.ReticleBrackets.BottomLeftBracketVertLine:SetTop( _1080p * -40, 100 )
				end
			},
			{
				function ()
					return self.ReticleBrackets.BottomLeftBracketHorzLine:SetRight( _1080p * 10, 100 )
				end
			},
			{
				function ()
					return self.ReticleBrackets.BottomRightBracketVertLine:SetTop( _1080p * -40, 100 )
				end
			},
			{
				function ()
					return self.ReticleBrackets.BottomRightBracketHorzLine:SetLeft( _1080p * -10, 100 )
				end
			},
			{
				function ()
					return self.ReticleBrackets:SetRGBFromTable( SWATCHES.jackal.warning, 100 )
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
		
		ReticleBrackets:RegisterAnimationSequence( "Dogfight", {
			{
				function ()
					return self.ReticleBrackets.BottomRightBracketHorzLine:SetLeft( _1080p * -40, 0 )
				end
			},
			{
				function ()
					return self.ReticleBrackets.BottomRightBracketVertLine:SetTop( _1080p * -40, 0 )
				end
			},
			{
				function ()
					return self.ReticleBrackets.BottomLeftBracketHorzLine:SetRight( _1080p * 40, 0 )
				end
			},
			{
				function ()
					return self.ReticleBrackets.BottomLeftBracketVertLine:SetTop( _1080p * -40, 0 )
				end
			},
			{
				function ()
					return self.ReticleBrackets.TopRightBracketHorzLine:SetLeft( _1080p * -40, 0 )
				end
			},
			{
				function ()
					return self.ReticleBrackets.TopRightBracketVertLine:SetBottom( _1080p * 40, 0 )
				end
			},
			{
				function ()
					return self.ReticleBrackets.TopLeftBracketHorzLine:SetRight( _1080p * 40, 0 )
				end
			},
			{
				function ()
					return self.ReticleBrackets.TopLeftBracketVertLine:SetBottom( _1080p * 40, 0 )
				end
			},
			{
				function ()
					return self.ReticleBrackets:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.ReticleBrackets:SetZRotation( 45, 0 )
				end
			},
			{
				function ()
					return self.ReticleBrackets:SetRGBFromTable( SWATCHES.jackal.warning, 0 )
				end
			}
		} )
		LockOnFrame:RegisterAnimationSequence( "Dogfight", {
			{
				function ()
					return self.LockOnFrame:SetAlpha( 1, 0 )
				end,
				function ()
					return self.LockOnFrame:SetAlpha( 1, 250, LUI.EASING.outQuadratic )
				end
			},
			{
				function ()
					return self.LockOnFrame:SetZRotation( 180, 0 )
				end,
				function ()
					return self.LockOnFrame:SetZRotation( 45, 250, LUI.EASING.outQuadratic )
				end
			},
			{
				function ()
					return self.LockOnFrame:SetScale( 19, 0 )
				end,
				function ()
					return self.LockOnFrame:SetScale( 0, 250, LUI.EASING.outQuadratic )
				end
			}
		} )
		self._sequences.Dogfight = function ()
			ReticleBrackets:AnimateSequence( "Dogfight" )
			LockOnFrame:AnimateSequence( "Dogfight" )
		end
		
		ReticleBrackets:RegisterAnimationSequence( "specialistAdsOn", {
			{
				function ()
					return self.ReticleBrackets:SetAlpha( 0, 0 )
				end,
				function ()
					return self.ReticleBrackets:SetAlpha( 1, 90, LUI.EASING.outQuadratic )
				end,
				function ()
					return self.ReticleBrackets:SetAlpha( 1, 60, LUI.EASING.inQuadratic )
				end
			},
			{
				function ()
					return self.ReticleBrackets:SetScale( 1, 0 )
				end,
				function ()
					return self.ReticleBrackets:SetScale( -0.05, 90, LUI.EASING.outQuadratic )
				end,
				function ()
					return self.ReticleBrackets:SetScale( 0, 60, LUI.EASING.inQuadratic )
				end
			},
			{
				function ()
					return self.ReticleBrackets:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -120, _1080p * 120, _1080p * -40, _1080p * 40, 0 )
				end,
				function ()
					return self.ReticleBrackets:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -32, _1080p * 32, _1080p * -40, _1080p * 40, 90, LUI.EASING.outQuadratic )
				end,
				function ()
					return self.ReticleBrackets:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -40, _1080p * 40, _1080p * -40, _1080p * 40, 60, LUI.EASING.inQuadratic )
				end
			}
		} )
		self._sequences.specialistAdsOn = function ()
			ReticleBrackets:AnimateSequence( "specialistAdsOn" )
		end
		
		ReticleBrackets:RegisterAnimationSequence( "specialistAdsOff", {
			{
				function ()
					return self.ReticleBrackets:SetAlpha( 1, 0 )
				end,
				function ()
					return self.ReticleBrackets:SetAlpha( 0, 110, LUI.EASING.inQuadratic )
				end
			},
			{
				function ()
					return self.ReticleBrackets:SetScale( 0, 0 )
				end,
				function ()
					return self.ReticleBrackets:SetScale( 1, 110, LUI.EASING.inQuadratic )
				end
			},
			{
				function ()
					return self.ReticleBrackets:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -40, _1080p * 40, _1080p * -40, _1080p * 40, 0 )
				end,
				function ()
					return self.ReticleBrackets:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -120, _1080p * 120, _1080p * -40, _1080p * 40, 109, LUI.EASING.inQuadratic )
				end
			}
		} )
		self._sequences.specialistAdsOff = function ()
			ReticleBrackets:AnimateSequence( "specialistAdsOff" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	PostLoadFunc( self, f8_local1, controller )
	return self
end

MenuBuilder.registerType( "JackalTargetLockon", JackalTargetLockon )
LockTable( _M )
