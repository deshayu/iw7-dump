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

function LocalPlayerZombieSplashDLC2( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 512 * _1080p, 0, 512 * _1080p )
	self.id = "LocalPlayerZombieSplashDLC2"
	self._animationSets = {}
	self._sequences = {}
	local f3_local1 = controller and controller.controllerIndex
	if not f3_local1 and not Engine.InFrontend() then
		f3_local1 = self:getRootController()
	end
	assert( f3_local1 )
	local f3_local2 = self
	local LightRays = nil
	
	LightRays = MenuBuilder.BuildRegisteredType( "GenericSplashLightRays", {
		controllerIndex = f3_local1
	} )
	LightRays.id = "LightRays"
	LightRays:SetAlpha( 0.59, 0 )
	LightRays:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -256, _1080p * 256, _1080p * -256, _1080p * 256 )
	self:addElement( LightRays )
	self.LightRays = LightRays
	
	local explosion = nil
	
	explosion = LUI.UIImage.new()
	explosion.id = "explosion"
	explosion:setImage( RegisterMaterial( "zm_dlc2_merit_explosion" ), 0 )
	explosion:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -128, _1080p * 128, _1080p * -128, _1080p * 128 )
	self:addElement( explosion )
	self.explosion = explosion
	
	local flame3R = nil
	
	flame3R = LUI.UIImage.new()
	flame3R.id = "flame3R"
	flame3R:SetZRotation( -90, 0 )
	flame3R:setImage( RegisterMaterial( "zm_dlc2_merit_flame_3" ), 0 )
	flame3R:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, 0, _1080p * 96, _1080p * -48, _1080p * 48 )
	self:addElement( flame3R )
	self.flame3R = flame3R
	
	local flame3L = nil
	
	flame3L = LUI.UIImage.new()
	flame3L.id = "flame3L"
	flame3L:SetZRotation( 90, 0 )
	flame3L:setImage( RegisterMaterial( "zm_dlc2_merit_flame_3" ), 0 )
	flame3L:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -96, 0, _1080p * -48, _1080p * 48 )
	self:addElement( flame3L )
	self.flame3L = flame3L
	
	local bigFlameR = nil
	
	bigFlameR = LUI.UIImage.new()
	bigFlameR.id = "bigFlameR"
	bigFlameR:SetYRotation( 180, 0 )
	bigFlameR:setImage( RegisterMaterial( "zm_dlc2_merit_flame" ), 0 )
	bigFlameR:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -10, _1080p * 118, _1080p * -80, _1080p * 48 )
	self:addElement( bigFlameR )
	self.bigFlameR = bigFlameR
	
	local bigFlameL = nil
	
	bigFlameL = LUI.UIImage.new()
	bigFlameL.id = "bigFlameL"
	bigFlameL:setImage( RegisterMaterial( "zm_dlc2_merit_flame" ), 0 )
	bigFlameL:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -118, _1080p * 10, _1080p * -80, _1080p * 48 )
	self:addElement( bigFlameL )
	self.bigFlameL = bigFlameL
	
	local flame1R = nil
	
	flame1R = LUI.UIImage.new()
	flame1R.id = "flame1R"
	flame1R:SetYRotation( 180, 0 )
	flame1R:SetZRotation( 90, 0 )
	flame1R:setImage( RegisterMaterial( "zm_dlc2_merit_flame_1" ), 0 )
	flame1R:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 60, _1080p * 108, _1080p * -10, _1080p * 86 )
	self:addElement( flame1R )
	self.flame1R = flame1R
	
	local flame1L = nil
	
	flame1L = LUI.UIImage.new()
	flame1L.id = "flame1L"
	flame1L:SetZRotation( 90, 0 )
	flame1L:setImage( RegisterMaterial( "zm_dlc2_merit_flame_1" ), 0 )
	flame1L:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -108, _1080p * -60, _1080p * -10, _1080p * 86 )
	self:addElement( flame1L )
	self.flame1L = flame1L
	
	local flame2R = nil
	
	flame2R = LUI.UIImage.new()
	flame2R.id = "flame2R"
	flame2R:SetYRotation( 180, 0 )
	flame2R:setImage( RegisterMaterial( "zm_dlc2_merit_flame_2" ), 0 )
	flame2R:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 50, _1080p * 82, _1080p * -29, _1080p * 35 )
	self:addElement( flame2R )
	self.flame2R = flame2R
	
	local flame2L = nil
	
	flame2L = LUI.UIImage.new()
	flame2L.id = "flame2L"
	flame2L:setImage( RegisterMaterial( "zm_dlc2_merit_flame_2" ), 0 )
	flame2L:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -82, _1080p * -50, _1080p * -29, _1080p * 35 )
	self:addElement( flame2L )
	self.flame2L = flame2L
	
	local splashIconZom = nil
	
	splashIconZom = MenuBuilder.BuildRegisteredType( "splashIconZom", {
		controllerIndex = f3_local1
	} )
	splashIconZom.id = "splashIconZom"
	splashIconZom:SetScale( 1.5, 0 )
	splashIconZom:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -43, _1080p * 43, _1080p * -43, _1080p * 43 )
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
	Body:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -250, _1080p * 250, _1080p * 340, _1080p * 364 )
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
	Header:SetRGBFromInt( 6026000, 0 )
	Header:SetZRotation( 4, 0 )
	Header:SetFontSize( 32 * _1080p )
	Header:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	Header:SetAlignment( LUI.Alignment.Center )
	Header:SetShadowMinDistance( -0.2, 0 )
	Header:SetShadowMaxDistance( 0.2, 0 )
	Header:SetShadowRGBFromInt( 0, 0 )
	Header:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -250, _1080p * 250, _1080p * 146, _1080p * 178 )
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
	BossTimer:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 158, _1080p * 358, _1080p * 390, _1080p * 440 )
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
		
		LightRays:RegisterAnimationSequence( "HideNew", {
			{
				function ()
					return self.LightRays:SetAlpha( 0, 0 )
				end
			}
		} )
		explosion:RegisterAnimationSequence( "HideNew", {
			{
				function ()
					return self.explosion:SetAlpha( 0, 0 )
				end
			}
		} )
		flame3R:RegisterAnimationSequence( "HideNew", {
			{
				function ()
					return self.flame3R:SetAlpha( 0, 0 )
				end
			}
		} )
		flame3L:RegisterAnimationSequence( "HideNew", {
			{
				function ()
					return self.flame3L:SetAlpha( 0, 0 )
				end
			}
		} )
		bigFlameR:RegisterAnimationSequence( "HideNew", {
			{
				function ()
					return self.bigFlameR:SetAlpha( 0, 0 )
				end
			}
		} )
		bigFlameL:RegisterAnimationSequence( "HideNew", {
			{
				function ()
					return self.bigFlameL:SetAlpha( 0, 0 )
				end
			}
		} )
		flame1R:RegisterAnimationSequence( "HideNew", {
			{
				function ()
					return self.flame1R:SetAlpha( 0, 0 )
				end
			}
		} )
		flame1L:RegisterAnimationSequence( "HideNew", {
			{
				function ()
					return self.flame1L:SetAlpha( 0, 0 )
				end
			}
		} )
		flame2R:RegisterAnimationSequence( "HideNew", {
			{
				function ()
					return self.flame2R:SetAlpha( 0, 0 )
				end
			}
		} )
		flame2L:RegisterAnimationSequence( "HideNew", {
			{
				function ()
					return self.flame2L:SetAlpha( 0, 0 )
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
			LightRays:AnimateSequence( "HideNew" )
			explosion:AnimateSequence( "HideNew" )
			flame3R:AnimateSequence( "HideNew" )
			flame3L:AnimateSequence( "HideNew" )
			bigFlameR:AnimateSequence( "HideNew" )
			bigFlameL:AnimateSequence( "HideNew" )
			flame1R:AnimateSequence( "HideNew" )
			flame1L:AnimateSequence( "HideNew" )
			flame2R:AnimateSequence( "HideNew" )
			flame2L:AnimateSequence( "HideNew" )
			splashIconZom:AnimateSequence( "HideNew" )
			Body:AnimateSequence( "HideNew" )
			Header:AnimateSequence( "HideNew" )
		end
		
		LightRays:RegisterAnimationSequence( "FullNewLonger2", {
			{
				function ()
					return self.LightRays:SetScale( -0.5, 0 )
				end,
				function ()
					return self.LightRays:SetScale( 0, 300, LUI.EASING.outQuadratic )
				end,
				function ()
					return self.LightRays:SetScale( 0.15, 2000, LUI.EASING.inQuadratic )
				end
			},
			{
				function ()
					return self.LightRays:SetAlpha( 0, 0 )
				end,
				function ()
					return self.LightRays:SetAlpha( 0.5, 300, LUI.EASING.outQuadratic )
				end,
				function ()
					return self.LightRays:SetAlpha( 0.5, 1700 )
				end,
				function ()
					return self.LightRays:SetAlpha( 0, 300, LUI.EASING.inQuadratic )
				end
			}
		} )
		explosion:RegisterAnimationSequence( "FullNewLonger2", {
			{
				function ()
					return self.explosion:SetScale( 0, 0 )
				end,
				function ()
					return self.explosion:SetScale( 0, 2100 )
				end,
				function ()
					return self.explosion:SetScale( 2, 200, LUI.EASING.outQuadratic )
				end
			},
			{
				function ()
					return self.explosion:SetAlpha( 0, 0 )
				end,
				function ()
					return self.explosion:SetAlpha( 0, 2090 )
				end,
				function ()
					return self.explosion:SetAlpha( 1, 10 )
				end,
				function ()
					return self.explosion:SetAlpha( 0, 200, LUI.EASING.outQuadratic )
				end
			}
		} )
		flame3R:RegisterAnimationSequence( "FullNewLonger2", {
			{
				function ()
					return self.flame3R:SetAlpha( 0, 0 )
				end,
				function ()
					return self.flame3R:SetAlpha( 0, 300 )
				end,
				function ()
					return self.flame3R:SetAlpha( 1, 200 )
				end,
				function ()
					return self.flame3R:SetAlpha( 1, 1500 )
				end,
				function ()
					return self.flame3R:SetAlpha( 0, 200, LUI.EASING.outQuadratic )
				end
			},
			{
				function ()
					return self.flame3R:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 30, _1080p * 126, _1080p * -48, _1080p * 48, 300 )
				end,
				function ()
					return self.flame3R:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 60, _1080p * 156, _1080p * -48, _1080p * 48, 2049 )
				end
			}
		} )
		flame3L:RegisterAnimationSequence( "FullNewLonger2", {
			{
				function ()
					return self.flame3L:SetAlpha( 0, 0 )
				end,
				function ()
					return self.flame3L:SetAlpha( 0, 300 )
				end,
				function ()
					return self.flame3L:SetAlpha( 1, 200 )
				end,
				function ()
					return self.flame3L:SetAlpha( 1, 1500 )
				end,
				function ()
					return self.flame3L:SetAlpha( 0, 200, LUI.EASING.outQuadratic )
				end
			},
			{
				function ()
					return self.flame3L:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -126, _1080p * -30, _1080p * -48, _1080p * 48, 300 )
				end,
				function ()
					return self.flame3L:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -156, _1080p * -60, _1080p * -48, _1080p * 48, 2049 )
				end
			}
		} )
		bigFlameR:RegisterAnimationSequence( "FullNewLonger2", {
			{
				function ()
					return self.bigFlameR:SetAlpha( 0, 0 )
				end,
				function ()
					return self.bigFlameR:SetAlpha( 0, 150 )
				end,
				function ()
					return self.bigFlameR:SetAlpha( 1, 200, LUI.EASING.outBack )
				end,
				function ()
					return self.bigFlameR:SetAlpha( 1, 1650 )
				end,
				function ()
					return self.bigFlameR:SetAlpha( 0, 200, LUI.EASING.outQuadratic )
				end
			},
			{
				function ()
					return self.bigFlameR:SetZRotation( 40, 0 )
				end,
				function ()
					return self.bigFlameR:SetZRotation( -40, 150 )
				end,
				function ()
					return self.bigFlameR:SetZRotation( 0, 200, LUI.EASING.outBack )
				end
			}
		} )
		bigFlameL:RegisterAnimationSequence( "FullNewLonger2", {
			{
				function ()
					return self.bigFlameL:SetAlpha( 0, 0 )
				end,
				function ()
					return self.bigFlameL:SetAlpha( 0, 150 )
				end,
				function ()
					return self.bigFlameL:SetAlpha( 1, 200, LUI.EASING.outBack )
				end,
				function ()
					return self.bigFlameL:SetAlpha( 1, 1650 )
				end,
				function ()
					return self.bigFlameL:SetAlpha( 0, 200, LUI.EASING.outQuadratic )
				end
			},
			{
				function ()
					return self.bigFlameL:SetZRotation( -40, 150 )
				end,
				function ()
					return self.bigFlameL:SetZRotation( 0, 200, LUI.EASING.outBack )
				end
			}
		} )
		flame1R:RegisterAnimationSequence( "FullNewLonger2", {
			{
				function ()
					return self.flame1R:SetAlpha( 0, 0 )
				end,
				function ()
					return self.flame1R:SetAlpha( 0, 200 )
				end,
				function ()
					return self.flame1R:SetAlpha( 1, 200, LUI.EASING.outBack )
				end,
				function ()
					return self.flame1R:SetAlpha( 1, 1600 )
				end,
				function ()
					return self.flame1R:SetAlpha( 0, 200, LUI.EASING.outQuadratic )
				end
			},
			{
				function ()
					return self.flame1R:SetZRotation( 40, 200 )
				end,
				function ()
					return self.flame1R:SetZRotation( 90, 200, LUI.EASING.outBack )
				end
			}
		} )
		flame1L:RegisterAnimationSequence( "FullNewLonger2", {
			{
				function ()
					return self.flame1L:SetAlpha( 0, 0 )
				end,
				function ()
					return self.flame1L:SetAlpha( 0, 200 )
				end,
				function ()
					return self.flame1L:SetAlpha( 1, 200, LUI.EASING.outBack )
				end,
				function ()
					return self.flame1L:SetAlpha( 1, 1600 )
				end,
				function ()
					return self.flame1L:SetAlpha( 0, 200, LUI.EASING.outQuadratic )
				end
			},
			{
				function ()
					return self.flame1L:SetZRotation( 40, 200 )
				end,
				function ()
					return self.flame1L:SetZRotation( 90, 200, LUI.EASING.outBack )
				end
			}
		} )
		flame2R:RegisterAnimationSequence( "FullNewLonger2", {
			{
				function ()
					return self.flame2R:SetAlpha( 0, 0 )
				end,
				function ()
					return self.flame2R:SetAlpha( 0, 300 )
				end,
				function ()
					return self.flame2R:SetAlpha( 1, 200, LUI.EASING.outQuadratic )
				end,
				function ()
					return self.flame2R:SetAlpha( 0, 1400, LUI.EASING.inQuadratic )
				end
			},
			{
				function ()
					return self.flame2R:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 50, _1080p * 82, _1080p * -29, _1080p * 35, 300 )
				end,
				function ()
					return self.flame2R:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 50, _1080p * 82, _1080p * -134, _1080p * -70, 1599, LUI.EASING.inQuadratic )
				end
			}
		} )
		flame2L:RegisterAnimationSequence( "FullNewLonger2", {
			{
				function ()
					return self.flame2L:SetAlpha( 0, 0 )
				end,
				function ()
					return self.flame2L:SetAlpha( 0, 300 )
				end,
				function ()
					return self.flame2L:SetAlpha( 1, 200, LUI.EASING.outQuadratic )
				end,
				function ()
					return self.flame2L:SetAlpha( 0, 1400, LUI.EASING.outQuadratic )
				end
			},
			{
				function ()
					return self.flame2L:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -82, _1080p * -50, _1080p * -29, _1080p * 35, 300 )
				end,
				function ()
					return self.flame2L:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -82, _1080p * -50, _1080p * -114, _1080p * -50, 1599, LUI.EASING.outQuadratic )
				end
			}
		} )
		splashIconZom:RegisterAnimationSequence( "FullNewLonger2", {
			{
				function ()
					return self.splashIconZom:SetAlpha( 0, 0 )
				end,
				function ()
					return self.splashIconZom:SetAlpha( 1, 300, LUI.EASING.outBack )
				end,
				function ()
					return self.splashIconZom:SetAlpha( 1, 1700 )
				end,
				function ()
					return self.splashIconZom:SetAlpha( 0, 300, LUI.EASING.inBack )
				end
			},
			{
				function ()
					return self.splashIconZom:SetScale( 6, 0 )
				end,
				function ()
					return self.splashIconZom:SetScale( 0.7, 300, LUI.EASING.outBack )
				end,
				function ()
					return self.splashIconZom:SetScale( 0.7, 1700 )
				end,
				function ()
					return self.splashIconZom:SetScale( 8, 300, LUI.EASING.inBack )
				end
			},
			{
				function ()
					return self.splashIconZom:SetZRotation( 0, 0 )
				end,
				function ()
					return self.splashIconZom:SetZRotation( 0, 2000 )
				end,
				function ()
					return self.splashIconZom:SetZRotation( -40, 300, LUI.EASING.inBack )
				end
			}
		} )
		Body:RegisterAnimationSequence( "FullNewLonger2", {
			{
				function ()
					return self.Body:SetAlpha( 0, 0 )
				end,
				function ()
					return self.Body:SetAlpha( 1, 200, LUI.EASING.outQuadratic )
				end,
				function ()
					return self.Body:SetAlpha( 1, 1800 )
				end,
				function ()
					return self.Body:SetAlpha( 0, 200, LUI.EASING.outQuadratic )
				end
			},
			{
				function ()
					return self.Body:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -250, _1080p * 250, _1080p * 365, _1080p * 389, 0 )
				end,
				function ()
					return self.Body:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -250, _1080p * 250, _1080p * 340, _1080p * 364, 200, LUI.EASING.outQuadratic )
				end
			}
		} )
		Header:RegisterAnimationSequence( "FullNewLonger2", {
			{
				function ()
					return self.Header:SetAlpha( 0, 0 )
				end,
				function ()
					return self.Header:SetAlpha( 1, 200, LUI.EASING.outQuadratic )
				end,
				function ()
					return self.Header:SetAlpha( 1, 1800 )
				end,
				function ()
					return self.Header:SetAlpha( 0, 200, LUI.EASING.outQuadratic )
				end
			},
			{
				function ()
					return self.Header:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -250, _1080p * 250, _1080p * 120, _1080p * 152, 0 )
				end,
				function ()
					return self.Header:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -250, _1080p * 250, _1080p * 145, _1080p * 177, 200, LUI.EASING.outQuadratic )
				end
			}
		} )
		self._sequences.FullNewLonger2 = function ()
			LightRays:AnimateSequence( "FullNewLonger2" )
			explosion:AnimateSequence( "FullNewLonger2" )
			flame3R:AnimateSequence( "FullNewLonger2" )
			flame3L:AnimateSequence( "FullNewLonger2" )
			bigFlameR:AnimateSequence( "FullNewLonger2" )
			bigFlameL:AnimateSequence( "FullNewLonger2" )
			flame1R:AnimateSequence( "FullNewLonger2" )
			flame1L:AnimateSequence( "FullNewLonger2" )
			flame2R:AnimateSequence( "FullNewLonger2" )
			flame2L:AnimateSequence( "FullNewLonger2" )
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
					return self.BossTimer:SetAlpha( 0, 250 )
				end,
				function ()
					return self.BossTimer:SetAlpha( 1, 20 )
				end,
				function ()
					return self.BossTimer:SetAlpha( 1, 1730 )
				end,
				function ()
					return self.BossTimer:SetAlpha( 0, 20 )
				end
			},
			{
				function ()
					return self.BossTimer:SetScale( 0, 270 )
				end,
				function ()
					return self.BossTimer:SetScale( 0.25, 170 )
				end,
				function ()
					return self.BossTimer:SetScale( 0, 200 )
				end,
				function ()
					return self.BossTimer:SetScale( 0.25, 240 )
				end,
				function ()
					return self.BossTimer:SetScale( 0, 220 )
				end,
				function ()
					return self.BossTimer:SetScale( 0.25, 290 )
				end,
				function ()
					return self.BossTimer:SetScale( 0, 320 )
				end,
				function ()
					return self.BossTimer:SetScale( 0, 290 )
				end
			}
		} )
		self._sequences.bossTimer = function ()
			BossTimer:AnimateSequence( "bossTimer" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	self:addEventHandler( "message_queue_show", function ( f130_arg0, f130_arg1 )
		local f130_local0 = f130_arg1.controller or f3_local1
		ACTIONS.AnimateSequence( self, "FullNewLonger2" )
	end )
	self:addEventHandler( "message_queue_hide", function ( f131_arg0, f131_arg1 )
		local f131_local0 = f131_arg1.controller or f3_local1
		ACTIONS.AnimateSequence( self, "HideNew" )
	end )
	f0_local0( self, f3_local1, controller )
	ACTIONS.AnimateSequence( self, "DefaultSequence" )
	ACTIONS.AnimateSequence( self, "HideNew" )
	return self
end

MenuBuilder.registerType( "LocalPlayerZombieSplashDLC2", LocalPlayerZombieSplashDLC2 )
LockTable( _M )
