local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function PostLoadFunc( f1_arg0, f1_arg1, f1_arg2 )
	f1_arg0:SetupInWorldElement( {
		useLeftHandIfAkimbo = true
	} )
	f1_arg0:AttachToViewModel()
	f1_arg0:SetViewModelTag( "j_shield_le" )
	f1_arg0:SetInWorldScale( 0.01 )
	f1_arg0:SetFollowTagAngles( true )
	f1_arg0:SetTagSpacePosition( 2.35, 0.7, 2.6 )
	f1_arg0:SetTagSpaceYaw( 2 )
	f1_arg0:SetTagSpaceRoll( -92 )
	f1_arg0:SetTagSpacePitch( 2.5 )
	f1_arg0:SetDelayedRender( true )
end

function WristPCShieldMeterScreen( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 700 * _1080p, 0, 128 * _1080p )
	self.id = "WristPCShieldMeterScreen"
	local f2_local1 = controller and controller.controllerIndex
	if not f2_local1 and not Engine.InFrontend() then
		f2_local1 = self:getRootController()
	end
	assert( f2_local1 )
	local f2_local2 = self
	local Background = nil
	
	Background = LUI.UIImage.new()
	Background.id = "Background"
	Background:SetRGBFromInt( 0, 0 )
	self:addElement( Background )
	self.Background = Background
	
	local FrameOverlay = nil
	
	FrameOverlay = LUI.UIImage.new()
	FrameOverlay.id = "FrameOverlay"
	FrameOverlay:SetAlpha( 0.1, 0 )
	FrameOverlay:setImage( RegisterMaterial( "hud_wrist_pc_bg" ), 0 )
	FrameOverlay:BindColorToModel( DataSources.inGame.player.secondaryPower.color:GetModel( f2_local1 ) )
	self:addElement( FrameOverlay )
	self.FrameOverlay = FrameOverlay
	
	local AccentOverlay = nil
	
	AccentOverlay = LUI.UIImage.new()
	AccentOverlay.id = "AccentOverlay"
	AccentOverlay:setImage( RegisterMaterial( "hud_wrist_pc_shield_meter_bg" ), 0 )
	AccentOverlay:BindColorToModel( DataSources.inGame.player.secondaryPower.color:GetModel( f2_local1 ) )
	self:addElement( AccentOverlay )
	self.AccentOverlay = AccentOverlay
	
	local ShieldMeter = nil
	
	ShieldMeter = MenuBuilder.BuildRegisteredType( "WristPCShieldMeter", {
		controllerIndex = f2_local1
	} )
	ShieldMeter.id = "ShieldMeter"
	ShieldMeter:SetAnchorsAndPosition( 1, 0, 0.5, 0.5, _1080p * -537, _1080p * -25, _1080p * -32, _1080p * 32 )
	self:addElement( ShieldMeter )
	self.ShieldMeter = ShieldMeter
	
	local PowerLevel = nil
	
	PowerLevel = LUI.UIImage.new()
	PowerLevel.id = "PowerLevel"
	PowerLevel:setImage( RegisterMaterial( "hud_wrist_pc_shield_meter_title" ), 0 )
	PowerLevel:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 167, _1080p * 295, _1080p * 10, _1080p * 42 )
	PowerLevel:BindColorToModel( DataSources.inGame.player.secondaryPower.color:GetModel( f2_local1 ) )
	self:addElement( PowerLevel )
	self.PowerLevel = PowerLevel
	
	PostLoadFunc( self, f2_local1, controller )
	return self
end

MenuBuilder.registerType( "WristPCShieldMeterScreen", WristPCShieldMeterScreen )
LockTable( _M )
