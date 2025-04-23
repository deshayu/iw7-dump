local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function EuropaChyronBracket( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 20 * _1080p, 0, 20 * _1080p )
	self.id = "EuropaChyronBracket"
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local TTL = nil
	
	TTL = LUI.UIImage.new()
	TTL.id = "TTL"
	TTL:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 10, _1080p * -2, 0 )
	self:addElement( TTL )
	self.TTL = TTL
	
	local TL = nil
	
	TL = LUI.UIImage.new()
	TL.id = "TL"
	TL:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -2, 0, _1080p * -2, _1080p * 10 )
	self:addElement( TL )
	self.TL = TL
	
	local TTR = nil
	
	TTR = LUI.UIImage.new()
	TTR.id = "TTR"
	TTR:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -10, 0, _1080p * -2, 0 )
	self:addElement( TTR )
	self.TTR = TTR
	
	local TR = nil
	
	TR = LUI.UIImage.new()
	TR.id = "TR"
	TR:SetAnchorsAndPosition( 1, 0, 0, 1, 0, _1080p * 2, _1080p * -2, _1080p * 10 )
	self:addElement( TR )
	self.TR = TR
	
	local BBL = nil
	
	BBL = LUI.UIImage.new()
	BBL.id = "BBL"
	BBL:SetAnchorsAndPosition( 0, 1, 1, 0, 0, _1080p * 10, 0, _1080p * 2 )
	self:addElement( BBL )
	self.BBL = BBL
	
	local BBR = nil
	
	BBR = LUI.UIImage.new()
	BBR.id = "BBR"
	BBR:SetAnchorsAndPosition( 1, 0, 1, 0, _1080p * -10, 0, 0, _1080p * 2 )
	self:addElement( BBR )
	self.BBR = BBR
	
	local BR = nil
	
	BR = LUI.UIImage.new()
	BR.id = "BR"
	BR:SetAnchorsAndPosition( 1, 0, 1, 0, 0, _1080p * 2, _1080p * 2, _1080p * -10 )
	self:addElement( BR )
	self.BR = BR
	
	local BL = nil
	
	BL = LUI.UIImage.new()
	BL.id = "BL"
	BL:SetAnchorsAndPosition( 0, 1, 1, 0, _1080p * -2, 0, _1080p * 2, _1080p * -10 )
	self:addElement( BL )
	self.BL = BL
	
	return self
end

MenuBuilder.registerType( "EuropaChyronBracket", EuropaChyronBracket )
LockTable( _M )
