local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
LUI.FlowManager.DisableLetterboxForMenu( "LoungeHud" )
LUI.FlowManager.DisableMousePointerForMenu( "LoungeHud" )
function PostLoadFunc( f1_arg0, f1_arg1 )
	if Engine.IsPC() then
		f1_arg0.processEvent = function ( f2_arg0, f2_arg1 )
			if f2_arg1.name ~= "mousemove" and f2_arg1.name ~= "gamepad_sticks" and f2_arg1.name ~= "mousedown" then
				return LUI.UIElement.processEvent( f2_arg0, f2_arg1 )
			else
				
			end
		end
		
	end
	f1_arg0:SetupInWorldElement( {} )
	f1_arg0:SetDelayedRender( true )
	f1_arg0:SetInWorldScale( 0.01 )
	f1_arg0:SetAlpha( 0 )
	local f1_local0 = function ( f3_arg0, f3_arg1 )
		local f3_local0 = Game.GetOmnvar( "ui_inworld_viewer_ent" )
		f3_arg0:SetEntityNum( f3_local0 )
		f3_arg0:SetFollowTagAngles( true )
		DebugPrint( "monitor ent is == " .. f3_local0 )
		f3_arg0:SetTagSpacePosition( -0.13, 0.3, 0.5 )
		f3_arg0:SetTagSpaceRoll( -90 )
		f3_arg0:SetAlpha( 1 )
	end
	
	f1_arg0:registerOmnvarHandler( "ui_inworld_viewer_ent", f1_local0 )
	f1_local0( f1_arg0, {} )
end

function LoungeHud( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, -360 * _1080p, 360 * _1080p, -490 * _1080p, 490 * _1080p )
	self.id = "LoungeHud"
	self._animationSets = {}
	self._sequences = {}
	local f4_local1 = controller and controller.controllerIndex
	if not f4_local1 and not Engine.InFrontend() then
		f4_local1 = self:getRootController()
	end
	assert( f4_local1 )
	self:playSound( "menu_open" )
	local f4_local2 = self
	self:setUseStencil( true )
	local Background = nil
	
	Background = LUI.UIImage.new()
	Background.id = "Background"
	Background:SetRGBFromTable( SWATCHES.loungeTV.background, 0 )
	self:addElement( Background )
	self.Background = Background
	
	local Border = nil
	
	Border = LUI.UIBorder.new( {
		borderThicknessLeft = _1080p * 4,
		borderThicknessRight = _1080p * 4,
		borderThicknessTop = _1080p * 4,
		borderThicknessBottom = _1080p * 4
	} )
	Border.id = "Border"
	Border:SetRGBFromTable( SWATCHES.loungeTV.tint, 0 )
	Border:SetBorderThicknessLeft( _1080p * 4, 0 )
	Border:SetBorderThicknessRight( _1080p * 4, 0 )
	Border:SetBorderThicknessTop( _1080p * 4, 0 )
	Border:SetBorderThicknessBottom( _1080p * 4, 0 )
	Border:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -346, _1080p * 186, _1080p * 102, _1080p * 371.69 )
	self:addElement( Border )
	self.Border = Border
	
	local ArrowUp = nil
	
	ArrowUp = LUI.UIImage.new()
	ArrowUp.id = "ArrowUp"
	ArrowUp:SetRGBFromTable( SWATCHES.loungeTV.tint, 0 )
	ArrowUp:SetScale( 1, 0 )
	ArrowUp:setImage( RegisterMaterial( "hud_lounge_arrow" ), 0 )
	ArrowUp:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 272, _1080p * -432, _1080p * 575, _1080p * 583 )
	self:addElement( ArrowUp )
	self.ArrowUp = ArrowUp
	
	local ArrowDown = nil
	
	ArrowDown = LUI.UIImage.new()
	ArrowDown.id = "ArrowDown"
	ArrowDown:SetRGBFromTable( SWATCHES.loungeTV.tint, 0 )
	ArrowDown:SetZRotation( 180, 0 )
	ArrowDown:SetScale( 1, 0 )
	ArrowDown:setImage( RegisterMaterial( "hud_lounge_arrow" ), 0 )
	ArrowDown:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 272, _1080p * -432, _1080p * 606, _1080p * 614 )
	self:addElement( ArrowDown )
	self.ArrowDown = ArrowDown
	
	local Footer = nil
	
	Footer = LUI.UIImage.new()
	Footer.id = "Footer"
	Footer:setImage( RegisterMaterial( "hud_lounge_footer" ), 0 )
	Footer:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, _1080p * 935, _1080p * 980 )
	self:addElement( Footer )
	self.Footer = Footer
	
	local Header = nil
	
	Header = LUI.UIImage.new()
	Header.id = "Header"
	Header:setImage( RegisterMaterial( "hud_lounge_header" ), 0 )
	Header:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, 0, _1080p * 45 )
	self:addElement( Header )
	self.Header = Header
	
	local LogoFluff = nil
	
	LogoFluff = LUI.UIText.new()
	LogoFluff.id = "LogoFluff"
	LogoFluff:SetRGBFromTable( SWATCHES.loungeTV.selected, 0 )
	LogoFluff:SetAlpha( 0.4, 0 )
	LogoFluff:setText( "V. 287983002", 0 )
	LogoFluff:SetFontSize( 22 * _1080p )
	LogoFluff:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	LogoFluff:SetAlignment( LUI.Alignment.Right )
	LogoFluff:SetAnchorsAndPosition( 1, 0, 1, 0, _1080p * -146.05, _1080p * -11.46, _1080p * -78.53, _1080p * -56.53 )
	self:addElement( LogoFluff )
	self.LogoFluff = LogoFluff
	
	local LogoBorder = nil
	
	LogoBorder = LUI.UIBorder.new( {
		borderThicknessLeft = _1080p * 3,
		borderThicknessRight = _1080p * 3,
		borderThicknessTop = _1080p * 3,
		borderThicknessBottom = _1080p * 3
	} )
	LogoBorder.id = "LogoBorder"
	LogoBorder:SetRGBFromTable( SWATCHES.loungeTV.selected, 0 )
	LogoBorder:SetAlpha( 0.4, 0 )
	LogoBorder:SetBorderThicknessLeft( _1080p * 3, 0 )
	LogoBorder:SetBorderThicknessRight( _1080p * 3, 0 )
	LogoBorder:SetBorderThicknessTop( _1080p * 3, 0 )
	LogoBorder:SetBorderThicknessBottom( _1080p * 3, 0 )
	LogoBorder:SetAnchorsAndPosition( 1, 0, 1, 0, _1080p * -149.5, _1080p * -8, _1080p * -220.04, _1080p * -78.53 )
	self:addElement( LogoBorder )
	self.LogoBorder = LogoBorder
	
	local Logo = nil
	
	Logo = LUI.UIImage.new()
	Logo.id = "Logo"
	Logo:SetRGBFromTable( SWATCHES.loungeTV.selected, 0 )
	Logo:SetAlpha( 0.4, 0 )
	Logo:setImage( RegisterMaterial( "icon_faction_unsa_bw" ), 0 )
	Logo:SetAnchorsAndPosition( 1, 0, 1, 0, _1080p * -136.34, _1080p * -21.16, _1080p * -203.5, _1080p * -88.31 )
	self:addElement( Logo )
	self.Logo = Logo
	
	local ThumbnaulBR = nil
	
	ThumbnaulBR = MenuBuilder.BuildRegisteredType( "LoungeTVMenuThumbnail", {
		controllerIndex = f4_local1
	} )
	ThumbnaulBR.id = "ThumbnaulBR"
	ThumbnaulBR.Image:setImage( RegisterMaterial( "hud_lounge_remote_wounded" ), 0 )
	ThumbnaulBR.TextBR:setText( LocalizeString( ToUpperCase( Engine.Localize( "SHIPCRIB_LOUNGE_WOUNDED" ) ) ), 0 )
	ThumbnaulBR:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -340, _1080p * -8, _1080p * 340, _1080p * 543 )
	self:addElement( ThumbnaulBR )
	self.ThumbnaulBR = ThumbnaulBR
	
	local ThumbnailBL = nil
	
	ThumbnailBL = MenuBuilder.BuildRegisteredType( "LoungeTVMenuThumbnail", {
		controllerIndex = f4_local1
	} )
	ThumbnailBL.id = "ThumbnailBL"
	ThumbnailBL.Image:setImage( RegisterMaterial( "hud_lounge_remote_titan" ), 0 )
	ThumbnailBL.TextBR:setText( LocalizeString( ToUpperCase( Engine.Localize( "SHIPCRIB_LOUNGE_TITAN" ) ) ), 0 )
	ThumbnailBL:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 11, _1080p * 343, _1080p * 340, _1080p * 543 )
	self:addElement( ThumbnailBL )
	self.ThumbnailBL = ThumbnailBL
	
	local ThumbnailUR = nil
	
	ThumbnailUR = MenuBuilder.BuildRegisteredType( "LoungeTVMenuThumbnail", {
		controllerIndex = f4_local1
	} )
	ThumbnailUR.id = "ThumbnailUR"
	ThumbnailUR.Image:setImage( RegisterMaterial( "hud_lounge_remote_sun" ), 0 )
	ThumbnailUR.TextBR:setText( LocalizeString( ToUpperCase( Engine.Localize( "SHIPCRIB_LOUNGE_ROGUE" ) ) ), 0 )
	ThumbnailUR:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -340, _1080p * -8, _1080p * 86, _1080p * 289 )
	self:addElement( ThumbnailUR )
	self.ThumbnailUR = ThumbnailUR
	
	local ThumbnailUL = nil
	
	ThumbnailUL = MenuBuilder.BuildRegisteredType( "LoungeTVMenuThumbnail", {
		controllerIndex = f4_local1
	} )
	ThumbnailUL.id = "ThumbnailUL"
	ThumbnailUL.Image:setImage( RegisterMaterial( "hud_lounge_remote_europa" ), 0 )
	ThumbnailUL.TextBR:setText( LocalizeString( ToUpperCase( Engine.Localize( "SHIPCRIB_LOUNGE_EUROPA" ) ) ), 0 )
	ThumbnailUL:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 11, _1080p * 343, _1080p * 86, _1080p * 289 )
	self:addElement( ThumbnailUL )
	self.ThumbnailUL = ThumbnailUL
	
	local LoungeTVMenuList = nil
	
	LoungeTVMenuList = MenuBuilder.BuildRegisteredType( "LoungeTVMenuList", {
		controllerIndex = f4_local1
	} )
	LoungeTVMenuList.id = "LoungeTVMenuList"
	LoungeTVMenuList:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -340.5, _1080p * 180.5, _1080p * 136.75, _1080p * 340.72 )
	self:addElement( LoungeTVMenuList )
	self.LoungeTVMenuList = LoungeTVMenuList
	
	local RemoteText = nil
	
	RemoteText = LUI.UIText.new()
	RemoteText.id = "RemoteText"
	RemoteText:setText( ToUpperCase( Engine.Localize( "SHIPCRIB_ONBOARD_VIDEO_REMOTE" ) ), 0 )
	RemoteText:SetFontSize( 32 * _1080p )
	RemoteText:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	RemoteText:SetAlignment( LUI.Alignment.Left )
	RemoteText:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 14, _1080p * 491, _1080p * 6.5, _1080p * 38.5 )
	self:addElement( RemoteText )
	self.RemoteText = RemoteText
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		Background:RegisterAnimationSequence( "BootUp", {
			{
				function ()
					return self.Background:SetAlpha( 0, 0 )
				end,
				function ()
					return self.Background:SetAlpha( 1, 350 )
				end
			}
		} )
		ArrowUp:RegisterAnimationSequence( "BootUp", {
			{
				function ()
					return self.ArrowUp:SetAlpha( 0, 0 )
				end,
				function ()
					return self.ArrowUp:SetAlpha( 0, 560 )
				end,
				function ()
					return self.ArrowUp:SetAlpha( 1, 140 )
				end
			}
		} )
		ArrowDown:RegisterAnimationSequence( "BootUp", {
			{
				function ()
					return self.ArrowDown:SetAlpha( 0, 0 )
				end,
				function ()
					return self.ArrowDown:SetAlpha( 0, 560 )
				end,
				function ()
					return self.ArrowDown:SetAlpha( 1, 140 )
				end
			}
		} )
		Footer:RegisterAnimationSequence( "BootUp", {
			{
				function ()
					return self.Footer:SetAlpha( 0, 0 )
				end,
				function ()
					return self.Footer:SetAlpha( 1, 200 )
				end
			}
		} )
		Header:RegisterAnimationSequence( "BootUp", {
			{
				function ()
					return self.Header:SetAlpha( 0, 0 )
				end,
				function ()
					return self.Header:SetAlpha( 1, 200 )
				end
			}
		} )
		LogoFluff:RegisterAnimationSequence( "BootUp", {
			{
				function ()
					return self.LogoFluff:SetAlpha( 0, 0 )
				end,
				function ()
					return self.LogoFluff:SetAlpha( 0, 220 )
				end,
				function ()
					return self.LogoFluff:SetAlpha( 0.6, 370 )
				end
			}
		} )
		LogoBorder:RegisterAnimationSequence( "BootUp", {
			{
				function ()
					return self.LogoBorder:SetAlpha( 0, 0 )
				end,
				function ()
					return self.LogoBorder:SetAlpha( 0, 220 )
				end,
				function ()
					return self.LogoBorder:SetAlpha( 0.6, 370 )
				end
			}
		} )
		Logo:RegisterAnimationSequence( "BootUp", {
			{
				function ()
					return self.Logo:SetAlpha( 0, 0 )
				end,
				function ()
					return self.Logo:SetAlpha( 0, 220 )
				end,
				function ()
					return self.Logo:SetAlpha( 0.6, 370 )
				end
			}
		} )
		ThumbnaulBR:RegisterAnimationSequence( "BootUp", {
			{
				function ()
					return self.ThumbnaulBR:SetAlpha( 0, 0 )
				end,
				function ()
					return self.ThumbnaulBR:SetAlpha( 0, 400 )
				end,
				function ()
					return self.ThumbnaulBR:SetAlpha( 1, 190, LUI.EASING.outBack )
				end
			},
			{
				function ()
					return self.ThumbnaulBR:SetScale( -0.8, 400 )
				end,
				function ()
					return self.ThumbnaulBR:SetScale( 0, 190, LUI.EASING.outBack )
				end
			}
		} )
		ThumbnailBL:RegisterAnimationSequence( "BootUp", {
			{
				function ()
					return self.ThumbnailBL:SetAlpha( 0, 0 )
				end,
				function ()
					return self.ThumbnailBL:SetAlpha( 0, 400 )
				end,
				function ()
					return self.ThumbnailBL:SetAlpha( 1, 190, LUI.EASING.outBack )
				end
			},
			{
				function ()
					return self.ThumbnailBL:SetScale( -0.8, 400 )
				end,
				function ()
					return self.ThumbnailBL:SetScale( 0, 190, LUI.EASING.outBack )
				end
			}
		} )
		ThumbnailUR:RegisterAnimationSequence( "BootUp", {
			{
				function ()
					return self.ThumbnailUR:SetAlpha( 0, 0 )
				end,
				function ()
					return self.ThumbnailUR:SetAlpha( 0, 400 )
				end,
				function ()
					return self.ThumbnailUR:SetAlpha( 1, 190, LUI.EASING.outBack )
				end
			},
			{
				function ()
					return self.ThumbnailUR:SetScale( -0.8, 400 )
				end,
				function ()
					return self.ThumbnailUR:SetScale( 0, 190, LUI.EASING.outBack )
				end
			}
		} )
		ThumbnailUL:RegisterAnimationSequence( "BootUp", {
			{
				function ()
					return self.ThumbnailUL:SetAlpha( 0, 0 )
				end,
				function ()
					return self.ThumbnailUL:SetAlpha( 0, 400 )
				end,
				function ()
					return self.ThumbnailUL:SetAlpha( 1, 190, LUI.EASING.outBack )
				end
			},
			{
				function ()
					return self.ThumbnailUL:SetScale( -0.8, 400 )
				end,
				function ()
					return self.ThumbnailUL:SetScale( 0, 190, LUI.EASING.outBack )
				end
			}
		} )
		RemoteText:RegisterAnimationSequence( "BootUp", {
			{
				function ()
					return self.RemoteText:SetAlpha( 0, 0 )
				end,
				function ()
					return self.RemoteText:SetAlpha( 0, 590 )
				end,
				function ()
					return self.RemoteText:SetAlpha( 1, 110 )
				end
			}
		} )
		self._sequences.BootUp = function ()
			Background:AnimateSequence( "BootUp" )
			ArrowUp:AnimateSequence( "BootUp" )
			ArrowDown:AnimateSequence( "BootUp" )
			Footer:AnimateSequence( "BootUp" )
			Header:AnimateSequence( "BootUp" )
			LogoFluff:AnimateSequence( "BootUp" )
			LogoBorder:AnimateSequence( "BootUp" )
			Logo:AnimateSequence( "BootUp" )
			ThumbnaulBR:AnimateSequence( "BootUp" )
			ThumbnailBL:AnimateSequence( "BootUp" )
			ThumbnailUR:AnimateSequence( "BootUp" )
			ThumbnailUL:AnimateSequence( "BootUp" )
			RemoteText:AnimateSequence( "BootUp" )
		end
		
		Background:RegisterAnimationSequence( "Shutdown", {
			{
				function ()
					return self.Background:SetAlpha( 1, 0 )
				end,
				function ()
					return self.Background:SetAlpha( 0, 270 )
				end
			}
		} )
		ArrowUp:RegisterAnimationSequence( "Shutdown", {
			{
				function ()
					return self.ArrowUp:SetAlpha( 1, 0 )
				end,
				function ()
					return self.ArrowUp:SetAlpha( 0, 110 )
				end
			}
		} )
		ArrowDown:RegisterAnimationSequence( "Shutdown", {
			{
				function ()
					return self.ArrowDown:SetAlpha( 1, 0 )
				end,
				function ()
					return self.ArrowDown:SetAlpha( 0, 110 )
				end
			}
		} )
		Footer:RegisterAnimationSequence( "Shutdown", {
			{
				function ()
					return self.Footer:SetAlpha( 1, 170 )
				end,
				function ()
					return self.Footer:SetAlpha( 0, 100 )
				end
			}
		} )
		Header:RegisterAnimationSequence( "Shutdown", {
			{
				function ()
					return self.Header:SetAlpha( 1, 170 )
				end,
				function ()
					return self.Header:SetAlpha( 0, 100 )
				end
			}
		} )
		LogoFluff:RegisterAnimationSequence( "Shutdown", {
			{
				function ()
					return self.LogoFluff:SetAlpha( 0.6, 0 )
				end,
				function ()
					return self.LogoFluff:SetAlpha( 0, 200 )
				end
			}
		} )
		LogoBorder:RegisterAnimationSequence( "Shutdown", {
			{
				function ()
					return self.LogoBorder:SetAlpha( 0.6, 0 )
				end,
				function ()
					return self.LogoBorder:SetAlpha( 0, 200 )
				end
			}
		} )
		Logo:RegisterAnimationSequence( "Shutdown", {
			{
				function ()
					return self.Logo:SetAlpha( 0.6, 0 )
				end,
				function ()
					return self.Logo:SetAlpha( 0, 200 )
				end
			}
		} )
		ThumbnaulBR:RegisterAnimationSequence( "Shutdown", {
			{
				function ()
					return self.ThumbnaulBR:SetScale( 0, 0 )
				end,
				function ()
					return self.ThumbnaulBR:SetScale( -0.8, 200, LUI.EASING.inBack )
				end
			},
			{
				function ()
					return self.ThumbnaulBR:SetAlpha( 1, 0 )
				end,
				function ()
					return self.ThumbnaulBR:SetAlpha( 0, 200, LUI.EASING.inBack )
				end
			}
		} )
		ThumbnailBL:RegisterAnimationSequence( "Shutdown", {
			{
				function ()
					return self.ThumbnailBL:SetScale( 0, 0 )
				end,
				function ()
					return self.ThumbnailBL:SetScale( -0.8, 200, LUI.EASING.inBack )
				end
			},
			{
				function ()
					return self.ThumbnailBL:SetAlpha( 1, 0 )
				end,
				function ()
					return self.ThumbnailBL:SetAlpha( 0, 200, LUI.EASING.inBack )
				end
			}
		} )
		ThumbnailUR:RegisterAnimationSequence( "Shutdown", {
			{
				function ()
					return self.ThumbnailUR:SetScale( 0, 0 )
				end,
				function ()
					return self.ThumbnailUR:SetScale( -0.8, 200, LUI.EASING.inBack )
				end
			},
			{
				function ()
					return self.ThumbnailUR:SetAlpha( 1, 0 )
				end,
				function ()
					return self.ThumbnailUR:SetAlpha( 0, 200, LUI.EASING.inBack )
				end
			}
		} )
		ThumbnailUL:RegisterAnimationSequence( "Shutdown", {
			{
				function ()
					return self.ThumbnailUL:SetScale( 0, 0 )
				end,
				function ()
					return self.ThumbnailUL:SetScale( -0.8, 200, LUI.EASING.inBack )
				end
			},
			{
				function ()
					return self.ThumbnailUL:SetAlpha( 1, 0 )
				end,
				function ()
					return self.ThumbnailUL:SetAlpha( 0, 200, LUI.EASING.inBack )
				end
			}
		} )
		RemoteText:RegisterAnimationSequence( "Shutdown", {
			{
				function ()
					return self.RemoteText:SetAlpha( 1, 0 )
				end,
				function ()
					return self.RemoteText:SetAlpha( 0, 200 )
				end
			}
		} )
		self._sequences.Shutdown = function ()
			Background:AnimateSequence( "Shutdown" )
			ArrowUp:AnimateSequence( "Shutdown" )
			ArrowDown:AnimateSequence( "Shutdown" )
			Footer:AnimateSequence( "Shutdown" )
			Header:AnimateSequence( "Shutdown" )
			LogoFluff:AnimateSequence( "Shutdown" )
			LogoBorder:AnimateSequence( "Shutdown" )
			Logo:AnimateSequence( "Shutdown" )
			ThumbnaulBR:AnimateSequence( "Shutdown" )
			ThumbnailBL:AnimateSequence( "Shutdown" )
			ThumbnailUR:AnimateSequence( "Shutdown" )
			ThumbnailUL:AnimateSequence( "Shutdown" )
			RemoteText:AnimateSequence( "Shutdown" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	ThumbnaulBR:addEventHandler( "button_action", function ( f87_arg0, f87_arg1 )
		local f87_local0 = f87_arg1.controller or f4_local1
		ACTIONS.ScriptNotify( "wounded_button", 1 )
	end )
	ThumbnailBL:addEventHandler( "button_action", function ( f88_arg0, f88_arg1 )
		local f88_local0 = f88_arg1.controller or f4_local1
		ACTIONS.ScriptNotify( "titan_button", 1 )
	end )
	ThumbnailUR:addEventHandler( "button_action", function ( f89_arg0, f89_arg1 )
		local f89_local0 = f89_arg1.controller or f4_local1
		ACTIONS.ScriptNotify( "rogue_button", 1 )
	end )
	ThumbnailUL:addEventHandler( "button_action", function ( f90_arg0, f90_arg1 )
		local f90_local0 = f90_arg1.controller or f4_local1
		ACTIONS.ScriptNotify( "europa_button", 1 )
	end )
	
	local bindButton = LUI.UIBindButton.new()
	bindButton.id = "selfBindButton"
	self:addElement( bindButton )
	self.bindButton = bindButton
	
	self.bindButton:addEventHandler( "button_secondary", function ( f91_arg0, f91_arg1 )
		local f91_local0 = f91_arg1.controller or f4_local1
		ACTIONS.LeaveMenuByName( "LoungeHud" )
		ACTIONS.ScriptNotify( "lounge_viewer_exit", 1 )
	end )
	PostLoadFunc( self, f4_local1, controller )
	ACTIONS.AnimateSequence( self, "BootUp" )
	return self
end

MenuBuilder.registerType( "LoungeHud", LoungeHud )
LockTable( _M )
