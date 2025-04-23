local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ( f1_arg0, f1_arg1, f1_arg2 )
	f1_arg0:SetBlendMode( BLEND_MODE.addWithAlpha )
	local f1_local0 = DataSources.inGame.jackal.bootup
	local f1_local1 = DataSources.inGame.jackal.showHorizon
	f1_arg0:SubscribeToModel( f1_local0:GetModel( f1_arg1 ), function ()
		if f1_local0:GetValue( f1_arg1 ) and f1_local1:GetValue( f1_arg1 ) then
			ACTIONS.AnimateSequenceByElement( f1_arg0, {
				elementName = "LineSegmentRight",
				sequenceName = "bootup",
				elementPath = "LineSegmentRight"
			} )
			ACTIONS.AnimateSequenceByElement( f1_arg0, {
				elementName = "LineSegmentLeft",
				sequenceName = "bootup",
				elementPath = "LineSegmentLeft"
			} )
			ACTIONS.AnimateSequence( f1_arg0, "bootupIntroStrike" )
		end
	end )
end

function JackalArtificalHorizon( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 1000 * _1080p, 0, 16 * _1080p )
	self.id = "JackalArtificalHorizon"
	self._animationSets = {}
	self._sequences = {}
	local f3_local1 = controller and controller.controllerIndex
	if not f3_local1 and not Engine.InFrontend() then
		f3_local1 = self:getRootController()
	end
	assert( f3_local1 )
	local f3_local2 = self
	local LineSegmentRight = nil
	
	LineSegmentRight = MenuBuilder.BuildRegisteredType( "JackalHorizonLineSegment", {
		controllerIndex = f3_local1
	} )
	LineSegmentRight.id = "LineSegmentRight"
	LineSegmentRight:SetZRotation( 180, 0 )
	LineSegmentRight:SetAnchorsAndPosition( 1, 0, 0.5, 0.5, _1080p * -280, 0, _1080p * -8, _1080p * 8 )
	self:addElement( LineSegmentRight )
	self.LineSegmentRight = LineSegmentRight
	
	local LineSegmentLeft = nil
	
	LineSegmentLeft = MenuBuilder.BuildRegisteredType( "JackalHorizonLineSegment", {
		controllerIndex = f3_local1
	} )
	LineSegmentLeft.id = "LineSegmentLeft"
	LineSegmentLeft:SetAnchorsAndPosition( 0, 1, 0.5, 0.5, 0, _1080p * 280, _1080p * -8, _1080p * 8 )
	self:addElement( LineSegmentLeft )
	self.LineSegmentLeft = LineSegmentLeft
	
	self._animationSets.DefaultAnimationSet = function ()
		LineSegmentRight:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.LineSegmentRight:SetAlpha( 0, 0 )
				end
			}
		} )
		LineSegmentLeft:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.LineSegmentLeft:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.DefaultSequence = function ()
			LineSegmentRight:AnimateSequence( "DefaultSequence" )
			LineSegmentLeft:AnimateSequence( "DefaultSequence" )
		end
		
		LineSegmentRight:RegisterAnimationSequence( "bootupIntroStrike", {
			{
				function ()
					return self.LineSegmentRight:SetAlpha( 0, 0 )
				end,
				function ()
					return self.LineSegmentRight:SetAlpha( 0, 400 )
				end,
				function ()
					return self.LineSegmentRight:SetAlpha( 1, 200 )
				end
			}
		} )
		LineSegmentLeft:RegisterAnimationSequence( "bootupIntroStrike", {
			{
				function ()
					return self.LineSegmentLeft:SetAlpha( 0, 0 )
				end,
				function ()
					return self.LineSegmentLeft:SetAlpha( 0, 400 )
				end,
				function ()
					return self.LineSegmentLeft:SetAlpha( 1, 200 )
				end
			}
		} )
		self._sequences.bootupIntroStrike = function ()
			LineSegmentRight:AnimateSequence( "bootupIntroStrike" )
			LineSegmentLeft:AnimateSequence( "bootupIntroStrike" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	f0_local0( self, f3_local1, controller )
	ACTIONS.AnimateSequence( self, "DefaultSequence" )
	return self
end

MenuBuilder.registerType( "JackalArtificalHorizon", JackalArtificalHorizon )
LockTable( _M )
