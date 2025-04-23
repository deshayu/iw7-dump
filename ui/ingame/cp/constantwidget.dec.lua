local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function PostLoadFunc( f1_arg0, f1_arg1 )
	f1_arg0.number:SetGlitchEnabled( true )
	f1_arg0.number:SetGlitchEnabled( false )
end

function constantWidget( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 400 * _1080p, 0, 400 * _1080p )
	self.id = "constantWidget"
	local f2_local1 = controller and controller.controllerIndex
	if not f2_local1 and not Engine.InFrontend() then
		f2_local1 = self:getRootController()
	end
	assert( f2_local1 )
	local f2_local2 = self
	local icon = nil
	
	icon = LUI.UIImage.new()
	icon.id = "icon"
	icon:SetScale( 1, 0 )
	icon:setImage( RegisterMaterial( "cp_town_chem_diamond_symbol" ), 0 )
	icon:SetUseAA( true )
	icon:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 43.24, _1080p * 171.24, _1080p * 141.5, _1080p * 269.5 )
	self:addElement( icon )
	self.icon = icon
	
	local lineTop = nil
	
	lineTop = LUI.UIImage.new()
	lineTop.id = "lineTop"
	lineTop:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 200, _1080p * 267, _1080p * 181.46, _1080p * 192.46 )
	self:addElement( lineTop )
	self.lineTop = lineTop
	
	local lineBottom = nil
	
	lineBottom = LUI.UIImage.new()
	lineBottom.id = "lineBottom"
	lineBottom:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 200, _1080p * 267, _1080p * 207.5, _1080p * 218.5 )
	self:addElement( lineBottom )
	self.lineBottom = lineBottom
	
	local number = nil
	
	number = LUI.UIText.new()
	number.id = "number"
	number:SetFontSize( 90 * _1080p )
	number:SetFont( FONTS.GetFont( FONTS.Dev.File ) )
	number:SetAlignment( LUI.Alignment.Left )
	number:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 304.51, _1080p * 420.51, _1080p * 155, _1080p * 245 )
	number:SubscribeToModel( DataSources.inGame.CP.zombies.dlc3.constantLoc1:GetModel( f2_local1 ), function ()
		local f3_local0 = DataSources.inGame.CP.zombies.dlc3.constantLoc1:GetValue( f2_local1 )
		if f3_local0 ~= nil then
			number:setText( f3_local0, 0 )
		end
	end )
	self:addElement( number )
	self.number = number
	
	local notEqual = nil
	
	notEqual = LUI.UIImage.new()
	notEqual.id = "notEqual"
	notEqual:SetZRotation( 49, 0 )
	notEqual:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 188.24, _1080p * 278.76, _1080p * 194.5, _1080p * 205.5 )
	self:addElement( notEqual )
	self.notEqual = notEqual
	
	PostLoadFunc( self, f2_local1, controller )
	return self
end

MenuBuilder.registerType( "constantWidget", constantWidget )
LockTable( _M )
