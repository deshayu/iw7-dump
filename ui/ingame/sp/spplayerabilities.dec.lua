local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ( f1_arg0, f1_arg1, f1_arg2 )
	assert( f1_arg0.PrimaryAbility and f1_arg0.SecondaryAbility, "WARNING: SP Player Abilities Items Are Missing..." )
	f1_arg0:SetDotPitchEnabled( true )
	f1_arg0:SetDotPitchX( 6, 0 )
	f1_arg0:SetDotPitchY( 3, 0 )
	f1_arg0:SetDotPitchContrast( 0.15, 0 )
	local f1_local0 = f1_arg0.PrimaryAbility
	local f1_local1 = f1_arg0.SecondaryAbility
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

function SPPlayerAbilities( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 400 * _1080p, 0, 115 * _1080p )
	self.id = "SPPlayerAbilities"
	local f4_local1 = controller and controller.controllerIndex
	if not f4_local1 and not Engine.InFrontend() then
		f4_local1 = self:getRootController()
	end
	assert( f4_local1 )
	local f4_local2 = self
	local f4_local3 = nil
	if Engine.IsMultiplayer() and not Engine.IsAliensMode() and CONDITIONS.AlwaysFalse( self ) then
		f4_local3 = MenuBuilder.BuildRegisteredType( "TransponderRangeFinder", {
			controllerIndex = f4_local1
		} )
		f4_local3.id = "TransponderRangeFinder"
		f4_local3:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 401, _1080p * 587, _1080p * -143, _1080p * -98 )
		self:addElement( f4_local3 )
		self.TransponderRangeFinder = f4_local3
	end
	local StoredAbilities = nil
	
	StoredAbilities = MenuBuilder.BuildRegisteredType( "PlayerStoredAbilities", {
		controllerIndex = f4_local1
	} )
	StoredAbilities.id = "StoredAbilities"
	StoredAbilities:SetAlpha( 0.75, 0 )
	StoredAbilities:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -170, _1080p * 170, _1080p * 25, _1080p * 105 )
	self:addElement( StoredAbilities )
	self.StoredAbilities = StoredAbilities
	
	local PrimaryAbility = nil
	
	PrimaryAbility = MenuBuilder.BuildRegisteredType( "SPPlayerAbilitiesPrimary", {
		controllerIndex = f4_local1
	} )
	PrimaryAbility.id = "PrimaryAbility"
	PrimaryAbility:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, 0, _1080p * 70, 0, _1080p * 116 )
	self:addElement( PrimaryAbility )
	self.PrimaryAbility = PrimaryAbility
	
	local SecondaryAbility = nil
	
	SecondaryAbility = MenuBuilder.BuildRegisteredType( "SPPlayerAbilitiesSecondary", {
		controllerIndex = f4_local1
	} )
	SecondaryAbility.id = "SecondaryAbility"
	SecondaryAbility:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -70, 0, 0, _1080p * 116 )
	self:addElement( SecondaryAbility )
	self.SecondaryAbility = SecondaryAbility
	
	f0_local0( self, f4_local1, controller )
	return self
end

MenuBuilder.registerType( "SPPlayerAbilities", SPPlayerAbilities )
LockTable( _M )
