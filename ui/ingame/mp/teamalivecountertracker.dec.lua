local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function PostLoadFunc( f1_arg0, f1_arg1 )
	f1_arg0.TeamScore:SetShadowUOffset( -0 )
	f1_arg0.TeamScore:SetShadowVOffset( -0 )
end

function TeamAliveCounterTracker( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 60 * _1080p, 0, 25 * _1080p )
	self.id = "TeamAliveCounterTracker"
	self._animationSets = {}
	self._sequences = {}
	local f2_local1 = controller and controller.controllerIndex
	if not f2_local1 and not Engine.InFrontend() then
		f2_local1 = self:getRootController()
	end
	assert( f2_local1 )
	local f2_local2 = self
	local TeamScore = nil
	
	TeamScore = LUI.UIStyledText.new()
	TeamScore.id = "TeamScore"
	TeamScore:setText( Engine.Localize( "MENU_NEW" ), 0 )
	TeamScore:SetFontSize( 22 * _1080p )
	TeamScore:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	TeamScore:SetAlignment( LUI.Alignment.Center )
	TeamScore:SetOptOutRightToLeftAlignmentFlip( true )
	TeamScore:SetShadowMinDistance( -0.2, 0 )
	TeamScore:SetShadowMaxDistance( 0.2, 0 )
	TeamScore:SetAnchorsAndPosition( 0, 0, 0.5, 0.5, _1080p * 5, _1080p * -5, _1080p * -11, _1080p * 11 )
	self:addElement( TeamScore )
	self.TeamScore = TeamScore
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		TeamScore:RegisterAnimationSequence( "Winning", {
			{
				function ()
					return self.TeamScore:SetAlpha( 1, 0 )
				end
			}
		} )
		self._sequences.Winning = function ()
			TeamScore:AnimateSequence( "Winning" )
		end
		
		TeamScore:RegisterAnimationSequence( "Losing", {
			{
				function ()
					return self.TeamScore:SetAlpha( 0.5, 0 )
				end
			}
		} )
		self._sequences.Losing = function ()
			TeamScore:AnimateSequence( "Losing" )
		end
		
		TeamScore:RegisterAnimationSequence( "UpdateText", {
			{
				function ()
					return self.TeamScore:SetScale( 0.5, 0 )
				end,
				function ()
					return self.TeamScore:SetScale( 0, 100 )
				end
			}
		} )
		self._sequences.UpdateText = function ()
			TeamScore:AnimateSequence( "UpdateText" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	self:addEventHandler( "menu_create", function ( f12_arg0, f12_arg1 )
		local f12_local0 = f12_arg1.controller or f2_local1
		if CONDITIONS.InGame( self ) then
			ACTIONS.SetAnimationSet( self, "DefaultAnimationSet" )
		end
	end )
	PostLoadFunc( self, f2_local1, controller )
	return self
end

MenuBuilder.registerType( "TeamAliveCounterTracker", TeamAliveCounterTracker )
LockTable( _M )
