local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function zomTicketStrip( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 69 * _1080p, 0, 643 * _1080p )
	self.id = "zomTicketStrip"
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local Ticket = nil
	
	Ticket = LUI.UIImage.new()
	Ticket.id = "Ticket"
	Ticket:setImage( RegisterMaterial( "cp_zmb_ticket" ), 0 )
	Ticket:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 2, _1080p * 65, _1080p * 512, _1080p * 640 )
	self:addElement( Ticket )
	self.Ticket = Ticket
	
	local TicketCopy0 = nil
	
	TicketCopy0 = LUI.UIImage.new()
	TicketCopy0.id = "TicketCopy0"
	TicketCopy0:setImage( RegisterMaterial( "cp_zmb_ticket" ), 0 )
	TicketCopy0:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 2, _1080p * 65, _1080p * 384, _1080p * 512 )
	self:addElement( TicketCopy0 )
	self.TicketCopy0 = TicketCopy0
	
	local TicketCopy1 = nil
	
	TicketCopy1 = LUI.UIImage.new()
	TicketCopy1.id = "TicketCopy1"
	TicketCopy1:setImage( RegisterMaterial( "cp_zmb_ticket" ), 0 )
	TicketCopy1:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 2, _1080p * 65, _1080p * 256, _1080p * 384 )
	self:addElement( TicketCopy1 )
	self.TicketCopy1 = TicketCopy1
	
	local TicketCopy2 = nil
	
	TicketCopy2 = LUI.UIImage.new()
	TicketCopy2.id = "TicketCopy2"
	TicketCopy2:setImage( RegisterMaterial( "cp_zmb_ticket" ), 0 )
	TicketCopy2:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 2, _1080p * 65, _1080p * 128, _1080p * 256 )
	self:addElement( TicketCopy2 )
	self.TicketCopy2 = TicketCopy2
	
	local TicketCopy3 = nil
	
	TicketCopy3 = LUI.UIImage.new()
	TicketCopy3.id = "TicketCopy3"
	TicketCopy3:setImage( RegisterMaterial( "cp_zmb_ticket" ), 0 )
	TicketCopy3:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 2, _1080p * 65, 0, _1080p * 128 )
	self:addElement( TicketCopy3 )
	self.TicketCopy3 = TicketCopy3
	
	return self
end

MenuBuilder.registerType( "zomTicketStrip", zomTicketStrip )
LockTable( _M )
