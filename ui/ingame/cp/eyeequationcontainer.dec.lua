local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function PostLoadFunc( f1_arg0, f1_arg1 )
	f1_arg0:SetupInWorldElement( {} )
	f1_arg0:SetInWorldScale( 0.05 )
	local f1_local0 = function ( f2_arg0, f2_arg1 )
		local f2_local0 = Game.GetOmnvar( "zm_ui_eye_equation_ent" )
		f2_arg0:SetEntityNum( f2_local0 )
		f2_arg0:SetEntityTag( "tag_origin" )
		f2_arg0:SetFollowTagAngles( true )
		f2_arg0:SetTagSpacePosition( 0, 25, 0 )
		f2_arg0:SetTagSpaceYaw( 0 )
		f2_arg0:SetTagSpaceRoll( -90 )
		f2_arg0:SetTagSpacePitch( 2.5 )
		DebugPrint( "OINK " .. f2_local0 )
	end
	
	f1_arg0:registerOmnvarHandler( "zm_ui_eye_equation_ent", f1_local0 )
	f1_local0( f1_arg0, {} )
end

function eyeEquationContainer( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 1000 * _1080p, 0, 1000 * _1080p )
	self.id = "eyeEquationContainer"
	local f3_local1 = controller and controller.controllerIndex
	if not f3_local1 and not Engine.InFrontend() then
		f3_local1 = self:getRootController()
	end
	assert( f3_local1 )
	local f3_local2 = self
	local eyeEquation = nil
	
	eyeEquation = MenuBuilder.BuildRegisteredType( "eyeEquation", {
		controllerIndex = f3_local1
	} )
	eyeEquation.id = "eyeEquation"
	eyeEquation:SetScale( 3, 0 )
	eyeEquation:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1316, _1080p * 1716, _1080p * -917, _1080p * -517 )
	self:addElement( eyeEquation )
	self.eyeEquation = eyeEquation
	
	local colorSquareEndGame = nil
	
	colorSquareEndGame = MenuBuilder.BuildRegisteredType( "colorSquareEndGame", {
		controllerIndex = f3_local1
	} )
	colorSquareEndGame.id = "colorSquareEndGame"
	colorSquareEndGame:SetScale( 0.5, 0 )
	colorSquareEndGame.downNum:SetAlpha( 0, 0 )
	colorSquareEndGame.downNum:setText( "1", 0 )
	colorSquareEndGame.leftNum:SetAlpha( 0, 0 )
	colorSquareEndGame.leftNum:setText( "1", 0 )
	colorSquareEndGame.upNum:SetAlpha( 0, 0 )
	colorSquareEndGame.upNum:setText( "1", 0 )
	colorSquareEndGame.rightNum:setText( "6", 0 )
	colorSquareEndGame:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1366, _1080p * 1766, _1080p * -873, _1080p * -473 )
	colorSquareEndGame:BindAlphaToModel( DataSources.inGame.CP.zombies.questsDLC1.jayQuestCompleteAlphaFilter:GetModel( f3_local1 ) )
	self:addElement( colorSquareEndGame )
	self.colorSquareEndGame = colorSquareEndGame
	
	PostLoadFunc( self, f3_local1, controller )
	return self
end

MenuBuilder.registerType( "eyeEquationContainer", eyeEquationContainer )
LockTable( _M )
