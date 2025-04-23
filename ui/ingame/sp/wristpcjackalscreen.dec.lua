local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function PostLoadFunc( f1_arg0, f1_arg1, f1_arg2 )
	f1_arg0:SetupInWorldElement( {
		useLeftHandIfAkimbo = true
	} )
	f1_arg0:AttachToViewModel()
	f1_arg0:SetViewModelTag( "j_shield_le" )
	f1_arg0:SetInWorldScale( 0.02 )
	f1_arg0:SetFollowTagAngles( true )
	f1_arg0:SetTagSpacePosition( 3, -2.7, 0.48 )
	f1_arg0:SetTagSpaceRoll( -16 )
	f1_arg0:SetTagSpacePitch( -2.2 )
	f1_arg0:SetTagSpaceYaw( 1 )
	f1_arg0:SetDelayedRender( true )
end

function WristPcJackalScreen( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 300 * _1080p, 0, 75 * _1080p )
	self.id = "WristPcJackalScreen"
	self._animationSets = {}
	self._sequences = {}
	local f2_local1 = controller and controller.controllerIndex
	if not f2_local1 and not Engine.InFrontend() then
		f2_local1 = self:getRootController()
	end
	assert( f2_local1 )
	local f2_local2 = self
	local Border = nil
	
	Border = LUI.UIBorder.new( {
		borderThicknessLeft = _1080p * 1,
		borderThicknessRight = _1080p * 1,
		borderThicknessTop = _1080p * 1,
		borderThicknessBottom = _1080p * 1
	} )
	Border.id = "Border"
	Border:SetRGBFromTable( SWATCHES.wristPc.overlay, 0 )
	Border:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * 21, _1080p * -182, _1080p * 58.5, _1080p * -11.5 )
	self:addElement( Border )
	self.Border = Border
	
	local ShipImage = nil
	
	ShipImage = LUI.UIImage.new()
	ShipImage.id = "ShipImage"
	ShipImage:SetRGBFromTable( SWATCHES.wristPc.primaryText, 0 )
	ShipImage:SetZRotation( 90, 0 )
	ShipImage:SetScale( -0.71, 0 )
	ShipImage:setImage( RegisterMaterial( "hud_jackal_interior_ship_image" ), 0 )
	ShipImage:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 32.29, _1080p * 262.29, _1080p * -200.5, _1080p * 275.5 )
	self:addElement( ShipImage )
	self.ShipImage = ShipImage
	
	local BorderFluff = nil
	
	BorderFluff = LUI.UIImage.new()
	BorderFluff.id = "BorderFluff"
	BorderFluff:SetRGBFromTable( SWATCHES.wristPc.primaryText, 0 )
	BorderFluff:setImage( RegisterMaterial( "hud_wrist_pc_border" ), 0 )
	BorderFluff:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * -3, _1080p * 3, _1080p * -5, _1080p * 5 )
	self:addElement( BorderFluff )
	self.BorderFluff = BorderFluff
	
	local JackalTextSpam = nil
	
	JackalTextSpam = LUI.UIImage.new()
	JackalTextSpam.id = "JackalTextSpam"
	JackalTextSpam:SetRGBFromTable( SWATCHES.wristPc.primaryText, 0 )
	JackalTextSpam:SetScale( -0.65, 0 )
	JackalTextSpam:setImage( RegisterMaterial( "hud_wrist_pc_jackal_02" ), 0 )
	JackalTextSpam:SetAnchorsAndPosition( 1, 0, 0, 0, _1080p * -180, _1080p * 74, _1080p * -96, _1080p * 96 )
	self:addElement( JackalTextSpam )
	self.JackalTextSpam = JackalTextSpam
	
	local JackalConnectedText = nil
	
	JackalConnectedText = LUI.UIImage.new()
	JackalConnectedText.id = "JackalConnectedText"
	JackalConnectedText:SetRGBFromTable( SWATCHES.wristPc.primaryText, 0 )
	JackalConnectedText:SetScale( -0.56, 0 )
	JackalConnectedText:setImage( RegisterMaterial( "hud_wrist_pc_jackal_01" ), 0 )
	JackalConnectedText:SetAnchorsAndPosition( 0, 1, 0, 0, _1080p * -58, _1080p * 180.64, _1080p * -25.5, _1080p * 20.5 )
	self:addElement( JackalConnectedText )
	self.JackalConnectedText = JackalConnectedText
	
	local ArrowButton = nil
	
	ArrowButton = LUI.UIImage.new()
	ArrowButton.id = "ArrowButton"
	ArrowButton:SetRGBFromTable( SWATCHES.wristPc.primaryText, 0 )
	ArrowButton:SetScale( -0.72, 0 )
	ArrowButton:setImage( RegisterMaterial( "hud_wrist_pc_arrow" ), 0 )
	ArrowButton:SetAnchorsAndPosition( 0, 1, 0, 0, _1080p * -8, _1080p * 60, _1080p * 40.5, _1080p * 6.5 )
	self:addElement( ArrowButton )
	self.ArrowButton = ArrowButton
	
	local FireButton = nil
	
	FireButton = LUI.UIImage.new()
	FireButton.id = "FireButton"
	FireButton:SetRGBFromTable( SWATCHES.wristPc.overlay, 0 )
	FireButton:SetScale( -0.17, 0 )
	FireButton:setImage( RegisterMaterial( "ui_default_white" ), 0 )
	FireButton:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 151.01, _1080p * 196.01, _1080p * 53, _1080p * 69 )
	self:addElement( FireButton )
	self.FireButton = FireButton
	
	local FireText = nil
	
	FireText = LUI.UIImage.new()
	FireText.id = "FireText"
	FireText:SetRGBFromTable( SWATCHES.wristPc.secondaryText, 0 )
	FireText:SetScale( -0.47, 0 )
	FireText:setImage( RegisterMaterial( "hud_wrist_pc_jackal_fire_text" ), 0 )
	FireText:SetAnchorsAndPosition( 0, 1, 0, 0, _1080p * 149.51, _1080p * 197.51, _1080p * 52.5, _1080p * -5.5 )
	self:addElement( FireText )
	self.FireText = FireText
	
	local ReadyText1 = nil
	
	ReadyText1 = LUI.UIImage.new()
	ReadyText1.id = "ReadyText1"
	ReadyText1:SetRGBFromTable( SWATCHES.wristPc.primaryText, 0 )
	ReadyText1:setImage( RegisterMaterial( "hud_wrist_pc_jackal_ready_text" ), 0 )
	ReadyText1:SetAnchorsAndPosition( 0, 1, 0, 0, _1080p * 61.32, _1080p * 86.32, _1080p * 21, _1080p * -46 )
	self:addElement( ReadyText1 )
	self.ReadyText1 = ReadyText1
	
	local ReadyText2 = nil
	
	ReadyText2 = LUI.UIImage.new()
	ReadyText2.id = "ReadyText2"
	ReadyText2:SetRGBFromTable( SWATCHES.wristPc.primaryText, 0 )
	ReadyText2:setImage( RegisterMaterial( "hud_wrist_pc_jackal_ready_text" ), 0 )
	ReadyText2:SetAnchorsAndPosition( 0, 1, 0, 0, _1080p * 61.32, _1080p * 86.32, _1080p * 31, _1080p * -36 )
	self:addElement( ReadyText2 )
	self.ReadyText2 = ReadyText2
	
	local ReadyText3 = nil
	
	ReadyText3 = LUI.UIImage.new()
	ReadyText3.id = "ReadyText3"
	ReadyText3:SetRGBFromTable( SWATCHES.wristPc.primaryText, 0 )
	ReadyText3:setImage( RegisterMaterial( "hud_wrist_pc_jackal_ready_text" ), 0 )
	ReadyText3:SetAnchorsAndPosition( 0, 1, 0, 0, _1080p * 61.32, _1080p * 86.32, _1080p * 40.5, _1080p * -26.5 )
	self:addElement( ReadyText3 )
	self.ReadyText3 = ReadyText3
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		Border:RegisterAnimationSequence( "Ready", {
			{
				function ()
					return self.Border:SetAlpha( 0.6, 0 )
				end
			}
		} )
		ArrowButton:RegisterAnimationSequence( "Ready", {
			{
				function ()
					return self.ArrowButton:SetAlpha( 0, 0 )
				end,
				function ()
					return self.ArrowButton:SetAlpha( 1, 100 )
				end
			},
			{
				function ()
					return self.ArrowButton:SetAnchorsAndPosition( 0, 1, 0, 0, _1080p * -8, _1080p * 60, _1080p * 40.5, _1080p * 6.5, 0 )
				end
			}
		} )
		FireButton:RegisterAnimationSequence( "Ready", {
			{
				function ()
					return self.FireButton:SetAlpha( 1, 0 )
				end
			}
		} )
		FireText:RegisterAnimationSequence( "Ready", {
			{
				function ()
					return self.FireText:SetAlpha( 1, 0 )
				end
			}
		} )
		ReadyText1:RegisterAnimationSequence( "Ready", {
			{
				function ()
					return self.ReadyText1:SetAlpha( 0, 0 )
				end,
				function ()
					return self.ReadyText1:SetAlpha( 1, 100 )
				end
			}
		} )
		ReadyText2:RegisterAnimationSequence( "Ready", {
			{
				function ()
					return self.ReadyText2:SetAlpha( 0, 0 )
				end,
				function ()
					return self.ReadyText2:SetAlpha( 1, 100 )
				end
			}
		} )
		ReadyText3:RegisterAnimationSequence( "Ready", {
			{
				function ()
					return self.ReadyText3:SetAlpha( 0, 0 )
				end,
				function ()
					return self.ReadyText3:SetAlpha( 1, 100 )
				end
			}
		} )
		self._sequences.Ready = function ()
			Border:AnimateSequence( "Ready" )
			ArrowButton:AnimateSequence( "Ready" )
			FireButton:AnimateSequence( "Ready" )
			FireText:AnimateSequence( "Ready" )
			ReadyText1:AnimateSequence( "Ready" )
			ReadyText2:AnimateSequence( "Ready" )
			ReadyText3:AnimateSequence( "Ready" )
		end
		
		Border:RegisterAnimationSequence( "Active", {
			{
				function ()
					return self.Border:SetAlpha( 0.6, 0 )
				end
			}
		} )
		ArrowButton:RegisterAnimationSequence( "Active", {
			{
				function ()
					return self.ArrowButton:SetAlpha( 1, 200 )
				end,
				function ()
					return self.ArrowButton:SetAlpha( 1, 330 )
				end,
				function ()
					return self.ArrowButton:SetAlpha( 1, 50 )
				end,
				function ()
					return self.ArrowButton:SetAlpha( 0, 60 )
				end
			},
			{
				function ()
					return self.ArrowButton:SetAnchorsAndPosition( 0, 1, 0, 0, _1080p * -8, _1080p * 60, _1080p * 40.5, _1080p * 6.5, 200 )
				end,
				function ()
					return self.ArrowButton:SetAnchorsAndPosition( 0, 1, 0, 0, _1080p * 80, _1080p * 150, _1080p * 40.5, _1080p * 6.5, 329 )
				end,
				function ()
					return self.ArrowButton:SetAnchorsAndPosition( 0, 1, 0, 0, _1080p * 80, _1080p * 150, _1080p * 40.5, _1080p * 6.5, 50 )
				end
			}
		} )
		FireButton:RegisterAnimationSequence( "Active", {
			{
				function ()
					return self.FireButton:SetAlpha( 1, 0 )
				end,
				function ()
					return self.FireButton:SetAlpha( 1, 920 )
				end,
				function ()
					return self.FireButton:SetAlpha( 0, 10 )
				end,
				function ()
					return self.FireButton:SetAlpha( 0, 80 )
				end,
				function ()
					return self.FireButton:SetAlpha( 1, 10 )
				end,
				function ()
					return self.FireButton:SetAlpha( 1, 80 )
				end,
				function ()
					return self.FireButton:SetAlpha( 0, 10 )
				end,
				function ()
					return self.FireButton:SetAlpha( 0, 80 )
				end,
				function ()
					return self.FireButton:SetAlpha( 1, 10 )
				end,
				function ()
					return self.FireButton:SetAlpha( 1, 80 )
				end,
				function ()
					return self.FireButton:SetAlpha( 0, 10 )
				end,
				function ()
					return self.FireButton:SetAlpha( 0, 90 )
				end,
				function ()
					return self.FireButton:SetAlpha( 1, 10 )
				end
			}
		} )
		FireText:RegisterAnimationSequence( "Active", {
			{
				function ()
					return self.FireText:SetAlpha( 1, 0 )
				end,
				function ()
					return self.FireText:SetAlpha( 1, 920 )
				end,
				function ()
					return self.FireText:SetAlpha( 0, 10 )
				end,
				function ()
					return self.FireText:SetAlpha( 0, 80 )
				end,
				function ()
					return self.FireText:SetAlpha( 1, 10 )
				end,
				function ()
					return self.FireText:SetAlpha( 1, 80 )
				end,
				function ()
					return self.FireText:SetAlpha( 0, 10 )
				end,
				function ()
					return self.FireText:SetAlpha( 0, 80 )
				end,
				function ()
					return self.FireText:SetAlpha( 1, 10 )
				end,
				function ()
					return self.FireText:SetAlpha( 1, 80 )
				end,
				function ()
					return self.FireText:SetAlpha( 0, 10 )
				end,
				function ()
					return self.FireText:SetAlpha( 0, 90 )
				end,
				function ()
					return self.FireText:SetAlpha( 1, 10 )
				end
			}
		} )
		ReadyText1:RegisterAnimationSequence( "Active", {
			{
				function ()
					return self.ReadyText1:SetAlpha( 1, 0 )
				end,
				function ()
					return self.ReadyText1:SetAlpha( 1, 920 )
				end,
				function ()
					return self.ReadyText1:SetAlpha( 0, 10 )
				end,
				function ()
					return self.ReadyText1:SetAlpha( 0, 80 )
				end,
				function ()
					return self.ReadyText1:SetAlpha( 1, 10 )
				end,
				function ()
					return self.ReadyText1:SetAlpha( 1, 80 )
				end,
				function ()
					return self.ReadyText1:SetAlpha( 0, 10 )
				end,
				function ()
					return self.ReadyText1:SetAlpha( 0, 80 )
				end,
				function ()
					return self.ReadyText1:SetAlpha( 1, 10 )
				end,
				function ()
					return self.ReadyText1:SetAlpha( 1, 80 )
				end,
				function ()
					return self.ReadyText1:SetAlpha( 0, 10 )
				end,
				function ()
					return self.ReadyText1:SetAlpha( 0, 90 )
				end,
				function ()
					return self.ReadyText1:SetAlpha( 0, 10 )
				end
			}
		} )
		ReadyText2:RegisterAnimationSequence( "Active", {
			{
				function ()
					return self.ReadyText2:SetAlpha( 1, 0 )
				end,
				function ()
					return self.ReadyText2:SetAlpha( 1, 920 )
				end,
				function ()
					return self.ReadyText2:SetAlpha( 0, 10 )
				end,
				function ()
					return self.ReadyText2:SetAlpha( 0, 80 )
				end,
				function ()
					return self.ReadyText2:SetAlpha( 1, 10 )
				end,
				function ()
					return self.ReadyText2:SetAlpha( 1, 80 )
				end,
				function ()
					return self.ReadyText2:SetAlpha( 0, 10 )
				end,
				function ()
					return self.ReadyText2:SetAlpha( 0, 80 )
				end,
				function ()
					return self.ReadyText2:SetAlpha( 1, 10 )
				end,
				function ()
					return self.ReadyText2:SetAlpha( 1, 80 )
				end,
				function ()
					return self.ReadyText2:SetAlpha( 0, 10 )
				end,
				function ()
					return self.ReadyText2:SetAlpha( 0, 90 )
				end,
				function ()
					return self.ReadyText2:SetAlpha( 0, 10 )
				end
			}
		} )
		ReadyText3:RegisterAnimationSequence( "Active", {
			{
				function ()
					return self.ReadyText3:SetAlpha( 1, 0 )
				end,
				function ()
					return self.ReadyText3:SetAlpha( 1, 920 )
				end,
				function ()
					return self.ReadyText3:SetAlpha( 0, 10 )
				end,
				function ()
					return self.ReadyText3:SetAlpha( 0, 80 )
				end,
				function ()
					return self.ReadyText3:SetAlpha( 1, 10 )
				end,
				function ()
					return self.ReadyText3:SetAlpha( 1, 80 )
				end,
				function ()
					return self.ReadyText3:SetAlpha( 0, 10 )
				end,
				function ()
					return self.ReadyText3:SetAlpha( 0, 80 )
				end,
				function ()
					return self.ReadyText3:SetAlpha( 1, 10 )
				end,
				function ()
					return self.ReadyText3:SetAlpha( 1, 80 )
				end,
				function ()
					return self.ReadyText3:SetAlpha( 0, 10 )
				end,
				function ()
					return self.ReadyText3:SetAlpha( 0, 90 )
				end,
				function ()
					return self.ReadyText3:SetAlpha( 0, 10 )
				end
			}
		} )
		self._sequences.Active = function ()
			Border:AnimateSequence( "Active" )
			ArrowButton:AnimateSequence( "Active" )
			FireButton:AnimateSequence( "Active" )
			FireText:AnimateSequence( "Active" )
			ReadyText1:AnimateSequence( "Active" )
			ReadyText2:AnimateSequence( "Active" )
			ReadyText3:AnimateSequence( "Active" )
		end
		
		Border:RegisterAnimationSequence( "NotReady", {
			{
				function ()
					return self.Border:SetAlpha( 0.6, 0 )
				end
			}
		} )
		ArrowButton:RegisterAnimationSequence( "NotReady", {
			{
				function ()
					return self.ArrowButton:SetAlpha( 0, 0 )
				end
			},
			{
				function ()
					return self.ArrowButton:SetAnchorsAndPosition( 0, 1, 0, 0, _1080p * -8, _1080p * 60, _1080p * 40.5, _1080p * 6.5, 0 )
				end
			}
		} )
		FireButton:RegisterAnimationSequence( "NotReady", {
			{
				function ()
					return self.FireButton:SetAlpha( 1, 0 )
				end
			}
		} )
		FireText:RegisterAnimationSequence( "NotReady", {
			{
				function ()
					return self.FireText:SetAlpha( 1, 0 )
				end
			}
		} )
		ReadyText1:RegisterAnimationSequence( "NotReady", {
			{
				function ()
					return self.ReadyText1:SetAlpha( 0, 0 )
				end
			}
		} )
		ReadyText2:RegisterAnimationSequence( "NotReady", {
			{
				function ()
					return self.ReadyText2:SetAlpha( 0, 0 )
				end
			}
		} )
		ReadyText3:RegisterAnimationSequence( "NotReady", {
			{
				function ()
					return self.ReadyText3:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.NotReady = function ()
			Border:AnimateSequence( "NotReady" )
			ArrowButton:AnimateSequence( "NotReady" )
			FireButton:AnimateSequence( "NotReady" )
			FireText:AnimateSequence( "NotReady" )
			ReadyText1:AnimateSequence( "NotReady" )
			ReadyText2:AnimateSequence( "NotReady" )
			ReadyText3:AnimateSequence( "NotReady" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	self:SubscribeToModel( DataSources.inGame.SP.pearlHarbor.jackalReady:GetModel( f2_local1 ), function ()
		if DataSources.inGame.SP.pearlHarbor.jackalReady:GetValue( f2_local1 ) ~= nil and DataSources.inGame.SP.pearlHarbor.jackalReady:GetValue( f2_local1 ) == 0 then
			ACTIONS.AnimateSequence( self, "NotReady" )
		end
		if DataSources.inGame.SP.pearlHarbor.jackalReady:GetValue( f2_local1 ) ~= nil and DataSources.inGame.SP.pearlHarbor.jackalReady:GetValue( f2_local1 ) == 1 then
			ACTIONS.AnimateSequence( self, "Ready" )
		end
		if DataSources.inGame.SP.pearlHarbor.jackalReady:GetValue( f2_local1 ) ~= nil and DataSources.inGame.SP.pearlHarbor.jackalReady:GetValue( f2_local1 ) == 2 then
			ACTIONS.AnimateSequence( self, "Active" )
		end
	end )
	PostLoadFunc( self, f2_local1, controller )
	return self
end

MenuBuilder.registerType( "WristPcJackalScreen", WristPcJackalScreen )
LockTable( _M )
