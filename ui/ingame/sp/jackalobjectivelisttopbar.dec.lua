local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function JackalObjectiveListTopBar( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 281 * _1080p, 0, 40 * _1080p )
	self.id = "JackalObjectiveListTopBar"
	self._animationSets = {}
	self._sequences = {}
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local Background = nil
	
	Background = LUI.UIImage.new()
	Background.id = "Background"
	Background:SetRGBFromInt( 0, 0 )
	Background:SetAlpha( 0.5, 0 )
	Background:setImage( RegisterMaterial( "ui_default_white" ), 0 )
	Background:SetUseAA( true )
	self:addElement( Background )
	self.Background = Background
	
	local CapLeft = nil
	
	CapLeft = LUI.UIImage.new()
	CapLeft.id = "CapLeft"
	CapLeft:SetAlpha( 0.4, 0 )
	CapLeft:setImage( RegisterMaterial( "ui_default_white" ), 0 )
	CapLeft:SetAnchorsAndPosition( 0, 1, 0, 0, 0, _1080p * 3, 0, 0 )
	self:addElement( CapLeft )
	self.CapLeft = CapLeft
	
	local CapRight = nil
	
	CapRight = LUI.UIImage.new()
	CapRight.id = "CapRight"
	CapRight:setImage( RegisterMaterial( "ui_default_white" ), 0 )
	CapRight:SetAnchorsAndPosition( 1, 0, 0, 0, _1080p * -3, 0, 0, 0 )
	self:addElement( CapRight )
	self.CapRight = CapRight
	
	local Header = nil
	
	Header = MenuBuilder.BuildRegisteredType( "FluffHeaderRight", {
		controllerIndex = f1_local1
	} )
	Header.id = "Header"
	Header.HeaderText:setText( ToUpperCase( Engine.Localize( "JACKAL_OBJECTIVE_HEADER" ) ), 0 )
	Header:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 10, _1080p * -10, _1080p * 9, _1080p * 31 )
	self:addElement( Header )
	self.Header = Header
	
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
		CapLeft:RegisterAnimationSequence( "Default", {
			{
				function ()
					return self.CapLeft:SetAlpha( 0, 0 )
				end
			}
		} )
		CapRight:RegisterAnimationSequence( "Default", {
			{
				function ()
					return self.CapRight:SetAlpha( 0, 0 )
				end
			}
		} )
		Header:RegisterAnimationSequence( "Default", {
			{
				function ()
					return self.Header:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.Default = function ()
			Background:AnimateSequence( "Default" )
			CapLeft:AnimateSequence( "Default" )
			CapRight:AnimateSequence( "Default" )
			Header:AnimateSequence( "Default" )
		end
		
		Background:RegisterAnimationSequence( "Bootup", {
			{
				function ()
					return self.Background:SetAlpha( 0, 0 )
				end,
				function ()
					return self.Background:SetAlpha( 0.5, 400 )
				end,
				function ()
					return self.Background:SetAlpha( 0.5, 200, LUI.EASING.outBack )
				end
			},
			{
				function ()
					return self.Background:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * 274, 0, 0, 0, 0 )
				end,
				function ()
					return self.Background:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * 274, 0, 0, 0, 400 )
				end,
				function ()
					return self.Background:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, 0, 0, 200, LUI.EASING.outBack )
				end
			}
		} )
		CapLeft:RegisterAnimationSequence( "Bootup", {
			{
				function ()
					return self.CapLeft:SetAlpha( 0.4, 0 )
				end,
				function ()
					return self.CapLeft:SetAlpha( 0, 50 )
				end,
				function ()
					return self.CapLeft:SetAlpha( 0.4, 50 )
				end,
				function ()
					return self.CapLeft:SetAlpha( 0, 50 )
				end,
				function ()
					return self.CapLeft:SetAlpha( 0.4, 50 )
				end,
				function ()
					return self.CapLeft:SetAlpha( 0, 50 )
				end,
				function ()
					return self.CapLeft:SetAlpha( 0.4, 50 )
				end,
				function ()
					return self.CapLeft:SetAlpha( 0.4, 100 )
				end
			},
			{
				function ()
					return self.CapLeft:SetAnchorsAndPosition( 0, 1, 0, 0, _1080p * 274, _1080p * 277, 0, 0, 0 )
				end,
				function ()
					return self.CapLeft:SetAnchorsAndPosition( 0, 1, 0, 0, _1080p * 274, _1080p * 277, 0, 0, 400 )
				end,
				function ()
					return self.CapLeft:SetAnchorsAndPosition( 0, 1, 0, 0, 0, _1080p * 3, 0, 0, 200, LUI.EASING.outBack )
				end
			}
		} )
		CapRight:RegisterAnimationSequence( "Bootup", {
			{
				function ()
					return self.CapRight:SetAlpha( 1, 0 )
				end,
				function ()
					return self.CapRight:SetAlpha( 0, 50 )
				end,
				function ()
					return self.CapRight:SetAlpha( 1, 50 )
				end,
				function ()
					return self.CapRight:SetAlpha( 0, 50 )
				end,
				function ()
					return self.CapRight:SetAlpha( 1, 50 )
				end,
				function ()
					return self.CapRight:SetAlpha( 0, 50 )
				end,
				function ()
					return self.CapRight:SetAlpha( 1, 50 )
				end,
				function ()
					return self.CapRight:SetAlpha( 1, 100 )
				end
			},
			{
				function ()
					return self.CapRight:SetAnchorsAndPosition( 1, 0, 0, 0, _1080p * -3, 0, 0, 0, 0 )
				end,
				function ()
					return self.CapRight:SetAnchorsAndPosition( 1, 0, 0, 0, _1080p * -3, 0, 0, 0, 600, LUI.EASING.outBack )
				end
			}
		} )
		Header:RegisterAnimationSequence( "Bootup", {
			{
				function ()
					return self.Header:SetAlpha( 0, 0 )
				end,
				function ()
					return self.Header:SetAlpha( 0, 550 )
				end,
				function ()
					return self.Header:SetAlpha( 1, 50 )
				end
			}
		} )
		self._sequences.Bootup = function ()
			Background:AnimateSequence( "Bootup" )
			CapLeft:AnimateSequence( "Bootup" )
			CapRight:AnimateSequence( "Bootup" )
			Header:AnimateSequence( "Bootup" )
		end
		
		Background:RegisterAnimationSequence( "Shutdown", {
			{
				function ()
					return self.Background:SetAlpha( 0.5, 200, LUI.EASING.inBack )
				end,
				function ()
					return self.Background:SetAlpha( 0, 100 )
				end
			},
			{
				function ()
					return self.Background:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, 0, 0, 0, LUI.EASING.inBack )
				end,
				function ()
					return self.Background:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * 275, 0, 0, 0, 200, LUI.EASING.inBack )
				end,
				function ()
					return self.Background:SetAnchorsAndPosition( 0, 0, 0, 0, 0, _1080p * -275, 0, 0, 100 )
				end
			}
		} )
		CapLeft:RegisterAnimationSequence( "Shutdown", {
			{
				function ()
					return self.CapLeft:SetAlpha( 0.4, 0, LUI.EASING.inBack )
				end,
				function ()
					return self.CapLeft:SetAlpha( 0.4, 300 )
				end,
				function ()
					return self.CapLeft:SetAlpha( 0, 50 )
				end,
				function ()
					return self.CapLeft:SetAlpha( 0.4, 50 )
				end,
				function ()
					return self.CapLeft:SetAlpha( 0, 50 )
				end,
				function ()
					return self.CapLeft:SetAlpha( 0.4, 50 )
				end,
				function ()
					return self.CapLeft:SetAlpha( 0, 50 )
				end
			},
			{
				function ()
					return self.CapLeft:SetAnchorsAndPosition( 0, 1, 0, 0, 0, _1080p * 3, 0, 0, 0, LUI.EASING.inBack )
				end,
				function ()
					return self.CapLeft:SetAnchorsAndPosition( 0, 1, 0, 0, _1080p * 273.5, _1080p * 276.5, 0, 0, 200, LUI.EASING.inBack )
				end
			}
		} )
		CapRight:RegisterAnimationSequence( "Shutdown", {
			{
				function ()
					return self.CapRight:SetAlpha( 1, 0, LUI.EASING.inBack )
				end,
				function ()
					return self.CapRight:SetAlpha( 1, 300 )
				end,
				function ()
					return self.CapRight:SetAlpha( 0, 50 )
				end,
				function ()
					return self.CapRight:SetAlpha( 1, 50 )
				end,
				function ()
					return self.CapRight:SetAlpha( 0, 50 )
				end,
				function ()
					return self.CapRight:SetAlpha( 1, 50 )
				end,
				function ()
					return self.CapRight:SetAlpha( 0, 50 )
				end
			},
			{
				function ()
					return self.CapRight:SetAnchorsAndPosition( 1, 0, 0, 0, _1080p * -3, 0, 0, 0, 0, LUI.EASING.inBack )
				end
			}
		} )
		Header:RegisterAnimationSequence( "Shutdown", {
			{
				function ()
					return self.Header:SetAlpha( 1, 0 )
				end,
				function ()
					return self.Header:SetAlpha( 0, 50 )
				end
			}
		} )
		self._sequences.Shutdown = function ()
			Background:AnimateSequence( "Shutdown" )
			CapLeft:AnimateSequence( "Shutdown" )
			CapRight:AnimateSequence( "Shutdown" )
			Header:AnimateSequence( "Shutdown" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	return self
end

MenuBuilder.registerType( "JackalObjectiveListTopBar", JackalObjectiveListTopBar )
LockTable( _M )
