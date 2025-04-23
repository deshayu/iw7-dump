local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function PostLoadFunc( f1_arg0, f1_arg1, f1_arg2 )
	f1_arg0.TextMeleeWeaponName:SetShadowUOffset( -0 )
	f1_arg0.TextMeleeWeaponName:SetShadowVOffset( -0 )
	f1_arg0:SubscribeToModel( DataSources.inGame.player.affectedByEMP:GetModel( f1_arg1 ), function ( f2_arg0 )
		if DataModel.GetModelValue( f2_arg0 ) then
			MP.StartEMPGlitch( f1_arg0 )
		else
			MP.StopEMPGlitch( f1_arg0 )
		end
	end )
	local f1_local0 = DataSources.inGame.player.currentWeapon.displayName
	f1_arg0:SubscribeToModel( f1_local0:GetModel( f1_arg1 ), function ()
		local f3_local0 = f1_local0:GetValue( f1_arg1 )
		if f3_local0 ~= nil then
			local f3_local1 = DataSources.inGame.player.currentWeapon.baseWeapon:GetValue( f1_arg1 )
			if f3_local1 ~= nil then
				if f3_local1 == "iw7_rvn_mp" or f3_local1 == "iw7_rvn_mpl" then
					f3_local0 = Engine.Localize( "LUA_MENU_WEAPTYPE_MELEES" )
				elseif f3_local1 == "iw7_axe_mp" then
					f3_local0 = Engine.Localize( "WEAPON_FISTS" )
				end
			end
			f1_arg0.TextMeleeWeaponName:setText( f3_local0, 0 )
		end
	end )
end

function MPWeaponInfoContainer( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 370 * _1080p, 0, 185 * _1080p )
	self.id = "MPWeaponInfoContainer"
	self._animationSets = {}
	self._sequences = {}
	local f4_local1 = controller and controller.controllerIndex
	if not f4_local1 and not Engine.InFrontend() then
		f4_local1 = self:getRootController()
	end
	assert( f4_local1 )
	local f4_local2 = self
	local BackerMain = nil
	
	BackerMain = LUI.UIBlur.new()
	BackerMain.id = "BackerMain"
	BackerMain:SetRGBFromInt( 11776947, 0 )
	BackerMain:setImage( RegisterMaterial( "hud_weapon_info_backer_main" ), 0 )
	BackerMain:SetBlurStrength( 1, 0 )
	BackerMain:SetAnchorsAndPosition( 1, 0, 0.5, 0.5, _1080p * -370, 0, _1080p * -92.5, _1080p * 92.5 )
	self:addElement( BackerMain )
	self.BackerMain = BackerMain
	
	local BackerAkimbo = nil
	
	BackerAkimbo = LUI.UIBlur.new()
	BackerAkimbo.id = "BackerAkimbo"
	BackerAkimbo:SetRGBFromInt( 11776947, 0 )
	BackerAkimbo:SetDotPitchEnabled( true )
	BackerAkimbo:SetDotPitchX( 0, 0 )
	BackerAkimbo:SetDotPitchY( 0, 0 )
	BackerAkimbo:SetDotPitchContrast( 0, 0 )
	BackerAkimbo:SetDotPitchMode( 0 )
	BackerAkimbo:setImage( RegisterMaterial( "hud_weapon_info_backer_akimbo" ), 0 )
	BackerAkimbo:SetBlurStrength( 1, 0 )
	BackerAkimbo:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -83.5, _1080p * 20, _1080p * 71, _1080p * 122.5 )
	self:addElement( BackerAkimbo )
	self.BackerAkimbo = BackerAkimbo
	
	local WeaponInfo = nil
	
	WeaponInfo = MenuBuilder.BuildRegisteredType( "WeaponInfo", {
		controllerIndex = f4_local1
	} )
	WeaponInfo.id = "WeaponInfo"
	WeaponInfo:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -282, _1080p * 23, _1080p * -21.5, _1080p * 30.5 )
	self:addElement( WeaponInfo )
	self.WeaponInfo = WeaponInfo
	
	local RigIcon = nil
	
	RigIcon = MenuBuilder.BuildRegisteredType( "RigIcon", {
		controllerIndex = f4_local1
	} )
	RigIcon.id = "RigIcon"
	RigIcon:SetAnchorsAndPosition( 1, 0, 0.5, 0.5, _1080p * -166, 0, _1080p * -83, _1080p * 83 )
	self:addElement( RigIcon )
	self.RigIcon = RigIcon
	
	local TextMeleeWeaponName = nil
	
	TextMeleeWeaponName = LUI.UIStyledText.new()
	TextMeleeWeaponName.id = "TextMeleeWeaponName"
	TextMeleeWeaponName:SetRGBFromTable( SWATCHES.HUD.normal, 0 )
	TextMeleeWeaponName:SetAlpha( 0, 0 )
	TextMeleeWeaponName:setText( "", 0 )
	TextMeleeWeaponName:SetFontSize( 20 * _1080p )
	TextMeleeWeaponName:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	TextMeleeWeaponName:SetAlignment( LUI.Alignment.Center )
	TextMeleeWeaponName:SetShadowMinDistance( -0.01, 0 )
	TextMeleeWeaponName:SetShadowMaxDistance( 0.01, 0 )
	TextMeleeWeaponName:SetShadowRGBFromInt( 0, 0 )
	TextMeleeWeaponName:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -165, _1080p * 27, _1080p * -5.75, _1080p * 14.25 )
	self:addElement( TextMeleeWeaponName )
	self.TextMeleeWeaponName = TextMeleeWeaponName
	
	local Node = nil
	
	Node = LUI.UIBlur.new()
	Node.id = "Node"
	Node:SetRGBFromInt( 11776947, 0 )
	Node:SetBlurStrength( 1, 0 )
	Node:SetAnchorsAndPosition( 0, 1, 0.5, 0.5, _1080p * 6, _1080p * 14, _1080p * -10.5, _1080p * 19.5 )
	self:addElement( Node )
	self.Node = Node
	
	local Bolt = nil
	
	Bolt = LUI.UIImage.new()
	Bolt.id = "Bolt"
	Bolt:setImage( RegisterMaterial( "hud_weapon_info_energy_bolt" ), 0 )
	Bolt:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -16, _1080p * 14, _1080p * 82, _1080p * 112 )
	self:addElement( Bolt )
	self.Bolt = Bolt
	
	local Equipment = nil
	
	Equipment = MenuBuilder.BuildRegisteredType( "PlayerEquipment", {
		controllerIndex = f4_local1
	} )
	Equipment.id = "Equipment"
	Equipment:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 20, _1080p * 150, _1080p * -5.92, _1080p * 54.08 )
	self:addElement( Equipment )
	self.Equipment = Equipment
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		WeaponInfo:RegisterAnimationSequence( "HideWeaponInfo", {
			{
				function ()
					return self.WeaponInfo:SetAlpha( 0, 0 )
				end
			}
		} )
		TextMeleeWeaponName:RegisterAnimationSequence( "HideWeaponInfo", {
			{
				function ()
					return self.TextMeleeWeaponName:SetAlpha( 1, 0 )
				end,
				function ()
					return self.TextMeleeWeaponName:SetAlpha( 1, 1500 )
				end,
				function ()
					return self.TextMeleeWeaponName:SetAlpha( 0, 1000 )
				end
			}
		} )
		self._sequences.HideWeaponInfo = function ()
			WeaponInfo:AnimateSequence( "HideWeaponInfo" )
			TextMeleeWeaponName:AnimateSequence( "HideWeaponInfo" )
		end
		
		WeaponInfo:RegisterAnimationSequence( "ShowWeaponInfo", {
			{
				function ()
					return self.WeaponInfo:SetAlpha( 1, 0 )
				end
			}
		} )
		TextMeleeWeaponName:RegisterAnimationSequence( "ShowWeaponInfo", {
			{
				function ()
					return self.TextMeleeWeaponName:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.ShowWeaponInfo = function ()
			WeaponInfo:AnimateSequence( "ShowWeaponInfo" )
			TextMeleeWeaponName:AnimateSequence( "ShowWeaponInfo" )
		end
		
		BackerAkimbo:RegisterAnimationSequence( "ShowAkimboBacker", {
			{
				function ()
					return self.BackerAkimbo:SetAlpha( 0, 0 )
				end,
				function ()
					return self.BackerAkimbo:SetAlpha( 1, 30 )
				end,
				function ()
					return self.BackerAkimbo:SetAlpha( 0, 30 )
				end,
				function ()
					return self.BackerAkimbo:SetAlpha( 1, 30 )
				end,
				function ()
					return self.BackerAkimbo:SetAlpha( 0, 30 )
				end,
				function ()
					return self.BackerAkimbo:SetAlpha( 1, 30 )
				end
			},
			{
				function ()
					return self.BackerAkimbo:SetDotPitchX( 52, 0 )
				end,
				function ()
					return self.BackerAkimbo:SetDotPitchX( 0, 300 )
				end
			},
			{
				function ()
					return self.BackerAkimbo:SetDotPitchY( 43, 0 )
				end,
				function ()
					return self.BackerAkimbo:SetDotPitchY( 0, 300 )
				end
			},
			{
				function ()
					return self.BackerAkimbo:SetDotPitchContrast( 0.8, 0 )
				end,
				function ()
					return self.BackerAkimbo:SetDotPitchContrast( 0, 300 )
				end
			}
		} )
		self._sequences.ShowAkimboBacker = function ()
			BackerAkimbo:AnimateSequence( "ShowAkimboBacker" )
		end
		
		BackerAkimbo:RegisterAnimationSequence( "HideAkimboBacker", {
			{
				function ()
					return self.BackerAkimbo:SetAlpha( 1, 0 )
				end,
				function ()
					return self.BackerAkimbo:SetAlpha( 0, 100 )
				end
			}
		} )
		self._sequences.HideAkimboBacker = function ()
			BackerAkimbo:AnimateSequence( "HideAkimboBacker" )
		end
		
		Node:RegisterAnimationSequence( "IsEnergy", {
			{
				function ()
					return self.Node:SetAnchorsAndPosition( 0, 1, 0.5, 0.5, _1080p * -16, _1080p * 14, _1080p * -10.5, _1080p * 19.5, 100 )
				end
			}
		} )
		Bolt:RegisterAnimationSequence( "IsEnergy", {
			{
				function ()
					return self.Bolt:SetAlpha( 0, 100 )
				end,
				function ()
					return self.Bolt:SetAlpha( 1, 30 )
				end,
				function ()
					return self.Bolt:SetAlpha( 0, 30 )
				end,
				function ()
					return self.Bolt:SetAlpha( 1, 30 )
				end
			},
			{
				function ()
					return self.Bolt:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -16, _1080p * 14, _1080p * 82, _1080p * 112, 100 )
				end
			}
		} )
		self._sequences.IsEnergy = function ()
			Node:AnimateSequence( "IsEnergy" )
			Bolt:AnimateSequence( "IsEnergy" )
		end
		
		Node:RegisterAnimationSequence( "IsBallistic", {
			{
				function ()
					return self.Node:SetAnchorsAndPosition( 0, 1, 0.5, 0.5, _1080p * 6, _1080p * 14, _1080p * -10.5, _1080p * 19.5, 100 )
				end
			}
		} )
		Bolt:RegisterAnimationSequence( "IsBallistic", {
			{
				function ()
					return self.Bolt:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.IsBallistic = function ()
			Node:AnimateSequence( "IsBallistic" )
			Bolt:AnimateSequence( "IsBallistic" )
		end
		
		Node:RegisterAnimationSequence( "IsEnergyAkimbo", {
			{
				function ()
					return self.Node:SetAnchorsAndPosition( 0, 1, 0.5, 0.5, _1080p * -98, _1080p * -90, _1080p * -10.5, _1080p * 19.5, 100 )
				end,
				function ()
					return self.Node:SetAnchorsAndPosition( 0, 1, 0.5, 0.5, _1080p * -120, _1080p * -90, _1080p * -10.5, _1080p * 19.5, 100 )
				end
			}
		} )
		Bolt:RegisterAnimationSequence( "IsEnergyAkimbo", {
			{
				function ()
					return self.Bolt:SetAlpha( 0, 0 )
				end,
				function ()
					return self.Bolt:SetAlpha( 0, 200 )
				end,
				function ()
					return self.Bolt:SetAlpha( 1, 30 )
				end,
				function ()
					return self.Bolt:SetAlpha( 0, 30 )
				end,
				function ()
					return self.Bolt:SetAlpha( 1, 30 )
				end,
				function ()
					return self.Bolt:SetAlpha( 0, 30 )
				end,
				function ()
					return self.Bolt:SetAlpha( 1, 30 )
				end
			},
			{
				function ()
					return self.Bolt:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -120, _1080p * -90, _1080p * 82, _1080p * 112, 200 )
				end
			}
		} )
		self._sequences.IsEnergyAkimbo = function ()
			Node:AnimateSequence( "IsEnergyAkimbo" )
			Bolt:AnimateSequence( "IsEnergyAkimbo" )
		end
		
		Node:RegisterAnimationSequence( "IsBallisticAkimbo", {
			{
				function ()
					return self.Node:SetRGBFromInt( 10066329, 0 )
				end
			},
			{
				function ()
					return self.Node:SetAnchorsAndPosition( 0, 1, 0.5, 0.5, _1080p * -98, _1080p * -90, _1080p * -10.5, _1080p * 19.5, 100 )
				end
			}
		} )
		Bolt:RegisterAnimationSequence( "IsBallisticAkimbo", {
			{
				function ()
					return self.Bolt:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.IsBallisticAkimbo = function ()
			Node:AnimateSequence( "IsBallisticAkimbo" )
			Bolt:AnimateSequence( "IsBallisticAkimbo" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	self:SubscribeToModel( DataSources.inGame.player.currentWeapon.isMeleeWeapon:GetModel( f4_local1 ), function ()
		if DataSources.inGame.player.currentWeapon.isMeleeWeapon:GetValue( f4_local1 ) ~= nil and DataSources.inGame.player.currentWeapon.isMeleeWeapon:GetValue( f4_local1 ) == true then
			ACTIONS.AnimateSequence( self, "HideWeaponInfo" )
		end
		if DataSources.inGame.player.currentWeapon.isMeleeWeapon:GetValue( f4_local1 ) ~= nil and DataSources.inGame.player.currentWeapon.isMeleeWeapon:GetValue( f4_local1 ) == false then
			ACTIONS.AnimateSequence( self, "ShowWeaponInfo" )
		end
	end )
	local f4_local11 = function ()
		if DataSources.inGame.player.currentWeapon.isMeleeWeapon:GetValue( f4_local1 ) ~= nil and DataSources.inGame.player.currentWeapon.isMeleeWeapon:GetValue( f4_local1 ) == true then
			ACTIONS.AnimateSequence( self, "HideWeaponInfo" )
		end
	end
	
	self:SubscribeToModel( DataSources.inGame.player.currentWeapon.isMeleeWeapon:GetModel( f4_local1 ), f4_local11 )
	self:SubscribeToModel( DataSources.inGame.player.currentWeapon.displayName:GetModel( f4_local1 ), f4_local11 )
	self:SubscribeToModel( DataSources.inGame.player.currentWeapon.isDualWielding:GetModel( f4_local1 ), function ()
		if DataSources.inGame.player.currentWeapon.isDualWielding:GetValue( f4_local1 ) ~= nil and DataSources.inGame.player.currentWeapon.isDualWielding:GetValue( f4_local1 ) == true then
			ACTIONS.AnimateSequence( self, "ShowAkimboBacker" )
		end
		if DataSources.inGame.player.currentWeapon.isDualWielding:GetValue( f4_local1 ) ~= nil and DataSources.inGame.player.currentWeapon.isDualWielding:GetValue( f4_local1 ) == false then
			ACTIONS.AnimateSequence( self, "HideAkimboBacker" )
		end
		if DataSources.inGame.player.currentWeapon.isEnergyDualWield:GetValue( f4_local1 ) ~= nil and DataSources.inGame.player.currentWeapon.isEnergyDualWield:GetValue( f4_local1 ) == false and DataSources.inGame.player.currentWeapon.isDualWielding:GetValue( f4_local1 ) ~= nil and DataSources.inGame.player.currentWeapon.isDualWielding:GetValue( f4_local1 ) == true then
			ACTIONS.AnimateSequence( self, "IsBallisticAkimbo" )
		end
	end )
	self:SubscribeToModel( DataSources.inGame.player.currentWeapon.isEnergyDualWield:GetModel( f4_local1 ), function ()
		if DataSources.inGame.player.currentWeapon.isEnergyDualWield:GetValue( f4_local1 ) ~= nil and DataSources.inGame.player.currentWeapon.isEnergyDualWield:GetValue( f4_local1 ) == true then
			ACTIONS.AnimateSequence( self, "IsEnergyAkimbo" )
		end
	end )
	local f4_local12 = function ()
		if DataSources.inGame.player.currentWeapon.energyBullet:GetValue( f4_local1 ) ~= nil and DataSources.inGame.player.currentWeapon.energyBullet:GetValue( f4_local1 ) == true and DataSources.inGame.player.currentWeapon.isDualWielding:GetValue( f4_local1 ) ~= nil and DataSources.inGame.player.currentWeapon.isDualWielding:GetValue( f4_local1 ) == false then
			ACTIONS.AnimateSequence( self, "IsEnergy" )
		end
		if DataSources.inGame.player.currentWeapon.energyBullet:GetValue( f4_local1 ) ~= nil and DataSources.inGame.player.currentWeapon.energyBullet:GetValue( f4_local1 ) == false and DataSources.inGame.player.currentWeapon.isDualWielding:GetValue( f4_local1 ) ~= nil and DataSources.inGame.player.currentWeapon.isDualWielding:GetValue( f4_local1 ) == false then
			ACTIONS.AnimateSequence( self, "IsBallistic" )
		end
		if DataSources.inGame.player.currentWeapon.energyBullet:GetValue( f4_local1 ) ~= nil and DataSources.inGame.player.currentWeapon.energyBullet:GetValue( f4_local1 ) == false and DataSources.inGame.player.currentWeapon.isDualWielding:GetValue( f4_local1 ) ~= nil and DataSources.inGame.player.currentWeapon.isDualWielding:GetValue( f4_local1 ) == true then
			ACTIONS.AnimateSequence( self, "IsBallisticAkimbo" )
		end
	end
	
	self:SubscribeToModel( DataSources.inGame.player.currentWeapon.energyBullet:GetModel( f4_local1 ), f4_local12 )
	self:SubscribeToModel( DataSources.inGame.player.currentWeapon.isDualWielding:GetModel( f4_local1 ), f4_local12 )
	PostLoadFunc( self, f4_local1, controller )
	return self
end

MenuBuilder.registerType( "MPWeaponInfoContainer", MPWeaponInfoContainer )
LockTable( _M )
