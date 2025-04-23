local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ( f1_arg0, f1_arg1 )
	f1_arg0:registerEventHandler( "focus_tab", function ( element, event )
		if event.index == element.index then
			if event.playSound then
				element._sequences.Focused()
			else
				element._sequences.FocusedNoSound()
			end
			element.focused = true
		elseif element.focused then
			element._sequences.UnFocused()
			element.focused = false
		end
	end )
	if not Engine.IsConsoleGame() then
		f1_arg0:SetHandleMouse( true )
		f1_arg0:registerEventHandler( "mouseenter", function ( element, event )
			if not element.focused then
				local f3_local0 = element:GetDataSource()
				if f3_local0.disabled:GetValue( f1_arg1 ) == false then
					element._sequences.Highlighted()
				end
			end
		end )
		f1_arg0:registerEventHandler( "mouseleave", function ( element, event )
			if element.focused then
				local f4_local0 = element:GetDataSource()
				if f4_local0.disabled:GetValue( f1_arg1 ) == false then
					element._sequences.FocusedNoSound()
				end
			end
			element._sequences.UnFocused()
		end )
		f1_arg0:registerEventHandler( "leftmousedown", function ( element, event )
			
		end )
		f1_arg0:registerEventHandler( "leftmouseup", function ( element, event )
			if event.inside then
				local f6_local0 = element:GetDataSource()
				if f6_local0.disabled:GetValue( f1_arg1 ) == false then
					element:playSound( "menu_open" )
					element:dispatchEventToCurrentMenu( {
						name = "tab_mouse_select",
						index = element.index
					} )
				end
			end
		end )
	end
end

function InGameLoadoutTab( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 120 * _1080p, 0, 26 * _1080p )
	self.id = "InGameLoadoutTab"
	self._animationSets = {}
	self._sequences = {}
	local f7_local1 = controller and controller.controllerIndex
	if not f7_local1 and not Engine.InFrontend() then
		f7_local1 = self:getRootController()
	end
	assert( f7_local1 )
	local f7_local2 = self
	local BlurBackground = nil
	
	BlurBackground = LUI.UIBlur.new()
	BlurBackground.id = "BlurBackground"
	BlurBackground:SetRGBFromInt( 12566463, 0 )
	BlurBackground:SetBlurStrength( 2, 0 )
	self:addElement( BlurBackground )
	self.BlurBackground = BlurBackground
	
	local GradientDownTop = nil
	
	GradientDownTop = LUI.UIImage.new()
	GradientDownTop.id = "GradientDownTop"
	GradientDownTop:SetRGBFromTable( SWATCHES.genericButton.backgroundFocus, 0 )
	GradientDownTop:SetAlpha( 0.25, 0 )
	GradientDownTop:setImage( RegisterMaterial( "widg_gradient_bottom_to_top" ), 0 )
	GradientDownTop:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, 0, _1080p * -7 )
	self:addElement( GradientDownTop )
	self.GradientDownTop = GradientDownTop
	
	local TabText = nil
	
	TabText = LUI.UIStyledText.new()
	TabText.id = "TabText"
	TabText:SetRGBFromTable( SWATCHES.tabManager.tabText, 0 )
	TabText:SetFontSize( 18 * _1080p )
	TabText:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	TabText:SetAlignment( LUI.Alignment.Center )
	TabText:SetStartupDelay( 1000 )
	TabText:SetLineHoldTime( 400 )
	TabText:SetAnimMoveTime( 150 )
	TabText:SetEndDelay( 1000 )
	TabText:SetCrossfadeTime( 400 )
	TabText:SetAutoScrollStyle( LUI.UIStyledText.AutoScrollStyle.ScrollH )
	TabText:SetMaxVisibleLines( 1 )
	TabText:SetAnchorsAndPosition( 0, 0, 0.5, 0.5, _1080p * 4, _1080p * -4, _1080p * -12, _1080p * 6 )
	TabText:SubscribeToModelThroughElement( self, "name", function ()
		local f8_local0 = self:GetDataSource()
		f8_local0 = f8_local0.name:GetValue( f7_local1 )
		if f8_local0 ~= nil then
			TabText:setText( ToUpperCase( f8_local0 ), 0 )
		end
	end )
	self:addElement( TabText )
	self.TabText = TabText
	
	local DisabledIcon = nil
	
	DisabledIcon = LUI.UIImage.new()
	DisabledIcon.id = "DisabledIcon"
	DisabledIcon:SetAlpha( 0, 0 )
	DisabledIcon:SetZRotation( 2, 0 )
	DisabledIcon:SetAnchorsAndPosition( 0, 0, 0.5, 0.5, 0, 0, _1080p * -1, _1080p * 1 )
	self:addElement( DisabledIcon )
	self.DisabledIcon = DisabledIcon
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		BlurBackground:RegisterAnimationSequence( "Focused", {
			{
				function ()
					return self.BlurBackground:SetRGBFromInt( 16777215, 0 )
				end
			},
			{
				function ()
					return self.BlurBackground:playSound( "tabHighlight", false, 10 )
				end
			}
		} )
		TabText:RegisterAnimationSequence( "Focused", {
			{
				function ()
					return self.TabText:SetRGBFromTable( SWATCHES.tabManager.tabTextFocused, 0 )
				end
			},
			{
				function ()
					return self.TabText:SetAlpha( 1, 0 )
				end
			}
		} )
		self._sequences.Focused = function ()
			BlurBackground:AnimateSequence( "Focused" )
			TabText:AnimateSequence( "Focused" )
		end
		
		BlurBackground:RegisterAnimationSequence( "UnFocused", {
			{
				function ()
					return self.BlurBackground:SetRGBFromInt( 12566463, 0 )
				end
			}
		} )
		TabText:RegisterAnimationSequence( "UnFocused", {
			{
				function ()
					return self.TabText:SetRGBFromTable( SWATCHES.tabManager.tabText, 0 )
				end
			},
			{
				function ()
					return self.TabText:SetAlpha( 1, 0 )
				end
			}
		} )
		self._sequences.UnFocused = function ()
			BlurBackground:AnimateSequence( "UnFocused" )
			TabText:AnimateSequence( "UnFocused" )
		end
		
		self._sequences.Locked = function ()
			
		end
		
		TabText:RegisterAnimationSequence( "Disabled", {
			{
				function ()
					return self.TabText:SetAlpha( 0.5, 0 )
				end
			}
		} )
		DisabledIcon:RegisterAnimationSequence( "Disabled", {
			{
				function ()
					return self.DisabledIcon:SetAlpha( 1, 0 )
				end
			}
		} )
		self._sequences.Disabled = function ()
			TabText:AnimateSequence( "Disabled" )
			DisabledIcon:AnimateSequence( "Disabled" )
		end
		
		DisabledIcon:RegisterAnimationSequence( "Enabled", {
			{
				function ()
					return self.DisabledIcon:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.Enabled = function ()
			DisabledIcon:AnimateSequence( "Enabled" )
		end
		
		BlurBackground:RegisterAnimationSequence( "FocusedNoSound", {
			{
				function ()
					return self.BlurBackground:SetRGBFromInt( 16777215, 0 )
				end
			}
		} )
		TabText:RegisterAnimationSequence( "FocusedNoSound", {
			{
				function ()
					return self.TabText:SetRGBFromTable( SWATCHES.tabManager.tabTextFocused, 0 )
				end
			},
			{
				function ()
					return self.TabText:SetAlpha( 1, 0 )
				end
			}
		} )
		self._sequences.FocusedNoSound = function ()
			BlurBackground:AnimateSequence( "FocusedNoSound" )
			TabText:AnimateSequence( "FocusedNoSound" )
		end
		
		BlurBackground:RegisterAnimationSequence( "Highlighted", {
			{
				function ()
					return self.BlurBackground:SetRGBFromInt( 11579568, 0 )
				end
			}
		} )
		TabText:RegisterAnimationSequence( "Highlighted", {
			{
				function ()
					return self.TabText:SetRGBFromTable( SWATCHES.tabManager.tabTextFocused, 0 )
				end
			},
			{
				function ()
					return self.TabText:SetAlpha( 0.5, 0 )
				end
			}
		} )
		self._sequences.Highlighted = function ()
			BlurBackground:AnimateSequence( "Highlighted" )
			TabText:AnimateSequence( "Highlighted" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	self:SubscribeToModelThroughElement( self, "disabled", function ()
		local f34_local0 = self:GetDataSource()
		if f34_local0.disabled:GetValue( f7_local1 ) ~= nil then
			f34_local0 = self:GetDataSource()
			if f34_local0.disabled:GetValue( f7_local1 ) == true then
				ACTIONS.AnimateSequence( self, "Disabled" )
			end
		end
		f34_local0 = self:GetDataSource()
		if f34_local0.disabled:GetValue( f7_local1 ) ~= nil then
			f34_local0 = self:GetDataSource()
			if f34_local0.disabled:GetValue( f7_local1 ) == false then
				ACTIONS.AnimateSequence( self, "Enabled" )
			end
		end
	end )
	f0_local0( self, f7_local1, controller )
	return self
end

MenuBuilder.registerType( "InGameLoadoutTab", InGameLoadoutTab )
LockTable( _M )
