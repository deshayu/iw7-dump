local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function setHintText( f1_arg0 )
	if Engine.IsGamepadEnabled() == 0 then
		f1_arg0.HoldHint:setText( "" )
		f1_arg0.ReleaseHint:setText( ToUpperCase( Engine.Localize( "PATCH_EQUIPMENT_HACK_PC_CONFIRM_HINT" ) ), 0 )
		f1_arg0.PcExitHint:setText( ToUpperCase( Engine.Localize( "PATCH_EQUIPMENT_HACK_PC_EXIT_HINT" ) ), 0 )
		f1_arg0.PcExitHint:SetAlpha( 1, 0 )
	else
		f1_arg0.HoldHint:setText( ToUpperCase( Engine.Localize( "EQUIPMENT_HACK_HUD_HOLD_HINT" ) ), 0 )
		f1_arg0.ReleaseHint:setText( ToUpperCase( Engine.Localize( "EQUIPMENT_HACK_HUD_RELEASE_HINT" ) ), 0 )
		f1_arg0.PcExitHint:setText( "" )
		f1_arg0.PcExitHint:SetAlpha( 0, 0 )
	end
end

function PostLoadFunc( f2_arg0 )
	setHintText( f2_arg0 )
	f2_arg0:registerEventHandler( "empty_menu_stack", function ( element, event )
		setHintText( element )
	end )
end

function HackTargetingReticle( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 450 * _1080p, 0, 350 * _1080p )
	self.id = "HackTargetingReticle"
	self._animationSets = {}
	self._sequences = {}
	local f4_local1 = controller and controller.controllerIndex
	if not f4_local1 and not Engine.InFrontend() then
		f4_local1 = self:getRootController()
	end
	assert( f4_local1 )
	local f4_local2 = self
	local line1 = nil
	
	line1 = LUI.UIImage.new()
	line1.id = "line1"
	line1:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 1, _1080p * 1, _1080p * 65 )
	self:addElement( line1 )
	self.line1 = line1
	
	local line1Copy1 = nil
	
	line1Copy1 = LUI.UIImage.new()
	line1Copy1.id = "line1Copy1"
	line1Copy1:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -65, 0, 0, _1080p * 1 )
	self:addElement( line1Copy1 )
	self.line1Copy1 = line1Copy1
	
	local line1Copy0 = nil
	
	line1Copy0 = LUI.UIImage.new()
	line1Copy0.id = "line1Copy0"
	line1Copy0:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -1, 0, _1080p * 1, _1080p * 65 )
	self:addElement( line1Copy0 )
	self.line1Copy0 = line1Copy0
	
	local line1Copy2 = nil
	
	line1Copy2 = LUI.UIImage.new()
	line1Copy2.id = "line1Copy2"
	line1Copy2:SetAnchorsAndPosition( 1, 0, 1, 0, _1080p * -65, 0, _1080p * -1, 0 )
	self:addElement( line1Copy2 )
	self.line1Copy2 = line1Copy2
	
	local line1Copy3 = nil
	
	line1Copy3 = LUI.UIImage.new()
	line1Copy3.id = "line1Copy3"
	line1Copy3:SetAnchorsAndPosition( 1, 0, 1, 0, _1080p * -1, 0, _1080p * -65, _1080p * -1 )
	self:addElement( line1Copy3 )
	self.line1Copy3 = line1Copy3
	
	local line1Copy4 = nil
	
	line1Copy4 = LUI.UIImage.new()
	line1Copy4.id = "line1Copy4"
	line1Copy4:SetAnchorsAndPosition( 0, 1, 1, 0, 0, _1080p * 1, _1080p * -65, _1080p * -1 )
	self:addElement( line1Copy4 )
	self.line1Copy4 = line1Copy4
	
	local line1Copy5 = nil
	
	line1Copy5 = LUI.UIImage.new()
	line1Copy5.id = "line1Copy5"
	line1Copy5:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 65, 0, _1080p * 1 )
	self:addElement( line1Copy5 )
	self.line1Copy5 = line1Copy5
	
	local line1Copy6 = nil
	
	line1Copy6 = LUI.UIImage.new()
	line1Copy6.id = "line1Copy6"
	line1Copy6:SetAnchorsAndPosition( 0, 1, 1, 0, 0, _1080p * 65, _1080p * -1, 0 )
	self:addElement( line1Copy6 )
	self.line1Copy6 = line1Copy6
	
	local searching = nil
	
	searching = LUI.UIText.new()
	searching.id = "searching"
	searching:SetAlpha( 0.15, 0 )
	searching:setText( Engine.Localize( "EQUIPMENT_HACK_HUD_SEARCHING" ), 0 )
	searching:SetFontSize( 22 * _1080p )
	searching:SetFont( FONTS.GetFont( FONTS.MainExtended.File ) )
	searching:SetAlignment( LUI.Alignment.Right )
	searching:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -150, _1080p * -10, _1080p * 10, _1080p * 32 )
	self:addElement( searching )
	self.searching = searching
	
	local searchingCopy0 = nil
	
	searchingCopy0 = LUI.UIText.new()
	searchingCopy0.id = "searchingCopy0"
	searchingCopy0:SetAlpha( 0.15, 0 )
	searchingCopy0:setText( Engine.Localize( "EQUIPMENT_HACK_HUD_CONNECTING" ), 0 )
	searchingCopy0:SetFontSize( 22 * _1080p )
	searchingCopy0:SetFont( FONTS.GetFont( FONTS.MainExtended.File ) )
	searchingCopy0:SetAlignment( LUI.Alignment.Right )
	searchingCopy0:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -150, _1080p * -10, _1080p * 30, _1080p * 52 )
	self:addElement( searchingCopy0 )
	self.searchingCopy0 = searchingCopy0
	
	local searchingCopy1 = nil
	
	searchingCopy1 = LUI.UIText.new()
	searchingCopy1.id = "searchingCopy1"
	searchingCopy1:SetAlpha( 0.15, 0 )
	searchingCopy1:setText( Engine.Localize( "EQUIPMENT_HACK_HUD_LOCKED" ), 0 )
	searchingCopy1:SetFontSize( 22 * _1080p )
	searchingCopy1:SetFont( FONTS.GetFont( FONTS.MainExtended.File ) )
	searchingCopy1:SetAlignment( LUI.Alignment.Right )
	searchingCopy1:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -150, _1080p * -10, _1080p * 50, _1080p * 72 )
	self:addElement( searchingCopy1 )
	self.searchingCopy1 = searchingCopy1
	
	local HoldHint = nil
	
	HoldHint = LUI.UIText.new()
	HoldHint.id = "HoldHint"
	HoldHint:setText( ToUpperCase( Engine.Localize( "EQUIPMENT_HACK_HUD_HOLD_HINT" ) ), 0 )
	HoldHint:SetFontSize( 32 * _1080p )
	HoldHint:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	HoldHint:SetAlignment( LUI.Alignment.Center )
	HoldHint:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, _1080p * 333, _1080p * 365 )
	self:addElement( HoldHint )
	self.HoldHint = HoldHint
	
	local ReleaseHint = nil
	
	ReleaseHint = LUI.UIText.new()
	ReleaseHint.id = "ReleaseHint"
	ReleaseHint:setText( ToUpperCase( Engine.Localize( "EQUIPMENT_HACK_HUD_RELEASE_HINT" ) ), 0 )
	ReleaseHint:SetFontSize( 32 * _1080p )
	ReleaseHint:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	ReleaseHint:SetAlignment( LUI.Alignment.Center )
	ReleaseHint:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, _1080p * 333, _1080p * 365 )
	self:addElement( ReleaseHint )
	self.ReleaseHint = ReleaseHint
	
	local PcExitHint = nil
	
	PcExitHint = LUI.UIText.new()
	PcExitHint.id = "PcExitHint"
	PcExitHint:setText( Engine.Localize( "PATCH_EQUIPMENT_HACK_PC_EXIT_HINT" ), 0 )
	PcExitHint:SetFontSize( 32 * _1080p )
	PcExitHint:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	PcExitHint:SetAlignment( LUI.Alignment.Left )
	PcExitHint:SetOptOutRightToLeftAlignmentFlip( true )
	PcExitHint:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * -228, _1080p * -229, _1080p * 374, _1080p * 406 )
	self:addElement( PcExitHint )
	self.PcExitHint = PcExitHint
	
	local Crosshairs = nil
	
	Crosshairs = MenuBuilder.BuildRegisteredType( "GenericReticleCrosshairs", {
		controllerIndex = f4_local1
	} )
	Crosshairs.id = "Crosshairs"
	Crosshairs.rightLine:SetLeft( _1080p * -25, 0 )
	Crosshairs.rightLine:SetTop( _1080p * -0.5, 0 )
	Crosshairs.rightLine:SetBottom( _1080p * 0.5, 0 )
	Crosshairs.leftLine:SetRight( _1080p * 25, 0 )
	Crosshairs.leftLine:SetTop( _1080p * -0.5, 0 )
	Crosshairs.leftLine:SetBottom( _1080p * 0.5, 0 )
	Crosshairs.bottomLine:SetLeft( _1080p * -0.5, 0 )
	Crosshairs.bottomLine:SetRight( _1080p * 0.5, 0 )
	Crosshairs.bottomLine:SetTop( _1080p * -25, 0 )
	Crosshairs.topLine:SetLeft( _1080p * -0.5, 0 )
	Crosshairs.topLine:SetRight( _1080p * 0.5, 0 )
	Crosshairs.topLine:SetBottom( _1080p * 25, 0 )
	Crosshairs:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -45, _1080p * 45, _1080p * -45, _1080p * 45 )
	self:addElement( Crosshairs )
	self.Crosshairs = Crosshairs
	
	local Cross = nil
	
	Cross = LUI.UIImage.new()
	Cross.id = "Cross"
	Cross:setImage( RegisterMaterial( "hud_frame_cross" ), 0 )
	Cross:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -4, _1080p * 4, _1080p * -4, _1080p * 4 )
	self:addElement( Cross )
	self.Cross = Cross
	
	local TargetingMarker = nil
	
	TargetingMarker = MenuBuilder.BuildRegisteredType( "HackTargetingMarker", {
		controllerIndex = f4_local1
	} )
	TargetingMarker.id = "TargetingMarker"
	TargetingMarker:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -48, _1080p * 48, _1080p * -48, _1080p * 48 )
	self:addElement( TargetingMarker )
	self.TargetingMarker = TargetingMarker
	
	local NotCompatibleBg = nil
	
	NotCompatibleBg = LUI.UIImage.new()
	NotCompatibleBg.id = "NotCompatibleBg"
	NotCompatibleBg:SetAlpha( 0, 0 )
	NotCompatibleBg:SetBlendMode( BLEND_MODE.addWithAlpha )
	NotCompatibleBg:SetAnchorsAndPosition( 0, 0, 0.5, 0.5, 0, 0, _1080p * 12, _1080p * -12 )
	self:addElement( NotCompatibleBg )
	self.NotCompatibleBg = NotCompatibleBg
	
	local NotCompatibleText = nil
	
	NotCompatibleText = LUI.UIText.new()
	NotCompatibleText.id = "NotCompatibleText"
	NotCompatibleText:SetRGBFromInt( 0, 0 )
	NotCompatibleText:SetAlpha( 0, 0 )
	NotCompatibleText:setText( Engine.Localize( "EQUIPMENT_HACK_HUD_NOT_COMPATIBLE" ), 0 )
	NotCompatibleText:SetFontSize( 22 * _1080p )
	NotCompatibleText:SetFont( FONTS.GetFont( FONTS.MainExtended.File ) )
	NotCompatibleText:SetAlignment( LUI.Alignment.Center )
	NotCompatibleText:SetAnchorsAndPosition( 0, 0, 0.5, 0.5, 0, 0, _1080p * -11, _1080p * 11 )
	self:addElement( NotCompatibleText )
	self.NotCompatibleText = NotCompatibleText
	
	local NotCompatibleTextCopy0 = nil
	
	NotCompatibleTextCopy0 = LUI.UIText.new()
	NotCompatibleTextCopy0.id = "NotCompatibleTextCopy0"
	NotCompatibleTextCopy0:SetRGBFromInt( 0, 0 )
	NotCompatibleTextCopy0:SetAlpha( 0, 0 )
	NotCompatibleTextCopy0:setText( Engine.Localize( "EQUIPMENT_HACK_HUD_NOT_COMPATIBLE" ), 0 )
	NotCompatibleTextCopy0:SetFontSize( 22 * _1080p )
	NotCompatibleTextCopy0:SetFont( FONTS.GetFont( FONTS.MainExtended.File ) )
	NotCompatibleTextCopy0:SetAlignment( LUI.Alignment.Center )
	NotCompatibleTextCopy0:SetAnchorsAndPosition( 0, 0, 0.5, 0.5, 0, 0, _1080p * -11, _1080p * 11 )
	self:addElement( NotCompatibleTextCopy0 )
	self.NotCompatibleTextCopy0 = NotCompatibleTextCopy0
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		searching:RegisterAnimationSequence( "Searching", {
			{
				function ()
					return self.searching:SetAlpha( 0.75, 0 )
				end,
				function ()
					return self.searching:SetAlpha( 0.5, 400 )
				end,
				function ()
					return self.searching:SetAlpha( 0.75, 400 )
				end
			}
		} )
		searchingCopy0:RegisterAnimationSequence( "Searching", {
			{
				function ()
					return self.searchingCopy0:SetAlpha( 0.15, 0 )
				end
			},
			{
				function ()
					return self.searchingCopy0:SetRGBFromInt( 16777215, 0 )
				end
			}
		} )
		searchingCopy1:RegisterAnimationSequence( "Searching", {
			{
				function ()
					return self.searchingCopy1:SetAlpha( 0.15, 0 )
				end
			},
			{
				function ()
					return self.searchingCopy1:SetRGBFromInt( 16777215, 0 )
				end
			}
		} )
		HoldHint:RegisterAnimationSequence( "Searching", {
			{
				function ()
					return self.HoldHint:SetAlpha( 1, 0 )
				end,
				function ()
					return self.HoldHint:SetAlpha( 0.5, 400 )
				end,
				function ()
					return self.HoldHint:SetAlpha( 1, 400 )
				end
			}
		} )
		ReleaseHint:RegisterAnimationSequence( "Searching", {
			{
				function ()
					return self.ReleaseHint:SetAlpha( 0, 0 )
				end
			}
		} )
		NotCompatibleBg:RegisterAnimationSequence( "Searching", {
			{
				function ()
					return self.NotCompatibleBg:SetAlpha( 0, 0 )
				end
			}
		} )
		NotCompatibleText:RegisterAnimationSequence( "Searching", {
			{
				function ()
					return self.NotCompatibleText:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.Searching = function ()
			searching:AnimateLoop( "Searching" )
			searchingCopy0:AnimateLoop( "Searching" )
			searchingCopy1:AnimateLoop( "Searching" )
			HoldHint:AnimateLoop( "Searching" )
			ReleaseHint:AnimateLoop( "Searching" )
			NotCompatibleBg:AnimateLoop( "Searching" )
			NotCompatibleText:AnimateLoop( "Searching" )
		end
		
		searching:RegisterAnimationSequence( "Connecting", {
			{
				function ()
					return self.searching:SetAlpha( 0.15, 0 )
				end
			}
		} )
		searchingCopy0:RegisterAnimationSequence( "Connecting", {
			{
				function ()
					return self.searchingCopy0:SetAlpha( 0.75, 0 )
				end,
				function ()
					return self.searchingCopy0:SetAlpha( 0.3, 200 )
				end,
				function ()
					return self.searchingCopy0:SetAlpha( 0.75, 200 )
				end,
				function ()
					return self.searchingCopy0:SetAlpha( 0.3, 200 )
				end,
				function ()
					return self.searchingCopy0:SetAlpha( 0.75, 200 )
				end
			},
			{
				function ()
					return self.searchingCopy0:SetRGBFromInt( 16777215, 0 )
				end
			}
		} )
		searchingCopy1:RegisterAnimationSequence( "Connecting", {
			{
				function ()
					return self.searchingCopy1:SetAlpha( 0.15, 0 )
				end
			},
			{
				function ()
					return self.searchingCopy1:SetRGBFromInt( 16777215, 0 )
				end
			}
		} )
		HoldHint:RegisterAnimationSequence( "Connecting", {
			{
				function ()
					return self.HoldHint:SetAlpha( 1, 0 )
				end,
				function ()
					return self.HoldHint:SetAlpha( 0.5, 400 )
				end,
				function ()
					return self.HoldHint:SetAlpha( 1, 400 )
				end
			}
		} )
		ReleaseHint:RegisterAnimationSequence( "Connecting", {
			{
				function ()
					return self.ReleaseHint:SetAlpha( 0, 0 )
				end
			}
		} )
		NotCompatibleBg:RegisterAnimationSequence( "Connecting", {
			{
				function ()
					return self.NotCompatibleBg:SetAlpha( 0, 0 )
				end
			}
		} )
		NotCompatibleText:RegisterAnimationSequence( "Connecting", {
			{
				function ()
					return self.NotCompatibleText:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.Connecting = function ()
			searching:AnimateLoop( "Connecting" )
			searchingCopy0:AnimateLoop( "Connecting" )
			searchingCopy1:AnimateLoop( "Connecting" )
			HoldHint:AnimateLoop( "Connecting" )
			ReleaseHint:AnimateLoop( "Connecting" )
			NotCompatibleBg:AnimateLoop( "Connecting" )
			NotCompatibleText:AnimateLoop( "Connecting" )
		end
		
		searching:RegisterAnimationSequence( "Locked", {
			{
				function ()
					return self.searching:SetAlpha( 0.15, 0 )
				end
			}
		} )
		searchingCopy0:RegisterAnimationSequence( "Locked", {
			{
				function ()
					return self.searchingCopy0:SetAlpha( 0.15, 0 )
				end
			},
			{
				function ()
					return self.searchingCopy0:SetRGBFromInt( 16777215, 0 )
				end
			}
		} )
		searchingCopy1:RegisterAnimationSequence( "Locked", {
			{
				function ()
					return self.searchingCopy1:SetAlpha( 0.75, 0 )
				end,
				function ()
					return self.searchingCopy1:SetAlpha( 0.25, 200 )
				end,
				function ()
					return self.searchingCopy1:SetAlpha( 0.75, 200 )
				end
			},
			{
				function ()
					return self.searchingCopy1:SetRGBFromInt( 16737637, 0 )
				end,
				function ()
					return self.searchingCopy1:SetRGBFromInt( 16711680, 200 )
				end,
				function ()
					return self.searchingCopy1:SetRGBFromInt( 16737637, 200 )
				end
			}
		} )
		HoldHint:RegisterAnimationSequence( "Locked", {
			{
				function ()
					return self.HoldHint:SetAlpha( 0, 0 )
				end
			}
		} )
		ReleaseHint:RegisterAnimationSequence( "Locked", {
			{
				function ()
					return self.ReleaseHint:SetAlpha( 1, 0 )
				end,
				function ()
					return self.ReleaseHint:SetAlpha( 0.75, 200 )
				end,
				function ()
					return self.ReleaseHint:SetAlpha( 1, 200 )
				end
			}
		} )
		NotCompatibleBg:RegisterAnimationSequence( "Locked", {
			{
				function ()
					return self.NotCompatibleBg:SetAlpha( 0, 0 )
				end
			}
		} )
		NotCompatibleText:RegisterAnimationSequence( "Locked", {
			{
				function ()
					return self.NotCompatibleText:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.Locked = function ()
			searching:AnimateLoop( "Locked" )
			searchingCopy0:AnimateLoop( "Locked" )
			searchingCopy1:AnimateLoop( "Locked" )
			HoldHint:AnimateLoop( "Locked" )
			ReleaseHint:AnimateLoop( "Locked" )
			NotCompatibleBg:AnimateLoop( "Locked" )
			NotCompatibleText:AnimateLoop( "Locked" )
		end
		
		searching:RegisterAnimationSequence( "NotCompatible", {
			{
				function ()
					return self.searching:SetAlpha( 0.15, 0 )
				end
			}
		} )
		searchingCopy0:RegisterAnimationSequence( "NotCompatible", {
			{
				function ()
					return self.searchingCopy0:SetAlpha( 0.15, 0 )
				end
			}
		} )
		searchingCopy1:RegisterAnimationSequence( "NotCompatible", {
			{
				function ()
					return self.searchingCopy1:SetAlpha( 0.15, 0 )
				end
			},
			{
				function ()
					return self.searchingCopy1:SetRGBFromInt( 16777215, 0 )
				end
			}
		} )
		HoldHint:RegisterAnimationSequence( "NotCompatible", {
			{
				function ()
					return self.HoldHint:SetAlpha( 1, 0 )
				end,
				function ()
					return self.HoldHint:SetAlpha( 0.5, 400 )
				end,
				function ()
					return self.HoldHint:SetAlpha( 1, 400 )
				end
			}
		} )
		ReleaseHint:RegisterAnimationSequence( "NotCompatible", {
			{
				function ()
					return self.ReleaseHint:SetAlpha( 0, 0 )
				end
			}
		} )
		NotCompatibleBg:RegisterAnimationSequence( "NotCompatible", {
			{
				function ()
					return self.NotCompatibleBg:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.NotCompatibleBg:SetRGBFromInt( 16777215, 0 )
				end,
				function ()
					return self.NotCompatibleBg:SetRGBFromTable( SWATCHES.HUD.warning, 200 )
				end,
				function ()
					return self.NotCompatibleBg:SetRGBFromInt( 16777215, 200 )
				end,
				function ()
					return self.NotCompatibleBg:SetRGBFromTable( SWATCHES.HUD.warning, 200 )
				end,
				function ()
					return self.NotCompatibleBg:SetRGBFromInt( 16777215, 200 )
				end
			}
		} )
		NotCompatibleText:RegisterAnimationSequence( "NotCompatible", {
			{
				function ()
					return self.NotCompatibleText:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.NotCompatibleText:setText( Engine.Localize( "EQUIPMENT_HACK_HUD_NOT_COMPATIBLE" ), 0 )
				end
			}
		} )
		self._sequences.NotCompatible = function ()
			searching:AnimateLoop( "NotCompatible" )
			searchingCopy0:AnimateLoop( "NotCompatible" )
			searchingCopy1:AnimateLoop( "NotCompatible" )
			HoldHint:AnimateLoop( "NotCompatible" )
			ReleaseHint:AnimateLoop( "NotCompatible" )
			NotCompatibleBg:AnimateLoop( "NotCompatible" )
			NotCompatibleText:AnimateLoop( "NotCompatible" )
		end
		
		searching:RegisterAnimationSequence( "NeedUpgrade", {
			{
				function ()
					return self.searching:SetAlpha( 0.15, 0 )
				end
			}
		} )
		searchingCopy0:RegisterAnimationSequence( "NeedUpgrade", {
			{
				function ()
					return self.searchingCopy0:SetAlpha( 0.15, 0 )
				end
			}
		} )
		searchingCopy1:RegisterAnimationSequence( "NeedUpgrade", {
			{
				function ()
					return self.searchingCopy1:SetAlpha( 0.15, 0 )
				end
			},
			{
				function ()
					return self.searchingCopy1:SetRGBFromInt( 16777215, 0 )
				end
			}
		} )
		HoldHint:RegisterAnimationSequence( "NeedUpgrade", {
			{
				function ()
					return self.HoldHint:SetAlpha( 1, 0 )
				end,
				function ()
					return self.HoldHint:SetAlpha( 0.5, 400 )
				end,
				function ()
					return self.HoldHint:SetAlpha( 1, 400 )
				end
			}
		} )
		ReleaseHint:RegisterAnimationSequence( "NeedUpgrade", {
			{
				function ()
					return self.ReleaseHint:SetAlpha( 0, 0 )
				end
			}
		} )
		NotCompatibleBg:RegisterAnimationSequence( "NeedUpgrade", {
			{
				function ()
					return self.NotCompatibleBg:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.NotCompatibleBg:SetRGBFromInt( 16777215, 0 )
				end,
				function ()
					return self.NotCompatibleBg:SetRGBFromInt( 11403264, 200 )
				end,
				function ()
					return self.NotCompatibleBg:SetRGBFromInt( 16777215, 200 )
				end,
				function ()
					return self.NotCompatibleBg:SetRGBFromInt( 11403264, 200 )
				end,
				function ()
					return self.NotCompatibleBg:SetRGBFromInt( 16777215, 200 )
				end
			}
		} )
		NotCompatibleText:RegisterAnimationSequence( "NeedUpgrade", {
			{
				function ()
					return self.NotCompatibleText:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.NotCompatibleText:setText( Engine.Localize( "EQUIPMENT_HACK_HUD_NEED_UPGRADE" ), 0 )
				end
			}
		} )
		self._sequences.NeedUpgrade = function ()
			searching:AnimateLoop( "NeedUpgrade" )
			searchingCopy0:AnimateLoop( "NeedUpgrade" )
			searchingCopy1:AnimateLoop( "NeedUpgrade" )
			HoldHint:AnimateLoop( "NeedUpgrade" )
			ReleaseHint:AnimateLoop( "NeedUpgrade" )
			NotCompatibleBg:AnimateLoop( "NeedUpgrade" )
			NotCompatibleText:AnimateLoop( "NeedUpgrade" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	self:SubscribeToModel( DataSources.inGame.SP.hackTargetingStatus:GetModel( f4_local1 ), function ()
		if DataSources.inGame.SP.hackTargetingStatus:GetValue( f4_local1 ) ~= nil and DataSources.inGame.SP.hackTargetingStatus:GetValue( f4_local1 ) == "searching" then
			ACTIONS.AnimateSequence( self, "Searching" )
			ACTIONS.AnimateSequenceByElement( self, {
				elementName = "TargetingMarker",
				sequenceName = "Searching",
				elementPath = "TargetingMarker"
			} )
		end
		if DataSources.inGame.SP.hackTargetingStatus:GetValue( f4_local1 ) ~= nil and DataSources.inGame.SP.hackTargetingStatus:GetValue( f4_local1 ) == "connecting" then
			ACTIONS.AnimateSequence( self, "Connecting" )
			ACTIONS.AnimateSequenceByElement( self, {
				elementName = "TargetingMarker",
				sequenceName = "Connecting",
				elementPath = "TargetingMarker"
			} )
		end
		if DataSources.inGame.SP.hackTargetingStatus:GetValue( f4_local1 ) ~= nil and DataSources.inGame.SP.hackTargetingStatus:GetValue( f4_local1 ) == "locked" then
			ACTIONS.AnimateSequence( self, "Locked" )
			ACTIONS.AnimateSequenceByElement( self, {
				elementName = "TargetingMarker",
				sequenceName = "Locked",
				elementPath = "TargetingMarker"
			} )
		end
		if DataSources.inGame.SP.hackTargetingStatus:GetValue( f4_local1 ) ~= nil and DataSources.inGame.SP.hackTargetingStatus:GetValue( f4_local1 ) == "notcompatible" then
			ACTIONS.AnimateSequence( self, "NotCompatible" )
			ACTIONS.AnimateSequenceByElement( self, {
				elementName = "TargetingMarker",
				sequenceName = "Searching",
				elementPath = "TargetingMarker"
			} )
		end
		if DataSources.inGame.SP.hackTargetingStatus:GetValue( f4_local1 ) ~= nil and DataSources.inGame.SP.hackTargetingStatus:GetValue( f4_local1 ) == "needupgrade" then
			ACTIONS.AnimateSequence( self, "NeedUpgrade" )
			ACTIONS.AnimateSequenceByElement( self, {
				elementName = "TargetingMarker",
				sequenceName = "Searching",
				elementPath = "TargetingMarker"
			} )
		end
	end )
	self:SubscribeToModel( DataSources.inGame.SP.hackTargetingPing:GetModel( f4_local1 ), function ()
		if DataSources.inGame.SP.hackTargetingPing:GetValue( f4_local1 ) ~= nil and DataSources.inGame.SP.hackTargetingPing:GetValue( f4_local1 ) == 1 then
			ACTIONS.AnimateSequenceByElement( self, {
				elementName = "TargetingMarker",
				sequenceName = "ConnectingPing",
				elementPath = "TargetingMarker"
			} )
		end
	end )
	PostLoadFunc( self, f4_local1, controller )
	return self
end

MenuBuilder.registerType( "HackTargetingReticle", HackTargetingReticle )
LockTable( _M )
