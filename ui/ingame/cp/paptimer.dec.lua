local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function PostLoadFunc( f1_arg0, f1_arg1 )
	local f1_local0 = Engine.GetDvarString( "ui_mapname" )
	f1_arg0:SetupInWorldElement( {} )
	f1_arg0:SetInWorldScale( 0.4 )
	if f1_local0 == "cp_final" then
		f1_arg0:SetWorldSpacePosition( 5237.5, -5004.6, 364 )
	else
		f1_arg0:SetWorldSpacePosition( -10142, 927, -1550 )
	end
	f1_arg0:SetWorldSpaceYaw( 0 )
end

function papTimer( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 491 * _1080p, 0, 189 * _1080p )
	self.id = "papTimer"
	self._animationSets = {}
	self._sequences = {}
	local f2_local1 = controller and controller.controllerIndex
	if not f2_local1 and not Engine.InFrontend() then
		f2_local1 = self:getRootController()
	end
	assert( f2_local1 )
	local f2_local2 = self
	local Title = nil
	
	Title = LUI.UIText.new()
	Title.id = "Title"
	Title:SetRGBFromTable( SWATCHES.CAC.equppedExtraPerkTic, 0 )
	Title:setText( "", 0 )
	Title:SetFontSize( 34 * _1080p )
	Title:SetFont( FONTS.GetFont( FONTS.MainExtended.File ) )
	Title:SetAlignment( LUI.Alignment.Center )
	Title:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 491, _1080p * 17.5, _1080p * 51.5 )
	self:addElement( Title )
	self.Title = Title
	
	local Label0Copy0 = nil
	
	Label0Copy0 = LUI.UIText.new()
	Label0Copy0.id = "Label0Copy0"
	Label0Copy0:SetRGBFromInt( 15144984, 0 )
	Label0Copy0:SetScale( -0.1, 0 )
	Label0Copy0:SetFontSize( 45 * _1080p )
	Label0Copy0:SetFont( FONTS.GetFont( FONTS.Digital.File ) )
	Label0Copy0:SetAlignment( LUI.Alignment.Left )
	Label0Copy0:SetOptOutRightToLeftAlignmentFlip( true )
	Label0Copy0:SetAnchorsAndPosition( 0, 1, 1, 0, _1080p * 240.57, _1080p * 339.18, _1080p * -129.5, _1080p * -89.5 )
	Label0Copy0:SubscribeToModel( DataSources.inGame.CP.zombies.zomPapTimer:GetModel( f2_local1 ), function ()
		local f3_local0 = DataSources.inGame.CP.zombies.zomPapTimer:GetValue( f2_local1 )
		if f3_local0 ~= nil then
			Label0Copy0:setText( f3_local0, 0 )
		end
	end )
	self:addElement( Label0Copy0 )
	self.Label0Copy0 = Label0Copy0
	
	local Label0Copy1 = nil
	
	Label0Copy1 = LUI.UIText.new()
	Label0Copy1.id = "Label0Copy1"
	Label0Copy1:SetRGBFromInt( 15144984, 0 )
	Label0Copy1:setText( "Goodbye", 0 )
	Label0Copy1:SetFontSize( 24 * _1080p )
	Label0Copy1:SetFont( FONTS.GetFont( FONTS.MainExtended.File ) )
	Label0Copy1:SetAlignment( LUI.Alignment.Center )
	Label0Copy1:SetAnchorsAndPosition( 0, 1, 1, 0, _1080p * 174.96, _1080p * 306.18, _1080p * -124.5, _1080p * -100.5 )
	self:addElement( Label0Copy1 )
	self.Label0Copy1 = Label0Copy1
	
	local Label0Copy2 = nil
	
	Label0Copy2 = LUI.UIText.new()
	Label0Copy2.id = "Label0Copy2"
	Label0Copy2:SetRGBFromInt( 15144984, 0 )
	Label0Copy2:SetScale( -0.1, 0 )
	Label0Copy2:setText( "00:", 0 )
	Label0Copy2:SetFontSize( 38 * _1080p )
	Label0Copy2:SetFont( FONTS.GetFont( FONTS.Digital.File ) )
	Label0Copy2:SetAlignment( LUI.Alignment.Right )
	Label0Copy2:SetAnchorsAndPosition( 0, 1, 1, 0, _1080p * 78.67, _1080p * 254.28, _1080p * -129.5, _1080p * -89.5 )
	self:addElement( Label0Copy2 )
	self.Label0Copy2 = Label0Copy2
	
	local Label0Copy3 = nil
	
	Label0Copy3 = LUI.UIText.new()
	Label0Copy3.id = "Label0Copy3"
	Label0Copy3:SetRGBFromInt( 15144984, 0 )
	Label0Copy3:SetScale( -0.1, 0 )
	Label0Copy3:setText( "0", 0 )
	Label0Copy3:SetFontSize( 36 * _1080p )
	Label0Copy3:SetFont( FONTS.GetFont( FONTS.Digital.File ) )
	Label0Copy3:SetAlignment( LUI.Alignment.Left )
	Label0Copy3:SetAnchorsAndPosition( 0, 1, 1, 0, _1080p * 243.81, _1080p * 277.61, _1080p * -129.5, _1080p * -89.5 )
	self:addElement( Label0Copy3 )
	self.Label0Copy3 = Label0Copy3
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		Label0Copy0:RegisterAnimationSequence( "showTimeRemaining", {
			{
				function ()
					return self.Label0Copy0:SetAlpha( 1, 0 )
				end,
				function ()
					return self.Label0Copy0:SetAlpha( 0, 10 )
				end,
				function ()
					return self.Label0Copy0:SetAlpha( 1, 80 )
				end
			}
		} )
		self._sequences.showTimeRemaining = function ()
			Label0Copy0:AnimateSequence( "showTimeRemaining" )
		end
		
		Label0Copy0:RegisterAnimationSequence( "hideTimeRemaining", {
			{
				function ()
					return self.Label0Copy0:SetAlpha( 1, 0 )
				end,
				function ()
					return self.Label0Copy0:SetAlpha( 0, 100 )
				end
			}
		} )
		self._sequences.hideTimeRemaining = function ()
			Label0Copy0:AnimateSequence( "hideTimeRemaining" )
		end
		
		Label0Copy1:RegisterAnimationSequence( "showReady", {
			{
				function ()
					return self.Label0Copy1:SetAlpha( 0, 0 )
				end,
				function ()
					return self.Label0Copy1:SetAlpha( 1, 100 )
				end
			}
		} )
		self._sequences.showReady = function ()
			Label0Copy1:AnimateSequence( "showReady" )
		end
		
		Label0Copy1:RegisterAnimationSequence( "hideReady", {
			{
				function ()
					return self.Label0Copy1:SetAlpha( 0, 0 )
				end,
				function ()
					return self.Label0Copy1:SetAlpha( 0, 100 )
				end
			}
		} )
		self._sequences.hideReady = function ()
			Label0Copy1:AnimateSequence( "hideReady" )
		end
		
		Title:RegisterAnimationSequence( "hideNextRide", {
			{
				function ()
					return self.Title:SetAlpha( 1, 0 )
				end,
				function ()
					return self.Title:SetAlpha( 0, 100 )
				end
			}
		} )
		self._sequences.hideNextRide = function ()
			Title:AnimateSequence( "hideNextRide" )
		end
		
		Title:RegisterAnimationSequence( "showNextRide", {
			{
				function ()
					return self.Title:SetAlpha( 1, 100 )
				end
			}
		} )
		self._sequences.showNextRide = function ()
			Title:AnimateSequence( "showNextRide" )
		end
		
		Label0Copy2:RegisterAnimationSequence( "showPrefixDigits", {
			{
				function ()
					return self.Label0Copy2:SetAlpha( 0, 0 )
				end,
				function ()
					return self.Label0Copy2:SetAlpha( 1, 80 )
				end
			}
		} )
		self._sequences.showPrefixDigits = function ()
			Label0Copy2:AnimateSequence( "showPrefixDigits" )
		end
		
		Label0Copy2:RegisterAnimationSequence( "hidePrefixDigits", {
			{
				function ()
					return self.Label0Copy2:SetAlpha( 1, 0 )
				end,
				function ()
					return self.Label0Copy2:SetAlpha( 0, 90 )
				end
			}
		} )
		self._sequences.hidePrefixDigits = function ()
			Label0Copy2:AnimateSequence( "hidePrefixDigits" )
		end
		
		Label0Copy3:RegisterAnimationSequence( "showTimerTensDigit", {
			{
				function ()
					return self.Label0Copy3:SetAlpha( 0, 0 )
				end,
				function ()
					return self.Label0Copy3:SetAlpha( 1, 90 )
				end
			}
		} )
		self._sequences.showTimerTensDigit = function ()
			Label0Copy3:AnimateSequence( "showTimerTensDigit" )
		end
		
		Label0Copy3:RegisterAnimationSequence( "hideTimerTensDigit", {
			{
				function ()
					return self.Label0Copy3:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.hideTimerTensDigit = function ()
			Label0Copy3:AnimateSequence( "hideTimerTensDigit" )
		end
		
		Label0Copy0:RegisterAnimationSequence( "ShiftTimerRight", {
			{
				function ()
					return self.Label0Copy0:SetAnchorsAndPosition( 0, 1, 1, 0, _1080p * 273.5, _1080p * 367.11, _1080p * -129.5, _1080p * -89.5, 0 )
				end
			}
		} )
		self._sequences.ShiftTimerRight = function ()
			Label0Copy0:AnimateSequence( "ShiftTimerRight" )
		end
		
		Label0Copy0:RegisterAnimationSequence( "ShiftTimerLeft", {
			{
				function ()
					return self.Label0Copy0:SetAnchorsAndPosition( 0, 1, 1, 0, _1080p * 245.5, _1080p * 339.11, _1080p * -129.5, _1080p * -89.5, 0 )
				end
			}
		} )
		self._sequences.ShiftTimerLeft = function ()
			Label0Copy0:AnimateSequence( "ShiftTimerLeft" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	local f2_local8 = function ()
		if DataSources.inGame.CP.zombies.zomPapTimer:GetValue( f2_local1 ) ~= nil and DataSources.inGame.CP.zombies.zomPapTimer:GetValue( f2_local1 ) > 9 then
			ACTIONS.AnimateSequence( self, "showTimeRemaining" )
			ACTIONS.AnimateSequence( self, "hideReady" )
			ACTIONS.AnimateSequence( self, "showNextRide" )
			ACTIONS.AnimateSequence( self, "showPrefixDigits" )
			ACTIONS.AnimateSequence( self, "hideTimerTensDigit" )
		end
		if DataSources.inGame.CP.zombies.zomPapTimer:GetValue( f2_local1 ) ~= nil and DataSources.inGame.CP.zombies.zomPapTimer:GetValue( f2_local1 ) < 0 then
			ACTIONS.AnimateSequence( self, "hideTimeRemaining" )
			ACTIONS.AnimateSequence( self, "hideReady" )
			ACTIONS.AnimateSequence( self, "hideNextRide" )
			ACTIONS.AnimateSequence( self, "hidePrefixDigits" )
			ACTIONS.AnimateSequence( self, "hideTimerTensDigit" )
		end
		if DataSources.inGame.CP.zombies.zomPapTimer:GetValue( f2_local1 ) ~= nil and DataSources.inGame.CP.zombies.zomPapTimer:GetValue( f2_local1 ) == 0 then
			ACTIONS.AnimateSequence( self, "hideTimeRemaining" )
			ACTIONS.AnimateSequence( self, "showNextRide" )
			ACTIONS.AnimateSequence( self, "showReady" )
			ACTIONS.AnimateSequence( self, "hidePrefixDigits" )
			ACTIONS.AnimateSequence( self, "hideTimerTensDigit" )
			ACTIONS.AnimateSequence( self, "ShiftTimerLeft" )
		end
	end
	
	self:SubscribeToModel( DataSources.inGame.CP.zombies.zomPapTimer:GetModel( f2_local1 ), f2_local8 )
	self:SubscribeToModel( DataSources.inGame.CP.zombies.zomCoasterInfo:GetModel( f2_local1 ), f2_local8 )
	self:SubscribeToModel( DataSources.inGame.CP.zombies.zomPapTimer:GetModel( f2_local1 ), function ()
		if DataSources.inGame.CP.zombies.zomPapTimer:GetValue( f2_local1 ) ~= nil and DataSources.inGame.CP.zombies.zomPapTimer:GetValue( f2_local1 ) <= 9 and DataSources.inGame.CP.zombies.zomPapTimer:GetValue( f2_local1 ) ~= nil and DataSources.inGame.CP.zombies.zomPapTimer:GetValue( f2_local1 ) > 0 then
			ACTIONS.AnimateSequence( self, "showPrefixDigits" )
			ACTIONS.AnimateSequence( self, "showTimerTensDigit" )
			ACTIONS.AnimateSequence( self, "showTimeRemaining" )
			ACTIONS.AnimateSequence( self, "showNextRide" )
			ACTIONS.AnimateSequence( self, "hideReady" )
			ACTIONS.AnimateSequence( self, "ShiftTimerRight" )
		end
	end )
	PostLoadFunc( self, f2_local1, controller )
	ACTIONS.AnimateSequence( self, "hideTimeRemaining" )
	ACTIONS.AnimateSequence( self, "hideNextRide" )
	ACTIONS.AnimateSequence( self, "hideReady" )
	ACTIONS.AnimateSequence( self, "hidePrefixDigits" )
	ACTIONS.AnimateSequence( self, "hideTimerTensDigit" )
	ACTIONS.AnimateSequence( self, "ShiftTimerLeft" )
	return self
end

MenuBuilder.registerType( "papTimer", papTimer )
LockTable( _M )
