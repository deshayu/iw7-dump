local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ( f1_arg0, f1_arg1, f1_arg2 )
	assert( f1_arg0.Field )
	f1_arg0.Field:SetShadowVOffset( -0 )
end

function CodCasterTextField( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 192 * _1080p, 0, 40 * _1080p )
	self.id = "CodCasterTextField"
	local f2_local1 = controller and controller.controllerIndex
	if not f2_local1 and not Engine.InFrontend() then
		f2_local1 = self:getRootController()
	end
	assert( f2_local1 )
	local f2_local2 = self
	local Field = nil
	
	Field = LUI.UIStyledText.new()
	Field.id = "Field"
	Field:setText( "-", 0 )
	Field:SetFontSize( 16 * _1080p )
	Field:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	Field:SetAlignment( LUI.Alignment.Center )
	Field:SetOptOutRightToLeftAlignmentFlip( true )
	Field:SetShadowMinDistance( -0.2, 0 )
	Field:SetShadowMaxDistance( 0.2, 0 )
	Field:SetShadowRGBFromInt( 0, 0 )
	Field:SetAnchorsAndPosition( 0, 0, 0.5, 0.5, _1080p * 9, _1080p * -9, _1080p * -8, _1080p * 8 )
	self:addElement( Field )
	self.Field = Field
	
	f0_local0( self, f2_local1, controller )
	return self
end

MenuBuilder.registerType( "CodCasterTextField", CodCasterTextField )
LockTable( _M )
