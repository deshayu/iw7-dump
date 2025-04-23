local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function ThreatMeter( f1_arg0, f1_arg1 )
	if not f1_arg1 then
		f1_arg1 = {}
	end
	local self = LUI.UIElement.new( {
		left = 0,
		right = 0,
		top = 0,
		bottom = 0,
		leftAnchor = true,
		rightAnchor = true,
		topAnchor = true,
		bottomAnchor = true
	} )
	self.id = "ThreatMeter"
	self:SetupThreatMeter( f1_arg1 )
	return self
end

MenuBuilder.registerType( "ThreatMeter", ThreatMeter )
LockTable( _M )
