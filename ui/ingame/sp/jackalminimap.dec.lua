local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function JackalMinimap()
	local f1_local0 = 220
	local f1_local1 = 50
	local f1_local2 = 0.13
	local f1_local3 = 2
	local f1_local4 = {
		x = 0,
		y = -5
	}
	local self = LUI.UIElement.new( {
		topAnchor = false,
		bottomAnchor = true,
		leftAnchor = false,
		rightAnchor = false,
		height = f1_local0,
		bottom = 20,
		left = -f1_local0 / 2,
		right = f1_local0 / 2
	} )
	self.id = "JackalMinimap"
	local f1_local6 = LUI.UIImage.new( {
		material = RegisterMaterial( "test_jackal_map_01" ),
		topAnchor = true,
		bottomAnchor = true,
		leftAnchor = true,
		rightAnchor = true,
		top = 0,
		bottom = 0,
		left = 0,
		right = 0
	} )
	f1_local6.id = "bg"
	self:addElement( f1_local6 )
	local f1_local7 = LUI.UIImage.new( {
		material = RegisterMaterial( "test_jackal_icon_01" ),
		topAnchor = false,
		bottomAnchor = false,
		leftAnchor = false,
		rightAnchor = false,
		top = -f1_local1 * 0.5 / f1_local3 + f1_local4.y,
		bottom = f1_local1 * 0.5 / f1_local3 + f1_local4.y,
		right = f1_local1 * 0.5,
		left = -f1_local1 * 0.5
	} )
	f1_local7.id = "shipIcon"
	self:addElement( f1_local7 )
	local f1_local8 = LUI.UIElement.new( {
		topAnchor = false,
		bottomAnchor = false,
		leftAnchor = true,
		rightAnchor = true,
		top = -f1_local2 * f1_local0,
		bottom = f1_local2 * f1_local0,
		left = 0,
		right = 0
	} )
	f1_local8.id = "codeContent"
	f1_local8:SetupFlightMinimap()
	self:addElement( f1_local8 )
	return self
end

MenuBuilder.registerType( "JackalMinimap", JackalMinimap )
LockTable( _M )
