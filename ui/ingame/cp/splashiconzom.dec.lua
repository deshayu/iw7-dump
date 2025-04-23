local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function splashIconZom( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 86 * _1080p, 0, 86 * _1080p )
	self.id = "splashIconZom"
	self._animationSets = {}
	self._sequences = {}
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local Icon = nil
	
	Icon = LUI.UIImage.new()
	Icon.id = "Icon"
	Icon:SetUseAA( true )
	Icon:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 86, 0, _1080p * 86 )
	Icon:SubscribeToModel( DataSources.inGame.MP.splashes.localPlayer.icon:GetModel( f1_local1 ), function ()
		local f2_local0 = DataSources.inGame.MP.splashes.localPlayer.icon:GetValue( f1_local1 )
		if f2_local0 ~= nil then
			Icon:setImage( RegisterMaterial( f2_local0 ), 0 )
		end
	end )
	self:addElement( Icon )
	self.Icon = Icon
	
	self._animationSets.DefaultAnimationSet = function ()
		Icon:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.Icon:SetScale( 0.13, 0 )
				end
			},
			{
				function ()
					return self.Icon:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 86, 0, _1080p * 86, 0 )
				end
			}
		} )
		self._sequences.DefaultSequence = function ()
			Icon:AnimateSequence( "DefaultSequence" )
		end
		
		Icon:RegisterAnimationSequence( "weaponScale", {
			{
				function ()
					return self.Icon:SetScale( 0.13, 0 )
				end
			},
			{
				function ()
					return self.Icon:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 86, _1080p * 22, _1080p * 65, 0 )
				end
			}
		} )
		self._sequences.weaponScale = function ()
			Icon:AnimateSequence( "weaponScale" )
		end
		
		Icon:RegisterAnimationSequence( "rankScale", {
			{
				function ()
					return self.Icon:SetScale( -0.16, 0 )
				end
			},
			{
				function ()
					return self.Icon:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 86, 0, _1080p * 86, 0 )
				end
			}
		} )
		self._sequences.rankScale = function ()
			Icon:AnimateSequence( "rankScale" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	ACTIONS.AnimateSequence( self, "DefaultSequence" )
	return self
end

MenuBuilder.registerType( "splashIconZom", splashIconZom )
LockTable( _M )
