local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function PostLoadFunc( f1_arg0, f1_arg1 )
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

function LocalPlayerZombieSplashDLC1( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 512 * _1080p, 0, 512 * _1080p )
	self.id = "LocalPlayerZombieSplashDLC1"
	self._animationSets = {}
	self._sequences = {}
	local f3_local1 = controller and controller.controllerIndex
	if not f3_local1 and not Engine.InFrontend() then
		f3_local1 = self:getRootController()
	end
	assert( f3_local1 )
	local f3_local2 = self
	local blobCopyLeft = nil
	
	blobCopyLeft = LUI.UIImage.new()
	blobCopyLeft.id = "blobCopyLeft"
	blobCopyLeft:SetAlpha( 0.57, 0 )
	blobCopyLeft:SetZRotation( -3.36, 0 )
	blobCopyLeft:SetScale( -0.6, 0 )
	blobCopyLeft:setImage( RegisterMaterial( "zm_merit_blob" ), 0 )
	blobCopyLeft:SetUseAA( true )
	blobCopyLeft:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 20, _1080p * 532, _1080p * 54.6, _1080p * 566.6 )
	self:addElement( blobCopyLeft )
	self.blobCopyLeft = blobCopyLeft
	
	local blobCopyRight = nil
	
	blobCopyRight = LUI.UIImage.new()
	blobCopyRight.id = "blobCopyRight"
	blobCopyRight:SetAlpha( 0.57, 0 )
	blobCopyRight:SetZRotation( -3.36, 0 )
	blobCopyRight:SetScale( -0.6, 0 )
	blobCopyRight:setImage( RegisterMaterial( "zm_merit_blob" ), 0 )
	blobCopyRight:SetUseAA( true )
	blobCopyRight:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 20, _1080p * 532, _1080p * 54.6, _1080p * 566.6 )
	self:addElement( blobCopyRight )
	self.blobCopyRight = blobCopyRight
	
	local blob = nil
	
	blob = LUI.UIImage.new()
	blob.id = "blob"
	blob:SetScale( -0.25, 0 )
	blob:setImage( RegisterMaterial( "zm_merit_blob" ), 0 )
	blob:SetUseAA( true )
	blob:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 256, _1080p * 13, _1080p * 269 )
	self:addElement( blob )
	self.blob = blob
	
	local flower = nil
	
	flower = LUI.UIImage.new()
	flower.id = "flower"
	flower:setImage( RegisterMaterial( "zm_merit_flower" ), 0 )
	flower:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 512, _1080p * 1, _1080p * 513 )
	self:addElement( flower )
	self.flower = flower
	
	local splashIconZom = nil
	
	splashIconZom = MenuBuilder.BuildRegisteredType( "splashIconZom", {
		controllerIndex = f3_local1
	} )
	splashIconZom.id = "splashIconZom"
	splashIconZom:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 203, _1080p * 289, _1080p * 211, _1080p * 297 )
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
	Body:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 21, _1080p * 488, _1080p * 389, _1080p * 413 )
	Body:SubscribeToModel( DataSources.inGame.MP.splashes.localPlayer.body:GetModel( f3_local1 ), function ()
		local f4_local0 = DataSources.inGame.MP.splashes.localPlayer.body:GetValue( f3_local1 )
		if f4_local0 ~= nil then
			Body:setText( f4_local0, 0 )
		end
	end )
	self:addElement( Body )
	self.Body = Body
	
	local Header = nil
	
	Header = LUI.UIText.new()
	Header.id = "Header"
	Header:SetZRotation( 4, 0 )
	Header:SetFontSize( 32 * _1080p )
	Header:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	Header:SetAlignment( LUI.Alignment.Center )
	Header:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 95.5, _1080p * 416.5, _1080p * 93, _1080p * 125 )
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
	BossTimer:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 158, _1080p * 358, _1080p * 414, _1080p * 464 )
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
		
		blobCopyLeft:RegisterAnimationSequence( "HideNew", {
			{
				function ()
					return self.blobCopyLeft:SetAlpha( 0, 0 )
				end
			}
		} )
		blobCopyRight:RegisterAnimationSequence( "HideNew", {
			{
				function ()
					return self.blobCopyRight:SetAlpha( 0, 0 )
				end
			}
		} )
		blob:RegisterAnimationSequence( "HideNew", {
			{
				function ()
					return self.blob:SetAlpha( 0, 0 )
				end
			}
		} )
		flower:RegisterAnimationSequence( "HideNew", {
			{
				function ()
					return self.flower:SetAlpha( 0, 0 )
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
			blobCopyLeft:AnimateSequence( "HideNew" )
			blobCopyRight:AnimateSequence( "HideNew" )
			blob:AnimateSequence( "HideNew" )
			flower:AnimateSequence( "HideNew" )
			splashIconZom:AnimateSequence( "HideNew" )
			Body:AnimateSequence( "HideNew" )
			Header:AnimateSequence( "HideNew" )
		end
		
		blobCopyLeft:RegisterAnimationSequence( "FullNewLonger2", {
			{
				function ()
					return self.blobCopyLeft:SetAlpha( 0, 0 )
				end,
				function ()
					return self.blobCopyLeft:SetAlpha( 0, 340 )
				end,
				function ()
					return self.blobCopyLeft:SetAlpha( 0.8, 30 )
				end,
				function ()
					return self.blobCopyLeft:SetAlpha( 0.8, 1570 )
				end,
				function ()
					return self.blobCopyLeft:SetAlpha( 0, 190 )
				end
			},
			{
				function ()
					return self.blobCopyLeft:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -20, _1080p * 492, _1080p * -37.6, _1080p * 474.4, 0 )
				end,
				function ()
					return self.blobCopyLeft:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -35, _1080p * 477, _1080p * -36.6, _1080p * 475.4, 59 )
				end,
				function ()
					return self.blobCopyLeft:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -58.1, _1080p * 453.9, _1080p * -44.6, _1080p * 467.4, 229 )
				end
			}
		} )
		blobCopyRight:RegisterAnimationSequence( "FullNewLonger2", {
			{
				function ()
					return self.blobCopyRight:SetZRotation( -3.36, 0 )
				end
			},
			{
				function ()
					return self.blobCopyRight:SetAlpha( 0, 0 )
				end,
				function ()
					return self.blobCopyRight:SetAlpha( 0, 230 )
				end,
				function ()
					return self.blobCopyRight:SetAlpha( 0.8, 70 )
				end,
				function ()
					return self.blobCopyRight:SetAlpha( 0.8, 1640 )
				end,
				function ()
					return self.blobCopyRight:SetAlpha( 0, 190 )
				end
			},
			{
				function ()
					return self.blobCopyRight:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 58.1, _1080p * 570.1, _1080p * -6.6, _1080p * 505.4, 0 )
				end
			}
		} )
		blob:RegisterAnimationSequence( "FullNewLonger2", {
			{
				function ()
					return self.blob:SetAlpha( 0, 0 )
				end,
				function ()
					return self.blob:SetAlpha( 0, 400 )
				end,
				function ()
					return self.blob:SetAlpha( 0.8, 70 )
				end,
				function ()
					return self.blob:SetAlpha( 1, 1500 )
				end,
				function ()
					return self.blob:SetAlpha( 0, 160 )
				end
			},
			{
				function ()
					return self.blob:SetZRotation( 0, 0 )
				end,
				function ()
					return self.blob:SetZRotation( -6, 500 )
				end,
				function ()
					return self.blob:SetZRotation( 0, 1010 )
				end,
				function ()
					return self.blob:SetZRotation( 20, 680 )
				end
			},
			{
				function ()
					return self.blob:SetScale( -0.6, 0 )
				end
			},
			{
				function ()
					return self.blob:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 8, _1080p * 520, _1080p * 54.6, _1080p * 566.6, 0 )
				end
			}
		} )
		flower:RegisterAnimationSequence( "FullNewLonger2", {
			{
				function ()
					return self.flower:SetScale( -0.87, 0 )
				end,
				function ()
					return self.flower:SetScale( -0.4, 170 )
				end
			},
			{
				function ()
					return self.flower:SetZRotation( 0, 0 )
				end,
				function ()
					return self.flower:SetZRotation( 100, 2200 )
				end
			},
			{
				function ()
					return self.flower:SetAlpha( 1, 0 )
				end,
				function ()
					return self.flower:SetAlpha( 1, 2200 )
				end,
				function ()
					return self.flower:SetAlpha( 0, 40 )
				end
			},
			{
				function ()
					return self.flower:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 512, _1080p * 1, _1080p * 513, 0 )
				end
			}
		} )
		splashIconZom:RegisterAnimationSequence( "FullNewLonger2", {
			{
				function ()
					return self.splashIconZom:SetAlpha( 0, 0 )
				end,
				function ()
					return self.splashIconZom:SetAlpha( 0, 200 )
				end,
				function ()
					return self.splashIconZom:SetAlpha( 1, 100 )
				end,
				function ()
					return self.splashIconZom:SetAlpha( 1, 1670 )
				end,
				function ()
					return self.splashIconZom:SetAlpha( 0, 220 )
				end
			},
			{
				function ()
					return self.splashIconZom:SetZRotation( 0, 0 )
				end,
				function ()
					return self.splashIconZom:SetZRotation( 0, 1940 )
				end,
				function ()
					return self.splashIconZom:SetZRotation( 28, 190 )
				end
			},
			{
				function ()
					return self.splashIconZom:SetScale( 4, 200 )
				end,
				function ()
					return self.splashIconZom:SetScale( 1.25, 570 )
				end,
				function ()
					return self.splashIconZom:SetScale( 1.43, 60 )
				end,
				function ()
					return self.splashIconZom:SetScale( 1.25, 50 )
				end,
				function ()
					return self.splashIconZom:SetScale( 1.25, 1060 )
				end,
				function ()
					return self.splashIconZom:SetScale( 3, 190 )
				end
			},
			{
				function ()
					return self.splashIconZom:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -53, _1080p * 33, _1080p * -45, _1080p * 41, 0 )
				end,
				function ()
					return self.splashIconZom:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -53, _1080p * 33, _1080p * -45, _1080p * 41, 910 )
				end,
				function ()
					return self.splashIconZom:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -53, _1080p * 33, _1080p * -45, _1080p * 41, 739 )
				end
			}
		} )
		Body:RegisterAnimationSequence( "FullNewLonger2", {
			{
				function ()
					return self.Body:SetAlpha( 0, 0 )
				end,
				function ()
					return self.Body:SetAlpha( 0, 570 )
				end,
				function ()
					return self.Body:SetAlpha( 1, 70 )
				end,
				function ()
					return self.Body:SetAlpha( 1, 1420 )
				end,
				function ()
					return self.Body:SetAlpha( 0, 60 )
				end,
				function ()
					return self.Body:SetAlpha( 0, 130 )
				end
			},
			{
				function ()
					return self.Body:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 12, _1080p * 497, _1080p * 389, _1080p * 413, 560 )
				end
			}
		} )
		Header:RegisterAnimationSequence( "FullNewLonger2", {
			{
				function ()
					return self.Header:SetAlpha( 0, 0 )
				end,
				function ()
					return self.Header:SetAlpha( 0, 200 )
				end,
				function ()
					return self.Header:SetAlpha( 1, 110 )
				end,
				function ()
					return self.Header:SetAlpha( 1, 1750 )
				end,
				function ()
					return self.Header:SetAlpha( 0, 60 )
				end
			},
			{
				function ()
					return self.Header:SetZRotation( 4, 0 )
				end,
				function ()
					return self.Header:SetZRotation( 15.33, 400 )
				end
			},
			{
				function ()
					return self.Header:SetScale( 0.25, 0 )
				end,
				function ()
					return self.Header:SetScale( 3, 400 )
				end,
				function ()
					return self.Header:SetScale( 0.75, 280 )
				end,
				function ()
					return self.Header:SetScale( 0.75, 670 )
				end
			},
			{
				function ()
					return self.Header:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 95.5, _1080p * -95.5, _1080p * 93, _1080p * 125, 0 )
				end,
				function ()
					return self.Header:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 95.5, _1080p * -95.5, _1080p * 93, _1080p * 125, 1500 )
				end
			}
		} )
		self._sequences.FullNewLonger2 = function ()
			blobCopyLeft:AnimateSequence( "FullNewLonger2" )
			blobCopyRight:AnimateSequence( "FullNewLonger2" )
			blob:AnimateSequence( "FullNewLonger2" )
			flower:AnimateSequence( "FullNewLonger2" )
			splashIconZom:AnimateSequence( "FullNewLonger2" )
			Body:AnimateSequence( "FullNewLonger2" )
			Header:AnimateSequence( "FullNewLonger2" )
		end
		
		BossTimer:RegisterAnimationSequence( "bossTimer", {
			{
				function ()
					return self.BossTimer.scoreBox:SetAlpha( 0, 0 )
				end
			},
			{
				function ()
					return self.BossTimer:SetAlpha( 0, 0 )
				end,
				function ()
					return self.BossTimer:SetAlpha( 0, 820 )
				end,
				function ()
					return self.BossTimer:SetAlpha( 1, 160 )
				end,
				function ()
					return self.BossTimer:SetAlpha( 1, 1020 )
				end,
				function ()
					return self.BossTimer:SetAlpha( 0, 70 )
				end
			},
			{
				function ()
					return self.BossTimer:SetScale( 0, 980 )
				end,
				function ()
					return self.BossTimer:SetScale( 0.25, 250 )
				end,
				function ()
					return self.BossTimer:SetScale( 0, 230 )
				end,
				function ()
					return self.BossTimer:SetScale( 0.25, 210 )
				end,
				function ()
					return self.BossTimer:SetScale( 0, 190 )
				end
			}
		} )
		self._sequences.bossTimer = function ()
			BossTimer:AnimateSequence( "bossTimer" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	self:addEventHandler( "message_queue_show", function ( f101_arg0, f101_arg1 )
		local f101_local0 = f101_arg1.controller or f3_local1
		ACTIONS.AnimateSequence( self, "FullNewLonger2" )
	end )
	self:addEventHandler( "message_queue_hide", function ( f102_arg0, f102_arg1 )
		local f102_local0 = f102_arg1.controller or f3_local1
		ACTIONS.AnimateSequence( self, "HideNew" )
	end )
	PostLoadFunc( self, f3_local1, controller )
	ACTIONS.AnimateSequence( self, "DefaultSequence" )
	ACTIONS.AnimateSequence( self, "HideNew" )
	return self
end

MenuBuilder.registerType( "LocalPlayerZombieSplashDLC1", LocalPlayerZombieSplashDLC1 )
LockTable( _M )
