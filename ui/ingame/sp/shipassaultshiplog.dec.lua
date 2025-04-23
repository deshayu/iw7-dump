local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function BuildButtonBar( f1_arg0, f1_arg1 )
	local f1_local0 = MenuBuilder.BuildRegisteredType( "button_helper_text_main", {
		left_inset = 0,
		right_inset = -30,
		top_margin = 0,
		bottom_margin = 0,
		height = GenericFooterDims.Height,
		spacing = 30,
		background_alpha = 0,
		list_left_inset = 0
	} )
	f1_local0:registerAnimationState( "default", {
		left = 0,
		right = 0,
		top = 0,
		bottom = 0,
		leftAnchor = true,
		rightAnchor = true,
		topAnchor = true,
		bottomAnchor = true
	} )
	f1_local0:animateToState( "default" )
	f1_local0.id = "buttonHelperText"
	f1_arg0:addElement( f1_local0 )
end

function PostLoadFunc( f2_arg0, f2_arg1 )
	if f2_arg0.ButtonBar ~= nil then
		BuildButtonBar( f2_arg0.ButtonBar, f2_arg1 )
	end
	f2_arg0.PagedText:SetPageNumDisplayDatasource( DataSources.inGame.SP.shipLog.pageNumText )
end

function ShipAssaultShipLog( menu, controller )
	local self = LUI.UIElement.new()
	self.id = "ShipAssaultShipLog"
	local f3_local1 = controller and controller.controllerIndex
	if not f3_local1 and not Engine.InFrontend() then
		f3_local1 = self:getRootController()
	end
	assert( f3_local1 )
	self.soundSet = "shipLog"
	self:playSound( "menu_open" )
	local f3_local2 = self
	local Frame = nil
	
	Frame = LUI.UIImage.new()
	Frame.id = "Frame"
	Frame:setImage( RegisterMaterial( "ship_log_bg" ), 0 )
	Frame:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * 550, _1080p * -550, _1080p * 54, _1080p * -54 )
	self:addElement( Frame )
	self.Frame = Frame
	
	local ButtonBar = nil
	
	ButtonBar = LUI.UIText.new()
	ButtonBar.id = "ButtonBar"
	ButtonBar:setText( "", 0 )
	ButtonBar:SetFontSize( 55 * _1080p )
	ButtonBar:SetFont( FONTS.GetFont( FONTS.Dev.File ) )
	ButtonBar:SetAlignment( LUI.Alignment.Left )
	ButtonBar:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 685.86, _1080p * 1342, _1080p * 950.06, _1080p * 1018.28 )
	self:addElement( ButtonBar )
	self.ButtonBar = ButtonBar
	
	local PagedText = nil
	
	PagedText = LUI.UIPagedText.new()
	PagedText.id = "PagedText"
	PagedText:SetFontSize( 45 * _1080p )
	PagedText:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	PagedText:SetAlignment( LUI.Alignment.Left )
	PagedText:SetDecodeLetterLength( 25 )
	PagedText:SetDecodeMaxRandChars( 3 )
	PagedText:SetDecodeUpdatesPerLetter( 5 )
	PagedText:SetTextPageHeight( 585 * _1080p )
	PagedText:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 600, _1080p * 1320, _1080p * 317.96, _1080p * 351.96 )
	PagedText:SubscribeToModel( DataSources.inGame.SP.shipLog.text:GetModel( f3_local1 ), function ()
		local f4_local0 = DataSources.inGame.SP.shipLog.text:GetValue( f3_local1 )
		if f4_local0 ~= nil then
			PagedText:setText( LocalizeLongString( f4_local0 ), 0 )
		end
	end )
	self:addElement( PagedText )
	self.PagedText = PagedText
	
	local PageNumText = nil
	
	PageNumText = LUI.UIText.new()
	PageNumText.id = "PageNumText"
	PageNumText:SetRGBFromInt( 12829635, 0 )
	PageNumText:SetFontSize( 32 * _1080p )
	PageNumText:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	PageNumText:SetAlignment( LUI.Alignment.Center )
	PageNumText:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 710, _1080p * 1210, _1080p * 906.06, _1080p * 935.06 )
	PageNumText:SubscribeToModel( DataSources.inGame.SP.shipLog.pageNumText:GetModel( f3_local1 ), function ()
		local f5_local0 = DataSources.inGame.SP.shipLog.pageNumText:GetValue( f3_local1 )
		if f5_local0 ~= nil then
			PageNumText:setText( f5_local0, 0 )
		end
	end )
	self:addElement( PageNumText )
	self.PageNumText = PageNumText
	
	PagedText:addEventHandler( "next_page_success", function ( f6_arg0, f6_arg1 )
		local f6_local0 = f6_arg1.controller or f3_local1
		ACTIONS.PlaySoundSetSound( self, "nextPage", false )
		ACTIONS.StopSoundSetSound( self, "decodeText" )
		ACTIONS.PlaySoundSetSound( self, "decodeText", false )
	end )
	PagedText:addEventHandler( "prev_page_success", function ( f7_arg0, f7_arg1 )
		local f7_local0 = f7_arg1.controller or f3_local1
		ACTIONS.PlaySoundSetSound( self, "prevPage", false )
		ACTIONS.StopSoundSetSound( self, "decodeText" )
		ACTIONS.PlaySoundSetSound( self, "decodeText", false )
	end )
	self.addButtonHelperFunction = function ( f8_arg0, f8_arg1 )
		f8_arg0:AddButtonHelperText( {
			helper_text = Engine.Localize( "LUA_MENU_NEXT_PAGE" ),
			button_ref = "button_shoulderr",
			side = "right",
			priority = 1,
			clickable = true
		} )
		f8_arg0:AddButtonHelperText( {
			helper_text = Engine.Localize( "LUA_MENU_PREV_PAGE" ),
			button_ref = "button_shoulderl",
			side = "right",
			priority = 2,
			clickable = true
		} )
		f8_arg0:AddButtonHelperText( {
			helper_text = Engine.Localize( "MENU_EXIT" ),
			button_ref2 = "button_secondary",
			side = "right",
			clickable = true
		} )
	end
	
	self:addEventHandler( "menu_create", self.addButtonHelperFunction )
	
	local bindButton = LUI.UIBindButton.new()
	bindButton.id = "selfBindButton"
	self:addElement( bindButton )
	self.bindButton = bindButton
	
	self:addEventHandler( "menu_create", function ( f9_arg0, f9_arg1 )
		local f9_local0 = f9_arg1.controller or f3_local1
		ACTIONS.PlaySoundSetSound( self, "open", false )
		ACTIONS.AddBlur( self, "shipLogBlur", 5 )
		ACTIONS.PlaySoundSetSound( self, "decodeText", false )
	end )
	self.bindButton:addEventHandler( "button_shoulderr", function ( f10_arg0, f10_arg1 )
		local f10_local0 = f10_arg1.controller or f3_local1
		ACTIONS.NextPage( self )
	end )
	self.bindButton:addEventHandler( "button_shoulderl", function ( f11_arg0, f11_arg1 )
		local f11_local0 = f11_arg1.controller or f3_local1
		ACTIONS.PrevPage( self )
	end )
	self.bindButton:addEventHandler( "button_secondary", function ( f12_arg0, f12_arg1 )
		local f12_local0 = f12_arg1.controller or f3_local1
		ACTIONS.PlaySoundSetSound( self, "close", false )
		ACTIONS.LeaveMenu( self )
		ACTIONS.ScriptNotify( "shipLogClose", 1 )
		return true
	end )
	self:SubscribeToModel( DataSources.inGame.SP.shipLog.showShipLog:GetModel( f3_local1 ), function ()
		if DataSources.inGame.SP.shipLog.showShipLog:GetValue( f3_local1 ) ~= nil and DataSources.inGame.SP.shipLog.showShipLog:GetValue( f3_local1 ) == false then
			ACTIONS.PlaySoundSetSound( self, "close", false )
			ACTIONS.LeaveMenu( self )
			ACTIONS.ScriptNotify( "shipLogClose", 1 )
		end
	end )
	PostLoadFunc( self, f3_local1, controller )
	return self
end

MenuBuilder.registerType( "ShipAssaultShipLog", ShipAssaultShipLog )
LockTable( _M )
