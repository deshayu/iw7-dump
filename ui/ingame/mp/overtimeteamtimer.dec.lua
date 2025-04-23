local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function OvertimeTeamTimer( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 660 * _1080p, 0, 275 * _1080p )
	self.id = "OvertimeTeamTimer"
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local Watermark = nil
	
	Watermark = LUI.UIImage.new()
	Watermark.id = "Watermark"
	Watermark:SetScale( -0.25, 0 )
	Watermark:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 19.27, _1080p * 274.27, _1080p * 212.88, _1080p * 283.88 )
	Watermark:SubscribeToModelThroughElement( self, "watermark", function ()
		local f2_local0 = self:GetDataSource()
		f2_local0 = f2_local0.watermark:GetValue( f1_local1 )
		if f2_local0 ~= nil then
			Watermark:setImage( RegisterMaterial( f2_local0 ), 0 )
		end
	end )
	self:addElement( Watermark )
	self.Watermark = Watermark
	
	local TeamLogo = nil
	
	TeamLogo = LUI.UIImage.new()
	TeamLogo.id = "TeamLogo"
	TeamLogo:SetScale( -0.4, 0 )
	TeamLogo:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -31.88, _1080p * 325.42, _1080p * -69.63, _1080p * 285.38 )
	TeamLogo:SubscribeToModelThroughElement( self, "logo", function ()
		local f3_local0 = self:GetDataSource()
		f3_local0 = f3_local0.logo:GetValue( f1_local1 )
		if f3_local0 ~= nil then
			TeamLogo:setImage( RegisterMaterial( f3_local0 ), 0 )
		end
	end )
	self:addElement( TeamLogo )
	self.TeamLogo = TeamLogo
	
	local CountdownElement = nil
	
	CountdownElement = MenuBuilder.BuildRegisteredType( "UICountdown", {
		controllerIndex = f1_local1
	} )
	CountdownElement.id = "CountdownElement"
	CountdownElement:SetFontSize( 105 * _1080p )
	CountdownElement:SetFont( FONTS.GetFont( FONTS.MainExtended.File ) )
	CountdownElement:SetAlignment( LUI.Alignment.Center )
	CountdownElement:setEndTime( 0 )
	CountdownElement:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -418, 0, _1080p * 107, _1080p * 212 )
	self:addElement( CountdownElement )
	self.CountdownElement = CountdownElement
	
	return self
end

MenuBuilder.registerType( "OvertimeTeamTimer", OvertimeTeamTimer )
LockTable( _M )
