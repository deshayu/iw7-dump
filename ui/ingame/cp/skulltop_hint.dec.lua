local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function PostLoadFunc( f1_arg0, f1_arg1 )
	f1_arg0:SetupInWorldElement( {} )
	f1_arg0:SetInWorldScale( 0.05 )
	local f1_local0 = function ( f2_arg0, f2_arg1 )
		f2_arg0:SetEntityNum( Game.GetOmnvar( "zm_ui_skull_top_ent" ) )
		f2_arg0:SetEntityTag( "tag_origin" )
		f2_arg0:SetFollowTagAngles( true )
		f2_arg0:SetTagSpacePosition( 0, 0, 0 )
		f2_arg0:SetTagSpaceYaw( 0 )
		f2_arg0:SetTagSpaceRoll( 270 )
	end
	
	f1_arg0:registerOmnvarHandler( "zm_ui_skull_top_ent", f1_local0 )
	f1_local0( f1_arg0, {} )
	f1_arg0.texthint:SetGlitchEnabled( true )
	f1_arg0.texthint:SetGlitchEnabled( false )
end

function skulltop_hint( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 400 * _1080p, 0, 400 * _1080p )
	self.id = "skulltop_hint"
	local f3_local1 = controller and controller.controllerIndex
	if not f3_local1 and not Engine.InFrontend() then
		f3_local1 = self:getRootController()
	end
	assert( f3_local1 )
	local f3_local2 = self
	local texthint = nil
	
	texthint = LUI.UIText.new()
	texthint.id = "texthint"
	texthint:SetFontSize( 45 * _1080p )
	texthint:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	texthint:SetAlignment( LUI.Alignment.Left )
	texthint:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 402, 0, _1080p * 45 )
	texthint:SubscribeToModel( DataSources.inGame.CP.zombies.dlc3.skull_cipher_hint_omnvar_string:GetModel( f3_local1 ), function ()
		local f4_local0 = DataSources.inGame.CP.zombies.dlc3.skull_cipher_hint_omnvar_string:GetValue( f3_local1 )
		if f4_local0 ~= nil then
			texthint:setText( LocalizeString( f4_local0 ), 0 )
		end
	end )
	self:addElement( texthint )
	self.texthint = texthint
	
	PostLoadFunc( self, f3_local1, controller )
	return self
end

MenuBuilder.registerType( "skulltop_hint", skulltop_hint )
LockTable( _M )
