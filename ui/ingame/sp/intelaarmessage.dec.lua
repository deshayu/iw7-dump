local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = {
	"icon_ops_map_reward_attachment",
	"icon_ops_map_reward_perk",
	"icon_ops_map_reward_weapon",
	"icon_ops_map_reward_jackal",
	"icon_ops_map_reward_armory"
}
f0_local1 = 2500
f0_local2 = f0_local1 + 800
local f0_local3 = function ( f1_arg0, f1_arg1, f1_arg2 )
	if #f1_arg1 == 0 then
		return 
	end
	local f1_local0 = f1_arg0.currentUnlockRotation
	if not f1_arg0.currentUnlockRotation then
		f1_local0 = 0
	end
	f1_local0 = f1_local0 + 1
	if #f1_arg1 < f1_local0 then
		f1_local0 = 1
	end
	if #f1_arg1 > 1 then
		ACTIONS.AnimateSequence( f1_arg0, "UnlockRotate" )
		ACTIONS.AnimateSequence( f1_arg0.ItemUnlock, "ItemUnlockRotate" )
	end
	local f1_local1 = f1_arg1[f1_local0]
	f1_arg0.ItemUnlock.UnlockImage:setImage( RegisterMaterial( f0_local0[f1_local0] ), 0 )
	f1_arg0.ItemUnlock.UnlockDesc:setText( Engine.Localize( f1_local1.str, f1_local1.num ) )
	f1_arg0.currentUnlockRotation = f1_local0
	if f1_arg2 then
		f1_arg2.interval = f0_local1
		LUI.UITimer.Reset( f1_arg2 )
	end
end

local f0_local4 = function ( f2_arg0, f2_arg1 )
	ACTIONS.AnimateSequence( f2_arg0, "Shutdown" )
	ACTIONS.AnimateSequence( f2_arg0.MessageBackground, "Shutdown" )
	if f2_arg1 then
		LUI.UITimer.Stop( f2_arg1 )
	end
end

local f0_local5 = function ( f3_arg0, f3_arg1, f3_arg2 )
	f3_arg0:SetDotPitchX( 0 )
	f3_arg0:SetDotPitchY( 0 )
	f3_arg0:SetDotPitchContrast( 0 )
	local f3_local0 = nil
	f3_arg0:SubscribeToModel( DataSources.inGame.SP.showIntelMessage:GetModel( f3_arg1 ), function ()
		local f4_local0 = DataSources.inGame.SP.showIntelMessage:GetValue( f3_arg1 )
		local f4_local1 = DataSources.inGame.SP.SPMessageImageIndex:GetValue( f3_arg1 )
		if f4_local0 == nil then
			f3_arg0:SetAlpha( 0, 0 )
			f0_local4( f3_arg0, f3_local0 )
			return 
		elseif f4_local0 ~= nil and f4_local1 == 21 then
			f3_arg0:SetAlpha( 1, 0 )
			if f4_local0 == false then
				f0_local4( f3_arg0, f3_local0 )
			elseif f4_local0 == true and f4_local1 == 21 then
				ACTIONS.AnimateSequence( f3_arg0, "BootupMissionIntel" )
				assert( f3_arg0.ItemUnlock )
				local f4_local2 = {}
				local f4_local3 = SPSharedUtils.GetNumScannedAttachments( f3_arg1 )
				if f4_local3 > 0 then
					local f4_local4 = "MENU_SP_X_ATTACHMENTS_UNLOCKED"
					if f4_local3 == 1 then
						f4_local4 = "MENU_SP_X_ATTACHMENTS_UNLOCKED_SINGULAR"
					end
					f4_local2[#f4_local2 + 1] = {
						num = f4_local3,
						str = f4_local4
					}
				end
				f4_local3 = SPSharedUtils.GetNumScannedPerks( f3_arg1 )
				if f4_local3 > 0 then
					f4_local2[#f4_local2 + 1] = {
						num = f4_local3,
						str = "MENU_SP_X_PLAYER_PERK_UNLOCKED"
					}
				end
				f4_local3 = SPSharedUtils.GetNumScannedWeapons( f3_arg1 )
				if f4_local3 > 0 then
					local f4_local4 = "MENU_SP_X_WEAPONS_UNLOCKED"
					if f4_local3 == 1 then
						f4_local4 = "MENU_SP_X_WEAPONS_UNLOCKED_SINGULAR"
					end
					f4_local2[#f4_local2 + 1] = {
						num = f4_local3,
						str = f4_local4
					}
				end
				f4_local3 = SPSharedUtils.GetNumScannedJackalDecals( f3_arg1 ) + SPSharedUtils.GetNumScannedJackalWeapons( f3_arg1 ) + SPSharedUtils.GetNumScannedJackelUpgrades( f3_arg1 )
				if f4_local3 > 0 then
					f4_local2[#f4_local2 + 1] = {
						num = f4_local3,
						str = "MENU_SP_X_JACKAL_UNLOCKED"
					}
				end
				f4_local3 = SPSharedUtils.GetNumScannedPowers( f3_arg1 ) + SPSharedUtils.GetNumScannedReticles( f3_arg1 )
				if f4_local3 > 0 then
					local f4_local4 = "MENU_SP_X_ADDITIONAL_UNLOCKED"
					if f4_local3 == 1 then
						f4_local4 = "MENU_SP_X_ADDITIONAL_UNLOCKED_SINGULAR"
					end
					f4_local2[#f4_local2 + 1] = {
						num = f4_local3,
						str = f4_local4
					}
				end
				local f4_local4 = 0
				for f4_local5 = 1, #f4_local2, 1 do
					f4_local4 = f4_local4 + f4_local2[f4_local5].num
				end
				f3_arg0.UnlockTip:setText( Engine.Localize( "MENU_SP_VIEW_UNLOCKED_TIP", f4_local4 ) )
				f0_local3( f3_arg0, f4_local2, nil )
				if f3_local0 then
					f3_arg0:removeElement( f3_local0 )
				end
				f3_local0 = LUI.UITimer.new( nil, {
					interval = f0_local2,
					event = "display_next_unlock",
					disposable = false
				} )
				f3_arg0:addEventHandler( "display_next_unlock", function ( f5_arg0, f5_arg1 )
					f0_local3( f3_arg0, f4_local2, f3_local0 )
				end )
				f3_arg0:addElement( f3_local0 )
			end
		else
			f3_arg0:SetAlpha( 0, 0 )
			f0_local4( f3_arg0, f3_local0 )
			return 
		end
	end )
end

function IntelAARMessage( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 275 * _1080p, 0, 249 * _1080p )
	self.id = "IntelAARMessage"
	self._animationSets = {}
	self._sequences = {}
	local f6_local1 = controller and controller.controllerIndex
	if not f6_local1 and not Engine.InFrontend() then
		f6_local1 = self:getRootController()
	end
	assert( f6_local1 )
	local f6_local2 = self
	local MessageBackground = nil
	
	MessageBackground = MenuBuilder.BuildRegisteredType( "MessageBackground", {
		controllerIndex = f6_local1
	} )
	MessageBackground.id = "MessageBackground"
	MessageBackground:SetAnchorsAndPosition( 0, 1, 0, 0, 0, _1080p * 275, 0, 0 )
	self:addElement( MessageBackground )
	self.MessageBackground = MessageBackground
	
	local IntelHeader = nil
	
	IntelHeader = MenuBuilder.BuildRegisteredType( "IntelMessageHeaderAAR", {
		controllerIndex = f6_local1
	} )
	IntelHeader.id = "IntelHeader"
	IntelHeader:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 10, _1080p * 264, _1080p * 14, _1080p * 44 )
	self:addElement( IntelHeader )
	self.IntelHeader = IntelHeader
	
	local UnlockTip = nil
	
	UnlockTip = LUI.UIStyledText.new()
	UnlockTip.id = "UnlockTip"
	UnlockTip:setText( "Go To Armory To see unlocks", 0 )
	UnlockTip:SetFontSize( 18 * _1080p )
	UnlockTip:SetFont( FONTS.GetFont( FONTS.MainExtended.File ) )
	UnlockTip:SetAlignment( LUI.Alignment.Left )
	UnlockTip:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 11.75, _1080p * 264, _1080p * 160, _1080p * 178 )
	self:addElement( UnlockTip )
	self.UnlockTip = UnlockTip
	
	local ItemUnlock = nil
	
	ItemUnlock = MenuBuilder.BuildRegisteredType( "IntelItemUnlock", {
		controllerIndex = f6_local1
	} )
	ItemUnlock.id = "ItemUnlock"
	ItemUnlock.UnlockImage:setImage( RegisterMaterial( "hud_interaction_prompt_center_equipment" ), 0 )
	ItemUnlock.UnlockDesc:setText( Engine.Localize( "MENU_SP_ITEM_ACHIEVEMENT_UNLOCKED" ), 0 )
	ItemUnlock:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * -3, 0, _1080p * 59.5, _1080p * 139.5 )
	self:addElement( ItemUnlock )
	self.ItemUnlock = ItemUnlock
	
	local UnlocksDismiss = nil
	
	UnlocksDismiss = LUI.UIStyledText.new()
	UnlocksDismiss.id = "UnlocksDismiss"
	UnlocksDismiss:setText( Engine.Localize( "FLUFF_MESSAGES_CLOSE" ), 0 )
	UnlocksDismiss:SetFontSize( 18 * _1080p )
	UnlocksDismiss:SetFont( FONTS.GetFont( FONTS.MainExtended.File ) )
	UnlocksDismiss:SetAlignment( LUI.Alignment.Left )
	UnlocksDismiss:SetAnchorsAndPosition( 1, 0, 1, 0, _1080p * -120, _1080p * -11, _1080p * -36, _1080p * -18 )
	self:addElement( UnlocksDismiss )
	self.UnlocksDismiss = UnlocksDismiss
	
	local Divider = nil
	
	Divider = LUI.UIImage.new()
	Divider.id = "Divider"
	Divider:SetAlpha( 0.5, 0 )
	Divider:setImage( RegisterMaterial( "wdg_gradient_dual" ), 0 )
	Divider:SetUseAA( true )
	Divider:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -275, 0, _1080p * 55, _1080p * 57 )
	self:addElement( Divider )
	self.Divider = Divider
	
	local DividerCopy2 = nil
	
	DividerCopy2 = LUI.UIImage.new()
	DividerCopy2.id = "DividerCopy2"
	DividerCopy2:SetAlpha( 0.5, 0 )
	DividerCopy2:SetZRotation( 180, 0 )
	DividerCopy2:setImage( RegisterMaterial( "wdg_gradient_dual" ), 0 )
	DividerCopy2:SetUseAA( true )
	DividerCopy2:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 275, _1080p * 141.5, _1080p * 143.5 )
	self:addElement( DividerCopy2 )
	self.DividerCopy2 = DividerCopy2
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		IntelHeader:RegisterAnimationSequence( "Default", {
			{
				function ()
					return self.IntelHeader:SetAlpha( 0, 0 )
				end
			}
		} )
		UnlockTip:RegisterAnimationSequence( "Default", {
			{
				function ()
					return self.UnlockTip:SetAlpha( 0, 0 )
				end
			}
		} )
		ItemUnlock:RegisterAnimationSequence( "Default", {
			{
				function ()
					return self.ItemUnlock:SetAlpha( 0, 0 )
				end
			}
		} )
		UnlocksDismiss:RegisterAnimationSequence( "Default", {
			{
				function ()
					return self.UnlocksDismiss:SetAlpha( 0, 0 )
				end
			}
		} )
		Divider:RegisterAnimationSequence( "Default", {
			{
				function ()
					return self.Divider:SetAlpha( 0, 0 )
				end
			}
		} )
		DividerCopy2:RegisterAnimationSequence( "Default", {
			{
				function ()
					return self.DividerCopy2:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.Default = function ()
			IntelHeader:AnimateSequence( "Default" )
			UnlockTip:AnimateSequence( "Default" )
			ItemUnlock:AnimateSequence( "Default" )
			UnlocksDismiss:AnimateSequence( "Default" )
			Divider:AnimateSequence( "Default" )
			DividerCopy2:AnimateSequence( "Default" )
		end
		
		IntelHeader:RegisterAnimationSequence( "Bootup", {
			{
				function ()
					return self.IntelHeader:SetAlpha( 0, 750 )
				end,
				function ()
					return self.IntelHeader:SetAlpha( 1, 50 )
				end
			}
		} )
		UnlockTip:RegisterAnimationSequence( "Bootup", {
			{
				function ()
					return self.UnlockTip:SetAlpha( 0, 750 )
				end,
				function ()
					return self.UnlockTip:SetAlpha( 1, 50 )
				end
			}
		} )
		ItemUnlock:RegisterAnimationSequence( "Bootup", {
			{
				function ()
					return self.ItemUnlock:SetAlpha( 0, 750 )
				end,
				function ()
					return self.ItemUnlock:SetAlpha( 1, 50 )
				end
			}
		} )
		UnlocksDismiss:RegisterAnimationSequence( "Bootup", {
			{
				function ()
					return self.UnlocksDismiss:SetAlpha( 0, 750 )
				end,
				function ()
					return self.UnlocksDismiss:SetAlpha( 1, 50 )
				end
			}
		} )
		Divider:RegisterAnimationSequence( "Bootup", {
			{
				function ()
					return self.Divider:SetAlpha( 0, 750 )
				end,
				function ()
					return self.Divider:SetAlpha( 0.5, 50 )
				end
			}
		} )
		DividerCopy2:RegisterAnimationSequence( "Bootup", {
			{
				function ()
					return self.DividerCopy2:SetAlpha( 0, 750 )
				end,
				function ()
					return self.DividerCopy2:SetAlpha( 0.5, 50 )
				end
			}
		} )
		self._sequences.Bootup = function ()
			IntelHeader:AnimateSequence( "Bootup" )
			UnlockTip:AnimateSequence( "Bootup" )
			ItemUnlock:AnimateSequence( "Bootup" )
			UnlocksDismiss:AnimateSequence( "Bootup" )
			Divider:AnimateSequence( "Bootup" )
			DividerCopy2:AnimateSequence( "Bootup" )
		end
		
		IntelHeader:RegisterAnimationSequence( "Shutdown", {
			{
				function ()
					return self.IntelHeader:SetAlpha( 0, 100 )
				end
			}
		} )
		UnlockTip:RegisterAnimationSequence( "Shutdown", {
			{
				function ()
					return self.UnlockTip:SetAlpha( 0, 100 )
				end
			}
		} )
		ItemUnlock:RegisterAnimationSequence( "Shutdown", {
			{
				function ()
					return self.ItemUnlock:SetAlpha( 0, 100 )
				end
			}
		} )
		UnlocksDismiss:RegisterAnimationSequence( "Shutdown", {
			{
				function ()
					return self.UnlocksDismiss:SetAlpha( 0, 100 )
				end
			}
		} )
		Divider:RegisterAnimationSequence( "Shutdown", {
			{
				function ()
					return self.Divider:SetAlpha( 0, 100 )
				end
			}
		} )
		DividerCopy2:RegisterAnimationSequence( "Shutdown", {
			{
				function ()
					return self.DividerCopy2:SetAlpha( 0, 100 )
				end
			}
		} )
		self._sequences.Shutdown = function ()
			IntelHeader:AnimateSequence( "Shutdown" )
			UnlockTip:AnimateSequence( "Shutdown" )
			ItemUnlock:AnimateSequence( "Shutdown" )
			UnlocksDismiss:AnimateSequence( "Shutdown" )
			Divider:AnimateSequence( "Shutdown" )
			DividerCopy2:AnimateSequence( "Shutdown" )
		end
		
		UnlockTip:RegisterAnimationSequence( "BootupMissionIntel", {
			{
				function ()
					return self.UnlockTip:SetAlpha( 0, 750 )
				end,
				function ()
					return self.UnlockTip:SetAlpha( 1, 50 )
				end
			}
		} )
		ItemUnlock:RegisterAnimationSequence( "BootupMissionIntel", {
			{
				function ()
					return self.ItemUnlock:SetAlpha( 0, 750 )
				end,
				function ()
					return self.ItemUnlock:SetAlpha( 1, 50 )
				end
			}
		} )
		self._sequences.BootupMissionIntel = function ()
			UnlockTip:AnimateSequence( "BootupMissionIntel" )
			ItemUnlock:AnimateSequence( "BootupMissionIntel" )
		end
		
		self._sequences.WaypointBoot = function ()
			
		end
		
		ItemUnlock:RegisterAnimationSequence( "UnlockRotate", {
			{
				function ()
					return self.ItemUnlock:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * -3, 0, _1080p * 59.5, _1080p * 139.5, 0 )
				end,
				function ()
					return self.ItemUnlock:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 272.25, 0, _1080p * 59.5, _1080p * 139.5, 300, LUI.EASING.inOutQuintic )
				end,
				function ()
					return self.ItemUnlock:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * -3, 0, _1080p * 59.5, _1080p * 139.5, 219, LUI.EASING.inOutQuintic )
				end
			}
		} )
		self._sequences.UnlockRotate = function ()
			ItemUnlock:AnimateSequence( "UnlockRotate" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	
	local bindButton = LUI.UIBindButton.new()
	bindButton.id = "selfBindButton"
	self:addElement( bindButton )
	self.bindButton = bindButton
	
	self:SubscribeToModel( DataSources.inGame.SP.showIntelMessage:GetModel( f6_local1 ), function ()
		if DataSources.inGame.SP.showIntelMessage:GetValue( f6_local1 ) ~= nil and DataSources.inGame.SP.showIntelMessage:GetValue( f6_local1 ) == true then
			ACTIONS.AnimateSequence( self, "Bootup" )
			ACTIONS.AnimateSequenceByElement( self, {
				elementName = "MessageBackground",
				sequenceName = "Bootup",
				elementPath = "MessageBackground"
			} )
		end
		if DataSources.inGame.SP.showIntelWaypoint:GetValue( f6_local1 ) ~= nil and DataSources.inGame.SP.showIntelWaypoint:GetValue( f6_local1 ) == true then
			ACTIONS.AnimateSequence( self, "WaypointBoot" )
		end
	end )
	self.bindButton:addEventHandler( "button_alt2", function ( f47_arg0, f47_arg1 )
		local f47_local0 = f47_arg1.controller or f6_local1
		ACTIONS.ScriptNotify( "intel_loc_request", 1 )
	end )
	f0_local5( self, f6_local1, controller )
	ACTIONS.AnimateSequence( self, "Default" )
	ACTIONS.AnimateSequenceByElement( self, {
		elementName = "MessageBackground",
		sequenceName = "Default",
		elementPath = "MessageBackground"
	} )
	return self
end

MenuBuilder.registerType( "IntelAARMessage", IntelAARMessage )
LockTable( _M )
