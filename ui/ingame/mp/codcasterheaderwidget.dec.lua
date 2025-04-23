local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ( f1_arg0, f1_arg1 )
	f1_arg0.CodCasterHeaderTeamBased:SetTeamLogosVisibility( f1_arg1 )
end

f0_local1 = function ( f2_arg0, f2_arg1 )
	f2_arg0.CodCasterHeaderTeamBased:SetTeamNamesVisibility( f2_arg1 )
end

f0_local2 = function ( f3_arg0, f3_arg1, f3_arg2 )
	if GameX.gameModeIsFFA( gameMode ) == false then
		f3_arg0.CodCasterHeaderTeamBased:PlayHeaderHighlightAnimation( f3_arg1, f3_arg2 )
	end
end

function PostLoadFunc( f4_arg0, f4_arg1, f4_arg2 )
	if GameX.gameModeIsFFA( GameX.GetGameMode() ) then
		ACTIONS.AnimateSequence( f4_arg0, "VisibleNonTeamBased" )
		MLG.SetPlayerOutlineColorMode( 0 )
	else
		ACTIONS.AnimateSequence( f4_arg0, "VisibleTeamBased" )
		MLG.SetPlayerOutlineColorMode( 1 )
	end
	f4_arg0.SetTeamLogosVisibility = f0_local0
	f4_arg0.SetTeamNamesVisibility = f0_local1
	f4_arg0.PlayHeaderHighlightAnimation = f0_local2
end

function CodCasterHeaderWidget( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 1920 * _1080p, 0, 1080 * _1080p )
	self.id = "CodCasterHeaderWidget"
	self._animationSets = {}
	self._sequences = {}
	local f5_local1 = controller and controller.controllerIndex
	if not f5_local1 and not Engine.InFrontend() then
		f5_local1 = self:getRootController()
	end
	assert( f5_local1 )
	local f5_local2 = self
	local f5_local3 = nil
	if not Engine.InFrontend() then
		f5_local3 = MenuBuilder.BuildRegisteredType( "CodCasterHeaderNonTeamBased", {
			controllerIndex = f5_local1
		} )
		f5_local3.id = "CodCasterHeaderNonTeamBased"
		f5_local3:SetAlpha( 0, 0 )
		f5_local3:SetScale( -0.14, 0 )
		f5_local3:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -297, _1080p * 292, _1080p * 44.5, _1080p * 176.5 )
		self:addElement( f5_local3 )
		self.CodCasterHeaderNonTeamBased = f5_local3
	end
	local CodCasterHeaderTeamBased = nil
	
	CodCasterHeaderTeamBased = MenuBuilder.BuildRegisteredType( "CodCasterHeaderTeamBased", {
		controllerIndex = f5_local1
	} )
	CodCasterHeaderTeamBased.id = "CodCasterHeaderTeamBased"
	CodCasterHeaderTeamBased:SetScale( -0.14, 0 )
	CodCasterHeaderTeamBased:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -297, _1080p * 292, _1080p * 44.5, _1080p * 176.5 )
	self:addElement( CodCasterHeaderTeamBased )
	self.CodCasterHeaderTeamBased = CodCasterHeaderTeamBased
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		if not Engine.InFrontend() then
			f5_local3:RegisterAnimationSequence( "VisibleTeamBased", {
				{
					function ()
						return self.CodCasterHeaderNonTeamBased:SetAlpha( 0, 0 )
					end
				}
			} )
		end
		CodCasterHeaderTeamBased:RegisterAnimationSequence( "VisibleTeamBased", {
			{
				function ()
					return self.CodCasterHeaderTeamBased:SetAlpha( 1, 0 )
				end
			}
		} )
		self._sequences.VisibleTeamBased = function ()
			if not Engine.InFrontend() then
				f5_local3:AnimateSequence( "VisibleTeamBased" )
			end
			CodCasterHeaderTeamBased:AnimateSequence( "VisibleTeamBased" )
		end
		
		if not Engine.InFrontend() then
			f5_local3:RegisterAnimationSequence( "VisibleNonTeamBased", {
				{
					function ()
						return self.CodCasterHeaderNonTeamBased:SetAlpha( 1, 0 )
					end
				}
			} )
		end
		CodCasterHeaderTeamBased:RegisterAnimationSequence( "VisibleNonTeamBased", {
			{
				function ()
					return self.CodCasterHeaderTeamBased:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.VisibleNonTeamBased = function ()
			if not Engine.InFrontend() then
				f5_local3:AnimateSequence( "VisibleNonTeamBased" )
			end
			CodCasterHeaderTeamBased:AnimateSequence( "VisibleNonTeamBased" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	PostLoadFunc( self, f5_local1, controller )
	return self
end

MenuBuilder.registerType( "CodCasterHeaderWidget", CodCasterHeaderWidget )
LockTable( _M )
