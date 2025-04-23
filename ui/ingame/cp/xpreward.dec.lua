local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function xpReward( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 280 * _1080p, 0, 44 * _1080p )
	self.id = "xpReward"
	self._animationSets = {}
	self._sequences = {}
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local xpEarned = nil
	
	xpEarned = LUI.UIStyledText.new()
	xpEarned.id = "xpEarned"
	xpEarned:SetFontSize( 55 * _1080p )
	xpEarned:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	xpEarned:SetAlignment( LUI.Alignment.Left )
	xpEarned:SetOptOutRightToLeftAlignmentFlip( true )
	xpEarned:SetShadowMinDistance( -0.8, 0 )
	xpEarned:SetShadowMaxDistance( 0.8, 0 )
	xpEarned:SetShadowRGBFromInt( 15678263, 0 )
	xpEarned:SetOutlineRGBFromInt( 14164771, 0 )
	xpEarned:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 280, _1080p * -5.5, _1080p * 49.5 )
	xpEarned:SubscribeToModel( DataSources.inGame.CP.zombies.xpReward:GetModel( f1_local1 ), function ()
		local f2_local0 = DataSources.inGame.CP.zombies.xpReward:GetValue( f1_local1 )
		if f2_local0 ~= nil then
			xpEarned:setText( LocalizeIntoString( f2_local0, "CP_ZOMBIE_XP_SPLASH" ), 0 )
		end
	end )
	self:addElement( xpEarned )
	self.xpEarned = xpEarned
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		xpEarned:RegisterAnimationSequence( "initial", {
			{
				function ()
					return self.xpEarned:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.initial = function ()
			xpEarned:AnimateSequence( "initial" )
		end
		
		xpEarned:RegisterAnimationSequence( "xpAdded", {
			{
				function ()
					return self.xpEarned:SetAlpha( 0, 0 )
				end,
				function ()
					return self.xpEarned:SetAlpha( 1, 500 )
				end,
				function ()
					return self.xpEarned:SetAlpha( 1, 1500 )
				end,
				function ()
					return self.xpEarned:SetAlpha( 0, 280 )
				end
			},
			{
				function ()
					return self.xpEarned:SetShadowMinDistance( -0.8, 0 )
				end,
				function ()
					return self.xpEarned:SetShadowMinDistance( -0.8, 2000 )
				end
			},
			{
				function ()
					return self.xpEarned:SetShadowMaxDistance( 0.48, 2000 )
				end
			}
		} )
		self._sequences.xpAdded = function ()
			xpEarned:AnimateSequence( "xpAdded" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	self:SubscribeToModel( DataSources.inGame.CP.zombies.xpRewardNotify:GetModel( f1_local1 ), function ()
		if DataSources.inGame.CP.zombies.xpRewardNotify:GetValue( f1_local1 ) ~= nil and DataSources.inGame.CP.zombies.xpRewardNotify:GetValue( f1_local1 ) > 1 then
			ACTIONS.AnimateSequence( self, "xpAdded" )
		end
	end )
	ACTIONS.AnimateSequence( self, "initial" )
	return self
end

MenuBuilder.registerType( "xpReward", xpReward )
LockTable( _M )
