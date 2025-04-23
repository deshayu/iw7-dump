local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ( f1_arg0 )
	return function ( f2_arg0, f2_arg1 )
		ACTIONS.AnimateSequence( f1_arg0, "ButtonOver" )
		ACTIONS.AnimateSequenceByElement( f1_arg0, {
			elementName = "Background",
			sequenceName = "Pick10Over",
			elementPath = "Background"
		} )
		f1_arg0.Background:Pick10Over()
		f1_arg0.Background:GradientFlashOver()
	end
	
end

f0_local1 = function ( f3_arg0 )
	return function ( f4_arg0, f4_arg1 )
		ACTIONS.AnimateSequence( f3_arg0, "ButtonUp" )
		f3_arg0.Background:Pick10Up()
		f3_arg0.Background:GradientFlashUp()
	end
	
end

f0_local2 = function ( f5_arg0 )
	f5_arg0.Power:SetDataSourceThroughElement( f5_arg0, "extraPower" )
	f5_arg0.ExtraPower:SetDataSourceThroughElement( f5_arg0, "power" )
end

local f0_local3 = function ( f6_arg0, f6_arg1, f6_arg2 )
	if CONDITIONS.InGameSPOrFrontendMP() then
		f6_arg0.Power:addEventHandler( "button_over", f0_local0( f6_arg0 ) )
		f6_arg0.Power:addEventHandler( "button_up", f0_local1( f6_arg0 ) )
		f6_arg0.Power:addEventHandler( "button_over_disable", f0_local0( f6_arg0 ) )
		f6_arg0.Power:addEventHandler( "button_disable", f0_local1( f6_arg0 ) )
		f6_arg0.ExtraPower:addEventHandler( "button_over", f0_local0( f6_arg0 ) )
		f6_arg0.ExtraPower:addEventHandler( "button_up", f0_local1( f6_arg0 ) )
		f6_arg0.ExtraPower:addEventHandler( "button_over_disable", f0_local0( f6_arg0 ) )
		f6_arg0.ExtraPower:addEventHandler( "button_disable", f0_local1( f6_arg0 ) )
	end
	if Engine.IsSingleplayer() then
		f6_arg0.SwapPowerSourcesFunc = function ()
			f0_local2( f6_arg0 )
		end
		
	end
	if CONDITIONS.InGame() and CONDITIONS.IsCoreMultiplayer() then
		f0_local1( f6_arg0 )
	end
end

function FramedPowers( menu, controller )
	local self = LUI.UIVerticalNavigator.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 247 * _1080p, 0, 109 * _1080p )
	self.id = "FramedPowers"
	self._animationSets = {}
	self._sequences = {}
	local f8_local1 = controller and controller.controllerIndex
	if not f8_local1 and not Engine.InFrontend() then
		f8_local1 = self:getRootController()
	end
	assert( f8_local1 )
	local f8_local2 = self
	local Power = nil
	
	Power = MenuBuilder.BuildRegisteredType( "PowerButton", {
		controllerIndex = f8_local1
	} )
	Power.id = "Power"
	Power:SetDataSourceThroughElement( self, "power" )
	Power:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 122.5, _1080p * 24, _1080p * 109 )
	self:addElement( Power )
	self.Power = Power
	
	local ExtraPower = nil
	
	ExtraPower = MenuBuilder.BuildRegisteredType( "PowerButton", {
		controllerIndex = f8_local1
	} )
	ExtraPower.id = "ExtraPower"
	ExtraPower:SetDataSourceThroughElement( self, "extraPower" )
	ExtraPower:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -122.5, 0, _1080p * 24, _1080p * 109 )
	self:addElement( ExtraPower )
	self.ExtraPower = ExtraPower
	
	local Background = nil
	
	Background = MenuBuilder.BuildRegisteredType( "GenericListButtonBackground", {
		controllerIndex = f8_local1
	} )
	Background.id = "Background"
	Background.DropShadow:SetAlpha( 0, 0 )
	Background:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, 0, _1080p * 24 )
	self:addElement( Background )
	self.Background = Background
	
	local FrameLabel = nil
	
	FrameLabel = LUI.UIText.new()
	FrameLabel.id = "FrameLabel"
	FrameLabel:SetRGBFromInt( 14277081, 0 )
	FrameLabel:setText( Engine.Localize( "MENU_NEW" ), 0 )
	FrameLabel:SetFontSize( 19 * _1080p )
	FrameLabel:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	FrameLabel:SetAlignment( LUI.Alignment.Center )
	FrameLabel:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 9, _1080p * -9, _1080p * 2.5, _1080p * 21.5 )
	self:addElement( FrameLabel )
	self.FrameLabel = FrameLabel
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		FrameLabel:RegisterAnimationSequence( "ButtonOver", {
			{
				function ()
					return self.FrameLabel:SetRGBFromInt( 0, 0 )
				end
			}
		} )
		self._sequences.ButtonOver = function ()
			FrameLabel:AnimateSequence( "ButtonOver" )
		end
		
		FrameLabel:RegisterAnimationSequence( "ButtonUp", {
			{
				function ()
					return self.FrameLabel:SetRGBFromInt( 14277081, 0 )
				end
			}
		} )
		self._sequences.ButtonUp = function ()
			FrameLabel:AnimateSequence( "ButtonUp" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	Power:SetDataSourceThroughElement( self, "power" )
	ExtraPower:SetDataSourceThroughElement( self, "extraPower" )
	f0_local3( self, f8_local1, controller )
	ACTIONS.AnimateSequenceByElement( self, {
		elementName = "Background",
		sequenceName = "Pick10Up",
		elementPath = "Background"
	} )
	return self
end

MenuBuilder.registerType( "FramedPowers", FramedPowers )
LockTable( _M )
