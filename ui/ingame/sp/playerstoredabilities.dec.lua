local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ( f1_arg0, f1_arg1, f1_arg2 )
	assert( f1_arg0.PrimaryStoredAbility and f1_arg0.SecondaryStoredAbility, "WARNING: Player Stored Abilities Items Are Missing..." )
	local f1_local0 = f1_arg0.PrimaryStoredAbility
	local f1_local1 = f1_arg0.SecondaryStoredAbility
	local f1_local2 = DataSources.inGame.SP.abilityPrimaryVisibility
	local f1_local3 = DataSources.inGame.SP.abilitySecondaryVisibility
	f1_arg0:SubscribeToModel( f1_local2:GetModel( f1_arg1 ), function ()
		local f2_local0 = f1_local2:GetValue( f1_arg1 )
		local f2_local1 = f1_local0
		local f2_local2 = f2_local1
		f2_local1 = f2_local1.SetAlpha
		local f2_local3
		if f2_local0 then
			f2_local3 = 1
			if not f2_local3 then
			
			else
				f2_local1( f2_local2, f2_local3, 0 )
			end
		end
		f2_local3 = 0
	end )
	f1_arg0:SubscribeToModel( f1_local3:GetModel( f1_arg1 ), function ()
		local f3_local0 = f1_local3:GetValue( f1_arg1 )
		local f3_local1 = f1_local1
		local f3_local2 = f3_local1
		f3_local1 = f3_local1.SetAlpha
		local f3_local3
		if f3_local0 then
			f3_local3 = 1
			if not f3_local3 then
			
			else
				f3_local1( f3_local2, f3_local3, 0 )
			end
		end
		f3_local3 = 0
	end )
end

function PlayerStoredAbilities( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 400 * _1080p, 0, 80 * _1080p )
	self.id = "PlayerStoredAbilities"
	local f4_local1 = controller and controller.controllerIndex
	if not f4_local1 and not Engine.InFrontend() then
		f4_local1 = self:getRootController()
	end
	assert( f4_local1 )
	local f4_local2 = self
	local PrimaryStoredAbility = nil
	
	PrimaryStoredAbility = MenuBuilder.BuildRegisteredType( "PlayerStoredAbilitiesPrimary", {
		controllerIndex = f4_local1
	} )
	PrimaryStoredAbility.id = "PrimaryStoredAbility"
	PrimaryStoredAbility:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -80, 0, 0, _1080p * 80 )
	self:addElement( PrimaryStoredAbility )
	self.PrimaryStoredAbility = PrimaryStoredAbility
	
	local SecondaryStoredAbility = nil
	
	SecondaryStoredAbility = MenuBuilder.BuildRegisteredType( "PlayerStoredAbilitiesSecondary", {
		controllerIndex = f4_local1
	} )
	SecondaryStoredAbility.id = "SecondaryStoredAbility"
	SecondaryStoredAbility:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 80, 0, _1080p * 80 )
	self:addElement( SecondaryStoredAbility )
	self.SecondaryStoredAbility = SecondaryStoredAbility
	
	f0_local0( self, f4_local1, controller )
	return self
end

MenuBuilder.registerType( "PlayerStoredAbilities", PlayerStoredAbilities )
LockTable( _M )
