local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function GhostArcadeScoresContainer( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 1920 * _1080p, 0, 1080 * _1080p )
	self.id = "GhostArcadeScoresContainer"
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local Stripe = nil
	
	Stripe = LUI.UIImage.new()
	Stripe.id = "Stripe"
	Stripe:SetRGBFromTable( SWATCHES.Zombies.menuHeader, 0 )
	Stripe:SetAlpha( 0.49, 0 )
	Stripe:SetZRotation( 12, 0 )
	Stripe:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -171, _1080p * 2168, _1080p * 372, _1080p * 586.5 )
	self:addElement( Stripe )
	self.Stripe = Stripe
	
	local Spinner = nil
	
	Spinner = LUI.UIImage.new()
	Spinner.id = "Spinner"
	Spinner:SetScale( -0.52, 0 )
	Spinner:setImage( RegisterMaterial( "zm_tix_arcane_spinner" ), 0 )
	Spinner:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 503, _1080p * 1407, _1080p * 48.98, _1080p * 952.98 )
	self:addElement( Spinner )
	self.Spinner = Spinner
	
	local PlayerCash = nil
	
	PlayerCash = MenuBuilder.BuildRegisteredType( "PlayerCash", {
		controllerIndex = f1_local1
	} )
	PlayerCash.id = "PlayerCash"
	PlayerCash:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 946, _1080p * 1074, _1080p * 628, _1080p * 791 )
	PlayerCash:BindAlphaToModel( DataSources.inGame.CP.zombies.ghostArcadeScoresAlpha:GetModel( f1_local1 ) )
	self:addElement( PlayerCash )
	self.PlayerCash = PlayerCash
	
	local PlayerIcon = nil
	
	PlayerIcon = LUI.UIImage.new()
	PlayerIcon.id = "PlayerIcon"
	PlayerIcon:SetZRotation( 12, 0 )
	PlayerIcon:SetScale( 0.53, 0 )
	PlayerIcon:setImage( RegisterMaterial( "zm_pc_score_main_plyr_1" ), 0 )
	PlayerIcon:SetUseAA( true )
	PlayerIcon:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 906.04, _1080p * 998.5, _1080p * 428.73, _1080p * 570.73 )
	self:addElement( PlayerIcon )
	self.PlayerIcon = PlayerIcon
	
	local box = nil
	
	box = LUI.UIImage.new()
	box.id = "box"
	box:SetAlpha( 0.5, 0 )
	box:SetZRotation( 12, 0 )
	box:setImage( RegisterMaterial( "zm_pc_score_bg" ), 0 )
	box:SetUseAA( true )
	box:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1041, _1080p * 1171.5, _1080p * 540, _1080p * 577.37 )
	self:addElement( box )
	self.box = box
	
	local MainPlayerScore = nil
	
	MainPlayerScore = LUI.UIText.new()
	MainPlayerScore.id = "MainPlayerScore"
	MainPlayerScore:SetZRotation( 12, 0 )
	MainPlayerScore:SetFontSize( 38 * _1080p )
	MainPlayerScore:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	MainPlayerScore:SetAlignment( LUI.Alignment.Center )
	MainPlayerScore:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1036, _1080p * 1166.5, _1080p * 540, _1080p * 577.37 )
	MainPlayerScore:SubscribeToModel( DataSources.inGame.CP.currentPlayerCash:GetModel( f1_local1 ), function ()
		local f2_local0 = DataSources.inGame.CP.currentPlayerCash:GetValue( f1_local1 )
		if f2_local0 ~= nil then
			MainPlayerScore:setText( f2_local0, 0 )
		end
	end )
	self:addElement( MainPlayerScore )
	self.MainPlayerScore = MainPlayerScore
	
	local youFailed = nil
	
	youFailed = LUI.UIText.new()
	youFailed.id = "youFailed"
	youFailed:SetZRotation( 12, 0 )
	youFailed:setText( ToUpperCase( Engine.Localize( "CP_ZMB_GHOST_YOU_FAILED" ) ), 0 )
	youFailed:SetFontSize( 86 * _1080p )
	youFailed:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	youFailed:SetAlignment( LUI.Alignment.Left )
	youFailed:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 768, _1080p * 1464, _1080p * 300.54, _1080p * 386.54 )
	youFailed:BindAlphaToModel( DataSources.inGame.CP.zombies.ghostArcadeYouFailedAlpha:GetModel( f1_local1 ) )
	self:addElement( youFailed )
	self.youFailed = youFailed
	
	local youWon = nil
	
	youWon = LUI.UIText.new()
	youWon.id = "youWon"
	youWon:SetZRotation( 12, 0 )
	youWon:setText( ToUpperCase( Engine.Localize( "CP_ZMB_GHOST_YOU_WON" ) ), 0 )
	youWon:SetFontSize( 86 * _1080p )
	youWon:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	youWon:SetAlignment( LUI.Alignment.Left )
	youWon:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 769, _1080p * 1401, _1080p * 311.04, _1080p * 397.04 )
	youWon:BindAlphaToModel( DataSources.inGame.CP.zombies.ghostArcadeYouWonAlpha:GetModel( f1_local1 ) )
	self:addElement( youWon )
	self.youWon = youWon
	
	return self
end

MenuBuilder.registerType( "GhostArcadeScoresContainer", GhostArcadeScoresContainer )
LockTable( _M )
