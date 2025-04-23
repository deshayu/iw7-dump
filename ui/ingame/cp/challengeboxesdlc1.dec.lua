local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function challengeBoxesDLC1( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 404 * _1080p, 0, 122 * _1080p )
	self.id = "challengeBoxesDLC1"
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local Background = nil
	
	Background = LUI.UIImage.new()
	Background.id = "Background"
	Background:SetRGBFromInt( 12846341, 0 )
	Background:setImage( RegisterMaterial( "zm_pc_score_bg" ), 0 )
	Background:SetUseAA( true )
	Background:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 71.6, _1080p * 380, _1080p * 15.21, _1080p * 108.6 )
	self:addElement( Background )
	self.Background = Background
	
	local neil = nil
	
	neil = LUI.UIImage.new()
	neil.id = "neil"
	neil:SetScale( -0.1, 0 )
	neil:SetUseAA( true )
	neil:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -2.4, _1080p * 125.6, _1080p * -2.4, _1080p * 125.6 )
	neil:SubscribeToModel( DataSources.inGame.CP.zombies.challenges.challengeIcon:GetModel( f1_local1 ), function ()
		local f2_local0 = DataSources.inGame.CP.zombies.challenges.challengeIcon:GetValue( f1_local1 )
		if f2_local0 ~= nil then
			neil:setImage( RegisterMaterial( f2_local0 ), 0 )
		end
	end )
	self:addElement( neil )
	self.neil = neil
	
	return self
end

MenuBuilder.registerType( "challengeBoxesDLC1", challengeBoxesDLC1 )
LockTable( _M )
