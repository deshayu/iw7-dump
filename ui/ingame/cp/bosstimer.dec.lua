local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function BossTimer( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 200 * _1080p, 0, 50 * _1080p )
	self.id = "BossTimer"
	self._animationSets = {}
	self._sequences = {}
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local scoreBox = nil
	
	scoreBox = LUI.UIImage.new()
	scoreBox.id = "scoreBox"
	scoreBox:SetAlpha( 0.5, 0 )
	scoreBox:setImage( RegisterMaterial( "zm_pc_score_bg" ), 0 )
	scoreBox:SetUseAA( true )
	scoreBox:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -100, _1080p * 98, _1080p * 6, _1080p * 46 )
	self:addElement( scoreBox )
	self.scoreBox = scoreBox
	
	local Timer = nil
	
	Timer = LUI.UIText.new()
	Timer.id = "Timer"
	Timer:SetRGBFromTable( SWATCHES.Zombies.menuHeader, 0 )
	Timer:SetFontSize( 38 * _1080p )
	Timer:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	Timer:SetAlignment( LUI.Alignment.Center )
	Timer:SetOptOutRightToLeftAlignmentFlip( true )
	Timer:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 5.38, _1080p * 194.62, _1080p * 6, _1080p * 44 )
	Timer:SubscribeToModel( DataSources.inGame.CP.zombies.bossTimerText:GetModel( f1_local1 ), function ()
		local f2_local0 = DataSources.inGame.CP.zombies.bossTimerText:GetValue( f1_local1 )
		if f2_local0 ~= nil then
			Timer:setText( f2_local0, 0 )
		end
	end )
	self:addElement( Timer )
	self.Timer = Timer
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		scoreBox:RegisterAnimationSequence( "splashShowWin", {
			{
				function ()
					return self.scoreBox:SetAlpha( 0, 0 )
				end,
				function ()
					return self.scoreBox:SetAlpha( 0, 820 )
				end
			}
		} )
		Timer:RegisterAnimationSequence( "splashShowWin", {
			{
				function ()
					return self.Timer:SetAlpha( 0, 0 )
				end,
				function ()
					return self.Timer:SetAlpha( 0, 820 )
				end,
				function ()
					return self.Timer:SetAlpha( 1, 60 )
				end,
				function ()
					return self.Timer:SetAlpha( 1, 970 )
				end,
				function ()
					return self.Timer:SetAlpha( 0, 120 )
				end
			},
			{
				function ()
					return self.Timer:SetScale( 0, 0 )
				end,
				function ()
					return self.Timer:SetScale( 0, 880 )
				end,
				function ()
					return self.Timer:SetScale( 0.5, 350 )
				end,
				function ()
					return self.Timer:SetScale( 0, 200 )
				end,
				function ()
					return self.Timer:SetScale( 0.54, 270 )
				end
			}
		} )
		self._sequences.splashShowWin = function ()
			scoreBox:AnimateSequence( "splashShowWin" )
			Timer:AnimateSequence( "splashShowWin" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	return self
end

MenuBuilder.registerType( "BossTimer", BossTimer )
LockTable( _M )
