local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function charmIcon( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 52 * _1080p, 0, 40 * _1080p )
	self.id = "charmIcon"
	self._animationSets = {}
	self._sequences = {}
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local PerkIcon = nil
	
	PerkIcon = LUI.UIImage.new()
	PerkIcon.id = "PerkIcon"
	PerkIcon:SetScale( -0.7, 0 )
	PerkIcon:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -38, _1080p * 90, _1080p * -43.88, _1080p * 84.12 )
	PerkIcon:SubscribeToModelThroughElement( self, "icon", function ()
		local f2_local0 = self:GetDataSource()
		f2_local0 = f2_local0.icon:GetValue( f1_local1 )
		if f2_local0 ~= nil then
			PerkIcon:setImage( RegisterMaterial( f2_local0 ), 0 )
		end
	end )
	self:addElement( PerkIcon )
	self.PerkIcon = PerkIcon
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		PerkIcon:RegisterAnimationSequence( "cpTown", {
			{
				function ()
					return self.PerkIcon:SetScale( -0.6, 0 )
				end
			}
		} )
		self._sequences.cpTown = function ()
			PerkIcon:AnimateSequence( "cpTown" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	if CONDITIONS.IsDLC3( self ) then
		ACTIONS.AnimateSequence( self, "cpTown" )
	end
	return self
end

MenuBuilder.registerType( "charmIcon", charmIcon )
LockTable( _M )
