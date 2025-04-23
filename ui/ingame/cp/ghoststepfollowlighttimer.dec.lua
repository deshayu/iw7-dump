local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ( f1_arg0, f1_arg1, f1_arg2 )
	assert( f1_arg0.progressBar )
	local f1_local0 = DataSources.inGame.CP.zombies.dlc4.ghostStepFollowLightTimer
	f1_arg0:SubscribeToModel( f1_local0:GetModel( f1_arg1 ), function ()
		f1_arg0.progressBar:SetRightAnchor( 1 - LUI.clamp( f1_local0:GetValue( f1_arg1 ), 0, 1 ) )
	end )
end

function ghostStepFollowLightTimer( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 300 * _1080p, 0, 50 * _1080p )
	self.id = "ghostStepFollowLightTimer"
	self._animationSets = {}
	self._sequences = {}
	local f3_local1 = controller and controller.controllerIndex
	if not f3_local1 and not Engine.InFrontend() then
		f3_local1 = self:getRootController()
	end
	assert( f3_local1 )
	local f3_local2 = self
	local progressBarBorder = nil
	
	progressBarBorder = LUI.UIImage.new()
	progressBarBorder.id = "progressBarBorder"
	progressBarBorder:SetRGBFromInt( 2236448, 0 )
	progressBarBorder:SetAlpha( 0.6, 0 )
	progressBarBorder:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, _1080p * 16.61, _1080p * 37.61 )
	self:addElement( progressBarBorder )
	self.progressBarBorder = progressBarBorder
	
	local progressBar = nil
	
	progressBar = LUI.UIImage.new()
	progressBar.id = "progressBar"
	progressBar:setImage( RegisterMaterial( "cp_zmb_ghost_skull_fill_bar" ), 0 )
	progressBar:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 0, _1080p * 16.61, _1080p * 37.61 )
	self:addElement( progressBar )
	self.progressBar = progressBar
	
	self._animationSets.DefaultAnimationSet = function ()
		progressBarBorder:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.progressBarBorder:SetAlpha( 0, 0 )
				end
			}
		} )
		progressBar:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.progressBar:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.DefaultSequence = function ()
			progressBarBorder:AnimateSequence( "DefaultSequence" )
			progressBar:AnimateSequence( "DefaultSequence" )
		end
		
		progressBarBorder:RegisterAnimationSequence( "Show", {
			{
				function ()
					return self.progressBarBorder:SetAlpha( 0.6, 0 )
				end
			}
		} )
		progressBar:RegisterAnimationSequence( "Show", {
			{
				function ()
					return self.progressBar:SetAlpha( 1, 0 )
				end
			}
		} )
		self._sequences.Show = function ()
			progressBarBorder:AnimateSequence( "Show" )
			progressBar:AnimateSequence( "Show" )
		end
		
		progressBarBorder:RegisterAnimationSequence( "Hide", {
			{
				function ()
					return self.progressBarBorder:SetAlpha( 0, 0 )
				end
			}
		} )
		progressBar:RegisterAnimationSequence( "Hide", {
			{
				function ()
					return self.progressBar:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.Hide = function ()
			progressBarBorder:AnimateSequence( "Hide" )
			progressBar:AnimateSequence( "Hide" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	self:SubscribeToModel( DataSources.inGame.CP.zombies.dlc4.showGhostStepFollowLightTimer:GetModel( f3_local1 ), function ()
		if DataSources.inGame.CP.zombies.dlc4.showGhostStepFollowLightTimer:GetValue( f3_local1 ) ~= nil and DataSources.inGame.CP.zombies.dlc4.showGhostStepFollowLightTimer:GetValue( f3_local1 ) == 1 then
			ACTIONS.AnimateSequence( self, "Show" )
		end
		if DataSources.inGame.CP.zombies.dlc4.showGhostStepFollowLightTimer:GetValue( f3_local1 ) ~= nil and DataSources.inGame.CP.zombies.dlc4.showGhostStepFollowLightTimer:GetValue( f3_local1 ) == 0 then
			ACTIONS.AnimateSequence( self, "Hide" )
		end
	end )
	f0_local0( self, f3_local1, controller )
	ACTIONS.AnimateSequence( self, "DefaultSequence" )
	return self
end

MenuBuilder.registerType( "ghostStepFollowLightTimer", ghostStepFollowLightTimer )
LockTable( _M )
