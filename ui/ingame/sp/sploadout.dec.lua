local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ( f1_arg0 )
	assert( f1_arg0.VRHint )
	f1_arg0.VRHint:setText( Engine.Localize( "LUA_MENU_TEST_IN_VR_HINT", Engine.Localize( ButtonMap.button_alt2.string ) ) )
end

f0_local1 = function ( f2_arg0, f2_arg1, f2_arg2 )
	f2_arg0:addEventHandler( "open_loadout_edit_menu", function ( f3_arg0, f3_arg1 )
		Engine.SetDvarString( "loadout_tut_string", "edit_loadout_page" )
	end )
	f0_local0( f2_arg0 )
	assert( f2_arg0.FramedPowers )
	f2_arg0.FramedPowers.SwapPowerSourcesFunc()
	if CONDITIONS.IsPC( self ) then
		f2_arg0:registerEventHandler( "refresh_button_helper", function ( element, event )
			f0_local0( f2_arg0 )
		end )
		local f2_local0 = {
			f2_arg0.WeaponOne.WeaponButton,
			f2_arg0.WeaponTwo.WeaponButton
		}
		for f2_local1 = 1, #f2_local0, 1 do
			f2_local0[f2_local1]:addEventHandler( "gain_focus", function ( f5_arg0, f5_arg1 )
				f2_arg0.VRHint:SetAlpha( 1, 0 )
			end )
			f2_local0[f2_local1]:addEventHandler( "lose_focus", function ( f6_arg0, f6_arg1 )
				f2_arg0.VRHint:SetAlpha( 0, 0 )
			end )
		end
		f2_arg0.VRHint:SetAlpha( 0, 0 )
	end
end

function SPLoadout( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 500 * _1080p, 0, 762.96 * _1080p )
	self.id = "SPLoadout"
	local f7_local1 = controller and controller.controllerIndex
	if not f7_local1 and not Engine.InFrontend() then
		f7_local1 = self:getRootController()
	end
	assert( f7_local1 )
	local f7_local2 = self
	local LoadoutBlur = nil
	
	LoadoutBlur = LUI.UIBlur.new()
	LoadoutBlur.id = "LoadoutBlur"
	LoadoutBlur:SetBlurStrength( 2.75, 0 )
	self:addElement( LoadoutBlur )
	self.LoadoutBlur = LoadoutBlur
	
	local WeaponOne = nil
	
	WeaponOne = MenuBuilder.BuildRegisteredType( "FramedWeaponSP", {
		controllerIndex = f7_local1
	} )
	WeaponOne.id = "WeaponOne"
	WeaponOne:SetDataSourceThroughElement( self, "weaponSlotOne" )
	WeaponOne.FrameLabel:setText( Engine.Localize( "MPUI_PRIMARY_WEAPON_CAPS" ), 0 )
	WeaponOne:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 500, 0, _1080p * 206.98 )
	self:addElement( WeaponOne )
	self.WeaponOne = WeaponOne
	
	local WeaponTwo = nil
	
	WeaponTwo = MenuBuilder.BuildRegisteredType( "FramedWeaponSP", {
		controllerIndex = f7_local1
	} )
	WeaponTwo.id = "WeaponTwo"
	WeaponTwo:SetDataSourceThroughElement( self, "weaponSlotTwo" )
	WeaponTwo.FrameLabel:setText( Engine.Localize( "MPUI_SECONDARY_WEAPON_CAPS" ), 0 )
	WeaponTwo:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 500, _1080p * 212.98, _1080p * 419.96 )
	self:addElement( WeaponTwo )
	self.WeaponTwo = WeaponTwo
	
	local FramedOffhandPowers = nil
	
	FramedOffhandPowers = MenuBuilder.BuildRegisteredType( "FramedPowers", {
		controllerIndex = f7_local1
	} )
	FramedOffhandPowers.id = "FramedOffhandPowers"
	FramedOffhandPowers:SetDataSourceThroughElement( self, "offhandPowers" )
	FramedOffhandPowers.FrameLabel:setText( Engine.Localize( "MENU_LETHAL_CAPS" ), 0 )
	FramedOffhandPowers:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -247, 0, _1080p * 425.96, _1080p * 534.96 )
	self:addElement( FramedOffhandPowers )
	self.FramedOffhandPowers = FramedOffhandPowers
	
	local FramedPowers = nil
	
	FramedPowers = MenuBuilder.BuildRegisteredType( "FramedPowers", {
		controllerIndex = f7_local1
	} )
	FramedPowers.id = "FramedPowers"
	FramedPowers:SetDataSourceThroughElement( self, "powers" )
	FramedPowers.FrameLabel:setText( Engine.Localize( "LUA_MENU_TACTICAL_CAPS" ), 0 )
	FramedPowers:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 247, _1080p * 425.96, _1080p * 534.96 )
	self:addElement( FramedPowers )
	self.FramedPowers = FramedPowers
	
	local JackalItems = nil
	
	JackalItems = MenuBuilder.BuildRegisteredType( "FramedJackalItems", {
		controllerIndex = f7_local1
	} )
	JackalItems.id = "JackalItems"
	JackalItems:SetDataSourceThroughElement( self, "jackalLoadout" )
	JackalItems:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, _1080p * 540.96, _1080p * 762.96 )
	self:addElement( JackalItems )
	self.JackalItems = JackalItems
	
	local VRHint = nil
	
	VRHint = LUI.UIStyledText.new()
	VRHint.id = "VRHint"
	VRHint:setText( Engine.Localize( "LUA_MENU_TEST_IN_VR_HINT" ), 0 )
	VRHint:SetFontSize( 22 * _1080p )
	VRHint:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	VRHint:SetAlignment( LUI.Alignment.Right )
	VRHint:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 138, _1080p * 500, _1080p * -23, _1080p * -1 )
	self:addElement( VRHint )
	self.VRHint = VRHint
	
	WeaponOne:SetDataSourceThroughElement( self, "weaponSlotOne" )
	WeaponTwo:SetDataSourceThroughElement( self, "weaponSlotTwo" )
	FramedOffhandPowers:SetDataSourceThroughElement( self, "offhandPowers" )
	FramedPowers:SetDataSourceThroughElement( self, "powers" )
	JackalItems:SetDataSourceThroughElement( self, "jackalLoadout" )
	f0_local1( self, f7_local1, controller )
	return self
end

MenuBuilder.registerType( "SPLoadout", SPLoadout )
LockTable( _M )
