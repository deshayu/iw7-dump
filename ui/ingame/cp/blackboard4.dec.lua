local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function PostLoadFunc( f1_arg0, f1_arg1 )
	f1_arg0:SetupInWorldElement( {} )
	f1_arg0:SetInWorldScale( 0.1 )
	local f1_local0 = function ( f2_arg0, f2_arg1 )
		f2_arg0:SetEntityNum( Game.GetOmnvar( "zm_ui_blackboard_4_ent" ) )
		f2_arg0:SetEntityTag( "equipment_whiteboard_stand" )
		f2_arg0:SetFollowTagAngles( true )
		f2_arg0:SetTagSpacePosition( 4, -38.55, 14.5 )
		f2_arg0:SetTagSpaceYaw( -82.7 )
		f2_arg0:SetTagSpaceRoll( 0 )
	end
	
	f1_arg0:registerOmnvarHandler( "zm_ui_blackboard_4_ent", f1_local0 )
	f1_local0( f1_arg0, {} )
end

function blackboard4( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 759 * _1080p, 0, 561 * _1080p )
	self.id = "blackboard4"
	local f3_local1 = controller and controller.controllerIndex
	if not f3_local1 and not Engine.InFrontend() then
		f3_local1 = self:getRootController()
	end
	assert( f3_local1 )
	local f3_local2 = self
	local box = nil
	
	box = LUI.UIImage.new()
	box.id = "box"
	box:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 759, 0, _1080p * 561 )
	self:addElement( box )
	self.box = box
	
	local icon = nil
	
	icon = LUI.UIImage.new()
	icon.id = "icon"
	icon:setImage( RegisterMaterial( "cp_town_inv_punchcard" ), 0 )
	icon:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 759, 0, _1080p * 561 )
	self:addElement( icon )
	self.icon = icon
	
	PostLoadFunc( self, f3_local1, controller )
	return self
end

MenuBuilder.registerType( "blackboard4", blackboard4 )
LockTable( _M )
