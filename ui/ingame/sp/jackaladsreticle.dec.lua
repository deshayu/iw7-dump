local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function PostLoadFunc( f1_arg0, f1_arg1, f1_arg2 )
	local f1_local0 = DataSources.inGame.player.currentWeapon.inFullADS
	local f1_local1 = DataSources.inGame.jackal.mode
	local f1_local2 = DataSources.inGame.jackal.autopilot
	local f1_local3 = DataSources.inGame.jackal.noGunsModeActive
	f1_arg0.inADS = true
	local f1_local4 = function ( f2_arg0 )
		local f2_local0 = f1_local0:GetValue( f1_arg1 )
		local f2_local1 = f1_local2:GetValue( f1_arg1 )
		local f2_local2 = f1_local1:GetValue( f1_arg1 ) == JackalModes.landing
		local f2_local3 = f1_local3:GetValue( f1_arg1 )
		if f2_local0 and not f2_local1 and not f2_local2 and not f2_local3 and not f1_arg0.inADS then
			ACTIONS.AnimateSequence( f1_arg0, "show" )
			f1_arg0:playSound( "adsOn" )
			f1_arg0.inADS = true
		elseif not (f2_local1 or f2_local2 or f2_local3) or f1_arg0.inADS then
			ACTIONS.AnimateSequence( f1_arg0, "hide" )
			f1_arg0:playSound( "adsOff" )
			f1_arg0.inADS = false
		end
	end
	
	local f1_local5 = function ( f3_arg0 )
		ACTIONS.AnimateSequence( f1_arg0, "default" )
	end
	
	f1_arg0.soundSet = "jackal"
	f1_arg0:SubscribeToModel( f1_local0:GetModel( f1_arg1 ), f1_local4, true )
	f1_arg0:addEventHandler( "menu_create", f1_local5 )
end

function JackalADSReticle( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 512 * _1080p, 0, 512 * _1080p )
	self.id = "JackalADSReticle"
	self._animationSets = {}
	self._sequences = {}
	local f4_local1 = controller and controller.controllerIndex
	if not f4_local1 and not Engine.InFrontend() then
		f4_local1 = self:getRootController()
	end
	assert( f4_local1 )
	local f4_local2 = self
	local TickedRing = nil
	
	TickedRing = LUI.UIImage.new()
	TickedRing.id = "TickedRing"
	TickedRing:SetRGBFromTable( SWATCHES.jackal.stable, 0 )
	TickedRing:SetAlpha( 0, 0 )
	TickedRing:setImage( RegisterMaterial( "hud_jackal_reticule_piece_ads_tics" ), 0 )
	self:addElement( TickedRing )
	self.TickedRing = TickedRing
	
	local TickedRingSmall = nil
	
	TickedRingSmall = LUI.UIImage.new()
	TickedRingSmall.id = "TickedRingSmall"
	TickedRingSmall:SetAlpha( 0, 0 )
	TickedRingSmall:setImage( RegisterMaterial( "hud_jackal_reticule_piece_ads_tics_small" ), 0 )
	self:addElement( TickedRingSmall )
	self.TickedRingSmall = TickedRingSmall
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		TickedRing:RegisterAnimationSequence( "show", {
			{
				function ()
					return self.TickedRing:SetScale( 0.25, 0 )
				end,
				function ()
					return self.TickedRing:SetScale( -0.02, 400, LUI.EASING.outBack )
				end
			},
			{
				function ()
					return self.TickedRing:SetAlpha( 0, 0 )
				end,
				function ()
					return self.TickedRing:SetAlpha( 1, 400, LUI.EASING.outBack )
				end
			}
		} )
		TickedRingSmall:RegisterAnimationSequence( "show", {
			{
				function ()
					return self.TickedRingSmall:SetAlpha( 0, 0 )
				end,
				function ()
					return self.TickedRingSmall:SetAlpha( 1, 400, LUI.EASING.outBack )
				end
			},
			{
				function ()
					return self.TickedRingSmall:SetScale( 0.75, 0 )
				end,
				function ()
					return self.TickedRingSmall:SetScale( -0.02, 400, LUI.EASING.outBack )
				end
			}
		} )
		self._sequences.show = function ()
			TickedRing:AnimateSequence( "show" )
			TickedRingSmall:AnimateSequence( "show" )
		end
		
		TickedRing:RegisterAnimationSequence( "hide", {
			{
				function ()
					return self.TickedRing:SetScale( 0, 0 )
				end,
				function ()
					return self.TickedRing:SetScale( 0.25, 400, LUI.EASING.outBack )
				end
			},
			{
				function ()
					return self.TickedRing:SetAlpha( 1, 0 )
				end,
				function ()
					return self.TickedRing:SetAlpha( 0, 400, LUI.EASING.outBack )
				end
			}
		} )
		TickedRingSmall:RegisterAnimationSequence( "hide", {
			{
				function ()
					return self.TickedRingSmall:SetAlpha( 1, 0 )
				end,
				function ()
					return self.TickedRingSmall:SetAlpha( 0, 400, LUI.EASING.outBack )
				end
			},
			{
				function ()
					return self.TickedRingSmall:SetScale( 0, 0 )
				end,
				function ()
					return self.TickedRingSmall:SetScale( 0.35, 400, LUI.EASING.outBack )
				end
			}
		} )
		self._sequences.hide = function ()
			TickedRing:AnimateSequence( "hide" )
			TickedRingSmall:AnimateSequence( "hide" )
		end
		
		TickedRing:RegisterAnimationSequence( "default", {
			{
				function ()
					return self.TickedRing:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.default = function ()
			TickedRing:AnimateSequence( "default" )
		end
		
		TickedRingSmall:RegisterAnimationSequence( "locking", {
			{
				function ()
					return self.TickedRingSmall:SetZRotation( 0, 0 )
				end,
				function ()
					return self.TickedRingSmall:SetZRotation( -360, 24810 )
				end
			}
		} )
		self._sequences.locking = function ()
			TickedRingSmall:AnimateLoop( "locking" )
		end
		
		TickedRingSmall:RegisterAnimationSequence( "locked", {
			{
				function ()
					return self.TickedRingSmall:SetZRotation( 0, 0 )
				end
			}
		} )
		self._sequences.locked = function ()
			TickedRingSmall:AnimateSequence( "locked" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	PostLoadFunc( self, f4_local1, controller )
	return self
end

MenuBuilder.registerType( "JackalADSReticle", JackalADSReticle )
LockTable( _M )
