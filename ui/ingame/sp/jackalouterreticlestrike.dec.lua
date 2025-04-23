local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function PostLoadFunc( f1_arg0, f1_arg1, f1_arg2 )
	f1_arg0:SetBlendMode( BLEND_MODE.addWithAlpha )
	local f1_local0 = DataSources.inGame.jackal.weapon
	local f1_local1 = DataSources.inGame.jackal.noGunsModeActive
	local f1_local2 = DataSources.inGame.jackal.autopilot
	local f1_local3 = function ( f2_arg0 )
		local f2_local0 = f1_local0:GetValue( f1_arg1 )
		local f2_local1 = f1_local1:GetValue( f1_arg1 )
		local f2_local2 = f1_local2:GetValue( f1_arg1 )
		local f2_local3 = nil
		if f2_local1 or f2_local2 or f2_local0 == JackalWeapons.Cannons then
			f2_local3 = "outro"
		elseif f2_local0 == JackalWeapons.Guns then
			f2_local3 = "intro"
		end
		if f2_local3 and f1_arg0._currentAnimation ~= f2_local3 then
			ACTIONS.AnimateSequence( f1_arg0, f2_local3 )
			f1_arg0._currentAnimation = f2_local3
		end
	end
	
	f1_arg0:SubscribeToModel( f1_local0:GetModel( f1_arg1 ), f1_local3 )
	f1_arg0:SubscribeToModel( f1_local1:GetModel( f1_arg1 ), f1_local3 )
	f1_arg0:SubscribeToModel( f1_local2:GetModel( f1_arg1 ), f1_local3 )
end

function JackalOuterReticleStrike( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 1280 * _1080p, 0, 550 * _1080p )
	self.id = "JackalOuterReticleStrike"
	self._animationSets = {}
	self._sequences = {}
	local f3_local1 = controller and controller.controllerIndex
	if not f3_local1 and not Engine.InFrontend() then
		f3_local1 = self:getRootController()
	end
	assert( f3_local1 )
	local f3_local2 = self
	local bottomQuadInnerLeft = nil
	
	bottomQuadInnerLeft = LUI.UIImage.new()
	bottomQuadInnerLeft.id = "bottomQuadInnerLeft"
	bottomQuadInnerLeft:setImage( RegisterMaterial( "hud_jackal_strike_reticule_piece_bottom_quad_inner" ), 0 )
	bottomQuadInnerLeft:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -103, _1080p * -39, _1080p * 125, _1080p * 157 )
	self:addElement( bottomQuadInnerLeft )
	self.bottomQuadInnerLeft = bottomQuadInnerLeft
	
	local bottomQuadInnerRight = nil
	
	bottomQuadInnerRight = LUI.UIImage.new()
	bottomQuadInnerRight.id = "bottomQuadInnerRight"
	bottomQuadInnerRight:setImage( RegisterMaterial( "hud_jackal_strike_reticule_piece_bottom_quad_inner" ), 0 )
	bottomQuadInnerRight:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 103, _1080p * 39, _1080p * 125, _1080p * 157 )
	self:addElement( bottomQuadInnerRight )
	self.bottomQuadInnerRight = bottomQuadInnerRight
	
	local bottomQuadLeft = nil
	
	bottomQuadLeft = LUI.UIImage.new()
	bottomQuadLeft.id = "bottomQuadLeft"
	bottomQuadLeft:setImage( RegisterMaterial( "hud_jackal_strike_reticule_piece_bottom_quad" ), 0 )
	bottomQuadLeft:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -240, _1080p * -112, _1080p * 121, _1080p * 249 )
	self:addElement( bottomQuadLeft )
	self.bottomQuadLeft = bottomQuadLeft
	
	local bottomQuadRight = nil
	
	bottomQuadRight = LUI.UIImage.new()
	bottomQuadRight.id = "bottomQuadRight"
	bottomQuadRight:setImage( RegisterMaterial( "hud_jackal_strike_reticule_piece_bottom_quad" ), 0 )
	bottomQuadRight:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 240, _1080p * 112, _1080p * 121, _1080p * 249 )
	self:addElement( bottomQuadRight )
	self.bottomQuadRight = bottomQuadRight
	
	local diagonalLineTopRight = nil
	
	diagonalLineTopRight = LUI.UIImage.new()
	diagonalLineTopRight.id = "diagonalLineTopRight"
	diagonalLineTopRight:setImage( RegisterMaterial( "hud_jackal_strike_reticule_piece_diagonal_line" ), 0 )
	diagonalLineTopRight:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 186, _1080p * 250, _1080p * -240, _1080p * -176 )
	self:addElement( diagonalLineTopRight )
	self.diagonalLineTopRight = diagonalLineTopRight
	
	local diagonalLineBottomRight = nil
	
	diagonalLineBottomRight = LUI.UIImage.new()
	diagonalLineBottomRight.id = "diagonalLineBottomRight"
	diagonalLineBottomRight:setImage( RegisterMaterial( "hud_jackal_strike_reticule_piece_diagonal_line" ), 0 )
	diagonalLineBottomRight:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 186, _1080p * 250, _1080p * 257, _1080p * 193 )
	self:addElement( diagonalLineBottomRight )
	self.diagonalLineBottomRight = diagonalLineBottomRight
	
	local diagonalLineBottomLeft = nil
	
	diagonalLineBottomLeft = LUI.UIImage.new()
	diagonalLineBottomLeft.id = "diagonalLineBottomLeft"
	diagonalLineBottomLeft:setImage( RegisterMaterial( "hud_jackal_strike_reticule_piece_diagonal_line" ), 0 )
	diagonalLineBottomLeft:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -186, _1080p * -250, _1080p * 257, _1080p * 193 )
	self:addElement( diagonalLineBottomLeft )
	self.diagonalLineBottomLeft = diagonalLineBottomLeft
	
	local diagonalLineTopLeft = nil
	
	diagonalLineTopLeft = LUI.UIImage.new()
	diagonalLineTopLeft.id = "diagonalLineTopLeft"
	diagonalLineTopLeft:setImage( RegisterMaterial( "hud_jackal_strike_reticule_piece_diagonal_line" ), 0 )
	diagonalLineTopLeft:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -186, _1080p * -250, _1080p * -240, _1080p * -176 )
	self:addElement( diagonalLineTopLeft )
	self.diagonalLineTopLeft = diagonalLineTopLeft
	
	local topQuadLeft = nil
	
	topQuadLeft = LUI.UIImage.new()
	topQuadLeft.id = "topQuadLeft"
	topQuadLeft:setImage( RegisterMaterial( "hud_jackal_strike_reticule_piece_top_quad" ), 0 )
	topQuadLeft:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -283, _1080p * -155, _1080p * -197, _1080p * -69 )
	self:addElement( topQuadLeft )
	self.topQuadLeft = topQuadLeft
	
	local topQuadRight = nil
	
	topQuadRight = LUI.UIImage.new()
	topQuadRight.id = "topQuadRight"
	topQuadRight:setImage( RegisterMaterial( "hud_jackal_strike_reticule_piece_top_quad" ), 0 )
	topQuadRight:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 283, _1080p * 155, _1080p * -197, _1080p * -69 )
	self:addElement( topQuadRight )
	self.topQuadRight = topQuadRight
	
	local sideArcRight = nil
	
	sideArcRight = LUI.UIImage.new()
	sideArcRight.id = "sideArcRight"
	sideArcRight:setImage( RegisterMaterial( "hud_jackal_strike_reticule_piece_side_arc" ), 0 )
	sideArcRight:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 606, _1080p * 590, _1080p * -109, _1080p * 147 )
	self:addElement( sideArcRight )
	self.sideArcRight = sideArcRight
	
	local sideArcLeft = nil
	
	sideArcLeft = LUI.UIImage.new()
	sideArcLeft.id = "sideArcLeft"
	sideArcLeft:setImage( RegisterMaterial( "hud_jackal_strike_reticule_piece_side_arc" ), 0 )
	sideArcLeft:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -606, _1080p * -590, _1080p * -109, _1080p * 147 )
	self:addElement( sideArcLeft )
	self.sideArcLeft = sideArcLeft
	
	local horzLineBottomLeft = nil
	
	horzLineBottomLeft = LUI.UIImage.new()
	horzLineBottomLeft.id = "horzLineBottomLeft"
	horzLineBottomLeft:SetAlpha( 0.25, 0 )
	horzLineBottomLeft:setImage( RegisterMaterial( "hud_jackal_strike_reticule_piece_bottom_horz_line" ), 0 )
	horzLineBottomLeft:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -363, _1080p * -235, _1080p * 133, _1080p * 141 )
	self:addElement( horzLineBottomLeft )
	self.horzLineBottomLeft = horzLineBottomLeft
	
	local horzLineBottomRight = nil
	
	horzLineBottomRight = LUI.UIImage.new()
	horzLineBottomRight.id = "horzLineBottomRight"
	horzLineBottomRight:SetAlpha( 0.25, 0 )
	horzLineBottomRight:setImage( RegisterMaterial( "hud_jackal_strike_reticule_piece_bottom_horz_line" ), 0 )
	horzLineBottomRight:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 363, _1080p * 235, _1080p * 133, _1080p * 141 )
	self:addElement( horzLineBottomRight )
	self.horzLineBottomRight = horzLineBottomRight
	
	local techyDigitsRight = nil
	
	techyDigitsRight = MenuBuilder.BuildRegisteredType( "JackalTechyDigits", {
		controllerIndex = f3_local1
	} )
	techyDigitsRight.id = "techyDigitsRight"
	techyDigitsRight:SetRGBFromTable( SWATCHES.jackal.stable, 0 )
	techyDigitsRight:SetAlpha( 0.5, 0 )
	techyDigitsRight.TopField:SetAlignment( LUI.Alignment.Left )
	techyDigitsRight:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 367, _1080p * 407, _1080p * 132, _1080p * 168 )
	self:addElement( techyDigitsRight )
	self.techyDigitsRight = techyDigitsRight
	
	local techyDigitsLeft = nil
	
	techyDigitsLeft = MenuBuilder.BuildRegisteredType( "JackalTechyDigits", {
		controllerIndex = f3_local1
	} )
	techyDigitsLeft.id = "techyDigitsLeft"
	techyDigitsLeft:SetRGBFromTable( SWATCHES.jackal.stable, 0 )
	techyDigitsLeft:SetAlpha( 0.5, 0 )
	techyDigitsLeft.TopField:SetAlignment( LUI.Alignment.Right )
	techyDigitsLeft:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -407, _1080p * -367, _1080p * 132, _1080p * 168 )
	self:addElement( techyDigitsLeft )
	self.techyDigitsLeft = techyDigitsLeft
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		bottomQuadInnerLeft:RegisterAnimationSequence( "outro", {
			{
				function ()
					return self.bottomQuadInnerLeft:SetAlpha( 0, 300 )
				end
			},
			{
				function ()
					return self.bottomQuadInnerLeft:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -103, _1080p * -39, _1080p * 125, _1080p * 157, 100 )
				end,
				function ()
					return self.bottomQuadInnerLeft:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -64, 0, 0, _1080p * 32, 200 )
				end
			}
		} )
		bottomQuadInnerRight:RegisterAnimationSequence( "outro", {
			{
				function ()
					return self.bottomQuadInnerRight:SetAlpha( 0, 300 )
				end
			},
			{
				function ()
					return self.bottomQuadInnerRight:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 103, _1080p * 39, _1080p * 125, _1080p * 157, 100 )
				end,
				function ()
					return self.bottomQuadInnerRight:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 64, 0, 0, _1080p * 32, 200 )
				end
			}
		} )
		bottomQuadLeft:RegisterAnimationSequence( "outro", {
			{
				function ()
					return self.bottomQuadLeft:SetAlpha( 0, 350 )
				end
			},
			{
				function ()
					return self.bottomQuadLeft:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -240, _1080p * -112, _1080p * 121, _1080p * 249, 150 )
				end,
				function ()
					return self.bottomQuadLeft:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -128, 0, 0, _1080p * 128, 199 )
				end
			}
		} )
		bottomQuadRight:RegisterAnimationSequence( "outro", {
			{
				function ()
					return self.bottomQuadRight:SetAlpha( 0, 350 )
				end
			},
			{
				function ()
					return self.bottomQuadRight:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 240, _1080p * 112, _1080p * 121, _1080p * 249, 150 )
				end,
				function ()
					return self.bottomQuadRight:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 128, 0, 0, _1080p * 128, 199 )
				end
			}
		} )
		diagonalLineTopRight:RegisterAnimationSequence( "outro", {
			{
				function ()
					return self.diagonalLineTopRight:SetAlpha( 0, 500, LUI.EASING.inOutBack )
				end
			},
			{
				function ()
					return self.diagonalLineTopRight:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 186, _1080p * 250, _1080p * -240, _1080p * -176, 200 )
				end,
				function ()
					return self.diagonalLineTopRight:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, 0, _1080p * 64, _1080p * -64, 0, 299, LUI.EASING.inOutBack )
				end
			}
		} )
		diagonalLineBottomRight:RegisterAnimationSequence( "outro", {
			{
				function ()
					return self.diagonalLineBottomRight:SetAlpha( 0, 500, LUI.EASING.inOutBack )
				end
			},
			{
				function ()
					return self.diagonalLineBottomRight:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 186, _1080p * 250, _1080p * 257, _1080p * 193, 200 )
				end,
				function ()
					return self.diagonalLineBottomRight:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, 0, _1080p * 64, _1080p * 64, 0, 299, LUI.EASING.inOutBack )
				end
			}
		} )
		diagonalLineBottomLeft:RegisterAnimationSequence( "outro", {
			{
				function ()
					return self.diagonalLineBottomLeft:SetAlpha( 0, 500, LUI.EASING.inOutBack )
				end
			},
			{
				function ()
					return self.diagonalLineBottomLeft:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -186, _1080p * -250, _1080p * 257, _1080p * 193, 200 )
				end,
				function ()
					return self.diagonalLineBottomLeft:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, 0, _1080p * -64, _1080p * 64, 0, 299, LUI.EASING.inOutBack )
				end
			}
		} )
		diagonalLineTopLeft:RegisterAnimationSequence( "outro", {
			{
				function ()
					return self.diagonalLineTopLeft:SetAlpha( 0, 500, LUI.EASING.inOutBack )
				end
			},
			{
				function ()
					return self.diagonalLineTopLeft:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -186, _1080p * -250, _1080p * -240, _1080p * -176, 200 )
				end,
				function ()
					return self.diagonalLineTopLeft:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, 0, _1080p * -64, _1080p * -64, 0, 299, LUI.EASING.inOutBack )
				end
			}
		} )
		topQuadLeft:RegisterAnimationSequence( "outro", {
			{
				function ()
					return self.topQuadLeft:SetAlpha( 0, 350 )
				end
			},
			{
				function ()
					return self.topQuadLeft:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -283, _1080p * -155, _1080p * -197, _1080p * -69, 150 )
				end,
				function ()
					return self.topQuadLeft:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -128, 0, _1080p * -128, 0, 199 )
				end
			}
		} )
		topQuadRight:RegisterAnimationSequence( "outro", {
			{
				function ()
					return self.topQuadRight:SetAlpha( 0, 350 )
				end
			},
			{
				function ()
					return self.topQuadRight:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 283, _1080p * 155, _1080p * -197, _1080p * -69, 150 )
				end,
				function ()
					return self.topQuadRight:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 128, 0, _1080p * -128, 0, 199 )
				end
			}
		} )
		sideArcRight:RegisterAnimationSequence( "outro", {
			{
				function ()
					return self.sideArcRight:SetAlpha( 0, 500, LUI.EASING.inOutBack )
				end
			},
			{
				function ()
					return self.sideArcRight:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 606, _1080p * 590, _1080p * -109, _1080p * 147, 100 )
				end,
				function ()
					return self.sideArcRight:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 16, 0, _1080p * -109, _1080p * 147, 399, LUI.EASING.inOutBack )
				end
			}
		} )
		sideArcLeft:RegisterAnimationSequence( "outro", {
			{
				function ()
					return self.sideArcLeft:SetAlpha( 0, 500, LUI.EASING.inOutBack )
				end
			},
			{
				function ()
					return self.sideArcLeft:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -606, _1080p * -590, _1080p * -109, _1080p * 147, 100 )
				end,
				function ()
					return self.sideArcLeft:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -16, 0, _1080p * -109, _1080p * 147, 399, LUI.EASING.inOutBack )
				end
			}
		} )
		horzLineBottomLeft:RegisterAnimationSequence( "outro", {
			{
				function ()
					return self.horzLineBottomLeft:SetAlpha( 0, 300 )
				end
			},
			{
				function ()
					return self.horzLineBottomLeft:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -363, _1080p * -235, _1080p * 133, _1080p * 141, 100 )
				end,
				function ()
					return self.horzLineBottomLeft:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -128, 0, _1080p * 133, _1080p * 141, 200 )
				end
			}
		} )
		horzLineBottomRight:RegisterAnimationSequence( "outro", {
			{
				function ()
					return self.horzLineBottomRight:SetAlpha( 0, 300 )
				end
			},
			{
				function ()
					return self.horzLineBottomRight:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 363, _1080p * 235, _1080p * 133, _1080p * 141, 100 )
				end,
				function ()
					return self.horzLineBottomRight:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 128, 0, _1080p * 133, _1080p * 141, 200 )
				end
			}
		} )
		techyDigitsRight:RegisterAnimationSequence( "outro", {
			{
				function ()
					return self.techyDigitsRight:SetAlpha( 0, 300 )
				end
			},
			{
				function ()
					return self.techyDigitsRight:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 367, _1080p * 407, _1080p * 132, _1080p * 168, 100 )
				end,
				function ()
					return self.techyDigitsRight:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 128, _1080p * 168, _1080p * 132, _1080p * 168, 200 )
				end
			}
		} )
		techyDigitsLeft:RegisterAnimationSequence( "outro", {
			{
				function ()
					return self.techyDigitsLeft:SetAlpha( 0, 300 )
				end
			},
			{
				function ()
					return self.techyDigitsLeft:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -407, _1080p * -367, _1080p * 132, _1080p * 168, 100 )
				end,
				function ()
					return self.techyDigitsLeft:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -168, _1080p * -128, _1080p * 132, _1080p * 168, 200 )
				end
			}
		} )
		self._sequences.outro = function ()
			bottomQuadInnerLeft:AnimateSequence( "outro" )
			bottomQuadInnerRight:AnimateSequence( "outro" )
			bottomQuadLeft:AnimateSequence( "outro" )
			bottomQuadRight:AnimateSequence( "outro" )
			diagonalLineTopRight:AnimateSequence( "outro" )
			diagonalLineBottomRight:AnimateSequence( "outro" )
			diagonalLineBottomLeft:AnimateSequence( "outro" )
			diagonalLineTopLeft:AnimateSequence( "outro" )
			topQuadLeft:AnimateSequence( "outro" )
			topQuadRight:AnimateSequence( "outro" )
			sideArcRight:AnimateSequence( "outro" )
			sideArcLeft:AnimateSequence( "outro" )
			horzLineBottomLeft:AnimateSequence( "outro" )
			horzLineBottomRight:AnimateSequence( "outro" )
			techyDigitsRight:AnimateSequence( "outro" )
			techyDigitsLeft:AnimateSequence( "outro" )
		end
		
		bottomQuadInnerLeft:RegisterAnimationSequence( "intro", {
			{
				function ()
					return self.bottomQuadInnerLeft:SetAlpha( 0, 100 )
				end,
				function ()
					return self.bottomQuadInnerLeft:SetAlpha( 0.25, 500, LUI.EASING.inOutBack )
				end
			},
			{
				function ()
					return self.bottomQuadInnerLeft:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -64, 0, 0, _1080p * 32, 100 )
				end,
				function ()
					return self.bottomQuadInnerLeft:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -103, _1080p * -39, _1080p * 125, _1080p * 157, 500, LUI.EASING.inOutBack )
				end
			}
		} )
		bottomQuadInnerRight:RegisterAnimationSequence( "intro", {
			{
				function ()
					return self.bottomQuadInnerRight:SetAlpha( 0, 100 )
				end,
				function ()
					return self.bottomQuadInnerRight:SetAlpha( 0.25, 500, LUI.EASING.inOutBack )
				end
			},
			{
				function ()
					return self.bottomQuadInnerRight:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 64, 0, 0, _1080p * 32, 100 )
				end,
				function ()
					return self.bottomQuadInnerRight:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 103, _1080p * 39, _1080p * 125, _1080p * 157, 500, LUI.EASING.inOutBack )
				end
			}
		} )
		bottomQuadLeft:RegisterAnimationSequence( "intro", {
			{
				function ()
					return self.bottomQuadLeft:SetAlpha( 0, 200 )
				end,
				function ()
					return self.bottomQuadLeft:SetAlpha( 0.25, 500, LUI.EASING.inOutBack )
				end
			},
			{
				function ()
					return self.bottomQuadLeft:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -128, 0, 0, _1080p * 128, 200 )
				end,
				function ()
					return self.bottomQuadLeft:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -240, _1080p * -112, _1080p * 121, _1080p * 249, 499, LUI.EASING.inOutBack )
				end
			}
		} )
		bottomQuadRight:RegisterAnimationSequence( "intro", {
			{
				function ()
					return self.bottomQuadRight:SetAlpha( 0, 200 )
				end,
				function ()
					return self.bottomQuadRight:SetAlpha( 0.25, 500, LUI.EASING.inOutBack )
				end
			},
			{
				function ()
					return self.bottomQuadRight:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 128, 0, 0, _1080p * 128, 200 )
				end,
				function ()
					return self.bottomQuadRight:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 240, _1080p * 112, _1080p * 121, _1080p * 249, 499, LUI.EASING.inOutBack )
				end
			}
		} )
		diagonalLineTopRight:RegisterAnimationSequence( "intro", {
			{
				function ()
					return self.diagonalLineTopRight:SetAlpha( 0, 250, LUI.EASING.inOutBack )
				end,
				function ()
					return self.diagonalLineTopRight:SetAlpha( 1, 500, LUI.EASING.inOutBack )
				end
			},
			{
				function ()
					return self.diagonalLineTopRight:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, 0, _1080p * 64, _1080p * -64, 0, 250, LUI.EASING.inOutBack )
				end,
				function ()
					return self.diagonalLineTopRight:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 186, _1080p * 250, _1080p * -240, _1080p * -176, 500, LUI.EASING.inOutBack )
				end
			}
		} )
		diagonalLineBottomRight:RegisterAnimationSequence( "intro", {
			{
				function ()
					return self.diagonalLineBottomRight:SetAlpha( 0, 250, LUI.EASING.inOutBack )
				end,
				function ()
					return self.diagonalLineBottomRight:SetAlpha( 1, 500, LUI.EASING.inOutBack )
				end
			},
			{
				function ()
					return self.diagonalLineBottomRight:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, 0, _1080p * 64, _1080p * 64, 0, 250, LUI.EASING.inOutBack )
				end,
				function ()
					return self.diagonalLineBottomRight:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 186, _1080p * 250, _1080p * 257, _1080p * 193, 500, LUI.EASING.inOutBack )
				end
			}
		} )
		diagonalLineBottomLeft:RegisterAnimationSequence( "intro", {
			{
				function ()
					return self.diagonalLineBottomLeft:SetAlpha( 0, 250, LUI.EASING.inOutBack )
				end,
				function ()
					return self.diagonalLineBottomLeft:SetAlpha( 1, 500, LUI.EASING.inOutBack )
				end
			},
			{
				function ()
					return self.diagonalLineBottomLeft:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, 0, _1080p * -64, _1080p * 64, 0, 250, LUI.EASING.inOutBack )
				end,
				function ()
					return self.diagonalLineBottomLeft:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -186, _1080p * -250, _1080p * 257, _1080p * 193, 500, LUI.EASING.inOutBack )
				end
			}
		} )
		diagonalLineTopLeft:RegisterAnimationSequence( "intro", {
			{
				function ()
					return self.diagonalLineTopLeft:SetAlpha( 0, 250, LUI.EASING.inOutBack )
				end,
				function ()
					return self.diagonalLineTopLeft:SetAlpha( 1, 500, LUI.EASING.inOutBack )
				end
			},
			{
				function ()
					return self.diagonalLineTopLeft:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, 0, _1080p * -64, _1080p * -64, 0, 250, LUI.EASING.inOutBack )
				end,
				function ()
					return self.diagonalLineTopLeft:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -186, _1080p * -250, _1080p * -240, _1080p * -176, 500, LUI.EASING.inOutBack )
				end
			}
		} )
		topQuadLeft:RegisterAnimationSequence( "intro", {
			{
				function ()
					return self.topQuadLeft:SetAlpha( 0, 200 )
				end,
				function ()
					return self.topQuadLeft:SetAlpha( 0.4, 500, LUI.EASING.inOutBack )
				end
			},
			{
				function ()
					return self.topQuadLeft:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -128, 0, _1080p * -128, 0, 200 )
				end,
				function ()
					return self.topQuadLeft:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -283, _1080p * -155, _1080p * -197, _1080p * -69, 499, LUI.EASING.inOutBack )
				end
			}
		} )
		topQuadRight:RegisterAnimationSequence( "intro", {
			{
				function ()
					return self.topQuadRight:SetAlpha( 0, 200 )
				end,
				function ()
					return self.topQuadRight:SetAlpha( 0.4, 500, LUI.EASING.inOutBack )
				end
			},
			{
				function ()
					return self.topQuadRight:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 128, 0, _1080p * -128, 0, 200 )
				end,
				function ()
					return self.topQuadRight:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 283, _1080p * 155, _1080p * -197, _1080p * -69, 499, LUI.EASING.inOutBack )
				end
			}
		} )
		sideArcRight:RegisterAnimationSequence( "intro", {
			{
				function ()
					return self.sideArcRight:SetAlpha( 0, 0, LUI.EASING.inOutBack )
				end,
				function ()
					return self.sideArcRight:SetAlpha( 0.25, 800, LUI.EASING.inOutBack )
				end
			},
			{
				function ()
					return self.sideArcRight:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 16, 0, _1080p * -109, _1080p * 147, 0, LUI.EASING.inOutBack )
				end,
				function ()
					return self.sideArcRight:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 606, _1080p * 590, _1080p * -109, _1080p * 147, 800, LUI.EASING.inOutBack )
				end
			}
		} )
		sideArcLeft:RegisterAnimationSequence( "intro", {
			{
				function ()
					return self.sideArcLeft:SetAlpha( 0, 0 )
				end,
				function ()
					return self.sideArcLeft:SetAlpha( 0.25, 800, LUI.EASING.inOutBack )
				end
			},
			{
				function ()
					return self.sideArcLeft:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -16, 0, _1080p * -109, _1080p * 147, 0 )
				end,
				function ()
					return self.sideArcLeft:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -606, _1080p * -590, _1080p * -109, _1080p * 147, 800, LUI.EASING.inOutBack )
				end
			}
		} )
		horzLineBottomLeft:RegisterAnimationSequence( "intro", {
			{
				function ()
					return self.horzLineBottomLeft:SetAlpha( 0, 400 )
				end,
				function ()
					return self.horzLineBottomLeft:SetAlpha( 0.25, 300, LUI.EASING.inOutBack )
				end
			},
			{
				function ()
					return self.horzLineBottomLeft:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -128, 0, _1080p * 133, _1080p * 141, 400 )
				end,
				function ()
					return self.horzLineBottomLeft:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -363, _1080p * -235, _1080p * 133, _1080p * 141, 299, LUI.EASING.inOutBack )
				end
			}
		} )
		horzLineBottomRight:RegisterAnimationSequence( "intro", {
			{
				function ()
					return self.horzLineBottomRight:SetAlpha( 0, 400 )
				end,
				function ()
					return self.horzLineBottomRight:SetAlpha( 0.25, 300, LUI.EASING.inOutBack )
				end
			},
			{
				function ()
					return self.horzLineBottomRight:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 128, 0, _1080p * 133, _1080p * 141, 400 )
				end,
				function ()
					return self.horzLineBottomRight:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 363, _1080p * 235, _1080p * 133, _1080p * 141, 299, LUI.EASING.inOutBack )
				end
			}
		} )
		techyDigitsRight:RegisterAnimationSequence( "intro", {
			{
				function ()
					return self.techyDigitsRight:SetAlpha( 0, 400 )
				end,
				function ()
					return self.techyDigitsRight:SetAlpha( 0.5, 300, LUI.EASING.inOutBack )
				end
			},
			{
				function ()
					return self.techyDigitsRight:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 127, _1080p * 167, _1080p * 132, _1080p * 168, 400 )
				end,
				function ()
					return self.techyDigitsRight:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 367, _1080p * 407, _1080p * 132, _1080p * 168, 299, LUI.EASING.inOutBack )
				end
			}
		} )
		techyDigitsLeft:RegisterAnimationSequence( "intro", {
			{
				function ()
					return self.techyDigitsLeft:SetAlpha( 0, 400 )
				end,
				function ()
					return self.techyDigitsLeft:SetAlpha( 0.5, 300, LUI.EASING.inOutBack )
				end
			},
			{
				function ()
					return self.techyDigitsLeft:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -168, _1080p * -128, _1080p * 132, _1080p * 168, 400 )
				end,
				function ()
					return self.techyDigitsLeft:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -407, _1080p * -367, _1080p * 132, _1080p * 168, 299, LUI.EASING.inOutBack )
				end
			}
		} )
		self._sequences.intro = function ()
			bottomQuadInnerLeft:AnimateSequence( "intro" )
			bottomQuadInnerRight:AnimateSequence( "intro" )
			bottomQuadLeft:AnimateSequence( "intro" )
			bottomQuadRight:AnimateSequence( "intro" )
			diagonalLineTopRight:AnimateSequence( "intro" )
			diagonalLineBottomRight:AnimateSequence( "intro" )
			diagonalLineBottomLeft:AnimateSequence( "intro" )
			diagonalLineTopLeft:AnimateSequence( "intro" )
			topQuadLeft:AnimateSequence( "intro" )
			topQuadRight:AnimateSequence( "intro" )
			sideArcRight:AnimateSequence( "intro" )
			sideArcLeft:AnimateSequence( "intro" )
			horzLineBottomLeft:AnimateSequence( "intro" )
			horzLineBottomRight:AnimateSequence( "intro" )
			techyDigitsRight:AnimateSequence( "intro" )
			techyDigitsLeft:AnimateSequence( "intro" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	PostLoadFunc( self, f3_local1, controller )
	return self
end

MenuBuilder.registerType( "JackalOuterReticleStrike", JackalOuterReticleStrike )
LockTable( _M )
