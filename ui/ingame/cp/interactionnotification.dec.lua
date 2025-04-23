local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function PostLoadFunc( f1_arg0, f1_arg1 )
	f1_arg0:SetupAnchoredElement( {
		snapToScreenEdges = false
	} )
	local f1_local0 = function ( f2_arg0, f2_arg1 )
		f2_arg0:SetEntityNum( Game.GetOmnvar( "zm_interaction_ent" ) )
	end
	
	f1_arg0:registerOmnvarHandler( "zm_interaction_ent", f1_local0 )
	f1_local0( f1_arg0, {} )
end

function interactionNotification( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 150 * _1080p, 0, 64 * _1080p )
	self.id = "interactionNotification"
	self._animationSets = {}
	self._sequences = {}
	local f3_local1 = controller and controller.controllerIndex
	if not f3_local1 and not Engine.InFrontend() then
		f3_local1 = self:getRootController()
	end
	assert( f3_local1 )
	local f3_local2 = self
	local Backing = nil
	
	Backing = LUI.UIImage.new()
	Backing.id = "Backing"
	Backing:setImage( RegisterMaterial( "cp_zmb_interaction_backing" ), 0 )
	Backing:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -37, _1080p * 75, _1080p * -17, _1080p * 19 )
	self:addElement( Backing )
	self.Backing = Backing
	
	local Cost = nil
	
	Cost = LUI.UIText.new()
	Cost.id = "Cost"
	Cost:SetAlpha( 0, 0 )
	Cost:SetFontSize( 22 * _1080p )
	Cost:SetFont( FONTS.GetFont( FONTS.Digital.File ) )
	Cost:SetAlignment( LUI.Alignment.Center )
	Cost:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -14.5, _1080p * 75, _1080p * -8, _1080p * 14 )
	Cost:SubscribeToModel( DataSources.inGame.CP.zombies.interactionNotificationAmount:GetModel( f3_local1 ), function ()
		local f4_local0 = DataSources.inGame.CP.zombies.interactionNotificationAmount:GetValue( f3_local1 )
		if f4_local0 ~= nil then
			Cost:setText( f4_local0, 0 )
		end
	end )
	self:addElement( Cost )
	self.Cost = Cost
	
	local Spinner = nil
	
	Spinner = LUI.UIImage.new()
	Spinner.id = "Spinner"
	Spinner:setImage( RegisterMaterial( "cp_zmb_interaction_spinner" ), 0 )
	Spinner:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -75, _1080p * -11, _1080p * -32, _1080p * 32 )
	self:addElement( Spinner )
	self.Spinner = Spinner
	
	local Button = nil
	
	Button = LUI.UIImage.new()
	Button.id = "Button"
	Button:setImage( RegisterMaterial( "cp_zmb_interaction_button" ), 0 )
	Button:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -75, _1080p * -11, _1080p * -32, _1080p * 32 )
	self:addElement( Button )
	self.Button = Button
	
	local ticket = nil
	
	ticket = LUI.UIImage.new()
	ticket.id = "ticket"
	ticket:SetAlpha( 0, 0 )
	ticket:setImage( RegisterMaterial( "cp_zmb_interaction_ticket" ), 0 )
	ticket:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -64, _1080p * 64, _1080p * -32, _1080p * 32 )
	self:addElement( ticket )
	self.ticket = ticket
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		Backing:RegisterAnimationSequence( "NoCostCenteredButton", {
			{
				function ()
					return self.Backing:SetAlpha( 0, 0 )
				end
			}
		} )
		Cost:RegisterAnimationSequence( "NoCostCenteredButton", {
			{
				function ()
					return self.Cost:SetAlpha( 0, 0 )
				end
			}
		} )
		Spinner:RegisterAnimationSequence( "NoCostCenteredButton", {
			{
				function ()
					return self.Spinner:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.Spinner:SetZRotation( 0, 0 )
				end,
				function ()
					return self.Spinner:SetZRotation( 360, 6000 )
				end
			},
			{
				function ()
					return self.Spinner:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -32, _1080p * 32, _1080p * -32, _1080p * 32, 0 )
				end
			}
		} )
		Button:RegisterAnimationSequence( "NoCostCenteredButton", {
			{
				function ()
					return self.Button:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.Button:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -32, _1080p * 32, _1080p * -32, _1080p * 32, 0 )
				end
			}
		} )
		ticket:RegisterAnimationSequence( "NoCostCenteredButton", {
			{
				function ()
					return self.ticket:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.NoCostCenteredButton = function ()
			Backing:AnimateLoop( "NoCostCenteredButton" )
			Cost:AnimateLoop( "NoCostCenteredButton" )
			Spinner:AnimateLoop( "NoCostCenteredButton" )
			Button:AnimateLoop( "NoCostCenteredButton" )
			ticket:AnimateLoop( "NoCostCenteredButton" )
		end
		
		Backing:RegisterAnimationSequence( "TurnOffEverything", {
			{
				function ()
					return self.Backing:SetAlpha( 0, 0 )
				end
			}
		} )
		Cost:RegisterAnimationSequence( "TurnOffEverything", {
			{
				function ()
					return self.Cost:SetAlpha( 0, 0 )
				end
			}
		} )
		Spinner:RegisterAnimationSequence( "TurnOffEverything", {
			{
				function ()
					return self.Spinner:SetAlpha( 0, 0 )
				end
			}
		} )
		Button:RegisterAnimationSequence( "TurnOffEverything", {
			{
				function ()
					return self.Button:SetAlpha( 0, 0 )
				end
			}
		} )
		ticket:RegisterAnimationSequence( "TurnOffEverything", {
			{
				function ()
					return self.ticket:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.TurnOffEverything = function ()
			Backing:AnimateSequence( "TurnOffEverything" )
			Cost:AnimateSequence( "TurnOffEverything" )
			Spinner:AnimateSequence( "TurnOffEverything" )
			Button:AnimateSequence( "TurnOffEverything" )
			ticket:AnimateSequence( "TurnOffEverything" )
		end
		
		Backing:RegisterAnimationSequence( "turnOnCostAndButton", {
			{
				function ()
					return self.Backing:SetAlpha( 1, 0 )
				end
			}
		} )
		Cost:RegisterAnimationSequence( "turnOnCostAndButton", {
			{
				function ()
					return self.Cost:SetAlpha( 1, 0 )
				end
			}
		} )
		Spinner:RegisterAnimationSequence( "turnOnCostAndButton", {
			{
				function ()
					return self.Spinner:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.Spinner:SetZRotation( 0, 0 )
				end,
				function ()
					return self.Spinner:SetZRotation( 360, 6000 )
				end
			},
			{
				function ()
					return self.Spinner:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -75, _1080p * -11, _1080p * -32, _1080p * 32, 0 )
				end
			}
		} )
		Button:RegisterAnimationSequence( "turnOnCostAndButton", {
			{
				function ()
					return self.Button:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.Button:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -75, _1080p * -11, _1080p * -32, _1080p * 32, 0 )
				end
			}
		} )
		ticket:RegisterAnimationSequence( "turnOnCostAndButton", {
			{
				function ()
					return self.ticket:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.turnOnCostAndButton = function ()
			Backing:AnimateLoop( "turnOnCostAndButton" )
			Cost:AnimateLoop( "turnOnCostAndButton" )
			Spinner:AnimateLoop( "turnOnCostAndButton" )
			Button:AnimateLoop( "turnOnCostAndButton" )
			ticket:AnimateLoop( "turnOnCostAndButton" )
		end
		
		Backing:RegisterAnimationSequence( "turnOnTicket", {
			{
				function ()
					return self.Backing:SetAlpha( 0, 0 )
				end
			}
		} )
		Cost:RegisterAnimationSequence( "turnOnTicket", {
			{
				function ()
					return self.Cost:SetAlpha( 0, 0 )
				end
			}
		} )
		Spinner:RegisterAnimationSequence( "turnOnTicket", {
			{
				function ()
					return self.Spinner:SetAlpha( 0, 0 )
				end
			}
		} )
		Button:RegisterAnimationSequence( "turnOnTicket", {
			{
				function ()
					return self.Button:SetAlpha( 0, 0 )
				end
			}
		} )
		ticket:RegisterAnimationSequence( "turnOnTicket", {
			{
				function ()
					return self.ticket:SetAlpha( 1, 0 )
				end
			}
		} )
		self._sequences.turnOnTicket = function ()
			Backing:AnimateSequence( "turnOnTicket" )
			Cost:AnimateSequence( "turnOnTicket" )
			Spinner:AnimateSequence( "turnOnTicket" )
			Button:AnimateSequence( "turnOnTicket" )
			ticket:AnimateSequence( "turnOnTicket" )
		end
		
		Cost:RegisterAnimationSequence( "canAfford", {
			{
				function ()
					return self.Cost:SetRGBFromTable( SWATCHES.Zombies.PopUpCanAfford, 0 )
				end
			}
		} )
		self._sequences.canAfford = function ()
			Cost:AnimateSequence( "canAfford" )
		end
		
		Cost:RegisterAnimationSequence( "cantAfford", {
			{
				function ()
					return self.Cost:SetRGBFromTable( SWATCHES.Zombies.PopUpCantAfford, 0 )
				end
			},
			{
				function ()
					return self.Cost:SetAlpha( 1, 0 )
				end
			}
		} )
		self._sequences.cantAfford = function ()
			Cost:AnimateSequence( "cantAfford" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	local f3_local8 = function ()
		if DataSources.inGame.CP.currentPlayerCash:GetValue( f3_local1 ) ~= nil and DataSources.inGame.CP.zombies.interactionNotificationCost:GetValue( f3_local1 ) ~= nil and DataSources.inGame.CP.zombies.interactionNotificationCost:GetValue( f3_local1 ) <= DataSources.inGame.CP.currentPlayerCash:GetValue( f3_local1 ) and DataSources.inGame.CP.zombies.interactionNotificationAlphaFilter:GetValue( f3_local1 ) ~= nil and DataSources.inGame.CP.zombies.interactionNotificationAlphaFilter:GetValue( f3_local1 ) >= 0 then
			ACTIONS.AnimateSequence( self, "canAfford" )
		end
		if DataSources.inGame.CP.currentPlayerCash:GetValue( f3_local1 ) ~= nil and DataSources.inGame.CP.zombies.interactionNotificationCost:GetValue( f3_local1 ) ~= nil and DataSources.inGame.CP.currentPlayerCash:GetValue( f3_local1 ) < DataSources.inGame.CP.zombies.interactionNotificationCost:GetValue( f3_local1 ) and DataSources.inGame.CP.zombies.interactionNotificationAlphaFilter:GetValue( f3_local1 ) ~= nil and DataSources.inGame.CP.zombies.interactionNotificationAlphaFilter:GetValue( f3_local1 ) >= 0 then
			ACTIONS.AnimateSequence( self, "cantAfford" )
		end
	end
	
	Cost:SubscribeToModel( DataSources.inGame.CP.currentPlayerCash:GetModel( f3_local1 ), f3_local8 )
	Cost:SubscribeToModel( DataSources.inGame.CP.zombies.interactionNotificationCost:GetModel( f3_local1 ), f3_local8 )
	Cost:SubscribeToModel( DataSources.inGame.CP.zombies.interactionNotificationAlphaFilter:GetModel( f3_local1 ), f3_local8 )
	self:SubscribeToModel( DataSources.inGame.CP.zombies.interactionNotificationAlphaFilter:GetModel( f3_local1 ), function ()
		ACTIONS.AnimateSequence( self, "NoCostCenteredButton" )
		if DataSources.inGame.CP.zombies.interactionNotificationAlphaFilter:GetValue( f3_local1 ) ~= nil and DataSources.inGame.CP.zombies.interactionNotificationAlphaFilter:GetValue( f3_local1 ) == -1 then
			ACTIONS.AnimateSequence( self, "TurnOffEverything" )
		end
		if DataSources.inGame.CP.zombies.interactionNotificationCost:GetValue( f3_local1 ) ~= nil and DataSources.inGame.CP.zombies.interactionNotificationCost:GetValue( f3_local1 ) >= 1 then
			ACTIONS.AnimateSequence( self, "turnOnCostAndButton" )
		end
		if DataSources.inGame.CP.zombies.interactionNotificationAlphaFilter:GetValue( f3_local1 ) ~= nil and DataSources.inGame.CP.zombies.interactionNotificationAlphaFilter:GetValue( f3_local1 ) == 2 then
			ACTIONS.AnimateSequence( self, "turnOnTicket" )
		end
	end )
	PostLoadFunc( self, f3_local1, controller )
	return self
end

MenuBuilder.registerType( "interactionNotification", interactionNotification )
LockTable( _M )
