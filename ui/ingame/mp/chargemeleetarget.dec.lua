local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function PostLoadFunc( f1_arg0, f1_arg1 )
	f1_arg0:SetupAnchoredElement( {
		minScale = 1,
		maxScale = 1,
		entityTag = "j_spine4"
	} )
	f1_arg0:SubscribeToModel( DataSources.inGame.player.chargeMeleeTarget:GetModel( f1_arg1 ), function ( f2_arg0 )
		f1_arg0:SetEntityNum( DataModel.GetModelValue( f2_arg0 ) )
	end )
end

function ChargeMeleeTarget( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 50 * _1080p, 0, 50 * _1080p )
	self.id = "ChargeMeleeTarget"
	local f3_local1 = controller and controller.controllerIndex
	if not f3_local1 and not Engine.InFrontend() then
		f3_local1 = self:getRootController()
	end
	assert( f3_local1 )
	local f3_local2 = self
	local f3_local3 = nil
	if not Engine.InFrontend() then
		f3_local3 = MenuBuilder.BuildRegisteredType( "GenericBorderFrame", {
			controllerIndex = f3_local1
		} )
		f3_local3.id = "Reticle"
		f3_local3:SetRGBFromTable( SWATCHES.HUD.enemyTeam, 0 )
		f3_local3:SetAlpha( 0.8, 0 )
		f3_local3.Left:SetRight( _1080p * 4, 0 )
		f3_local3.Right:SetLeft( _1080p * -4, 0 )
		f3_local3.Top:SetBottom( _1080p * 4, 0 )
		f3_local3.Bottom:SetTop( _1080p * -4, 0 )
		f3_local3:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, 0, 0 )
		self:addElement( f3_local3 )
		self.Reticle = f3_local3
	end
	PostLoadFunc( self, f3_local1, controller )
	return self
end

MenuBuilder.registerType( "ChargeMeleeTarget", ChargeMeleeTarget )
LockTable( _M )
