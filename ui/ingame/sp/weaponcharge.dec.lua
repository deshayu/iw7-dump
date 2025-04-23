local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function PostLoadFunc( f1_arg0, f1_arg1 )
	assert( f1_arg0.Text, "WARNING: Weapon Charge Items Are Missing..." )
	f1_arg0.Text:SetShadowUOffset( -0 )
	f1_arg0.Text:SetShadowVOffset( -0 )
	local f1_local0 = DataSources.inGame.player.currentWeapon.canCharge:GetModel( f1_arg1 )
	f1_arg0:SubscribeToModel( f1_local0, function ()
		if DataModel.GetModelValue( f1_local0 ) then
			f1_arg0:SetAlpha( 1, 100, LUI.EASING.inOutQuadratic )
		else
			f1_arg0:SetAlpha( 0, 100, LUI.EASING.inOutQuadratic )
		end
	end )
	local f1_local1 = DataSources.inGame.player.currentWeapon.charge:GetModel( f1_arg1 )
	f1_arg0:SubscribeToModel( f1_local1, function ()
		f1_arg0.Fill:SetLeftAnchor( 1 - DataModel.GetModelValue( f1_local1 ) )
	end )
end

function WeaponCharge( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 200 * _1080p, 0, 35 * _1080p )
	self.id = "WeaponCharge"
	local f4_local1 = controller and controller.controllerIndex
	if not f4_local1 and not Engine.InFrontend() then
		f4_local1 = self:getRootController()
	end
	assert( f4_local1 )
	local f4_local2 = self
	local Background = nil
	
	Background = LUI.UIImage.new()
	Background.id = "Background"
	Background:SetRGBFromInt( 0, 0 )
	Background:SetAlpha( 0.65, 0 )
	Background:SetAnchorsAndPosition( 0, 0, 1, 0, 0, 0, _1080p * -10, 0 )
	self:addElement( Background )
	self.Background = Background
	
	local Fill = nil
	
	Fill = LUI.UIImage.new()
	Fill.id = "Fill"
	Fill:SetRGBFromTable( SWATCHES.HUD.contested, 0 )
	Fill:SetUseAA( true )
	Fill:SetAnchorsAndPosition( 0, 1, 1, 0, 0, _1080p * 200, _1080p * -10, 0 )
	self:addElement( Fill )
	self.Fill = Fill
	
	local Highlight = nil
	
	Highlight = LUI.UIImage.new()
	Highlight.id = "Highlight"
	Highlight:SetRGBFromTable( SWATCHES.HUD.enabled, 0 )
	Highlight:SetAlpha( 0.25, 0 )
	Highlight:setImage( RegisterMaterial( "icon_ability_highlight" ), 0 )
	Highlight:SetUseAA( true )
	Highlight:SetAnchorsAndPosition( 0, 0, 1, 0, _1080p * -96, _1080p * 104, _1080p * -16, _1080p * 8 )
	self:addElement( Highlight )
	self.Highlight = Highlight
	
	local Border = nil
	
	Border = LUI.UIBorder.new( {
		borderThicknessLeft = _1080p * 2,
		borderThicknessRight = _1080p * 2,
		borderThicknessTop = _1080p * 0,
		borderThicknessBottom = _1080p * 2
	} )
	Border.id = "Border"
	Border:SetBorderThicknessLeft( _1080p * 2, 0 )
	Border:SetBorderThicknessRight( _1080p * 2, 0 )
	Border:SetBorderThicknessTop( _1080p * 0, 0 )
	Border:SetBorderThicknessBottom( _1080p * 2, 0 )
	Border:SetAnchorsAndPosition( 0, 0, 1, 0, 0, 0, _1080p * -10, 0 )
	self:addElement( Border )
	self.Border = Border
	
	local Text = nil
	
	Text = LUI.UIStyledText.new()
	Text.id = "Text"
	Text:SetRGBFromTable( SWATCHES.HUD.primary, 0 )
	Text:setText( ToUpperCase( Engine.Localize( "WEAPON_CHARGE" ) ), 0 )
	Text:SetFontSize( 20 * _1080p )
	Text:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	Text:SetAlignment( LUI.Alignment.Right )
	Text:SetShadowMinDistance( -0.01, 0 )
	Text:SetShadowMaxDistance( 0.01, 0 )
	Text:SetShadowRGBFromInt( 0, 0 )
	Text:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -500, 0, 0, _1080p * 20 )
	self:addElement( Text )
	self.Text = Text
	
	PostLoadFunc( self, f4_local1, controller )
	return self
end

MenuBuilder.registerType( "WeaponCharge", WeaponCharge )
LockTable( _M )
