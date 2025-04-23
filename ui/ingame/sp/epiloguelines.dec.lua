local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = 40
f0_local1 = 2
f0_local2 = 4
local f0_local3 = nil
local f0_local4 = 1700
function FadeOut( f1_arg0 )
	return function ()
		f1_arg0:SetAlpha( 0, 1000 )
	end
	
end

f0_local3 = function ( f3_arg0, f3_arg1, f3_arg2 )
	return function ()
		local f4_local0 = f3_arg0["line" .. f3_arg1]
		if not f4_local0 then
			local f4_local1 = f3_arg0:Wait( 3000 )
			f4_local1.onComplete = FadeOut( f3_arg0 )
			return 
		end
		f4_local0:SetDecodeLetterLength( f0_local0 )
		f4_local0:SetDecodeMaxRandChars( f0_local1 )
		f4_local0:SetDecodeUpdatesPerLetter( f0_local2 )
		local f4_local1 = DataSources.inGame.SP.shipCrib.epilogueLines["line" .. f3_arg1].GetValue( f4_local1["line" .. f3_arg1], f3_arg2 )
		if f4_local1 then
			f4_local0:setText( LocalizeString( f4_local1 ), 0 )
		end
		local f4_local2 = f4_local0:Wait( f0_local4 )
		f4_local2.onComplete = f0_local3( f3_arg0, f3_arg1 + 1, f3_arg2 )
	end
	
end

function PostLoadFunc( f5_arg0, f5_arg1, f5_arg2 )
	f5_arg0:SetAlpha( 1, 0 )
	f5_arg0.line1:SetDecodeLetterLength( f0_local0 )
	f5_arg0.line1:SetDecodeMaxRandChars( f0_local1 )
	f5_arg0.line1:SetDecodeUpdatesPerLetter( f0_local2 )
	local f5_local0 = DataSources.inGame.SP.shipCrib.epilogueLines.line1:GetValue( f5_arg1 )
	if f5_local0 ~= nil then
		f5_arg0.line1:setText( LocalizeString( f5_local0 ), 0 )
	end
	local f5_local1 = f5_arg0:Wait( f0_local4 )
	f5_local1.onComplete = f0_local3( f5_arg0, 2, f5_arg1 )
end

function EpilogueLines( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 800 * _1080p, 0, 400 * _1080p )
	self.id = "EpilogueLines"
	local f6_local1 = controller and controller.controllerIndex
	if not f6_local1 and not Engine.InFrontend() then
		f6_local1 = self:getRootController()
	end
	assert( f6_local1 )
	local f6_local2 = self
	local line1 = nil
	
	line1 = LUI.UIStyledText.new()
	line1.id = "line1"
	line1:setText( LocalizeString( "" ), 0 )
	line1:SetFontSize( 36 * _1080p )
	line1:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	line1:SetAlignment( LUI.Alignment.Left )
	line1:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 750, 0, _1080p * 36 )
	self:addElement( line1 )
	self.line1 = line1
	
	local line2 = nil
	
	line2 = LUI.UIStyledText.new()
	line2.id = "line2"
	line2:setText( LocalizeString( "" ), 0 )
	line2:SetFontSize( 36 * _1080p )
	line2:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	line2:SetAlignment( LUI.Alignment.Left )
	line2:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 750, _1080p * 36, _1080p * 72 )
	self:addElement( line2 )
	self.line2 = line2
	
	local line3 = nil
	
	line3 = LUI.UIStyledText.new()
	line3.id = "line3"
	line3:setText( LocalizeString( "" ), 0 )
	line3:SetFontSize( 36 * _1080p )
	line3:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	line3:SetAlignment( LUI.Alignment.Left )
	line3:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 750, _1080p * 72, _1080p * 108 )
	self:addElement( line3 )
	self.line3 = line3
	
	local line4 = nil
	
	line4 = LUI.UIStyledText.new()
	line4.id = "line4"
	line4:setText( LocalizeString( "" ), 0 )
	line4:SetFontSize( 36 * _1080p )
	line4:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	line4:SetAlignment( LUI.Alignment.Left )
	line4:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 750, _1080p * 108, _1080p * 144 )
	self:addElement( line4 )
	self.line4 = line4
	
	PostLoadFunc( self, f6_local1, controller )
	return self
end

MenuBuilder.registerType( "EpilogueLines", EpilogueLines )
LockTable( _M )
