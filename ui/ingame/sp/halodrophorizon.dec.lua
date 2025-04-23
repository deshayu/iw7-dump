local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function HaloDropHorizon( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 1920 * _1080p, 0, 1080 * _1080p )
	self.id = "HaloDropHorizon"
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local meterR = nil
	
	meterR = LUI.UIImage.new()
	meterR.id = "meterR"
	meterR:SetAlpha( 0.75, 0 )
	meterR:SetDepth( 200, 0 )
	meterR:setImage( RegisterMaterial( "halo_drop_hud_pitch_meter" ), 0 )
	meterR:SetUMin( 0.5, 0 )
	meterR:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 104, _1080p * 360, _1080p * -320, _1080p * 320 )
	meterR:SubscribeToModel( DataSources.inGame.player.viewPitch:GetModel( f1_local1 ), function ()
		local f2_local0 = DataSources.inGame.player.viewPitch:GetValue( f1_local1 )
		if f2_local0 ~= nil then
			meterR:SetVMin( Add( Multiply( Multiply( f2_local0, 0.07 ), -0.1 ), 0.07 ), 0 )
		end
	end )
	meterR:SubscribeToModel( DataSources.inGame.player.viewPitch:GetModel( f1_local1 ), function ()
		local f3_local0 = DataSources.inGame.player.viewPitch:GetValue( f1_local1 )
		if f3_local0 ~= nil then
			meterR:SetVMax( Add( Multiply( Multiply( f3_local0, 0.07 ), -0.1 ), 0.37 ), 0 )
		end
	end )
	self:addElement( meterR )
	self.meterR = meterR
	
	local meterRCopy0 = nil
	
	meterRCopy0 = LUI.UIImage.new()
	meterRCopy0.id = "meterRCopy0"
	meterRCopy0:SetAlpha( 0.75, 0 )
	meterRCopy0:SetDepth( 200, 0 )
	meterRCopy0:setImage( RegisterMaterial( "halo_drop_hud_pitch_meter" ), 0 )
	meterRCopy0:SetUMax( 0.5, 0 )
	meterRCopy0:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -360, _1080p * -104, _1080p * -320, _1080p * 320 )
	meterRCopy0:SubscribeToModel( DataSources.inGame.player.viewPitch:GetModel( f1_local1 ), function ()
		local f4_local0 = DataSources.inGame.player.viewPitch:GetValue( f1_local1 )
		if f4_local0 ~= nil then
			meterRCopy0:SetVMin( Add( Multiply( Multiply( f4_local0, 0.07 ), -0.1 ), 0.07 ), 0 )
		end
	end )
	meterRCopy0:SubscribeToModel( DataSources.inGame.player.viewPitch:GetModel( f1_local1 ), function ()
		local f5_local0 = DataSources.inGame.player.viewPitch:GetValue( f1_local1 )
		if f5_local0 ~= nil then
			meterRCopy0:SetVMax( Add( Multiply( Multiply( f5_local0, 0.07 ), -0.1 ), 0.37 ), 0 )
		end
	end )
	self:addElement( meterRCopy0 )
	self.meterRCopy0 = meterRCopy0
	
	local meterRCopy1 = nil
	
	meterRCopy1 = LUI.UIImage.new()
	meterRCopy1.id = "meterRCopy1"
	meterRCopy1:SetAlpha( 0.45, 0 )
	meterRCopy1:SetDepth( 300, 0 )
	meterRCopy1:setImage( RegisterMaterial( "halo_drop_hud_pitch_meter_alt" ), 0 )
	meterRCopy1:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 78, _1080p * 334, _1080p * -320, _1080p * 320 )
	meterRCopy1:SubscribeToModel( DataSources.inGame.player.viewPitch:GetModel( f1_local1 ), function ()
		local f6_local0 = DataSources.inGame.player.viewPitch:GetValue( f1_local1 )
		if f6_local0 ~= nil then
			meterRCopy1:SetVMin( Add( Multiply( Multiply( f6_local0, 0.07 ), -0.2 ), 0.07 ), 0 )
		end
	end )
	meterRCopy1:SubscribeToModel( DataSources.inGame.player.viewPitch:GetModel( f1_local1 ), function ()
		local f7_local0 = DataSources.inGame.player.viewPitch:GetValue( f1_local1 )
		if f7_local0 ~= nil then
			meterRCopy1:SetVMax( Add( Multiply( Multiply( f7_local0, 0.07 ), -0.2 ), 0.37 ), 0 )
		end
	end )
	self:addElement( meterRCopy1 )
	self.meterRCopy1 = meterRCopy1
	
	local meterRCopy2 = nil
	
	meterRCopy2 = LUI.UIImage.new()
	meterRCopy2.id = "meterRCopy2"
	meterRCopy2:SetAlpha( 0.45, 0 )
	meterRCopy2:SetDepth( 300, 0 )
	meterRCopy2:setImage( RegisterMaterial( "halo_drop_hud_pitch_meter_alt" ), 0 )
	meterRCopy2:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -334, _1080p * -78, _1080p * -320, _1080p * 320 )
	meterRCopy2:SubscribeToModel( DataSources.inGame.player.viewPitch:GetModel( f1_local1 ), function ()
		local f8_local0 = DataSources.inGame.player.viewPitch:GetValue( f1_local1 )
		if f8_local0 ~= nil then
			meterRCopy2:SetVMin( Add( Multiply( Multiply( f8_local0, 0.07 ), -0.2 ), 0.07 ), 0 )
		end
	end )
	meterRCopy2:SubscribeToModel( DataSources.inGame.player.viewPitch:GetModel( f1_local1 ), function ()
		local f9_local0 = DataSources.inGame.player.viewPitch:GetValue( f1_local1 )
		if f9_local0 ~= nil then
			meterRCopy2:SetVMax( Add( Multiply( Multiply( f9_local0, 0.07 ), -0.2 ), 0.37 ), 0 )
		end
	end )
	self:addElement( meterRCopy2 )
	self.meterRCopy2 = meterRCopy2
	
	return self
end

MenuBuilder.registerType( "HaloDropHorizon", HaloDropHorizon )
LockTable( _M )
