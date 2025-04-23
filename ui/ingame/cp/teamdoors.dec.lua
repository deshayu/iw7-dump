local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function CreateDoor( f1_arg0, f1_arg1 )
	local f1_local0 = MenuBuilder.BuildRegisteredType( "TeamDoor" )
	f1_local0:SetDataSource( f1_arg0, f1_arg1 )
	f1_local0:SetupInWorldElement( {} )
	f1_local0:SetInWorldScale( 0.18 )
	f1_local0:SetWorldSpacePitch( 0 )
	f1_local0:SetWorldSpaceRoll( 0 )
	return f1_local0
end

function CreateDoorFrontAndBack( f2_arg0, f2_arg1, f2_arg2, f2_arg3, f2_arg4, f2_arg5, f2_arg6, f2_arg7, f2_arg8, f2_arg9 )
	f2_arg0:SubscribeToModel( f2_arg2.visible:GetModel( f2_arg1 ), function ( f3_arg0 )
		if not DataModel.GetModelValue( f3_arg0 ) then
			if f2_arg0[f2_arg3 .. "front"] then
				f2_arg0[f2_arg3 .. "front"].closeTree( REG2[f2_arg3 .. "front"] )
				f2_arg0[f2_arg3 .. "front"] = nil
			end
		elseif not f2_arg0[f2_arg3 .. "front"] then
			f2_arg0[f2_arg3 .. "front"] = CreateDoor( f2_arg2, f2_arg1 )
			f2_arg0[f2_arg3 .. "front"].id = f2_arg3 .. "front"
			f2_arg0[f2_arg3 .. "front"]:SetWorldSpacePosition( f2_arg4.x, f2_arg4.y, f2_arg4.z )
			f2_arg0[f2_arg3 .. "front"].SetWorldSpaceYaw( REG2[f2_arg3 .. "front"], f2_arg6 )
			f2_arg0[f2_arg3 .. "front"].SetWorldSpaceRoll( REG2[f2_arg3 .. "front"], f2_arg8 )
			f2_arg0:addElement( f2_arg0[f2_arg3 .. "front"] )
		end
	end )
	f2_arg0:SubscribeToModel( f2_arg2.backVisible:GetModel( f2_arg1 ), function ( f4_arg0 )
		if not DataModel.GetModelValue( f4_arg0 ) then
			if f2_arg0[f2_arg3 .. "back"] then
				f2_arg0[f2_arg3 .. "back"].closeTree( REG2[f2_arg3 .. "back"] )
				f2_arg0[f2_arg3 .. "back"] = nil
			end
		elseif not f2_arg0[f2_arg3 .. "back"] then
			f2_arg0[f2_arg3 .. "back"] = CreateDoor( f2_arg2, f2_arg1 )
			f2_arg0[f2_arg3 .. "back"].id = f2_arg3 .. "back"
			f2_arg0[f2_arg3 .. "back"]:SetWorldSpacePosition( f2_arg5.x, f2_arg5.y, f2_arg5.z )
			f2_arg0[f2_arg3 .. "back"].SetWorldSpaceYaw( REG2[f2_arg3 .. "back"], f2_arg7 )
			f2_arg0[f2_arg3 .. "back"].SetWorldSpaceRoll( REG2[f2_arg3 .. "back"], f2_arg9 )
			f2_arg0:addElement( f2_arg0[f2_arg3 .. "back"] )
		end
	end )
end

function TeamDoors()
	local self = LUI.UIElement.new( {
		topAnchor = true,
		bottomAnchor = false,
		leftAnchor = true,
		rightAnchor = false,
		top = 0,
		bottom = 0,
		left = 0,
		right = 0
	} )
	self.id = "TeamDoors"
	local f5_local1 = self:getRootController()
	CreateDoorFrontAndBack( self, f5_local1, DataSources.inGame.CP.zombies.teamDoors.kepler, "kepler", {
		x = -42,
		y = 664,
		z = 58
	}, {
		x = -108,
		y = 657,
		z = 58
	}, 90, -90, 0, 0 )
	CreateDoorFrontAndBack( self, f5_local1, DataSources.inGame.CP.zombies.teamDoors.moon, "moon", {
		x = 1295.5,
		y = 660,
		z = 58
	}, {
		x = 1362,
		y = 664,
		z = 58
	}, -90, 90, 0, 0 )
	CreateDoorFrontAndBack( self, f5_local1, DataSources.inGame.CP.zombies.teamDoors.triton, "triton", {
		x = 512,
		y = -1263,
		z = 106
	}, {
		x = 481,
		y = -1344,
		z = 106
	}, 125, -56, 0, 0 )
	return self
end

MenuBuilder.registerType( "TeamDoors", TeamDoors )
LockTable( _M )
