local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function PostLoadFunc( menu, controller )
	local self = LUI.UIMessageQueue.new( nil, {
		controller = controller,
		nextMessageDelay = 250
	} )
	menu:addElement( self )
	LUI.UIMessageQueue.AddWidget( self, menu, {
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
	menu:addEventHandler( "message_queue_show", function ( f2_arg0, f2_arg1 )
		local f2_local0 = DataSources.inGame.MP.splashes.globalPlayer.sound:GetValue( controller )
		if f2_local0 ~= nil and f2_local0 ~= "" then
			Engine.PlaySound( f2_local0 )
		end
		local f2_local1 = DataSources.inGame.MP.splashes.globalPlayer.splashIndex:GetValue( controller )
		if f2_local1 then
			local f2_local2 = Engine.TableLookupByRow( CSV.zombieSplashTable.file, f2_local1, CSV.zombieSplashTable.cols.notifyScript )
			if f2_local2 and f2_local2 ~= "" then
				Engine.NotifyServer( "splash_shown", f2_local1 )
			end
		end
	end )
end

function GlobalPlayerZombieSplash( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 418 * _1080p, 0, 147 * _1080p )
	self.id = "GlobalPlayerZombieSplash"
	self._animationSets = {}
	self._sequences = {}
	local f3_local1 = controller and controller.controllerIndex
	if not f3_local1 and not Engine.InFrontend() then
		f3_local1 = self:getRootController()
	end
	assert( f3_local1 )
	local f3_local2 = self
	local BackgroundDarken = nil
	
	BackgroundDarken = LUI.UIImage.new()
	BackgroundDarken.id = "BackgroundDarken"
	BackgroundDarken:SetRGBFromInt( 0, 0 )
	BackgroundDarken:SetAlpha( 0, 0 )
	BackgroundDarken:setImage( RegisterMaterial( "hud_message_bkgd" ), 0 )
	BackgroundDarken:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * -5, _1080p * 5, _1080p * -5, _1080p * 5 )
	self:addElement( BackgroundDarken )
	self.BackgroundDarken = BackgroundDarken
	
	local Header = nil
	
	Header = LUI.UIText.new()
	Header.id = "Header"
	Header:SetRGBFromTable( SWATCHES.HUD.stable, 0 )
	Header:SetAlpha( 0, 0 )
	Header:SetFontSize( 30 * _1080p )
	Header:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	Header:setTextStyle( CoD.TextStyle.Shadowed )
	Header:SetAlignment( LUI.Alignment.Left )
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
					return self.BackgroundDarken:SetAlpha( 0, 0 )
				end,
				function ()
					return self.BackgroundDarken:SetAlpha( 0.5, 250, LUI.EASING.outCubic )
				end
			},
			{
				function ()
					return self.BackgroundDarken:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * 1025, _1080p * 1035, _1080p * -5, _1080p * 5, 0 )
				end,
				function ()
					return self.BackgroundDarken:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * -5, _1080p * 5, _1080p * -5, _1080p * 5, 250, LUI.EASING.outCubic )
				end
			}
		} )
		Header:RegisterAnimationSequence( "Show", {
			{
				function ()
					return self.Header:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.Header:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 1030, _1080p * 1030, _1080p * -1, _1080p * 29, 0 )
				end,
				function ()
					return self.Header:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, _1080p * -1, _1080p * 29, 250, LUI.EASING.outCubic )
				end
			}
		} )
		PlayerCard:RegisterAnimationSequence( "Show", {
			{
				function ()
					return self.PlayerCard:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.PlayerCard:SetAnchorsAndPosition( 0, 0, 1, 0, _1080p * 1030, _1080p * 1030, _1080p * -119, 0, 0 )
				end,
				function ()
					return self.PlayerCard:SetAnchorsAndPosition( 0, 0, 1, 0, 0, 0, _1080p * -119, 0, 250, LUI.EASING.outCubic )
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
					return self.BackgroundDarken:SetAlpha( 0.5, 0 )
				end,
				function ()
					return self.BackgroundDarken:SetAlpha( 0, 400, LUI.EASING.inBack )
				end
			},
			{
				function ()
					return self.BackgroundDarken:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * -5, _1080p * 5, _1080p * -5, _1080p * 5, 0 )
				end,
				function ()
					return self.BackgroundDarken:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * 1022, _1080p * 1032, _1080p * -5, _1080p * 5, 400, LUI.EASING.inBack )
				end
			}
		} )
		Header:RegisterAnimationSequence( "Hide", {
			{
				function ()
					return self.Header:SetAlpha( 1, 390 )
				end,
				function ()
					return self.Header:SetAlpha( 0, 10, LUI.EASING.inBack )
				end
			},
			{
				function ()
					return self.Header:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, _1080p * -1, _1080p * 29, 0 )
				end,
				function ()
					return self.Header:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 1025, _1080p * 1025, _1080p * -1, _1080p * 29, 400, LUI.EASING.inBack )
				end
			}
		} )
		PlayerCard:RegisterAnimationSequence( "Hide", {
			{
				function ()
					return self.PlayerCard:SetAlpha( 1, 390 )
				end,
				function ()
					return self.PlayerCard:SetAlpha( 0, 10, LUI.EASING.inBack )
				end
			},
			{
				function ()
					return self.PlayerCard:SetAnchorsAndPosition( 0, 0, 1, 0, 0, 0, _1080p * -119, 0, 0 )
				end,
				function ()
					return self.PlayerCard:SetAnchorsAndPosition( 0, 0, 1, 0, _1080p * 1025, _1080p * 1025, _1080p * -119, 0, 400, LUI.EASING.inBack )
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
	self:addEventHandler( "message_queue_show", function ( f31_arg0, f31_arg1 )
		local f31_local0 = f31_arg1.controller or f3_local1
		ACTIONS.AnimateSequence( self, "Show" )
	end )
	self:addEventHandler( "message_queue_hide", function ( f32_arg0, f32_arg1 )
		local f32_local0 = f32_arg1.controller or f3_local1
		ACTIONS.AnimateSequence( self, "Hide" )
	end )
	PostLoadFunc( self, f3_local1, controller )
	return self
end

MenuBuilder.registerType( "GlobalPlayerZombieSplash", GlobalPlayerZombieSplash )
LockTable( _M )
