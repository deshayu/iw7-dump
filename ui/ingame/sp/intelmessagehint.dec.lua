local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function IntelMessageHint( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 235 * _1080p, 0, 32 * _1080p )
	self.id = "IntelMessageHint"
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local InstructionTextPt1 = nil
	
	InstructionTextPt1 = LUI.UIStyledText.new()
	InstructionTextPt1.id = "InstructionTextPt1"
	InstructionTextPt1:setText( Engine.Localize( "FLUFF_MESSAGES_SET_WAYPOINT" ), 0 )
	InstructionTextPt1:SetFontSize( 18 * _1080p )
	InstructionTextPt1:SetFont( FONTS.GetFont( FONTS.MainExtended.File ) )
	InstructionTextPt1:SetAlignment( LUI.Alignment.Left )
	InstructionTextPt1:SetDecodeLetterLength( 25 )
	InstructionTextPt1:SetDecodeMaxRandChars( 3 )
	InstructionTextPt1:SetDecodeUpdatesPerLetter( 4 )
	InstructionTextPt1:SetAnchorsAndPosition( 0, 0, 1, 0, _1080p * 6, 0, _1080p * -25, _1080p * -7 )
	self:addElement( InstructionTextPt1 )
	self.InstructionTextPt1 = InstructionTextPt1
	
	return self
end

MenuBuilder.registerType( "IntelMessageHint", IntelMessageHint )
LockTable( _M )
