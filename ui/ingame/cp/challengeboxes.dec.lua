local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function challengeBoxes( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 404 * _1080p, 0, 122 * _1080p )
	self.id = "challengeBoxes"
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local Background = nil
	
	Background = LUI.UIImage.new()
	Background.id = "Background"
	Background:setImage( RegisterMaterial( "zm_pc_score_bg" ), 0 )
	Background:SetUseAA( true )
	Background:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 93.6, _1080p * 402, _1080p * 15.21, _1080p * 108.6 )
	self:addElement( Background )
	self.Background = Background
	
	local neilFailed = nil
	
	neilFailed = LUI.UIImage.new()
	neilFailed.id = "neilFailed"
	neilFailed:SetScale( -0.1, 0 )
	neilFailed:setImage( RegisterMaterial( "zm_challenge_failed" ), 0 )
	neilFailed:SetUseAA( true )
	neilFailed:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -2.4, _1080p * 125.6, _1080p * -2.4, _1080p * 125.6 )
	self:addElement( neilFailed )
	self.neilFailed = neilFailed
	
	local neilPaused = nil
	
	neilPaused = LUI.UIImage.new()
	neilPaused.id = "neilPaused"
	neilPaused:SetScale( -0.1, 0 )
	neilPaused:setImage( RegisterMaterial( "zm_challenge_paused" ), 0 )
	neilPaused:SetUseAA( true )
	neilPaused:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -2.4, _1080p * 125.6, _1080p * -2.4, _1080p * 125.6 )
	self:addElement( neilPaused )
	self.neilPaused = neilPaused
	
	local neil = nil
	
	neil = LUI.UIImage.new()
	neil.id = "neil"
	neil:SetScale( -0.1, 0 )
	neil:setImage( RegisterMaterial( "zm_challenge_neil_widget" ), 0 )
	neil:SetUseAA( true )
	neil:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -2.4, _1080p * 125.6, _1080p * -2.4, _1080p * 125.6 )
	self:addElement( neil )
	self.neil = neil
	
	local neilProgressBackground = nil
	
	neilProgressBackground = LUI.UIImage.new()
	neilProgressBackground.id = "neilProgressBackground"
	neilProgressBackground:SetScale( 0.27, 0 )
	neilProgressBackground:setImage( RegisterMaterial( "dpad_circle_outline" ), 0 )
	neilProgressBackground:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 16.21, _1080p * 106.99, _1080p * 15.21, _1080p * 105.99 )
	self:addElement( neilProgressBackground )
	self.neilProgressBackground = neilProgressBackground
	
	local neilProgress = nil
	
	neilProgress = MenuBuilder.BuildRegisteredType( "UIRadialProgressBar", {
		segmentCount = 2,
		segmentMaterial = "dpad_circle_segment",
		maskMaterial = "dpad_circle_mask",
		snapToMultiplesOfAngle = 0,
		controllerIndex = f1_local1
	} )
	neilProgress.id = "neilProgress"
	neilProgress:SetRGBFromInt( 15900471, 0 )
	neilProgress:SetScale( 0.23, 0 )
	neilProgress:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 16.21, _1080p * 106.99, _1080p * 15.21, _1080p * 105.99 )
	neilProgress:SubscribeToModel( DataSources.inGame.CP.zombies.neilProgress:GetModel( f1_local1 ), function ()
		local f2_local0 = DataSources.inGame.CP.zombies.neilProgress:GetValue( f1_local1 )
		if f2_local0 ~= nil then
			neilProgress:SetProgress( f2_local0 )
		end
	end )
	self:addElement( neilProgress )
	self.neilProgress = neilProgress
	
	return self
end

MenuBuilder.registerType( "challengeBoxes", challengeBoxes )
LockTable( _M )
