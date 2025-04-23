local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function TeamSelectButton( menu, controller )
	local self = LUI.UIButton.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 500 * _1080p, 0, 30 * _1080p )
	self.id = "TeamSelectButton"
	self._animationSets = {}
	self._sequences = {}
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local Button = nil
	
	Button = MenuBuilder.BuildRegisteredType( "GenericButton", {
		controllerIndex = f1_local1
	} )
	Button.id = "Button"
	Button.Text:setText( ToUpperCase( LocalizeString( "Team" ) ), 0 )
	Button:SetAnchorsAndPosition( 0, 1, 0, 0, 0, _1080p * 500, 0, 0 )
	self:addElement( Button )
	self.Button = Button
	
	local CurrentTeamIcon = nil
	
	CurrentTeamIcon = LUI.UIImage.new()
	CurrentTeamIcon.id = "CurrentTeamIcon"
	CurrentTeamIcon:SetAlpha( 0, 0 )
	CurrentTeamIcon:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -43, _1080p * -9, _1080p * -2, _1080p * 32 )
	CurrentTeamIcon:SubscribeToModel( DataSources.inGame.MP.match.teamIcon:GetModel( f1_local1 ), function ()
		local f2_local0 = DataSources.inGame.MP.match.teamIcon:GetValue( f1_local1 )
		if f2_local0 ~= nil then
			CurrentTeamIcon:setImage( RegisterMaterial( f2_local0 ), 0 )
		end
	end )
	self:addElement( CurrentTeamIcon )
	self.CurrentTeamIcon = CurrentTeamIcon
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		CurrentTeamIcon:RegisterAnimationSequence( "BecomeCurrentTeamButton", {
			{
				function ()
					return self.CurrentTeamIcon:SetAlpha( 0, 0 )
				end,
				function ()
					return self.CurrentTeamIcon:SetAlpha( 1, 100 )
				end
			}
		} )
		self._sequences.BecomeCurrentTeamButton = function ()
			CurrentTeamIcon:AnimateSequence( "BecomeCurrentTeamButton" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	self:addEventHandler( "become_current_team_button", function ( f8_arg0, f8_arg1 )
		local f8_local0 = f8_arg1.controller or f1_local1
		ACTIONS.AnimateSequence( self, "BecomeCurrentTeamButton" )
	end )
	return self
end

MenuBuilder.registerType( "TeamSelectButton", TeamSelectButton )
LockTable( _M )
