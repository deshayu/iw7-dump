local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function PostLoadFunc( f1_arg0, f1_arg1 )
	f1_arg0.Header:SetShadowUOffset( -0 )
	f1_arg0.Header:SetShadowVOffset( -0 )
	local self = LUI.UIMessageQueue.new( nil, {
		controller = f1_arg1,
		nextMessageDelay = 250
	} )
	f1_arg0:addElement( self )
	LUI.UIMessageQueue.AddWidget( self, f1_arg0, {
		messageType = LUI.UIMessageQueue.MessageType.GlobalPlayerSplash,
		dataSourcesFrom = {
			splashIndex = DataSources.inGame.MP.splashes.queue.splashIndex,
			cardClientId = DataSources.inGame.MP.splashes.queue.cardClientId,
			header = DataSources.inGame.MP.splashes.queue.header,
			body = DataSources.inGame.MP.splashes.queue.body,
			headerAlpha = DataSources.inGame.MP.splashes.queue.headerAlpha,
			bodyAlpha = DataSources.inGame.MP.splashes.queue.bodyAlpha,
			sound = DataSources.inGame.MP.splashes.queue.sound,
			push = DataSources.inGame.MP.splashes.queue.pushToGlobalPlayer
		},
		dataSourcesTo = {
			splashIndex = DataSources.inGame.MP.splashes.globalPlayer.splashIndex,
			cardClientId = DataSources.inGame.MP.splashes.globalPlayer.cardClientId,
			header = DataSources.inGame.MP.splashes.globalPlayer.header,
			body = DataSources.inGame.MP.splashes.globalPlayer.body,
			headerAlpha = DataSources.inGame.MP.splashes.globalPlayer.headerAlpha,
			bodyAlpha = DataSources.inGame.MP.splashes.globalPlayer.bodyAlpha,
			sound = DataSources.inGame.MP.splashes.globalPlayer.sound
		}
	} )
	f1_arg0:addEventHandler( "message_queue_show", function ( f2_arg0, f2_arg1 )
		local f2_local0 = DataSources.inGame.MP.splashes.globalPlayer.sound:GetValue( f1_arg1 )
		if f2_local0 ~= nil and f2_local0 ~= "" then
			Engine.PlaySound( f2_local0 )
		end
		local f2_local1 = DataSources.inGame.MP.splashes.globalPlayer.splashIndex:GetValue( f1_arg1 )
		if f2_local1 then
			local f2_local2 = Engine.TableLookupByRow( CSV.splashTable.file, f2_local1, CSV.splashTable.cols.notifyScript )
			if f2_local2 and f2_local2 ~= "" then
				Engine.NotifyServer( "splash_shown", f2_local1 )
			end
		end
	end )
end

function GlobalPlayerSplash( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 418 * _1080p, 0, 147 * _1080p )
	self.id = "GlobalPlayerSplash"
	self._animationSets = {}
	self._sequences = {}
	local f3_local1 = controller and controller.controllerIndex
	if not f3_local1 and not Engine.InFrontend() then
		f3_local1 = self:getRootController()
	end
	assert( f3_local1 )
	local f3_local2 = self
	local BackgroundDarken = nil
	
	BackgroundDarken = LUI.UIBlur.new()
	BackgroundDarken.id = "BackgroundDarken"
	BackgroundDarken:SetRGBFromInt( 11776947, 0 )
	BackgroundDarken:SetAlpha( 0, 0 )
	BackgroundDarken:SetGlitchEnabled( true )
	BackgroundDarken:SetGlitchAmount( 1, 0 )
	BackgroundDarken:SetGlitchBlockWidth( 50, 0 )
	BackgroundDarken:SetGlitchBlockHeight( 50, 0 )
	BackgroundDarken:SetGlitchDistortionRange( 16, 0 )
	BackgroundDarken:SetGlitchScanlinePitch( 1, 0 )
	BackgroundDarken:SetGlitchMaskPitch( 1, 0 )
	BackgroundDarken:SetBlurStrength( 1, 0 )
	BackgroundDarken:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * -5, _1080p * 5, _1080p * -5, _1080p * 5 )
	self:addElement( BackgroundDarken )
	self.BackgroundDarken = BackgroundDarken
	
	local Header = nil
	
	Header = LUI.UIStyledText.new()
	Header.id = "Header"
	Header:SetAlpha( 0, 0 )
	Header:SetGlitchEnabled( true )
	Header:SetGlitchAmount( 1, 0 )
	Header:SetGlitchBlockWidth( 50, 0 )
	Header:SetGlitchBlockHeight( 50, 0 )
	Header:SetGlitchDistortionRange( 16, 0 )
	Header:SetGlitchScanlinePitch( 1, 0 )
	Header:SetGlitchMaskPitch( 1, 0 )
	Header:SetFontSize( 30 * _1080p )
	Header:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	Header:SetAlignment( LUI.Alignment.Left )
	Header:SetShadowMinDistance( -0.2, 0 )
	Header:SetShadowMaxDistance( 0.2, 0 )
	Header:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, _1080p * -1, _1080p * 29 )
	Header:SubscribeToModel( DataSources.inGame.MP.splashes.globalPlayer.header:GetModel( f3_local1 ), function ()
		local f4_local0 = DataSources.inGame.MP.splashes.globalPlayer.header:GetValue( f3_local1 )
		if f4_local0 ~= nil then
			Header:setText( f4_local0, 0 )
		end
	end )
	self:addElement( Header )
	self.Header = Header
	
	local PlayerCard = nil
	
	PlayerCard = MenuBuilder.BuildRegisteredType( "SmallPlayerCard", {
		controllerIndex = f3_local1
	} )
	PlayerCard.id = "PlayerCard"
	PlayerCard:SetAlpha( 0, 0 )
	PlayerCard:SetGlitchEnabled( true )
	PlayerCard:SetGlitchAmount( 1, 0 )
	PlayerCard:SetGlitchBlockWidth( 50, 0 )
	PlayerCard:SetGlitchBlockHeight( 50, 0 )
	PlayerCard:SetGlitchDistortionRange( 16, 0 )
	PlayerCard:SetGlitchScanlinePitch( 1, 0 )
	PlayerCard:SetGlitchMaskPitch( 1, 0 )
	PlayerCard:SetDataSource( DataSources.inGame.MP.splashes.globalPlayer.playerCard, f3_local1 )
	PlayerCard:SetAnchorsAndPosition( 0, 0, 1, 0, 0, 0, _1080p * -119, 0 )
	self:addElement( PlayerCard )
	self.PlayerCard = PlayerCard
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		BackgroundDarken:RegisterAnimationSequence( "Show", {
			{
				function ()
					return self.BackgroundDarken:SetGlitchAmount( 1, 0 )
				end,
				function ()
					return self.BackgroundDarken:SetGlitchAmount( 0, 100 )
				end
			},
			{
				function ()
					return self.BackgroundDarken:SetGlitchBlockWidth( 10, 0 )
				end,
				function ()
					return self.BackgroundDarken:SetGlitchBlockWidth( 1, 100 )
				end
			},
			{
				function ()
					return self.BackgroundDarken:SetGlitchBlockHeight( 10, 0 )
				end,
				function ()
					return self.BackgroundDarken:SetGlitchBlockHeight( 16, 100 )
				end
			},
			{
				function ()
					return self.BackgroundDarken:SetGlitchScanlinePitch( 60, 0 )
				end
			},
			{
				function ()
					return self.BackgroundDarken:SetGlitchMaskPitch( 50, 0 )
				end,
				function ()
					return self.BackgroundDarken:SetGlitchMaskPitch( 50, 100 )
				end
			},
			{
				function ()
					return self.BackgroundDarken:SetAlpha( 0, 0 )
				end,
				function ()
					return self.BackgroundDarken:SetAlpha( 1, 30 )
				end
			},
			{
				function ()
					return self.BackgroundDarken:SetGlitchDistortionRange( 30, 100 )
				end
			}
		} )
		Header:RegisterAnimationSequence( "Show", {
			{
				function ()
					return self.Header:SetGlitchAmount( 1, 0 )
				end,
				function ()
					return self.Header:SetGlitchAmount( 0, 100 )
				end
			},
			{
				function ()
					return self.Header:SetGlitchBlockWidth( 10, 0 )
				end,
				function ()
					return self.Header:SetGlitchBlockWidth( 1, 100 )
				end
			},
			{
				function ()
					return self.Header:SetGlitchBlockHeight( 10, 0 )
				end,
				function ()
					return self.Header:SetGlitchBlockHeight( 16, 100 )
				end
			},
			{
				function ()
					return self.Header:SetGlitchScanlinePitch( 60, 0 )
				end,
				function ()
					return self.Header:SetGlitchScanlinePitch( 60, 100 )
				end
			},
			{
				function ()
					return self.Header:SetGlitchMaskPitch( 50, 0 )
				end,
				function ()
					return self.Header:SetGlitchMaskPitch( 50, 100 )
				end
			},
			{
				function ()
					return self.Header:SetAlpha( 0, 0 )
				end,
				function ()
					return self.Header:SetAlpha( 1, 30 )
				end
			},
			{
				function ()
					return self.Header:SetGlitchDistortionRange( 30, 100 )
				end
			}
		} )
		PlayerCard:RegisterAnimationSequence( "Show", {
			{
				function ()
					return self.PlayerCard:SetGlitchAmount( 1, 0 )
				end,
				function ()
					return self.PlayerCard:SetGlitchAmount( 0, 100 )
				end
			},
			{
				function ()
					return self.PlayerCard:SetGlitchBlockWidth( 10, 0 )
				end,
				function ()
					return self.PlayerCard:SetGlitchBlockWidth( 1, 100 )
				end
			},
			{
				function ()
					return self.PlayerCard:SetGlitchBlockHeight( 10, 0 )
				end,
				function ()
					return self.PlayerCard:SetGlitchBlockHeight( 16, 100 )
				end
			},
			{
				function ()
					return self.PlayerCard:SetGlitchScanlinePitch( 60, 0 )
				end,
				function ()
					return self.PlayerCard:SetGlitchScanlinePitch( 60, 100 )
				end
			},
			{
				function ()
					return self.PlayerCard:SetGlitchMaskPitch( 50, 0 )
				end,
				function ()
					return self.PlayerCard:SetGlitchMaskPitch( 50, 100 )
				end
			},
			{
				function ()
					return self.PlayerCard:SetAlpha( 0, 0 )
				end,
				function ()
					return self.PlayerCard:SetAlpha( 1, 30 )
				end
			},
			{
				function ()
					return self.PlayerCard:SetGlitchDistortionRange( 30, 100 )
				end
			}
		} )
		self._sequences.Show = function ()
			BackgroundDarken:AnimateSequence( "Show" )
			Header:AnimateSequence( "Show" )
			PlayerCard:AnimateSequence( "Show" )
		end
		
		BackgroundDarken:RegisterAnimationSequence( "Hide", {
			{
				function ()
					return self.BackgroundDarken:SetGlitchAmount( 1, 0 )
				end
			},
			{
				function ()
					return self.BackgroundDarken:SetGlitchBlockWidth( 1, 0 )
				end,
				function ()
					return self.BackgroundDarken:SetGlitchBlockWidth( 10, 100 )
				end
			},
			{
				function ()
					return self.BackgroundDarken:SetGlitchBlockHeight( 16, 0 )
				end,
				function ()
					return self.BackgroundDarken:SetGlitchBlockHeight( 5, 100 )
				end
			},
			{
				function ()
					return self.BackgroundDarken:SetGlitchScanlinePitch( 60, 0 )
				end,
				function ()
					return self.BackgroundDarken:SetGlitchScanlinePitch( 60, 100 )
				end
			},
			{
				function ()
					return self.BackgroundDarken:SetGlitchMaskPitch( 50, 0 )
				end,
				function ()
					return self.BackgroundDarken:SetGlitchMaskPitch( 50, 100 )
				end
			},
			{
				function ()
					return self.BackgroundDarken:SetGlitchDistortionRange( 50, 0 )
				end,
				function ()
					return self.BackgroundDarken:SetGlitchDistortionRange( 16, 100 )
				end
			},
			{
				function ()
					return self.BackgroundDarken:SetAlpha( 1, 0 )
				end,
				function ()
					return self.BackgroundDarken:SetAlpha( 1, 100 )
				end,
				function ()
					return self.BackgroundDarken:SetAlpha( 0, 50 )
				end
			}
		} )
		Header:RegisterAnimationSequence( "Hide", {
			{
				function ()
					return self.Header:SetGlitchAmount( 1, 0 )
				end
			},
			{
				function ()
					return self.Header:SetGlitchBlockWidth( 1, 0 )
				end,
				function ()
					return self.Header:SetGlitchBlockWidth( 4, 100 )
				end
			},
			{
				function ()
					return self.Header:SetGlitchBlockHeight( 9, 0 )
				end,
				function ()
					return self.Header:SetGlitchBlockHeight( 10, 100 )
				end
			},
			{
				function ()
					return self.Header:SetGlitchScanlinePitch( 60, 0 )
				end,
				function ()
					return self.Header:SetGlitchScanlinePitch( 60, 100 )
				end
			},
			{
				function ()
					return self.Header:SetGlitchMaskPitch( 30, 0 )
				end,
				function ()
					return self.Header:SetGlitchMaskPitch( 50, 100 )
				end
			},
			{
				function ()
					return self.Header:SetGlitchDistortionRange( 50, 0 )
				end,
				function ()
					return self.Header:SetGlitchDistortionRange( 16, 100 )
				end
			},
			{
				function ()
					return self.Header:SetAlpha( 1, 0 )
				end,
				function ()
					return self.Header:SetAlpha( 1, 100 )
				end,
				function ()
					return self.Header:SetAlpha( 0, 50 )
				end
			}
		} )
		PlayerCard:RegisterAnimationSequence( "Hide", {
			{
				function ()
					return self.PlayerCard:SetGlitchAmount( 1, 0 )
				end
			},
			{
				function ()
					return self.PlayerCard:SetGlitchBlockWidth( 1, 0 )
				end,
				function ()
					return self.PlayerCard:SetGlitchBlockWidth( 10, 100 )
				end
			},
			{
				function ()
					return self.PlayerCard:SetGlitchBlockHeight( 8, 0 )
				end,
				function ()
					return self.PlayerCard:SetGlitchBlockHeight( 3, 100 )
				end
			},
			{
				function ()
					return self.PlayerCard:SetGlitchDistortionRange( 50, 0 )
				end,
				function ()
					return self.PlayerCard:SetGlitchDistortionRange( 16, 100 )
				end
			},
			{
				function ()
					return self.PlayerCard:SetGlitchScanlinePitch( 60, 0 )
				end,
				function ()
					return self.PlayerCard:SetGlitchScanlinePitch( 60, 100 )
				end
			},
			{
				function ()
					return self.PlayerCard:SetGlitchMaskPitch( 30, 0 )
				end,
				function ()
					return self.PlayerCard:SetGlitchMaskPitch( 50, 100 )
				end
			},
			{
				function ()
					return self.PlayerCard:SetAlpha( 1, 0 )
				end,
				function ()
					return self.PlayerCard:SetAlpha( 1, 100 )
				end,
				function ()
					return self.PlayerCard:SetAlpha( 0, 50 )
				end
			}
		} )
		self._sequences.Hide = function ()
			BackgroundDarken:AnimateSequence( "Hide" )
			Header:AnimateSequence( "Hide" )
			PlayerCard:AnimateSequence( "Hide" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	PlayerCard:SetDataSource( DataSources.inGame.MP.splashes.globalPlayer.playerCard, f3_local1 )
	self:addEventHandler( "message_queue_show", function ( f89_arg0, f89_arg1 )
		local f89_local0 = f89_arg1.controller or f3_local1
		ACTIONS.AnimateSequence( self, "Show" )
	end )
	self:addEventHandler( "message_queue_hide", function ( f90_arg0, f90_arg1 )
		local f90_local0 = f90_arg1.controller or f3_local1
		ACTIONS.AnimateSequence( self, "Hide" )
	end )
	PostLoadFunc( self, f3_local1, controller )
	return self
end

MenuBuilder.registerType( "GlobalPlayerSplash", GlobalPlayerSplash )
LockTable( _M )
