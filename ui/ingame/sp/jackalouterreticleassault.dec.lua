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
		if f2_local1 or f2_local2 or f2_local0 == JackalWeapons.Guns then
			f2_local3 = "outro"
		elseif f2_local0 == JackalWeapons.Cannons then
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

function JackalOuterReticleAssault( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 500 * _1080p, 0, 500 * _1080p )
	self.id = "JackalOuterReticleAssault"
	self._animationSets = {}
	self._sequences = {}
	local f3_local1 = controller and controller.controllerIndex
	if not f3_local1 and not Engine.InFrontend() then
		f3_local1 = self:getRootController()
	end
	assert( f3_local1 )
	local f3_local2 = self
	local JackalAssaultOuterCircle = nil
	
	JackalAssaultOuterCircle = MenuBuilder.BuildRegisteredType( "JackalAssaultOuterCircle", {
		controllerIndex = f3_local1
	} )
	JackalAssaultOuterCircle.id = "JackalAssaultOuterCircle"
	JackalAssaultOuterCircle:SetAlpha( 0.5, 0 )
	JackalAssaultOuterCircle:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -341, _1080p * 341, _1080p * -321, _1080p * 321 )
	self:addElement( JackalAssaultOuterCircle )
	self.JackalAssaultOuterCircle = JackalAssaultOuterCircle
	
	local assaultInnerVertCurveRight = nil
	
	assaultInnerVertCurveRight = LUI.UIImage.new()
	assaultInnerVertCurveRight.id = "assaultInnerVertCurveRight"
	assaultInnerVertCurveRight:SetAlpha( 0.4, 0 )
	assaultInnerVertCurveRight:setImage( RegisterMaterial( "hud_jackal_assault_reticule_vert_curve" ), 0 )
	assaultInnerVertCurveRight:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 226, _1080p * 290, _1080p * -256, _1080p * 256 )
	self:addElement( assaultInnerVertCurveRight )
	self.assaultInnerVertCurveRight = assaultInnerVertCurveRight
	
	local assaultInnerVertCurveLeft = nil
	
	assaultInnerVertCurveLeft = LUI.UIImage.new()
	assaultInnerVertCurveLeft.id = "assaultInnerVertCurveLeft"
	assaultInnerVertCurveLeft:SetAlpha( 0.4, 0 )
	assaultInnerVertCurveLeft:setImage( RegisterMaterial( "hud_jackal_assault_reticule_vert_curve" ), 0 )
	assaultInnerVertCurveLeft:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -226, _1080p * -290, _1080p * -256, _1080p * 256 )
	self:addElement( assaultInnerVertCurveLeft )
	self.assaultInnerVertCurveLeft = assaultInnerVertCurveLeft
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		JackalAssaultOuterCircle:RegisterAnimationSequence( "intro", {
			{
				function ()
					return self.JackalAssaultOuterCircle:SetScale( 1, 0 )
				end,
				function ()
					return self.JackalAssaultOuterCircle:SetScale( 0, 720, LUI.EASING.inOutBack )
				end
			},
			{
				function ()
					return self.JackalAssaultOuterCircle:SetAlpha( 0, 0 )
				end,
				function ()
					return self.JackalAssaultOuterCircle:SetAlpha( 0.5, 720, LUI.EASING.inOutBack )
				end
			},
			{
				function ()
					return self.JackalAssaultOuterCircle:SetZRotation( 180, 0 )
				end,
				function ()
					return self.JackalAssaultOuterCircle:SetZRotation( 0, 720, LUI.EASING.inOutBack )
				end
			},
			{
				function ()
					return self.JackalAssaultOuterCircle:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -341, _1080p * 341, _1080p * -321, _1080p * 321, 0 )
				end,
				function ()
					return self.JackalAssaultOuterCircle:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -341, _1080p * 341, _1080p * -321, _1080p * 321, 720, LUI.EASING.inOutBack )
				end
			}
		} )
		assaultInnerVertCurveRight:RegisterAnimationSequence( "intro", {
			{
				function ()
					return self.assaultInnerVertCurveRight:SetAlpha( 0, 0 )
				end,
				function ()
					return self.assaultInnerVertCurveRight:SetAlpha( 0, 350 )
				end,
				function ()
					return self.assaultInnerVertCurveRight:SetAlpha( 0.4, 300, LUI.EASING.inOutBack )
				end
			},
			{
				function ()
					return self.assaultInnerVertCurveRight:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 240, _1080p * 304, _1080p * -256, _1080p * 256, 0 )
				end,
				function ()
					return self.assaultInnerVertCurveRight:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, 0, _1080p * 64, _1080p * -256, _1080p * 256, 349 )
				end,
				function ()
					return self.assaultInnerVertCurveRight:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 206, _1080p * 270, _1080p * -256, _1080p * 256, 299, LUI.EASING.inOutBack )
				end,
				function ()
					return self.assaultInnerVertCurveRight:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 226, _1080p * 290, _1080p * -256, _1080p * 256, 70 )
				end
			}
		} )
		assaultInnerVertCurveLeft:RegisterAnimationSequence( "intro", {
			{
				function ()
					return self.assaultInnerVertCurveLeft:SetAlpha( 0, 0 )
				end,
				function ()
					return self.assaultInnerVertCurveLeft:SetAlpha( 0, 350 )
				end,
				function ()
					return self.assaultInnerVertCurveLeft:SetAlpha( 0.4, 300, LUI.EASING.inOutBack )
				end
			},
			{
				function ()
					return self.assaultInnerVertCurveLeft:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -240, _1080p * -304, _1080p * -256, _1080p * 256, 0 )
				end,
				function ()
					return self.assaultInnerVertCurveLeft:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, 0, _1080p * -64, _1080p * -256, _1080p * 256, 349 )
				end,
				function ()
					return self.assaultInnerVertCurveLeft:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -206, _1080p * -270, _1080p * -256, _1080p * 256, 299, LUI.EASING.inOutBack )
				end,
				function ()
					return self.assaultInnerVertCurveLeft:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -226, _1080p * -290, _1080p * -256, _1080p * 256, 70 )
				end
			}
		} )
		self._sequences.intro = function ()
			JackalAssaultOuterCircle:AnimateSequence( "intro" )
			assaultInnerVertCurveRight:AnimateSequence( "intro" )
			assaultInnerVertCurveLeft:AnimateSequence( "intro" )
		end
		
		JackalAssaultOuterCircle:RegisterAnimationSequence( "outro", {
			{
				function ()
					return self.JackalAssaultOuterCircle:SetScale( 0, 100, LUI.EASING.inOutBack )
				end,
				function ()
					return self.JackalAssaultOuterCircle:SetScale( 1, 650, LUI.EASING.inOutBack )
				end
			},
			{
				function ()
					return self.JackalAssaultOuterCircle:SetZRotation( 0, 100, LUI.EASING.inOutBack )
				end,
				function ()
					return self.JackalAssaultOuterCircle:SetZRotation( -180, 650, LUI.EASING.inOutBack )
				end
			},
			{
				function ()
					return self.JackalAssaultOuterCircle:SetAlpha( 0, 750, LUI.EASING.inOutBack )
				end
			}
		} )
		assaultInnerVertCurveRight:RegisterAnimationSequence( "outro", {
			{
				function ()
					return self.assaultInnerVertCurveRight:SetAlpha( 0, 500, LUI.EASING.inOutBack )
				end
			},
			{
				function ()
					return self.assaultInnerVertCurveRight:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 226, _1080p * 290, _1080p * -256, _1080p * 256, 100, LUI.EASING.inOutBack )
				end,
				function ()
					return self.assaultInnerVertCurveRight:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, 0, _1080p * 64, _1080p * -256, _1080p * 256, 399, LUI.EASING.inOutBack )
				end
			}
		} )
		assaultInnerVertCurveLeft:RegisterAnimationSequence( "outro", {
			{
				function ()
					return self.assaultInnerVertCurveLeft:SetAlpha( 0, 500, LUI.EASING.inOutBack )
				end
			},
			{
				function ()
					return self.assaultInnerVertCurveLeft:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -226, _1080p * -290, _1080p * -256, _1080p * 256, 100, LUI.EASING.inOutBack )
				end,
				function ()
					return self.assaultInnerVertCurveLeft:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, 0, _1080p * -64, _1080p * -256, _1080p * 256, 399, LUI.EASING.inOutBack )
				end
			}
		} )
		self._sequences.outro = function ()
			JackalAssaultOuterCircle:AnimateSequence( "outro" )
			assaultInnerVertCurveRight:AnimateSequence( "outro" )
			assaultInnerVertCurveLeft:AnimateSequence( "outro" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	PostLoadFunc( self, f3_local1, controller )
	return self
end

MenuBuilder.registerType( "JackalOuterReticleAssault", JackalOuterReticleAssault )
LockTable( _M )
