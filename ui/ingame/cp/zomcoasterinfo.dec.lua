local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function PostLoadFunc( f1_arg0, f1_arg1 )
	f1_arg0:SetupInWorldElement( {} )
	f1_arg0:SetInWorldScale( 0.35 )
	f1_arg0:SetWorldSpacePosition( -421, -1734, 663 )
	f1_arg0:SetWorldSpaceYaw( 0 )
end

function zomCoasterInfo( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 491 * _1080p, 0, 189 * _1080p )
	self.id = "zomCoasterInfo"
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
	Title:setText( "Next Ride", 0 )
	Title:SetFontSize( 32 * _1080p )
	Title:SetFont( FONTS.GetFont( FONTS.MainExtended.File ) )
	Title:SetAlignment( LUI.Alignment.Center )
	Title:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 491, _1080p * 38.5, _1080p * 72.5 )
	self:addElement( Title )
	self.Title = Title
	
	local Label0Copy0 = nil
	
	Label0Copy0 = LUI.UIText.new()
	Label0Copy0.id = "Label0Copy0"
	Label0Copy0:SetRGBFromTable( SWATCHES.genericButton.contentFocus, 0 )
	Label0Copy0:SetFontSize( 48 * _1080p )
	Label0Copy0:SetFont( FONTS.GetFont( FONTS.Digital.File ) )
	Label0Copy0:SetAlignment( LUI.Alignment.Center )
	Label0Copy0:SetAnchorsAndPosition( 0, 1, 1, 0, _1080p * 3.39, _1080p * 487.61, _1080p * -100, _1080p * -52 )
	Label0Copy0:SubscribeToModel( DataSources.inGame.CP.zombies.zomCoasterInfo:GetModel( f2_local1 ), function ()
		local f3_local0 = DataSources.inGame.CP.zombies.zomCoasterInfo:GetValue( f2_local1 )
		if f3_local0 ~= nil then
			Label0Copy0:setText( f3_local0, 0 )
		end
	end )
	self:addElement( Label0Copy0 )
	self.Label0Copy0 = Label0Copy0
	
	local Label0Copy1 = nil
	
	Label0Copy1 = LUI.UIText.new()
	Label0Copy1.id = "Label0Copy1"
	Label0Copy1:SetRGBFromTable( SWATCHES.genericButton.contentFocus, 0 )
	Label0Copy1:SetAlpha( 0, 0 )
	Label0Copy1:setText( "Ready", 0 )
	Label0Copy1:SetFontSize( 32 * _1080p )
	Label0Copy1:SetFont( FONTS.GetFont( FONTS.MainExtended.File ) )
	Label0Copy1:SetAlignment( LUI.Alignment.Center )
	Label0Copy1:SetAnchorsAndPosition( 0, 1, 1, 0, _1080p * 3.39, _1080p * 487.61, _1080p * -95, _1080p * -65 )
	self:addElement( Label0Copy1 )
	self.Label0Copy1 = Label0Copy1
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		Label0Copy0:RegisterAnimationSequence( "showTimeRemaining", {
			{
				function ()
					return self.Label0Copy0:SetAlpha( 1, 0 )
				end,
				function ()
					return self.Label0Copy0:SetAlpha( 1, 90 )
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
		
	end
	
	self._animationSets.DefaultAnimationSet()
	self:SubscribeToModel( DataSources.inGame.CP.zombies.zomCoasterInfo:GetModel( f2_local1 ), function ()
		if DataSources.inGame.CP.zombies.zomCoasterInfo:GetValue( f2_local1 ) ~= nil and DataSources.inGame.CP.zombies.zomCoasterInfo:GetValue( f2_local1 ) > 0 then
			ACTIONS.AnimateSequence( self, "showTimeRemaining" )
			ACTIONS.AnimateSequence( self, "hideReady" )
			ACTIONS.AnimateSequence( self, "showNextRide" )
		end
		if DataSources.inGame.CP.zombies.zomCoasterInfo:GetValue( f2_local1 ) ~= nil and DataSources.inGame.CP.zombies.zomCoasterInfo:GetValue( f2_local1 ) < 0 then
			ACTIONS.AnimateSequence( self, "hideTimeRemaining" )
			ACTIONS.AnimateSequence( self, "hideReady" )
			ACTIONS.AnimateSequence( self, "hideNextRide" )
		end
		if DataSources.inGame.CP.zombies.zomCoasterInfo:GetValue( f2_local1 ) ~= nil and DataSources.inGame.CP.zombies.zomCoasterInfo:GetValue( f2_local1 ) == 0 then
			ACTIONS.AnimateSequence( self, "hideTimeRemaining" )
			ACTIONS.AnimateSequence( self, "showNextRide" )
			ACTIONS.AnimateSequence( self, "showReady" )
		end
	end )
	PostLoadFunc( self, f2_local1, controller )
	ACTIONS.AnimateSequence( self, "hideTimeRemaining" )
	ACTIONS.AnimateSequence( self, "hideNextRide" )
	ACTIONS.AnimateSequence( self, "hideReady" )
	return self
end

MenuBuilder.registerType( "zomCoasterInfo", zomCoasterInfo )
LockTable( _M )
