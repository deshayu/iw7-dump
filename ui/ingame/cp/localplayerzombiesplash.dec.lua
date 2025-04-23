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

function LocalPlayerZombieSplash( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 512 * _1080p, 0, 512 * _1080p )
	self.id = "LocalPlayerZombieSplash"
	self._animationSets = {}
	self._sequences = {}
	local f3_local1 = controller and controller.controllerIndex
	if not f3_local1 and not Engine.InFrontend() then
		f3_local1 = self:getRootController()
	end
	assert( f3_local1 )
	local f3_local2 = self
	local spinner = nil
	
	spinner = LUI.UIImage.new()
	spinner.id = "spinner"
	spinner:setImage( RegisterMaterial( "zm_tix_arcane_spinner" ), 0 )
	spinner:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 512, 0, _1080p * 512 )
	self:addElement( spinner )
	self.spinner = spinner
	
	local glowCopy = nil
	
	glowCopy = LUI.UIImage.new()
	glowCopy.id = "glowCopy"
	glowCopy:SetZRotation( 90, 0 )
	glowCopy:setImage( RegisterMaterial( "zm_powerup_glow_element" ), 0 )
	glowCopy:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 512, _1080p * 1, _1080p * 513 )
	self:addElement( glowCopy )
	self.glowCopy = glowCopy
	
	local glow = nil
	
	glow = LUI.UIImage.new()
	glow.id = "glow"
	glow:setImage( RegisterMaterial( "zm_powerup_glow_element" ), 0 )
	glow:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 512, _1080p * 1, _1080p * 513 )
	self:addElement( glow )
	self.glow = glow
	
	local background = nil
	
	background = LUI.UIImage.new()
	background.id = "background"
	background:SetScale( -0.25, 0 )
	background:setImage( RegisterMaterial( "zmb_merit_main_bg" ), 0 )
	background:SetUseAA( true )
	background:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 512, _1080p * 13, _1080p * 525 )
	self:addElement( background )
	self.background = background
	
	local gridCopy = nil
	
	gridCopy = LUI.UIImage.new()
	gridCopy.id = "gridCopy"
	gridCopy:SetAlpha( 0.5, 0 )
	gridCopy:SetZRotation( 21, 0 )
	gridCopy:SetScale( -0.25, 0 )
	gridCopy:setImage( RegisterMaterial( "zmb_merit_grid_pattern" ), 0 )
	gridCopy:SetUseAA( true )
	gridCopy:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 512, _1080p * 13, _1080p * 525 )
	self:addElement( gridCopy )
	self.gridCopy = gridCopy
	
	local grid = nil
	
	grid = LUI.UIImage.new()
	grid.id = "grid"
	grid:SetScale( -0.25, 0 )
	grid:setImage( RegisterMaterial( "zmb_merit_grid_pattern" ), 0 )
	grid:SetUseAA( true )
	grid:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 512, _1080p * 13, _1080p * 525 )
	self:addElement( grid )
	self.grid = grid
	
	local splashIconZom = nil
	
	splashIconZom = MenuBuilder.BuildRegisteredType( "splashIconZom", {
		controllerIndex = f3_local1
	} )
	splashIconZom.id = "splashIconZom"
	splashIconZom:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 221, _1080p * 307, _1080p * 226, _1080p * 312 )
	self:addElement( splashIconZom )
	self.splashIconZom = splashIconZom
	
	local popup = nil
	
	popup = LUI.UIImage.new()
	popup.id = "popup"
	popup:setImage( RegisterMaterial( "zmb_merit_popup_bg" ), 0 )
	popup:SetUseAA( true )
	popup:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 512, _1080p * 369, _1080p * 433 )
	self:addElement( popup )
	self.popup = popup
	
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
	BossTimer:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 158, _1080p * 358, _1080p * 462, _1080p * 512 )
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
		
		spinner:RegisterAnimationSequence( "HideNew", {
			{
				function ()
					return self.spinner:SetAlpha( 0, 0 )
				end
			}
		} )
		glowCopy:RegisterAnimationSequence( "HideNew", {
			{
				function ()
					return self.glowCopy:SetAlpha( 0, 0 )
				end
			}
		} )
		glow:RegisterAnimationSequence( "HideNew", {
			{
				function ()
					return self.glow:SetAlpha( 0, 0 )
				end
			}
		} )
		background:RegisterAnimationSequence( "HideNew", {
			{
				function ()
					return self.background:SetAlpha( 0, 0 )
				end
			}
		} )
		gridCopy:RegisterAnimationSequence( "HideNew", {
			{
				function ()
					return self.gridCopy:SetAlpha( 0, 0 )
				end
			}
		} )
		grid:RegisterAnimationSequence( "HideNew", {
			{
				function ()
					return self.grid:SetAlpha( 0, 0 )
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
		popup:RegisterAnimationSequence( "HideNew", {
			{
				function ()
					return self.popup:SetAlpha( 0, 0 )
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
			spinner:AnimateSequence( "HideNew" )
			glowCopy:AnimateSequence( "HideNew" )
			glow:AnimateSequence( "HideNew" )
			background:AnimateSequence( "HideNew" )
			gridCopy:AnimateSequence( "HideNew" )
			grid:AnimateSequence( "HideNew" )
			splashIconZom:AnimateSequence( "HideNew" )
			popup:AnimateSequence( "HideNew" )
			Body:AnimateSequence( "HideNew" )
			Header:AnimateSequence( "HideNew" )
		end
		
		spinner:RegisterAnimationSequence( "FullNewLonger2", {
			{
				function ()
					return self.spinner:SetAlpha( 0, 0 )
				end,
				function ()
					return self.spinner:SetAlpha( 0, 300 )
				end,
				function ()
					return self.spinner:SetAlpha( 0.5, 10 )
				end,
				function ()
					return self.spinner:SetAlpha( 1, 1200 )
				end,
				function ()
					return self.spinner:SetAlpha( 0, 30 )
				end
			},
			{
				function ()
					return self.spinner:SetZRotation( 0, 0 )
				end,
				function ()
					return self.spinner:SetZRotation( 100, 2020 )
				end
			},
			{
				function ()
					return self.spinner:SetScale( -0.2, 310 )
				end
			},
			{
				function ()
					return self.spinner:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 512, 0, _1080p * 512, 0 )
				end
			}
		} )
		glowCopy:RegisterAnimationSequence( "FullNewLonger2", {
			{
				function ()
					return self.glowCopy:SetAlpha( 0, 0 )
				end,
				function ()
					return self.glowCopy:SetAlpha( 1, 180 )
				end,
				function ()
					return self.glowCopy:SetAlpha( 1, 1400 )
				end,
				function ()
					return self.glowCopy:SetAlpha( 0, 10 )
				end
			},
			{
				function ()
					return self.glowCopy:SetScale( -0.75, 0 )
				end,
				function ()
					return self.glowCopy:SetScale( 0, 300 )
				end,
				function ()
					return self.glowCopy:SetScale( -0.4, 240 )
				end,
				function ()
					return self.glowCopy:SetScale( -0.25, 40 )
				end,
				function ()
					return self.glowCopy:SetScale( -0.5, 90 )
				end
			},
			{
				function ()
					return self.glowCopy:SetZRotation( 90, 0 )
				end,
				function ()
					return self.glowCopy:SetZRotation( 190, 2020 )
				end
			},
			{
				function ()
					return self.glowCopy:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 512, _1080p * 1, _1080p * 513, 0 )
				end
			}
		} )
		glow:RegisterAnimationSequence( "FullNewLonger2", {
			{
				function ()
					return self.glow:SetScale( -0.75, 0 )
				end,
				function ()
					return self.glow:SetScale( 0, 300 )
				end,
				function ()
					return self.glow:SetScale( -0.8, 20 )
				end,
				function ()
					return self.glow:SetScale( -0.4, 220 )
				end,
				function ()
					return self.glow:SetScale( -0.25, 40 )
				end,
				function ()
					return self.glow:SetScale( -0.4, 90 )
				end
			},
			{
				function ()
					return self.glow:SetAlpha( 0, 0 )
				end,
				function ()
					return self.glow:SetAlpha( 1, 180 )
				end,
				function ()
					return self.glow:SetAlpha( 1, 1400 )
				end,
				function ()
					return self.glow:SetAlpha( 0, 10 )
				end
			},
			{
				function ()
					return self.glow:SetZRotation( 0, 0 )
				end,
				function ()
					return self.glow:SetZRotation( 100, 2020 )
				end
			},
			{
				function ()
					return self.glow:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 512, _1080p * 1, _1080p * 513, 0 )
				end
			}
		} )
		background:RegisterAnimationSequence( "FullNewLonger2", {
			{
				function ()
					return self.background:SetScale( -0.81, 0 )
				end,
				function ()
					return self.background:SetScale( -0.25, 300 )
				end,
				function ()
					return self.background:SetScale( -0.25, 1210 )
				end,
				function ()
					return self.background:SetScale( 0.25, 70 )
				end
			},
			{
				function ()
					return self.background:SetAlpha( 0, 0 )
				end,
				function ()
					return self.background:SetAlpha( 1, 170 )
				end,
				function ()
					return self.background:SetAlpha( 1, 1490 )
				end,
				function ()
					return self.background:SetAlpha( 0, 350 )
				end
			},
			{
				function ()
					return self.background:SetZRotation( 0, 0 )
				end,
				function ()
					return self.background:SetZRotation( 0, 1510 )
				end,
				function ()
					return self.background:SetZRotation( 20, 500 )
				end
			},
			{
				function ()
					return self.background:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 512, _1080p * 13, _1080p * 525, 0 )
				end
			}
		} )
		gridCopy:RegisterAnimationSequence( "FullNewLonger2", {
			{
				function ()
					return self.gridCopy:SetAlpha( 0, 0 )
				end,
				function ()
					return self.gridCopy:SetAlpha( 0, 310 )
				end,
				function ()
					return self.gridCopy:SetAlpha( 0.25, 10 )
				end,
				function ()
					return self.gridCopy:SetAlpha( 0.25, 1080 )
				end,
				function ()
					return self.gridCopy:SetAlpha( 0, 100 )
				end
			},
			{
				function ()
					return self.gridCopy:SetZRotation( 21, 0 )
				end,
				function ()
					return self.gridCopy:SetZRotation( 21, 310 )
				end,
				function ()
					return self.gridCopy:SetZRotation( 30.38, 940 )
				end,
				function ()
					return self.gridCopy:SetZRotation( 25, 770 )
				end
			},
			{
				function ()
					return self.gridCopy:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 512, _1080p * 13, _1080p * 525, 0 )
				end
			}
		} )
		grid:RegisterAnimationSequence( "FullNewLonger2", {
			{
				function ()
					return self.grid:SetAlpha( 0, 0 )
				end,
				function ()
					return self.grid:SetAlpha( 0, 300 )
				end,
				function ()
					return self.grid:SetAlpha( 1, 10 )
				end,
				function ()
					return self.grid:SetAlpha( 1, 260 )
				end,
				function ()
					return self.grid:SetAlpha( 0.5, 20 )
				end,
				function ()
					return self.grid:SetAlpha( 1, 20 )
				end,
				function ()
					return self.grid:SetAlpha( 0.5, 20 )
				end,
				function ()
					return self.grid:SetAlpha( 1, 20 )
				end,
				function ()
					return self.grid:SetAlpha( 0.5, 20 )
				end,
				function ()
					return self.grid:SetAlpha( 1, 20 )
				end,
				function ()
					return self.grid:SetAlpha( 1, 710 )
				end,
				function ()
					return self.grid:SetAlpha( 0, 40 )
				end
			},
			{
				function ()
					return self.grid:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 512, _1080p * 13, _1080p * 525, 0 )
				end
			}
		} )
		splashIconZom:RegisterAnimationSequence( "FullNewLonger2", {
			{
				function ()
					return self.splashIconZom:SetAlpha( 0, 0 )
				end,
				function ()
					return self.splashIconZom:SetAlpha( 0, 310 )
				end,
				function ()
					return self.splashIconZom:SetAlpha( 1, 100 )
				end,
				function ()
					return self.splashIconZom:SetAlpha( 1, 1080 )
				end,
				function ()
					return self.splashIconZom:SetAlpha( 0, 520 )
				end
			},
			{
				function ()
					return self.splashIconZom:SetZRotation( 0, 0 )
				end,
				function ()
					return self.splashIconZom:SetZRotation( 0, 1400 )
				end,
				function ()
					return self.splashIconZom:SetZRotation( -25, 610 )
				end
			},
			{
				function ()
					return self.splashIconZom:SetScale( 9.9, 320 )
				end,
				function ()
					return self.splashIconZom:SetScale( 3.5, 180 )
				end,
				function ()
					return self.splashIconZom:SetScale( 1.25, 70 )
				end,
				function ()
					return self.splashIconZom:SetScale( 1.25, 90 )
				end
			},
			{
				function ()
					return self.splashIconZom:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -35, _1080p * 51, _1080p * -30, _1080p * 56, 0 )
				end,
				function ()
					return self.splashIconZom:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -35, _1080p * 51, _1080p * -30, _1080p * 56, 1399 )
				end,
				function ()
					return self.splashIconZom:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -35, _1080p * 51, _1080p * 9.39, _1080p * 95.39, 90 )
				end,
				function ()
					return self.splashIconZom:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -28, _1080p * 58, _1080p * 237, _1080p * 323, 519 )
				end
			}
		} )
		popup:RegisterAnimationSequence( "FullNewLonger2", {
			{
				function ()
					return self.popup:SetAlpha( 0, 500 )
				end,
				function ()
					return self.popup:SetAlpha( 1, 30 )
				end,
				function ()
					return self.popup:SetAlpha( 1, 1130 )
				end,
				function ()
					return self.popup:SetAlpha( 0, 350 )
				end
			},
			{
				function ()
					return self.popup:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 512, _1080p * 369, _1080p * 433, 0 )
				end
			}
		} )
		Body:RegisterAnimationSequence( "FullNewLonger2", {
			{
				function ()
					return self.Body:SetAlpha( 0, 0 )
				end,
				function ()
					return self.Body:SetAlpha( 0, 500 )
				end,
				function ()
					return self.Body:SetAlpha( 1, 30 )
				end,
				function ()
					return self.Body:SetAlpha( 0, 1480 )
				end
			},
			{
				function ()
					return self.Body:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 12, _1080p * 497, _1080p * 389, _1080p * 413, 0 )
				end
			}
		} )
		Header:RegisterAnimationSequence( "FullNewLonger2", {
			{
				function ()
					return self.Header:SetAlpha( 0, 0 )
				end,
				function ()
					return self.Header:SetAlpha( 0, 500 )
				end,
				function ()
					return self.Header:SetAlpha( 1, 30 )
				end,
				function ()
					return self.Header:SetAlpha( 1, 1130 )
				end,
				function ()
					return self.Header:SetAlpha( 0, 350 )
				end
			},
			{
				function ()
					return self.Header:SetZRotation( 4, 0 )
				end,
				function ()
					return self.Header:SetZRotation( 4, 1510 )
				end,
				function ()
					return self.Header:SetZRotation( 20, 500 )
				end
			},
			{
				function ()
					return self.Header:SetScale( 0, 0 )
				end,
				function ()
					return self.Header:SetScale( 0, 1510 )
				end,
				function ()
					return self.Header:SetScale( 0.25, 60 )
				end
			},
			{
				function ()
					return self.Header:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 95.5, _1080p * -95.5, _1080p * 93, _1080p * 125, 0 )
				end,
				function ()
					return self.Header:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 95.5, _1080p * -95.5, _1080p * 93, _1080p * 125, 1500 )
				end,
				function ()
					return self.Header:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 98.19, _1080p * -124.81, _1080p * 84.5, _1080p * 116.5, 39 )
				end,
				function ()
					return self.Header:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 90.89, _1080p * -132.11, _1080p * 65.68, _1080p * 97.68, 19 )
				end,
				function ()
					return self.Header:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 87.69, _1080p * -135.31, _1080p * 55.34, _1080p * 87.34, 10 )
				end,
				function ()
					return self.Header:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 81.49, _1080p * -141.51, _1080p * 41.17, _1080p * 73.17, 9 )
				end,
				function ()
					return self.Header:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 36.13, _1080p * -186.88, _1080p * 56.17, _1080p * 88.17, 199 )
				end
			}
		} )
		BossTimer:RegisterAnimationSequence( "FullNewLonger2", {
			{
				function ()
					return self.BossTimer:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 158, _1080p * 358, _1080p * 462, _1080p * 512, 0 )
				end
			}
		} )
		self._sequences.FullNewLonger2 = function ()
			spinner:AnimateSequence( "FullNewLonger2" )
			glowCopy:AnimateSequence( "FullNewLonger2" )
			glow:AnimateSequence( "FullNewLonger2" )
			background:AnimateSequence( "FullNewLonger2" )
			gridCopy:AnimateSequence( "FullNewLonger2" )
			grid:AnimateSequence( "FullNewLonger2" )
			splashIconZom:AnimateSequence( "FullNewLonger2" )
			popup:AnimateSequence( "FullNewLonger2" )
			Body:AnimateSequence( "FullNewLonger2" )
			Header:AnimateSequence( "FullNewLonger2" )
			BossTimer:AnimateSequence( "FullNewLonger2" )
		end
		
		BossTimer:RegisterAnimationSequence( "bossTimer", {
			{
				function ()
					return self.BossTimer:SetAlpha( 0, 0 )
				end,
				function ()
					return self.BossTimer:SetAlpha( 0, 560 )
				end,
				function ()
					return self.BossTimer:SetAlpha( 1, 20 )
				end,
				function ()
					return self.BossTimer:SetAlpha( 1, 920 )
				end,
				function ()
					return self.BossTimer:SetAlpha( 0, 80 )
				end
			},
			{
				function ()
					return self.BossTimer.Timer:SetRGBFromInt( 16777215, 0 )
				end
			},
			{
				function ()
					return self.BossTimer:SetScale( 0, 760 )
				end,
				function ()
					return self.BossTimer:SetScale( 0.25, 140 )
				end,
				function ()
					return self.BossTimer:SetScale( 0, 150 )
				end,
				function ()
					return self.BossTimer:SetScale( 0.25, 170 )
				end,
				function ()
					return self.BossTimer:SetScale( 0, 150 )
				end
			}
		} )
		self._sequences.bossTimer = function ()
			BossTimer:AnimateSequence( "bossTimer" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	self:addEventHandler( "message_queue_show", function ( f147_arg0, f147_arg1 )
		local f147_local0 = f147_arg1.controller or f3_local1
		ACTIONS.AnimateSequence( self, "FullNewLonger2" )
	end )
	self:addEventHandler( "message_queue_hide", function ( f148_arg0, f148_arg1 )
		local f148_local0 = f148_arg1.controller or f3_local1
		ACTIONS.AnimateSequence( self, "HideNew" )
	end )
	PostLoadFunc( self, f3_local1, controller )
	ACTIONS.AnimateSequence( self, "DefaultSequence" )
	ACTIONS.AnimateSequence( self, "HideNew" )
	return self
end

MenuBuilder.registerType( "LocalPlayerZombieSplash", LocalPlayerZombieSplash )
LockTable( _M )
