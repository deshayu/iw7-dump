local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function souvenir( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 110 * _1080p, 0, 110 * _1080p )
	self.id = "souvenir"
	self._animationSets = {}
	self._sequences = {}
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local SouvenirPieceIcon = nil
	
	SouvenirPieceIcon = LUI.UIImage.new()
	SouvenirPieceIcon.id = "SouvenirPieceIcon"
	SouvenirPieceIcon:SetScale( -0.33, 0 )
	SouvenirPieceIcon:SetUseAA( true )
	SouvenirPieceIcon:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 3, _1080p * 107, _1080p * 5, _1080p * 105 )
	SouvenirPieceIcon:BindAlphaToModel( DataSources.inGame.CP.zombies.souvenirAlpha:GetModel( f1_local1 ) )
	SouvenirPieceIcon:SubscribeToModel( DataSources.inGame.CP.zombies.souvenirPieceIcon:GetModel( f1_local1 ), function ()
		local f2_local0 = DataSources.inGame.CP.zombies.souvenirPieceIcon:GetValue( f1_local1 )
		if f2_local0 ~= nil then
			SouvenirPieceIcon:setImage( RegisterMaterial( f2_local0 ), 0 )
		end
	end )
	self:addElement( SouvenirPieceIcon )
	self.SouvenirPieceIcon = SouvenirPieceIcon
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		SouvenirPieceIcon:RegisterAnimationSequence( "Spin", {
			{
				function ()
					return self.SouvenirPieceIcon:SetYRotation( 0, 0 )
				end,
				function ()
					return self.SouvenirPieceIcon:SetYRotation( 1440, 2000 )
				end
			}
		} )
		self._sequences.Spin = function ()
			SouvenirPieceIcon:AnimateSequence( "Spin" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	self:SubscribeToModel( DataSources.inGame.CP.zombies.souvenirPieceIndex:GetModel( f1_local1 ), function ()
		if not CONDITIONS.IsDLC3( self ) then
			ACTIONS.AnimateSequence( self, "Spin" )
		end
	end )
	return self
end

MenuBuilder.registerType( "souvenir", souvenir )
LockTable( _M )
