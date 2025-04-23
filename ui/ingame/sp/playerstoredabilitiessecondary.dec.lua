local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ( f1_arg0, f1_arg1, f1_arg2 )
	assert( f1_arg0.ToggleKeyHint )
	local f1_local0 = DataSources.inGame.player.secondaryStoredPower.reference
	local f1_local1 = function ()
		if f1_local0:GetValue( f1_arg1 ) == Cac.powerNoneValue or Engine.IsConsoleGame() or Engine.GetProfileData( "gpadEnabled" ) then
			f1_arg0.ToggleKeyHint:SetAlpha( 0 )
		else
			f1_arg0.ToggleKeyHint:setText( Engine.GetKeyBindingLocalizedString( f1_arg1, "+actionslot 3", true ) )
			f1_arg0.ToggleKeyHint:SetAlpha( 1 )
		end
	end
	
	f1_arg0:registerEventHandler( "empty_menu_stack", f1_local1 )
	f1_arg0:SubscribeToModel( f1_local0:GetModel( f1_arg1 ), f1_local1 )
	assert( f1_arg0.Quantity and f1_arg0.SecondaryAbility, "WARNING: Player Stored Abilities Secondary Items Are Missing..." )
	f1_arg0.Quantity:SetShadowUOffset( -0 )
	f1_arg0.Quantity:SetShadowVOffset( -0 )
	local f1_local2 = DataSources.inGame.player.secondaryStoredPower.rechargeProgress
	local f1_local3 = DataSources.inGame.player.secondaryStoredPower.type
	local f1_local4 = DataSources.inGame.player.secondaryStoredPower.numCharges
	local f1_local5 = DataSources.inGame.player.secondaryStoredPower.id
	local f1_local6 = DataSources.inGame.player.secondaryStoredPower.reference
	local f1_local7 = DataSources.inGame.player.secondaryStoredPower.numAlpha
	local f1_local8 = DataSources.inGame.SP.secondaryStoredEquipmentShow
	f1_arg0:SubscribeToModel( f1_local4:GetModel( f1_arg1 ), function ()
		f1_arg0.Quantity:setText( f1_local4:GetValue( f1_arg1 ), 0 )
		ACTIONS.AnimateSequence( f1_arg0, "UpdateCount" )
	end )
	f1_arg0:SubscribeToModel( f1_local2:GetModel( f1_arg1 ), function ()
		local f4_local0 = f1_local2:GetValue( f1_arg1 )
		local f4_local1 = f1_local3:GetValue( f1_arg1 )
		if f4_local0 >= 1000 and f4_local1 == "drain" then
			ACTIONS.AnimateSequenceByElement( f1_arg0, {
				elementName = "SecondaryAbility",
				sequenceName = "StoredAvailable",
				elementPath = "SecondaryAbility"
			} )
			ACTIONS.AnimateSequenceByElement( f1_arg0, {
				elementName = "SecondaryAbility",
				sequenceName = "UpdateAbility",
				elementPath = ""
			} )
		end
		if f4_local0 < 1000 and f4_local0 > 0 and f4_local1 == "drain" then
			ACTIONS.AnimateSequenceByElement( f1_arg0, {
				elementName = "SecondaryAbility",
				sequenceName = "AbilityInUse",
				elementPath = ""
			} )
		end
	end )
	f1_arg0:SubscribeToModel( f1_local5:GetModel( f1_arg1 ), function ()
		local f5_local0 = f1_local5:GetValue( f1_arg1 )
		local f5_local1 = f1_local4:GetValue( f1_arg1 )
		local f5_local2 = f1_local3:GetValue( f1_arg1 )
		local f5_local3 = f1_local6:GetValue( f1_arg1 )
		if f5_local1 > 0 and f5_local2 == "charges" then
			ACTIONS.AnimateSequenceByElement( f1_arg0, {
				elementName = "SecondaryAbility",
				sequenceName = "StoredAvailable",
				elementPath = "SecondaryAbility"
			} )
			ACTIONS.AnimateSequenceByElement( f1_arg0, {
				elementName = "SecondaryAbility",
				sequenceName = "UpdateAbility",
				elementPath = ""
			} )
		end
		if f5_local1 <= 0 and f5_local2 == "charges" and not f5_local3 == "none" then
			ACTIONS.AnimateSequenceByElement( f1_arg0, {
				elementName = "SecondaryAbility",
				sequenceName = "StoredUnavailable",
				elementPath = "SecondaryAbility"
			} )
		end
	end )
	f1_arg0:SubscribeToModel( f1_local8:GetModel( f1_arg1 ), function ()
		f1_arg0.SecondaryAbility:SetAlpha( f1_local8:GetValue( f1_arg1 ), 0 )
	end )
	f1_arg0:SubscribeToModel( f1_local7:GetModel( f1_arg1 ), function ()
		f1_arg0.Quantity:SetAlpha( f1_local7:GetValue( f1_arg1 ), 0 )
	end )
end

function PlayerStoredAbilitiesSecondary( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 80 * _1080p, 0, 80 * _1080p )
	self.id = "PlayerStoredAbilitiesSecondary"
	self._animationSets = {}
	self._sequences = {}
	local f8_local1 = controller and controller.controllerIndex
	if not f8_local1 and not Engine.InFrontend() then
		f8_local1 = self:getRootController()
	end
	assert( f8_local1 )
	local f8_local2 = self
	local SecondaryAbility = nil
	
	SecondaryAbility = MenuBuilder.BuildRegisteredType( "PlayerAbilityBase", {
		controllerIndex = f8_local1
	} )
	SecondaryAbility.id = "SecondaryAbility"
	SecondaryAbility:SetAlpha( Subtract( 1, 0.2 ), 0 )
	SecondaryAbility:SetScale( -0.4, 0 )
	SecondaryAbility:SetDataSource( DataSources.inGame.player.secondaryStoredPower, f8_local1 )
	SecondaryAbility:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -50, _1080p * 50, _1080p * -50, _1080p * 50 )
	self:addElement( SecondaryAbility )
	self.SecondaryAbility = SecondaryAbility
	
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
	Quantity:BindColorToModel( DataSources.inGame.player.secondaryStoredPower.color:GetModel( f8_local1 ) )
	self:addElement( Quantity )
	self.Quantity = Quantity
	
	local ToggleKeyHint = nil
	
	ToggleKeyHint = LUI.UIStyledText.new()
	ToggleKeyHint.id = "ToggleKeyHint"
	ToggleKeyHint:setText( "", 0 )
	ToggleKeyHint:SetFontSize( 16 * _1080p )
	ToggleKeyHint:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	ToggleKeyHint:SetAlignment( LUI.Alignment.Right )
	ToggleKeyHint:SetShadowMinDistance( -0.01, 0 )
	ToggleKeyHint:SetShadowMaxDistance( 0.01, 0 )
	ToggleKeyHint:SetShadowRGBFromInt( 0, 0 )
	ToggleKeyHint:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -240, _1080p * -30, _1080p * -7, _1080p * 9 )
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
	SecondaryAbility:SetDataSource( DataSources.inGame.player.secondaryStoredPower, f8_local1 )
	f0_local0( self, f8_local1, controller )
	return self
end

MenuBuilder.registerType( "PlayerStoredAbilitiesSecondary", PlayerStoredAbilitiesSecondary )
LockTable( _M )
