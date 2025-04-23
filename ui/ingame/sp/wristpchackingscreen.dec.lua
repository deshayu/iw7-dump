local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function PostLoadFunc( f1_arg0, f1_arg1, f1_arg2 )
	f1_arg0:SetupInWorldElement( {
		useLeftHandIfAkimbo = true
	} )
	f1_arg0:AttachToViewModel()
	f1_arg0:SetViewModelTag( "j_shield_le" )
	f1_arg0:SetInWorldScale( 0.01 )
	f1_arg0:SetFollowTagAngles( true )
	f1_arg0:SetTagSpacePosition( 3.05, -2.7, 0.38 )
	f1_arg0:SetTagSpaceRoll( -16 )
	f1_arg0:SetTagSpacePitch( -2.2 )
	f1_arg0:SetTagSpaceYaw( 1 )
	f1_arg0:SetDelayedRender( true )
end

function WristPCHackingScreen( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 700 * _1080p, 0, 175 * _1080p )
	self.id = "WristPCHackingScreen"
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
	
	local RobotSchematic = nil
	
	RobotSchematic = LUI.UIImage.new()
	RobotSchematic.id = "RobotSchematic"
	RobotSchematic:setImage( RegisterMaterial( "hud_wrist_pc_hacking_c6_color" ), 0 )
	RobotSchematic:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -303.35, _1080p * -197.29, _1080p * 16.13, _1080p * 152.02 )
	self:addElement( RobotSchematic )
	self.RobotSchematic = RobotSchematic
	
	local RobotClose = nil
	
	RobotClose = LUI.UIImage.new()
	RobotClose.id = "RobotClose"
	RobotClose:SetRGBFromTable( SWATCHES.wristPc.primaryText, 0 )
	RobotClose:setImage( RegisterMaterial( "hud_wrist_pc_hacking_c6" ), 0 )
	RobotClose:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -440, _1080p * -298.08, _1080p * 23.76, _1080p * 146.28 )
	self:addElement( RobotClose )
	self.RobotClose = RobotClose
	
	local StepThreeBox = nil
	
	StepThreeBox = LUI.UIImage.new()
	StepThreeBox.id = "StepThreeBox"
	StepThreeBox:SetRGBFromTable( SWATCHES.wristPc.primaryText, 0 )
	StepThreeBox:setImage( RegisterMaterial( "hud_wrist_pc_hacking_stage_on" ), 0 )
	StepThreeBox:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -694, _1080p * -423, _1080p * 81, _1080p * 187 )
	self:addElement( StepThreeBox )
	self.StepThreeBox = StepThreeBox
	
	local StepTwoBox = nil
	
	StepTwoBox = LUI.UIImage.new()
	StepTwoBox.id = "StepTwoBox"
	StepTwoBox:SetRGBFromTable( SWATCHES.wristPc.primaryText, 0 )
	StepTwoBox:setImage( RegisterMaterial( "hud_wrist_pc_hacking_stage_on" ), 0 )
	StepTwoBox:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -694, _1080p * -423, _1080p * 49, _1080p * 155 )
	self:addElement( StepTwoBox )
	self.StepTwoBox = StepTwoBox
	
	local StepOneBox = nil
	
	StepOneBox = LUI.UIImage.new()
	StepOneBox.id = "StepOneBox"
	StepOneBox:SetRGBFromTable( SWATCHES.wristPc.primaryText, 0 )
	StepOneBox:setImage( RegisterMaterial( "hud_wrist_pc_hacking_stage_on" ), 0 )
	StepOneBox:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -694, _1080p * -423, _1080p * 17, _1080p * 123 )
	self:addElement( StepOneBox )
	self.StepOneBox = StepOneBox
	
	local StepThreeText = nil
	
	StepThreeText = LUI.UIImage.new()
	StepThreeText.id = "StepThreeText"
	StepThreeText:SetRGBFromTable( SWATCHES.wristPc.primaryText, 0 )
	StepThreeText:setImage( RegisterMaterial( "hud_wrist_pc_hacking_phase_3_text" ), 0 )
	StepThreeText:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 68, _1080p * 244, _1080p * 127, _1080p * 143 )
	self:addElement( StepThreeText )
	self.StepThreeText = StepThreeText
	
	local StepTwoText = nil
	
	StepTwoText = LUI.UIImage.new()
	StepTwoText.id = "StepTwoText"
	StepTwoText:SetRGBFromTable( SWATCHES.wristPc.primaryText, 0 )
	StepTwoText:setImage( RegisterMaterial( "hud_wrist_pc_hacking_phase_2_text" ), 0 )
	StepTwoText:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 68, _1080p * 244, _1080p * 95, _1080p * 111 )
	self:addElement( StepTwoText )
	self.StepTwoText = StepTwoText
	
	local StepOneText = nil
	
	StepOneText = LUI.UIImage.new()
	StepOneText.id = "StepOneText"
	StepOneText:SetRGBFromTable( SWATCHES.wristPc.primaryText, 0 )
	StepOneText:setImage( RegisterMaterial( "hud_wrist_pc_hacking_phase_1_text" ), 0 )
	StepOneText:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 68, _1080p * 244, _1080p * 63, _1080p * 79 )
	self:addElement( StepOneText )
	self.StepOneText = StepOneText
	
	local TitleBox = nil
	
	TitleBox = LUI.UIImage.new()
	TitleBox.id = "TitleBox"
	TitleBox:SetRGBFromTable( SWATCHES.wristPc.primaryText, 0 )
	TitleBox:setImage( RegisterMaterial( "hud_wrist_pc_hacking_title" ), 0 )
	TitleBox:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -703, _1080p * -429, _1080p * 17.02, _1080p * 51.27 )
	self:addElement( TitleBox )
	self.TitleBox = TitleBox
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		RobotClose:RegisterAnimationSequence( "Searching", {
			{
				function ()
					return self.RobotClose:SetRGBFromTable( SWATCHES.wristPc.primaryText, 0 )
				end
			}
		} )
		StepThreeBox:RegisterAnimationSequence( "Searching", {
			{
				function ()
					return self.StepThreeBox:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.StepThreeBox:setImage( RegisterMaterial( "hud_wrist_pc_hacking_stage_off" ), 0 )
				end
			}
		} )
		StepTwoBox:RegisterAnimationSequence( "Searching", {
			{
				function ()
					return self.StepTwoBox:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.StepTwoBox:setImage( RegisterMaterial( "hud_wrist_pc_hacking_stage_off" ), 0 )
				end
			}
		} )
		StepOneBox:RegisterAnimationSequence( "Searching", {
			{
				function ()
					return self.StepOneBox:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.StepOneBox:setImage( RegisterMaterial( "hud_wrist_pc_hacking_stage_on" ), 0 )
				end
			}
		} )
		StepThreeText:RegisterAnimationSequence( "Searching", {
			{
				function ()
					return self.StepThreeText:SetAlpha( 0.5, 0 )
				end
			}
		} )
		StepTwoText:RegisterAnimationSequence( "Searching", {
			{
				function ()
					return self.StepTwoText:SetAlpha( 0.5, 0 )
				end
			}
		} )
		StepOneText:RegisterAnimationSequence( "Searching", {
			{
				function ()
					return self.StepOneText:SetAlpha( 1, 0 )
				end
			}
		} )
		self._sequences.Searching = function ()
			RobotClose:AnimateSequence( "Searching" )
			StepThreeBox:AnimateSequence( "Searching" )
			StepTwoBox:AnimateSequence( "Searching" )
			StepOneBox:AnimateSequence( "Searching" )
			StepThreeText:AnimateSequence( "Searching" )
			StepTwoText:AnimateSequence( "Searching" )
			StepOneText:AnimateSequence( "Searching" )
		end
		
		RobotClose:RegisterAnimationSequence( "Connecting", {
			{
				function ()
					return self.RobotClose:SetRGBFromTable( SWATCHES.wristPc.primaryText, 0 )
				end
			}
		} )
		StepThreeBox:RegisterAnimationSequence( "Connecting", {
			{
				function ()
					return self.StepThreeBox:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.StepThreeBox:setImage( RegisterMaterial( "hud_wrist_pc_hacking_stage_off" ), 0 )
				end
			}
		} )
		StepTwoBox:RegisterAnimationSequence( "Connecting", {
			{
				function ()
					return self.StepTwoBox:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.StepTwoBox:setImage( RegisterMaterial( "hud_wrist_pc_hacking_stage_on" ), 0 )
				end
			}
		} )
		StepOneBox:RegisterAnimationSequence( "Connecting", {
			{
				function ()
					return self.StepOneBox:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.StepOneBox:setImage( RegisterMaterial( "hud_wrist_pc_hacking_stage_on" ), 0 )
				end
			}
		} )
		StepThreeText:RegisterAnimationSequence( "Connecting", {
			{
				function ()
					return self.StepThreeText:SetAlpha( 0.5, 0 )
				end
			}
		} )
		StepTwoText:RegisterAnimationSequence( "Connecting", {
			{
				function ()
					return self.StepTwoText:SetAlpha( 1, 0 )
				end
			}
		} )
		StepOneText:RegisterAnimationSequence( "Connecting", {
			{
				function ()
					return self.StepOneText:SetAlpha( 1, 0 )
				end
			}
		} )
		self._sequences.Connecting = function ()
			RobotClose:AnimateSequence( "Connecting" )
			StepThreeBox:AnimateSequence( "Connecting" )
			StepTwoBox:AnimateSequence( "Connecting" )
			StepOneBox:AnimateSequence( "Connecting" )
			StepThreeText:AnimateSequence( "Connecting" )
			StepTwoText:AnimateSequence( "Connecting" )
			StepOneText:AnimateSequence( "Connecting" )
		end
		
		RobotClose:RegisterAnimationSequence( "Locked", {
			{
				function ()
					return self.RobotClose:SetRGBFromInt( 16731904, 0 )
				end,
				function ()
					return self.RobotClose:SetRGBFromInt( 6561536, 50 )
				end,
				function ()
					return self.RobotClose:SetRGBFromInt( 16731904, 50 )
				end
			}
		} )
		StepThreeBox:RegisterAnimationSequence( "Locked", {
			{
				function ()
					return self.StepThreeBox:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.StepThreeBox:setImage( RegisterMaterial( "hud_wrist_pc_hacking_stage_on" ), 0 )
				end
			}
		} )
		StepTwoBox:RegisterAnimationSequence( "Locked", {
			{
				function ()
					return self.StepTwoBox:SetAlpha( 1, 0 )
				end
			}
		} )
		StepThreeText:RegisterAnimationSequence( "Locked", {
			{
				function ()
					return self.StepThreeText:SetAlpha( 1, 0 )
				end
			}
		} )
		self._sequences.Locked = function ()
			RobotClose:AnimateLoop( "Locked" )
			StepThreeBox:AnimateLoop( "Locked" )
			StepTwoBox:AnimateLoop( "Locked" )
			StepThreeText:AnimateLoop( "Locked" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	self:SubscribeToModel( DataSources.inGame.SP.hackTargetingStatus:GetModel( f2_local1 ), function ()
		if DataSources.inGame.SP.hackTargetingStatus:GetValue( f2_local1 ) ~= nil and DataSources.inGame.SP.hackTargetingStatus:GetValue( f2_local1 ) == "searching" then
			ACTIONS.AnimateSequence( self, "Searching" )
		end
		if DataSources.inGame.SP.hackTargetingStatus:GetValue( f2_local1 ) ~= nil and DataSources.inGame.SP.hackTargetingStatus:GetValue( f2_local1 ) == "connecting" then
			ACTIONS.AnimateSequence( self, "Connecting" )
		end
		if DataSources.inGame.SP.hackTargetingStatus:GetValue( f2_local1 ) ~= nil and DataSources.inGame.SP.hackTargetingStatus:GetValue( f2_local1 ) == "locked" then
			ACTIONS.AnimateSequence( self, "Locked" )
		end
	end )
	PostLoadFunc( self, f2_local1, controller )
	return self
end

MenuBuilder.registerType( "WristPCHackingScreen", WristPCHackingScreen )
LockTable( _M )
