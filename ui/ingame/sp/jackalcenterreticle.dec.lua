local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function PostLoadFunc( f1_arg0, f1_arg1, f1_arg2 )
	local f1_local0 = DataSources.inGame.player.inADS
	local f1_local1 = DataSources.inGame.jackal.mode
	local f1_local2 = DataSources.inGame.jackal.autopilot
	local f1_local3 = DataSources.inGame.jackal.noGunsModeActive
	local f1_local4 = DataSources.inGame.jackal.weapon
	f1_arg0.inADS = false
	f1_arg0.brackets:SetBlendMode( BLEND_MODE.addWithAlpha )
	f1_arg0.crosshairs:SetBlendMode( BLEND_MODE.addWithAlpha )
	f1_arg0.smallNodeTopLeft:SetBlendMode( BLEND_MODE.addWithAlpha )
	f1_arg0.smallNodeTopRight:SetBlendMode( BLEND_MODE.addWithAlpha )
	f1_arg0.largeNodeRight:SetBlendMode( BLEND_MODE.addWithAlpha )
	f1_arg0.smallNodeBottomRight:SetBlendMode( BLEND_MODE.addWithAlpha )
	f1_arg0.smallNodeBottomLeft:SetBlendMode( BLEND_MODE.addWithAlpha )
	f1_arg0.largeNodeLeft:SetBlendMode( BLEND_MODE.addWithAlpha )
	f1_arg0.largeCenterCircle:SetBlendMode( BLEND_MODE.addWithAlpha )
	local f1_local5 = function ( f2_arg0 )
		local f2_local0 = f1_local4:GetValue( f1_arg1 )
		local f2_local1 = f1_local1:GetValue( f1_arg1 )
		local f2_local2 = f1_local2:GetValue( f1_arg1 )
		local f2_local3 = f2_local1 == JackalModes.landing
		local f2_local4 = f1_local3:GetValue( f1_arg1 )
		local f2_local5 = nil
		if f2_local2 or f2_local4 or f2_local3 then
			f2_local5 = "noGunsMode"
		elseif f2_local0 == JackalWeapons.Guns then
			f2_local5 = "strikeMode"
		elseif f2_local0 == JackalWeapons.Cannons then
			f2_local5 = "assaultMode"
		else
			f2_local5 = "noGunsMode"
		end
		if f1_arg0._currentAnimation ~= f2_local5 then
			ACTIONS.AnimateSequence( f1_arg0, f2_local5 )
			f1_arg0._currentAnimation = f2_local5
		end
	end
	
	f1_local5()
	f1_arg0:SubscribeToModel( f1_local4:GetModel( f1_arg1 ), f1_local5, true )
	f1_arg0:SubscribeToModel( f1_local3:GetModel( f1_arg1 ), f1_local5, true )
	f1_arg0:SubscribeToModel( f1_local2:GetModel( f1_arg1 ), f1_local5, true )
end

function JackalCenterReticle( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 188 * _1080p, 0, 188 * _1080p )
	self.id = "JackalCenterReticle"
	self._animationSets = {}
	self._sequences = {}
	local f3_local1 = controller and controller.controllerIndex
	if not f3_local1 and not Engine.InFrontend() then
		f3_local1 = self:getRootController()
	end
	assert( f3_local1 )
	local f3_local2 = self
	local largeCenterCircleShadow = nil
	
	largeCenterCircleShadow = LUI.UIImage.new()
	largeCenterCircleShadow.id = "largeCenterCircleShadow"
	largeCenterCircleShadow:SetRGBFromTable( SWATCHES.jackal.flightStatusBarBackground, 0 )
	largeCenterCircleShadow:SetAlpha( 0, 0 )
	largeCenterCircleShadow:SetScale( 0.69, 0 )
	largeCenterCircleShadow:setImage( RegisterMaterial( "hud_ability_base_circle" ), 0 )
	largeCenterCircleShadow:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -100, _1080p * 100, _1080p * -100, _1080p * 100 )
	self:addElement( largeCenterCircleShadow )
	self.largeCenterCircleShadow = largeCenterCircleShadow
	
	local largeCenterCircle = nil
	
	largeCenterCircle = LUI.UIImage.new()
	largeCenterCircle.id = "largeCenterCircle"
	largeCenterCircle:setImage( RegisterMaterial( "hud_jackal_strike_reticule_piece_center_circle_xl" ), 0 )
	largeCenterCircle:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -80, _1080p * 80, _1080p * -80, _1080p * 80 )
	self:addElement( largeCenterCircle )
	self.largeCenterCircle = largeCenterCircle
	
	local largeNodeLeft = nil
	
	largeNodeLeft = LUI.UIImage.new()
	largeNodeLeft.id = "largeNodeLeft"
	largeNodeLeft:setImage( RegisterMaterial( "hud_jackal_strike_reticule_piece_center_node_md" ), 0 )
	largeNodeLeft:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -86, _1080p * -70, _1080p * -8, _1080p * 8 )
	self:addElement( largeNodeLeft )
	self.largeNodeLeft = largeNodeLeft
	
	local smallNodeBottomLeft = nil
	
	smallNodeBottomLeft = LUI.UIImage.new()
	smallNodeBottomLeft.id = "smallNodeBottomLeft"
	smallNodeBottomLeft:setImage( RegisterMaterial( "hud_jackal_strike_reticule_piece_center_node_sm" ), 0 )
	smallNodeBottomLeft:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -63, _1080p * -47, _1080p * 48, _1080p * 64 )
	self:addElement( smallNodeBottomLeft )
	self.smallNodeBottomLeft = smallNodeBottomLeft
	
	local smallNodeBottomRight = nil
	
	smallNodeBottomRight = LUI.UIImage.new()
	smallNodeBottomRight.id = "smallNodeBottomRight"
	smallNodeBottomRight:setImage( RegisterMaterial( "hud_jackal_strike_reticule_piece_center_node_sm" ), 0 )
	smallNodeBottomRight:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 46, _1080p * 62, _1080p * 48, _1080p * 64 )
	self:addElement( smallNodeBottomRight )
	self.smallNodeBottomRight = smallNodeBottomRight
	
	local largeNodeRight = nil
	
	largeNodeRight = LUI.UIImage.new()
	largeNodeRight.id = "largeNodeRight"
	largeNodeRight:setImage( RegisterMaterial( "hud_jackal_strike_reticule_piece_center_node_md" ), 0 )
	largeNodeRight:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 70, _1080p * 86, _1080p * -8, _1080p * 8 )
	self:addElement( largeNodeRight )
	self.largeNodeRight = largeNodeRight
	
	local smallNodeTopRight = nil
	
	smallNodeTopRight = LUI.UIImage.new()
	smallNodeTopRight.id = "smallNodeTopRight"
	smallNodeTopRight:setImage( RegisterMaterial( "hud_jackal_strike_reticule_piece_center_node_sm" ), 0 )
	smallNodeTopRight:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 46, _1080p * 62, _1080p * -64, _1080p * -48 )
	self:addElement( smallNodeTopRight )
	self.smallNodeTopRight = smallNodeTopRight
	
	local smallNodeTopLeft = nil
	
	smallNodeTopLeft = LUI.UIImage.new()
	smallNodeTopLeft.id = "smallNodeTopLeft"
	smallNodeTopLeft:setImage( RegisterMaterial( "hud_jackal_strike_reticule_piece_center_node_sm" ), 0 )
	smallNodeTopLeft:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -62, _1080p * -46, _1080p * -64, _1080p * -48 )
	self:addElement( smallNodeTopLeft )
	self.smallNodeTopLeft = smallNodeTopLeft
	
	local crosshairs = nil
	
	crosshairs = MenuBuilder.BuildRegisteredType( "GenericReticleCrosshairs", {
		controllerIndex = f3_local1
	} )
	crosshairs.id = "crosshairs"
	crosshairs:SetRGBFromTable( SWATCHES.jackal.stable, 0 )
	crosshairs.rightLine:SetLeft( _1080p * -60, 0 )
	crosshairs.rightLine:SetTop( _1080p * -0.5, 0 )
	crosshairs.rightLine:SetBottom( _1080p * 0.5, 0 )
	crosshairs.leftLine:SetRight( _1080p * 60, 0 )
	crosshairs.leftLine:SetTop( _1080p * -0.5, 0 )
	crosshairs.leftLine:SetBottom( _1080p * 0.5, 0 )
	crosshairs.bottomLine:SetLeft( _1080p * -0.5, 0 )
	crosshairs.bottomLine:SetRight( _1080p * 0.5, 0 )
	crosshairs.bottomLine:SetTop( _1080p * -60, 0 )
	crosshairs.topLine:SetLeft( _1080p * -0.5, 0 )
	crosshairs.topLine:SetRight( _1080p * 0.5, 0 )
	crosshairs.topLine:SetBottom( _1080p * 60, 0 )
	crosshairs:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, 0, 0 )
	self:addElement( crosshairs )
	self.crosshairs = crosshairs
	
	local brackets = nil
	
	brackets = MenuBuilder.BuildRegisteredType( "GenericReticleBrackets", {
		controllerIndex = f3_local1
	} )
	brackets.id = "brackets"
	brackets:SetRGBFromTable( SWATCHES.jackal.stable, 0 )
	brackets.BottomRightBracketHorzLine:SetLeft( _1080p * -30, 0 )
	brackets.BottomRightBracketVertLine:SetTop( _1080p * -30, 0 )
	brackets.BottomLeftBracketHorzLine:SetRight( _1080p * 30, 0 )
	brackets.BottomLeftBracketVertLine:SetTop( _1080p * -30, 0 )
	brackets.TopRightBracketHorzLine:SetLeft( _1080p * -30, 0 )
	brackets.TopRightBracketVertLine:SetBottom( _1080p * 30, 0 )
	brackets.TopLeftBracketHorzLine:SetRight( _1080p * 30, 0 )
	brackets.TopLeftBracketVertLine:SetBottom( _1080p * 30, 0 )
	brackets:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -102, _1080p * 102, _1080p * -102, _1080p * 102 )
	self:addElement( brackets )
	self.brackets = brackets
	
	local BlurRing = nil
	
	BlurRing = MenuBuilder.BuildRegisteredType( "JackalCenterReticleBlurRing", {
		controllerIndex = f3_local1
	} )
	BlurRing.id = "BlurRing"
	BlurRing:SetAlpha( 0.25, 0 )
	BlurRing:SetScale( -0.25, 0 )
	BlurRing:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -256, _1080p * 256, _1080p * -256, _1080p * 256 )
	self:addElement( BlurRing )
	self.BlurRing = BlurRing
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		largeCenterCircleShadow:RegisterAnimationSequence( "assaultMode", {
			{
				function ()
					return self.largeCenterCircleShadow:SetAlpha( 0, 100 )
				end,
				function ()
					return self.largeCenterCircleShadow:SetAlpha( 0, 660 )
				end,
				function ()
					return self.largeCenterCircleShadow:SetAlpha( 0.08, 150 )
				end
			},
			{
				function ()
					return self.largeCenterCircleShadow:SetScale( 0.69, 760 )
				end
			}
		} )
		largeCenterCircle:RegisterAnimationSequence( "assaultMode", {
			{
				function ()
					return self.largeCenterCircle:SetScale( 0, 200, LUI.EASING.inOutBack )
				end,
				function ()
					return self.largeCenterCircle:SetScale( 1, 600, LUI.EASING.inOutBack )
				end
			},
			{
				function ()
					return self.largeCenterCircle:SetAlpha( 0, 800, LUI.EASING.inOutBack )
				end
			}
		} )
		largeNodeLeft:RegisterAnimationSequence( "assaultMode", {
			{
				function ()
					return self.largeNodeLeft:SetScale( 0, 50 )
				end,
				function ()
					return self.largeNodeLeft:SetScale( 1, 100, LUI.EASING.outBack )
				end
			},
			{
				function ()
					return self.largeNodeLeft:SetAlpha( 0, 150, LUI.EASING.outBack )
				end
			}
		} )
		smallNodeBottomLeft:RegisterAnimationSequence( "assaultMode", {
			{
				function ()
					return self.smallNodeBottomLeft:SetScale( 0, 100 )
				end,
				function ()
					return self.smallNodeBottomLeft:SetScale( 1, 100, LUI.EASING.outBack )
				end
			},
			{
				function ()
					return self.smallNodeBottomLeft:SetAlpha( 0, 200, LUI.EASING.outBack )
				end
			}
		} )
		smallNodeBottomRight:RegisterAnimationSequence( "assaultMode", {
			{
				function ()
					return self.smallNodeBottomRight:SetScale( 0, 150 )
				end,
				function ()
					return self.smallNodeBottomRight:SetScale( 1, 100, LUI.EASING.outBack )
				end
			},
			{
				function ()
					return self.smallNodeBottomRight:SetAlpha( 0, 250, LUI.EASING.outBack )
				end
			}
		} )
		largeNodeRight:RegisterAnimationSequence( "assaultMode", {
			{
				function ()
					return self.largeNodeRight:SetScale( 0, 200 )
				end,
				function ()
					return self.largeNodeRight:SetScale( 1, 100, LUI.EASING.outBack )
				end
			},
			{
				function ()
					return self.largeNodeRight:SetAlpha( 0, 300, LUI.EASING.outBack )
				end
			}
		} )
		smallNodeTopRight:RegisterAnimationSequence( "assaultMode", {
			{
				function ()
					return self.smallNodeTopRight:SetScale( 0, 250 )
				end,
				function ()
					return self.smallNodeTopRight:SetScale( 1, 100, LUI.EASING.outBack )
				end
			},
			{
				function ()
					return self.smallNodeTopRight:SetAlpha( 0, 350, LUI.EASING.outBack )
				end
			}
		} )
		smallNodeTopLeft:RegisterAnimationSequence( "assaultMode", {
			{
				function ()
					return self.smallNodeTopLeft:SetScale( 0, 0 )
				end,
				function ()
					return self.smallNodeTopLeft:SetScale( 1, 100, LUI.EASING.outBack )
				end
			},
			{
				function ()
					return self.smallNodeTopLeft:SetAlpha( 0, 100, LUI.EASING.outBack )
				end
			}
		} )
		crosshairs:RegisterAnimationSequence( "assaultMode", {
			{
				function ()
					return self.crosshairs.topLine:SetBottom( _1080p * 60, 0 )
				end
			},
			{
				function ()
					return self.crosshairs.bottomLine:SetTop( _1080p * -60, 0 )
				end
			},
			{
				function ()
					return self.crosshairs.leftLine:SetRight( _1080p * 60, 0 )
				end
			},
			{
				function ()
					return self.crosshairs.rightLine:SetLeft( _1080p * -60, 0 )
				end
			},
			{
				function ()
					return self.crosshairs:SetAlpha( 0, 400, LUI.EASING.inOutBack )
				end,
				function ()
					return self.crosshairs:SetAlpha( 1, 350, LUI.EASING.inOutBack )
				end
			},
			{
				function ()
					return self.crosshairs:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, 0, 0, 0 )
				end,
				function ()
					return self.crosshairs:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * -60, _1080p * 60, _1080p * -60, _1080p * 60, 400, LUI.EASING.inOutBack )
				end,
				function ()
					return self.crosshairs:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, 0, 0, 349, LUI.EASING.inOutBack )
				end
			}
		} )
		brackets:RegisterAnimationSequence( "assaultMode", {
			{
				function ()
					return self.brackets:SetAlpha( 0, 300 )
				end,
				function ()
					return self.brackets:SetAlpha( 0.2, 600, LUI.EASING.inOutBack )
				end
			},
			{
				function ()
					return self.brackets:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -270, _1080p * 270, _1080p * -270, _1080p * 270, 0 )
				end,
				function ()
					return self.brackets:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -202, _1080p * 202, _1080p * -202, _1080p * 202, 300 )
				end,
				function ()
					return self.brackets:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -102, _1080p * 102, _1080p * -102, _1080p * 102, 599, LUI.EASING.inOutBack )
				end
			}
		} )
		BlurRing:RegisterAnimationSequence( "assaultMode", {
			{
				function ()
					return self.BlurRing:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.assaultMode = function ()
			largeCenterCircleShadow:AnimateSequence( "assaultMode" )
			largeCenterCircle:AnimateSequence( "assaultMode" )
			largeNodeLeft:AnimateSequence( "assaultMode" )
			smallNodeBottomLeft:AnimateSequence( "assaultMode" )
			smallNodeBottomRight:AnimateSequence( "assaultMode" )
			largeNodeRight:AnimateSequence( "assaultMode" )
			smallNodeTopRight:AnimateSequence( "assaultMode" )
			smallNodeTopLeft:AnimateSequence( "assaultMode" )
			crosshairs:AnimateSequence( "assaultMode" )
			brackets:AnimateSequence( "assaultMode" )
			BlurRing:AnimateSequence( "assaultMode" )
		end
		
		largeCenterCircleShadow:RegisterAnimationSequence( "strikeMode", {
			{
				function ()
					return self.largeCenterCircleShadow:SetAlpha( 0, 100 )
				end,
				function ()
					return self.largeCenterCircleShadow:SetAlpha( 0, 560 )
				end,
				function ()
					return self.largeCenterCircleShadow:SetAlpha( 0.08, 420 )
				end
			},
			{
				function ()
					return self.largeCenterCircleShadow:SetScale( 0.27, 660 )
				end
			}
		} )
		largeCenterCircle:RegisterAnimationSequence( "strikeMode", {
			{
				function ()
					return self.largeCenterCircle:SetScale( 1, 300, LUI.EASING.inOutBack )
				end,
				function ()
					return self.largeCenterCircle:SetScale( 0, 400, LUI.EASING.inOutBack )
				end
			},
			{
				function ()
					return self.largeCenterCircle:SetAlpha( 0, 300, LUI.EASING.inOutBack )
				end,
				function ()
					return self.largeCenterCircle:SetAlpha( 1, 400, LUI.EASING.inOutBack )
				end
			}
		} )
		largeNodeLeft:RegisterAnimationSequence( "strikeMode", {
			{
				function ()
					return self.largeNodeLeft:SetAlpha( 0, 870 )
				end,
				function ()
					return self.largeNodeLeft:SetAlpha( 1, 10 )
				end,
				function ()
					return self.largeNodeLeft:SetAlpha( 1, 100 )
				end
			},
			{
				function ()
					return self.largeNodeLeft:SetScale( 1, 880 )
				end,
				function ()
					return self.largeNodeLeft:SetScale( 0, 100 )
				end
			}
		} )
		smallNodeBottomLeft:RegisterAnimationSequence( "strikeMode", {
			{
				function ()
					return self.smallNodeBottomLeft:SetAlpha( 0, 800 )
				end,
				function ()
					return self.smallNodeBottomLeft:SetAlpha( 1, 10 )
				end,
				function ()
					return self.smallNodeBottomLeft:SetAlpha( 1, 100 )
				end
			},
			{
				function ()
					return self.smallNodeBottomLeft:SetScale( 1, 810 )
				end,
				function ()
					return self.smallNodeBottomLeft:SetScale( 0, 100 )
				end
			}
		} )
		smallNodeBottomRight:RegisterAnimationSequence( "strikeMode", {
			{
				function ()
					return self.smallNodeBottomRight:SetAlpha( 0, 730 )
				end,
				function ()
					return self.smallNodeBottomRight:SetAlpha( 1, 10 )
				end,
				function ()
					return self.smallNodeBottomRight:SetAlpha( 1, 100 )
				end
			},
			{
				function ()
					return self.smallNodeBottomRight:SetScale( 1, 740 )
				end,
				function ()
					return self.smallNodeBottomRight:SetScale( 0, 100 )
				end
			}
		} )
		largeNodeRight:RegisterAnimationSequence( "strikeMode", {
			{
				function ()
					return self.largeNodeRight:SetAlpha( 0, 660 )
				end,
				function ()
					return self.largeNodeRight:SetAlpha( 1, 10 )
				end,
				function ()
					return self.largeNodeRight:SetAlpha( 1, 100 )
				end
			},
			{
				function ()
					return self.largeNodeRight:SetScale( 1, 670 )
				end,
				function ()
					return self.largeNodeRight:SetScale( 0, 100 )
				end
			}
		} )
		smallNodeTopRight:RegisterAnimationSequence( "strikeMode", {
			{
				function ()
					return self.smallNodeTopRight:SetAlpha( 0, 590 )
				end,
				function ()
					return self.smallNodeTopRight:SetAlpha( 1, 10 )
				end,
				function ()
					return self.smallNodeTopRight:SetAlpha( 1, 100 )
				end
			},
			{
				function ()
					return self.smallNodeTopRight:SetScale( 1, 600 )
				end,
				function ()
					return self.smallNodeTopRight:SetScale( 0, 100 )
				end
			}
		} )
		smallNodeTopLeft:RegisterAnimationSequence( "strikeMode", {
			{
				function ()
					return self.smallNodeTopLeft:SetAlpha( 0, 940 )
				end,
				function ()
					return self.smallNodeTopLeft:SetAlpha( 1, 10 )
				end,
				function ()
					return self.smallNodeTopLeft:SetAlpha( 1, 100 )
				end
			},
			{
				function ()
					return self.smallNodeTopLeft:SetScale( 1, 950 )
				end,
				function ()
					return self.smallNodeTopLeft:SetScale( 0, 100 )
				end
			}
		} )
		crosshairs:RegisterAnimationSequence( "strikeMode", {
			{
				function ()
					return self.crosshairs.topLine:SetBottom( _1080p * 60, 0 )
				end,
				function ()
					return self.crosshairs.topLine:SetBottom( _1080p * 62, 750, LUI.EASING.inOutBack )
				end
			},
			{
				function ()
					return self.crosshairs.bottomLine:SetTop( _1080p * -60, 0 )
				end,
				function ()
					return self.crosshairs.bottomLine:SetTop( _1080p * -62, 750, LUI.EASING.inOutBack )
				end
			},
			{
				function ()
					return self.crosshairs.leftLine:SetRight( _1080p * 60, 0 )
				end,
				function ()
					return self.crosshairs.leftLine:SetRight( _1080p * 62, 750, LUI.EASING.inOutBack )
				end
			},
			{
				function ()
					return self.crosshairs.rightLine:SetLeft( _1080p * -60, 0 )
				end,
				function ()
					return self.crosshairs.rightLine:SetLeft( _1080p * -62, 750, LUI.EASING.inOutBack )
				end
			},
			{
				function ()
					return self.crosshairs:SetAlpha( 0, 400, LUI.EASING.inOutBack )
				end,
				function ()
					return self.crosshairs:SetAlpha( 1, 350, LUI.EASING.inOutBack )
				end
			},
			{
				function ()
					return self.crosshairs:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, 0, 0, 0 )
				end,
				function ()
					return self.crosshairs:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * -60, _1080p * 60, _1080p * -60, _1080p * 60, 400, LUI.EASING.inOutBack )
				end,
				function ()
					return self.crosshairs:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * -10.94, _1080p * 10.94, _1080p * -10.94, _1080p * 10.94, 299 )
				end,
				function ()
					return self.crosshairs:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * -14, _1080p * 14, _1080p * -14, _1080p * 14, 50, LUI.EASING.inOutBack )
				end
			}
		} )
		brackets:RegisterAnimationSequence( "strikeMode", {
			{
				function ()
					return self.brackets:SetAlpha( 0, 600, LUI.EASING.inOutBack )
				end
			},
			{
				function ()
					return self.brackets:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -102, _1080p * 102, _1080p * -102, _1080p * 102, 0 )
				end,
				function ()
					return self.brackets:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -202, _1080p * 202, _1080p * -202, _1080p * 202, 600, LUI.EASING.inOutBack )
				end
			}
		} )
		BlurRing:RegisterAnimationSequence( "strikeMode", {
			{
				function ()
					return self.BlurRing:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.strikeMode = function ()
			largeCenterCircleShadow:AnimateSequence( "strikeMode" )
			largeCenterCircle:AnimateSequence( "strikeMode" )
			largeNodeLeft:AnimateSequence( "strikeMode" )
			smallNodeBottomLeft:AnimateSequence( "strikeMode" )
			smallNodeBottomRight:AnimateSequence( "strikeMode" )
			largeNodeRight:AnimateSequence( "strikeMode" )
			smallNodeTopRight:AnimateSequence( "strikeMode" )
			smallNodeTopLeft:AnimateSequence( "strikeMode" )
			crosshairs:AnimateSequence( "strikeMode" )
			brackets:AnimateSequence( "strikeMode" )
			BlurRing:AnimateSequence( "strikeMode" )
		end
		
		largeCenterCircleShadow:RegisterAnimationSequence( "noGunsMode", {
			{
				function ()
					return self.largeCenterCircleShadow:SetAlpha( 0, 100 )
				end
			}
		} )
		largeCenterCircle:RegisterAnimationSequence( "noGunsMode", {
			{
				function ()
					return self.largeCenterCircle:SetAlpha( 0, 100 )
				end
			},
			{
				function ()
					return self.largeCenterCircle:SetScale( 0, 100 )
				end
			},
			{
				function ()
					return self.largeCenterCircle:SetRGBFromTable( SWATCHES.jackal.stable, 100 )
				end
			}
		} )
		largeNodeLeft:RegisterAnimationSequence( "noGunsMode", {
			{
				function ()
					return self.largeNodeLeft:SetAlpha( 0, 100 )
				end
			}
		} )
		smallNodeBottomLeft:RegisterAnimationSequence( "noGunsMode", {
			{
				function ()
					return self.smallNodeBottomLeft:SetAlpha( 0, 100 )
				end
			}
		} )
		smallNodeBottomRight:RegisterAnimationSequence( "noGunsMode", {
			{
				function ()
					return self.smallNodeBottomRight:SetAlpha( 0, 100 )
				end
			}
		} )
		largeNodeRight:RegisterAnimationSequence( "noGunsMode", {
			{
				function ()
					return self.largeNodeRight:SetAlpha( 0, 100 )
				end
			}
		} )
		smallNodeTopRight:RegisterAnimationSequence( "noGunsMode", {
			{
				function ()
					return self.smallNodeTopRight:SetAlpha( 0, 100 )
				end
			}
		} )
		smallNodeTopLeft:RegisterAnimationSequence( "noGunsMode", {
			{
				function ()
					return self.smallNodeTopLeft:SetAlpha( 0, 100 )
				end
			}
		} )
		crosshairs:RegisterAnimationSequence( "noGunsMode", {
			{
				function ()
					return self.crosshairs.rightLine:SetLeft( _1080p * -15, 100 )
				end
			},
			{
				function ()
					return self.crosshairs.leftLine:SetRight( _1080p * 15, 100 )
				end
			},
			{
				function ()
					return self.crosshairs.bottomLine:SetTop( _1080p * -15, 100 )
				end
			},
			{
				function ()
					return self.crosshairs.topLine:SetBottom( _1080p * 15, 100 )
				end
			},
			{
				function ()
					return self.crosshairs:SetAlpha( 0, 100 )
				end
			},
			{
				function ()
					return self.crosshairs:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * 70, _1080p * -70, _1080p * 70, _1080p * -70, 100 )
				end
			}
		} )
		brackets:RegisterAnimationSequence( "noGunsMode", {
			{
				function ()
					return self.brackets:SetAlpha( 0, 100 )
				end
			}
		} )
		BlurRing:RegisterAnimationSequence( "noGunsMode", {
			{
				function ()
					return self.BlurRing:SetAlpha( 0.1, 100 )
				end
			}
		} )
		self._sequences.noGunsMode = function ()
			largeCenterCircleShadow:AnimateSequence( "noGunsMode" )
			largeCenterCircle:AnimateSequence( "noGunsMode" )
			largeNodeLeft:AnimateSequence( "noGunsMode" )
			smallNodeBottomLeft:AnimateSequence( "noGunsMode" )
			smallNodeBottomRight:AnimateSequence( "noGunsMode" )
			largeNodeRight:AnimateSequence( "noGunsMode" )
			smallNodeTopRight:AnimateSequence( "noGunsMode" )
			smallNodeTopLeft:AnimateSequence( "noGunsMode" )
			crosshairs:AnimateSequence( "noGunsMode" )
			brackets:AnimateSequence( "noGunsMode" )
			BlurRing:AnimateSequence( "noGunsMode" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	PostLoadFunc( self, f3_local1, controller )
	return self
end

MenuBuilder.registerType( "JackalCenterReticle", JackalCenterReticle )
LockTable( _M )
