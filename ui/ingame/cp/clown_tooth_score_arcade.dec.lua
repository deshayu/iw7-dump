local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function PostLoadFunc( f1_arg0, f1_arg1 )
	f1_arg0:SetupInWorldElement( {} )
	f1_arg0:SetInWorldScale( 0.35 )
	f1_arg0:SetWorldSpacePosition( 3291.75, -473.15, 282.5 )
	f1_arg0:SetWorldSpaceYaw( 0 )
end

function clown_tooth_score_arcade( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 110 * _1080p, 0, 30 * _1080p )
	self.id = "clown_tooth_score_arcade"
	local f2_local1 = controller and controller.controllerIndex
	if not f2_local1 and not Engine.InFrontend() then
		f2_local1 = self:getRootController()
	end
	assert( f2_local1 )
	local f2_local2 = self
	local rider2score = nil
	
	rider2score = LUI.UIText.new()
	rider2score.id = "rider2score"
	rider2score:SetRGBFromTable( SWATCHES.HUD.highlight, 0 )
	rider2score:SetFontSize( 16 * _1080p )
	rider2score:SetFont( FONTS.GetFont( FONTS.Digital.File ) )
	rider2score:SetAlignment( LUI.Alignment.Center )
	rider2score:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -50, 0, _1080p * 17, _1080p * 33 )
	rider2score:BindAlphaToModel( DataSources.inGame.CP.zombies.clownToothArcadePower:GetModel( f2_local1 ) )
	rider2score:SubscribeToModel( DataSources.inGame.CP.zombies.clownToothArcadeScore:GetModel( f2_local1 ), function ()
		local f3_local0 = DataSources.inGame.CP.zombies.clownToothArcadeScore:GetValue( f2_local1 )
		if f3_local0 ~= nil then
			rider2score:setText( f3_local0, 0 )
		end
	end )
	self:addElement( rider2score )
	self.rider2score = rider2score
	
	local f2_local4 = nil
	if not Engine.InFrontend() then
		f2_local4 = LUI.UIText.new()
		f2_local4.id = "lblScore"
		f2_local4:SetRGBFromTable( SWATCHES.HUD.highlight, 0 )
		f2_local4:setText( "SCORE", 0 )
		f2_local4:SetFontSize( 14 * _1080p )
		f2_local4:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
		f2_local4:SetAlignment( LUI.Alignment.Center )
		f2_local4:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -50, 0, 0, _1080p * 14 )
		f2_local4:BindAlphaToModel( DataSources.inGame.CP.zombies.clownToothArcadePower:GetModel( f2_local1 ) )
		self:addElement( f2_local4 )
		self.lblScore = f2_local4
	end
	local f2_local5 = nil
	if not Engine.InFrontend() then
		f2_local5 = LUI.UIText.new()
		f2_local5.id = "lblScoreCopy0"
		f2_local5:SetRGBFromTable( SWATCHES.HUD.highlight, 0 )
		f2_local5:setText( "BALLS", 0 )
		f2_local5:SetFontSize( 14 * _1080p )
		f2_local5:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
		f2_local5:SetAlignment( LUI.Alignment.Center )
		f2_local5:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 50, 0, _1080p * 14 )
		f2_local5:BindAlphaToModel( DataSources.inGame.CP.zombies.clownToothArcadePower:GetModel( f2_local1 ) )
		self:addElement( f2_local5 )
		self.lblScoreCopy0 = f2_local5
	end
	local rider2scoreCopy0 = nil
	
	rider2scoreCopy0 = LUI.UIText.new()
	rider2scoreCopy0.id = "rider2scoreCopy0"
	rider2scoreCopy0:SetRGBFromTable( SWATCHES.HUD.highlight, 0 )
	rider2scoreCopy0:SetFontSize( 16 * _1080p )
	rider2scoreCopy0:SetFont( FONTS.GetFont( FONTS.Digital.File ) )
	rider2scoreCopy0:SetAlignment( LUI.Alignment.Center )
	rider2scoreCopy0:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -110, _1080p * -60, _1080p * 17, _1080p * 33 )
	rider2scoreCopy0:BindAlphaToModel( DataSources.inGame.CP.zombies.clownToothArcadePower:GetModel( f2_local1 ) )
	rider2scoreCopy0:SubscribeToModel( DataSources.inGame.CP.zombies.clownToothArcadeBalls:GetModel( f2_local1 ), function ()
		local f4_local0 = DataSources.inGame.CP.zombies.clownToothArcadeBalls:GetValue( f2_local1 )
		if f4_local0 ~= nil then
			rider2scoreCopy0:setText( f4_local0, 0 )
		end
	end )
	self:addElement( rider2scoreCopy0 )
	self.rider2scoreCopy0 = rider2scoreCopy0
	
	PostLoadFunc( self, f2_local1, controller )
	return self
end

MenuBuilder.registerType( "clown_tooth_score_arcade", clown_tooth_score_arcade )
LockTable( _M )
