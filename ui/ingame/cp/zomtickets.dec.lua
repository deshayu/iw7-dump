local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function ZomTickets( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 117 * _1080p, 0, 46 * _1080p )
	self.id = "ZomTickets"
	self._animationSets = {}
	self._sequences = {}
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local BackingBox = nil
	
	BackingBox = LUI.UIImage.new()
	BackingBox.id = "BackingBox"
	BackingBox:SetAlpha( 0.5, 0 )
	BackingBox:setImage( RegisterMaterial( "zm_pc_score_bg" ), 0 )
	BackingBox:SetUseAA( true )
	BackingBox:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 22.5, _1080p * 112.36, _1080p * 13.56, _1080p * 39.56 )
	self:addElement( BackingBox )
	self.BackingBox = BackingBox
	
	local TicketNumber = nil
	
	TicketNumber = LUI.UIText.new()
	TicketNumber.id = "TicketNumber"
	TicketNumber:SetRGBFromInt( 16250871, 0 )
	TicketNumber:SetFontSize( 24 * _1080p )
	TicketNumber:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	TicketNumber:SetAlignment( LUI.Alignment.Left )
	TicketNumber:SetOptOutRightToLeftAlignmentFlip( true )
	TicketNumber:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 68, _1080p * 512.73, _1080p * 14, _1080p * 38 )
	TicketNumber:SubscribeToModel( DataSources.inGame.CP.zombies.numberOfTicket:GetModel( f1_local1 ), function ()
		local f2_local0 = DataSources.inGame.CP.zombies.numberOfTicket:GetValue( f1_local1 )
		if f2_local0 ~= nil then
			TicketNumber:setText( f2_local0, 0 )
		end
	end )
	self:addElement( TicketNumber )
	self.TicketNumber = TicketNumber
	
	local Ticket = nil
	
	Ticket = LUI.UIImage.new()
	Ticket.id = "Ticket"
	Ticket:SetZRotation( 5, 0 )
	Ticket:SetScale( -0.33, 0 )
	Ticket:setImage( RegisterMaterial( "cp_zmb_ticket_small" ), 0 )
	Ticket:SetUseAA( true )
	Ticket:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -31.27, _1080p * 96.73, _1080p * -9, _1080p * 55 )
	self:addElement( Ticket )
	self.Ticket = Ticket
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		Ticket:RegisterAnimationSequence( "AddedTickets", {
			{
				function ()
					return self.Ticket:SetScale( -0.25, 0 )
				end,
				function ()
					return self.Ticket:SetScale( 0, 250 )
				end,
				function ()
					return self.Ticket:SetScale( -0.25, 250 )
				end,
				function ()
					return self.Ticket:SetScale( 0, 250 )
				end,
				function ()
					return self.Ticket:SetScale( -0.25, 250 )
				end,
				function ()
					return self.Ticket:SetScale( 0, 250 )
				end,
				function ()
					return self.Ticket:SetScale( -0.25, 250 )
				end
			}
		} )
		self._sequences.AddedTickets = function ()
			Ticket:AnimateSequence( "AddedTickets" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	Ticket:SubscribeToModel( DataSources.inGame.CP.zombies.numberOfTicket:GetModel( f1_local1 ), function ()
		if DataSources.inGame.CP.zombies.numberOfTicket:GetValue( f1_local1 ) ~= nil and DataSources.inGame.CP.zombies.numberOfTicket:GetValue( f1_local1 ) > 0 then
			ACTIONS.AnimateSequence( self, "AddedTickets" )
		end
	end )
	return self
end

MenuBuilder.registerType( "ZomTickets", ZomTickets )
LockTable( _M )
