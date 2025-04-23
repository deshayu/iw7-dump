local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function PostLoadFunc( f1_arg0, f1_arg1 )
	f1_arg0:SetupInWorldElement( {} )
	f1_arg0:SetInWorldScale( 0.15 )
	if Engine.GetDvarString( "ui_mapname" ) == "cp_final" then
		f1_arg0:SetWorldSpacePosition( 2523, -4773.5, 415.5 )
	else
		f1_arg0:SetWorldSpacePosition( -9429, -309, -1712 )
	end
	f1_arg0:SetWorldSpaceYaw( -90 )
end

function skeeballScoreboardAfterlife( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 466 * _1080p, 0, 100 * _1080p )
	self.id = "skeeballScoreboardAfterlife"
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
	curBalls:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 50, _1080p * 283, _1080p * 45, _1080p * 69 )
	curBalls:SubscribeToModel( DataSources.inGame.CP.zombies.afterlifeArcadeSkeeballBalls:GetModel( f2_local1 ), function ()
		local f3_local0 = DataSources.inGame.CP.zombies.afterlifeArcadeSkeeballBalls:GetValue( f2_local1 )
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
	curScore:SubscribeToModel( DataSources.inGame.CP.zombies.afterlifeArcadeSkeeballScore:GetModel( f2_local1 ), function ()
		local f4_local0 = DataSources.inGame.CP.zombies.afterlifeArcadeSkeeballScore:GetValue( f2_local1 )
		if f4_local0 ~= nil then
			curScore:setText( f4_local0, 0 )
		end
	end )
	self:addElement( curScore )
	self.curScore = curScore
	
	PostLoadFunc( self, f2_local1, controller )
	return self
end

MenuBuilder.registerType( "skeeballScoreboardAfterlife", skeeballScoreboardAfterlife )
LockTable( _M )
