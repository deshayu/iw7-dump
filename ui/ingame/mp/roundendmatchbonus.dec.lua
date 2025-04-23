local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function RoundEndMatchBonus( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 400 * _1080p, 0, 112 * _1080p )
	self.id = "RoundEndMatchBonus"
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local Left = nil
	
	Left = LUI.UIImage.new()
	Left.id = "Left"
	Left:SetRGBFromInt( 0, 0 )
	Left:SetAlpha( 0.5, 0 )
	Left:setImage( RegisterMaterial( "widg_gradient_right_to_left" ), 0 )
	Left:SetUseAA( true )
	Left:SetAnchorsAndPosition( 0, 1, 0, 0, 0, _1080p * 200, 0, 0 )
	self:addElement( Left )
	self.Left = Left
	
	local Right = nil
	
	Right = LUI.UIImage.new()
	Right.id = "Right"
	Right:SetRGBFromInt( 0, 0 )
	Right:SetAlpha( 0.5, 0 )
	Right:setImage( RegisterMaterial( "widg_gradient_left_to_right" ), 0 )
	Right:SetUseAA( true )
	Right:SetAnchorsAndPosition( 1, 0, 0, 0, _1080p * -200, 0, 0, 0 )
	self:addElement( Right )
	self.Right = Right
	
	local MatchBonusValueText = nil
	
	MatchBonusValueText = LUI.UIText.new()
	MatchBonusValueText.id = "MatchBonusValueText"
	MatchBonusValueText:SetFontSize( 36 * _1080p )
	MatchBonusValueText:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	MatchBonusValueText:SetAlignment( LUI.Alignment.Center )
	MatchBonusValueText:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, _1080p * 56, _1080p * 92 )
	MatchBonusValueText:SubscribeToModel( DataSources.inGame.MP.roundEnd.roundEndMatchBonus:GetModel( f1_local1 ), function ()
		local f2_local0 = DataSources.inGame.MP.roundEnd.roundEndMatchBonus:GetValue( f1_local1 )
		if f2_local0 ~= nil then
			MatchBonusValueText:setText( f2_local0, 0 )
		end
	end )
	self:addElement( MatchBonusValueText )
	self.MatchBonusValueText = MatchBonusValueText
	
	local MatchBonusTitleText = nil
	
	MatchBonusTitleText = LUI.UIText.new()
	MatchBonusTitleText.id = "MatchBonusTitleText"
	MatchBonusTitleText:SetRGBFromTable( SWATCHES.Scoreboard.grayText, 0 )
	MatchBonusTitleText:setText( ToUpperCase( Engine.Localize( "LUA_MENU_MATCH_BONUS" ) ), 0 )
	MatchBonusTitleText:SetFontSize( 30 * _1080p )
	MatchBonusTitleText:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	MatchBonusTitleText:SetAlignment( LUI.Alignment.Center )
	MatchBonusTitleText:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, _1080p * 17, _1080p * 47 )
	self:addElement( MatchBonusTitleText )
	self.MatchBonusTitleText = MatchBonusTitleText
	
	return self
end

MenuBuilder.registerType( "RoundEndMatchBonus", RoundEndMatchBonus )
LockTable( _M )
