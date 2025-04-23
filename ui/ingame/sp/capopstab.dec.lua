local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ( f1_arg0, f1_arg1 )
	f1_arg0:registerEventHandler( "focus_tab", function ( element, event )
		if event.index == element.index then
			element._sequences.Focused()
			element.focused = true
		elseif element.focused then
			element._sequences.UnFocused()
			element.focused = false
		end
	end )
end

function CapOpsTab( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 400 * _1080p, 0, 50 * _1080p )
	self.id = "CapOpsTab"
	self._animationSets = {}
	self._sequences = {}
	local f3_local1 = controller and controller.controllerIndex
	if not f3_local1 and not Engine.InFrontend() then
		f3_local1 = self:getRootController()
	end
	assert( f3_local1 )
	local f3_local2 = self
	local Background = nil
	
	Background = LUI.UIImage.new()
	Background.id = "Background"
	Background:SetRGBFromInt( 3553080, 0 )
	Background:setImage( RegisterMaterial( "ui_default_white" ), 0 )
	Background:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * 13, _1080p * -13, _1080p * 7, _1080p * -7 )
	self:addElement( Background )
	self.Background = Background
	
	local TabText = nil
	
	TabText = LUI.UIStyledText.new()
	TabText.id = "TabText"
	TabText:SetFontSize( 30 * _1080p )
	TabText:SetFont( FONTS.GetFont( FONTS.MainCondensed.File ) )
	TabText:SetAlignment( LUI.Alignment.Left )
	TabText:SetStartupDelay( 1000 )
	TabText:SetLineHoldTime( 500 )
	TabText:SetAnimMoveTime( 300 )
	TabText:SetEndDelay( 1000 )
	TabText:SetCrossfadeTime( 400 )
	TabText:SetAutoScrollStyle( LUI.UIStyledText.AutoScrollStyle.ScrollH )
	TabText:SetMaxVisibleLines( 1 )
	TabText:SetAnchorsAndPosition( 0, 0, 0.5, 0.5, _1080p * 16, _1080p * -17, _1080p * -15, _1080p * 15 )
	TabText:SubscribeToModelThroughElement( self, "name", function ()
		local f4_local0 = self:GetDataSource()
		f4_local0 = f4_local0.name:GetValue( f3_local1 )
		if f4_local0 ~= nil then
			TabText:setText( ToUpperCase( f4_local0 ), 0 )
		end
	end )
	self:addElement( TabText )
	self.TabText = TabText
	
	local BackgroundCopy0 = nil
	
	BackgroundCopy0 = LUI.UIImage.new()
	BackgroundCopy0.id = "BackgroundCopy0"
	BackgroundCopy0:SetRGBFromInt( 5592662, 0 )
	BackgroundCopy0:setImage( RegisterMaterial( "ui_default_white" ), 0 )
	BackgroundCopy0:SetAnchorsAndPosition( 0, 0, 0, 0, 0, _1080p * -387, _1080p * 7, _1080p * -7 )
	self:addElement( BackgroundCopy0 )
	self.BackgroundCopy0 = BackgroundCopy0
	
	local BackgroundCopy1 = nil
	
	BackgroundCopy1 = LUI.UIImage.new()
	BackgroundCopy1.id = "BackgroundCopy1"
	BackgroundCopy1:SetRGBFromInt( 5592662, 0 )
	BackgroundCopy1:setImage( RegisterMaterial( "ui_default_white" ), 0 )
	BackgroundCopy1:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * 387, 0, _1080p * 7, _1080p * -7 )
	self:addElement( BackgroundCopy1 )
	self.BackgroundCopy1 = BackgroundCopy1
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		Background:RegisterAnimationSequence( "Focused", {
			{
				function ()
					return self.Background:SetRGBFromInt( 7106160, 0 )
				end
			}
		} )
		TabText:RegisterAnimationSequence( "Focused", {
			{
				function ()
					return self.TabText:SetRGBFromInt( 16777215, 0 )
				end
			}
		} )
		BackgroundCopy0:RegisterAnimationSequence( "Focused", {
			{
				function ()
					return self.BackgroundCopy0:SetRGBFromInt( 10593187, 0 )
				end
			}
		} )
		BackgroundCopy1:RegisterAnimationSequence( "Focused", {
			{
				function ()
					return self.BackgroundCopy1:SetRGBFromInt( 10593187, 0 )
				end
			}
		} )
		self._sequences.Focused = function ()
			Background:AnimateSequence( "Focused" )
			TabText:AnimateSequence( "Focused" )
			BackgroundCopy0:AnimateSequence( "Focused" )
			BackgroundCopy1:AnimateSequence( "Focused" )
		end
		
		Background:RegisterAnimationSequence( "UnFocused", {
			{
				function ()
					return self.Background:SetRGBFromInt( 3553080, 0 )
				end
			}
		} )
		TabText:RegisterAnimationSequence( "UnFocused", {
			{
				function ()
					return self.TabText:SetRGBFromInt( 8421504, 0 )
				end
			}
		} )
		BackgroundCopy0:RegisterAnimationSequence( "UnFocused", {
			{
				function ()
					return self.BackgroundCopy0:SetRGBFromInt( 5592662, 0 )
				end
			}
		} )
		BackgroundCopy1:RegisterAnimationSequence( "UnFocused", {
			{
				function ()
					return self.BackgroundCopy1:SetRGBFromInt( 5592662, 0 )
				end
			}
		} )
		self._sequences.UnFocused = function ()
			Background:AnimateSequence( "UnFocused" )
			TabText:AnimateSequence( "UnFocused" )
			BackgroundCopy0:AnimateSequence( "UnFocused" )
			BackgroundCopy1:AnimateSequence( "UnFocused" )
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
		self._sequences.Disabled = function ()
			TabText:AnimateSequence( "Disabled" )
		end
		
		self._sequences.Enabled = function ()
			
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	f0_local0( self, f3_local1, controller )
	return self
end

MenuBuilder.registerType( "CapOpsTab", CapOpsTab )
LockTable( _M )
