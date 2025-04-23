local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function questSetiComWidget( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 198 * _1080p, 0, 194 * _1080p )
	self.id = "questSetiComWidget"
	self._animationSets = {}
	self._sequences = {}
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local SetiCom = nil
	
	SetiCom = LUI.UIImage.new()
	SetiCom.id = "SetiCom"
	SetiCom:SetScale( -0.25, 0 )
	SetiCom:setImage( RegisterMaterial( "cp_zmb_sticker_seti_com" ), 0 )
	SetiCom:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -32.88, _1080p * 230.13, _1080p * -32, _1080p * 224 )
	SetiCom:BindAlphaToModel( DataSources.inGame.CP.zombies.quests.questSetiComAlphaFilter:GetModel( f1_local1 ) )
	self:addElement( SetiCom )
	self.SetiCom = SetiCom
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		SetiCom:RegisterAnimationSequence( "gotSeti", {
			{
				function ()
					return self.SetiCom:SetScale( 0, 0 )
				end,
				function ()
					return self.SetiCom:SetScale( 0.6, 250 )
				end,
				function ()
					return self.SetiCom:SetScale( 0, 250 )
				end,
				function ()
					return self.SetiCom:SetScale( 0.4, 250 )
				end,
				function ()
					return self.SetiCom:SetScale( 0, 250 )
				end,
				function ()
					return self.SetiCom:SetScale( 0.2, 250 )
				end,
				function ()
					return self.SetiCom:SetScale( 0, 250 )
				end
			}
		} )
		self._sequences.gotSeti = function ()
			SetiCom:AnimateSequence( "gotSeti" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	self:SubscribeToModel( DataSources.inGame.CP.zombies.quests.questSetiComAlphaFilter:GetModel( f1_local1 ), function ()
		if DataSources.inGame.CP.zombies.quests.questSetiComAlphaFilter:GetValue( f1_local1 ) ~= nil and DataSources.inGame.CP.zombies.quests.questSetiComAlphaFilter:GetValue( f1_local1 ) == 1 then
			ACTIONS.AnimateSequence( self, "gotSeti" )
		end
	end )
	return self
end

MenuBuilder.registerType( "questSetiComWidget", questSetiComWidget )
LockTable( _M )
