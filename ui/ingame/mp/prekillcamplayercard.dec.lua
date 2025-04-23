local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function PostLoadFunc( f1_arg0, f1_arg1, f1_arg2 )
	assert( f1_arg0.SmallPlayerCard )
	f1_arg0:SubscribeToModel( DataSources.inGame.MP.killcam.killedby.clientId:GetModel( f1_arg1 ), function ()
		local f2_local0 = DataSources.inGame.MP.killcam.killedby.clientId:GetValue( f1_arg1 )
		if f2_local0 ~= nil and f2_local0 >= 0 then
			f1_arg0.SmallPlayerCard:SetAlpha( 1, 0 )
		else
			f1_arg0.SmallPlayerCard:SetAlpha( 0, 0 )
		end
	end )
end

function PreKillcamPlayerCard( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 1920 * _1080p, 0, 1080 * _1080p )
	self.id = "PreKillcamPlayerCard"
	local f3_local1 = controller and controller.controllerIndex
	if not f3_local1 and not Engine.InFrontend() then
		f3_local1 = self:getRootController()
	end
	assert( f3_local1 )
	local f3_local2 = self
	local SmallPlayerCard = nil
	
	SmallPlayerCard = MenuBuilder.BuildRegisteredType( "SmallPlayerCard", {
		controllerIndex = f3_local1
	} )
	SmallPlayerCard.id = "SmallPlayerCard"
	SmallPlayerCard:SetScale( -0.14, 0 )
	SmallPlayerCard:SetDataSource( DataSources.inGame.MP.killcam.killedby.playerCard, f3_local1 )
	SmallPlayerCard:SetAnchorsAndPosition( 0.5, 0.5, 1, 0, _1080p * -754, _1080p * -336, _1080p * -160, _1080p * -40 )
	self:addElement( SmallPlayerCard )
	self.SmallPlayerCard = SmallPlayerCard
	
	SmallPlayerCard:SetDataSource( DataSources.inGame.MP.killcam.killedby.playerCard, f3_local1 )
	PostLoadFunc( self, f3_local1, controller )
	return self
end

MenuBuilder.registerType( "PreKillcamPlayerCard", PreKillcamPlayerCard )
LockTable( _M )
