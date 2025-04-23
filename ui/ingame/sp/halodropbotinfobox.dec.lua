local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function HaloDropBotInfoBox( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 600 * _1080p, 0, 100 * _1080p )
	self.id = "HaloDropBotInfoBox"
	self._animationSets = {}
	self._sequences = {}
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local Image4 = nil
	
	Image4 = LUI.UIImage.new()
	Image4.id = "Image4"
	Image4:setImage( RegisterMaterial( "halo_bot_bar_mid" ), 0 )
	Image4:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -256, _1080p * 256, _1080p * -52, _1080p * 12 )
	self:addElement( Image4 )
	self.Image4 = Image4
	
	local Image6 = nil
	
	Image6 = LUI.UIImage.new()
	Image6.id = "Image6"
	Image6:setImage( RegisterMaterial( "halo_bot_bar_mid_02" ), 0 )
	Image6:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -293, _1080p * -245, _1080p * -28, _1080p * -12 )
	self:addElement( Image6 )
	self.Image6 = Image6
	
	local Image6Copy0 = nil
	
	Image6Copy0 = LUI.UIImage.new()
	Image6Copy0.id = "Image6Copy0"
	Image6Copy0:setImage( RegisterMaterial( "halo_bot_bar_mid_02" ), 0 )
	Image6Copy0:SetUMin( 1, 0 )
	Image6Copy0:SetUMax( 0, 0 )
	Image6Copy0:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 245, _1080p * 293, _1080p * -28, _1080p * -12 )
	self:addElement( Image6Copy0 )
	self.Image6Copy0 = Image6Copy0
	
	local Image7 = nil
	
	Image7 = LUI.UIImage.new()
	Image7.id = "Image7"
	Image7:setImage( RegisterMaterial( "halo_bot_bar_mid_box" ), 0 )
	Image7:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -220, _1080p * -200, _1080p * -8, _1080p * 12 )
	self:addElement( Image7 )
	self.Image7 = Image7
	
	local Image7Copy0 = nil
	
	Image7Copy0 = LUI.UIImage.new()
	Image7Copy0.id = "Image7Copy0"
	Image7Copy0:setImage( RegisterMaterial( "halo_bot_bar_mid_box" ), 0 )
	Image7Copy0:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -220, _1080p * -200, _1080p * 22, _1080p * 42 )
	self:addElement( Image7Copy0 )
	self.Image7Copy0 = Image7Copy0
	
	local Label0 = nil
	
	Label0 = LUI.UIText.new()
	Label0.id = "Label0"
	Label0:setText( Engine.Localize( "EUROPA_HALO_DROP_CHECK_GEAR" ), 0 )
	Label0:SetFontSize( 16 * _1080p )
	Label0:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	Label0:SetAlignment( LUI.Alignment.Left )
	Label0:SetOptOutRightToLeftAlignmentFlip( true )
	Label0:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -193, _1080p * -8, _1080p * -6, _1080p * 10 )
	self:addElement( Label0 )
	self.Label0 = Label0
	
	local Label0Copy0 = nil
	
	Label0Copy0 = LUI.UIText.new()
	Label0Copy0.id = "Label0Copy0"
	Label0Copy0:setText( Engine.Localize( "EUROPA_HALO_DROP_EMERGENCY_BACKUP" ), 0 )
	Label0Copy0:SetFontSize( 16 * _1080p )
	Label0Copy0:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	Label0Copy0:SetAlignment( LUI.Alignment.Left )
	Label0Copy0:SetOptOutRightToLeftAlignmentFlip( true )
	Label0Copy0:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -193, _1080p * -8, _1080p * 23, _1080p * 39 )
	self:addElement( Label0Copy0 )
	self.Label0Copy0 = Label0Copy0
	
	local Label1 = nil
	
	Label1 = LUI.UIText.new()
	Label1.id = "Label1"
	Label1:setText( Engine.Localize( "EUROPA_HALO_DROP_TEMP" ), 0 )
	Label1:SetFontSize( 16 * _1080p )
	Label1:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	Label1:SetAlignment( LUI.Alignment.Right )
	Label1:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 122.21, _1080p * 216.21, _1080p * -6, _1080p * 10 )
	self:addElement( Label1 )
	self.Label1 = Label1
	
	local Label1Copy0 = nil
	
	Label1Copy0 = LUI.UIText.new()
	Label1Copy0.id = "Label1Copy0"
	Label1Copy0:SetFontSize( 22 * _1080p )
	Label1Copy0:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	Label1Copy0:SetAlignment( LUI.Alignment.Right )
	Label1Copy0:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 119.21, _1080p * 216.21, _1080p * 20, _1080p * 42 )
	Label1Copy0:SubscribeToModel( DataSources.inGame.SP.europa.haloDropTemp:GetModel( f1_local1 ), function ()
		local f2_local0 = DataSources.inGame.SP.europa.haloDropTemp:GetValue( f1_local1 )
		if f2_local0 ~= nil then
			Label1Copy0:setText( f2_local0, 0 )
		end
	end )
	self:addElement( Label1Copy0 )
	self.Label1Copy0 = Label1Copy0
	
	local BackupBoxFill = nil
	
	BackupBoxFill = LUI.UIImage.new()
	BackupBoxFill.id = "BackupBoxFill"
	BackupBoxFill:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -216, _1080p * -205, _1080p * 26, _1080p * 36 )
	self:addElement( BackupBoxFill )
	self.BackupBoxFill = BackupBoxFill
	
	local CheckGearBoxFill = nil
	
	CheckGearBoxFill = LUI.UIImage.new()
	CheckGearBoxFill.id = "CheckGearBoxFill"
	CheckGearBoxFill:SetAlpha( 0, 0 )
	CheckGearBoxFill:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -216, _1080p * -205, _1080p * -4, _1080p * 6 )
	self:addElement( CheckGearBoxFill )
	self.CheckGearBoxFill = CheckGearBoxFill
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
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
				end
			}
		} )
		CheckGearBoxFill:RegisterAnimationSequence( "CheckGear", {
			{
				function ()
					return self.CheckGearBoxFill:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.CheckGear = function ()
			Image7:AnimateLoop( "CheckGear" )
			Label0:AnimateLoop( "CheckGear" )
			CheckGearBoxFill:AnimateLoop( "CheckGear" )
		end
		
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
		CheckGearBoxFill:RegisterAnimationSequence( "WaitToDrop", {
			{
				function ()
					return self.CheckGearBoxFill:SetAlpha( 1, 0 )
				end
			}
		} )
		self._sequences.WaitToDrop = function ()
			Image7:AnimateSequence( "WaitToDrop" )
			Label0:AnimateSequence( "WaitToDrop" )
			CheckGearBoxFill:AnimateSequence( "WaitToDrop" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	return self
end

MenuBuilder.registerType( "HaloDropBotInfoBox", HaloDropBotInfoBox )
LockTable( _M )
