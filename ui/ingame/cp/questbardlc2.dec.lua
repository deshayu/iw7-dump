local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function questBarDLC2( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 1018 * _1080p, 0, 300 * _1080p )
	self.id = "questBarDLC2"
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local newspaper = nil
	
	newspaper = LUI.UIImage.new()
	newspaper.id = "newspaper"
	newspaper:setImage( RegisterMaterial( "cp_disco_inventory_newspaper_bg" ), 0 )
	newspaper:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 1024, _1080p * -212, _1080p * 300 )
	self:addElement( newspaper )
	self.newspaper = newspaper
	
	local questPAPDLC2 = nil
	
	questPAPDLC2 = MenuBuilder.BuildRegisteredType( "questPAPDLC2", {
		controllerIndex = f1_local1
	} )
	questPAPDLC2.id = "questPAPDLC2"
	questPAPDLC2.newspaper:SetAlpha( 0, 0 )
	questPAPDLC2:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 209, _1080p * 45, _1080p * 300 )
	self:addElement( questPAPDLC2 )
	self.questPAPDLC2 = questPAPDLC2
	
	local questHeartDLC2 = nil
	
	questHeartDLC2 = MenuBuilder.BuildRegisteredType( "questHeartDLC2", {
		controllerIndex = f1_local1
	} )
	questHeartDLC2.id = "questHeartDLC2"
	questHeartDLC2.newspaper:SetAlpha( 0, 0 )
	questHeartDLC2:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 209, _1080p * 45, _1080p * 300 )
	self:addElement( questHeartDLC2 )
	self.questHeartDLC2 = questHeartDLC2
	
	local questBrainDLC2 = nil
	
	questBrainDLC2 = MenuBuilder.BuildRegisteredType( "questBrainDLC2", {
		controllerIndex = f1_local1
	} )
	questBrainDLC2.id = "questBrainDLC2"
	questBrainDLC2.newspaper:SetAlpha( 0, 0 )
	questBrainDLC2:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 209, _1080p * 45, _1080p * 300 )
	self:addElement( questBrainDLC2 )
	self.questBrainDLC2 = questBrainDLC2
	
	local questEyeDLC2 = nil
	
	questEyeDLC2 = MenuBuilder.BuildRegisteredType( "questEyeDLC2", {
		controllerIndex = f1_local1
	} )
	questEyeDLC2.id = "questEyeDLC2"
	questEyeDLC2.newspaper:SetAlpha( 0, 0 )
	questEyeDLC2:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 209, _1080p * 45, _1080p * 299 )
	self:addElement( questEyeDLC2 )
	self.questEyeDLC2 = questEyeDLC2
	
	return self
end

MenuBuilder.registerType( "questBarDLC2", questBarDLC2 )
LockTable( _M )
