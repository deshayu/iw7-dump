local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ( f1_arg0, f1_arg1, f1_arg2 )
	assert( f1_arg0.TheaterScreening )
	f1_arg0:SetupInWorldElement( {} )
	f1_arg0:SetInWorldScale( 1 )
	f1_arg0:SetWorldSpacePosition( 5238, -3849.1, 180 )
	local f1_local0 = LUI.DataSourceFromOmnvar.new( "movie_to_show" )
	f1_arg0:SubscribeToModel( f1_local0:GetModel( f1_arg1 ), function ()
		if f1_local0:GetValue( f1_arg1 ) == "zmb" then
			f1_arg0.TheaterScreening:setImage( RegisterMaterial( "cinematic" ), 0 )
		else
			f1_arg0.TheaterScreening:setImage( RegisterMaterial( "cinematic" ), 0 )
		end
	end )
end

function CPFinalTheaterScreen( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 884 * _1080p, 0, 553 * _1080p )
	self.id = "CPFinalTheaterScreen"
	local f3_local1 = controller and controller.controllerIndex
	if not f3_local1 and not Engine.InFrontend() then
		f3_local1 = self:getRootController()
	end
	assert( f3_local1 )
	local f3_local2 = self
	local f3_local3 = nil
	if not Engine.InFrontend() then
		f3_local3 = LUI.UIImage.new()
		f3_local3.id = "TheaterScreening"
		f3_local3:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -442, _1080p * 442, _1080p * -276.5, _1080p * 276.5 )
		self:addElement( f3_local3 )
		self.TheaterScreening = f3_local3
	end
	f0_local0( self, f3_local1, controller )
	return self
end

MenuBuilder.registerType( "CPFinalTheaterScreen", CPFinalTheaterScreen )
LockTable( _M )
