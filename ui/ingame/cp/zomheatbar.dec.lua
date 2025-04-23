local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ( f1_arg0, f1_arg1 )
	return function ()
		local f2_local0 = 410
		local f2_local1 = DataSources.inGame.player.currentWeapon.clipAmmoRight:GetValue( f1_arg1 )
		local f2_local2 = DataSources.inGame.player.currentWeapon.clipAmmoMax:GetValue( f1_arg1 )
		if f2_local1 and f2_local2 then
			local f2_local3
			if f2_local2 == 0 then
				f2_local3 = 0
				if not f2_local3 then
				
				else
					f1_arg0.HeatBar:SetRight( _1080p * (f2_local0 * f2_local3 - 6) * -1, 0 )
				end
			end
			f2_local3 = f2_local1 / f2_local2
		end
	end
	
end

f0_local1 = function ( f3_arg0, f3_arg1, f3_arg2 )
	assert( f3_arg0.HeatBar )
	f3_arg0.HeatBar:SubscribeToModel( DataSources.inGame.player.currentWeapon.clipAmmoRight:GetModel( f3_arg1 ), f0_local0( f3_arg0, f3_arg1 ) )
	f3_arg0.HeatBar:SubscribeToModel( DataSources.inGame.player.currentWeapon.clipAmmoMax:GetModel( f3_arg1 ), f0_local0( f3_arg0, f3_arg1 ) )
end

function ZomHeatbar( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 410 * _1080p, 0, 124 * _1080p )
	self.id = "ZomHeatbar"
	local f4_local1 = controller and controller.controllerIndex
	if not f4_local1 and not Engine.InFrontend() then
		f4_local1 = self:getRootController()
	end
	assert( f4_local1 )
	local f4_local2 = self
	local HeatBarBG = nil
	
	HeatBarBG = LUI.UIImage.new()
	HeatBarBG.id = "HeatBarBG"
	HeatBarBG:SetRGBFromInt( 2039583, 0 )
	HeatBarBG:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 410, 0, _1080p * 124 )
	self:addElement( HeatBarBG )
	self.HeatBarBG = HeatBarBG
	
	local HeatBar = nil
	
	HeatBar = LUI.UIImage.new()
	HeatBar.id = "HeatBar"
	HeatBar:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -404, _1080p * -404, _1080p * 2, _1080p * 123 )
	HeatBar:BindColorToModel( DataSources.inGame.player.currentWeapon.heatbarColorRight:GetModel( f4_local1 ) )
	HeatBar:SubscribeToModel( DataSources.inGame.CP.zombies.overheatBarProgressAlphaFilter:GetModel( f4_local1 ), function ()
		local f5_local0 = DataSources.inGame.CP.zombies.overheatBarProgressAlphaFilter:GetValue( f4_local1 )
		if f5_local0 ~= nil then
			HeatBar:SetAlpha( Mirror( f5_local0, 0, 1 ), 0 )
		end
	end )
	self:addElement( HeatBar )
	self.HeatBar = HeatBar
	
	local OverheatBar = nil
	
	OverheatBar = LUI.UIImage.new()
	OverheatBar.id = "OverheatBar"
	OverheatBar:SetAnchors( 0, 1, 0, 1, 0 )
	OverheatBar:SetLeft( _1080p * 6, 0 )
	OverheatBar:SetTop( _1080p * 7, 0 )
	OverheatBar:SetBottom( _1080p * 119, 0 )
	OverheatBar:SetRGBFromInt( 16711701, 0 )
	OverheatBar:SubscribeToModel( DataSources.inGame.CP.zombies.overheatBarProgress:GetModel( f4_local1 ), function ()
		local f6_local0 = DataSources.inGame.CP.zombies.overheatBarProgress:GetValue( f4_local1 )
		if f6_local0 ~= nil then
			OverheatBar:SetRight( _1080p * Add( Multiply( f6_local0, 3.98 ), 6 ), 0 )
		end
	end )
	OverheatBar:BindAlphaToModel( DataSources.inGame.CP.zombies.overheatBarProgressAlphaFilter:GetModel( f4_local1 ) )
	self:addElement( OverheatBar )
	self.OverheatBar = OverheatBar
	
	local OveheatLabel = nil
	
	OveheatLabel = LUI.UIText.new()
	OveheatLabel.id = "OveheatLabel"
	OveheatLabel:SetRGBFromTable( SWATCHES.heatBar.overheatText, 0 )
	OveheatLabel:SetScale( -0.12, 0 )
	OveheatLabel:setText( Engine.Localize( "LUA_MENU_MP_BEAM_OVERHEAT_CAPS" ), 0 )
	OveheatLabel:SetFontSize( 86 * _1080p )
	OveheatLabel:SetFont( FONTS.GetFont( FONTS.Dev.File ) )
	OveheatLabel:SetAlignment( LUI.Alignment.Center )
	OveheatLabel:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 18, _1080p * 392, _1080p * 18, _1080p * 106 )
	OveheatLabel:BindAlphaToModel( DataSources.inGame.CP.zombies.overheatBarProgress:GetModel( f4_local1 ) )
	self:addElement( OveheatLabel )
	self.OveheatLabel = OveheatLabel
	
	f0_local1( self, f4_local1, controller )
	return self
end

MenuBuilder.registerType( "ZomHeatbar", ZomHeatbar )
LockTable( _M )
