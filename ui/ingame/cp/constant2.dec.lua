local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function PostLoadFunc( f1_arg0, f1_arg1 )
	f1_arg0:SetupInWorldElement( {} )
	f1_arg0:SetInWorldScale( 0.2 )
	local f1_local0 = function ( f2_arg0, f2_arg1 )
		f2_arg0:SetEntityNum( Game.GetOmnvar( "zm_ui_constant_2_ent" ) )
		f2_arg0:SetEntityTag( "tag_origin" )
		f2_arg0:SetFollowTagAngles( true )
		f2_arg0:SetTagSpacePosition( 0, 0, 1 )
		f2_arg0:SetTagSpaceYaw( 180 )
		f2_arg0:SetTagSpaceRoll( -90 )
	end
	
	f1_arg0:registerOmnvarHandler( "zm_ui_constant_2_ent", f1_local0 )
	f1_local0( f1_arg0, {} )
end

function constant2( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 400 * _1080p, 0, 400 * _1080p )
	self.id = "constant2"
	local f3_local1 = controller and controller.controllerIndex
	if not f3_local1 and not Engine.InFrontend() then
		f3_local1 = self:getRootController()
	end
	assert( f3_local1 )
	local f3_local2 = self
	local constantWidget = nil
	
	constantWidget = MenuBuilder.BuildRegisteredType( "constantWidget", {
		controllerIndex = f3_local1
	} )
	constantWidget.id = "constantWidget"
	constantWidget.icon:SetRGBFromInt( 15651762, 0 )
	constantWidget.lineTop:SetRGBFromInt( 15651762, 0 )
	constantWidget.lineBottom:SetRGBFromInt( 15651762, 0 )
	constantWidget.number:SetRGBFromInt( 14598042, 0 )
	constantWidget.number:SetAlpha( 0.2, 0 )
	constantWidget.notEqual:SetRGBFromInt( 15651762, 0 )
	constantWidget:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 400, 0, _1080p * 400 )
	constantWidget:SubscribeToModel( DataSources.inGame.CP.zombies.dlc3.constantLoc2:GetModel( f3_local1 ), function ()
		local f4_local0 = DataSources.inGame.CP.zombies.dlc3.constantLoc2:GetValue( f3_local1 )
		if f4_local0 ~= nil then
			constantWidget.number:setText( f4_local0, 0 )
		end
	end )
	constantWidget.notEqual:BindAlphaToModel( DataSources.inGame.CP.zombies.dlc3.constant2BadAlphaFilter:GetModel( f3_local1 ) )
	self:addElement( constantWidget )
	self.constantWidget = constantWidget
	
	local colorSquareEndGame = nil
	
	colorSquareEndGame = MenuBuilder.BuildRegisteredType( "colorSquareEndGame", {
		controllerIndex = f3_local1
	} )
	colorSquareEndGame.id = "colorSquareEndGame"
	colorSquareEndGame.downNum:SetAlpha( 0, 0 )
	colorSquareEndGame.downNum:setText( "1", 0 )
	colorSquareEndGame.leftNum:SetAlpha( 0, 0 )
	colorSquareEndGame.leftNum:setText( "1", 0 )
	colorSquareEndGame.upNum:SetAlpha( 0, 0 )
	colorSquareEndGame.upNum:setText( "1", 0 )
	colorSquareEndGame.rightNum:setText( "2", 0 )
	colorSquareEndGame:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 400, 0, _1080p * 400 )
	colorSquareEndGame:BindAlphaToModel( DataSources.inGame.CP.zombies.questsDLC1.jayQuestCompleteAlphaFilter:GetModel( f3_local1 ) )
	self:addElement( colorSquareEndGame )
	self.colorSquareEndGame = colorSquareEndGame
	
	PostLoadFunc( self, f3_local1, controller )
	return self
end

MenuBuilder.registerType( "constant2", constant2 )
LockTable( _M )
