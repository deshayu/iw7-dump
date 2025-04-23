local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function PostLoadFunc( f1_arg0, f1_arg1, f1_arg2 )
	f1_arg0:SetupInWorldElement( {
		useLeftHandIfAkimbo = true
	} )
	f1_arg0:SetEntityNum( Game.GetOmnvar( "ui_inworld_terminal_wrist_ent" ) )
	f1_arg0:SetEntityTag( "j_shield_le" )
	f1_arg0:SetInWorldScale( 0.01 )
	f1_arg0:SetFollowTagAngles( true )
	f1_arg0:SetTagSpacePosition( 3.05, -2.7, 0.38 )
	f1_arg0:SetTagSpaceRoll( -16 )
	f1_arg0:SetTagSpacePitch( -2.2 )
	f1_arg0:SetTagSpaceYaw( 1 )
	f1_arg0:SetDelayedRender( true )
end

function WristPCTerminalHack( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 700 * _1080p, 0, 175 * _1080p )
	self.id = "WristPCTerminalHack"
	self._animationSets = {}
	self._sequences = {}
	local f2_local1 = controller and controller.controllerIndex
	if not f2_local1 and not Engine.InFrontend() then
		f2_local1 = self:getRootController()
	end
	assert( f2_local1 )
	local f2_local2 = self
	local BorderFluff = nil
	
	BorderFluff = LUI.UIImage.new()
	BorderFluff.id = "BorderFluff"
	BorderFluff:SetRGBFromTable( SWATCHES.wristPc.primaryText, 0 )
	BorderFluff:setImage( RegisterMaterial( "hud_wrist_pc_border" ), 0 )
	BorderFluff:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * -3, _1080p * 3, _1080p * -5, _1080p * 5 )
	self:addElement( BorderFluff )
	self.BorderFluff = BorderFluff
	
	local RightSideMenu = nil
	
	RightSideMenu = LUI.UIImage.new()
	RightSideMenu.id = "RightSideMenu"
	RightSideMenu:SetRGBFromTable( SWATCHES.wristPc.primaryText, 0 )
	RightSideMenu:setImage( RegisterMaterial( "hud_wrist_pc_hacking_rt" ), 0 )
	RightSideMenu:SetAnchorsAndPosition( 1, 0, 0, 0, _1080p * -213.16, _1080p * -4, _1080p * 18.02, _1080p * -22.98 )
	self:addElement( RightSideMenu )
	self.RightSideMenu = RightSideMenu
	
	local RobotClose = nil
	
	RobotClose = LUI.UIImage.new()
	RobotClose.id = "RobotClose"
	RobotClose:SetRGBFromTable( SWATCHES.wristPc.primaryText, 0 )
	RobotClose:setImage( RegisterMaterial( "widg_hack_grid" ), 0 )
	RobotClose:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -458.92, _1080p * -330.92, _1080p * 23.76, _1080p * 151.76 )
	self:addElement( RobotClose )
	self.RobotClose = RobotClose
	
	local StepTwoBoxGlow = nil
	
	StepTwoBoxGlow = LUI.UIImage.new()
	StepTwoBoxGlow.id = "StepTwoBoxGlow"
	StepTwoBoxGlow:SetRGBFromTable( SWATCHES.wristPc.primaryText, 0 )
	StepTwoBoxGlow:SetAlpha( 0, 0 )
	StepTwoBoxGlow:setImage( RegisterMaterial( "hud_wrist_pc_hacking_stage_on" ), 0 )
	StepTwoBoxGlow:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -694, _1080p * -423, _1080p * 49.52, _1080p * 156.37 )
	self:addElement( StepTwoBoxGlow )
	self.StepTwoBoxGlow = StepTwoBoxGlow
	
	local StepTwoBoxCopy0 = nil
	
	StepTwoBoxCopy0 = LUI.UIImage.new()
	StepTwoBoxCopy0.id = "StepTwoBoxCopy0"
	StepTwoBoxCopy0:SetRGBFromTable( SWATCHES.wristPc.primaryText, 0 )
	StepTwoBoxCopy0:setImage( RegisterMaterial( "hud_wrist_pc_hacking_stage_off" ), 0 )
	StepTwoBoxCopy0:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -667, _1080p * -449, _1080p * 57.77, _1080p * 85.02 )
	self:addElement( StepTwoBoxCopy0 )
	self.StepTwoBoxCopy0 = StepTwoBoxCopy0
	
	local StepOneBoxGlow = nil
	
	StepOneBoxGlow = LUI.UIImage.new()
	StepOneBoxGlow.id = "StepOneBoxGlow"
	StepOneBoxGlow:SetRGBFromTable( SWATCHES.wristPc.primaryText, 0 )
	StepOneBoxGlow:SetAlpha( 0, 0 )
	StepOneBoxGlow:setImage( RegisterMaterial( "hud_wrist_pc_hacking_stage_on" ), 0 )
	StepOneBoxGlow:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -694, _1080p * -423, _1080p * 17.02, _1080p * 123.88 )
	self:addElement( StepOneBoxGlow )
	self.StepOneBoxGlow = StepOneBoxGlow
	
	local StepTwoBox = nil
	
	StepTwoBox = LUI.UIImage.new()
	StepTwoBox.id = "StepTwoBox"
	StepTwoBox:SetRGBFromTable( SWATCHES.wristPc.primaryText, 0 )
	StepTwoBox:setImage( RegisterMaterial( "hud_wrist_pc_hacking_stage_off" ), 0 )
	StepTwoBox:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -667, _1080p * -449, _1080p * 89.32, _1080p * 116.57 )
	self:addElement( StepTwoBox )
	self.StepTwoBox = StepTwoBox
	
	local TitleBox = nil
	
	TitleBox = LUI.UIImage.new()
	TitleBox.id = "TitleBox"
	TitleBox:SetRGBFromTable( SWATCHES.wristPc.primaryText, 0 )
	TitleBox:setImage( RegisterMaterial( "hud_wrist_pc_hacking_title" ), 0 )
	TitleBox:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -703, _1080p * -429, _1080p * 17.02, _1080p * 51.27 )
	self:addElement( TitleBox )
	self.TitleBox = TitleBox
	
	local TitleText = nil
	
	TitleText = LUI.UIText.new()
	TitleText.id = "TitleText"
	TitleText:SetRGBFromInt( 0, 0 )
	TitleText:setText( "CONNECTED", 0 )
	TitleText:SetFontSize( 20 * _1080p )
	TitleText:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	TitleText:SetAlignment( LUI.Alignment.Center )
	TitleText:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -567.5, _1080p * -451, _1080p * 23.76, _1080p * 43.95 )
	self:addElement( TitleText )
	self.TitleText = TitleText
	
	local HackingText = nil
	
	HackingText = LUI.UIText.new()
	HackingText.id = "HackingText"
	HackingText:SetRGBFromTable( SWATCHES.wristPc.primaryText, 0 )
	HackingText:SetAlpha( 0.25, 0 )
	HackingText:setText( "HACKING TERMINAL", 0 )
	HackingText:SetFontSize( 14 * _1080p )
	HackingText:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	HackingText:SetAlignment( LUI.Alignment.Left )
	HackingText:SetAnchorsAndPosition( 0, 1, 0, 0, _1080p * 74, _1080p * 242, _1080p * 63.35, _1080p * -97.45 )
	self:addElement( HackingText )
	self.HackingText = HackingText
	
	local HackedText = nil
	
	HackedText = LUI.UIText.new()
	HackedText.id = "HackedText"
	HackedText:SetRGBFromTable( SWATCHES.wristPc.primaryText, 0 )
	HackedText:SetAlpha( 0.25, 0 )
	HackedText:setText( "PACKET RETRIEVED", 0 )
	HackedText:SetFontSize( 14 * _1080p )
	HackedText:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	HackedText:SetAlignment( LUI.Alignment.Left )
	HackedText:SetAnchorsAndPosition( 0, 1, 0, 0, _1080p * 74, _1080p * 242, _1080p * 95.85, _1080p * -97.45 )
	self:addElement( HackedText )
	self.HackedText = HackedText
	
	local RobotCloseCopy0 = nil
	
	RobotCloseCopy0 = LUI.UIImage.new()
	RobotCloseCopy0.id = "RobotCloseCopy0"
	RobotCloseCopy0:SetRGBFromTable( SWATCHES.wristPc.primaryText, 0 )
	RobotCloseCopy0:setImage( RegisterMaterial( "widg_hack_grid" ), 0 )
	RobotCloseCopy0:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -341.16, _1080p * -213.16, _1080p * 23.76, _1080p * 151.76 )
	self:addElement( RobotCloseCopy0 )
	self.RobotCloseCopy0 = RobotCloseCopy0
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		StepTwoBoxGlow:RegisterAnimationSequence( "Hacking", {
			{
				function ()
					return self.StepTwoBoxGlow:SetAlpha( 0, 1760 )
				end,
				function ()
					return self.StepTwoBoxGlow:SetAlpha( 1, 250 )
				end
			}
		} )
		StepOneBoxGlow:RegisterAnimationSequence( "Hacking", {
			{
				function ()
					return self.StepOneBoxGlow:SetAlpha( 0, 1320 )
				end,
				function ()
					return self.StepOneBoxGlow:SetAlpha( 1, 250 )
				end
			}
		} )
		HackingText:RegisterAnimationSequence( "Hacking", {
			{
				function ()
					return self.HackingText:SetAlpha( 0.25, 1320 )
				end,
				function ()
					return self.HackingText:SetAlpha( 1, 250 )
				end
			}
		} )
		HackedText:RegisterAnimationSequence( "Hacking", {
			{
				function ()
					return self.HackedText:SetAlpha( 0.25, 1760 )
				end,
				function ()
					return self.HackedText:SetAlpha( 1, 250 )
				end
			}
		} )
		self._sequences.Hacking = function ()
			StepTwoBoxGlow:AnimateSequence( "Hacking" )
			StepOneBoxGlow:AnimateSequence( "Hacking" )
			HackingText:AnimateSequence( "Hacking" )
			HackedText:AnimateSequence( "Hacking" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	PostLoadFunc( self, f2_local1, controller )
	ACTIONS.AnimateSequence( self, "Hacking" )
	return self
end

MenuBuilder.registerType( "WristPCTerminalHack", WristPCTerminalHack )
LockTable( _M )
