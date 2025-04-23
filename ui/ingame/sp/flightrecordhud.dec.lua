local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function FlightRecordHud( menu, controller )
	local self = LUI.UIElement.new()
	self.id = "FlightRecordHud"
	self._animationSets = {}
	self._sequences = {}
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	self:playSound( "menu_open" )
	local f1_local2 = self
	self:setUseStencil( true )
	local BG = nil
	
	BG = LUI.UIImage.new()
	BG.id = "BG"
	BG:SetRGBFromInt( 3092271, 0 )
	BG:SetAlpha( 0.9, 0 )
	BG:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 429, _1080p * 1491, _1080p * 54, _1080p * 1026 )
	self:addElement( BG )
	self.BG = BG
	
	local GenericBorderFrame0 = nil
	
	GenericBorderFrame0 = LUI.UIBorder.new( {
		borderThicknessLeft = _1080p * 1,
		borderThicknessRight = _1080p * 1,
		borderThicknessTop = _1080p * 1,
		borderThicknessBottom = _1080p * 1
	} )
	GenericBorderFrame0.id = "GenericBorderFrame0"
	GenericBorderFrame0:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 429, _1080p * 1491, _1080p * 54, _1080p * 1026 )
	self:addElement( GenericBorderFrame0 )
	self.GenericBorderFrame0 = GenericBorderFrame0
	
	local VRRankings0 = nil
	
	VRRankings0 = MenuBuilder.BuildRegisteredType( "VRRankings", {
		controllerIndex = f1_local1
	} )
	VRRankings0.id = "VRRankings0"
	VRRankings0:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 429, _1080p * 1491, _1080p * 54, _1080p * 769 )
	self:addElement( VRRankings0 )
	self.VRRankings0 = VRRankings0
	
	local OnMIssionRankings0 = nil
	
	OnMIssionRankings0 = MenuBuilder.BuildRegisteredType( "OnMIssionRankings", {
		controllerIndex = f1_local1
	} )
	OnMIssionRankings0.id = "OnMIssionRankings0"
	OnMIssionRankings0:SetAlpha( 0, 0 )
	OnMIssionRankings0:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 429, _1080p * 1491, _1080p * 54, _1080p * 769 )
	self:addElement( OnMIssionRankings0 )
	self.OnMIssionRankings0 = OnMIssionRankings0
	
	local VRButton = nil
	
	VRButton = MenuBuilder.BuildRegisteredType( "SimpleScriptButton", {
		controllerIndex = f1_local1
	} )
	VRButton.id = "VRButton"
	VRButton.ButtonText:setText( "VR Rank", 0 )
	VRButton:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 429, _1080p * 929, _1080p * 794, _1080p * 839 )
	self:addElement( VRButton )
	self.VRButton = VRButton
	
	local OnMissionButton = nil
	
	OnMissionButton = MenuBuilder.BuildRegisteredType( "SimpleScriptButton", {
		controllerIndex = f1_local1
	} )
	OnMissionButton.id = "OnMissionButton"
	OnMissionButton.ButtonText:setText( "On Mission Rank", 0 )
	OnMissionButton:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 429, _1080p * 929, _1080p * 875.25, _1080p * 920.25 )
	self:addElement( OnMissionButton )
	self.OnMissionButton = OnMissionButton
	
	local LeaveMenuButton = nil
	
	LeaveMenuButton = MenuBuilder.BuildRegisteredType( "SimpleScriptButton", {
		controllerIndex = f1_local1
	} )
	LeaveMenuButton.id = "LeaveMenuButton"
	LeaveMenuButton.ButtonText:setText( "Leave Menu", 0 )
	LeaveMenuButton:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 429, _1080p * 929, _1080p * 952.29, _1080p * 997.29 )
	self:addElement( LeaveMenuButton )
	self.LeaveMenuButton = LeaveMenuButton
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		OnMIssionRankings0:RegisterAnimationSequence( "MissionRankingsFadeDown", {
			{
				function ()
					return self.OnMIssionRankings0:SetAlpha( 1, 0 )
				end,
				function ()
					return self.OnMIssionRankings0:SetAlpha( 0, 20 )
				end
			}
		} )
		self._sequences.MissionRankingsFadeDown = function ()
			OnMIssionRankings0:AnimateSequence( "MissionRankingsFadeDown" )
		end
		
		OnMIssionRankings0:RegisterAnimationSequence( "MissionRankingsFadeUp", {
			{
				function ()
					return self.OnMIssionRankings0:SetAlpha( 0, 0 )
				end,
				function ()
					return self.OnMIssionRankings0:SetAlpha( 1, 20 )
				end
			}
		} )
		self._sequences.MissionRankingsFadeUp = function ()
			OnMIssionRankings0:AnimateSequence( "MissionRankingsFadeUp" )
		end
		
		VRRankings0:RegisterAnimationSequence( "VRRankingsFadeDown", {
			{
				function ()
					return self.VRRankings0:SetAlpha( 1, 0 )
				end,
				function ()
					return self.VRRankings0:SetAlpha( 0, 20 )
				end
			}
		} )
		self._sequences.VRRankingsFadeDown = function ()
			VRRankings0:AnimateSequence( "VRRankingsFadeDown" )
		end
		
		VRRankings0:RegisterAnimationSequence( "VRRankingsFadeUp", {
			{
				function ()
					return self.VRRankings0:SetAlpha( 0, 0 )
				end,
				function ()
					return self.VRRankings0:SetAlpha( 1, 20 )
				end
			}
		} )
		self._sequences.VRRankingsFadeUp = function ()
			VRRankings0:AnimateSequence( "VRRankingsFadeUp" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	VRButton:addEventHandler( "button_over", function ( f16_arg0, f16_arg1 )
		local f16_local0 = f16_arg1.controller or f1_local1
		ACTIONS.AnimateSequence( self, "VRRankingsFadeUp" )
		ACTIONS.AnimateSequence( self, "MissionRankingsFadeDown" )
	end )
	OnMissionButton:addEventHandler( "button_over", function ( f17_arg0, f17_arg1 )
		local f17_local0 = f17_arg1.controller or f1_local1
		ACTIONS.AnimateSequence( self, "MissionRankingsFadeUp" )
		ACTIONS.AnimateSequence( self, "VRRankingsFadeDown" )
	end )
	LeaveMenuButton:addEventHandler( "button_action", function ( f18_arg0, f18_arg1 )
		local f18_local0 = f18_arg1.controller or f1_local1
		ACTIONS.ScriptNotify( "exit_lounge_menu", 1 )
		ACTIONS.CloseAllMenus( self )
	end )
	VRButton.navigation = {
		down = OnMissionButton
	}
	OnMissionButton.navigation = {
		up = VRButton,
		down = LeaveMenuButton
	}
	LeaveMenuButton.navigation = {
		up = OnMissionButton
	}
	return self
end

MenuBuilder.registerType( "FlightRecordHud", FlightRecordHud )
LockTable( _M )
