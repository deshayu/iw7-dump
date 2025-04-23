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

function LocalPlayerZombieSplashDLC4( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 512 * _1080p, 0, 512 * _1080p )
	self.id = "LocalPlayerZombieSplashDLC4"
	self._animationSets = {}
	self._sequences = {}
	local f3_local1 = controller and controller.controllerIndex
	if not f3_local1 and not Engine.InFrontend() then
		f3_local1 = self:getRootController()
	end
	assert( f3_local1 )
	local f3_local2 = self
	local rings = nil
	
	rings = LUI.UIImage.new()
	rings.id = "rings"
	rings:setImage( RegisterMaterial( "cp_final_merit_ring" ), 0 )
	rings:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 2, _1080p * 514, 0, _1080p * 512 )
	self:addElement( rings )
	self.rings = rings
	
	local shape3 = nil
	
	shape3 = LUI.UIImage.new()
	shape3.id = "shape3"
	shape3:SetAlpha( 0.73, 0 )
	shape3:SetScale( 0.27, 0 )
	shape3:setImage( RegisterMaterial( "cp_final_merit_main" ), 0 )
	shape3:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 512, 0, _1080p * 512 )
	self:addElement( shape3 )
	self.shape3 = shape3
	
	local shape2 = nil
	
	shape2 = LUI.UIImage.new()
	shape2.id = "shape2"
	shape2:setImage( RegisterMaterial( "cp_final_merit_main" ), 0 )
	shape2:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 512, 0, _1080p * 512 )
	self:addElement( shape2 )
	self.shape2 = shape2
	
	local shape = nil
	
	shape = LUI.UIImage.new()
	shape.id = "shape"
	shape:setImage( RegisterMaterial( "cp_final_merit_main" ), 0 )
	shape:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 512, 0, _1080p * 512 )
	self:addElement( shape )
	self.shape = shape
	
	local splashIconZom = nil
	
	splashIconZom = MenuBuilder.BuildRegisteredType( "splashIconZom", {
		controllerIndex = f3_local1
	} )
	splashIconZom.id = "splashIconZom"
	splashIconZom:SetScale( 1.5, 0 )
	splashIconZom:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -44, _1080p * 42, _1080p * -40, _1080p * 46 )
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
	Body:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -248, _1080p * 252, _1080p * 398, _1080p * 422 )
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
	Header:SetFontSize( 32 * _1080p )
	Header:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	Header:SetAlignment( LUI.Alignment.Center )
	Header:SetShadowMinDistance( -0.2, 0 )
	Header:SetShadowMaxDistance( 0.2, 0 )
	Header:SetShadowRGBFromInt( 0, 0 )
	Header:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -248, _1080p * 252, _1080p * 85, _1080p * 117 )
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
	BossTimer.Timer:SetRGBFromInt( 13421772, 0 )
	BossTimer:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 158, _1080p * 358, _1080p * 435, _1080p * 485 )
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
		
		rings:RegisterAnimationSequence( "HideNew", {
			{
				function ()
					return self.rings:SetAlpha( 0, 0 )
				end
			}
		} )
		shape3:RegisterAnimationSequence( "HideNew", {
			{
				function ()
					return self.shape3:SetAlpha( 0, 0 )
				end
			}
		} )
		shape2:RegisterAnimationSequence( "HideNew", {
			{
				function ()
					return self.shape2:SetAlpha( 0, 0 )
				end
			}
		} )
		shape:RegisterAnimationSequence( "HideNew", {
			{
				function ()
					return self.shape:SetAlpha( 0, 0 )
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
			rings:AnimateSequence( "HideNew" )
			shape3:AnimateSequence( "HideNew" )
			shape2:AnimateSequence( "HideNew" )
			shape:AnimateSequence( "HideNew" )
			splashIconZom:AnimateSequence( "HideNew" )
			Body:AnimateSequence( "HideNew" )
			Header:AnimateSequence( "HideNew" )
		end
		
		rings:RegisterAnimationSequence( "FullNewLonger2", {
			{
				function ()
					return self.rings:SetAlpha( 0, 0 )
				end,
				function ()
					return self.rings:SetAlpha( 0, 580 )
				end,
				function ()
					return self.rings:SetAlpha( 1, 150 )
				end,
				function ()
					return self.rings:SetAlpha( 1, 1190 )
				end,
				function ()
					return self.rings:SetAlpha( 0, 160 )
				end
			},
			{
				function ()
					return self.rings:SetScale( -0.9, 0 )
				end,
				function ()
					return self.rings:SetScale( -0.9, 580 )
				end,
				function ()
					return self.rings:SetScale( -0.12, 150 )
				end,
				function ()
					return self.rings:SetScale( -0.12, 1190 )
				end,
				function ()
					return self.rings:SetScale( 0.91, 160 )
				end
			}
		} )
		shape3:RegisterAnimationSequence( "FullNewLonger2", {
			{
				function ()
					return self.shape3:SetAlpha( 0, 0 )
				end,
				function ()
					return self.shape3:SetAlpha( 0, 410 )
				end,
				function ()
					return self.shape3:SetAlpha( 1, 220 )
				end,
				function ()
					return self.shape3:SetAlpha( 1, 300 )
				end,
				function ()
					return self.shape3:SetAlpha( 0, 200 )
				end
			},
			{
				function ()
					return self.shape3:SetScale( 1, 0 )
				end,
				function ()
					return self.shape3:SetScale( 1, 410 )
				end,
				function ()
					return self.shape3:SetScale( 0, 220 )
				end,
				function ()
					return self.shape3:SetScale( 0, 300 )
				end,
				function ()
					return self.shape3:SetScale( 1, 200 )
				end
			},
			{
				function ()
					return self.shape3:SetZRotation( 0, 630 )
				end,
				function ()
					return self.shape3:SetZRotation( -20, 200 )
				end,
				function ()
					return self.shape3:SetZRotation( -30, 100 )
				end
			}
		} )
		shape2:RegisterAnimationSequence( "FullNewLonger2", {
			{
				function ()
					return self.shape2:SetAlpha( 0, 0 )
				end,
				function ()
					return self.shape2:SetAlpha( 0, 210 )
				end,
				function ()
					return self.shape2:SetAlpha( 1, 220 )
				end,
				function ()
					return self.shape2:SetAlpha( 1, 300 )
				end,
				function ()
					return self.shape2:SetAlpha( 0, 200 )
				end
			},
			{
				function ()
					return self.shape2:SetScale( 1, 0 )
				end,
				function ()
					return self.shape2:SetScale( 1, 210 )
				end,
				function ()
					return self.shape2:SetScale( 0, 220 )
				end,
				function ()
					return self.shape2:SetScale( 0, 300 )
				end,
				function ()
					return self.shape2:SetScale( 1, 200 )
				end
			},
			{
				function ()
					return self.shape2:SetZRotation( 0, 0 )
				end,
				function ()
					return self.shape2:SetZRotation( 0, 430 )
				end,
				function ()
					return self.shape2:SetZRotation( -20, 200 )
				end,
				function ()
					return self.shape2:SetZRotation( -30, 100 )
				end
			}
		} )
		shape:RegisterAnimationSequence( "FullNewLonger2", {
			{
				function ()
					return self.shape:SetScale( 1, 0 )
				end,
				function ()
					return self.shape:SetScale( 0, 230 )
				end,
				function ()
					return self.shape:SetScale( 0, 900 )
				end,
				function ()
					return self.shape:SetScale( 1, 200 )
				end
			},
			{
				function ()
					return self.shape:SetAlpha( 0, 0 )
				end,
				function ()
					return self.shape:SetAlpha( 1, 230 )
				end,
				function ()
					return self.shape:SetAlpha( 1, 900 )
				end,
				function ()
					return self.shape:SetAlpha( 0, 200 )
				end
			},
			{
				function ()
					return self.shape:SetZRotation( 0, 230 )
				end,
				function ()
					return self.shape:SetZRotation( -20, 200 )
				end,
				function ()
					return self.shape:SetZRotation( -40, 200 )
				end,
				function ()
					return self.shape:SetZRotation( -60, 200 )
				end,
				function ()
					return self.shape:SetZRotation( -80, 200 )
				end,
				function ()
					return self.shape:SetZRotation( -90, 100 )
				end
			}
		} )
		splashIconZom:RegisterAnimationSequence( "FullNewLonger2", {
			{
				function ()
					return self.splashIconZom:SetScale( -0.9, 0 )
				end,
				function ()
					return self.splashIconZom:SetScale( -0.9, 580 )
				end,
				function ()
					return self.splashIconZom:SetScale( 2.5, 150 )
				end,
				function ()
					return self.splashIconZom:SetScale( 2.5, 1190 )
				end,
				function ()
					return self.splashIconZom:SetScale( 9, 160 )
				end
			},
			{
				function ()
					return self.splashIconZom:SetAlpha( 0, 0 )
				end,
				function ()
					return self.splashIconZom:SetAlpha( 0, 170 )
				end,
				function ()
					return self.splashIconZom:SetAlpha( 0, 410 )
				end,
				function ()
					return self.splashIconZom:SetAlpha( 1, 150 )
				end,
				function ()
					return self.splashIconZom:SetAlpha( 1, 1190 )
				end,
				function ()
					return self.splashIconZom:SetAlpha( 0, 160 )
				end
			}
		} )
		Body:RegisterAnimationSequence( "FullNewLonger2", {
			{
				function ()
					return self.Body:SetAlpha( 0, 0 )
				end,
				function ()
					return self.Body:SetAlpha( 0, 700 )
				end,
				function ()
					return self.Body:SetAlpha( 1, 60 )
				end,
				function ()
					return self.Body:SetAlpha( 1, 1160 )
				end,
				function ()
					return self.Body:SetAlpha( 0, 70 )
				end
			},
			{
				function ()
					return self.Body:SetScale( 2, 0 )
				end,
				function ()
					return self.Body:SetScale( 2, 700 )
				end,
				function ()
					return self.Body:SetScale( 0, 60 )
				end,
				function ()
					return self.Body:SetScale( 0, 1160 )
				end,
				function ()
					return self.Body:SetScale( -0.9, 70 )
				end
			}
		} )
		Header:RegisterAnimationSequence( "FullNewLonger2", {
			{
				function ()
					return self.Header:SetAlpha( 0, 0 )
				end,
				function ()
					return self.Header:SetAlpha( 0, 700 )
				end,
				function ()
					return self.Header:SetAlpha( 1, 60 )
				end,
				function ()
					return self.Header:SetAlpha( 1, 1160 )
				end,
				function ()
					return self.Header:SetAlpha( 0, 70 )
				end
			},
			{
				function ()
					return self.Header:SetScale( 2, 0 )
				end,
				function ()
					return self.Header:SetScale( 2, 700 )
				end,
				function ()
					return self.Header:SetScale( 0, 60 )
				end,
				function ()
					return self.Header:SetScale( 0, 1160 )
				end,
				function ()
					return self.Header:SetScale( -0.9, 70 )
				end
			}
		} )
		self._sequences.FullNewLonger2 = function ()
			rings:AnimateSequence( "FullNewLonger2" )
			shape3:AnimateSequence( "FullNewLonger2" )
			shape2:AnimateSequence( "FullNewLonger2" )
			shape:AnimateSequence( "FullNewLonger2" )
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
					return self.BossTimer:SetAlpha( 0, 770 )
				end,
				function ()
					return self.BossTimer:SetAlpha( 1, 30 )
				end,
				function ()
					return self.BossTimer:SetAlpha( 1, 1100 )
				end,
				function ()
					return self.BossTimer:SetAlpha( 0, 60 )
				end
			},
			{
				function ()
					return self.BossTimer:SetScale( 0, 800 )
				end,
				function ()
					return self.BossTimer:SetScale( 0.25, 210 )
				end,
				function ()
					return self.BossTimer:SetScale( 0, 280 )
				end,
				function ()
					return self.BossTimer:SetScale( 0.25, 230 )
				end,
				function ()
					return self.BossTimer:SetScale( 0, 220 )
				end
			}
		} )
		self._sequences.bossTimer = function ()
			BossTimer:AnimateSequence( "bossTimer" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	self:addEventHandler( "message_queue_show", function ( f111_arg0, f111_arg1 )
		local f111_local0 = f111_arg1.controller or f3_local1
		ACTIONS.AnimateSequence( self, "FullNewLonger2" )
	end )
	self:addEventHandler( "message_queue_hide", function ( f112_arg0, f112_arg1 )
		local f112_local0 = f112_arg1.controller or f3_local1
		ACTIONS.AnimateSequence( self, "HideNew" )
	end )
	f0_local0( self, f3_local1, controller )
	ACTIONS.AnimateSequence( self, "DefaultSequence" )
	ACTIONS.AnimateSequence( self, "HideNew" )
	return self
end

MenuBuilder.registerType( "LocalPlayerZombieSplashDLC4", LocalPlayerZombieSplashDLC4 )
LockTable( _M )
