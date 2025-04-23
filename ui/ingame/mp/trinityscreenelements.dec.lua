local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ( f1_arg0, f1_arg1, f1_arg2 )
	if f1_arg0.HintSteer and not Engine.IsConsoleGame() and Engine.IsGamepadEnabled() == 0 then
		f1_arg0.HintSteer:setText( Engine.Localize( "LUA_MENU_MP_PC_TRINITY_STEER" ), 0 )
	end
	if f1_arg0.HintFire then
		local f1_local0 = DataSources.inGame.MP.scorestreakHuds.trinityMissileCount
		f1_arg0:SubscribeToModel( f1_local0:GetModel( f1_arg1 ), function ()
			if f1_local0:GetValue( f1_arg1 ) == 0 then
				f1_arg0.HintFire:setText( Engine.Localize( "LUA_MENU_MP_TRINITY_BOOST" ), 0 )
			end
		end, true )
	end
	if GameX.IsSplitscreen() then
		assert( f1_arg0.Top01 )
		assert( f1_arg0.Top02 )
		assert( f1_arg0.Top03 )
		assert( f1_arg0.Top04 )
		assert( f1_arg0.Top05 )
		assert( f1_arg0.Bottom01 )
		assert( f1_arg0.Bottom02 )
		assert( f1_arg0.Bottom03 )
		assert( f1_arg0.Bottom04 )
		assert( f1_arg0.Bottom05 )
		f1_arg0.Top01:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -820, _1080p * -780, _1080p * 24, _1080p * 42 )
		f1_arg0.Top02:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -420, _1080p * -380, _1080p * 24, _1080p * 42 )
		f1_arg0.Top03:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -20, _1080p * 20, _1080p * 24, _1080p * 42 )
		f1_arg0.Top04:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * 380, _1080p * 420, _1080p * 24, _1080p * 42 )
		f1_arg0.Top05:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * 780, _1080p * 820, _1080p * 24, _1080p * 42 )
		f1_arg0.Bottom01:SetAnchorsAndPosition( 0.5, 0.5, 1, 0, _1080p * -820, _1080p * -780, _1080p * -42.5, _1080p * -24.5 )
		f1_arg0.Bottom02:SetAnchorsAndPosition( 0.5, 0.5, 1, 0, _1080p * -420, _1080p * -380, _1080p * -42.5, _1080p * -24.5 )
		f1_arg0.Bottom03:SetAnchorsAndPosition( 0.5, 0.5, 1, 0, _1080p * -20, _1080p * 20, _1080p * -42.5, _1080p * -24.5 )
		f1_arg0.Bottom04:SetAnchorsAndPosition( 0.5, 0.5, 1, 0, _1080p * 380, _1080p * 420, _1080p * -42.5, _1080p * -24.5 )
		f1_arg0.Bottom05:SetAnchorsAndPosition( 0.5, 0.5, 1, 0, _1080p * 780, _1080p * 820, _1080p * -42.5, _1080p * -24.5 )
	end
end

function TrinityScreenElements( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 1920 * _1080p, 0, 1080 * _1080p )
	self.id = "TrinityScreenElements"
	local f3_local1 = controller and controller.controllerIndex
	if not f3_local1 and not Engine.InFrontend() then
		f3_local1 = self:getRootController()
	end
	assert( f3_local1 )
	local f3_local2 = self
	local TopMeter = nil
	
	TopMeter = LUI.UIImage.new()
	TopMeter.id = "TopMeter"
	TopMeter:setImage( RegisterMaterial( "hud_trinity_meter_top" ), 0 )
	TopMeter:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -232, _1080p * 232, _1080p * 75, _1080p * 139 )
	self:addElement( TopMeter )
	self.TopMeter = TopMeter
	
	local BottomNotch = nil
	
	BottomNotch = LUI.UIImage.new()
	BottomNotch.id = "BottomNotch"
	BottomNotch:setImage( RegisterMaterial( "hud_trinity_bottom_notch" ), 0 )
	BottomNotch:SetAnchorsAndPosition( 0.5, 0.5, 1, 0, _1080p * -84, _1080p * 84, _1080p * -141, _1080p * -85 )
	self:addElement( BottomNotch )
	self.BottomNotch = BottomNotch
	
	local Top01 = nil
	
	Top01 = LUI.UIText.new()
	Top01.id = "Top01"
	Top01:setText( "01", 0 )
	Top01:SetFontSize( 18 * _1080p )
	Top01:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	Top01:SetAlignment( LUI.Alignment.Center )
	Top01:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -820, _1080p * -780, _1080p * 55, _1080p * 73 )
	self:addElement( Top01 )
	self.Top01 = Top01
	
	local Top02 = nil
	
	Top02 = LUI.UIText.new()
	Top02.id = "Top02"
	Top02:setText( "02", 0 )
	Top02:SetFontSize( 18 * _1080p )
	Top02:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	Top02:SetAlignment( LUI.Alignment.Center )
	Top02:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -420, _1080p * -380, _1080p * 55, _1080p * 73 )
	self:addElement( Top02 )
	self.Top02 = Top02
	
	local Top03 = nil
	
	Top03 = LUI.UIText.new()
	Top03.id = "Top03"
	Top03:setText( "03", 0 )
	Top03:SetFontSize( 18 * _1080p )
	Top03:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	Top03:SetAlignment( LUI.Alignment.Center )
	Top03:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -20, _1080p * 20, _1080p * 55, _1080p * 73 )
	self:addElement( Top03 )
	self.Top03 = Top03
	
	local Top04 = nil
	
	Top04 = LUI.UIText.new()
	Top04.id = "Top04"
	Top04:setText( "04", 0 )
	Top04:SetFontSize( 18 * _1080p )
	Top04:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	Top04:SetAlignment( LUI.Alignment.Center )
	Top04:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * 380, _1080p * 420, _1080p * 55, _1080p * 73 )
	self:addElement( Top04 )
	self.Top04 = Top04
	
	local Top05 = nil
	
	Top05 = LUI.UIText.new()
	Top05.id = "Top05"
	Top05:setText( "05", 0 )
	Top05:SetFontSize( 18 * _1080p )
	Top05:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	Top05:SetAlignment( LUI.Alignment.Center )
	Top05:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * 780, _1080p * 820, _1080p * 55, _1080p * 73 )
	self:addElement( Top05 )
	self.Top05 = Top05
	
	local Bottom01 = nil
	
	Bottom01 = LUI.UIText.new()
	Bottom01.id = "Bottom01"
	Bottom01:setText( "01", 0 )
	Bottom01:SetFontSize( 18 * _1080p )
	Bottom01:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	Bottom01:SetAlignment( LUI.Alignment.Center )
	Bottom01:SetAnchorsAndPosition( 0.5, 0.5, 1, 0, _1080p * -820, _1080p * -780, _1080p * -73, _1080p * -55 )
	self:addElement( Bottom01 )
	self.Bottom01 = Bottom01
	
	local Bottom02 = nil
	
	Bottom02 = LUI.UIText.new()
	Bottom02.id = "Bottom02"
	Bottom02:setText( "02", 0 )
	Bottom02:SetFontSize( 18 * _1080p )
	Bottom02:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	Bottom02:SetAlignment( LUI.Alignment.Center )
	Bottom02:SetAnchorsAndPosition( 0.5, 0.5, 1, 0, _1080p * -420, _1080p * -380, _1080p * -73, _1080p * -55 )
	self:addElement( Bottom02 )
	self.Bottom02 = Bottom02
	
	local Bottom03 = nil
	
	Bottom03 = LUI.UIText.new()
	Bottom03.id = "Bottom03"
	Bottom03:setText( "03", 0 )
	Bottom03:SetFontSize( 18 * _1080p )
	Bottom03:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	Bottom03:SetAlignment( LUI.Alignment.Center )
	Bottom03:SetAnchorsAndPosition( 0.5, 0.5, 1, 0, _1080p * -20, _1080p * 20, _1080p * -73, _1080p * -55 )
	self:addElement( Bottom03 )
	self.Bottom03 = Bottom03
	
	local Bottom04 = nil
	
	Bottom04 = LUI.UIText.new()
	Bottom04.id = "Bottom04"
	Bottom04:setText( "04", 0 )
	Bottom04:SetFontSize( 18 * _1080p )
	Bottom04:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	Bottom04:SetAlignment( LUI.Alignment.Center )
	Bottom04:SetAnchorsAndPosition( 0.5, 0.5, 1, 0, _1080p * 380, _1080p * 420, _1080p * -73, _1080p * -55 )
	self:addElement( Bottom04 )
	self.Bottom04 = Bottom04
	
	local Bottom05 = nil
	
	Bottom05 = LUI.UIText.new()
	Bottom05.id = "Bottom05"
	Bottom05:setText( "05", 0 )
	Bottom05:SetFontSize( 18 * _1080p )
	Bottom05:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	Bottom05:SetAlignment( LUI.Alignment.Center )
	Bottom05:SetAnchorsAndPosition( 0.5, 0.5, 1, 0, _1080p * 780, _1080p * 820, _1080p * -73, _1080p * -55 )
	self:addElement( Bottom05 )
	self.Bottom05 = Bottom05
	
	local CrossTL = nil
	
	CrossTL = LUI.UIImage.new()
	CrossTL.id = "CrossTL"
	CrossTL:setImage( RegisterMaterial( "hud_trinity_cross" ), 0 )
	CrossTL:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 100, _1080p * 130, _1080p * 70, _1080p * 100 )
	self:addElement( CrossTL )
	self.CrossTL = CrossTL
	
	local CrossTR = nil
	
	CrossTR = LUI.UIImage.new()
	CrossTR.id = "CrossTR"
	CrossTR:setImage( RegisterMaterial( "hud_trinity_cross" ), 0 )
	CrossTR:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -130, _1080p * -100, _1080p * 70, _1080p * 100 )
	self:addElement( CrossTR )
	self.CrossTR = CrossTR
	
	local CrossBR = nil
	
	CrossBR = LUI.UIImage.new()
	CrossBR.id = "CrossBR"
	CrossBR:setImage( RegisterMaterial( "hud_trinity_cross" ), 0 )
	CrossBR:SetAnchorsAndPosition( 1, 0, 1, 0, _1080p * -130, _1080p * -100, _1080p * -100, _1080p * -70 )
	self:addElement( CrossBR )
	self.CrossBR = CrossBR
	
	local CrossBL = nil
	
	CrossBL = LUI.UIImage.new()
	CrossBL.id = "CrossBL"
	CrossBL:setImage( RegisterMaterial( "hud_trinity_cross" ), 0 )
	CrossBL:SetAnchorsAndPosition( 0, 1, 1, 0, _1080p * 100, _1080p * 130, _1080p * -100, _1080p * -70 )
	self:addElement( CrossBL )
	self.CrossBL = CrossBL
	
	local HintBracketL = nil
	
	HintBracketL = LUI.UIBorder.new( {
		borderThicknessLeft = _1080p * 2,
		borderThicknessRight = _1080p * 0,
		borderThicknessTop = _1080p * 0,
		borderThicknessBottom = _1080p * 2
	} )
	HintBracketL.id = "HintBracketL"
	HintBracketL:SetBorderThicknessLeft( _1080p * 2, 0 )
	HintBracketL:SetBorderThicknessRight( _1080p * 0, 0 )
	HintBracketL:SetBorderThicknessTop( _1080p * 0, 0 )
	HintBracketL:SetBorderThicknessBottom( _1080p * 2, 0 )
	HintBracketL:SetAnchorsAndPosition( 0.5, 0.5, 1, 0, _1080p * -571, _1080p * -227, _1080p * -134, _1080p * -118 )
	self:addElement( HintBracketL )
	self.HintBracketL = HintBracketL
	
	local HintBracketR = nil
	
	HintBracketR = LUI.UIBorder.new( {
		borderThicknessLeft = _1080p * 0,
		borderThicknessRight = _1080p * 2,
		borderThicknessTop = _1080p * 0,
		borderThicknessBottom = _1080p * 2
	} )
	HintBracketR.id = "HintBracketR"
	HintBracketR:SetBorderThicknessLeft( _1080p * 0, 0 )
	HintBracketR:SetBorderThicknessRight( _1080p * 2, 0 )
	HintBracketR:SetBorderThicknessTop( _1080p * 0, 0 )
	HintBracketR:SetBorderThicknessBottom( _1080p * 2, 0 )
	HintBracketR:SetAnchorsAndPosition( 0.5, 0.5, 1, 0, _1080p * 227, _1080p * 571, _1080p * -134, _1080p * -118 )
	self:addElement( HintBracketR )
	self.HintBracketR = HintBracketR
	
	local HintBracketLineL = nil
	
	HintBracketLineL = LUI.UIImage.new()
	HintBracketLineL.id = "HintBracketLineL"
	HintBracketLineL:SetAnchorsAndPosition( 0.5, 0.5, 1, 0, _1080p * -585, _1080p * -581, _1080p * -134, _1080p * -118 )
	self:addElement( HintBracketLineL )
	self.HintBracketLineL = HintBracketLineL
	
	local HintBracketLineR = nil
	
	HintBracketLineR = LUI.UIImage.new()
	HintBracketLineR.id = "HintBracketLineR"
	HintBracketLineR:SetAnchorsAndPosition( 0.5, 0.5, 1, 0, _1080p * 581, _1080p * 585, _1080p * -134, _1080p * -118 )
	self:addElement( HintBracketLineR )
	self.HintBracketLineR = HintBracketLineR
	
	local f3_local23 = nil
	if not CONDITIONS.ShouldHideButtonPrompts( self ) then
		f3_local23 = LUI.UIText.new()
		f3_local23.id = "HintSteer"
		f3_local23:setText( Engine.Localize( "LUA_MENU_MP_TRINITY_STEER" ), 0 )
		f3_local23:SetFontSize( 28 * _1080p )
		f3_local23:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
		f3_local23:setTextStyle( CoD.TextStyle.Shadowed )
		f3_local23:SetAlignment( LUI.Alignment.Center )
		f3_local23:SetAnchorsAndPosition( 0.5, 0.5, 1, 0, _1080p * -567, _1080p * -223, _1080p * -194, _1080p * -166 )
		self:addElement( f3_local23 )
		self.HintSteer = f3_local23
	end
	local f3_local24 = nil
	if not CONDITIONS.ShouldHideButtonPrompts( self ) then
		f3_local24 = LUI.UIText.new()
		f3_local24.id = "HintFire"
		f3_local24:setText( Engine.Localize( "LUA_MENU_MP_TRINITY_FIRE" ), 0 )
		f3_local24:SetFontSize( 28 * _1080p )
		f3_local24:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
		f3_local24:setTextStyle( CoD.TextStyle.Shadowed )
		f3_local24:SetAlignment( LUI.Alignment.Center )
		f3_local24:SetOptOutRightToLeftAlignmentFlip( true )
		f3_local24:SetAnchorsAndPosition( 0.5, 0.5, 1, 0, _1080p * 223, _1080p * 567, _1080p * -194, _1080p * -166 )
		self:addElement( f3_local24 )
		self.HintFire = f3_local24
	end
	local TextTGT = nil
	
	TextTGT = LUI.UIText.new()
	TextTGT.id = "TextTGT"
	TextTGT:SetRGBFromTable( SWATCHES.HUD.active, 0 )
	TextTGT:setText( "TGT", 0 )
	TextTGT:SetFontSize( 24 * _1080p )
	TextTGT:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	TextTGT:SetAlignment( LUI.Alignment.Right )
	TextTGT:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -335, _1080p * -235, _1080p * 100, _1080p * 124 )
	self:addElement( TextTGT )
	self.TextTGT = TextTGT
	
	local TextWDE = nil
	
	TextWDE = LUI.UIText.new()
	TextWDE.id = "TextWDE"
	TextWDE:SetRGBFromTable( SWATCHES.HUD.active, 0 )
	TextWDE:setText( "WDE", 0 )
	TextWDE:SetFontSize( 24 * _1080p )
	TextWDE:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	TextWDE:SetAlignment( LUI.Alignment.Left )
	TextWDE:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * 235, _1080p * 335, _1080p * 100, _1080p * 124 )
	self:addElement( TextWDE )
	self.TextWDE = TextWDE
	
	local TextTGT20 = nil
	
	TextTGT20 = LUI.UIText.new()
	TextTGT20.id = "TextTGT20"
	TextTGT20:setText( "20.0", 0 )
	TextTGT20:SetFontSize( 18 * _1080p )
	TextTGT20:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	TextTGT20:SetAlignment( LUI.Alignment.Right )
	TextTGT20:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -335, _1080p * -235, _1080p * 130, _1080p * 148 )
	self:addElement( TextTGT20 )
	self.TextTGT20 = TextTGT20
	
	local TextWDE001 = nil
	
	TextWDE001 = LUI.UIText.new()
	TextWDE001.id = "TextWDE001"
	TextWDE001:setText( "001", 0 )
	TextWDE001:SetFontSize( 18 * _1080p )
	TextWDE001:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	TextWDE001:SetAlignment( LUI.Alignment.Left )
	TextWDE001:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * 235, _1080p * 335, _1080p * 130, _1080p * 148 )
	self:addElement( TextWDE001 )
	self.TextWDE001 = TextWDE001
	
	local SteerNum = nil
	
	SteerNum = LUI.UIText.new()
	SteerNum.id = "SteerNum"
	SteerNum:SetRGBFromTable( SWATCHES.HUD.active, 0 )
	SteerNum:setText( "000", 0 )
	SteerNum:SetFontSize( 20 * _1080p )
	SteerNum:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	SteerNum:SetAlignment( LUI.Alignment.Center )
	SteerNum:SetAnchorsAndPosition( 0.5, 0.5, 1, 0, _1080p * -634, _1080p * -534, _1080p * -110, _1080p * -90 )
	self:addElement( SteerNum )
	self.SteerNum = SteerNum
	
	local FireNum = nil
	
	FireNum = LUI.UIText.new()
	FireNum.id = "FireNum"
	FireNum:SetRGBFromTable( SWATCHES.HUD.active, 0 )
	FireNum:setText( "111", 0 )
	FireNum:SetFontSize( 20 * _1080p )
	FireNum:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	FireNum:SetAlignment( LUI.Alignment.Center )
	FireNum:SetAnchorsAndPosition( 0.5, 0.5, 1, 0, _1080p * 534, _1080p * 634, _1080p * -110, _1080p * -90 )
	self:addElement( FireNum )
	self.FireNum = FireNum
	
	f0_local0( self, f3_local1, controller )
	return self
end

MenuBuilder.registerType( "TrinityScreenElements", TrinityScreenElements )
LockTable( _M )
