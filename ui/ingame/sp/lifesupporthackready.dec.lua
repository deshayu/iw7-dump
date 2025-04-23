local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function LifeSupportHackReady( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 640 * _1080p, 0, 25 * _1080p )
	self.id = "LifeSupportHackReady"
	self._animationSets = {}
	self._sequences = {}
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local LifeSupportHackReady = nil
	
	LifeSupportHackReady = LUI.UIText.new()
	LifeSupportHackReady.id = "LifeSupportHackReady"
	LifeSupportHackReady:setText( Engine.Localize( "SHIP_ASSAULT_LIFE_SUPPORT_HACK_READY" ), 0 )
	LifeSupportHackReady:SetFontSize( 20 * _1080p )
	LifeSupportHackReady:SetFont( FONTS.GetFont( FONTS.MainCondensed.File ) )
	LifeSupportHackReady:SetAlignment( LUI.Alignment.Left )
	self:addElement( LifeSupportHackReady )
	self.LifeSupportHackReady = LifeSupportHackReady
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		LifeSupportHackReady:RegisterAnimationSequence( "Ready", {
			{
				function ()
					return self.LifeSupportHackReady:SetAlpha( 0, 0 )
				end,
				function ()
					return self.LifeSupportHackReady:SetAlpha( 1, 1000, LUI.EASING.outQuadratic )
				end,
				function ()
					return self.LifeSupportHackReady:SetAlpha( 1, 2000 )
				end,
				function ()
					return self.LifeSupportHackReady:SetAlpha( 0, 1000, LUI.EASING.inQuadratic )
				end
			}
		} )
		self._sequences.Ready = function ()
			LifeSupportHackReady:AnimateSequence( "Ready" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	self:SubscribeToModel( DataSources.inGame.SP.wounded.lifeSupportState:GetModel( f1_local1 ), function ()
		if DataSources.inGame.SP.wounded.lifeSupportState:GetValue( f1_local1 ) ~= nil and DataSources.inGame.SP.wounded.lifeSupportState:GetValue( f1_local1 ) == 1 then
			ACTIONS.AnimateSequence( self, "Ready" )
		end
	end )
	return self
end

MenuBuilder.registerType( "LifeSupportHackReady", LifeSupportHackReady )
LockTable( _M )
