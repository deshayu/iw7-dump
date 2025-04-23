local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function JackalTargetLockonLead()
	local self = LUI.UIElement.new( {
		topAnchor = true,
		bottomAnchor = true,
		leftAnchor = true,
		rightAnchor = true,
		top = 0,
		bottom = 0,
		left = 0,
		right = 0
	} )
	self.id = "JackalTargetLockonLead"
	self.dots = {}
	table.insert( self.dots, MenuBuilder.BuildRegisteredType( "JackalTargetLockonLeadDotA" ) )
	table.insert( self.dots, MenuBuilder.BuildRegisteredType( "JackalTargetLockonLeadDotB" ) )
	table.insert( self.dots, MenuBuilder.BuildRegisteredType( "JackalTargetLockonLeadDotC" ) )
	table.insert( self.dots, MenuBuilder.BuildRegisteredType( "JackalTargetLockonLeadDotD" ) )
	table.insert( self.dots, MenuBuilder.BuildRegisteredType( "JackalTargetLockonLeadDotE" ) )
	self:SetupJackalTargetLockonLead( MenuBuilder.BuildRegisteredType( "JackalTargetLockonLeadReticle" ), self.dots )
	return self
end

MenuBuilder.registerType( "JackalTargetLockonLead", JackalTargetLockonLead )
LockTable( _M )
