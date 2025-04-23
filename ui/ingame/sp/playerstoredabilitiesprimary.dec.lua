local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ( f1_arg0, f1_arg1, f1_arg2 )
	assert( f1_arg0.ToggleKeyHint )
	local f1_local0 = DataSources.inGame.player.primaryStoredPower.reference
	local f1_local1 = function ()
		if f1_local0:GetValue( f1_arg1 ) == Cac.powerNoneValue or Engine.IsConsoleGame() or Engine.GetProfileData( "gpadEnabled" ) then
			f1_arg0.ToggleKeyHint:SetAlpha( 0 )
		else
			f1_arg0.ToggleKeyHint:setText( Engine.GetKeyBindingLocalizedString( f1_arg1, "+actionslot 4", true ) )
			f1_arg0.ToggleKeyHint:SetAlpha( 1 )
		end
	end
	
	f1_arg0:registerEventHandler( "empty_menu_stack", f1_local1 )
	f1_arg0:SubscribeToModel( f1_local0:GetModel( f1_arg1 ), f1_local1 )
	assert( f1_arg0.Quantity, "WARNING: Player Stored Abilities Primary Items Are Missing..." )
	f1_arg0.Quantity:SetShadowUOffset( -0 )
	f1_arg0.Quantity:SetShadowVOffset( -0 )
	local f1_local2 = DataSources.inGame.player.primaryStoredPower.numCharges
	local f1_local3 = DataSources.inGame.player.primaryStoredPower.rechargeProgress
	local f1_local4 = DataSources.inGame.player.primaryStoredPower.type
	local f1_local5 = DataSources.inGame.player.primaryStoredPower.reference
	local f1_local6 = DataSources.inGame.player.primaryStoredPower.powerDisabled
	f1_arg0:SubscribeToModel( f1_local2:GetModel( f1_arg1 ), function ()
		local f3_local0 = f1_local2:GetValue( f1_arg1 )
		local f3_local1 = f1_local4:GetValue( f1_arg1 )
		local f3_local2 = f1_local5:GetValue( f1_arg1 )
		f1_arg0.Quantity:setText( f3_local0, 0 )
		ACTIONS.AnimateSequence( f1_arg0, "UpdateCount" )
		if f3_local0 > 0 and f3_local1 == "charges" then
			ACTIONS.AnimateSequenceByElement( f1_arg0, {
				elementName = "PrimaryAbility",
				sequenceName = "StoredAvailable",
				elementPath = "PrimaryAbility"
			} )
			ACTIONS.AnimateSequenceByElement( f1_arg0, {
				elementName = "PrimaryAbility",
				sequenceName = "UpdateAbility",
				elementPath = ""
			} )
		end
		if f3_local1 == "charges" and f3_local0 <= 0 and not f3_local2 == "none" then
			ACTIONS.AnimateSequenceByElement( f1_arg0, {
				elementName = "PrimaryAbility",
				sequenceName = "StoredUnavailable",
				elementPath = "PrimaryAbility"
			} )
		end
	end )
	f1_arg0:SubscribeToModel( f1_local3:GetModel( f1_arg1 ), function ()
		local f4_local0 = f1_local3:GetValue( f1_arg1 )
		local f4_local1 = f1_local4:GetValue( f1_arg1 )
		local f4_local2 = f1_local5:GetValue( f1_arg1 )
		local f4_local3 = f1_local6:GetValue( f1_arg1 )
		if f4_local0 >= 1000 and f4_local1 == "drain" then
			ACTIONS.AnimateSequenceByElement( f1_arg0, {
				elementName = "PrimaryAbility",
				sequenceName = "StoredAvailable",
				elementPath = "PrimaryAbility"
			} )
			ACTIONS.AnimateSequenceByElement( f1_arg0, {
				elementName = "PrimaryAbility",
				sequenceName = "UpdateAbility",
				elementPath = ""
			} )
		end
		if f4_local0 < 1000 and f4_local0 > 0 and f4_local1 == "drain" then
			ACTIONS.AnimateSequenceByElement( f1_arg0, {
				elementName = "PrimaryAbility",
				sequenceName = "AbilityInUse",
				elementPath = ""
			} )
		end
		if not (f4_local0 ~= 0 or f4_local1 ~= "drain" or not f4_local2 ~= "none") or f4_local3 then
			ACTIONS.AnimateSequenceByElement( f1_arg0, {
				elementName = "PrimaryAbility",
				sequenceName = "StoredUnavailable",
				elementPath = "PrimaryAbility"
			} )
		end
	end )
end

function PlayerStoredAbilitiesPrimary( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 80 * _1080p, 0, 80 * _1080p )
	self.id = "PlayerStoredAbilitiesPrimary"
	self._animationSets = {}
	self._sequences = {}
	local f5_local1 = controller and controller.controllerIndex
	if not f5_local1 and not Engine.InFrontend() then
		f5_local1 = self:getRootController()
	end
	assert( f5_local1 )
	local f5_local2 = self
	local PrimaryAbility = nil
	
	PrimaryAbility = MenuBuilder.BuildRegisteredType( "PlayerAbilityBase", {
		controllerIndex = f5_local1
	} )
	PrimaryAbility.id = "PrimaryAbility"
	PrimaryAbility:SetScale( -0.4, 0 )
	PrimaryAbility:SetDataSource( DataSources.inGame.player.primaryStoredPower, f5_local1 )
	PrimaryAbility:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -50, _1080p * 50, _1080p * -50, _1080p * 50 )
	PrimaryAbility:SubscribeToModel( DataSources.inGame.SP.storedEquipmentShow:GetModel( f5_local1 ), function ()
		local f6_local0 = DataSources.inGame.SP.storedEquipmentShow:GetValue( f5_local1 )
		if f6_local0 ~= nil then
			PrimaryAbility:SetAlpha( Subtract( f6_local0, 0.2 ), 0 )
		end
	end )
	self:addElement( PrimaryAbility )
	self.PrimaryAbility = PrimaryAbility
	
	local Quantity = nil
	
	Quantity = LUI.UIStyledText.new()
	Quantity.id = "Quantity"
	Quantity:setText( "", 0 )
	Quantity:SetFontSize( 16 * _1080p )
	Quantity:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	Quantity:SetAlignment( LUI.Alignment.Center )
	Quantity:SetShadowMinDistance( -0.01, 0 )
	Quantity:SetShadowMaxDistance( 0.01, 0 )
	Quantity:SetShadowRGBFromInt( 0, 0 )
	Quantity:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, 0, _1080p * 16 )
	Quantity:BindColorToModel( DataSources.inGame.player.primaryStoredPower.color:GetModel( f5_local1 ) )
	Quantity:BindAlphaToModel( DataSources.inGame.SP.storedEquipmentShow:GetModel( f5_local1 ) )
	self:addElement( Quantity )
	self.Quantity = Quantity
	
	local ToggleKeyHint = nil
	
	ToggleKeyHint = LUI.UIStyledText.new()
	ToggleKeyHint.id = "ToggleKeyHint"
	ToggleKeyHint:setText( "", 0 )
	ToggleKeyHint:SetFontSize( 16 * _1080p )
	ToggleKeyHint:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	ToggleKeyHint:SetAlignment( LUI.Alignment.Left )
	ToggleKeyHint:SetOptOutRightToLeftAlignmentFlip( true )
	ToggleKeyHint:SetShadowMinDistance( -0.01, 0 )
	ToggleKeyHint:SetShadowMaxDistance( 0.01, 0 )
	ToggleKeyHint:SetShadowRGBFromInt( 0, 0 )
	ToggleKeyHint:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 30, _1080p * 240, _1080p * -7, _1080p * 9 )
	self:addElement( ToggleKeyHint )
	self.ToggleKeyHint = ToggleKeyHint
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		Quantity:RegisterAnimationSequence( "UpdateCount", {
			{
				function ()
					return self.Quantity:SetScale( 1, 0 )
				end,
				function ()
					return self.Quantity:SetScale( 0, 100 )
				end
			}
		} )
		self._sequences.UpdateCount = function ()
			Quantity:AnimateSequence( "UpdateCount" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	PrimaryAbility:SetDataSource( DataSources.inGame.player.primaryStoredPower, f5_local1 )
	f0_local0( self, f5_local1, controller )
	return self
end

MenuBuilder.registerType( "PlayerStoredAbilitiesPrimary", PlayerStoredAbilitiesPrimary )
LockTable( _M )
