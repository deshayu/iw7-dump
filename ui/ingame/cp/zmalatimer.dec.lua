local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function PostLoadFunc( f1_arg0, f1_arg1 )
	f1_arg0:SetupInWorldElement( {} )
	f1_arg0:SetInWorldScale( 0.4 )
	f1_arg0:SetWorldSpacePosition( 2000, -4814, 395 )
	f1_arg0:SetWorldSpaceYaw( -180 )
end

function ZMALATimer( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 491 * _1080p, 0, 189 * _1080p )
	self.id = "ZMALATimer"
	self._animationSets = {}
	self._sequences = {}
	local f2_local1 = controller and controller.controllerIndex
	if not f2_local1 and not Engine.InFrontend() then
		f2_local1 = self:getRootController()
	end
	assert( f2_local1 )
	local f2_local2 = self
	local CountdownElement0 = nil
	
	CountdownElement0 = MenuBuilder.BuildRegisteredType( "UICountdown", {
		controllerIndex = f2_local1
	} )
	CountdownElement0.id = "CountdownElement0"
	CountdownElement0:SetAlpha( 0, 0 )
	CountdownElement0:SetFont( FONTS.GetFont( FONTS.Digital.File ) )
	CountdownElement0:SetAlignment( LUI.Alignment.Center )
	CountdownElement0:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 0.17, _1080p * 500.17, _1080p * 53.5, _1080p * 98.5 )
	CountdownElement0:SubscribeToModel( DataSources.inGame.CP.zombies.countdown:GetModel( f2_local1 ), function ()
		local f3_local0 = DataSources.inGame.CP.zombies.countdown:GetValue( f2_local1 )
		if f3_local0 ~= nil then
			CountdownElement0:setEndTime( f3_local0 )
		end
	end )
	self:addElement( CountdownElement0 )
	self.CountdownElement0 = CountdownElement0
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		CountdownElement0:RegisterAnimationSequence( "hideTimeRemaining", {
			{
				function ()
					return self.CountdownElement0:SetAlpha( 1, 0 )
				end,
				function ()
					return self.CountdownElement0:SetAlpha( 0, 100 )
				end
			}
		} )
		self._sequences.hideTimeRemaining = function ()
			CountdownElement0:AnimateSequence( "hideTimeRemaining" )
		end
		
		CountdownElement0:RegisterAnimationSequence( "showTimeRemaining", {
			{
				function ()
					return self.CountdownElement0:SetAlpha( 0, 0 )
				end,
				function ()
					return self.CountdownElement0:SetAlpha( 1, 100 )
				end
			}
		} )
		self._sequences.showTimeRemaining = function ()
			CountdownElement0:AnimateSequence( "showTimeRemaining" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	self:SubscribeToModel( DataSources.inGame.CP.zombies.countdown:GetModel( f2_local1 ), function ()
		if DataSources.inGame.CP.zombies.countdown:GetValue( f2_local1 ) ~= nil and DataSources.inGame.CP.zombies.countdown:GetValue( f2_local1 ) > 0 then
			ACTIONS.AnimateSequence( self, "showTimeRemaining" )
		end
	end )
	PostLoadFunc( self, f2_local1, controller )
	return self
end

MenuBuilder.registerType( "ZMALATimer", ZMALATimer )
LockTable( _M )
