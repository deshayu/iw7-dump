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

f0_local2 = function ( f5_arg0, f5_arg1, f5_arg2 )
	f5_arg0.JackalLivery:addEventHandler( "button_over", f0_local0( f5_arg0 ) )
	f5_arg0.JackalLivery:addEventHandler( "button_up", f0_local1( f5_arg0 ) )
	f5_arg0.JackalLivery:addEventHandler( "button_over_disable", f0_local0( f5_arg0 ) )
	f5_arg0.JackalLivery:addEventHandler( "button_disable", f0_local1( f5_arg0 ) )
	f5_arg0.JackalItem1:addEventHandler( "button_over", f0_local0( f5_arg0 ) )
	f5_arg0.JackalItem1:addEventHandler( "button_up", f0_local1( f5_arg0 ) )
	f5_arg0.JackalItem1:addEventHandler( "button_over_disable", f0_local0( f5_arg0 ) )
	f5_arg0.JackalItem1:addEventHandler( "button_disable", f0_local1( f5_arg0 ) )
	f5_arg0.JackalItem2:addEventHandler( "button_over", f0_local0( f5_arg0 ) )
	f5_arg0.JackalItem2:addEventHandler( "button_up", f0_local1( f5_arg0 ) )
	f5_arg0.JackalItem2:addEventHandler( "button_over_disable", f0_local0( f5_arg0 ) )
	f5_arg0.JackalItem2:addEventHandler( "button_disable", f0_local1( f5_arg0 ) )
	f5_arg0.JackalItem3:addEventHandler( "button_over", f0_local0( f5_arg0 ) )
	f5_arg0.JackalItem3:addEventHandler( "button_up", f0_local1( f5_arg0 ) )
	f5_arg0.JackalItem3:addEventHandler( "button_over_disable", f0_local0( f5_arg0 ) )
	f5_arg0.JackalItem3:addEventHandler( "button_disable", f0_local1( f5_arg0 ) )
end

function FramedJackalItems( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 500 * _1080p, 0, 222 * _1080p )
	self.id = "FramedJackalItems"
	self._animationSets = {}
	self._sequences = {}
	local f6_local1 = controller and controller.controllerIndex
	if not f6_local1 and not Engine.InFrontend() then
		f6_local1 = self:getRootController()
	end
	assert( f6_local1 )
	local f6_local2 = self
	local JackalItem1 = nil
	
	JackalItem1 = MenuBuilder.BuildRegisteredType( "FramedJackalItem", {
		controllerIndex = f6_local1
	} )
	JackalItem1.id = "JackalItem1"
	JackalItem1:SetDataSourceThroughElement( self, "jackalPrimary" )
	JackalItem1:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 165.33, _1080p * 124, _1080p * 222 )
	self:addElement( JackalItem1 )
	self.JackalItem1 = JackalItem1
	
	local JackalItem2 = nil
	
	JackalItem2 = MenuBuilder.BuildRegisteredType( "FramedJackalItem", {
		controllerIndex = f6_local1
	} )
	JackalItem2.id = "JackalItem2"
	JackalItem2:SetDataSourceThroughElement( self, "jackalSecondary" )
	JackalItem2:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 167.34, _1080p * 332.67, _1080p * 124, _1080p * 222 )
	self:addElement( JackalItem2 )
	self.JackalItem2 = JackalItem2
	
	local JackalItem3 = nil
	
	JackalItem3 = MenuBuilder.BuildRegisteredType( "FramedJackalItem", {
		controllerIndex = f6_local1
	} )
	JackalItem3.id = "JackalItem3"
	JackalItem3:SetDataSourceThroughElement( self, "jackalUpgrade" )
	JackalItem3:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 334.67, _1080p * 500, _1080p * 124, _1080p * 222 )
	self:addElement( JackalItem3 )
	self.JackalItem3 = JackalItem3
	
	local JackalLivery = nil
	
	JackalLivery = MenuBuilder.BuildRegisteredType( "FramedJackalLoadoutLivery", {
		controllerIndex = f6_local1
	} )
	JackalLivery.id = "JackalLivery"
	JackalLivery:SetDataSourceThroughElement( self, "jackalDecal" )
	JackalLivery:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 500, _1080p * 24, _1080p * 122 )
	self:addElement( JackalLivery )
	self.JackalLivery = JackalLivery
	
	local Background = nil
	
	Background = MenuBuilder.BuildRegisteredType( "GenericListButtonBackground", {
		controllerIndex = f6_local1
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
	FrameLabel:setText( ToUpperCase( Engine.Localize( "MENU_JACKAL_LOADOUT" ) ), 0 )
	FrameLabel:SetFontSize( 19 * _1080p )
	FrameLabel:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	FrameLabel:SetAlignment( LUI.Alignment.Left )
	FrameLabel:SetOptOutRightToLeftAlignmentFlip( true )
	FrameLabel:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 20, _1080p * -9, _1080p * 2.5, _1080p * 21.5 )
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
	JackalItem1:SetDataSourceThroughElement( self, "jackalPrimary" )
	JackalItem2:SetDataSourceThroughElement( self, "jackalSecondary" )
	JackalItem3:SetDataSourceThroughElement( self, "jackalUpgrade" )
	JackalLivery:SetDataSourceThroughElement( self, "jackalDecal" )
	f0_local2( self, f6_local1, controller )
	ACTIONS.AnimateSequenceByElement( self, {
		elementName = "Background",
		sequenceName = "Pick10Up",
		elementPath = "Background"
	} )
	return self
end

MenuBuilder.registerType( "FramedJackalItems", FramedJackalItems )
LockTable( _M )
