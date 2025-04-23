local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ( f1_arg0, f1_arg1, f1_arg2 )
	local f1_local0 = assert
	local f1_local1 = f1_arg0.BottomRight
	if f1_local1 then
		f1_local1 = f1_arg0.BottomLeft
		if f1_local1 then
			f1_local1 = f1_arg0.BottomCenter and f1_arg0.TopCenter
		end
	end
	f1_local0( f1_local1, "WARNING: SP HUD Frame Items Are Missing..." )
	f1_local0 = DataSources.inGame.player.currentWeapon.hideWeaponInfo
	f1_local1 = DataSources.inGame.SP.helmetState
	local f1_local2 = DataSources.inGame.SP.deathHint.deathQuote
	local f1_local3 = 200
	f1_arg0:SetAlpha( 0, 0 )
	f1_arg0.BottomRight:SetAlpha( 0, 0 )
	f1_arg0.BottomLeft:SetAlpha( 0, 0 )
	f1_arg0.BottomCenter:SetAlpha( 0, 0 )
	f1_arg0.TopCenter:SetAlpha( 0, 0 )
	local f1_local4 = function ()
		local f2_local0 = f1_local1:GetValue( f1_arg1 )
		local f2_local1 = f1_local0:GetValue( f1_arg1 )
		if f2_local1 ~= nil and f2_local1 == false then
			if f2_local0 ~= nil and f2_local0 == 1 then
				local f2_local2 = 0.25
				f1_arg0:SetAlpha( 1, f1_local3 )
				f1_arg0.BottomRight:SetAlpha( f2_local2, f1_local3 )
				f1_arg0.BottomLeft:SetAlpha( f2_local2, f1_local3 )
				f1_arg0.BottomCenter:SetAlpha( f2_local2, f1_local3 )
				f1_arg0.TopCenter:SetAlpha( f2_local2, f1_local3 )
			end
		elseif f2_local1 ~= nil and f2_local1 == true then
			local f2_local2 = 0
			f1_arg0:SetAlpha( f2_local2, f1_local3 )
			f1_arg0.BottomRight:SetAlpha( f2_local2, f1_local3 )
			f1_arg0.BottomLeft:SetAlpha( f2_local2, f1_local3 )
			f1_arg0.BottomCenter:SetAlpha( f2_local2, f1_local3 )
			f1_arg0.TopCenter:SetAlpha( f2_local2, f1_local3 )
		end
	end
	
	local f1_local5 = function ()
		local f3_local0 = f1_local1:GetValue( f1_arg1 )
		if f3_local0 ~= nil then
			f1_arg0:SetAlpha( f3_local0, f1_local3 )
		end
	end
	
	f1_arg0:registerOmnvarHandler( "ui_hide_hud", function ( f4_arg0, f4_arg1 )
		f1_local4()
	end )
	f1_arg0:SubscribeToModel( f1_local0:GetModel( f1_arg1 ), f1_local4 )
	f1_arg0:SubscribeToModel( f1_local1:GetModel( f1_arg1 ), f1_local5 )
	f1_arg0:SubscribeToModel( f1_local2:GetModel( f1_arg1 ), function ()
		local f5_local0 = f1_local2:GetValue( f1_arg1 )
		if f5_local0 ~= nil and f5_local0 ~= "" then
			f1_arg0.BottomRight:SetAlpha( 0, f1_local3 )
			f1_arg0.BottomLeft:SetAlpha( 0, f1_local3 )
			f1_arg0.BottomCenter:SetAlpha( 0, f1_local3 )
			f1_arg0.TopCenter:SetAlpha( 0, f1_local3 )
		end
	end )
end

function SPHUDFrame( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 1920 * _1080p, 0, 1080 * _1080p )
	self.id = "SPHUDFrame"
	local f6_local1 = controller and controller.controllerIndex
	if not f6_local1 and not Engine.InFrontend() then
		f6_local1 = self:getRootController()
	end
	assert( f6_local1 )
	local f6_local2 = self
	local BottomRight = nil
	
	BottomRight = LUI.UIImage.new()
	BottomRight.id = "BottomRight"
	BottomRight:SetRGBFromTable( SWATCHES.HUD.primary, 0 )
	BottomRight:setImage( RegisterMaterial( "hud_sp_frame_bottom_right" ), 0 )
	BottomRight:SetAnchorsAndPosition( 1, 0, 1, 0, _1080p * -512, 0, _1080p * -256, 0 )
	self:addElement( BottomRight )
	self.BottomRight = BottomRight
	
	local BottomLeft = nil
	
	BottomLeft = LUI.UIImage.new()
	BottomLeft.id = "BottomLeft"
	BottomLeft:SetRGBFromTable( SWATCHES.HUD.primary, 0 )
	BottomLeft:setImage( RegisterMaterial( "hud_sp_frame_bottom_right" ), 0 )
	BottomLeft:SetAnchorsAndPosition( 0, 1, 1, 0, _1080p * 512, 0, _1080p * -256, 0 )
	self:addElement( BottomLeft )
	self.BottomLeft = BottomLeft
	
	local BottomCenter = nil
	
	BottomCenter = LUI.UIImage.new()
	BottomCenter.id = "BottomCenter"
	BottomCenter:SetRGBFromTable( SWATCHES.HUD.primary, 0 )
	BottomCenter:setImage( RegisterMaterial( "hud_sp_frame_bottom_center" ), 0 )
	BottomCenter:SetAnchorsAndPosition( 0.5, 0.5, 1, 0, _1080p * -256, _1080p * 256, _1080p * -148, _1080p * -20 )
	self:addElement( BottomCenter )
	self.BottomCenter = BottomCenter
	
	local TopCenter = nil
	
	TopCenter = LUI.UIImage.new()
	TopCenter.id = "TopCenter"
	TopCenter:SetRGBFromTable( SWATCHES.HUD.primary, 0 )
	TopCenter:setImage( RegisterMaterial( "hud_sp_frame_top_center" ), 0 )
	TopCenter:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -512, _1080p * 512, _1080p * -40, _1080p * 88 )
	self:addElement( TopCenter )
	self.TopCenter = TopCenter
	
	f0_local0( self, f6_local1, controller )
	return self
end

MenuBuilder.registerType( "SPHUDFrame", SPHUDFrame )
LockTable( _M )
