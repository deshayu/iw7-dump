local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function JackalEnemyLockonMid( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 188 * _1080p, 0, 188 * _1080p )
	self.id = "JackalEnemyLockonMid"
	self._animationSets = {}
	self._sequences = {}
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local largeCenterCircle = nil
	
	largeCenterCircle = LUI.UIImage.new()
	largeCenterCircle.id = "largeCenterCircle"
	largeCenterCircle:SetRGBFromTable( SWATCHES.jackal.warning, 0 )
	largeCenterCircle:SetAlpha( 0.4, 0 )
	largeCenterCircle:setImage( RegisterMaterial( "hud_jackal_interior_main_map_circle" ), 0 )
	self:addElement( largeCenterCircle )
	self.largeCenterCircle = largeCenterCircle
	
	local smallCenterCircle = nil
	
	smallCenterCircle = LUI.UIImage.new()
	smallCenterCircle.id = "smallCenterCircle"
	smallCenterCircle:SetRGBFromTable( SWATCHES.jackal.warning, 0 )
	smallCenterCircle:SetAlpha( 0.45, 0 )
	smallCenterCircle:setImage( RegisterMaterial( "hud_jackal_strike_reticule_piece_center_circle_xl" ), 0 )
	smallCenterCircle:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * 34, _1080p * -34, _1080p * 34, _1080p * -34 )
	self:addElement( smallCenterCircle )
	self.smallCenterCircle = smallCenterCircle
	
	local crosshairs = nil
	
	crosshairs = MenuBuilder.BuildRegisteredType( "GenericReticleCrosshairs", {
		controllerIndex = f1_local1
	} )
	crosshairs.id = "crosshairs"
	crosshairs:SetRGBFromTable( SWATCHES.jackal.warning, 0 )
	crosshairs:SetAlpha( 0.45, 0 )
	crosshairs:SetZRotation( 45, 0 )
	crosshairs:SetScale( -0.03, 0 )
	crosshairs.rightLine:SetLeft( _1080p * -34, 0 )
	crosshairs.rightLine:SetTop( _1080p * -0.5, 0 )
	crosshairs.rightLine:SetBottom( _1080p * 0.5, 0 )
	crosshairs.leftLine:SetRight( _1080p * 34, 0 )
	crosshairs.leftLine:SetTop( _1080p * -0.5, 0 )
	crosshairs.leftLine:SetBottom( _1080p * 0.5, 0 )
	crosshairs.bottomLine:SetLeft( _1080p * -0.5, 0 )
	crosshairs.bottomLine:SetRight( _1080p * 0.5, 0 )
	crosshairs.bottomLine:SetTop( _1080p * -34, 0 )
	crosshairs.topLine:SetLeft( _1080p * -0.5, 0 )
	crosshairs.topLine:SetRight( _1080p * 0.5, 0 )
	crosshairs.topLine:SetBottom( _1080p * 34, 0 )
	crosshairs:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, 0, 0 )
	self:addElement( crosshairs )
	self.crosshairs = crosshairs
	
	local nodeLarge = nil
	
	nodeLarge = LUI.UIImage.new()
	nodeLarge.id = "nodeLarge"
	nodeLarge:SetRGBFromTable( SWATCHES.jackal.warning, 0 )
	nodeLarge:SetAlpha( 0.25, 0 )
	nodeLarge:SetScale( -0.25, 0 )
	nodeLarge:setImage( RegisterMaterial( "hud_jackal_strike_reticule_piece_center_node_md" ), 0 )
	nodeLarge:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * 86, _1080p * -86, _1080p * 27, _1080p * -145 )
	self:addElement( nodeLarge )
	self.nodeLarge = nodeLarge
	
	local Image0 = nil
	
	Image0 = LUI.UIImage.new()
	Image0.id = "Image0"
	Image0:SetRGBFromTable( SWATCHES.jackal.warning, 0 )
	Image0:SetAlpha( 0.25, 0 )
	Image0:SetScale( -0.25, 0 )
	Image0:setImage( RegisterMaterial( "hud_jackal_strike_reticule_piece_center_node_md" ), 0 )
	Image0:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * 145, _1080p * -27, _1080p * 86, _1080p * -86 )
	self:addElement( Image0 )
	self.Image0 = Image0
	
	local Image1 = nil
	
	Image1 = LUI.UIImage.new()
	Image1.id = "Image1"
	Image1:SetRGBFromTable( SWATCHES.jackal.warning, 0 )
	Image1:SetAlpha( 0.25, 0 )
	Image1:SetScale( -0.25, 0 )
	Image1:setImage( RegisterMaterial( "hud_jackal_strike_reticule_piece_center_node_md" ), 0 )
	Image1:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * 86, _1080p * -86, _1080p * 145, _1080p * -27 )
	self:addElement( Image1 )
	self.Image1 = Image1
	
	local Image2 = nil
	
	Image2 = LUI.UIImage.new()
	Image2.id = "Image2"
	Image2:SetRGBFromTable( SWATCHES.jackal.warning, 0 )
	Image2:SetAlpha( 0.25, 0 )
	Image2:SetScale( -0.25, 0 )
	Image2:setImage( RegisterMaterial( "hud_jackal_strike_reticule_piece_center_node_md" ), 0 )
	Image2:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * 27, _1080p * -145, _1080p * 86, _1080p * -86 )
	self:addElement( Image2 )
	self.Image2 = Image2
	
	local missileWarning = nil
	
	missileWarning = LUI.UIImage.new()
	missileWarning.id = "missileWarning"
	missileWarning:SetRGBFromTable( SWATCHES.jackal.warning, 0 )
	missileWarning:SetAlpha( 0.12, 0 )
	missileWarning:setImage( RegisterMaterial( "hud_jackal_blur_accent" ), 0 )
	missileWarning:SetBlendMode( BLEND_MODE.addWithAlpha )
	missileWarning:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * -5, _1080p * 5, _1080p * -5, _1080p * 5 )
	self:addElement( missileWarning )
	self.missileWarning = missileWarning
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		missileWarning:RegisterAnimationSequence( "missileIncoming", {
			{
				function ()
					return self.missileWarning:SetAlpha( 0.43, 0 )
				end,
				function ()
					return self.missileWarning:SetAlpha( 0.65, 200 )
				end,
				function ()
					return self.missileWarning:SetAlpha( 0.43, 100 )
				end
			},
			{
				function ()
					return self.missileWarning:SetRGBFromInt( 14188089, 0 )
				end,
				function ()
					return self.missileWarning:SetRGBFromTable( SWATCHES.jackal.caution, 200 )
				end,
				function ()
					return self.missileWarning:SetRGBFromInt( 14188089, 100 )
				end
			}
		} )
		self._sequences.missileIncoming = function ()
			missileWarning:AnimateLoop( "missileIncoming" )
		end
		
		missileWarning:RegisterAnimationSequence( "noincomingMissile", {
			{
				function ()
					return self.missileWarning:SetRGBFromInt( 13861944, 0 )
				end,
				function ()
					return self.missileWarning:SetRGBFromInt( 6067930, 100 )
				end,
				function ()
					return self.missileWarning:SetRGBFromInt( 6067930, 200 )
				end,
				function ()
					return self.missileWarning:SetRGBFromTable( SWATCHES.jackal.warning, 450 )
				end
			},
			{
				function ()
					return self.missileWarning:SetAlpha( 0.48, 0 )
				end,
				function ()
					return self.missileWarning:SetAlpha( 0.68, 100 )
				end,
				function ()
					return self.missileWarning:SetAlpha( 0.28, 100 )
				end,
				function ()
					return self.missileWarning:SetAlpha( 0.68, 100 )
				end,
				function ()
					return self.missileWarning:SetAlpha( 0.12, 450 )
				end
			}
		} )
		self._sequences.noincomingMissile = function ()
			missileWarning:AnimateSequence( "noincomingMissile" )
		end
		
		largeCenterCircle:RegisterAnimationSequence( "aquringLock", {
			{
				function ()
					return self.largeCenterCircle:SetAlpha( 0, 0 )
				end
			}
		} )
		smallCenterCircle:RegisterAnimationSequence( "aquringLock", {
			{
				function ()
					return self.smallCenterCircle:SetAlpha( 0, 0 )
				end
			}
		} )
		crosshairs:RegisterAnimationSequence( "aquringLock", {
			{
				function ()
					return self.crosshairs:SetAlpha( 0, 0 )
				end
			}
		} )
		nodeLarge:RegisterAnimationSequence( "aquringLock", {
			{
				function ()
					return self.nodeLarge:SetAlpha( 0, 0 )
				end
			}
		} )
		Image0:RegisterAnimationSequence( "aquringLock", {
			{
				function ()
					return self.Image0:SetAlpha( 0, 0 )
				end
			}
		} )
		Image1:RegisterAnimationSequence( "aquringLock", {
			{
				function ()
					return self.Image1:SetAlpha( 0, 0 )
				end
			}
		} )
		Image2:RegisterAnimationSequence( "aquringLock", {
			{
				function ()
					return self.Image2:SetAlpha( 0, 0 )
				end
			}
		} )
		missileWarning:RegisterAnimationSequence( "aquringLock", {
			{
				function ()
					return self.missileWarning:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.aquringLock = function ()
			largeCenterCircle:AnimateSequence( "aquringLock" )
			smallCenterCircle:AnimateSequence( "aquringLock" )
			crosshairs:AnimateSequence( "aquringLock" )
			nodeLarge:AnimateSequence( "aquringLock" )
			Image0:AnimateSequence( "aquringLock" )
			Image1:AnimateSequence( "aquringLock" )
			Image2:AnimateSequence( "aquringLock" )
			missileWarning:AnimateSequence( "aquringLock" )
		end
		
		largeCenterCircle:RegisterAnimationSequence( "aquiredLock", {
			{
				function ()
					return self.largeCenterCircle:SetAlpha( 0, 0 )
				end,
				function ()
					return self.largeCenterCircle:SetAlpha( 0, 180 )
				end,
				function ()
					return self.largeCenterCircle:SetAlpha( 0.4, 220 )
				end
			},
			{
				function ()
					return self.largeCenterCircle:SetScale( 7, 0 )
				end,
				function ()
					return self.largeCenterCircle:SetScale( 7, 180 )
				end,
				function ()
					return self.largeCenterCircle:SetScale( 0.17, 90 )
				end,
				function ()
					return self.largeCenterCircle:SetScale( 0, 130 )
				end
			}
		} )
		smallCenterCircle:RegisterAnimationSequence( "aquiredLock", {
			{
				function ()
					return self.smallCenterCircle:SetAlpha( 0, 0 )
				end,
				function ()
					return self.smallCenterCircle:SetAlpha( 0, 180 )
				end,
				function ()
					return self.smallCenterCircle:SetAlpha( 0.45, 220 )
				end
			},
			{
				function ()
					return self.smallCenterCircle:SetScale( 7, 0 )
				end,
				function ()
					return self.smallCenterCircle:SetScale( -1, 180 )
				end,
				function ()
					return self.smallCenterCircle:SetScale( 0.19, 90 )
				end,
				function ()
					return self.smallCenterCircle:SetScale( 0, 130 )
				end
			}
		} )
		crosshairs:RegisterAnimationSequence( "aquiredLock", {
			{
				function ()
					return self.crosshairs:SetAlpha( 0, 0 )
				end,
				function ()
					return self.crosshairs:SetAlpha( 0.65, 400 )
				end
			},
			{
				function ()
					return self.crosshairs:SetScale( -1, 0 )
				end,
				function ()
					return self.crosshairs:SetScale( 0.15, 270 )
				end,
				function ()
					return self.crosshairs:SetScale( -0.03, 130 )
				end
			}
		} )
		nodeLarge:RegisterAnimationSequence( "aquiredLock", {
			{
				function ()
					return self.nodeLarge:SetAlpha( 0, 0 )
				end,
				function ()
					return self.nodeLarge:SetAlpha( 0.25, 400 )
				end
			},
			{
				function ()
					return self.nodeLarge:SetScale( -0.25, 0 )
				end,
				function ()
					return self.nodeLarge:SetScale( -0.25, 400 )
				end
			}
		} )
		Image0:RegisterAnimationSequence( "aquiredLock", {
			{
				function ()
					return self.Image0:SetAlpha( 0, 0 )
				end,
				function ()
					return self.Image0:SetAlpha( 0.25, 400 )
				end
			},
			{
				function ()
					return self.Image0:SetScale( -0.25, 0 )
				end,
				function ()
					return self.Image0:SetScale( -0.25, 400 )
				end
			}
		} )
		Image1:RegisterAnimationSequence( "aquiredLock", {
			{
				function ()
					return self.Image1:SetAlpha( 0, 0 )
				end,
				function ()
					return self.Image1:SetAlpha( 0.25, 400 )
				end
			},
			{
				function ()
					return self.Image1:SetScale( -0.25, 0 )
				end,
				function ()
					return self.Image1:SetScale( -0.25, 400 )
				end
			}
		} )
		Image2:RegisterAnimationSequence( "aquiredLock", {
			{
				function ()
					return self.Image2:SetAlpha( 0, 0 )
				end,
				function ()
					return self.Image2:SetAlpha( 0.25, 400 )
				end
			},
			{
				function ()
					return self.Image2:SetScale( -0.25, 0 )
				end,
				function ()
					return self.Image2:SetScale( -0.25, 400 )
				end
			}
		} )
		missileWarning:RegisterAnimationSequence( "aquiredLock", {
			{
				function ()
					return self.missileWarning:SetAlpha( 0, 0 )
				end,
				function ()
					return self.missileWarning:SetAlpha( 0.12, 400 )
				end
			},
			{
				function ()
					return self.missileWarning:SetScale( 0, 0 )
				end,
				function ()
					return self.missileWarning:SetScale( 0, 400 )
				end
			}
		} )
		self._sequences.aquiredLock = function ()
			largeCenterCircle:AnimateSequence( "aquiredLock" )
			smallCenterCircle:AnimateSequence( "aquiredLock" )
			crosshairs:AnimateSequence( "aquiredLock" )
			nodeLarge:AnimateSequence( "aquiredLock" )
			Image0:AnimateSequence( "aquiredLock" )
			Image1:AnimateSequence( "aquiredLock" )
			Image2:AnimateSequence( "aquiredLock" )
			missileWarning:AnimateSequence( "aquiredLock" )
		end
		
		missileWarning:RegisterAnimationSequence( "isfiring", {
			{
				function ()
					return self.missileWarning:SetAlpha( 0.24, 0 )
				end,
				function ()
					return self.missileWarning:SetAlpha( 0.48, 80 )
				end,
				function ()
					return self.missileWarning:SetAlpha( 0.24, 80 )
				end
			},
			{
				function ()
					return self.missileWarning:SetRGBFromInt( 16528154, 0 )
				end
			}
		} )
		self._sequences.isfiring = function ()
			missileWarning:AnimateLoop( "isfiring" )
		end
		
		missileWarning:RegisterAnimationSequence( "isNotFiring", {
			{
				function ()
					return self.missileWarning:SetAlpha( 0.48, 0 )
				end,
				function ()
					return self.missileWarning:SetAlpha( 0.12, 340 )
				end
			},
			{
				function ()
					return self.missileWarning:SetRGBFromInt( 16528154, 0 )
				end,
				function ()
					return self.missileWarning:SetRGBFromInt( 15819327, 340 )
				end
			}
		} )
		self._sequences.isNotFiring = function ()
			missileWarning:AnimateSequence( "isNotFiring" )
		end
		
		missileWarning:RegisterAnimationSequence( "noincomingMissileFail", {
			{
				function ()
					return self.missileWarning:SetRGBFromInt( 13861944, 0 )
				end,
				function ()
					return self.missileWarning:SetRGBFromInt( 16711683, 120 )
				end,
				function ()
					return self.missileWarning:SetRGBFromTable( SWATCHES.jackal.warning, 520 )
				end
			},
			{
				function ()
					return self.missileWarning:SetAlpha( 0.48, 0 )
				end,
				function ()
					return self.missileWarning:SetAlpha( 0.81, 120 )
				end,
				function ()
					return self.missileWarning:SetAlpha( 0.12, 520 )
				end
			}
		} )
		self._sequences.noincomingMissileFail = function ()
			missileWarning:AnimateSequence( "noincomingMissileFail" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	self:SubscribeToModel( DataSources.inGame.jackal.enemyLockonMissile:GetModel( f1_local1 ), function ()
		if DataSources.inGame.jackal.enemyLockonMissile:GetValue( f1_local1 ) ~= nil and DataSources.inGame.jackal.enemyLockonMissile:GetValue( f1_local1 ) == 3 then
			ACTIONS.AnimateSequence( self, "missileIncoming" )
		end
		if DataSources.inGame.jackal.enemyLockonMissile:GetValue( f1_local1 ) ~= nil and DataSources.inGame.jackal.enemyLockonMissile:GetValue( f1_local1 ) == 0 then
			ACTIONS.AnimateSequence( self, "noincomingMissile" )
		end
		if DataSources.inGame.jackal.enemyLockonMissile:GetValue( f1_local1 ) ~= nil and DataSources.inGame.jackal.enemyLockonMissile:GetValue( f1_local1 ) == -1 then
			ACTIONS.AnimateSequence( self, "noincomingMissileFail" )
		end
	end )
	self:SubscribeToModel( DataSources.inGame.jackal.enemyLockonAquiring:GetModel( f1_local1 ), function ()
		if DataSources.inGame.jackal.enemyLockonAquiring:GetValue( f1_local1 ) ~= nil and DataSources.inGame.jackal.enemyLockonAquiring:GetValue( f1_local1 ) == true then
			ACTIONS.AnimateSequence( self, "aquringLock" )
		end
		if DataSources.inGame.jackal.enemyLockonAquiring:GetValue( f1_local1 ) ~= nil and DataSources.inGame.jackal.enemyLockonAquiring:GetValue( f1_local1 ) == false then
			ACTIONS.AnimateSequence( self, "aquiredLock" )
		end
	end )
	local f1_local11 = function ()
		if DataSources.inGame.jackal.enemyLockonIsfiring:GetValue( f1_local1 ) ~= nil and DataSources.inGame.jackal.enemyLockonIsfiring:GetValue( f1_local1 ) == true and DataSources.inGame.jackal.enemyLockonAquiring:GetValue( f1_local1 ) ~= nil and DataSources.inGame.jackal.enemyLockonAquiring:GetValue( f1_local1 ) == false then
			ACTIONS.AnimateSequence( self, "isfiring" )
		end
	end
	
	self:SubscribeToModel( DataSources.inGame.jackal.enemyLockonIsfiring:GetModel( f1_local1 ), f1_local11 )
	self:SubscribeToModel( DataSources.inGame.jackal.enemyLockonAquiring:GetModel( f1_local1 ), f1_local11 )
	self:SubscribeToModel( DataSources.inGame.jackal.isFiring:GetModel( f1_local1 ), f1_local11 )
	self:SubscribeToModel( DataSources.inGame.jackal.enemyLockonIsfiring:GetModel( f1_local1 ), function ()
		if DataSources.inGame.jackal.enemyLockonIsfiring:GetValue( f1_local1 ) ~= nil and DataSources.inGame.jackal.enemyLockonIsfiring:GetValue( f1_local1 ) == false then
			ACTIONS.AnimateSequence( self, "isNotFiring" )
		end
	end )
	return self
end

MenuBuilder.registerType( "JackalEnemyLockonMid", JackalEnemyLockonMid )
LockTable( _M )
