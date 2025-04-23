local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function HaloDropPrepareSteps( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 800 * _1080p, 0, 140 * _1080p )
	self.id = "HaloDropPrepareSteps"
	self._animationSets = {}
	self._sequences = {}
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local RedGlowM = nil
	
	RedGlowM = LUI.UIImage.new()
	RedGlowM.id = "RedGlowM"
	RedGlowM:SetRGBFromInt( 15612963, 0 )
	RedGlowM:SetAlpha( 0.55, 0 )
	RedGlowM:setImage( RegisterMaterial( "wdg_button_glow_mid_1" ), 0 )
	RedGlowM:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -271, _1080p * -69, _1080p * -53, _1080p * 45 )
	self:addElement( RedGlowM )
	self.RedGlowM = RedGlowM
	
	local RedGlowL = nil
	
	RedGlowL = LUI.UIImage.new()
	RedGlowL.id = "RedGlowL"
	RedGlowL:SetRGBFromInt( 15612963, 0 )
	RedGlowL:SetAlpha( 0.55, 0 )
	RedGlowL:setImage( RegisterMaterial( "wdg_button_glow_left_1" ), 0 )
	RedGlowL:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -369, _1080p * -271, _1080p * -53, _1080p * 45 )
	self:addElement( RedGlowL )
	self.RedGlowL = RedGlowL
	
	local RedGlowR = nil
	
	RedGlowR = LUI.UIImage.new()
	RedGlowR.id = "RedGlowR"
	RedGlowR:SetRGBFromInt( 15612963, 0 )
	RedGlowR:SetAlpha( 0.55, 0 )
	RedGlowR:setImage( RegisterMaterial( "wdg_button_glow_right_1" ), 0 )
	RedGlowR:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -69, _1080p * 29, _1080p * -53, _1080p * 45 )
	self:addElement( RedGlowR )
	self.RedGlowR = RedGlowR
	
	local GreenGlowM = nil
	
	GreenGlowM = LUI.UIImage.new()
	GreenGlowM.id = "GreenGlowM"
	GreenGlowM:SetRGBFromInt( 6399311, 0 )
	GreenGlowM:SetAlpha( 0.55, 0 )
	GreenGlowM:setImage( RegisterMaterial( "wdg_button_glow_mid_1" ), 0 )
	GreenGlowM:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 69, _1080p * 271, _1080p * -53, _1080p * 45 )
	self:addElement( GreenGlowM )
	self.GreenGlowM = GreenGlowM
	
	local GreenGlowL = nil
	
	GreenGlowL = LUI.UIImage.new()
	GreenGlowL.id = "GreenGlowL"
	GreenGlowL:SetRGBFromInt( 6399311, 0 )
	GreenGlowL:SetAlpha( 0.55, 0 )
	GreenGlowL:setImage( RegisterMaterial( "wdg_button_glow_left_1" ), 0 )
	GreenGlowL:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -29, _1080p * 69, _1080p * -53, _1080p * 45 )
	self:addElement( GreenGlowL )
	self.GreenGlowL = GreenGlowL
	
	local GreenGlowR = nil
	
	GreenGlowR = LUI.UIImage.new()
	GreenGlowR.id = "GreenGlowR"
	GreenGlowR:SetRGBFromInt( 6399311, 0 )
	GreenGlowR:SetAlpha( 0.55, 0 )
	GreenGlowR:setImage( RegisterMaterial( "wdg_button_glow_right_1" ), 0 )
	GreenGlowR:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 271, _1080p * 369, _1080p * -53, _1080p * 45 )
	self:addElement( GreenGlowR )
	self.GreenGlowR = GreenGlowR
	
	local RedBox = nil
	
	RedBox = LUI.UIImage.new()
	RedBox.id = "RedBox"
	RedBox:SetRGBFromInt( 15612963, 0 )
	RedBox:SetAlpha( 0.9, 0 )
	RedBox:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -332, _1080p * -8, _1080p * -25, _1080p * 15 )
	self:addElement( RedBox )
	self.RedBox = RedBox
	
	local Image4 = nil
	
	Image4 = LUI.UIImage.new()
	Image4.id = "Image4"
	Image4:setImage( RegisterMaterial( "halo_bot_bar_mid" ), 0 )
	Image4:SetVMin( 0.5, 0 )
	Image4:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -255, _1080p * 257, _1080p * -32, 0 )
	self:addElement( Image4 )
	self.Image4 = Image4
	
	local GreenBox = nil
	
	GreenBox = LUI.UIImage.new()
	GreenBox.id = "GreenBox"
	GreenBox:SetRGBFromTable( SWATCHES.icon.newIcon, 0 )
	GreenBox:SetAlpha( 0.9, 0 )
	GreenBox:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 8, _1080p * 332, _1080p * -25, _1080p * 15 )
	self:addElement( GreenBox )
	self.GreenBox = GreenBox
	
	local Image7 = nil
	
	Image7 = LUI.UIImage.new()
	Image7.id = "Image7"
	Image7:setImage( RegisterMaterial( "halo_bot_bar_mid_box" ), 0 )
	Image7:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -212, _1080p * -192, _1080p * -56, _1080p * -36 )
	self:addElement( Image7 )
	self.Image7 = Image7
	
	local Label0 = nil
	
	Label0 = LUI.UIText.new()
	Label0.id = "Label0"
	Label0:setText( Engine.Localize( "EUROPA_HALO_DROP_CHECK_GEAR" ), 0 )
	Label0:SetFontSize( 16 * _1080p )
	Label0:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	Label0:SetAlignment( LUI.Alignment.Left )
	Label0:SetOptOutRightToLeftAlignmentFlip( true )
	Label0:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -185, 0, _1080p * -53, _1080p * -38 )
	self:addElement( Label0 )
	self.Label0 = Label0
	
	local RedText = nil
	
	RedText = LUI.UIText.new()
	RedText.id = "RedText"
	RedText:setText( Engine.Localize( "EUROPA_HALO_DROP_RED" ), 0 )
	RedText:SetFontSize( 36 * _1080p )
	RedText:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	RedText:SetAlignment( LUI.Alignment.Center )
	RedText:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -302, _1080p * -38, _1080p * -23, _1080p * 13 )
	self:addElement( RedText )
	self.RedText = RedText
	
	local GreenText = nil
	
	GreenText = LUI.UIText.new()
	GreenText.id = "GreenText"
	GreenText:setText( ToUpperCase( Engine.Localize( "EUROPA_HALO_DROP_GREEN" ) ), 0 )
	GreenText:SetFontSize( 36 * _1080p )
	GreenText:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	GreenText:SetAlignment( LUI.Alignment.Center )
	GreenText:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 38, _1080p * 302, _1080p * -24, _1080p * 12 )
	self:addElement( GreenText )
	self.GreenText = GreenText
	
	local CheckGearFill = nil
	
	CheckGearFill = LUI.UIImage.new()
	CheckGearFill.id = "CheckGearFill"
	CheckGearFill:SetAlpha( 0.9, 0 )
	CheckGearFill:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -208, _1080p * -197, _1080p * -52, _1080p * -42 )
	self:addElement( CheckGearFill )
	self.CheckGearFill = CheckGearFill
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		RedGlowM:RegisterAnimationSequence( "CheckGear", {
			{
				function ()
					return self.RedGlowM:SetAlpha( 0.55, 0 )
				end,
				function ()
					return self.RedGlowM:SetAlpha( 0.35, 500 )
				end,
				function ()
					return self.RedGlowM:SetAlpha( 0.55, 500 )
				end
			}
		} )
		RedGlowL:RegisterAnimationSequence( "CheckGear", {
			{
				function ()
					return self.RedGlowL:SetAlpha( 0.55, 0 )
				end,
				function ()
					return self.RedGlowL:SetAlpha( 0.35, 500 )
				end,
				function ()
					return self.RedGlowL:SetAlpha( 0.55, 500 )
				end
			}
		} )
		RedGlowR:RegisterAnimationSequence( "CheckGear", {
			{
				function ()
					return self.RedGlowR:SetAlpha( 0.55, 0 )
				end,
				function ()
					return self.RedGlowR:SetAlpha( 0.35, 500 )
				end,
				function ()
					return self.RedGlowR:SetAlpha( 0.55, 500 )
				end
			}
		} )
		GreenGlowM:RegisterAnimationSequence( "CheckGear", {
			{
				function ()
					return self.GreenGlowM:SetAlpha( 0, 0 )
				end
			}
		} )
		GreenGlowL:RegisterAnimationSequence( "CheckGear", {
			{
				function ()
					return self.GreenGlowL:SetAlpha( 0, 0 )
				end
			}
		} )
		GreenGlowR:RegisterAnimationSequence( "CheckGear", {
			{
				function ()
					return self.GreenGlowR:SetAlpha( 0, 0 )
				end
			}
		} )
		RedBox:RegisterAnimationSequence( "CheckGear", {
			{
				function ()
					return self.RedBox:SetAlpha( 0.8, 0 )
				end,
				function ()
					return self.RedBox:SetAlpha( 0.5, 500 )
				end,
				function ()
					return self.RedBox:SetAlpha( 0.8, 500 )
				end
			}
		} )
		GreenBox:RegisterAnimationSequence( "CheckGear", {
			{
				function ()
					return self.GreenBox:SetAlpha( 0.1, 0 )
				end
			}
		} )
		Image7:RegisterAnimationSequence( "CheckGear", {
			{
				function ()
					return self.Image7:SetRGBFromInt( 15612963, 0 )
				end,
				function ()
					return self.Image7:SetRGBFromInt( 16777215, 100 )
				end,
				function ()
					return self.Image7:SetRGBFromInt( 15612963, 100 )
				end,
				function ()
					return self.Image7:SetRGBFromInt( 16777215, 100 )
				end,
				function ()
					return self.Image7:SetRGBFromInt( 15612963, 100 )
				end,
				function ()
					return self.Image7:SetRGBFromInt( 16777215, 100 )
				end,
				function ()
					return self.Image7:SetRGBFromInt( 15612963, 100 )
				end,
				function ()
					return self.Image7:SetRGBFromInt( 16777215, 100 )
				end,
				function ()
					return self.Image7:SetRGBFromInt( 15612963, 100 )
				end,
				function ()
					return self.Image7:SetRGBFromInt( 16777215, 100 )
				end,
				function ()
					return self.Image7:SetRGBFromInt( 15612963, 100 )
				end
			}
		} )
		Label0:RegisterAnimationSequence( "CheckGear", {
			{
				function ()
					return self.Label0:SetRGBFromInt( 15612963, 0 )
				end,
				function ()
					return self.Label0:SetRGBFromInt( 16777215, 100 )
				end,
				function ()
					return self.Label0:SetRGBFromInt( 15612963, 100 )
				end,
				function ()
					return self.Label0:SetRGBFromInt( 16777215, 100 )
				end,
				function ()
					return self.Label0:SetRGBFromInt( 15612963, 100 )
				end,
				function ()
					return self.Label0:SetRGBFromInt( 16777215, 100 )
				end,
				function ()
					return self.Label0:SetRGBFromInt( 15612963, 100 )
				end,
				function ()
					return self.Label0:SetRGBFromInt( 16777215, 100 )
				end,
				function ()
					return self.Label0:SetRGBFromInt( 15612963, 100 )
				end,
				function ()
					return self.Label0:SetRGBFromInt( 16777215, 100 )
				end,
				function ()
					return self.Label0:SetRGBFromInt( 15612963, 100 )
				end
			}
		} )
		RedText:RegisterAnimationSequence( "CheckGear", {
			{
				function ()
					return self.RedText:SetAlpha( 0.9, 0 )
				end
			}
		} )
		GreenText:RegisterAnimationSequence( "CheckGear", {
			{
				function ()
					return self.GreenText:SetAlpha( 0, 0 )
				end
			}
		} )
		CheckGearFill:RegisterAnimationSequence( "CheckGear", {
			{
				function ()
					return self.CheckGearFill:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.CheckGear = function ()
			RedGlowM:AnimateLoop( "CheckGear" )
			RedGlowL:AnimateLoop( "CheckGear" )
			RedGlowR:AnimateLoop( "CheckGear" )
			GreenGlowM:AnimateLoop( "CheckGear" )
			GreenGlowL:AnimateLoop( "CheckGear" )
			GreenGlowR:AnimateLoop( "CheckGear" )
			RedBox:AnimateLoop( "CheckGear" )
			GreenBox:AnimateLoop( "CheckGear" )
			Image7:AnimateLoop( "CheckGear" )
			Label0:AnimateLoop( "CheckGear" )
			RedText:AnimateLoop( "CheckGear" )
			GreenText:AnimateLoop( "CheckGear" )
			CheckGearFill:AnimateLoop( "CheckGear" )
		end
		
		RedGlowM:RegisterAnimationSequence( "WaitToDrop", {
			{
				function ()
					return self.RedGlowM:SetAlpha( 0.55, 0 )
				end,
				function ()
					return self.RedGlowM:SetAlpha( 0.35, 500 )
				end,
				function ()
					return self.RedGlowM:SetAlpha( 0.55, 500 )
				end
			}
		} )
		RedGlowL:RegisterAnimationSequence( "WaitToDrop", {
			{
				function ()
					return self.RedGlowL:SetAlpha( 0.55, 0 )
				end,
				function ()
					return self.RedGlowL:SetAlpha( 0.35, 500 )
				end,
				function ()
					return self.RedGlowL:SetAlpha( 0.55, 500 )
				end
			}
		} )
		RedGlowR:RegisterAnimationSequence( "WaitToDrop", {
			{
				function ()
					return self.RedGlowR:SetAlpha( 0.55, 0 )
				end,
				function ()
					return self.RedGlowR:SetAlpha( 0.35, 500 )
				end,
				function ()
					return self.RedGlowR:SetAlpha( 0.55, 500 )
				end
			}
		} )
		GreenGlowM:RegisterAnimationSequence( "WaitToDrop", {
			{
				function ()
					return self.GreenGlowM:SetAlpha( 0, 0 )
				end
			}
		} )
		GreenGlowL:RegisterAnimationSequence( "WaitToDrop", {
			{
				function ()
					return self.GreenGlowL:SetAlpha( 0, 0 )
				end
			}
		} )
		GreenGlowR:RegisterAnimationSequence( "WaitToDrop", {
			{
				function ()
					return self.GreenGlowR:SetAlpha( 0, 0 )
				end
			}
		} )
		RedBox:RegisterAnimationSequence( "WaitToDrop", {
			{
				function ()
					return self.RedBox:SetAlpha( 0.8, 0 )
				end,
				function ()
					return self.RedBox:SetAlpha( 0.5, 500 )
				end,
				function ()
					return self.RedBox:SetAlpha( 0.8, 500 )
				end
			}
		} )
		GreenBox:RegisterAnimationSequence( "WaitToDrop", {
			{
				function ()
					return self.GreenBox:SetAlpha( 0.1, 0 )
				end
			}
		} )
		Image7:RegisterAnimationSequence( "WaitToDrop", {
			{
				function ()
					return self.Image7:SetRGBFromInt( 16777215, 0 )
				end
			}
		} )
		Label0:RegisterAnimationSequence( "WaitToDrop", {
			{
				function ()
					return self.Label0:SetRGBFromInt( 16777215, 0 )
				end
			}
		} )
		RedText:RegisterAnimationSequence( "WaitToDrop", {
			{
				function ()
					return self.RedText:SetAlpha( 0.9, 0 )
				end
			}
		} )
		GreenText:RegisterAnimationSequence( "WaitToDrop", {
			{
				function ()
					return self.GreenText:SetAlpha( 0, 0 )
				end
			}
		} )
		CheckGearFill:RegisterAnimationSequence( "WaitToDrop", {
			{
				function ()
					return self.CheckGearFill:SetAlpha( 0.9, 0 )
				end
			}
		} )
		self._sequences.WaitToDrop = function ()
			RedGlowM:AnimateLoop( "WaitToDrop" )
			RedGlowL:AnimateLoop( "WaitToDrop" )
			RedGlowR:AnimateLoop( "WaitToDrop" )
			GreenGlowM:AnimateLoop( "WaitToDrop" )
			GreenGlowL:AnimateLoop( "WaitToDrop" )
			GreenGlowR:AnimateLoop( "WaitToDrop" )
			RedBox:AnimateLoop( "WaitToDrop" )
			GreenBox:AnimateLoop( "WaitToDrop" )
			Image7:AnimateLoop( "WaitToDrop" )
			Label0:AnimateLoop( "WaitToDrop" )
			RedText:AnimateLoop( "WaitToDrop" )
			GreenText:AnimateLoop( "WaitToDrop" )
			CheckGearFill:AnimateLoop( "WaitToDrop" )
		end
		
		RedGlowM:RegisterAnimationSequence( "ReadyToJump", {
			{
				function ()
					return self.RedGlowM:SetAlpha( 0, 0 )
				end
			}
		} )
		RedGlowL:RegisterAnimationSequence( "ReadyToJump", {
			{
				function ()
					return self.RedGlowL:SetAlpha( 0, 0 )
				end
			}
		} )
		RedGlowR:RegisterAnimationSequence( "ReadyToJump", {
			{
				function ()
					return self.RedGlowR:SetAlpha( 0, 0 )
				end
			}
		} )
		GreenGlowM:RegisterAnimationSequence( "ReadyToJump", {
			{
				function ()
					return self.GreenGlowM:SetAlpha( 0.55, 0 )
				end,
				function ()
					return self.GreenGlowM:SetAlpha( 0.15, 100 )
				end,
				function ()
					return self.GreenGlowM:SetAlpha( 0.55, 100 )
				end
			}
		} )
		GreenGlowL:RegisterAnimationSequence( "ReadyToJump", {
			{
				function ()
					return self.GreenGlowL:SetAlpha( 0.55, 0 )
				end,
				function ()
					return self.GreenGlowL:SetAlpha( 0.15, 100 )
				end,
				function ()
					return self.GreenGlowL:SetAlpha( 0.55, 100 )
				end
			}
		} )
		GreenGlowR:RegisterAnimationSequence( "ReadyToJump", {
			{
				function ()
					return self.GreenGlowR:SetAlpha( 0.55, 0 )
				end,
				function ()
					return self.GreenGlowR:SetAlpha( 0.15, 100 )
				end,
				function ()
					return self.GreenGlowR:SetAlpha( 0.55, 100 )
				end
			}
		} )
		RedBox:RegisterAnimationSequence( "ReadyToJump", {
			{
				function ()
					return self.RedBox:SetAlpha( 0.1, 0 )
				end
			}
		} )
		GreenBox:RegisterAnimationSequence( "ReadyToJump", {
			{
				function ()
					return self.GreenBox:SetAlpha( 0.8, 0 )
				end,
				function ()
					return self.GreenBox:SetAlpha( 0.25, 100 )
				end,
				function ()
					return self.GreenBox:SetAlpha( 0.8, 100 )
				end
			}
		} )
		Image7:RegisterAnimationSequence( "ReadyToJump", {
			{
				function ()
					return self.Image7:SetRGBFromInt( 16777215, 0 )
				end
			}
		} )
		Label0:RegisterAnimationSequence( "ReadyToJump", {
			{
				function ()
					return self.Label0:SetRGBFromInt( 16777215, 0 )
				end
			}
		} )
		RedText:RegisterAnimationSequence( "ReadyToJump", {
			{
				function ()
					return self.RedText:SetAlpha( 0, 0 )
				end
			}
		} )
		GreenText:RegisterAnimationSequence( "ReadyToJump", {
			{
				function ()
					return self.GreenText:SetAlpha( 0.9, 0 )
				end
			}
		} )
		CheckGearFill:RegisterAnimationSequence( "ReadyToJump", {
			{
				function ()
					return self.CheckGearFill:SetAlpha( 0.9, 0 )
				end
			}
		} )
		self._sequences.ReadyToJump = function ()
			RedGlowM:AnimateLoop( "ReadyToJump" )
			RedGlowL:AnimateLoop( "ReadyToJump" )
			RedGlowR:AnimateLoop( "ReadyToJump" )
			GreenGlowM:AnimateLoop( "ReadyToJump" )
			GreenGlowL:AnimateLoop( "ReadyToJump" )
			GreenGlowR:AnimateLoop( "ReadyToJump" )
			RedBox:AnimateLoop( "ReadyToJump" )
			GreenBox:AnimateLoop( "ReadyToJump" )
			Image7:AnimateLoop( "ReadyToJump" )
			Label0:AnimateLoop( "ReadyToJump" )
			RedText:AnimateLoop( "ReadyToJump" )
			GreenText:AnimateLoop( "ReadyToJump" )
			CheckGearFill:AnimateLoop( "ReadyToJump" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	self:SubscribeToModel( DataSources.inGame.SP.europa.haloDropState:GetModel( f1_local1 ), function ()
		if DataSources.inGame.SP.europa.haloDropState:GetValue( f1_local1 ) ~= nil and DataSources.inGame.SP.europa.haloDropState:GetValue( f1_local1 ) == 1 then
			ACTIONS.AnimateSequence( self, "CheckGear" )
		end
		if DataSources.inGame.SP.europa.haloDropState:GetValue( f1_local1 ) ~= nil and DataSources.inGame.SP.europa.haloDropState:GetValue( f1_local1 ) == 2 then
			ACTIONS.AnimateSequence( self, "WaitToDrop" )
		end
		if DataSources.inGame.SP.europa.haloDropState:GetValue( f1_local1 ) ~= nil and DataSources.inGame.SP.europa.haloDropState:GetValue( f1_local1 ) == 3 then
			ACTIONS.AnimateSequence( self, "ReadyToJump" )
		end
	end )
	return self
end

MenuBuilder.registerType( "HaloDropPrepareSteps", HaloDropPrepareSteps )
LockTable( _M )
