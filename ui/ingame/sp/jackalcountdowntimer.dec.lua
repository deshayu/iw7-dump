local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function PostLoadFunc( f1_arg0, f1_arg1, f1_arg2 )
	f1_arg0:SetBlendMode( BLEND_MODE.addWithAlpha )
	f1_arg0:SubscribeToModel( DataSources.inGame.jackal.atmoLaunchCountdown:GetModel( f1_arg1 ), function ()
		local f2_local0 = function ( f3_arg0, f3_arg1 )
			local f3_local0 = f3_arg1.controller or controller
			if DataSources.inGame.jackal.atmoLaunchCountdown:GetValue( f1_arg1 ) ~= nil and DataSources.inGame.jackal.atmoLaunchCountdown:GetValue( f1_arg1 ) > 0 then
				ACTIONS.AnimateSequence( f1_arg0, "Show" )
			end
			if DataSources.inGame.jackal.atmoLaunchCountdown:GetValue( f1_arg1 ) ~= nil and DataSources.inGame.jackal.atmoLaunchCountdown:GetValue( f1_arg1 ) <= 0 then
				ACTIONS.AnimateSequence( f1_arg0, "Hide" )
			end
		end
		
		f2_local0( f1_arg0, {
			name = "datasource_event"
		} )
	end, true )
end

function JackalCountdownTimer( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 500 * _1080p, 0, 80 * _1080p )
	self.id = "JackalCountdownTimer"
	self._animationSets = {}
	self._sequences = {}
	local f4_local1 = controller and controller.controllerIndex
	if not f4_local1 and not Engine.InFrontend() then
		f4_local1 = self:getRootController()
	end
	assert( f4_local1 )
	local f4_local2 = self
	local CountdownTimer = nil
	
	CountdownTimer = MenuBuilder.BuildRegisteredType( "UICountdown", {
		controllerIndex = f4_local1
	} )
	CountdownTimer.id = "CountdownTimer"
	CountdownTimer:SetRGBFromTable( SWATCHES.jackal.notification, 0 )
	CountdownTimer:SetAlpha( 0, 0 )
	CountdownTimer:SetFontSize( 38 * _1080p )
	CountdownTimer:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	CountdownTimer:SetAlignment( LUI.Alignment.Center )
	CountdownTimer:SetAnchorsAndPosition( 0, 0, 1, 0, 0, 0, _1080p * -48, _1080p * -10 )
	CountdownTimer:SubscribeToModel( DataSources.inGame.jackal.atmoLaunchCountdown:GetModel( f4_local1 ), function ()
		local f5_local0 = DataSources.inGame.jackal.atmoLaunchCountdown:GetValue( f4_local1 )
		if f5_local0 ~= nil then
			CountdownTimer:setEndTime( f5_local0 )
		end
	end )
	self:addElement( CountdownTimer )
	self.CountdownTimer = CountdownTimer
	
	local Header = nil
	
	Header = LUI.UIText.new()
	Header.id = "Header"
	Header:SetRGBFromTable( SWATCHES.jackal.notification, 0 )
	Header:SetAlpha( 0, 0 )
	Header:setText( ToUpperCase( Engine.Localize( "JACKAL_ATMOSPHERIC_LAUNCH_IN" ) ), 0 )
	Header:SetFontSize( 32 * _1080p )
	Header:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	Header:SetAlignment( LUI.Alignment.Center )
	Header:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, 0, _1080p * 32 )
	self:addElement( Header )
	self.Header = Header
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		CountdownTimer:RegisterAnimationSequence( "Default", {
			{
				function ()
					return self.CountdownTimer:SetAlpha( 0, 0 )
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
			CountdownTimer:AnimateSequence( "Default" )
			Header:AnimateSequence( "Default" )
		end
		
		CountdownTimer:RegisterAnimationSequence( "Show", {
			{
				function ()
					return self.CountdownTimer:SetAlpha( 1, 0 )
				end,
				function ()
					return self.CountdownTimer:SetAlpha( 0.5, 150 )
				end,
				function ()
					return self.CountdownTimer:SetAlpha( 1, 150 )
				end
			},
			{
				function ()
					return self.CountdownTimer:SetRGBFromTable( SWATCHES.jackal.notification, 0 )
				end
			}
		} )
		Header:RegisterAnimationSequence( "Show", {
			{
				function ()
					return self.Header:SetAlpha( 1, 0 )
				end,
				function ()
					return self.Header:SetAlpha( 0.5, 150 )
				end,
				function ()
					return self.Header:SetAlpha( 1, 150 )
				end
			}
		} )
		self._sequences.Show = function ()
			CountdownTimer:AnimateLoop( "Show" )
			Header:AnimateLoop( "Show" )
		end
		
		CountdownTimer:RegisterAnimationSequence( "Hide", {
			{
				function ()
					return self.CountdownTimer:SetAlpha( 0, 0 )
				end
			},
			{
				function ()
					return self.CountdownTimer:SetRGBFromTable( SWATCHES.jackal.warning, 0 )
				end
			}
		} )
		Header:RegisterAnimationSequence( "Hide", {
			{
				function ()
					return self.Header:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.Hide = function ()
			CountdownTimer:AnimateSequence( "Hide" )
			Header:AnimateSequence( "Hide" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	self:SubscribeToModel( DataSources.inGame.jackal.atmoLaunchCountdown:GetModel( f4_local1 ), function ()
		if DataSources.inGame.jackal.atmoLaunchCountdown:GetValue( f4_local1 ) ~= nil and DataSources.inGame.jackal.atmoLaunchCountdown:GetValue( f4_local1 ) > 0 then
			ACTIONS.AnimateSequence( self, "Show" )
		end
		if DataSources.inGame.jackal.atmoLaunchCountdown:GetValue( f4_local1 ) ~= nil and DataSources.inGame.jackal.atmoLaunchCountdown:GetValue( f4_local1 ) <= 0 then
			ACTIONS.AnimateSequence( self, "Hide" )
		end
	end )
	PostLoadFunc( self, f4_local1, controller )
	return self
end

MenuBuilder.registerType( "JackalCountdownTimer", JackalCountdownTimer )
LockTable( _M )
