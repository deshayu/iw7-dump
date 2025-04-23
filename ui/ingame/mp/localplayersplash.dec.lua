local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function PostLoadFunc( f1_arg0, f1_arg1 )
	local f1_local0 = f1_arg0.Header
	f1_local0:SetShadowMinDistance( -0.2, 0 )
	f1_local0:SetShadowMaxDistance( 0.2, 0 )
	f1_local0:SetShadowRGBFromInt( 0, 0 )
	f1_local0:SetShadowUOffset( -0 )
	f1_local0:SetShadowVOffset( -0 )
	local f1_local1 = f1_arg0.Body
	f1_local1:SetShadowMinDistance( -0.2, 0 )
	f1_local1:SetShadowMaxDistance( 0.2, 0 )
	f1_local1:SetShadowRGBFromInt( 0, 0 )
	f1_local1:SetShadowUOffset( -0 )
	f1_local1:SetShadowVOffset( -0 )
	if IsLanguageChinese() then
		f1_local1:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, _1080p * 210, _1080p * 234 )
	end
	f1_arg0:SetGlitchEnabled( true )
	f1_arg0:SetGlitchBlockWidth( math.random( 15, 20 ) )
	f1_arg0:SetGlitchBlockHeight( math.random( 15, 20 ) )
	f1_arg0:SetGlitchDistortionRange( math.random( 1, 80 ) )
	f1_arg0:SetGlitchScanlinePitch( 1 )
	f1_arg0:SetGlitchMaskPitch( 1 )
	f1_arg0:SetAlpha( 0 )
	f1_arg0.HexContentIcon:SetMask( f1_arg0.HexBackingMask )
	f1_arg0:addEventHandler( "message_queue_show", function ( f2_arg0, f2_arg1 )
		f1_arg0:SetGlitchAmount( 1 )
		f1_arg0:SetAlpha( 0 )
		f1_arg0:SetScale( 1 )
		f1_arg0:SetGlitchAmount( 0, 200 )
		f1_arg0:SetAlpha( 1, 150, LUI.EASING.outBack )
		f1_arg0:SetScale( 0, 150, LUI.EASING.outBack )
		local f2_local0 = DataSources.inGame.MP.splashes.localPlayer.splashIndex:GetValue( f1_arg1 )
		local f2_local1 = DataSources.inGame.MP.splashes.localPlayer.useRectangleImage:GetValue( f1_arg1 )
		local f2_local2 = Engine.TableLookupByRow( CSV.splashTable.file, f2_local0, CSV.splashTable.cols.useHexDisplay )
		f1_arg0.Icon:SetAlpha( 0 )
		f1_arg0.HexContentIcon:SetAlpha( 0 )
		f1_arg0.HexBacking:SetAlpha( 0 )
		f1_arg0.IconRectangle:SetAlpha( 0 )
		f1_arg0.IconRectangleBacking:SetAlpha( 0 )
		if f2_local1 then
			f1_arg0.IconRectangle:SetAlpha( 1 )
			if DataSources.inGame.MP.splashes.localPlayer.useRectangleBacking:GetValue( f1_arg1 ) then
				f1_arg0.IconRectangleBacking:SetAlpha( 1 )
			end
		elseif f2_local2 and f2_local2 ~= "" then
			f1_arg0.HexContentIcon:SetAlpha( 1 )
			f1_arg0.HexBacking:SetAlpha( 1 )
		else
			f1_arg0.Icon:SetAlpha( 1 )
		end
		local f2_local3 = DataSources.inGame.MP.splashes.localPlayer.sound:GetValue( f1_arg1 )
		if f2_local3 ~= nil and f2_local3 ~= "" then
			Engine.PlaySound( f2_local3 )
		end
		local f2_local4 = DataSources.inGame.MP.splashes.localPlayer.splashIndex:GetValue( f1_arg1 )
		if f2_local4 then
			local f2_local5 = Engine.TableLookupByRow( CSV.splashTable.file, f2_local4, CSV.splashTable.cols.notifyScript )
			if f2_local5 and f2_local5 ~= "" then
				Engine.NotifyServer( "splash_shown", f2_local4 )
			end
		end
	end )
	f1_arg0:addEventHandler( "message_queue_hide", function ( f3_arg0, f3_arg1 )
		f1_arg0:SetGlitchAmount( 1 )
		f1_arg0:SetAlpha( 0, 150, LUI.EASING.inBack )
		f1_arg0:SetScale( -1, 150, LUI.EASING.inBack )
	end )
end

function LocalPlayerSplash( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 300 * _1080p, 0, 225 * _1080p )
	self.id = "LocalPlayerSplash"
	local f4_local1 = controller and controller.controllerIndex
	if not f4_local1 and not Engine.InFrontend() then
		f4_local1 = self:getRootController()
	end
	assert( f4_local1 )
	local f4_local2 = self
	local IconRectangleBacking = nil
	
	IconRectangleBacking = LUI.UIImage.new()
	IconRectangleBacking.id = "IconRectangleBacking"
	IconRectangleBacking:setImage( RegisterMaterial( "splash_rectangle_backing" ), 0 )
	IconRectangleBacking:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -128, _1080p * 128, _1080p * 64, _1080p * 192 )
	self:addElement( IconRectangleBacking )
	self.IconRectangleBacking = IconRectangleBacking
	
	local IconRectangle = nil
	
	IconRectangle = LUI.UIImage.new()
	IconRectangle.id = "IconRectangle"
	IconRectangle:SetAlpha( 0, 0 )
	IconRectangle:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -128, _1080p * 128, _1080p * 64, _1080p * 192 )
	IconRectangle:SubscribeToModel( DataSources.inGame.MP.splashes.localPlayer.icon:GetModel( f4_local1 ), function ()
		local f5_local0 = DataSources.inGame.MP.splashes.localPlayer.icon:GetValue( f4_local1 )
		if f5_local0 ~= nil then
			IconRectangle:setImage( RegisterMaterial( f5_local0 ), 0 )
		end
	end )
	self:addElement( IconRectangle )
	self.IconRectangle = IconRectangle
	
	local Icon = nil
	
	Icon = LUI.UIImage.new()
	Icon.id = "Icon"
	Icon:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -96, _1080p * 96, 0, _1080p * 192 )
	Icon:SubscribeToModel( DataSources.inGame.MP.splashes.localPlayer.icon:GetModel( f4_local1 ), function ()
		local f6_local0 = DataSources.inGame.MP.splashes.localPlayer.icon:GetValue( f4_local1 )
		if f6_local0 ~= nil then
			Icon:setImage( RegisterMaterial( f6_local0 ), 0 )
		end
	end )
	self:addElement( Icon )
	self.Icon = Icon
	
	local HexBackingMask = nil
	
	HexBackingMask = LUI.UIImage.new()
	HexBackingMask.id = "HexBackingMask"
	HexBackingMask:setImage( RegisterMaterial( "splash_hex_backing_alpha_feather" ), 0 )
	HexBackingMask:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -96, _1080p * 96, 0, _1080p * 192 )
	self:addElement( HexBackingMask )
	self.HexBackingMask = HexBackingMask
	
	local HexBacking = nil
	
	HexBacking = LUI.UIImage.new()
	HexBacking.id = "HexBacking"
	HexBacking:setImage( RegisterMaterial( "splash_hex_backing" ), 0 )
	HexBacking:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -96, _1080p * 96, 0, _1080p * 192 )
	self:addElement( HexBacking )
	self.HexBacking = HexBacking
	
	local HexContentIcon = nil
	
	HexContentIcon = LUI.UIImage.new()
	HexContentIcon.id = "HexContentIcon"
	HexContentIcon:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -80.5, _1080p * 80.5, _1080p * 15.5, _1080p * 176.5 )
	HexContentIcon:SubscribeToModel( DataSources.inGame.MP.splashes.localPlayer.icon:GetModel( f4_local1 ), function ()
		local f7_local0 = DataSources.inGame.MP.splashes.localPlayer.icon:GetValue( f4_local1 )
		if f7_local0 ~= nil then
			HexContentIcon:setImage( RegisterMaterial( f7_local0 ), 0 )
		end
	end )
	self:addElement( HexContentIcon )
	self.HexContentIcon = HexContentIcon
	
	local Body = nil
	
	Body = LUI.UIStyledText.new()
	Body.id = "Body"
	Body:SetRGBFromTable( SWATCHES.splashNotifications.normal, 0 )
	Body:SetFontSize( 24 * _1080p )
	Body:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	Body:SetAlignment( LUI.Alignment.Center )
	Body:SetShadowMinDistance( -0.2, 0 )
	Body:SetShadowMaxDistance( -0.2, 0 )
	Body:SetShadowRGBFromInt( 0, 0 )
	Body:SetDecodeLetterLength( 25 )
	Body:SetDecodeMaxRandChars( 3 )
	Body:SetDecodeUpdatesPerLetter( 4 )
	Body:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, _1080p * 200, _1080p * 224 )
	Body:SubscribeToModel( DataSources.inGame.MP.splashes.localPlayer.body:GetModel( f4_local1 ), function ()
		local f8_local0 = DataSources.inGame.MP.splashes.localPlayer.body:GetValue( f4_local1 )
		if f8_local0 ~= nil then
			Body:setText( f8_local0, 0 )
		end
	end )
	self:addElement( Body )
	self.Body = Body
	
	local Header = nil
	
	Header = LUI.UIStyledText.new()
	Header.id = "Header"
	Header:SetRGBFromTable( SWATCHES.splashNotifications.highlight, 0 )
	Header:SetFontSize( 30 * _1080p )
	Header:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	Header:SetAlignment( LUI.Alignment.Center )
	Header:SetShadowMinDistance( -0.2, 0 )
	Header:SetShadowMaxDistance( -0.2, 0 )
	Header:SetShadowRGBFromInt( 0, 0 )
	Header:SetDecodeLetterLength( 25 )
	Header:SetDecodeMaxRandChars( 3 )
	Header:SetDecodeUpdatesPerLetter( 4 )
	Header:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * -161, _1080p * 161, _1080p * 170, _1080p * 200 )
	Header:SubscribeToModel( DataSources.inGame.MP.splashes.localPlayer.header:GetModel( f4_local1 ), function ()
		local f9_local0 = DataSources.inGame.MP.splashes.localPlayer.header:GetValue( f4_local1 )
		if f9_local0 ~= nil then
			Header:setText( ToUpperCase( f9_local0 ), 0 )
		end
	end )
	self:addElement( Header )
	self.Header = Header
	
	PostLoadFunc( self, f4_local1, controller )
	return self
end

MenuBuilder.registerType( "LocalPlayerSplash", LocalPlayerSplash )
LockTable( _M )
