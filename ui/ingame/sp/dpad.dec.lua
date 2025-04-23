local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ( f1_arg0, f1_arg1, f1_arg2 )
	local f1_local0 = assert
	local f1_local1 = f1_arg0.Quantity
	if f1_local1 then
		f1_local1 = f1_arg0.KeyLabel and f1_arg0.DPadUp
	end
	f1_local0( f1_local1, "WARNING: DPad Items Are Missing..." )
	f1_arg0.Quantity:SetShadowUOffset( -0 )
	f1_arg0.Quantity:SetShadowVOffset( -0 )
	f1_arg0.KeyLabel:SetShadowUOffset( -0 )
	f1_arg0.KeyLabel:SetShadowVOffset( -0 )
	f1_local0 = DataSources.inGame.SP.dPad.action1.alpha
	f1_local1 = function ()
		if Engine.IsConsoleGame() or Engine.GetProfileData( "gpadEnabled" ) then
			local f2_local0 = f1_local0:GetValue( f1_arg1 )
			if f2_local0 ~= nil then
				f1_arg0.DPadUp:SetAlpha( f2_local0, 0 )
			end
			f1_arg0.KeyLabel:SetAlpha( 0, 0 )
		else
			f1_arg0.KeyLabel:setText( Engine.GetKeyBindingLocalizedString( f1_arg1, "+actionslot 1", true ) )
			f1_arg0.KeyLabel:SetAlpha( 1, 0 )
			f1_arg0.DPadUp:SetAlpha( 0, 0 )
		end
	end
	
	f1_local1()
	f1_arg0:SubscribeToModel( f1_local0:GetModel( f1_arg1 ), f1_local1, true )
	f1_arg0:registerEventHandler( "empty_menu_stack", f1_local1 )
end

function DPad( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 64 * _1080p, 0, 64 * _1080p )
	self.id = "DPad"
	local f3_local1 = controller and controller.controllerIndex
	if not f3_local1 and not Engine.InFrontend() then
		f3_local1 = self:getRootController()
	end
	assert( f3_local1 )
	local f3_local2 = self
	local Background = nil
	
	Background = LUI.UIImage.new()
	Background.id = "Background"
	Background:SetRGBFromTable( SWATCHES.HUD.secondary, 0 )
	Background:SetAlpha( 0.2, 0 )
	Background:SetUseAA( true )
	Background:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * 1, _1080p * -1, _1080p * 1, _1080p * -1 )
	self:addElement( Background )
	self.Background = Background
	
	local Frame = nil
	
	Frame = LUI.UIImage.new()
	Frame.id = "Frame"
	Frame:SetRGBFromTable( SWATCHES.HUD.primary, 0 )
	Frame:setImage( RegisterMaterial( "hud_ability_frame" ), 0 )
	Frame:SetUseAA( true )
	self:addElement( Frame )
	self.Frame = Frame
	
	local DPadUp = nil
	
	DPadUp = LUI.UIImage.new()
	DPadUp.id = "DPadUp"
	DPadUp:SetRGBFromTable( SWATCHES.HUD.primary, 0 )
	DPadUp:SetAlpha( 0, 0 )
	DPadUp:SetZRotation( -180, 0 )
	DPadUp:setImage( RegisterMaterial( "hud_arrow" ), 0 )
	DPadUp:SetUseAA( true )
	DPadUp:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -8, _1080p * 8, _1080p * -16, 0 )
	self:addElement( DPadUp )
	self.DPadUp = DPadUp
	
	local ActionSlot = nil
	
	ActionSlot = LUI.UIImage.new()
	ActionSlot.id = "ActionSlot"
	ActionSlot:SetUseAA( true )
	ActionSlot:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -25, _1080p * 25, _1080p * -25, _1080p * 25 )
	ActionSlot:BindAlphaToModel( DataSources.inGame.SP.dPad.action1.alpha:GetModel( f3_local1 ) )
	ActionSlot:SubscribeToModel( DataSources.inGame.SP.dPad.action1.material:GetModel( f3_local1 ), function ()
		local f4_local0 = DataSources.inGame.SP.dPad.action1.material:GetValue( f3_local1 )
		if f4_local0 ~= nil then
			ActionSlot:setImage( RegisterMaterial( f4_local0 ), 0 )
		end
	end )
	self:addElement( ActionSlot )
	self.ActionSlot = ActionSlot
	
	local Quantity = nil
	
	Quantity = LUI.UIStyledText.new()
	Quantity.id = "Quantity"
	Quantity:SetRGBFromTable( SWATCHES.HUD.primary, 0 )
	Quantity:SetFontSize( 16 * _1080p )
	Quantity:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	Quantity:SetAlignment( LUI.Alignment.Center )
	Quantity:SetShadowMinDistance( -0.01, 0 )
	Quantity:SetShadowMaxDistance( 0.01, 0 )
	Quantity:SetShadowRGBFromInt( 0, 0 )
	Quantity:SetAnchorsAndPosition( 1, 0, 0.5, 0.5, 0, _1080p * 20, _1080p * -8, _1080p * 8 )
	Quantity:BindAlphaToModel( DataSources.inGame.SP.dPad.action1.ammoAlpha:GetModel( f3_local1 ) )
	Quantity:SubscribeToModel( DataSources.inGame.SP.dPad.action1.ammo:GetModel( f3_local1 ), function ()
		local f5_local0 = DataSources.inGame.SP.dPad.action1.ammo:GetValue( f3_local1 )
		if f5_local0 ~= nil then
			Quantity:setText( f5_local0, 0 )
		end
	end )
	self:addElement( Quantity )
	self.Quantity = Quantity
	
	local KeyLabel = nil
	
	KeyLabel = LUI.UIStyledText.new()
	KeyLabel.id = "KeyLabel"
	KeyLabel:SetRGBFromTable( SWATCHES.HUD.primary, 0 )
	KeyLabel:SetAlpha( 0, 0 )
	KeyLabel:setText( "", 0 )
	KeyLabel:SetFontSize( 16 * _1080p )
	KeyLabel:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	KeyLabel:SetAlignment( LUI.Alignment.Center )
	KeyLabel:SetShadowMinDistance( -0.01, 0 )
	KeyLabel:SetShadowMaxDistance( 0.01, 0 )
	KeyLabel:SetShadowRGBFromInt( 0, 0 )
	KeyLabel:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, _1080p * -16, 0 )
	self:addElement( KeyLabel )
	self.KeyLabel = KeyLabel
	
	f0_local0( self, f3_local1, controller )
	return self
end

MenuBuilder.registerType( "DPad", DPad )
LockTable( _M )
