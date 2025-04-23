local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function PostLoadFunc( f1_arg0, f1_arg1 )
	local f1_local0 = DataSources.inGame.jackal.missleLockPercent:GetModel( f1_arg1 )
	local f1_local1 = DataSources.inGame.jackal.lockOnBlinkAlpha:GetModel( f1_arg1 )
	f1_arg0.RadialProgressBar:SetBlendMode( BLEND_MODE.addWithAlpha )
	f1_arg0.RadialProgressBar._playedFinalBeep = true
	f1_arg0.RadialProgressBar:SetOnUpdateCallback( function ( f2_arg0 )
		local f2_local0 = DataModel.GetModelValue( f1_local0 )
		if f2_local0 == 1 then
			if not f1_arg0._playedFinalBeep then
				f1_arg0:playSound( "jackal_lockon_complete" )
				f1_arg0._playedFinalBeep = true
			end
			return 
		elseif f2_local0 == 0 then
			return 
		end
		f1_arg0._playedFinalBeep = false
		local f2_local1 = DataModel.GetModelValue( f1_local1 )
		if f1_arg0._previousBlinkValue then
			local f2_local2 = f2_local1 < f1_arg0._previousBlinkValue
			local f2_local3 = f1_arg0._previousBlinkValue < f2_local1
			if f2_local2 then
				if not f1_arg0._playedBeep then
					f1_arg0:playSound( "jackal_lockon_blink" )
					f1_arg0._playedBeep = true
				end
			elseif f2_local3 then
				f1_arg0._playedBeep = false
			end
		end
		f1_arg0._previousBlinkValue = f2_local1
	end )
end

function JackalLockOn( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 512 * _1080p, 0, 512 * _1080p )
	self.id = "JackalLockOn"
	self._animationSets = {}
	self._sequences = {}
	local f3_local1 = controller and controller.controllerIndex
	if not f3_local1 and not Engine.InFrontend() then
		f3_local1 = self:getRootController()
	end
	assert( f3_local1 )
	self.soundSet = "jackal"
	local f3_local2 = self
	local Background = nil
	
	Background = LUI.UIImage.new()
	Background.id = "Background"
	Background:SetRGBFromTable( SWATCHES.jackal.lockOnMeterBackground, 0 )
	Background:SetAlpha( 0, 0 )
	Background:setImage( RegisterMaterial( "hud_jackal_lock_background" ), 0 )
	self:addElement( Background )
	self.Background = Background
	
	local RadialProgressBar = nil
	
	RadialProgressBar = MenuBuilder.BuildRegisteredType( "UIRadialProgressBar", {
		segmentCount = 2,
		segmentMaterial = "hud_jackal_lock_track",
		maskMaterial = "hud_jackal_lock_mask",
		snapToMultiplesOfAngle = 2,
		controllerIndex = f3_local1
	} )
	RadialProgressBar.id = "RadialProgressBar"
	RadialProgressBar:SetRGBFromTable( SWATCHES.jackal.lockOnMeterFill, 0 )
	RadialProgressBar:SetAlpha( 0, 0 )
	RadialProgressBar:SetProgress( 1 )
	self:addElement( RadialProgressBar )
	self.RadialProgressBar = RadialProgressBar
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		Background:RegisterAnimationSequence( "Default", {
			{
				function ()
					return self.Background:SetAlpha( 0, 0 )
				end
			}
		} )
		RadialProgressBar:RegisterAnimationSequence( "Default", {
			{
				function ()
					return self.RadialProgressBar:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.Default = function ()
			Background:AnimateSequence( "Default" )
			RadialProgressBar:AnimateSequence( "Default" )
		end
		
		Background:RegisterAnimationSequence( "Intro", {
			{
				function ()
					return self.Background:SetAlpha( 0.15, 200 )
				end
			}
		} )
		RadialProgressBar:RegisterAnimationSequence( "Intro", {
			{
				function ()
					return self.RadialProgressBar:SetAlpha( 0.75, 200 )
				end
			}
		} )
		self._sequences.Intro = function ()
			Background:AnimateSequence( "Intro" )
			RadialProgressBar:AnimateSequence( "Intro" )
		end
		
		Background:RegisterAnimationSequence( "Outtro", {
			{
				function ()
					return self.Background:SetAlpha( 0, 100 )
				end
			}
		} )
		RadialProgressBar:RegisterAnimationSequence( "Outtro", {
			{
				function ()
					return self.RadialProgressBar:SetAlpha( 0, 100 )
				end
			}
		} )
		self._sequences.Outtro = function ()
			Background:AnimateSequence( "Outtro" )
			RadialProgressBar:AnimateSequence( "Outtro" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	self:addEventHandler( "menu_create", function ( f15_arg0, f15_arg1 )
		local f15_local0 = f15_arg1.controller or f3_local1
		ACTIONS.AnimateSequence( self, "Default" )
	end )
	PostLoadFunc( self, f3_local1, controller )
	return self
end

MenuBuilder.registerType( "JackalLockOn", JackalLockOn )
LockTable( _M )
