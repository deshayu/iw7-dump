local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function challengeProgressBarWidget( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 214 * _1080p, 0, 18 * _1080p )
	self.id = "challengeProgressBarWidget"
	self._animationSets = {}
	self._sequences = {}
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local Backing = nil
	
	Backing = LUI.UIImage.new()
	Backing.id = "Backing"
	Backing:SetRGBFromInt( 0, 0 )
	Backing:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 2, _1080p * 212.67, _1080p * 1, _1080p * 16.61 )
	self:addElement( Backing )
	self.Backing = Backing
	
	local challengeProgressBar = nil
	
	challengeProgressBar = MenuBuilder.BuildRegisteredType( "GenericProgressBar", {
		controllerIndex = f1_local1
	} )
	challengeProgressBar.id = "challengeProgressBar"
	challengeProgressBar:SetRGBFromInt( 10132122, 0 )
	challengeProgressBar:SetDataSource( DataSources.inGame.CP.zombies.challenges.challengeProgressBarFill, f1_local1 )
	challengeProgressBar.Fill:SetRGBFromInt( 15900471, 0 )
	challengeProgressBar:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 2, _1080p * 212.67, _1080p * 1, _1080p * 16.61 )
	self:addElement( challengeProgressBar )
	self.challengeProgressBar = challengeProgressBar
	
	self._animationSets.DefaultAnimationSet = function ()
		challengeProgressBar:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.challengeProgressBar:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.DefaultSequence = function ()
			challengeProgressBar:AnimateSequence( "DefaultSequence" )
		end
		
		challengeProgressBar:RegisterAnimationSequence( "challengeTypeAmountActive", {
			{
				function ()
					return self.challengeProgressBar:SetAlpha( 0, 0 )
				end,
				function ()
					return self.challengeProgressBar:SetAlpha( 0, 2000 )
				end,
				function ()
					return self.challengeProgressBar:SetAlpha( 1, 250 )
				end
			}
		} )
		self._sequences.challengeTypeAmountActive = function ()
			challengeProgressBar:AnimateSequence( "challengeTypeAmountActive" )
		end
		
		challengeProgressBar:RegisterAnimationSequence( "challengeTypeAmountDeactivate", {
			{
				function ()
					return self.challengeProgressBar:SetAlpha( 1, 0 )
				end,
				function ()
					return self.challengeProgressBar:SetAlpha( 0, 250 )
				end
			}
		} )
		self._sequences.challengeTypeAmountDeactivate = function ()
			challengeProgressBar:AnimateSequence( "challengeTypeAmountDeactivate" )
		end
		
		challengeProgressBar:RegisterAnimationSequence( "challengeTypeWave", {
			{
				function ()
					return self.challengeProgressBar:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.challengeTypeWave = function ()
			challengeProgressBar:AnimateSequence( "challengeTypeWave" )
		end
		
		challengeProgressBar:RegisterAnimationSequence( "challengeWaveDeactivate", {
			{
				function ()
					return self.challengeProgressBar:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.challengeWaveDeactivate = function ()
			challengeProgressBar:AnimateSequence( "challengeWaveDeactivate" )
		end
		
		challengeProgressBar:RegisterAnimationSequence( "challengeTypePlayer", {
			{
				function ()
					return self.challengeProgressBar:SetAlpha( 0, 0 )
				end,
				function ()
					return self.challengeProgressBar:SetAlpha( 0, 500 )
				end,
				function ()
					return self.challengeProgressBar:SetAlpha( 1, 240 )
				end
			}
		} )
		self._sequences.challengeTypePlayer = function ()
			challengeProgressBar:AnimateSequence( "challengeTypePlayer" )
		end
		
		challengeProgressBar:RegisterAnimationSequence( "challengeTypePlayerDeactivate", {
			{
				function ()
					return self.challengeProgressBar:SetAlpha( 1, 0 )
				end,
				function ()
					return self.challengeProgressBar:SetAlpha( 0, 240 )
				end
			}
		} )
		self._sequences.challengeTypePlayerDeactivate = function ()
			challengeProgressBar:AnimateSequence( "challengeTypePlayerDeactivate" )
		end
		
		challengeProgressBar:RegisterAnimationSequence( "next_challenge", {
			{
				function ()
					return self.challengeProgressBar:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.next_challenge = function ()
			challengeProgressBar:AnimateSequence( "next_challenge" )
		end
		
		self._sequences.scaleIcon = function ()
			
		end
		
		self._sequences.clearIcon = function ()
			
		end
		
		challengeProgressBar:RegisterAnimationSequence( "showPaused", {
			{
				function ()
					return self.challengeProgressBar:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.showPaused = function ()
			challengeProgressBar:AnimateSequence( "showPaused" )
		end
		
		challengeProgressBar:RegisterAnimationSequence( "challengeComplete", {
			{
				function ()
					return self.challengeProgressBar:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.challengeComplete = function ()
			challengeProgressBar:AnimateSequence( "challengeComplete" )
		end
		
		challengeProgressBar:RegisterAnimationSequence( "challengeFailed", {
			{
				function ()
					return self.challengeProgressBar:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.challengeFailed = function ()
			challengeProgressBar:AnimateSequence( "challengeFailed" )
		end
		
		challengeProgressBar:RegisterAnimationSequence( "clearAll", {
			{
				function ()
					return self.challengeProgressBar:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.clearAll = function ()
			challengeProgressBar:AnimateSequence( "clearAll" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	challengeProgressBar:SetDataSource( DataSources.inGame.CP.zombies.challenges.challengeProgressBarFill, f1_local1 )
	ACTIONS.AnimateSequence( self, "DefaultSequence" )
	return self
end

MenuBuilder.registerType( "challengeProgressBarWidget", challengeProgressBarWidget )
LockTable( _M )
