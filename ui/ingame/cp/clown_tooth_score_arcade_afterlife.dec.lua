local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function PostLoadFunc( f1_arg0, f1_arg1 )
	f1_arg0:SetupInWorldElement( {} )
	f1_arg0:SetInWorldScale( 0.35 )
	if Engine.GetDvarString( "ui_mapname" ) == "cp_final" then
		f1_arg0:SetWorldSpacePosition( 2479.75, -4439, 374 )
	else
		f1_arg0:SetWorldSpacePosition( -9472.12, 25.75, -1754 )
	end
	f1_arg0:SetWorldSpaceYaw( -90 )
	f1_arg0.rider2score:SubscribeToModel( DataSources.inGame.CP.zombies.clownToothAfterlifeArcadeScore:GetModel( f1_arg1 ), function ( f2_arg0 )
		local f2_local0 = DataModel.GetModelValue( f2_arg0 )
		if f2_local0 ~= nil then
			f1_arg0.lblScore:setText( Engine.MarkLocalized( "SOUL PWR" ), 0 )
			f1_arg0.rider2score:setText( f2_local0, 0 )
		end
	end )
	f1_arg0.rider2scoreCopy0:SubscribeToModel( DataSources.inGame.CP.zombies.clownToothAfterlifeBalls:GetModel( f1_arg1 ), function ( f3_arg0 )
		local f3_local0 = DataModel.GetModelValue( f3_arg0 )
		if f3_local0 ~= nil then
			f1_arg0.lblScoreCopy0:setText( Engine.MarkLocalized( "BALLS" ), 0 )
			f1_arg0.rider2scoreCopy0:setText( f3_local0, 0 )
		end
	end )
end

function clown_tooth_score_arcade_afterlife( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 115 * _1080p, 0, 50 * _1080p )
	self.id = "clown_tooth_score_arcade_afterlife"
	local f4_local1 = controller and controller.controllerIndex
	if not f4_local1 and not Engine.InFrontend() then
		f4_local1 = self:getRootController()
	end
	assert( f4_local1 )
	local f4_local2 = self
	local rider2score = nil
	
	rider2score = LUI.UIText.new()
	rider2score.id = "rider2score"
	rider2score:SetRGBFromTable( SWATCHES.HUD.highlight, 0 )
	rider2score:setText( "0", 0 )
	rider2score:SetFontSize( 16 * _1080p )
	rider2score:SetFont( FONTS.GetFont( FONTS.Digital.File ) )
	rider2score:SetAlignment( LUI.Alignment.Center )
	rider2score:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -54, _1080p * 6, _1080p * 31, _1080p * 47 )
	self:addElement( rider2score )
	self.rider2score = rider2score
	
	local f4_local4 = nil
	if not Engine.InFrontend() then
		f4_local4 = LUI.UIText.new()
		f4_local4.id = "lblScore"
		f4_local4:SetRGBFromTable( SWATCHES.HUD.highlight, 0 )
		f4_local4:setText( "SOUL PWR", 0 )
		f4_local4:SetFontSize( 10 * _1080p )
		f4_local4:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
		f4_local4:SetAlignment( LUI.Alignment.Center )
		f4_local4:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -54, _1080p * 6, _1080p * 14, _1080p * 24 )
		self:addElement( f4_local4 )
		self.lblScore = f4_local4
	end
	local f4_local5 = nil
	if not Engine.InFrontend() then
		f4_local5 = LUI.UIText.new()
		f4_local5.id = "lblScoreCopy0"
		f4_local5:SetRGBFromTable( SWATCHES.HUD.highlight, 0 )
		f4_local5:setText( "BALLS", 0 )
		f4_local5:SetFontSize( 10 * _1080p )
		f4_local5:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
		f4_local5:SetAlignment( LUI.Alignment.Center )
		f4_local5:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1, _1080p * 56, _1080p * 14, _1080p * 24 )
		self:addElement( f4_local5 )
		self.lblScoreCopy0 = f4_local5
	end
	local rider2scoreCopy0 = nil
	
	rider2scoreCopy0 = LUI.UIText.new()
	rider2scoreCopy0.id = "rider2scoreCopy0"
	rider2scoreCopy0:SetRGBFromTable( SWATCHES.HUD.highlight, 0 )
	rider2scoreCopy0:setText( "0", 0 )
	rider2scoreCopy0:SetFontSize( 16 * _1080p )
	rider2scoreCopy0:SetFont( FONTS.GetFont( FONTS.Digital.File ) )
	rider2scoreCopy0:SetAlignment( LUI.Alignment.Center )
	rider2scoreCopy0:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1, _1080p * 56, _1080p * 31, _1080p * 47 )
	self:addElement( rider2scoreCopy0 )
	self.rider2scoreCopy0 = rider2scoreCopy0
	
	PostLoadFunc( self, f4_local1, controller )
	return self
end

MenuBuilder.registerType( "clown_tooth_score_arcade_afterlife", clown_tooth_score_arcade_afterlife )
LockTable( _M )
