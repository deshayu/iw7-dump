local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function JackalEnemyLockonLast( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 188 * _1080p, 0, 188 * _1080p )
	self.id = "JackalEnemyLockonLast"
	self._animationSets = {}
	self._sequences = {}
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local centerCircle = nil
	
	centerCircle = LUI.UIImage.new()
	centerCircle.id = "centerCircle"
	centerCircle:SetRGBFromTable( SWATCHES.jackal.warning, 0 )
	centerCircle:SetAlpha( 0.25, 0 )
	centerCircle:setImage( RegisterMaterial( "hud_jackal_strike_reticule_piece_center_circle_xl" ), 0 )
	centerCircle:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * -14, _1080p * 14, _1080p * -14, _1080p * 14 )
	self:addElement( centerCircle )
	self.centerCircle = centerCircle
	
	local largeCenterCircle = nil
	
	largeCenterCircle = LUI.UIImage.new()
	largeCenterCircle.id = "largeCenterCircle"
	largeCenterCircle:SetRGBFromTable( SWATCHES.jackal.warning, 0 )
	largeCenterCircle:SetAlpha( 0.5, 0 )
	largeCenterCircle:setImage( RegisterMaterial( "hud_jackal_interior_main_map_circle" ), 0 )
	largeCenterCircle:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * -75, _1080p * 75, _1080p * -75, _1080p * 75 )
	self:addElement( largeCenterCircle )
	self.largeCenterCircle = largeCenterCircle
	
	local largeNodeLeft = nil
	
	largeNodeLeft = LUI.UIImage.new()
	largeNodeLeft.id = "largeNodeLeft"
	largeNodeLeft:SetRGBFromTable( SWATCHES.jackal.warning, 0 )
	largeNodeLeft:SetAlpha( 0.25, 0 )
	largeNodeLeft:setImage( RegisterMaterial( "hud_jackal_strike_reticule_piece_center_node_md" ), 0 )
	largeNodeLeft:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * -19, _1080p * -191, _1080p * 86, _1080p * -86 )
	self:addElement( largeNodeLeft )
	self.largeNodeLeft = largeNodeLeft
	
	local smallNodeBottomLeft = nil
	
	smallNodeBottomLeft = LUI.UIImage.new()
	smallNodeBottomLeft.id = "smallNodeBottomLeft"
	smallNodeBottomLeft:SetRGBFromTable( SWATCHES.jackal.warning, 0 )
	smallNodeBottomLeft:SetAlpha( 0.25, 0 )
	smallNodeBottomLeft:setImage( RegisterMaterial( "hud_jackal_strike_reticule_piece_center_node_md" ), 0 )
	smallNodeBottomLeft:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * 86, _1080p * -86, _1080p * 192, _1080p * 20 )
	self:addElement( smallNodeBottomLeft )
	self.smallNodeBottomLeft = smallNodeBottomLeft
	
	local largeNodeRight = nil
	
	largeNodeRight = LUI.UIImage.new()
	largeNodeRight.id = "largeNodeRight"
	largeNodeRight:SetRGBFromTable( SWATCHES.jackal.warning, 0 )
	largeNodeRight:SetAlpha( 0.25, 0 )
	largeNodeRight:setImage( RegisterMaterial( "hud_jackal_strike_reticule_piece_center_node_md" ), 0 )
	largeNodeRight:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * 191, _1080p * 19, _1080p * 86, _1080p * -86 )
	self:addElement( largeNodeRight )
	self.largeNodeRight = largeNodeRight
	
	local smallNodeTopLeft = nil
	
	smallNodeTopLeft = LUI.UIImage.new()
	smallNodeTopLeft.id = "smallNodeTopLeft"
	smallNodeTopLeft:SetRGBFromTable( SWATCHES.jackal.warning, 0 )
	smallNodeTopLeft:SetAlpha( 0.25, 0 )
	smallNodeTopLeft:setImage( RegisterMaterial( "hud_jackal_strike_reticule_piece_center_node_md" ), 0 )
	smallNodeTopLeft:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * 86, _1080p * -86, _1080p * -19, _1080p * -191 )
	self:addElement( smallNodeTopLeft )
	self.smallNodeTopLeft = smallNodeTopLeft
	
	local crosshairs = nil
	
	crosshairs = MenuBuilder.BuildRegisteredType( "GenericReticleCrosshairs", {
		controllerIndex = f1_local1
	} )
	crosshairs.id = "crosshairs"
	crosshairs:SetRGBFromTable( SWATCHES.jackal.warning, 0 )
	crosshairs:SetAlpha( 0.2, 0 )
	crosshairs:SetZRotation( 45, 0 )
	crosshairs:SetScale( 0.12, 0 )
	crosshairs.rightLine:SetLeft( _1080p * 47, 0 )
	crosshairs.rightLine:SetTop( _1080p * -1, 0 )
	crosshairs.rightLine:SetBottom( _1080p * 1, 0 )
	crosshairs.leftLine:SetRight( _1080p * -47, 0 )
	crosshairs.leftLine:SetTop( _1080p * -1, 0 )
	crosshairs.leftLine:SetBottom( _1080p * 1, 0 )
	crosshairs.bottomLine:SetLeft( _1080p * -1, 0 )
	crosshairs.bottomLine:SetRight( _1080p * 1, 0 )
	crosshairs.bottomLine:SetTop( _1080p * 47, 0 )
	crosshairs.topLine:SetLeft( _1080p * -1, 0 )
	crosshairs.topLine:SetRight( _1080p * 1, 0 )
	crosshairs.topLine:SetBottom( _1080p * -47, 0 )
	crosshairs:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, 0, 0 )
	self:addElement( crosshairs )
	self.crosshairs = crosshairs
	
	local missileWarning = nil
	
	missileWarning = LUI.UIImage.new()
	missileWarning.id = "missileWarning"
	missileWarning:SetRGBFromTable( SWATCHES.jackal.warning, 0 )
	missileWarning:SetAlpha( 0.1, 0 )
	missileWarning:setImage( RegisterMaterial( "hud_jackal_blur_accent" ), 0 )
	missileWarning:SetBlendMode( BLEND_MODE.addWithAlpha )
	missileWarning:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * -85, _1080p * 85, _1080p * -85, _1080p * 85 )
	self:addElement( missileWarning )
	self.missileWarning = missileWarning
	
	local JackalEnemyLockonWarning0 = nil
	
	JackalEnemyLockonWarning0 = MenuBuilder.BuildRegisteredType( "JackalEnemyLockonWarning", {
		controllerIndex = f1_local1
	} )
	JackalEnemyLockonWarning0.id = "JackalEnemyLockonWarning0"
	JackalEnemyLockonWarning0:SetAlpha( 0.75, 0 )
	JackalEnemyLockonWarning0:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * -31, _1080p * 31, _1080p * -112, _1080p * -268 )
	self:addElement( JackalEnemyLockonWarning0 )
	self.JackalEnemyLockonWarning0 = JackalEnemyLockonWarning0
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		missileWarning:RegisterAnimationSequence( "missileIncoming", {
			{
				function ()
					return self.missileWarning:SetAlpha( 0.38, 0 )
				end,
				function ()
					return self.missileWarning:SetAlpha( 0.55, 200 )
				end,
				function ()
					return self.missileWarning:SetAlpha( 0.38, 100 )
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
		
		missileWarning:RegisterAnimationSequence( "nomissileIncoming", {
			{
				function ()
					return self.missileWarning:SetAlpha( 0.5, 0 )
				end,
				function ()
					return self.missileWarning:SetAlpha( 0.65, 100 )
				end,
				function ()
					return self.missileWarning:SetAlpha( 0.25, 100 )
				end,
				function ()
					return self.missileWarning:SetAlpha( 0.48, 100 )
				end,
				function ()
					return self.missileWarning:SetAlpha( 0.1, 450 )
				end
			},
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
			}
		} )
		self._sequences.nomissileIncoming = function ()
			missileWarning:AnimateSequence( "nomissileIncoming" )
		end
		
		centerCircle:RegisterAnimationSequence( "aquiringlock", {
			{
				function ()
					return self.centerCircle:SetRGBFromTable( SWATCHES.jackal.caution, 0 )
				end
			}
		} )
		largeCenterCircle:RegisterAnimationSequence( "aquiringlock", {
			{
				function ()
					return self.largeCenterCircle:SetRGBFromTable( SWATCHES.jackal.caution, 0 )
				end
			}
		} )
		largeNodeLeft:RegisterAnimationSequence( "aquiringlock", {
			{
				function ()
					return self.largeNodeLeft:SetAlpha( 0, 0 )
				end
			}
		} )
		smallNodeBottomLeft:RegisterAnimationSequence( "aquiringlock", {
			{
				function ()
					return self.smallNodeBottomLeft:SetAlpha( 0, 0 )
				end
			}
		} )
		largeNodeRight:RegisterAnimationSequence( "aquiringlock", {
			{
				function ()
					return self.largeNodeRight:SetAlpha( 0, 0 )
				end
			}
		} )
		smallNodeTopLeft:RegisterAnimationSequence( "aquiringlock", {
			{
				function ()
					return self.smallNodeTopLeft:SetAlpha( 0, 0 )
				end
			}
		} )
		crosshairs:RegisterAnimationSequence( "aquiringlock", {
			{
				function ()
					return self.crosshairs:SetAlpha( 0.35, 0 )
				end
			},
			{
				function ()
					return self.crosshairs:SetRGBFromTable( SWATCHES.jackal.caution, 0 )
				end
			},
			{
				function ()
					return self.crosshairs:SetZRotation( 45, 0 )
				end,
				function ()
					return self.crosshairs:SetZRotation( 225, 1400 )
				end
			}
		} )
		missileWarning:RegisterAnimationSequence( "aquiringlock", {
			{
				function ()
					return self.missileWarning:SetAlpha( 0.1, 0 )
				end
			},
			{
				function ()
					return self.missileWarning:SetRGBFromTable( SWATCHES.jackal.caution, 0 )
				end
			},
			{
				function ()
					return self.missileWarning:SetZRotation( 0, 0 )
				end,
				function ()
					return self.missileWarning:SetZRotation( -180, 1400 )
				end
			}
		} )
		JackalEnemyLockonWarning0:RegisterAnimationSequence( "aquiringlock", {
			{
				function ()
					return self.JackalEnemyLockonWarning0:SetAlpha( 0.75, 0 )
				end
			},
			{
				function ()
					return self.JackalEnemyLockonWarning0:SetRGBFromInt( 16777215, 0 )
				end
			},
			{
				function ()
					return self.JackalEnemyLockonWarning0:SetScale( 0.25, 0 )
				end
			},
			{
				function ()
					return self.JackalEnemyLockonWarning0:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * -31, _1080p * 31, _1080p * 10, _1080p * -146, 0 )
				end
			}
		} )
		self._sequences.aquiringlock = function ()
			centerCircle:AnimateLoop( "aquiringlock" )
			largeCenterCircle:AnimateLoop( "aquiringlock" )
			largeNodeLeft:AnimateLoop( "aquiringlock" )
			smallNodeBottomLeft:AnimateLoop( "aquiringlock" )
			largeNodeRight:AnimateLoop( "aquiringlock" )
			smallNodeTopLeft:AnimateLoop( "aquiringlock" )
			crosshairs:AnimateLoop( "aquiringlock" )
			missileWarning:AnimateLoop( "aquiringlock" )
			JackalEnemyLockonWarning0:AnimateLoop( "aquiringlock" )
		end
		
		centerCircle:RegisterAnimationSequence( "aquiredlock", {
			{
				function ()
					return self.centerCircle:SetRGBFromTable( SWATCHES.jackal.warning, 0 )
				end
			},
			{
				function ()
					return self.centerCircle:SetScale( 7, 0 )
				end,
				function ()
					return self.centerCircle:SetScale( 0, 240 )
				end
			}
		} )
		largeCenterCircle:RegisterAnimationSequence( "aquiredlock", {
			{
				function ()
					return self.largeCenterCircle:SetRGBFromTable( SWATCHES.jackal.warning, 0 )
				end
			},
			{
				function ()
					return self.largeCenterCircle:SetScale( 7, 0 )
				end,
				function ()
					return self.largeCenterCircle:SetScale( 0, 240 )
				end
			},
			{
				function ()
					return self.largeCenterCircle:SetAlpha( 0, 0 )
				end,
				function ()
					return self.largeCenterCircle:SetAlpha( 0.5, 240 )
				end
			}
		} )
		largeNodeLeft:RegisterAnimationSequence( "aquiredlock", {
			{
				function ()
					return self.largeNodeLeft:SetAlpha( 0, 0 )
				end,
				function ()
					return self.largeNodeLeft:SetAlpha( 0.25, 240 )
				end
			}
		} )
		smallNodeBottomLeft:RegisterAnimationSequence( "aquiredlock", {
			{
				function ()
					return self.smallNodeBottomLeft:SetAlpha( 0, 0 )
				end,
				function ()
					return self.smallNodeBottomLeft:SetAlpha( 0.25, 240 )
				end
			}
		} )
		largeNodeRight:RegisterAnimationSequence( "aquiredlock", {
			{
				function ()
					return self.largeNodeRight:SetAlpha( 0, 0 )
				end,
				function ()
					return self.largeNodeRight:SetAlpha( 0.25, 240 )
				end
			}
		} )
		smallNodeTopLeft:RegisterAnimationSequence( "aquiredlock", {
			{
				function ()
					return self.smallNodeTopLeft:SetAlpha( 0, 0 )
				end,
				function ()
					return self.smallNodeTopLeft:SetAlpha( 0.25, 240 )
				end
			}
		} )
		crosshairs:RegisterAnimationSequence( "aquiredlock", {
			{
				function ()
					return self.crosshairs:SetRGBFromTable( SWATCHES.jackal.warning, 0 )
				end
			},
			{
				function ()
					return self.crosshairs:SetZRotation( 45, 0 )
				end
			},
			{
				function ()
					return self.crosshairs:SetScale( 5, 0 )
				end,
				function ()
					return self.crosshairs:SetScale( 0.28, 110 )
				end,
				function ()
					return self.crosshairs:SetScale( 0.12, 130 )
				end
			}
		} )
		missileWarning:RegisterAnimationSequence( "aquiredlock", {
			{
				function ()
					return self.missileWarning:SetRGBFromTable( SWATCHES.jackal.warning, 0 )
				end
			},
			{
				function ()
					return self.missileWarning:SetZRotation( 0, 0 )
				end
			},
			{
				function ()
					return self.missileWarning:SetScale( 0, 0 )
				end,
				function ()
					return self.missileWarning:SetScale( 0.14, 110 )
				end,
				function ()
					return self.missileWarning:SetScale( 0, 130 )
				end
			}
		} )
		JackalEnemyLockonWarning0:RegisterAnimationSequence( "aquiredlock", {
			{
				function ()
					return self.JackalEnemyLockonWarning0:SetAlpha( 0.75, 0 )
				end,
				function ()
					return self.JackalEnemyLockonWarning0:SetAlpha( 0.75, 240 )
				end
			},
			{
				function ()
					return self.JackalEnemyLockonWarning0:SetScale( 0.25, 0 )
				end,
				function ()
					return self.JackalEnemyLockonWarning0:SetScale( 0.31, 110 )
				end,
				function ()
					return self.JackalEnemyLockonWarning0:SetScale( 0, 130 )
				end
			},
			{
				function ()
					return self.JackalEnemyLockonWarning0:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * -31, _1080p * 31, _1080p * 10, _1080p * -146, 0 )
				end,
				function ()
					return self.JackalEnemyLockonWarning0:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * -31, _1080p * 31, _1080p * -112, _1080p * -268, 239 )
				end
			}
		} )
		self._sequences.aquiredlock = function ()
			centerCircle:AnimateSequence( "aquiredlock" )
			largeCenterCircle:AnimateSequence( "aquiredlock" )
			largeNodeLeft:AnimateSequence( "aquiredlock" )
			smallNodeBottomLeft:AnimateSequence( "aquiredlock" )
			largeNodeRight:AnimateSequence( "aquiredlock" )
			smallNodeTopLeft:AnimateSequence( "aquiredlock" )
			crosshairs:AnimateSequence( "aquiredlock" )
			missileWarning:AnimateSequence( "aquiredlock" )
			JackalEnemyLockonWarning0:AnimateSequence( "aquiredlock" )
		end
		
		missileWarning:RegisterAnimationSequence( "isFiring", {
			{
				function ()
					return self.missileWarning:SetRGBFromInt( 16528154, 0 )
				end
			},
			{
				function ()
					return self.missileWarning:SetAlpha( 0.2, 0 )
				end,
				function ()
					return self.missileWarning:SetAlpha( 0.4, 80 )
				end,
				function ()
					return self.missileWarning:SetAlpha( 0.2, 80 )
				end
			}
		} )
		self._sequences.isFiring = function ()
			missileWarning:AnimateLoop( "isFiring" )
		end
		
		missileWarning:RegisterAnimationSequence( "isNotFiring", {
			{
				function ()
					return self.missileWarning:SetRGBFromInt( 16528154, 0 )
				end,
				function ()
					return self.missileWarning:SetRGBFromInt( 15819327, 340 )
				end
			},
			{
				function ()
					return self.missileWarning:SetAlpha( 0.4, 0 )
				end,
				function ()
					return self.missileWarning:SetAlpha( 0.1, 340 )
				end
			}
		} )
		self._sequences.isNotFiring = function ()
			missileWarning:AnimateSequence( "isNotFiring" )
		end
		
		missileWarning:RegisterAnimationSequence( "nomissileIncomingFail", {
			{
				function ()
					return self.missileWarning:SetAlpha( 0.5, 0 )
				end,
				function ()
					return self.missileWarning:SetAlpha( 0.8, 120 )
				end,
				function ()
					return self.missileWarning:SetAlpha( 0.1, 520 )
				end
			},
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
			}
		} )
		self._sequences.nomissileIncomingFail = function ()
			missileWarning:AnimateSequence( "nomissileIncomingFail" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	self:SubscribeToModel( DataSources.inGame.jackal.enemyLockonMissile:GetModel( f1_local1 ), function ()
		if DataSources.inGame.jackal.enemyLockonMissile:GetValue( f1_local1 ) ~= nil and DataSources.inGame.jackal.enemyLockonMissile:GetValue( f1_local1 ) == 2 then
			ACTIONS.AnimateSequence( self, "missileIncoming" )
		end
		if DataSources.inGame.jackal.enemyLockonMissile:GetValue( f1_local1 ) ~= nil and DataSources.inGame.jackal.enemyLockonMissile:GetValue( f1_local1 ) == 0 then
			ACTIONS.AnimateSequence( self, "nomissileIncoming" )
		end
		if DataSources.inGame.jackal.enemyLockonMissile:GetValue( f1_local1 ) ~= nil and DataSources.inGame.jackal.enemyLockonMissile:GetValue( f1_local1 ) == -1 then
			ACTIONS.AnimateSequence( self, "nomissileIncomingFail" )
		end
	end )
	self:SubscribeToModel( DataSources.inGame.jackal.enemyLockonAquiring:GetModel( f1_local1 ), function ()
		if DataSources.inGame.jackal.enemyLockonAquiring:GetValue( f1_local1 ) ~= nil and DataSources.inGame.jackal.enemyLockonAquiring:GetValue( f1_local1 ) == true then
			ACTIONS.AnimateSequence( self, "aquiringlock" )
		end
		if DataSources.inGame.jackal.enemyLockonAquiring:GetValue( f1_local1 ) ~= nil and DataSources.inGame.jackal.enemyLockonAquiring:GetValue( f1_local1 ) == false then
			ACTIONS.AnimateSequence( self, "aquiredlock" )
		end
	end )
	local f1_local12 = function ()
		if DataSources.inGame.jackal.enemyLockonIsfiring:GetValue( f1_local1 ) ~= nil and DataSources.inGame.jackal.enemyLockonIsfiring:GetValue( f1_local1 ) == true and DataSources.inGame.jackal.enemyLockonAquiring:GetValue( f1_local1 ) ~= nil and DataSources.inGame.jackal.enemyLockonAquiring:GetValue( f1_local1 ) == false then
			ACTIONS.AnimateSequence( self, "isFiring" )
		end
		if DataSources.inGame.jackal.enemyLockonIsfiring:GetValue( f1_local1 ) ~= nil and DataSources.inGame.jackal.enemyLockonIsfiring:GetValue( f1_local1 ) == false then
			ACTIONS.AnimateSequence( self, "isNotFiring" )
		end
	end
	
	self:SubscribeToModel( DataSources.inGame.jackal.enemyLockonIsfiring:GetModel( f1_local1 ), f1_local12 )
	self:SubscribeToModel( DataSources.inGame.jackal.enemyLockonAquiring:GetModel( f1_local1 ), f1_local12 )
	return self
end

MenuBuilder.registerType( "JackalEnemyLockonLast", JackalEnemyLockonLast )
LockTable( _M )
