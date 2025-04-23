local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function xpRankUp( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 410 * _1080p, 0, 100 * _1080p )
	self.id = "xpRankUp"
	self._animationSets = {}
	self._sequences = {}
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local xpRankUp = nil
	
	xpRankUp = LUI.UIStyledText.new()
	xpRankUp.id = "xpRankUp"
	xpRankUp:SetFontSize( 60 * _1080p )
	xpRankUp:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	xpRankUp:SetAlignment( LUI.Alignment.Left )
	xpRankUp:SetShadowMinDistance( -0.8, 0 )
	xpRankUp:SetShadowMaxDistance( 0.8, 0 )
	xpRankUp:SetShadowRGBFromInt( 15678263, 0 )
	xpRankUp:SetOutlineRGBFromInt( 15678263, 0 )
	xpRankUp:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 8.63, _1080p * 508.63, _1080p * 20, _1080p * 80 )
	xpRankUp:SubscribeToModel( DataSources.inGame.CP.zombies.xpRank:GetModel( f1_local1 ), function ()
		local f2_local0 = DataSources.inGame.CP.zombies.xpRank:GetValue( f1_local1 )
		if f2_local0 ~= nil then
			xpRankUp:setText( LocalizeIntoString( f2_local0, "CP_ZOMBIE_RANK_UP_SPLASH" ), 0 )
		end
	end )
	self:addElement( xpRankUp )
	self.xpRankUp = xpRankUp
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		xpRankUp:RegisterAnimationSequence( "initial", {
			{
				function ()
					return self.xpRankUp:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.initial = function ()
			xpRankUp:AnimateSequence( "initial" )
		end
		
		xpRankUp:RegisterAnimationSequence( "rankUp", {
			{
				function ()
					return self.xpRankUp:SetAlpha( 0, 0 )
				end,
				function ()
					return self.xpRankUp:SetAlpha( 1, 320 )
				end,
				function ()
					return self.xpRankUp:SetAlpha( 1, 1210 )
				end,
				function ()
					return self.xpRankUp:SetAlpha( 0, 420 )
				end
			}
		} )
		self._sequences.rankUp = function ()
			xpRankUp:AnimateSequence( "rankUp" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	self:SubscribeToModel( DataSources.inGame.CP.zombies.xpRank:GetModel( f1_local1 ), function ()
		if DataSources.inGame.CP.zombies.xpRank:GetValue( f1_local1 ) ~= nil and DataSources.inGame.CP.zombies.xpRank:GetValue( f1_local1 ) > 0 then
			ACTIONS.AnimateSequence( self, "rankUp" )
		end
	end )
	ACTIONS.AnimateSequence( self, "initial" )
	return self
end

MenuBuilder.registerType( "xpRankUp", xpRankUp )
LockTable( _M )
