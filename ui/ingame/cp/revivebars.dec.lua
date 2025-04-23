local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function ReviveBars()
	local self = LUI.UIElement.new( {
		topAnchor = true,
		bottomAnchor = false,
		leftAnchor = true,
		rightAnchor = false,
		top = 0,
		bottom = 0,
		left = 0,
		right = 0
	} )
	self.id = "ReviveBars"
	local f1_local1 = self:getRootController()
	for f1_local5, f1_local6 in ipairs( DataSources.inGame.CP.zombies.reviveBars ) do
		assert( f1_local6.clientNum )
		assert( f1_local6.progress )
		local f1_local7 = MenuBuilder.BuildRegisteredType( "ReviveBar" )
		f1_local7.id = "bar_" .. f1_local5
		self:addElement( f1_local7 )
		f1_local7:SetDataSource( f1_local6, f1_local1 )
	end
	return self
end

MenuBuilder.registerType( "ReviveBars", ReviveBars )
LockTable( _M )
