local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function CapOpsIntelDetails( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 900 * _1080p, 0, 700 * _1080p )
	self.id = "CapOpsIntelDetails"
	self._animationSets = {}
	self._sequences = {}
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local MediaBoxCopy0 = nil
	
	MediaBoxCopy0 = LUI.UIImage.new()
	MediaBoxCopy0.id = "MediaBoxCopy0"
	MediaBoxCopy0:SetAlpha( 0.85, 0 )
	MediaBoxCopy0:setImage( RegisterMaterial( "hud_captain_computer_media_box" ), 0 )
	MediaBoxCopy0:SetUMin( 0.05, 0 )
	MediaBoxCopy0:SetUMax( 0.96, 0 )
	MediaBoxCopy0:SetVMin( 0.07, 0 )
	MediaBoxCopy0:SetVMax( 0.82, 0 )
	MediaBoxCopy0:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 900, _1080p * 602, _1080p * 700 )
	self:addElement( MediaBoxCopy0 )
	self.MediaBoxCopy0 = MediaBoxCopy0
	
	local UNSALogo = nil
	
	UNSALogo = LUI.UIImage.new()
	UNSALogo.id = "UNSALogo"
	UNSALogo:SetAlpha( 0.04, 0 )
	UNSALogo:setImage( RegisterMaterial( "hud_captain_computer_sato" ), 0 )
	UNSALogo:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 113.94, _1080p * 813.41, _1080p * 206.91, _1080p * 438.91 )
	self:addElement( UNSALogo )
	self.UNSALogo = UNSALogo
	
	local MediaBox = nil
	
	MediaBox = LUI.UIImage.new()
	MediaBox.id = "MediaBox"
	MediaBox:SetAlpha( 0.85, 0 )
	MediaBox:setImage( RegisterMaterial( "hud_captain_computer_media_box" ), 0 )
	MediaBox:SetUMin( 0.01, 0 )
	MediaBox:SetUMax( 0.99, 0 )
	MediaBox:SetVMin( 0.05, 0 )
	MediaBox:SetVMax( 0.99, 0 )
	MediaBox:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 900, 0, _1080p * 622 )
	self:addElement( MediaBox )
	self.MediaBox = MediaBox
	
	local ButtonHolderCopy0 = nil
	
	ButtonHolderCopy0 = LUI.UIImage.new()
	ButtonHolderCopy0.id = "ButtonHolderCopy0"
	ButtonHolderCopy0:SetRGBFromInt( 3947581, 0 )
	ButtonHolderCopy0:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 900, 0, _1080p * 30 )
	self:addElement( ButtonHolderCopy0 )
	self.ButtonHolderCopy0 = ButtonHolderCopy0
	
	local ButtonHolderCopy2 = nil
	
	ButtonHolderCopy2 = LUI.UIImage.new()
	ButtonHolderCopy2.id = "ButtonHolderCopy2"
	ButtonHolderCopy2:SetRGBFromInt( 5526870, 0 )
	ButtonHolderCopy2:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 17, 0, _1080p * 30 )
	self:addElement( ButtonHolderCopy2 )
	self.ButtonHolderCopy2 = ButtonHolderCopy2
	
	local Title = nil
	
	Title = LUI.UIText.new()
	Title.id = "Title"
	Title:SetFontSize( 36 * _1080p )
	Title:SetFont( FONTS.GetFont( FONTS.MainExtended.File ) )
	Title:SetAlignment( LUI.Alignment.Left )
	Title:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 27.35, _1080p * -45.65, _1080p * 615, _1080p * 651 )
	Title:SubscribeToModelThroughElement( self, "title", function ()
		local f2_local0 = self:GetDataSource()
		f2_local0 = f2_local0.title:GetValue( f1_local1 )
		if f2_local0 ~= nil then
			Title:setText( f2_local0, 0 )
		end
	end )
	self:addElement( Title )
	self.Title = Title
	
	local UNSANameCard = nil
	
	UNSANameCard = LUI.UIImage.new()
	UNSANameCard.id = "UNSANameCard"
	UNSANameCard:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 123.85, _1080p * 757.85, _1080p * 198.74, _1080p * 414.2 )
	UNSANameCard:SubscribeToModelThroughElement( self, "idImage", function ()
		local f3_local0 = self:GetDataSource()
		f3_local0 = f3_local0.idImage:GetValue( f1_local1 )
		if f3_local0 ~= nil then
			UNSANameCard:setImage( RegisterMaterial( f3_local0 ), 0 )
		end
	end )
	self:addElement( UNSANameCard )
	self.UNSANameCard = UNSANameCard
	
	local Image0 = nil
	
	Image0 = LUI.UIImage.new()
	Image0.id = "Image0"
	Image0:SetRGBFromInt( 3355443, 0 )
	Image0:SetAlpha( 0.6, 0 )
	Image0:SetUseAA( true )
	Image0:SetAnchorsAndPosition( 0, 0, 1, 0, _1080p * 27.35, _1080p * -24, _1080p * -151, _1080p * -98 )
	self:addElement( Image0 )
	self.Image0 = Image0
	
	local Repeat = nil
	
	Repeat = LUI.UIImage.new()
	Repeat.id = "Repeat"
	Repeat:SetRGBFromInt( 10921638, 0 )
	Repeat:SetZRotation( 90, 0 )
	Repeat:setImage( RegisterMaterial( "hud_arrow" ), 0 )
	Repeat:SetAnchorsAndPosition( 0, 1, 1, 0, _1080p * 71.87, _1080p * 99.87, _1080p * -139, _1080p * -111 )
	self:addElement( Repeat )
	self.Repeat = Repeat
	
	local CommanderImage = nil
	
	CommanderImage = LUI.UIImage.new()
	CommanderImage.id = "CommanderImage"
	CommanderImage:SetGlitchEnabled( true )
	CommanderImage:SetGlitchAmount( 0, 0 )
	CommanderImage:SetGlitchBlockWidth( 50, 0 )
	CommanderImage:SetGlitchBlockHeight( 50, 0 )
	CommanderImage:SetGlitchDistortionRange( 16, 0 )
	CommanderImage:SetGlitchScanlinePitch( 1, 0 )
	CommanderImage:SetGlitchMaskPitch( 1, 0 )
	CommanderImage:SetAnchorsAndPosition( 0, 1, 0, 0, _1080p * 615.35, _1080p * 752.19, _1080p * 257.09, _1080p * -311.26 )
	CommanderImage:SubscribeToModelThroughElement( self, "repImage", function ()
		local f4_local0 = self:GetDataSource()
		f4_local0 = f4_local0.repImage:GetValue( f1_local1 )
		if f4_local0 ~= nil then
			CommanderImage:setImage( RegisterMaterial( f4_local0 ), 0 )
		end
	end )
	self:addElement( CommanderImage )
	self.CommanderImage = CommanderImage
	
	local Audio = nil
	
	Audio = LUI.UIImage.new()
	Audio.id = "Audio"
	Audio:SetAlpha( 0.25, 0 )
	Audio:SetGlitchEnabled( true )
	Audio:SetGlitchAmount( 0, 0 )
	Audio:SetGlitchBlockWidth( 50, 0 )
	Audio:SetGlitchBlockHeight( 50, 0 )
	Audio:SetGlitchDistortionRange( 16, 0 )
	Audio:SetGlitchScanlinePitch( 1, 0 )
	Audio:SetGlitchMaskPitch( 1, 0 )
	Audio:setImage( RegisterMaterial( "wdg_commander_audio" ), 0 )
	Audio:SetAnchorsAndPosition( 1, 0, 1, 0, _1080p * -545.81, _1080p * -297.8, _1080p * -352.47, _1080p * -308.06 )
	self:addElement( Audio )
	self.Audio = Audio
	
	local PlaybackBar = nil
	
	PlaybackBar = LUI.UIImage.new()
	PlaybackBar.id = "PlaybackBar"
	PlaybackBar:SetRGBFromInt( 10921638, 0 )
	PlaybackBar:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 102.12, _1080p * 863, _1080p * 570.38, _1080p * 579.63 )
	self:addElement( PlaybackBar )
	self.PlaybackBar = PlaybackBar
	
	local PlaybackTick = nil
	
	PlaybackTick = LUI.UIImage.new()
	PlaybackTick.id = "PlaybackTick"
	PlaybackTick:SetAnchors( 0, 1, 0, 1, 0 )
	PlaybackTick:SetTop( _1080p * 565.03, 0 )
	PlaybackTick:SetBottom( _1080p * 584.97, 0 )
	PlaybackTick:SetRGBFromInt( 15132390, 0 )
	PlaybackTick:SubscribeToModel( DataSources.inGame.SP.shipCrib.capopsMediaTime:GetModel( f1_local1 ), function ()
		local f5_local0 = DataSources.inGame.SP.shipCrib.capopsMediaTime:GetValue( f1_local1 )
		if f5_local0 ~= nil then
			PlaybackTick:SetLeft( _1080p * Add( Multiply( f5_local0, 750.46 ), 103.89 ), 0 )
		end
	end )
	PlaybackTick:SubscribeToModel( DataSources.inGame.SP.shipCrib.capopsMediaTime:GetModel( f1_local1 ), function ()
		local f6_local0 = DataSources.inGame.SP.shipCrib.capopsMediaTime:GetValue( f1_local1 )
		if f6_local0 ~= nil then
			PlaybackTick:SetRight( _1080p * Add( Multiply( f6_local0, 749.96 ), 109.89 ), 0 )
		end
	end )
	self:addElement( PlaybackTick )
	self.PlaybackTick = PlaybackTick
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		UNSALogo:RegisterAnimationSequence( "ShowAudioFluff", {
			{
				function ()
					return self.UNSALogo:SetAlpha( 0, 0 )
				end
			}
		} )
		UNSANameCard:RegisterAnimationSequence( "ShowAudioFluff", {
			{
				function ()
					return self.UNSANameCard:SetAlpha( 1, 0 )
				end
			}
		} )
		CommanderImage:RegisterAnimationSequence( "ShowAudioFluff", {
			{
				function ()
					return self.CommanderImage:SetAlpha( 1, 0 )
				end
			}
		} )
		Audio:RegisterAnimationSequence( "ShowAudioFluff", {
			{
				function ()
					return self.Audio:SetAlpha( 0.1, 0 )
				end
			},
			{
				function ()
					return self.Audio:SetAnchorsAndPosition( 1, 0, 1, 0, _1080p * -541.44, _1080p * -293.44, _1080p * -355.68, _1080p * -311.26, 0 )
				end
			}
		} )
		self._sequences.ShowAudioFluff = function ()
			UNSALogo:AnimateSequence( "ShowAudioFluff" )
			UNSANameCard:AnimateSequence( "ShowAudioFluff" )
			CommanderImage:AnimateSequence( "ShowAudioFluff" )
			Audio:AnimateSequence( "ShowAudioFluff" )
		end
		
		UNSALogo:RegisterAnimationSequence( "ShowVideo", {
			{
				function ()
					return self.UNSALogo:SetAlpha( 0.04, 0 )
				end
			}
		} )
		UNSANameCard:RegisterAnimationSequence( "ShowVideo", {
			{
				function ()
					return self.UNSANameCard:SetAlpha( 0, 0 )
				end
			}
		} )
		CommanderImage:RegisterAnimationSequence( "ShowVideo", {
			{
				function ()
					return self.CommanderImage:SetAlpha( 0, 0 )
				end
			}
		} )
		Audio:RegisterAnimationSequence( "ShowVideo", {
			{
				function ()
					return self.Audio:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.ShowVideo = function ()
			UNSALogo:AnimateSequence( "ShowVideo" )
			UNSANameCard:AnimateSequence( "ShowVideo" )
			CommanderImage:AnimateSequence( "ShowVideo" )
			Audio:AnimateSequence( "ShowVideo" )
		end
		
		UNSALogo:RegisterAnimationSequence( "HideAll", {
			{
				function ()
					return self.UNSALogo:SetAlpha( 0.04, 0 )
				end
			}
		} )
		UNSANameCard:RegisterAnimationSequence( "HideAll", {
			{
				function ()
					return self.UNSANameCard:SetAlpha( 0, 0 )
				end
			}
		} )
		CommanderImage:RegisterAnimationSequence( "HideAll", {
			{
				function ()
					return self.CommanderImage:SetAlpha( 0, 0 )
				end
			}
		} )
		Audio:RegisterAnimationSequence( "HideAll", {
			{
				function ()
					return self.Audio:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.HideAll = function ()
			UNSALogo:AnimateSequence( "HideAll" )
			UNSANameCard:AnimateSequence( "HideAll" )
			CommanderImage:AnimateSequence( "HideAll" )
			Audio:AnimateSequence( "HideAll" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	self:SubscribeToModel( DataSources.inGame.SP.shipCrib.capopsIsAudio:GetModel( f1_local1 ), function ()
		if DataSources.inGame.SP.shipCrib.capopsIsAudio:GetValue( f1_local1 ) ~= nil and DataSources.inGame.SP.shipCrib.capopsIsAudio:GetValue( f1_local1 ) == true then
			ACTIONS.AnimateSequence( self, "ShowAudioFluff" )
		end
		if DataSources.inGame.SP.shipCrib.capopsIsAudio:GetValue( f1_local1 ) ~= nil and DataSources.inGame.SP.shipCrib.capopsIsAudio:GetValue( f1_local1 ) == false then
			ACTIONS.AnimateSequence( self, "ShowVideo" )
		end
	end )
	ACTIONS.AnimateSequence( self, "HideAll" )
	return self
end

MenuBuilder.registerType( "CapOpsIntelDetails", CapOpsIntelDetails )
LockTable( _M )
