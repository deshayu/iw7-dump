local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function PostLoadFunc( f1_arg0, f1_arg1, f1_arg2 )
	f1_arg0.JackalCenterReticleADSBrackets:SetBlendMode( BLEND_MODE.addWithAlpha )
	f1_arg0.CenterADSCircle:SetBlendMode( BLEND_MODE.addWithAlpha )
	f1_arg0.dot1:SetBlendMode( BLEND_MODE.addWithAlpha )
	f1_arg0.dot2:SetBlendMode( BLEND_MODE.addWithAlpha )
	f1_arg0.dot3:SetBlendMode( BLEND_MODE.addWithAlpha )
	f1_arg0.dot4:SetBlendMode( BLEND_MODE.addWithAlpha )
	f1_arg0.JackalTargetAimRate:SetBlendMode( BLEND_MODE.addWithAlpha )
	f1_arg0.ADS:SetBlendMode( BLEND_MODE.addWithAlpha )
	local f1_local0 = DataSources.inGame.player.inADS
	local f1_local1 = DataSources.inGame.jackal.mode
	local f1_local2 = DataSources.inGame.jackal.autopilot
	local f1_local3 = DataSources.inGame.jackal.noGunsModeActive
	f1_arg0.inADS = true
	f1_arg0:SubscribeToModel( f1_local0:GetModel( f1_arg1 ), function ( f2_arg0 )
		local f2_local0 = f1_local0:GetValue( f1_arg1 )
		local f2_local1 = f1_local2:GetValue( f1_arg1 )
		local f2_local2 = f1_local1:GetValue( f1_arg1 ) == JackalModes.landing
		local f2_local3 = f1_local3:GetValue( f1_arg1 )
		if f2_local0 and not f2_local1 and not f2_local2 and not f2_local3 and not f1_arg0.inADS then
			ACTIONS.AnimateSequence( f1_arg0, "isADS" )
			f1_arg0.inADS = true
		elseif not (f2_local1 or f2_local2 or f2_local3) or f1_arg0.inADS then
			ACTIONS.AnimateSequence( f1_arg0, "isNotADS" )
			f1_arg0.inADS = false
		end
	end, true )
	local f1_local4 = DataSources.inGame.jackal.specialistAdsMask
	local f1_local5 = DataSources.inGame.jackal.aimTrackPercent
	f1_arg0:SubscribeToModel( f1_local5:GetModel( f1_arg1 ), function ()
		local f3_local0 = f1_local4:GetValue( f1_arg1 )
		local f3_local1 = f1_local5:GetValue( f1_arg1 ) * f3_local0
		local f3_local2 = 1
		if f3_local1 > 0.03 then
			f3_local2 = 1
		elseif f3_local1 <= 0.1 then
			f3_local2 = 0
		end
		f1_arg0.JackalTargetAimRate:SetAlpha( 0.5 * f3_local2 + 0.45, 0 )
		f1_arg0.CenterADSCircle:SetScale( f3_local1 * 0.1 + 1 + -1, 0 )
		f1_arg0.BackgroundCircle:SetScale( f3_local1 * 0.1 + 1 + -1, 0 )
		f1_arg0.JackalCenterReticleADSBrackets:SetScale( Mirror( f3_local1, 0, 1 ) * 0.2 + 0.8 + -1, 0 )
		f1_arg0.dot1:SetAlpha( 0.5 * f3_local2, 0 )
		f1_arg0.dot2:SetAlpha( 0.6 * f3_local2, 0 )
		f1_arg0.dot3:SetAlpha( 0.6 * f3_local2, 0 )
		f1_arg0.dot4:SetAlpha( 0.6 * f3_local2, 0 )
		f1_arg0.JackalTargetAimRate:SetupTrackJackalTargetLead( 0.75 * f3_local0 )
		f1_arg0.CenterADSCircle:SetupTrackJackalTargetLead( 0.45 * f3_local0 )
		f1_arg0.BackgroundCircle:SetupTrackJackalTargetLead( 0.45 * f3_local0 )
		f1_arg0.JackalCenterReticleADSBrackets:SetupTrackJackalTargetLead( 0.2 * f3_local0 )
		f1_arg0.dot2:SetupTrackJackalTargetLead( 0.25 * f3_local0 )
		f1_arg0.dot3:SetupTrackJackalTargetLead( 0.5 * f3_local0 )
		f1_arg0.dot4:SetupTrackJackalTargetLead( 0.75 * f3_local0 )
	end )
end

function JackalCenterReticleFireAlphaTesting( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 188 * _1080p, 0, 188 * _1080p )
	self.id = "JackalCenterReticleFireAlphaTesting"
	self._animationSets = {}
	self._sequences = {}
	local f4_local1 = controller and controller.controllerIndex
	if not f4_local1 and not Engine.InFrontend() then
		f4_local1 = self:getRootController()
	end
	assert( f4_local1 )
	local f4_local2 = self
	local BackgroundCircle = nil
	
	BackgroundCircle = LUI.UIImage.new()
	BackgroundCircle.id = "BackgroundCircle"
	BackgroundCircle:SetRGBFromTable( SWATCHES.jackal.flightStatusBarBackground, 0 )
	BackgroundCircle:SetAlpha( 0, 0 )
	BackgroundCircle:setImage( RegisterMaterial( "hud_ability_base_circle" ), 0 )
	BackgroundCircle:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -74, _1080p * 75, _1080p * -74, _1080p * 75 )
	self:addElement( BackgroundCircle )
	self.BackgroundCircle = BackgroundCircle
	
	local LockOn = nil
	
	LockOn = MenuBuilder.BuildRegisteredType( "JackalLockOn", {
		controllerIndex = f4_local1
	} )
	LockOn.id = "LockOn"
	LockOn:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -256, _1080p * 256, _1080p * -256, _1080p * 256 )
	self:addElement( LockOn )
	self.LockOn = LockOn
	
	local ADS = nil
	
	ADS = MenuBuilder.BuildRegisteredType( "JackalADSReticle", {
		controllerIndex = f4_local1
	} )
	ADS.id = "ADS"
	ADS:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -256, _1080p * 256, _1080p * -256, _1080p * 256 )
	self:addElement( ADS )
	self.ADS = ADS
	
	local JackalCenterReticleFireAnimation = nil
	
	JackalCenterReticleFireAnimation = MenuBuilder.BuildRegisteredType( "JackalCenterReticleFireAnimation", {
		controllerIndex = f4_local1
	} )
	JackalCenterReticleFireAnimation.id = "JackalCenterReticleFireAnimation"
	JackalCenterReticleFireAnimation:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 0.25, _1080p * 188.25, _1080p * 0.25, _1080p * 188.25 )
	self:addElement( JackalCenterReticleFireAnimation )
	self.JackalCenterReticleFireAnimation = JackalCenterReticleFireAnimation
	
	local CenterADSCircle = nil
	
	CenterADSCircle = LUI.UIImage.new()
	CenterADSCircle.id = "CenterADSCircle"
	CenterADSCircle:SetAlpha( 0, 0 )
	CenterADSCircle:setImage( RegisterMaterial( "hud_jackal_strike_reticule_piece_center_circle_xl" ), 0 )
	CenterADSCircle:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -64, _1080p * 64, _1080p * -64, _1080p * 64 )
	self:addElement( CenterADSCircle )
	self.CenterADSCircle = CenterADSCircle
	
	local JackalCenterReticleADSBrackets = nil
	
	JackalCenterReticleADSBrackets = MenuBuilder.BuildRegisteredType( "JackalCenterReticleADSBrackets", {
		controllerIndex = f4_local1
	} )
	JackalCenterReticleADSBrackets.id = "JackalCenterReticleADSBrackets"
	JackalCenterReticleADSBrackets:SetAlpha( 0, 0 )
	JackalCenterReticleADSBrackets:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -94, _1080p * 94, _1080p * -94, _1080p * 94 )
	self:addElement( JackalCenterReticleADSBrackets )
	self.JackalCenterReticleADSBrackets = JackalCenterReticleADSBrackets
	
	local dot1 = nil
	
	dot1 = LUI.UIImage.new()
	dot1.id = "dot1"
	dot1:SetRGBFromTable( SWATCHES.jackal.stable, 0 )
	dot1:setImage( RegisterMaterial( "hud_jackal_strike_reticule_piece_center_circle_sm" ), 0 )
	dot1:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -4, _1080p * 4, _1080p * -4, _1080p * 4 )
	self:addElement( dot1 )
	self.dot1 = dot1
	
	local dot2 = nil
	
	dot2 = LUI.UIImage.new()
	dot2.id = "dot2"
	dot2:SetRGBFromTable( SWATCHES.jackal.stable, 0 )
	dot2:setImage( RegisterMaterial( "hud_jackal_strike_reticule_piece_center_circle_sm" ), 0 )
	dot2:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -3.5, _1080p * 3.5, _1080p * -3.5, _1080p * 3.5 )
	self:addElement( dot2 )
	self.dot2 = dot2
	
	local dot3 = nil
	
	dot3 = LUI.UIImage.new()
	dot3.id = "dot3"
	dot3:SetRGBFromTable( SWATCHES.jackal.stable, 0 )
	dot3:setImage( RegisterMaterial( "hud_jackal_strike_reticule_piece_center_circle_sm" ), 0 )
	dot3:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -3, _1080p * 3, _1080p * -3, _1080p * 3 )
	self:addElement( dot3 )
	self.dot3 = dot3
	
	local dot4 = nil
	
	dot4 = LUI.UIImage.new()
	dot4.id = "dot4"
	dot4:SetRGBFromTable( SWATCHES.jackal.stable, 0 )
	dot4:setImage( RegisterMaterial( "hud_jackal_strike_reticule_piece_center_circle_sm" ), 0 )
	dot4:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -2.5, _1080p * 2.5, _1080p * -2.5, _1080p * 2.5 )
	self:addElement( dot4 )
	self.dot4 = dot4
	
	local JackalTargetAimRate = nil
	
	JackalTargetAimRate = MenuBuilder.BuildRegisteredType( "JackalTargetAimRate", {
		controllerIndex = f4_local1
	} )
	JackalTargetAimRate.id = "JackalTargetAimRate"
	JackalTargetAimRate:SetRGBFromInt( 12707042, 0 )
	JackalTargetAimRate:SetAlpha( 0.45, 0 )
	JackalTargetAimRate:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -24, _1080p * 24, _1080p * -24, _1080p * 24 )
	self:addElement( JackalTargetAimRate )
	self.JackalTargetAimRate = JackalTargetAimRate
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		BackgroundCircle:RegisterAnimationSequence( "isADS", {
			{
				function ()
					return self.BackgroundCircle:SetAlpha( 0, 200 )
				end,
				function ()
					return self.BackgroundCircle:SetAlpha( 0.12, 200 )
				end
			}
		} )
		JackalCenterReticleFireAnimation:RegisterAnimationSequence( "isADS", {
			{
				function ()
					return self.JackalCenterReticleFireAnimation:SetAlpha( 1, 0 )
				end,
				function ()
					return self.JackalCenterReticleFireAnimation:SetAlpha( 1, 200 )
				end,
				function ()
					return self.JackalCenterReticleFireAnimation:SetAlpha( 0, 200, LUI.EASING.outBack )
				end
			},
			{
				function ()
					return self.JackalCenterReticleFireAnimation:SetZRotation( 0, 0 )
				end,
				function ()
					return self.JackalCenterReticleFireAnimation:SetZRotation( 0, 400, LUI.EASING.outBack )
				end
			},
			{
				function ()
					return self.JackalCenterReticleFireAnimation:SetScale( 0, 0 )
				end,
				function ()
					return self.JackalCenterReticleFireAnimation:SetScale( -1, 400, LUI.EASING.outBack )
				end
			}
		} )
		CenterADSCircle:RegisterAnimationSequence( "isADS", {
			{
				function ()
					return self.CenterADSCircle:SetAlpha( 0, 0 )
				end,
				function ()
					return self.CenterADSCircle:SetAlpha( 0.5, 400, LUI.EASING.outBack )
				end
			},
			{
				function ()
					return self.CenterADSCircle:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -192, _1080p * 192, _1080p * -192, _1080p * 192, 0 )
				end,
				function ()
					return self.CenterADSCircle:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -64, _1080p * 64, _1080p * -64, _1080p * 64, 400, LUI.EASING.outBack )
				end
			}
		} )
		JackalCenterReticleADSBrackets:RegisterAnimationSequence( "isADS", {
			{
				function ()
					return self.JackalCenterReticleADSBrackets:SetAlpha( 0, 0 )
				end,
				function ()
					return self.JackalCenterReticleADSBrackets:SetAlpha( 0.35, 400, LUI.EASING.outBack )
				end
			},
			{
				function ()
					return self.JackalCenterReticleADSBrackets:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -284, _1080p * 284, _1080p * -284, _1080p * 284, 0 )
				end,
				function ()
					return self.JackalCenterReticleADSBrackets:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -94, _1080p * 94, _1080p * -94, _1080p * 94, 400, LUI.EASING.outBack )
				end
			}
		} )
		self._sequences.isADS = function ()
			BackgroundCircle:AnimateSequence( "isADS" )
			JackalCenterReticleFireAnimation:AnimateSequence( "isADS" )
			CenterADSCircle:AnimateSequence( "isADS" )
			JackalCenterReticleADSBrackets:AnimateSequence( "isADS" )
		end
		
		BackgroundCircle:RegisterAnimationSequence( "isNotADS", {
			{
				function ()
					return self.BackgroundCircle:SetAlpha( 0.12, 0 )
				end,
				function ()
					return self.BackgroundCircle:SetAlpha( 0, 40 )
				end
			}
		} )
		JackalCenterReticleFireAnimation:RegisterAnimationSequence( "isNotADS", {
			{
				function ()
					return self.JackalCenterReticleFireAnimation:SetAlpha( 1, 0 )
				end,
				function ()
					return self.JackalCenterReticleFireAnimation:SetAlpha( 1, 350, LUI.EASING.outBack )
				end
			},
			{
				function ()
					return self.JackalCenterReticleFireAnimation:SetZRotation( 0, 0 )
				end,
				function ()
					return self.JackalCenterReticleFireAnimation:SetZRotation( 0, 350, LUI.EASING.outBack )
				end
			},
			{
				function ()
					return self.JackalCenterReticleFireAnimation:SetScale( -1, 0 )
				end,
				function ()
					return self.JackalCenterReticleFireAnimation:SetScale( 0, 350, LUI.EASING.outBack )
				end
			}
		} )
		CenterADSCircle:RegisterAnimationSequence( "isNotADS", {
			{
				function ()
					return self.CenterADSCircle:SetAlpha( 0.75, 0 )
				end,
				function ()
					return self.CenterADSCircle:SetAlpha( 0, 350, LUI.EASING.outBack )
				end
			},
			{
				function ()
					return self.CenterADSCircle:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -64, _1080p * 64, _1080p * -64, _1080p * 64, 0 )
				end,
				function ()
					return self.CenterADSCircle:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -192, _1080p * 192, _1080p * -192, _1080p * 192, 349, LUI.EASING.outBack )
				end
			}
		} )
		JackalCenterReticleADSBrackets:RegisterAnimationSequence( "isNotADS", {
			{
				function ()
					return self.JackalCenterReticleADSBrackets:SetAlpha( 0.35, 0 )
				end,
				function ()
					return self.JackalCenterReticleADSBrackets:SetAlpha( 0, 350, LUI.EASING.outBack )
				end
			},
			{
				function ()
					return self.JackalCenterReticleADSBrackets:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -94, _1080p * 94, _1080p * -94, _1080p * 94, 0 )
				end,
				function ()
					return self.JackalCenterReticleADSBrackets:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -284, _1080p * 284, _1080p * -284, _1080p * 284, 349, LUI.EASING.outBack )
				end
			}
		} )
		self._sequences.isNotADS = function ()
			BackgroundCircle:AnimateSequence( "isNotADS" )
			JackalCenterReticleFireAnimation:AnimateSequence( "isNotADS" )
			CenterADSCircle:AnimateSequence( "isNotADS" )
			JackalCenterReticleADSBrackets:AnimateSequence( "isNotADS" )
		end
		
		LockOn:RegisterAnimationSequence( "has_lock", {
			{
				function ()
					return self.LockOn:SetAlpha( 1, 10 )
				end,
				function ()
					return self.LockOn:SetAlpha( 0, 170 )
				end,
				function ()
					return self.LockOn:SetAlpha( 1, 10 )
				end,
				function ()
					return self.LockOn:SetAlpha( 0, 130 )
				end,
				function ()
					return self.LockOn:SetAlpha( 1, 20 )
				end,
				function ()
					return self.LockOn:SetAlpha( 0, 150 )
				end,
				function ()
					return self.LockOn:SetAlpha( 1, 20 )
				end,
				function ()
					return self.LockOn:SetAlpha( 0.35, 140 )
				end
			}
		} )
		self._sequences.has_lock = function ()
			LockOn:AnimateSequence( "has_lock" )
		end
		
		LockOn:RegisterAnimationSequence( "no_lock", {
			{
				function ()
					return self.LockOn:SetAlpha( 1, 0 )
				end
			}
		} )
		self._sequences.no_lock = function ()
			LockOn:AnimateSequence( "no_lock" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	PostLoadFunc( self, f4_local1, controller )
	return self
end

MenuBuilder.registerType( "JackalCenterReticleFireAlphaTesting", JackalCenterReticleFireAlphaTesting )
LockTable( _M )
