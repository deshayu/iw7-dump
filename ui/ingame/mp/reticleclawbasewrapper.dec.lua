local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function ReticleClawBaseWrapper( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 100 * _1080p, 0, 34 * _1080p )
	self.id = "ReticleClawBaseWrapper"
	self._animationSets = {}
	self._sequences = {}
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local LeftLine = nil
	
	LeftLine = MenuBuilder.BuildRegisteredType( "ReticleClawLine", {
		controllerIndex = f1_local1
	} )
	LeftLine.id = "LeftLine"
	LeftLine:SetScale( -0.5, 0 )
	LeftLine:SetAnchorsAndPosition( 0, 1, 0.5, 0.5, _1080p * -103.5, _1080p * 34.5, _1080p * -32, _1080p * 32 )
	self:addElement( LeftLine )
	self.LeftLine = LeftLine
	
	local RightLine = nil
	
	RightLine = MenuBuilder.BuildRegisteredType( "ReticleClawLine", {
		controllerIndex = f1_local1
	} )
	RightLine.id = "RightLine"
	RightLine:SetZRotation( 180, 0 )
	RightLine:SetScale( -0.5, 0 )
	RightLine:SetAnchorsAndPosition( 1, 0, 0.5, 0.5, _1080p * -34.75, _1080p * 104.25, _1080p * -32, _1080p * 32 )
	self:addElement( RightLine )
	self.RightLine = RightLine
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		LeftLine:RegisterAnimationSequence( "OnFire", {
			{
				function ()
					return self.LeftLine:SetAnchorsAndPosition( 0, 1, 0.5, 0.5, _1080p * -109.5, _1080p * 28.5, _1080p * -32, _1080p * 32, 0 )
				end,
				function ()
					return self.LeftLine:SetAnchorsAndPosition( 0, 1, 0.5, 0.5, _1080p * -94.5, _1080p * 43.5, _1080p * -32, _1080p * 32, 39, LUI.EASING.inOutBack )
				end,
				function ()
					return self.LeftLine:SetAnchorsAndPosition( 0, 1, 0.5, 0.5, _1080p * -103.5, _1080p * 34.5, _1080p * -32, _1080p * 32, 60, LUI.EASING.inOutBack )
				end
			}
		} )
		RightLine:RegisterAnimationSequence( "OnFire", {
			{
				function ()
					return self.RightLine:SetAnchorsAndPosition( 1, 0, 0.5, 0.5, _1080p * -28.75, _1080p * 110.25, _1080p * -32, _1080p * 32, 0 )
				end,
				function ()
					return self.RightLine:SetAnchorsAndPosition( 1, 0, 0.5, 0.5, _1080p * -43.75, _1080p * 95.25, _1080p * -32, _1080p * 32, 39, LUI.EASING.inOutBack )
				end,
				function ()
					return self.RightLine:SetAnchorsAndPosition( 1, 0, 0.5, 0.5, _1080p * -34.75, _1080p * 104.25, _1080p * -32, _1080p * 32, 60 )
				end
			}
		} )
		self._sequences.OnFire = function ()
			LeftLine:AnimateSequence( "OnFire" )
			RightLine:AnimateSequence( "OnFire" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	return self
end

MenuBuilder.registerType( "ReticleClawBaseWrapper", ReticleClawBaseWrapper )
LockTable( _M )
