local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function PostLoadFunc( f1_arg0, f1_arg1 )
	f1_arg0:SetupAnchoredElement( {
		minScale = 1,
		maxScale = 1,
		naturalDistance = 1000,
		worldOffsetZ = 55,
		snapToScreenEdges = true
	} )
	local f1_local0 = DataSources.inGame.CP.zombies.lostAndFoundTarget
	f1_arg0:SubscribeToModel( f1_local0:GetModel( f1_arg1 ), function ()
		f1_arg0:SetEntityNum( f1_local0:GetValue( f1_arg1 ) )
	end )
end

function lostAndFound( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 150 * _1080p, 0, 150 * _1080p )
	self.id = "lostAndFound"
	local f3_local1 = controller and controller.controllerIndex
	if not f3_local1 and not Engine.InFrontend() then
		f3_local1 = self:getRootController()
	end
	assert( f3_local1 )
	local f3_local2 = self
	local lostAndFoundIcon = nil
	
	lostAndFoundIcon = LUI.UIImage.new()
	lostAndFoundIcon.id = "lostAndFoundIcon"
	lostAndFoundIcon:SetScale( 0.71, 0 )
	lostAndFoundIcon:setImage( RegisterMaterial( "lostandfound" ), 0 )
	lostAndFoundIcon:SetUseAA( true )
	lostAndFoundIcon:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 52, _1080p * 98, _1080p * 52, _1080p * 98 )
	lostAndFoundIcon:BindAlphaToModel( DataSources.inGame.CP.zombies.lostAndFoundTimerAlpha:GetModel( f3_local1 ) )
	self:addElement( lostAndFoundIcon )
	self.lostAndFoundIcon = lostAndFoundIcon
	
	local lostAndFoundTimer = nil
	
	lostAndFoundTimer = MenuBuilder.BuildRegisteredType( "UIRadialProgressBar", {
		segmentCount = 2,
		segmentMaterial = "dpad_circle_segment",
		maskMaterial = "dpad_circle_mask",
		snapToMultiplesOfAngle = 0,
		controllerIndex = f3_local1
	} )
	lostAndFoundTimer.id = "lostAndFoundTimer"
	lostAndFoundTimer:SetRGBFromInt( 16314881, 0 )
	lostAndFoundTimer:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 36.5, _1080p * 113.5, _1080p * 39, _1080p * 111 )
	lostAndFoundTimer:BindAlphaToModel( DataSources.inGame.CP.zombies.lostAndFoundTimerAlpha:GetModel( f3_local1 ) )
	lostAndFoundTimer:SubscribeToModel( DataSources.inGame.CP.zombies.lostAndFoundTimer:GetModel( f3_local1 ), function ()
		local f4_local0 = DataSources.inGame.CP.zombies.lostAndFoundTimer:GetValue( f3_local1 )
		if f4_local0 ~= nil then
			lostAndFoundTimer:SetProgress( f4_local0 )
		end
	end )
	self:addElement( lostAndFoundTimer )
	self.lostAndFoundTimer = lostAndFoundTimer
	
	PostLoadFunc( self, f3_local1, controller )
	return self
end

MenuBuilder.registerType( "lostAndFound", lostAndFound )
LockTable( _M )
