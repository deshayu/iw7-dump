local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ( f1_arg0, f1_arg1, f1_arg2 )
	assert( f1_arg0.WeaponBarrelsLeft and f1_arg0.WeaponBarrelsRight, "WARNING: Jackal overheat ocerlay items are missing..." )
	f1_arg0.WeaponBarrelsLeft:SetBlendMode( BLEND_MODE.addWithAlpha )
	f1_arg0.WeaponBarrelsRight:SetBlendMode( BLEND_MODE.addWithAlpha )
	local f1_local0 = DataSources.inGame.jackal.atmoLaunch
	local f1_local1 = DataSources.inGame.jackal.weaponDisplayTemp
	local f1_local2 = function ()
		local f2_local0 = f1_local1:GetValue( f1_arg1 )
		local f2_local1 = f1_local0:GetValue( f1_arg1 )
		local f2_local2 = nil
		if f2_local0 and not f2_local1 then
			f2_local2 = "weaponRaise"
		else
			f2_local2 = "weaponDrop"
		end
		if f2_local2 and f1_arg0._currentAnimation ~= f2_local2 then
			ACTIONS.AnimateSequence( f1_arg0, f2_local2 )
			f1_arg0._currentAnimation = f2_local2
		end
	end
	
	f1_arg0:SubscribeToModel( f1_local1:GetModel( f1_arg1 ), f1_local2, true )
	f1_arg0:SubscribeToModel( f1_local0:GetModel( f1_arg1 ), f1_local2, true )
end

function JackalOverheatOverlay( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 1920 * _1080p, 0, 1080 * _1080p )
	self.id = "JackalOverheatOverlay"
	self._animationSets = {}
	self._sequences = {}
	local f3_local1 = controller and controller.controllerIndex
	if not f3_local1 and not Engine.InFrontend() then
		f3_local1 = self:getRootController()
	end
	assert( f3_local1 )
	local f3_local2 = self
	local WeaponBarrelsLeft = nil
	
	WeaponBarrelsLeft = MenuBuilder.BuildRegisteredType( "JackalWeaponBarrelsLeft", {
		controllerIndex = f3_local1
	} )
	WeaponBarrelsLeft.id = "WeaponBarrelsLeft"
	WeaponBarrelsLeft:SetAlpha( 0, 0 )
	WeaponBarrelsLeft:SetYRotation( 50, 0 )
	WeaponBarrelsLeft:SetAnchorsAndPosition( 0, 1, 1, 0, _1080p * 100, _1080p * 450, _1080p * -240, _1080p * -180 )
	self:addElement( WeaponBarrelsLeft )
	self.WeaponBarrelsLeft = WeaponBarrelsLeft
	
	local WeaponBarrelsRight = nil
	
	WeaponBarrelsRight = MenuBuilder.BuildRegisteredType( "JackalWeaponBarrelsRight", {
		controllerIndex = f3_local1
	} )
	WeaponBarrelsRight.id = "WeaponBarrelsRight"
	WeaponBarrelsRight:SetAlpha( 0, 0 )
	WeaponBarrelsRight:SetYRotation( -50, 0 )
	WeaponBarrelsRight:SetAnchorsAndPosition( 1, 0, 1, 0, _1080p * -450, _1080p * -100, _1080p * -240, _1080p * -180 )
	self:addElement( WeaponBarrelsRight )
	self.WeaponBarrelsRight = WeaponBarrelsRight
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		WeaponBarrelsLeft:RegisterAnimationSequence( "weaponDrop", {
			{
				function ()
					return self.WeaponBarrelsLeft:SetAlpha( 1, 0 )
				end,
				function ()
					return self.WeaponBarrelsLeft:SetAlpha( 0, 300 )
				end
			}
		} )
		WeaponBarrelsRight:RegisterAnimationSequence( "weaponDrop", {
			{
				function ()
					return self.WeaponBarrelsRight:SetAlpha( 1, 0 )
				end,
				function ()
					return self.WeaponBarrelsRight:SetAlpha( 0, 300 )
				end
			}
		} )
		self._sequences.weaponDrop = function ()
			WeaponBarrelsLeft:AnimateSequence( "weaponDrop" )
			WeaponBarrelsRight:AnimateSequence( "weaponDrop" )
		end
		
		WeaponBarrelsLeft:RegisterAnimationSequence( "weaponRaise", {
			{
				function ()
					return self.WeaponBarrelsLeft:SetAlpha( 0, 0 )
				end,
				function ()
					return self.WeaponBarrelsLeft:SetAlpha( 1, 300 )
				end
			}
		} )
		WeaponBarrelsRight:RegisterAnimationSequence( "weaponRaise", {
			{
				function ()
					return self.WeaponBarrelsRight:SetAlpha( 0, 0 )
				end,
				function ()
					return self.WeaponBarrelsRight:SetAlpha( 1, 300 )
				end
			}
		} )
		self._sequences.weaponRaise = function ()
			WeaponBarrelsLeft:AnimateSequence( "weaponRaise" )
			WeaponBarrelsRight:AnimateSequence( "weaponRaise" )
		end
		
		WeaponBarrelsLeft:RegisterAnimationSequence( "off", {
			{
				function ()
					return self.WeaponBarrelsLeft:SetAlpha( 0, 0 )
				end
			}
		} )
		WeaponBarrelsRight:RegisterAnimationSequence( "off", {
			{
				function ()
					return self.WeaponBarrelsRight:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.off = function ()
			WeaponBarrelsLeft:AnimateSequence( "off" )
			WeaponBarrelsRight:AnimateSequence( "off" )
		end
		
		WeaponBarrelsLeft:RegisterAnimationSequence( "on", {
			{
				function ()
					return self.WeaponBarrelsLeft:SetAlpha( 1, 0 )
				end
			}
		} )
		WeaponBarrelsRight:RegisterAnimationSequence( "on", {
			{
				function ()
					return self.WeaponBarrelsRight:SetAlpha( 1, 0 )
				end
			}
		} )
		self._sequences.on = function ()
			WeaponBarrelsLeft:AnimateSequence( "on" )
			WeaponBarrelsRight:AnimateSequence( "on" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	f0_local0( self, f3_local1, controller )
	if DataSources.inGame.jackal.weaponDisplayTemp:GetValue( f3_local1 ) ~= nil and DataSources.inGame.jackal.weaponDisplayTemp:GetValue( f3_local1 ) == true then
		ACTIONS.AnimateSequence( self, "on" )
	end
	if DataSources.inGame.jackal.weaponDisplayTemp:GetValue( f3_local1 ) ~= nil and DataSources.inGame.jackal.weaponDisplayTemp:GetValue( f3_local1 ) == false then
		ACTIONS.AnimateSequence( self, "off" )
	end
	return self
end

MenuBuilder.registerType( "JackalOverheatOverlay", JackalOverheatOverlay )
LockTable( _M )
