local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function PostLoadFunc( f1_arg0, f1_arg1, f1_arg2 )
	assert( f1_arg0.Text )
	local f1_local0 = DataSources.inGame.MP.splashes.miscMessages.text
	local f1_local1 = 30
	local f1_local2 = 22 * _1080p
	local f1_local3 = FONTS.GetFont( FONTS.MainMedium.File )
	local f1_local4 = 1
	local f1_local5 = f1_arg0.Icon
	local f1_local6 = f1_arg0.BGBlur
	local f1_local7 = f1_arg0.Border
	local f1_local8 = 5
	local f1_local9 = function ()
		local f2_local0, f2_local1, f2_local2, f2_local3 = GetTextDimensions( f1_local0:GetValue( f1_arg1 ), f1_local3, f1_local2 )
		local f2_local4 = f2_local2 - f2_local0 + f1_local1 + f1_local8 * 2
		f1_local6:SetLeft( -f2_local4 )
		f1_local6:SetRight( f1_local8, 0 )
		f1_local7:SetLeft( -f2_local4 - f1_local4 )
		f1_local7:SetRight( f1_local8, 0 )
	end
	
	f1_arg0:SubscribeToModel( f1_local0:GetModel( f1_arg1 ), f1_local9 )
	f1_arg0:SubscribeToModel( DataSources.inGame.MP.splashes.miscMessages.showMessage:GetModel( f1_arg1 ), f1_local9 )
end

function MiscMessages( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 400 * _1080p, 0, 42 * _1080p )
	self.id = "MiscMessages"
	local f3_local1 = controller and controller.controllerIndex
	if not f3_local1 and not Engine.InFrontend() then
		f3_local1 = self:getRootController()
	end
	assert( f3_local1 )
	local f3_local2 = self
	local BGBlur = nil
	
	BGBlur = LUI.UIBlur.new()
	BGBlur.id = "BGBlur"
	BGBlur:SetRGBFromInt( 14277081, 0 )
	BGBlur:SetBlurStrength( 0.75, 0 )
	BGBlur:SetAnchorsAndPosition( 1, 0, 0, 0, _1080p * -400, 0, 0, 0 )
	self:addElement( BGBlur )
	self.BGBlur = BGBlur
	
	local Text = nil
	
	Text = LUI.UIText.new()
	Text.id = "Text"
	Text:SetFontSize( 22 * _1080p )
	Text:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	Text:setTextStyle( CoD.TextStyle.Shadowed )
	Text:SetAlignment( LUI.Alignment.Right )
	Text:SetAnchorsAndPosition( 1, 0, 0.5, 0.5, _1080p * -406, _1080p * -42, _1080p * -11, _1080p * 11 )
	Text:SubscribeToModel( DataSources.inGame.MP.splashes.miscMessages.text:GetModel( f3_local1 ), function ()
		local f4_local0 = DataSources.inGame.MP.splashes.miscMessages.text:GetValue( f3_local1 )
		if f4_local0 ~= nil then
			Text:setText( f4_local0, 0 )
		end
	end )
	self:addElement( Text )
	self.Text = Text
	
	local Icon = nil
	
	Icon = LUI.UIImage.new()
	Icon.id = "Icon"
	Icon:SetUseAA( true )
	Icon:SetAnchorsAndPosition( 1, 0, 0, 0, _1080p * -38, _1080p * -2, _1080p * 2, _1080p * -4 )
	Icon:BindAlphaToModel( DataSources.inGame.MP.splashes.miscMessages.iconAlpha:GetModel( f3_local1 ) )
	Icon:SubscribeToModel( DataSources.inGame.MP.splashes.miscMessages.icon:GetModel( f3_local1 ), function ()
		local f5_local0 = DataSources.inGame.MP.splashes.miscMessages.icon:GetValue( f3_local1 )
		if f5_local0 ~= nil then
			Icon:setImage( RegisterMaterial( f5_local0 ), 0 )
		end
	end )
	self:addElement( Icon )
	self.Icon = Icon
	
	local Border = nil
	
	Border = LUI.UIBorder.new( {
		borderThicknessLeft = _1080p * 1,
		borderThicknessRight = _1080p * 1,
		borderThicknessTop = _1080p * 1,
		borderThicknessBottom = _1080p * 1
	} )
	Border.id = "Border"
	Border:SetAnchorsAndPosition( 1, 0, 0, 0, _1080p * -401, _1080p * -1, _1080p * -1, _1080p * -1 )
	self:addElement( Border )
	self.Border = Border
	
	PostLoadFunc( self, f3_local1, controller )
	return self
end

MenuBuilder.registerType( "MiscMessages", MiscMessages )
LockTable( _M )
