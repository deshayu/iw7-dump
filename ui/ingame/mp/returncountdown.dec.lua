local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function ReturnCountdown( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 456 * _1080p, 0, 220 * _1080p )
	self.id = "ReturnCountdown"
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local OutOfBoundsBackground = nil
	
	OutOfBoundsBackground = LUI.UIImage.new()
	OutOfBoundsBackground.id = "OutOfBoundsBackground"
	OutOfBoundsBackground:SetRGBFromInt( 0, 0 )
	self:addElement( OutOfBoundsBackground )
	self.OutOfBoundsBackground = OutOfBoundsBackground
	
	local WarningStripes = nil
	
	WarningStripes = LUI.UIImage.new()
	WarningStripes.id = "WarningStripes"
	WarningStripes:setImage( RegisterMaterial( "dropship_hud_integrity_box_1" ), 0 )
	WarningStripes:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * -160, _1080p * 160, _1080p * 47, _1080p * 188 )
	self:addElement( WarningStripes )
	self.WarningStripes = WarningStripes
	
	local WarningText = nil
	
	WarningText = LUI.UIText.new()
	WarningText.id = "WarningText"
	WarningText:SetRGBFromInt( 0, 0 )
	WarningText:setText( Engine.Localize( "GAME_WARNING" ), 0 )
	WarningText:SetFontSize( 80 * _1080p )
	WarningText:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	WarningText:SetAlignment( LUI.Alignment.Center )
	WarningText:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * -250, _1080p * 250, _1080p * 79.5, _1080p * 159.5 )
	self:addElement( WarningText )
	self.WarningText = WarningText
	
	local ReturnToCombatText = nil
	
	ReturnToCombatText = LUI.UIText.new()
	ReturnToCombatText.id = "ReturnToCombatText"
	ReturnToCombatText:setText( ToUpperCase( Engine.Localize( "MPUI_RETURN_TO_COMBAT_AREA" ) ), 0 )
	ReturnToCombatText:SetFontSize( 30 * _1080p )
	ReturnToCombatText:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	ReturnToCombatText:SetAlignment( LUI.Alignment.Center )
	ReturnToCombatText:SetAnchorsAndPosition( 0, 0, 1, 0, 0, 0, _1080p * -39, _1080p * -9 )
	self:addElement( ReturnToCombatText )
	self.ReturnToCombatText = ReturnToCombatText
	
	local CountdownElement = nil
	
	CountdownElement = MenuBuilder.BuildRegisteredType( "UICountdown", {
		controllerIndex = f1_local1
	} )
	CountdownElement.id = "CountdownElement"
	CountdownElement:SetFontSize( 48 * _1080p )
	CountdownElement:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	CountdownElement:SetAlignment( LUI.Alignment.Center )
	CountdownElement:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, _1080p * 6, _1080p * 54 )
	CountdownElement:SubscribeToModel( DataSources.inGame.MP.outOfBoundsCountdown:GetModel( f1_local1 ), function ()
		local f2_local0 = DataSources.inGame.MP.outOfBoundsCountdown:GetValue( f1_local1 )
		if f2_local0 ~= nil then
			CountdownElement:setEndTime( f2_local0 )
		end
	end )
	self:addElement( CountdownElement )
	self.CountdownElement = CountdownElement
	
	return self
end

MenuBuilder.registerType( "ReturnCountdown", ReturnCountdown )
LockTable( _M )
