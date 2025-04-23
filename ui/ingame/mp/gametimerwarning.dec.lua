local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function GameTimerWarning( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 73 * _1080p, 0, 36 * _1080p )
	self.id = "GameTimerWarning"
	self._animationSets = {}
	self._sequences = {}
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local GameTimerBackgroundRight = nil
	
	GameTimerBackgroundRight = LUI.UIImage.new()
	GameTimerBackgroundRight.id = "GameTimerBackgroundRight"
	GameTimerBackgroundRight:SetAlpha( 0, 0 )
	GameTimerBackgroundRight:setImage( RegisterMaterial( "codcaster_timer_warning" ), 0 )
	GameTimerBackgroundRight:SetUMin( 1, 0 )
	GameTimerBackgroundRight:SetUMax( 0.5, 0 )
	GameTimerBackgroundRight:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 67, _1080p * 75, _1080p * 2, _1080p * 34 )
	self:addElement( GameTimerBackgroundRight )
	self.GameTimerBackgroundRight = GameTimerBackgroundRight
	
	local GameTimerBackgroundRightCopy0 = nil
	
	GameTimerBackgroundRightCopy0 = LUI.UIImage.new()
	GameTimerBackgroundRightCopy0.id = "GameTimerBackgroundRightCopy0"
	GameTimerBackgroundRightCopy0:SetRGBFromInt( 6710886, 0 )
	GameTimerBackgroundRightCopy0:SetAlpha( 0, 0 )
	GameTimerBackgroundRightCopy0:setImage( RegisterMaterial( "codcaster_timer_warning" ), 0 )
	GameTimerBackgroundRightCopy0:SetUMin( 1, 0 )
	GameTimerBackgroundRightCopy0:SetUMax( 0, 0 )
	GameTimerBackgroundRightCopy0:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 29.5, _1080p * 45.5, _1080p * 2, _1080p * 34 )
	self:addElement( GameTimerBackgroundRightCopy0 )
	self.GameTimerBackgroundRightCopy0 = GameTimerBackgroundRightCopy0
	
	local GameTimerBackgroundRightCopy1 = nil
	
	GameTimerBackgroundRightCopy1 = LUI.UIImage.new()
	GameTimerBackgroundRightCopy1.id = "GameTimerBackgroundRightCopy1"
	GameTimerBackgroundRightCopy1:SetRGBFromInt( 11776947, 0 )
	GameTimerBackgroundRightCopy1:SetAlpha( 0, 0 )
	GameTimerBackgroundRightCopy1:setImage( RegisterMaterial( "codcaster_timer_warning" ), 0 )
	GameTimerBackgroundRightCopy1:SetUMin( 1, 0 )
	GameTimerBackgroundRightCopy1:SetUMax( 0, 0 )
	GameTimerBackgroundRightCopy1:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 48.5, _1080p * 64.5, _1080p * 2, _1080p * 34 )
	self:addElement( GameTimerBackgroundRightCopy1 )
	self.GameTimerBackgroundRightCopy1 = GameTimerBackgroundRightCopy1
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		GameTimerBackgroundRight:RegisterAnimationSequence( "TimeLimitWarning", {
			{
				function ()
					return self.GameTimerBackgroundRight:SetAlpha( 0, 0 )
				end,
				function ()
					return self.GameTimerBackgroundRight:SetAlpha( 1, 200 )
				end,
				function ()
					return self.GameTimerBackgroundRight:SetAlpha( 0, 400 )
				end
			}
		} )
		GameTimerBackgroundRightCopy0:RegisterAnimationSequence( "TimeLimitWarning", {
			{
				function ()
					return self.GameTimerBackgroundRightCopy0:SetAlpha( 0, 0 )
				end,
				function ()
					return self.GameTimerBackgroundRightCopy0:SetAlpha( 1, 600 )
				end,
				function ()
					return self.GameTimerBackgroundRightCopy0:SetAlpha( 0, 600 )
				end
			}
		} )
		GameTimerBackgroundRightCopy1:RegisterAnimationSequence( "TimeLimitWarning", {
			{
				function ()
					return self.GameTimerBackgroundRightCopy1:SetAlpha( 0, 0 )
				end,
				function ()
					return self.GameTimerBackgroundRightCopy1:SetAlpha( 1, 400 )
				end,
				function ()
					return self.GameTimerBackgroundRightCopy1:SetAlpha( 0, 500 )
				end
			}
		} )
		self._sequences.TimeLimitWarning = function ()
			GameTimerBackgroundRight:AnimateLoop( "TimeLimitWarning" )
			GameTimerBackgroundRightCopy0:AnimateLoop( "TimeLimitWarning" )
			GameTimerBackgroundRightCopy1:AnimateLoop( "TimeLimitWarning" )
		end
		
		GameTimerBackgroundRight:RegisterAnimationSequence( "ResetSequence", {
			{
				function ()
					return self.GameTimerBackgroundRight:SetAlpha( 0, 0 )
				end
			}
		} )
		GameTimerBackgroundRightCopy0:RegisterAnimationSequence( "ResetSequence", {
			{
				function ()
					return self.GameTimerBackgroundRightCopy0:SetAlpha( 0, 0 )
				end
			}
		} )
		GameTimerBackgroundRightCopy1:RegisterAnimationSequence( "ResetSequence", {
			{
				function ()
					return self.GameTimerBackgroundRightCopy1:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.ResetSequence = function ()
			GameTimerBackgroundRight:AnimateSequence( "ResetSequence" )
			GameTimerBackgroundRightCopy0:AnimateSequence( "ResetSequence" )
			GameTimerBackgroundRightCopy1:AnimateSequence( "ResetSequence" )
		end
		
	end
	
	self._animationSets.Active = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
	end
	
	self._animationSets.TimeLow = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
	end
	
	self._animationSets.NoTimeLimit = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	return self
end

MenuBuilder.registerType( "GameTimerWarning", GameTimerWarning )
LockTable( _M )
