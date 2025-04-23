local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function PostLoadFunc( f1_arg0, f1_arg1 )
	f1_arg0:SetupInWorldElement( {} )
	f1_arg0:SetInWorldScale( 0.15 )
	f1_arg0:SetWorldSpacePosition( 3137, -1863, 196.5 )
	f1_arg0:SetWorldSpaceYaw( -90 )
end

function skeeballScoreboardArcade( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 466 * _1080p, 0, 100 * _1080p )
	self.id = "skeeballScoreboardArcade"
	local f2_local1 = controller and controller.controllerIndex
	if not f2_local1 and not Engine.InFrontend() then
		f2_local1 = self:getRootController()
	end
	assert( f2_local1 )
	local f2_local2 = self
	local curBalls = nil
	
	curBalls = LUI.UIText.new()
	curBalls.id = "curBalls"
	curBalls:SetRGBFromTable( SWATCHES.HUD.inactive, 0 )
	curBalls:SetFontSize( 24 * _1080p )
	curBalls:SetFont( FONTS.GetFont( FONTS.Digital.File ) )
	curBalls:SetAlignment( LUI.Alignment.Center )
	curBalls:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 48, _1080p * 281, _1080p * 45, _1080p * 69 )
	curBalls:BindAlphaToModel( DataSources.inGame.CP.zombies.skeeballArcadePower:GetModel( f2_local1 ) )
	curBalls:SubscribeToModel( DataSources.inGame.CP.zombies.arcadeSkeeballBalls:GetModel( f2_local1 ), function ()
		local f3_local0 = DataSources.inGame.CP.zombies.arcadeSkeeballBalls:GetValue( f2_local1 )
		if f3_local0 ~= nil then
			curBalls:setText( f3_local0, 0 )
		end
	end )
	self:addElement( curBalls )
	self.curBalls = curBalls
	
	local curScore = nil
	
	curScore = LUI.UIText.new()
	curScore.id = "curScore"
	curScore:SetRGBFromTable( SWATCHES.HUD.inactive, 0 )
	curScore:SetFontSize( 24 * _1080p )
	curScore:SetFont( FONTS.GetFont( FONTS.Digital.File ) )
	curScore:SetAlignment( LUI.Alignment.Center )
	curScore:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 226.5, _1080p * 456, _1080p * 45, _1080p * 69 )
	curScore:BindAlphaToModel( DataSources.inGame.CP.zombies.skeeballArcadePower:GetModel( f2_local1 ) )
	curScore:SubscribeToModel( DataSources.inGame.CP.zombies.arcadeSkeeballScore:GetModel( f2_local1 ), function ()
		local f4_local0 = DataSources.inGame.CP.zombies.arcadeSkeeballScore:GetValue( f2_local1 )
		if f4_local0 ~= nil then
			curScore:setText( f4_local0, 0 )
		end
	end )
	self:addElement( curScore )
	self.curScore = curScore
	
	PostLoadFunc( self, f2_local1, controller )
	return self
end

MenuBuilder.registerType( "skeeballScoreboardArcade", skeeballScoreboardArcade )
LockTable( _M )
