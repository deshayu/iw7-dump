local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function PostLoadFunc( f1_arg0, f1_arg1 )
	f1_arg0:SetupInWorldElement( {} )
	f1_arg0:SetInWorldScale( 0.05 )
	local f1_local0 = function ( f2_arg0, f2_arg1 )
		f2_arg0:SetEntityNum( Game.GetOmnvar( "zm_ui_pi_ent" ) )
		f2_arg0:SetEntityTag( "tag_origin" )
		f2_arg0:SetFollowTagAngles( true )
		f2_arg0:SetTagSpacePosition( 0, 0, -3.75 )
		f2_arg0:SetTagSpaceYaw( -90 )
		f2_arg0:SetTagSpaceRoll( -90 )
	end
	
	f1_arg0:registerOmnvarHandler( "zm_ui_pi_ent", f1_local0 )
	f1_local0( f1_arg0, {} )
	f1_arg0.piValue:SetGlitchEnabled( true )
	f1_arg0.piValue:SetGlitchEnabled( false )
end

function constantPi( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 400 * _1080p, 0, 400 * _1080p )
	self.id = "constantPi"
	local f3_local1 = controller and controller.controllerIndex
	if not f3_local1 and not Engine.InFrontend() then
		f3_local1 = self:getRootController()
	end
	assert( f3_local1 )
	local f3_local2 = self
	local piIcon = nil
	
	piIcon = LUI.UIImage.new()
	piIcon.id = "piIcon"
	piIcon:SetRGBFromInt( 5006175, 0 )
	piIcon:SetAlpha( 0.5, 0 )
	piIcon:SetScale( 2.6, 0 )
	piIcon:setImage( RegisterMaterial( "cp_town_chem_pi_symbol" ), 0 )
	piIcon:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 136, _1080p * 264, _1080p * 247.16, _1080p * 375.16 )
	self:addElement( piIcon )
	self.piIcon = piIcon
	
	local piValue = nil
	
	piValue = LUI.UIText.new()
	piValue.id = "piValue"
	piValue:SetRGBFromInt( 3229764, 0 )
	piValue:SetAlpha( 0.05, 0 )
	piValue:SetScale( 1.24, 0 )
	piValue:SetFontSize( 105 * _1080p )
	piValue:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	piValue:SetAlignment( LUI.Alignment.Center )
	piValue:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 112, _1080p * 288, _1080p * 65.1, _1080p * 170.1 )
	piValue:SubscribeToModel( DataSources.inGame.CP.zombies.dlc3.constantPiValue:GetModel( f3_local1 ), function ()
		local f4_local0 = DataSources.inGame.CP.zombies.dlc3.constantPiValue:GetValue( f3_local1 )
		if f4_local0 ~= nil then
			piValue:setText( LocalizeString( f4_local0 ), 0 )
		end
	end )
	self:addElement( piValue )
	self.piValue = piValue
	
	local colorSquareEndGame = nil
	
	colorSquareEndGame = MenuBuilder.BuildRegisteredType( "colorSquareEndGame", {
		controllerIndex = f3_local1
	} )
	colorSquareEndGame.id = "colorSquareEndGame"
	colorSquareEndGame:SetScale( -0.2, 0 )
	colorSquareEndGame.downNum:SetAlpha( 0, 0 )
	colorSquareEndGame.downNum:setText( "1", 0 )
	colorSquareEndGame.leftNum:SetAlpha( 0, 0 )
	colorSquareEndGame.leftNum:setText( "1", 0 )
	colorSquareEndGame.upNum:setText( "5", 0 )
	colorSquareEndGame.rightNum:SetAlpha( 0, 0 )
	colorSquareEndGame.rightNum:setText( "1", 0 )
	colorSquareEndGame:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 8, _1080p * 408, _1080p * 8, _1080p * 408 )
	colorSquareEndGame:BindAlphaToModel( DataSources.inGame.CP.zombies.questsDLC1.jayQuestCompleteAlphaFilter:GetModel( f3_local1 ) )
	self:addElement( colorSquareEndGame )
	self.colorSquareEndGame = colorSquareEndGame
	
	PostLoadFunc( self, f3_local1, controller )
	return self
end

MenuBuilder.registerType( "constantPi", constantPi )
LockTable( _M )
