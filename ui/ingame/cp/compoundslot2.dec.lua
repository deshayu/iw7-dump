local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function PostLoadFunc( f1_arg0, f1_arg1 )
	f1_arg0:SetupInWorldElement( {} )
	f1_arg0:SetInWorldScale( 0.05 )
	local f1_local0 = function ( f2_arg0, f2_arg1 )
		f2_arg0:SetEntityNum( Game.GetOmnvar( "zm_chem_compound_slot_2_ent" ) )
		f2_arg0:SetEntityTag( "tag_origin" )
		f2_arg0:SetFollowTagAngles( true )
		f2_arg0:SetTagSpacePosition( 0, 0, 1 )
		f2_arg0:SetTagSpaceYaw( 0 )
		f2_arg0:SetTagSpaceRoll( -90 )
	end
	
	f1_arg0:registerOmnvarHandler( "zm_chem_compound_slot_2_ent", f1_local0 )
	f1_local0( f1_arg0, {} )
	f1_arg0.compoundName:SetGlitchEnabled( true )
	f1_arg0.compoundName:SetGlitchEnabled( false )
end

function compoundSlot2( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 400 * _1080p, 0, 400 * _1080p )
	self.id = "compoundSlot2"
	local f3_local1 = controller and controller.controllerIndex
	if not f3_local1 and not Engine.InFrontend() then
		f3_local1 = self:getRootController()
	end
	assert( f3_local1 )
	local f3_local2 = self
	local compoundName = nil
	
	compoundName = LUI.UIText.new()
	compoundName.id = "compoundName"
	compoundName:SetScale( 1.24, 0 )
	compoundName:SetFontSize( 26 * _1080p )
	compoundName:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	compoundName:SetAlignment( LUI.Alignment.Center )
	compoundName:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 114.88, _1080p * 290.88, _1080p * 187, _1080p * 213 )
	compoundName:BindAlphaToModel( DataSources.inGame.CP.zombies.dlc3.compoundSlot2AlphaFilter:GetModel( f3_local1 ) )
	compoundName:SubscribeToModel( DataSources.inGame.CP.zombies.dlc3.compoundSlot2NameFilter:GetModel( f3_local1 ), function ()
		local f4_local0 = DataSources.inGame.CP.zombies.dlc3.compoundSlot2NameFilter:GetValue( f3_local1 )
		if f4_local0 ~= nil then
			compoundName:setText( f4_local0, 0 )
		end
	end )
	self:addElement( compoundName )
	self.compoundName = compoundName
	
	PostLoadFunc( self, f3_local1, controller )
	return self
end

MenuBuilder.registerType( "compoundSlot2", compoundSlot2 )
LockTable( _M )
