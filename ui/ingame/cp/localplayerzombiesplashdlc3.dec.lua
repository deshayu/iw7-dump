local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ( f1_arg0, f1_arg1, f1_arg2 )
	assert( f1_arg0.Header )
	assert( f1_arg0.Body )
	f1_arg0.Header:SetShadowUOffset( -0 )
	f1_arg0.Header:SetShadowVOffset( -0 )
	f1_arg0.Body:SetShadowUOffset( -0 )
	f1_arg0.Body:SetShadowVOffset( -0 )
	if CONDITIONS.IsSplitscreen( f1_arg0 ) then
		f1_arg0:SetScale( -0.75, 0 )
	end
	f1_arg0:addEventHandler( "message_queue_show", function ( f2_arg0, f2_arg1 )
		local f2_local0 = DataSources.inGame.MP.splashes.localPlayer.sound:GetValue( f1_arg1 )
		if f2_local0 ~= "" then
			Engine.PlaySound( f2_local0 )
		end
		local f2_local1 = DataSources.inGame.MP.splashes.localPlayer.splashIndex:GetValue( f1_arg1 )
		if f2_local1 then
			local f2_local2 = Engine.TableLookupByRow( CSV.zombieSplashTable.file, f2_local1, CSV.zombieSplashTable.cols.iconClass )
			if f2_local2 and f2_local2 == "weapon" then
				ACTIONS.AnimateSequenceByElement( f1_arg0, {
					elementName = "splashIconZom",
					sequenceName = "weaponScale",
					elementPath = "splashIconZom"
				} )
			elseif f2_local2 and f2_local2 == "rank" then
				ACTIONS.AnimateSequenceByElement( f1_arg0, {
					elementName = "splashIconZom",
					sequenceName = "rankScale",
					elementPath = "splashIconZom"
				} )
			elseif f2_local2 and f2_local2 == "boss" then
				ACTIONS.AnimateSequence( f1_arg0, "bossTimer" )
				ACTIONS.AnimateSequenceByElement( f1_arg0, {
					elementName = "splashIconZom",
					sequenceName = "rankScale",
					elementPath = "splashIconZom"
				} )
			else
				ACTIONS.AnimateSequenceByElement( f1_arg0, {
					elementName = "splashIconZom",
					sequenceName = "DefaultSequence",
					elementPath = "splashIconZom"
				} )
			end
		end
	end )
end

function LocalPlayerZombieSplashDLC3( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 512 * _1080p, 0, 512 * _1080p )
	self.id = "LocalPlayerZombieSplashDLC3"
	self._animationSets = {}
	self._sequences = {}
	local f3_local1 = controller and controller.controllerIndex
	if not f3_local1 and not Engine.InFrontend() then
		f3_local1 = self:getRootController()
	end
	assert( f3_local1 )
	local f3_local2 = self
	local ring = nil
	
	ring = LUI.UIImage.new()
	ring.id = "ring"
	ring:setImage( RegisterMaterial( "cp_town_merit_ring" ), 0 )
	ring:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 124, _1080p * 380, _1080p * 131.68, _1080p * 387.68 )
	self:addElement( ring )
	self.ring = ring
	
	local spikes = nil
	
	spikes = LUI.UIImage.new()
	spikes.id = "spikes"
	spikes:setImage( RegisterMaterial( "cp_town_merit_spikes_1" ), 0 )
	spikes:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 124, _1080p * 380, _1080p * 128, _1080p * 384 )
	self:addElement( spikes )
	self.spikes = spikes
	
	local spikesSoft = nil
	
	spikesSoft = LUI.UIImage.new()
	spikesSoft.id = "spikesSoft"
	spikesSoft:setImage( RegisterMaterial( "cp_town_merit_spikes_soft_1" ), 0 )
	spikesSoft:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 124, _1080p * 380, _1080p * 128, _1080p * 384 )
	self:addElement( spikesSoft )
	self.spikesSoft = spikesSoft
	
	local bubbles1 = nil
	
	bubbles1 = LUI.UIImage.new()
	bubbles1.id = "bubbles1"
	bubbles1:setImage( RegisterMaterial( "cp_town_merit_bubbles_1" ), 0 )
	bubbles1:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 124, _1080p * 380, _1080p * 128, _1080p * 384 )
	self:addElement( bubbles1 )
	self.bubbles1 = bubbles1
	
	local bubbles2 = nil
	
	bubbles2 = LUI.UIImage.new()
	bubbles2.id = "bubbles2"
	bubbles2:setImage( RegisterMaterial( "cp_town_merit_bubbles_2" ), 0 )
	bubbles2:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 124, _1080p * 380, _1080p * 128, _1080p * 384 )
	self:addElement( bubbles2 )
	self.bubbles2 = bubbles2
	
	local splashIconZom = nil
	
	splashIconZom = MenuBuilder.BuildRegisteredType( "splashIconZom", {
		controllerIndex = f3_local1
	} )
	splashIconZom.id = "splashIconZom"
	splashIconZom:SetScale( 1.5, 0 )
	splashIconZom:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -47, _1080p * 39, _1080p * -43, _1080p * 43 )
	self:addElement( splashIconZom )
	self.splashIconZom = splashIconZom
	
	local Body = nil
	
	Body = LUI.UIStyledText.new()
	Body.id = "Body"
	Body:SetFontSize( 24 * _1080p )
	Body:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	Body:SetAlignment( LUI.Alignment.Center )
	Body:SetStartupDelay( 1100 )
	Body:SetLineHoldTime( 400 )
	Body:SetAnimMoveTime( 200 )
	Body:SetEndDelay( 10000 )
	Body:SetCrossfadeTime( 100 )
	Body:SetAutoScrollStyle( LUI.UIStyledText.AutoScrollStyle.ScrollH )
	Body:SetMaxVisibleLines( 1 )
	Body:SetShadowMinDistance( -0.2, 0 )
	Body:SetShadowRGBFromInt( 0, 0 )
	Body:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -249, _1080p * 251, _1080p * 315, _1080p * 339 )
	Body:SubscribeToModel( DataSources.inGame.MP.splashes.localPlayer.body:GetModel( f3_local1 ), function ()
		local f4_local0 = DataSources.inGame.MP.splashes.localPlayer.body:GetValue( f3_local1 )
		if f4_local0 ~= nil then
			Body:setText( f4_local0, 0 )
		end
	end )
	self:addElement( Body )
	self.Body = Body
	
	local Header = nil
	
	Header = LUI.UIStyledText.new()
	Header.id = "Header"
	Header:SetRGBFromInt( 15809033, 0 )
	Header:SetFontSize( 32 * _1080p )
	Header:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	Header:SetAlignment( LUI.Alignment.Center )
	Header:SetShadowMinDistance( -0.2, 0 )
	Header:SetShadowMaxDistance( 0.2, 0 )
	Header:SetShadowRGBFromInt( 0, 0 )
	Header:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -248, _1080p * 252, _1080p * 162, _1080p * 194 )
	Header:SubscribeToModel( DataSources.inGame.MP.splashes.localPlayer.header:GetModel( f3_local1 ), function ()
		local f5_local0 = DataSources.inGame.MP.splashes.localPlayer.header:GetValue( f3_local1 )
		if f5_local0 ~= nil then
			Header:setText( ToUpperCase( f5_local0 ), 0 )
		end
	end )
	self:addElement( Header )
	self.Header = Header
	
	local BossTimer = nil
	
	BossTimer = MenuBuilder.BuildRegisteredType( "BossTimer", {
		controllerIndex = f3_local1
	} )
	BossTimer.id = "BossTimer"
	BossTimer.scoreBox:SetAlpha( 0, 0 )
	BossTimer.Timer:SetRGBFromInt( 16777215, 0 )
	BossTimer:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 158, _1080p * 358, _1080p * 369, _1080p * 419 )
	self:addElement( BossTimer )
	self.BossTimer = BossTimer
	
	self._animationSets.DefaultAnimationSet = function ()
		BossTimer:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.BossTimer:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.DefaultSequence = function ()
			BossTimer:AnimateSequence( "DefaultSequence" )
		end
		
		ring:RegisterAnimationSequence( "HideNew", {
			{
				function ()
					return self.ring:SetAlpha( 0, 0 )
				end
			}
		} )
		spikes:RegisterAnimationSequence( "HideNew", {
			{
				function ()
					return self.spikes:SetAlpha( 0, 0 )
				end
			}
		} )
		spikesSoft:RegisterAnimationSequence( "HideNew", {
			{
				function ()
					return self.spikesSoft:SetAlpha( 0, 0 )
				end
			}
		} )
		bubbles1:RegisterAnimationSequence( "HideNew", {
			{
				function ()
					return self.bubbles1:SetAlpha( 0, 0 )
				end
			}
		} )
		bubbles2:RegisterAnimationSequence( "HideNew", {
			{
				function ()
					return self.bubbles2:SetAlpha( 0, 0 )
				end
			}
		} )
		splashIconZom:RegisterAnimationSequence( "HideNew", {
			{
				function ()
					return self.splashIconZom:SetAlpha( 0, 0 )
				end
			}
		} )
		Body:RegisterAnimationSequence( "HideNew", {
			{
				function ()
					return self.Body:SetAlpha( 0, 0 )
				end
			}
		} )
		Header:RegisterAnimationSequence( "HideNew", {
			{
				function ()
					return self.Header:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.HideNew = function ()
			ring:AnimateSequence( "HideNew" )
			spikes:AnimateSequence( "HideNew" )
			spikesSoft:AnimateSequence( "HideNew" )
			bubbles1:AnimateSequence( "HideNew" )
			bubbles2:AnimateSequence( "HideNew" )
			splashIconZom:AnimateSequence( "HideNew" )
			Body:AnimateSequence( "HideNew" )
			Header:AnimateSequence( "HideNew" )
		end
		
		ring:RegisterAnimationSequence( "FullNewLonger2", {
			{
				function ()
					return self.ring:SetScale( -0.59, 0 )
				end,
				function ()
					return self.ring:SetScale( -0.59, 390 )
				end,
				function ()
					return self.ring:SetScale( 0.69, 280 )
				end
			},
			{
				function ()
					return self.ring:SetAlpha( 1, 450 )
				end,
				function ()
					return self.ring:SetAlpha( 0, 220 )
				end
			},
			{
				function ()
					return self.ring:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 128, _1080p * 384, _1080p * 128, _1080p * 384, 0 )
				end
			}
		} )
		spikes:RegisterAnimationSequence( "FullNewLonger2", {
			{
				function ()
					return self.spikes:SetZRotation( -11, 0 )
				end,
				function ()
					return self.spikes:SetZRotation( 43, 2240 )
				end
			},
			{
				function ()
					return self.spikes:SetScale( -0.1, 0 )
				end,
				function ()
					return self.spikes:SetScale( -0.1, 2280 )
				end,
				function ()
					return self.spikes:SetScale( -0.9, 90 )
				end
			},
			{
				function ()
					return self.spikes:SetAlpha( 1, 2350 )
				end,
				function ()
					return self.spikes:SetAlpha( 0, 40 )
				end
			},
			{
				function ()
					return self.spikes:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 137, _1080p * 393, _1080p * 116, _1080p * 372, 0 )
				end
			}
		} )
		spikesSoft:RegisterAnimationSequence( "FullNewLonger2", {
			{
				function ()
					return self.spikesSoft:SetZRotation( -12, 0 )
				end,
				function ()
					return self.spikesSoft:SetZRotation( -50, 2240 )
				end
			},
			{
				function ()
					return self.spikesSoft:SetScale( -0.1, 0 )
				end,
				function ()
					return self.spikesSoft:SetScale( -0.1, 2280 )
				end,
				function ()
					return self.spikesSoft:SetScale( -0.9, 90 )
				end
			},
			{
				function ()
					return self.spikesSoft:SetAlpha( 1, 2350 )
				end,
				function ()
					return self.spikesSoft:SetAlpha( 0, 40 )
				end
			},
			{
				function ()
					return self.spikesSoft:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 137, _1080p * 393, _1080p * 116, _1080p * 372, 0 )
				end
			}
		} )
		bubbles1:RegisterAnimationSequence( "FullNewLonger2", {
			{
				function ()
					return self.bubbles1:SetScale( -0.6, 0 )
				end,
				function ()
					return self.bubbles1:SetScale( -0.6, 200 )
				end,
				function ()
					return self.bubbles1:SetScale( -0.39, 250 )
				end,
				function ()
					return self.bubbles1:SetScale( -0.45, 300 )
				end,
				function ()
					return self.bubbles1:SetScale( -0.5, 260 )
				end,
				function ()
					return self.bubbles1:SetScale( -0.41, 340 )
				end,
				function ()
					return self.bubbles1:SetScale( -0.5, 270 )
				end,
				function ()
					return self.bubbles1:SetScale( -0.43, 170 )
				end,
				function ()
					return self.bubbles1:SetScale( -0.43, 360 )
				end,
				function ()
					return self.bubbles1:SetScale( -0.9, 190 )
				end
			},
			{
				function ()
					return self.bubbles1:SetZRotation( 0, 0 )
				end,
				function ()
					return self.bubbles1:SetZRotation( 40, 2150 )
				end
			},
			{
				function ()
					return self.bubbles1:SetAlpha( 1, 200 )
				end,
				function ()
					return self.bubbles1:SetAlpha( 1, 410 )
				end,
				function ()
					return self.bubbles1:SetAlpha( 0.8, 70 )
				end,
				function ()
					return self.bubbles1:SetAlpha( 1, 40 )
				end,
				function ()
					return self.bubbles1:SetAlpha( 0.6, 30 )
				end,
				function ()
					return self.bubbles1:SetAlpha( 0.5, 30 )
				end,
				function ()
					return self.bubbles1:SetAlpha( 1, 220 )
				end,
				function ()
					return self.bubbles1:SetAlpha( 0.8, 120 )
				end,
				function ()
					return self.bubbles1:SetAlpha( 0.95, 100 )
				end,
				function ()
					return self.bubbles1:SetAlpha( 1, 80 )
				end,
				function ()
					return self.bubbles1:SetAlpha( 1, 50 )
				end,
				function ()
					return self.bubbles1:SetAlpha( 0.8, 10 )
				end,
				function ()
					return self.bubbles1:SetAlpha( 0.75, 190 )
				end,
				function ()
					return self.bubbles1:SetAlpha( 0.75, 800 )
				end,
				function ()
					return self.bubbles1:SetAlpha( 0, 40 )
				end
			}
		} )
		bubbles2:RegisterAnimationSequence( "FullNewLonger2", {
			{
				function ()
					return self.bubbles2:SetScale( -0.6, 0 )
				end,
				function ()
					return self.bubbles2:SetScale( -0.6, 200 )
				end,
				function ()
					return self.bubbles2:SetScale( -0.43, 260 )
				end,
				function ()
					return self.bubbles2:SetScale( -0.43, 1820 )
				end,
				function ()
					return self.bubbles2:SetScale( -0.9, 90 )
				end
			},
			{
				function ()
					return self.bubbles2:SetZRotation( 0, 0 )
				end,
				function ()
					return self.bubbles2:SetZRotation( -30, 2240 )
				end
			},
			{
				function ()
					return self.bubbles2:SetAlpha( 1, 2350 )
				end,
				function ()
					return self.bubbles2:SetAlpha( 0, 40 )
				end
			},
			{
				function ()
					return self.bubbles2:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 130, _1080p * 386, _1080p * 118, _1080p * 374, 0 )
				end,
				function ()
					return self.bubbles2:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 130, _1080p * 386, _1080p * 123, _1080p * 379, 310 )
				end
			}
		} )
		splashIconZom:RegisterAnimationSequence( "FullNewLonger2", {
			{
				function ()
					return self.splashIconZom:SetScale( 6, 0 )
				end,
				function ()
					return self.splashIconZom:SetScale( 0.7, 170 )
				end,
				function ()
					return self.splashIconZom:SetScale( 0.7, 2130 )
				end,
				function ()
					return self.splashIconZom:SetScale( 1.25, 110 )
				end,
				function ()
					return self.splashIconZom:SetScale( -0.9, 180 )
				end
			},
			{
				function ()
					return self.splashIconZom:SetAlpha( 1, 0 )
				end,
				function ()
					return self.splashIconZom:SetAlpha( 1, 2430 )
				end,
				function ()
					return self.splashIconZom:SetAlpha( 1, 90 )
				end,
				function ()
					return self.splashIconZom:SetAlpha( 0, 70 )
				end
			}
		} )
		Body:RegisterAnimationSequence( "FullNewLonger2", {
			{
				function ()
					return self.Body:SetAlpha( 0, 0 )
				end,
				function ()
					return self.Body:SetAlpha( 0, 420 )
				end,
				function ()
					return self.Body:SetAlpha( 1, 120 )
				end,
				function ()
					return self.Body:SetAlpha( 1, 1450 )
				end,
				function ()
					return self.Body:SetAlpha( 0, 170 )
				end
			},
			{
				function ()
					return self.Body:SetScale( 2, 400 )
				end,
				function ()
					return self.Body:SetScale( 0, 210 )
				end,
				function ()
					return self.Body:SetScale( 0, 1450 )
				end,
				function ()
					return self.Body:SetScale( -0.9, 100 )
				end
			}
		} )
		Header:RegisterAnimationSequence( "FullNewLonger2", {
			{
				function ()
					return self.Header:SetAlpha( 0, 0 )
				end,
				function ()
					return self.Header:SetAlpha( 0, 310 )
				end,
				function ()
					return self.Header:SetAlpha( 1, 70 )
				end,
				function ()
					return self.Header:SetAlpha( 1, 1580 )
				end,
				function ()
					return self.Header:SetAlpha( 0, 100 )
				end
			},
			{
				function ()
					return self.Header:SetScale( 2, 320 )
				end,
				function ()
					return self.Header:SetScale( 0, 120 )
				end,
				function ()
					return self.Header:SetScale( 0, 1460 )
				end,
				function ()
					return self.Header:SetScale( -0.9, 160 )
				end
			}
		} )
		self._sequences.FullNewLonger2 = function ()
			ring:AnimateSequence( "FullNewLonger2" )
			spikes:AnimateSequence( "FullNewLonger2" )
			spikesSoft:AnimateSequence( "FullNewLonger2" )
			bubbles1:AnimateSequence( "FullNewLonger2" )
			bubbles2:AnimateSequence( "FullNewLonger2" )
			splashIconZom:AnimateSequence( "FullNewLonger2" )
			Body:AnimateSequence( "FullNewLonger2" )
			Header:AnimateSequence( "FullNewLonger2" )
		end
		
		BossTimer:RegisterAnimationSequence( "bossTimer", {
			{
				function ()
					return self.BossTimer:SetAlpha( 0, 0 )
				end,
				function ()
					return self.BossTimer:SetAlpha( 0, 610 )
				end,
				function ()
					return self.BossTimer:SetAlpha( 1, 70 )
				end,
				function ()
					return self.BossTimer:SetAlpha( 1, 1310 )
				end,
				function ()
					return self.BossTimer:SetAlpha( 0, 70 )
				end
			},
			{
				function ()
					return self.BossTimer:SetScale( 0, 730 )
				end,
				function ()
					return self.BossTimer:SetScale( 0.25, 130 )
				end,
				function ()
					return self.BossTimer:SetScale( 0, 190 )
				end,
				function ()
					return self.BossTimer:SetScale( 0.25, 210 )
				end,
				function ()
					return self.BossTimer:SetScale( 0, 180 )
				end,
				function ()
					return self.BossTimer:SetScale( 0.25, 210 )
				end,
				function ()
					return self.BossTimer:SetScale( 0, 210 )
				end
			}
		} )
		self._sequences.bossTimer = function ()
			BossTimer:AnimateSequence( "bossTimer" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	self:addEventHandler( "message_queue_show", function ( f119_arg0, f119_arg1 )
		local f119_local0 = f119_arg1.controller or f3_local1
		ACTIONS.AnimateSequence( self, "FullNewLonger2" )
	end )
	self:addEventHandler( "message_queue_hide", function ( f120_arg0, f120_arg1 )
		local f120_local0 = f120_arg1.controller or f3_local1
		ACTIONS.AnimateSequence( self, "HideNew" )
	end )
	f0_local0( self, f3_local1, controller )
	ACTIONS.AnimateSequence( self, "DefaultSequence" )
	ACTIONS.AnimateSequence( self, "HideNew" )
	return self
end

MenuBuilder.registerType( "LocalPlayerZombieSplashDLC3", LocalPlayerZombieSplashDLC3 )
LockTable( _M )
