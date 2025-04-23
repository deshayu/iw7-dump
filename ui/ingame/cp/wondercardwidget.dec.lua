local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function WonderCardWidget( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 184 * _1080p, 0, 184 * _1080p )
	self.id = "WonderCardWidget"
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local radialAlphaLarge = nil
	
	radialAlphaLarge = MenuBuilder.BuildRegisteredType( "radialAlphaLarge", {
		controllerIndex = f1_local1
	} )
	radialAlphaLarge.id = "radialAlphaLarge"
	radialAlphaLarge:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 183, 0, _1080p * 183 )
	radialAlphaLarge:SubscribeToModel( DataSources.inGame.CP.zombies.dpadUpFillPercent:GetModel( f1_local1 ), function ()
		local f2_local0 = DataSources.inGame.CP.zombies.dpadUpFillPercent:GetValue( f1_local1 )
		if f2_local0 ~= nil then
			radialAlphaLarge.circleFill:SetProgress( f2_local0 )
		end
	end )
	self:addElement( radialAlphaLarge )
	self.radialAlphaLarge = radialAlphaLarge
	
	return self
end

MenuBuilder.registerType( "WonderCardWidget", WonderCardWidget )
LockTable( _M )
