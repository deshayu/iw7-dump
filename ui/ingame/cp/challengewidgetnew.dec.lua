local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function challengeWidgetNew( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 530 * _1080p, 0, 237 * _1080p )
	self.id = "challengeWidgetNew"
	self._animationSets = {}
	self._sequences = {}
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local challengeBoxes = nil
	
	challengeBoxes = MenuBuilder.BuildRegisteredType( "challengeBoxes", {
		controllerIndex = f1_local1
	} )
	challengeBoxes.id = "challengeBoxes"
	challengeBoxes:SetAlpha( 0, 0 )
	challengeBoxes.Background:SetAlpha( 0, 0 )
	challengeBoxes.neilFailed:SetAlpha( 0, 0 )
	challengeBoxes.neilPaused:SetAlpha( 0, 0 )
	challengeBoxes.neil:SetAlpha( 0, 0 )
	challengeBoxes:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 42.33, _1080p * 311.33, _1080p * 58.07, _1080p * 177.07 )
	self:addElement( challengeBoxes )
	self.challengeBoxes = challengeBoxes
	
	local challengeProtectPlayerText = nil
	
	challengeProtectPlayerText = LUI.UIText.new()
	challengeProtectPlayerText.id = "challengeProtectPlayerText"
	challengeProtectPlayerText:SetAlpha( 0, 0 )
	challengeProtectPlayerText:setText( Engine.Localize( "CP_CHALLENGES_PROTECT_PLAYER" ), 0 )
	challengeProtectPlayerText:SetFontSize( 22 * _1080p )
	challengeProtectPlayerText:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	challengeProtectPlayerText:SetAlignment( LUI.Alignment.Center )
	challengeProtectPlayerText:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 500, _1080p * 83.88, _1080p * 105.88 )
	self:addElement( challengeProtectPlayerText )
	self.challengeProtectPlayerText = challengeProtectPlayerText
	
	local challengeProtectPlayerNameCopy0 = nil
	
	challengeProtectPlayerNameCopy0 = LUI.UIText.new()
	challengeProtectPlayerNameCopy0.id = "challengeProtectPlayerNameCopy0"
	challengeProtectPlayerNameCopy0:SetRGBFromInt( 1305889, 0 )
	challengeProtectPlayerNameCopy0:SetAlpha( 0, 0 )
	challengeProtectPlayerNameCopy0:SetFontSize( 22 * _1080p )
	challengeProtectPlayerNameCopy0:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	challengeProtectPlayerNameCopy0:SetAlignment( LUI.Alignment.Center )
	challengeProtectPlayerNameCopy0:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 157.98, _1080p * 332.93, _1080p * 113.41, _1080p * 135.41 )
	challengeProtectPlayerNameCopy0:SubscribeToModel( DataSources.inGame.CP.zombies.challenges.challengeTargetPlayerName:GetModel( f1_local1 ), function ()
		local f2_local0 = DataSources.inGame.CP.zombies.challenges.challengeTargetPlayerName:GetValue( f1_local1 )
		if f2_local0 ~= nil then
			challengeProtectPlayerNameCopy0:setText( ToUpperCase( f2_local0 ), 0 )
		end
	end )
	self:addElement( challengeProtectPlayerNameCopy0 )
	self.challengeProtectPlayerNameCopy0 = challengeProtectPlayerNameCopy0
	
	local challengeDesc = nil
	
	challengeDesc = LUI.UIText.new()
	challengeDesc.id = "challengeDesc"
	challengeDesc:SetAlpha( 0, 0 )
	challengeDesc:SetFontSize( 22 * _1080p )
	challengeDesc:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	challengeDesc:SetAlignment( LUI.Alignment.Left )
	challengeDesc:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 168.25, _1080p * 395.59, _1080p * 79.41, _1080p * 101.41 )
	challengeDesc:SubscribeToModel( DataSources.inGame.CP.zombies.challenges.challengeProgressAmountLeft:GetModel( f1_local1 ), function ()
		local f3_local0 = DataSources.inGame.CP.zombies.challenges.challengeProgressAmountLeft:GetValue( f1_local1 )
		if f3_local0 ~= nil then
			challengeDesc:setText( LocalizeIntoString( f3_local0, DataSources.inGame.CP.zombies.challenges.challengeActivateText:GetValue( f1_local1 ) ), 0 )
		end
	end )
	challengeDesc:SubscribeToModel( DataSources.inGame.CP.zombies.challenges.challengeActivateText:GetModel( f1_local1 ), function ()
		local f4_local0 = DataSources.inGame.CP.zombies.challenges.challengeProgressAmountLeft:GetValue( f1_local1 )
		if f4_local0 ~= nil then
			challengeDesc:setText( LocalizeIntoString( f4_local0, DataSources.inGame.CP.zombies.challenges.challengeActivateText:GetValue( f1_local1 ) ), 0 )
		end
	end )
	self:addElement( challengeDesc )
	self.challengeDesc = challengeDesc
	
	local txtNextChallenge = nil
	
	txtNextChallenge = LUI.UIText.new()
	txtNextChallenge.id = "txtNextChallenge"
	txtNextChallenge:SetRGBFromInt( 16776960, 0 )
	txtNextChallenge:SetAlpha( 0, 0 )
	txtNextChallenge:setText( Engine.Localize( "CP_CHALLENGES_NEXTCHALLENGE" ), 0 )
	txtNextChallenge:SetFontSize( 20 * _1080p )
	txtNextChallenge:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	txtNextChallenge:SetAlignment( LUI.Alignment.Center )
	txtNextChallenge:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 176.83, _1080p * 370.92, _1080p * 82.88, _1080p * 102.88 )
	self:addElement( txtNextChallenge )
	self.txtNextChallenge = txtNextChallenge
	
	local txtForTheNext = nil
	
	txtForTheNext = LUI.UIText.new()
	txtForTheNext.id = "txtForTheNext"
	txtForTheNext:SetAlpha( 0, 0 )
	txtForTheNext:setText( ToUpperCase( Engine.Localize( "CP_ZMB_CHALLENGES_FOR_THE_NEXT" ) ), 0 )
	txtForTheNext:SetFontSize( 20 * _1080p )
	txtForTheNext:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	txtForTheNext:SetAlignment( LUI.Alignment.Center )
	txtForTheNext:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 164.21, _1080p * 344.17, _1080p * 144.5, _1080p * 164.5 )
	self:addElement( txtForTheNext )
	self.txtForTheNext = txtForTheNext
	
	local challengeTimer = nil
	
	challengeTimer = MenuBuilder.BuildRegisteredType( "UICountdown", {
		controllerIndex = f1_local1
	} )
	challengeTimer.id = "challengeTimer"
	challengeTimer:SetAlpha( 0, 0 )
	challengeTimer:SetFontSize( 20 * _1080p )
	challengeTimer:SetFont( FONTS.GetFont( FONTS.MainExtended.File ) )
	challengeTimer:SetAlignment( LUI.Alignment.Center )
	challengeTimer:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 304.27, _1080p * 395.73, _1080p * 144.5, _1080p * 164.5 )
	challengeTimer:SubscribeToModel( DataSources.inGame.CP.zombies.challenges.challengeTimer:GetModel( f1_local1 ), function ()
		local f5_local0 = DataSources.inGame.CP.zombies.challenges.challengeTimer:GetValue( f1_local1 )
		if f5_local0 ~= nil then
			challengeTimer:setEndTime( f5_local0 )
		end
	end )
	self:addElement( challengeTimer )
	self.challengeTimer = challengeTimer
	
	local txtChallengePaused = nil
	
	txtChallengePaused = LUI.UIStyledText.new()
	txtChallengePaused.id = "txtChallengePaused"
	txtChallengePaused:SetAlpha( 0, 0 )
	txtChallengePaused:setText( Engine.Localize( "CP_CHALLENGES_PAUSED" ), 0 )
	txtChallengePaused:SetFontSize( 22 * _1080p )
	txtChallengePaused:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	txtChallengePaused:SetAlignment( LUI.Alignment.Center )
	txtChallengePaused:SetShadowMinDistance( 0.3, 0 )
	txtChallengePaused:SetShadowMaxDistance( 1, 0 )
	txtChallengePaused:SetOutlineRGBFromInt( 16742400, 0 )
	txtChallengePaused:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 183.58, _1080p * 370.92, _1080p * 79.88, _1080p * 101.88 )
	self:addElement( txtChallengePaused )
	self.txtChallengePaused = txtChallengePaused
	
	local txtChallengeFailed = nil
	
	txtChallengeFailed = LUI.UIStyledText.new()
	txtChallengeFailed.id = "txtChallengeFailed"
	txtChallengeFailed:SetAlpha( 0, 0 )
	txtChallengeFailed:SetFontSize( 22 * _1080p )
	txtChallengeFailed:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	txtChallengeFailed:SetAlignment( LUI.Alignment.Center )
	txtChallengeFailed:SetShadowMinDistance( 0.3, 0 )
	txtChallengeFailed:SetShadowMaxDistance( 1, 0 )
	txtChallengeFailed:SetOutlineRGBFromInt( 16742400, 0 )
	txtChallengeFailed:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 182.42, _1080p * 370.92, _1080p * 79.88, _1080p * 101.88 )
	txtChallengeFailed:SubscribeToModel( DataSources.inGame.CP.zombies.challenges.challengeFailText:GetModel( f1_local1 ), function ()
		local f6_local0 = DataSources.inGame.CP.zombies.challenges.challengeFailText:GetValue( f1_local1 )
		if f6_local0 ~= nil then
			txtChallengeFailed:setText( f6_local0, 0 )
		end
	end )
	self:addElement( txtChallengeFailed )
	self.txtChallengeFailed = txtChallengeFailed
	
	local txtChallengeComplete = nil
	
	txtChallengeComplete = LUI.UIStyledText.new()
	txtChallengeComplete.id = "txtChallengeComplete"
	txtChallengeComplete:SetAlpha( 0, 0 )
	txtChallengeComplete:SetFontSize( 22 * _1080p )
	txtChallengeComplete:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	txtChallengeComplete:SetAlignment( LUI.Alignment.Center )
	txtChallengeComplete:SetShadowMinDistance( 0.3, 0 )
	txtChallengeComplete:SetShadowMaxDistance( 1, 0 )
	txtChallengeComplete:SetOutlineRGBFromInt( 16742400, 0 )
	txtChallengeComplete:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 182.42, _1080p * 370.92, _1080p * 79.88, _1080p * 102.88 )
	txtChallengeComplete:SubscribeToModel( DataSources.inGame.CP.zombies.challenges.challengeCompleteText:GetModel( f1_local1 ), function ()
		local f7_local0 = DataSources.inGame.CP.zombies.challenges.challengeCompleteText:GetValue( f1_local1 )
		if f7_local0 ~= nil then
			txtChallengeComplete:setText( f7_local0, 0 )
		end
	end )
	self:addElement( txtChallengeComplete )
	self.txtChallengeComplete = txtChallengeComplete
	
	local Backing = nil
	
	Backing = LUI.UIImage.new()
	Backing.id = "Backing"
	Backing:SetRGBFromInt( 0, 0 )
	Backing:SetAlpha( 0, 0 )
	Backing:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 144.92, _1080p * 355.59, _1080p * 172.91, _1080p * 188.52 )
	self:addElement( Backing )
	self.Backing = Backing
	
	local challengeIcon = nil
	
	challengeIcon = LUI.UIImage.new()
	challengeIcon.id = "challengeIcon"
	challengeIcon:SetAlpha( 0, 0 )
	challengeIcon:SetScale( -0.66, 0 )
	challengeIcon:SetUseAA( true )
	challengeIcon:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 85, _1080p * 253, _1080p * -85.51, _1080p * 88.49 )
	challengeIcon:SubscribeToModel( DataSources.inGame.CP.zombies.challenges.challengeIcon:GetModel( f1_local1 ), function ()
		local f8_local0 = DataSources.inGame.CP.zombies.challenges.challengeIcon:GetValue( f1_local1 )
		if f8_local0 ~= nil then
			challengeIcon:setImage( RegisterMaterial( f8_local0 ), 0 )
		end
	end )
	self:addElement( challengeIcon )
	self.challengeIcon = challengeIcon
	
	local playerIcon = nil
	
	playerIcon = LUI.UIImage.new()
	playerIcon.id = "playerIcon"
	playerIcon:SetAlpha( 0, 0 )
	playerIcon:SetScale( -0.38, 0 )
	playerIcon:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 372.93, _1080p * 500.93, _1080p * 55.9, _1080p * 183.9 )
	playerIcon:SubscribeToModel( DataSources.inGame.CP.zombies.challenges.challengeTargetPlayerIcon:GetModel( f1_local1 ), function ()
		local f9_local0 = DataSources.inGame.CP.zombies.challenges.challengeTargetPlayerIcon:GetValue( f1_local1 )
		if f9_local0 ~= nil then
			playerIcon:setImage( RegisterMaterial( f9_local0 ), 0 )
		end
	end )
	self:addElement( playerIcon )
	self.playerIcon = playerIcon
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		challengeBoxes:RegisterAnimationSequence( "challengeTypeAmountActive", {
			{
				function ()
					return self.challengeBoxes:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.challengeBoxes.neil:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.challengeBoxes.Background:SetAlpha( 0.5, 0 )
				end
			}
		} )
		challengeProtectPlayerText:RegisterAnimationSequence( "challengeTypeAmountActive", {
			{
				function ()
					return self.challengeProtectPlayerText:SetAlpha( 0, 0 )
				end
			}
		} )
		challengeDesc:RegisterAnimationSequence( "challengeTypeAmountActive", {
			{
				function ()
					return self.challengeDesc:SetAlpha( 0, 0 )
				end,
				function ()
					return self.challengeDesc:SetAlpha( 1, 240 )
				end
			}
		} )
		txtNextChallenge:RegisterAnimationSequence( "challengeTypeAmountActive", {
			{
				function ()
					return self.txtNextChallenge:SetAlpha( 0, 0 )
				end
			}
		} )
		challengeTimer:RegisterAnimationSequence( "challengeTypeAmountActive", {
			{
				function ()
					return self.challengeTimer:SetAlpha( 0, 500 )
				end,
				function ()
					return self.challengeTimer:SetAlpha( 1, 250 )
				end
			}
		} )
		txtChallengePaused:RegisterAnimationSequence( "challengeTypeAmountActive", {
			{
				function ()
					return self.txtChallengePaused:SetAlpha( 0, 0 )
				end
			}
		} )
		txtChallengeFailed:RegisterAnimationSequence( "challengeTypeAmountActive", {
			{
				function ()
					return self.txtChallengeFailed:SetAlpha( 0, 0 )
				end
			}
		} )
		txtChallengeComplete:RegisterAnimationSequence( "challengeTypeAmountActive", {
			{
				function ()
					return self.txtChallengeComplete:SetAlpha( 0, 0 )
				end
			}
		} )
		Backing:RegisterAnimationSequence( "challengeTypeAmountActive", {
			{
				function ()
					return self.Backing:SetAlpha( 0, 0 )
				end
			}
		} )
		challengeIcon:RegisterAnimationSequence( "challengeTypeAmountActive", {
			{
				function ()
					return self.challengeIcon:SetAlpha( 0, 0 )
				end,
				function ()
					return self.challengeIcon:SetAlpha( 0.85, 240 )
				end
			}
		} )
		playerIcon:RegisterAnimationSequence( "challengeTypeAmountActive", {
			{
				function ()
					return self.playerIcon:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.challengeTypeAmountActive = function ()
			challengeBoxes:AnimateSequence( "challengeTypeAmountActive" )
			challengeProtectPlayerText:AnimateSequence( "challengeTypeAmountActive" )
			challengeDesc:AnimateSequence( "challengeTypeAmountActive" )
			txtNextChallenge:AnimateSequence( "challengeTypeAmountActive" )
			challengeTimer:AnimateSequence( "challengeTypeAmountActive" )
			txtChallengePaused:AnimateSequence( "challengeTypeAmountActive" )
			txtChallengeFailed:AnimateSequence( "challengeTypeAmountActive" )
			txtChallengeComplete:AnimateSequence( "challengeTypeAmountActive" )
			Backing:AnimateSequence( "challengeTypeAmountActive" )
			challengeIcon:AnimateSequence( "challengeTypeAmountActive" )
			playerIcon:AnimateSequence( "challengeTypeAmountActive" )
		end
		
		challengeBoxes:RegisterAnimationSequence( "challengeTypeAmountDeactivate", {
			{
				function ()
					return self.challengeBoxes:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.challengeBoxes.neil:SetAlpha( 1, 0 )
				end
			}
		} )
		challengeProtectPlayerText:RegisterAnimationSequence( "challengeTypeAmountDeactivate", {
			{
				function ()
					return self.challengeProtectPlayerText:SetAlpha( 0, 0 )
				end
			}
		} )
		challengeDesc:RegisterAnimationSequence( "challengeTypeAmountDeactivate", {
			{
				function ()
					return self.challengeDesc:SetAlpha( 1, 0 )
				end,
				function ()
					return self.challengeDesc:SetAlpha( 0, 250 )
				end
			}
		} )
		txtNextChallenge:RegisterAnimationSequence( "challengeTypeAmountDeactivate", {
			{
				function ()
					return self.txtNextChallenge:SetAlpha( 0, 0 )
				end
			}
		} )
		challengeTimer:RegisterAnimationSequence( "challengeTypeAmountDeactivate", {
			{
				function ()
					return self.challengeTimer:SetAlpha( 1, 0 )
				end,
				function ()
					return self.challengeTimer:SetAlpha( 0, 250 )
				end
			}
		} )
		txtChallengePaused:RegisterAnimationSequence( "challengeTypeAmountDeactivate", {
			{
				function ()
					return self.txtChallengePaused:SetAlpha( 0, 0 )
				end
			}
		} )
		txtChallengeFailed:RegisterAnimationSequence( "challengeTypeAmountDeactivate", {
			{
				function ()
					return self.txtChallengeFailed:SetAlpha( 0, 0 )
				end
			}
		} )
		txtChallengeComplete:RegisterAnimationSequence( "challengeTypeAmountDeactivate", {
			{
				function ()
					return self.txtChallengeComplete:SetAlpha( 0, 0 )
				end
			}
		} )
		Backing:RegisterAnimationSequence( "challengeTypeAmountDeactivate", {
			{
				function ()
					return self.Backing:SetAlpha( 0, 0 )
				end
			}
		} )
		challengeIcon:RegisterAnimationSequence( "challengeTypeAmountDeactivate", {
			{
				function ()
					return self.challengeIcon:SetAlpha( 0.85, 0 )
				end,
				function ()
					return self.challengeIcon:SetAlpha( 0, 250 )
				end
			}
		} )
		self._sequences.challengeTypeAmountDeactivate = function ()
			challengeBoxes:AnimateSequence( "challengeTypeAmountDeactivate" )
			challengeProtectPlayerText:AnimateSequence( "challengeTypeAmountDeactivate" )
			challengeDesc:AnimateSequence( "challengeTypeAmountDeactivate" )
			txtNextChallenge:AnimateSequence( "challengeTypeAmountDeactivate" )
			challengeTimer:AnimateSequence( "challengeTypeAmountDeactivate" )
			txtChallengePaused:AnimateSequence( "challengeTypeAmountDeactivate" )
			txtChallengeFailed:AnimateSequence( "challengeTypeAmountDeactivate" )
			txtChallengeComplete:AnimateSequence( "challengeTypeAmountDeactivate" )
			Backing:AnimateSequence( "challengeTypeAmountDeactivate" )
			challengeIcon:AnimateSequence( "challengeTypeAmountDeactivate" )
		end
		
		challengeBoxes:RegisterAnimationSequence( "challengeTypeWave", {
			{
				function ()
					return self.challengeBoxes:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.challengeBoxes.neil:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.challengeBoxes.Background:SetAlpha( 0.5, 0 )
				end
			}
		} )
		challengeProtectPlayerText:RegisterAnimationSequence( "challengeTypeWave", {
			{
				function ()
					return self.challengeProtectPlayerText:SetAlpha( 0, 0 )
				end
			}
		} )
		challengeDesc:RegisterAnimationSequence( "challengeTypeWave", {
			{
				function ()
					return self.challengeDesc:SetAlpha( 0, 0 )
				end,
				function ()
					return self.challengeDesc:SetAlpha( 1, 110 )
				end
			}
		} )
		txtNextChallenge:RegisterAnimationSequence( "challengeTypeWave", {
			{
				function ()
					return self.txtNextChallenge:SetAlpha( 0, 0 )
				end
			}
		} )
		txtForTheNext:RegisterAnimationSequence( "challengeTypeWave", {
			{
				function ()
					return self.txtForTheNext:SetAlpha( 0, 500 )
				end,
				function ()
					return self.txtForTheNext:SetAlpha( 1, 250 )
				end
			}
		} )
		challengeTimer:RegisterAnimationSequence( "challengeTypeWave", {
			{
				function ()
					return self.challengeTimer:SetAlpha( 0, 500 )
				end,
				function ()
					return self.challengeTimer:SetAlpha( 1, 250 )
				end
			}
		} )
		txtChallengePaused:RegisterAnimationSequence( "challengeTypeWave", {
			{
				function ()
					return self.txtChallengePaused:SetAlpha( 0, 0 )
				end
			}
		} )
		txtChallengeFailed:RegisterAnimationSequence( "challengeTypeWave", {
			{
				function ()
					return self.txtChallengeFailed:SetAlpha( 0, 0 )
				end
			}
		} )
		txtChallengeComplete:RegisterAnimationSequence( "challengeTypeWave", {
			{
				function ()
					return self.txtChallengeComplete:SetAlpha( 0, 0 )
				end
			}
		} )
		Backing:RegisterAnimationSequence( "challengeTypeWave", {
			{
				function ()
					return self.Backing:SetAlpha( 0, 0 )
				end
			}
		} )
		challengeIcon:RegisterAnimationSequence( "challengeTypeWave", {
			{
				function ()
					return self.challengeIcon:SetAlpha( 0, 0 )
				end,
				function ()
					return self.challengeIcon:SetAlpha( 0.85, 110 )
				end
			}
		} )
		playerIcon:RegisterAnimationSequence( "challengeTypeWave", {
			{
				function ()
					return self.playerIcon:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.challengeTypeWave = function ()
			challengeBoxes:AnimateSequence( "challengeTypeWave" )
			challengeProtectPlayerText:AnimateSequence( "challengeTypeWave" )
			challengeDesc:AnimateSequence( "challengeTypeWave" )
			txtNextChallenge:AnimateSequence( "challengeTypeWave" )
			txtForTheNext:AnimateSequence( "challengeTypeWave" )
			challengeTimer:AnimateSequence( "challengeTypeWave" )
			txtChallengePaused:AnimateSequence( "challengeTypeWave" )
			txtChallengeFailed:AnimateSequence( "challengeTypeWave" )
			txtChallengeComplete:AnimateSequence( "challengeTypeWave" )
			Backing:AnimateSequence( "challengeTypeWave" )
			challengeIcon:AnimateSequence( "challengeTypeWave" )
			playerIcon:AnimateSequence( "challengeTypeWave" )
		end
		
		challengeBoxes:RegisterAnimationSequence( "challengeWaveDeactivate", {
			{
				function ()
					return self.challengeBoxes:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.challengeBoxes.neil:SetAlpha( 1, 0 )
				end
			}
		} )
		challengeProtectPlayerText:RegisterAnimationSequence( "challengeWaveDeactivate", {
			{
				function ()
					return self.challengeProtectPlayerText:SetAlpha( 0, 240 )
				end
			}
		} )
		challengeDesc:RegisterAnimationSequence( "challengeWaveDeactivate", {
			{
				function ()
					return self.challengeDesc:SetAlpha( 1, 0 )
				end,
				function ()
					return self.challengeDesc:SetAlpha( 0, 240 )
				end
			}
		} )
		txtNextChallenge:RegisterAnimationSequence( "challengeWaveDeactivate", {
			{
				function ()
					return self.txtNextChallenge:SetAlpha( 0, 0 )
				end
			}
		} )
		txtForTheNext:RegisterAnimationSequence( "challengeWaveDeactivate", {
			{
				function ()
					return self.txtForTheNext:SetAlpha( 1, 0 )
				end,
				function ()
					return self.txtForTheNext:SetAlpha( 0, 240 )
				end
			}
		} )
		challengeTimer:RegisterAnimationSequence( "challengeWaveDeactivate", {
			{
				function ()
					return self.challengeTimer:SetAlpha( 1, 0 )
				end,
				function ()
					return self.challengeTimer:SetAlpha( 0, 240 )
				end
			}
		} )
		txtChallengePaused:RegisterAnimationSequence( "challengeWaveDeactivate", {
			{
				function ()
					return self.txtChallengePaused:SetAlpha( 0, 0 )
				end
			}
		} )
		txtChallengeFailed:RegisterAnimationSequence( "challengeWaveDeactivate", {
			{
				function ()
					return self.txtChallengeFailed:SetAlpha( 0, 0 )
				end
			}
		} )
		txtChallengeComplete:RegisterAnimationSequence( "challengeWaveDeactivate", {
			{
				function ()
					return self.txtChallengeComplete:SetAlpha( 0, 0 )
				end
			}
		} )
		Backing:RegisterAnimationSequence( "challengeWaveDeactivate", {
			{
				function ()
					return self.Backing:SetAlpha( 0, 0 )
				end
			}
		} )
		challengeIcon:RegisterAnimationSequence( "challengeWaveDeactivate", {
			{
				function ()
					return self.challengeIcon:SetAlpha( 0.85, 0 )
				end,
				function ()
					return self.challengeIcon:SetAlpha( 0, 240 )
				end
			}
		} )
		self._sequences.challengeWaveDeactivate = function ()
			challengeBoxes:AnimateSequence( "challengeWaveDeactivate" )
			challengeProtectPlayerText:AnimateSequence( "challengeWaveDeactivate" )
			challengeDesc:AnimateSequence( "challengeWaveDeactivate" )
			txtNextChallenge:AnimateSequence( "challengeWaveDeactivate" )
			txtForTheNext:AnimateSequence( "challengeWaveDeactivate" )
			challengeTimer:AnimateSequence( "challengeWaveDeactivate" )
			txtChallengePaused:AnimateSequence( "challengeWaveDeactivate" )
			txtChallengeFailed:AnimateSequence( "challengeWaveDeactivate" )
			txtChallengeComplete:AnimateSequence( "challengeWaveDeactivate" )
			Backing:AnimateSequence( "challengeWaveDeactivate" )
			challengeIcon:AnimateSequence( "challengeWaveDeactivate" )
		end
		
		challengeBoxes:RegisterAnimationSequence( "challengeTypePlayer", {
			{
				function ()
					return self.challengeBoxes:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.challengeBoxes.neil:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.challengeBoxes.Background:SetAlpha( 0.5, 0 )
				end
			}
		} )
		challengeProtectPlayerText:RegisterAnimationSequence( "challengeTypePlayer", {
			{
				function ()
					return self.challengeProtectPlayerText:SetAlpha( 0, 0 )
				end,
				function ()
					return self.challengeProtectPlayerText:SetAlpha( 1, 110 )
				end
			},
			{
				function ()
					return self.challengeProtectPlayerText:SetScale( 0, 0 )
				end,
				function ()
					return self.challengeProtectPlayerText:SetScale( 1.25, 240 )
				end,
				function ()
					return self.challengeProtectPlayerText:SetScale( 0, 240 )
				end
			}
		} )
		challengeProtectPlayerNameCopy0:RegisterAnimationSequence( "challengeTypePlayer", {
			{
				function ()
					return self.challengeProtectPlayerNameCopy0:SetAlpha( 0, 0 )
				end,
				function ()
					return self.challengeProtectPlayerNameCopy0:SetAlpha( 0, 240 )
				end,
				function ()
					return self.challengeProtectPlayerNameCopy0:SetAlpha( 1, 260 )
				end
			},
			{
				function ()
					return self.challengeProtectPlayerNameCopy0:SetScale( 0, 0 )
				end,
				function ()
					return self.challengeProtectPlayerNameCopy0:SetScale( 0, 280 )
				end,
				function ()
					return self.challengeProtectPlayerNameCopy0:SetScale( 0.73, 220 )
				end,
				function ()
					return self.challengeProtectPlayerNameCopy0:SetScale( 0, 170 )
				end
			}
		} )
		challengeDesc:RegisterAnimationSequence( "challengeTypePlayer", {
			{
				function ()
					return self.challengeDesc:SetAlpha( 0, 0 )
				end
			}
		} )
		txtNextChallenge:RegisterAnimationSequence( "challengeTypePlayer", {
			{
				function ()
					return self.txtNextChallenge:SetAlpha( 0, 0 )
				end
			}
		} )
		txtForTheNext:RegisterAnimationSequence( "challengeTypePlayer", {
			{
				function ()
					return self.txtForTheNext:SetAlpha( 0, 500 )
				end,
				function ()
					return self.txtForTheNext:SetAlpha( 1, 240 )
				end
			}
		} )
		challengeTimer:RegisterAnimationSequence( "challengeTypePlayer", {
			{
				function ()
					return self.challengeTimer:SetAlpha( 0, 500 )
				end,
				function ()
					return self.challengeTimer:SetAlpha( 1, 250 )
				end
			}
		} )
		txtChallengePaused:RegisterAnimationSequence( "challengeTypePlayer", {
			{
				function ()
					return self.txtChallengePaused:SetAlpha( 0, 0 )
				end
			}
		} )
		txtChallengeFailed:RegisterAnimationSequence( "challengeTypePlayer", {
			{
				function ()
					return self.txtChallengeFailed:SetAlpha( 0, 0 )
				end
			}
		} )
		txtChallengeComplete:RegisterAnimationSequence( "challengeTypePlayer", {
			{
				function ()
					return self.txtChallengeComplete:SetAlpha( 0, 0 )
				end
			},
			{
				function ()
					return self.txtChallengeComplete:SetScale( 0, 430 )
				end,
				function ()
					return self.txtChallengeComplete:SetScale( 0.41, 170 )
				end
			}
		} )
		Backing:RegisterAnimationSequence( "challengeTypePlayer", {
			{
				function ()
					return self.Backing:SetAlpha( 0, 0 )
				end
			}
		} )
		challengeIcon:RegisterAnimationSequence( "challengeTypePlayer", {
			{
				function ()
					return self.challengeIcon:SetAlpha( 0, 0 )
				end
			}
		} )
		playerIcon:RegisterAnimationSequence( "challengeTypePlayer", {
			{
				function ()
					return self.playerIcon:SetAlpha( 0, 0 )
				end,
				function ()
					return self.playerIcon:SetAlpha( 1, 110 )
				end
			}
		} )
		self._sequences.challengeTypePlayer = function ()
			challengeBoxes:AnimateSequence( "challengeTypePlayer" )
			challengeProtectPlayerText:AnimateSequence( "challengeTypePlayer" )
			challengeProtectPlayerNameCopy0:AnimateSequence( "challengeTypePlayer" )
			challengeDesc:AnimateSequence( "challengeTypePlayer" )
			txtNextChallenge:AnimateSequence( "challengeTypePlayer" )
			txtForTheNext:AnimateSequence( "challengeTypePlayer" )
			challengeTimer:AnimateSequence( "challengeTypePlayer" )
			txtChallengePaused:AnimateSequence( "challengeTypePlayer" )
			txtChallengeFailed:AnimateSequence( "challengeTypePlayer" )
			txtChallengeComplete:AnimateSequence( "challengeTypePlayer" )
			Backing:AnimateSequence( "challengeTypePlayer" )
			challengeIcon:AnimateSequence( "challengeTypePlayer" )
			playerIcon:AnimateSequence( "challengeTypePlayer" )
		end
		
		challengeBoxes:RegisterAnimationSequence( "challengeTypePlayerDeactivate", {
			{
				function ()
					return self.challengeBoxes:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.challengeBoxes.neil:SetAlpha( 1, 0 )
				end
			}
		} )
		challengeProtectPlayerText:RegisterAnimationSequence( "challengeTypePlayerDeactivate", {
			{
				function ()
					return self.challengeProtectPlayerText:SetAlpha( 1, 0 )
				end,
				function ()
					return self.challengeProtectPlayerText:SetAlpha( 0, 240 )
				end
			}
		} )
		challengeProtectPlayerNameCopy0:RegisterAnimationSequence( "challengeTypePlayerDeactivate", {
			{
				function ()
					return self.challengeProtectPlayerNameCopy0:SetAlpha( 1, 0 )
				end,
				function ()
					return self.challengeProtectPlayerNameCopy0:SetAlpha( 0, 240 )
				end
			}
		} )
		challengeDesc:RegisterAnimationSequence( "challengeTypePlayerDeactivate", {
			{
				function ()
					return self.challengeDesc:SetAlpha( 0, 0 )
				end
			}
		} )
		txtNextChallenge:RegisterAnimationSequence( "challengeTypePlayerDeactivate", {
			{
				function ()
					return self.txtNextChallenge:SetAlpha( 0, 0 )
				end
			}
		} )
		txtForTheNext:RegisterAnimationSequence( "challengeTypePlayerDeactivate", {
			{
				function ()
					return self.txtForTheNext:SetAlpha( 1, 0 )
				end,
				function ()
					return self.txtForTheNext:SetAlpha( 0, 240 )
				end
			}
		} )
		challengeTimer:RegisterAnimationSequence( "challengeTypePlayerDeactivate", {
			{
				function ()
					return self.challengeTimer:SetAlpha( 1, 0 )
				end,
				function ()
					return self.challengeTimer:SetAlpha( 0, 240 )
				end
			}
		} )
		txtChallengePaused:RegisterAnimationSequence( "challengeTypePlayerDeactivate", {
			{
				function ()
					return self.txtChallengePaused:SetAlpha( 0, 0 )
				end
			}
		} )
		txtChallengeFailed:RegisterAnimationSequence( "challengeTypePlayerDeactivate", {
			{
				function ()
					return self.txtChallengeFailed:SetAlpha( 0, 0 )
				end
			}
		} )
		txtChallengeComplete:RegisterAnimationSequence( "challengeTypePlayerDeactivate", {
			{
				function ()
					return self.txtChallengeComplete:SetAlpha( 0, 0 )
				end
			}
		} )
		Backing:RegisterAnimationSequence( "challengeTypePlayerDeactivate", {
			{
				function ()
					return self.Backing:SetAlpha( 0, 0 )
				end
			}
		} )
		challengeIcon:RegisterAnimationSequence( "challengeTypePlayerDeactivate", {
			{
				function ()
					return self.challengeIcon:SetAlpha( 0.85, 0 )
				end,
				function ()
					return self.challengeIcon:SetAlpha( 0, 240 )
				end
			}
		} )
		playerIcon:RegisterAnimationSequence( "challengeTypePlayerDeactivate", {
			{
				function ()
					return self.playerIcon:SetAlpha( 1, 0 )
				end,
				function ()
					return self.playerIcon:SetAlpha( 0, 240 )
				end
			}
		} )
		self._sequences.challengeTypePlayerDeactivate = function ()
			challengeBoxes:AnimateSequence( "challengeTypePlayerDeactivate" )
			challengeProtectPlayerText:AnimateSequence( "challengeTypePlayerDeactivate" )
			challengeProtectPlayerNameCopy0:AnimateSequence( "challengeTypePlayerDeactivate" )
			challengeDesc:AnimateSequence( "challengeTypePlayerDeactivate" )
			txtNextChallenge:AnimateSequence( "challengeTypePlayerDeactivate" )
			txtForTheNext:AnimateSequence( "challengeTypePlayerDeactivate" )
			challengeTimer:AnimateSequence( "challengeTypePlayerDeactivate" )
			txtChallengePaused:AnimateSequence( "challengeTypePlayerDeactivate" )
			txtChallengeFailed:AnimateSequence( "challengeTypePlayerDeactivate" )
			txtChallengeComplete:AnimateSequence( "challengeTypePlayerDeactivate" )
			Backing:AnimateSequence( "challengeTypePlayerDeactivate" )
			challengeIcon:AnimateSequence( "challengeTypePlayerDeactivate" )
			playerIcon:AnimateSequence( "challengeTypePlayerDeactivate" )
		end
		
		challengeBoxes:RegisterAnimationSequence( "next_challenge", {
			{
				function ()
					return self.challengeBoxes:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.challengeBoxes.neil:SetAlpha( 1, 0 )
				end
			}
		} )
		challengeProtectPlayerText:RegisterAnimationSequence( "next_challenge", {
			{
				function ()
					return self.challengeProtectPlayerText:SetAlpha( 0, 0 )
				end
			}
		} )
		challengeDesc:RegisterAnimationSequence( "next_challenge", {
			{
				function ()
					return self.challengeDesc:SetAlpha( 0, 0 )
				end
			}
		} )
		txtNextChallenge:RegisterAnimationSequence( "next_challenge", {
			{
				function ()
					return self.txtNextChallenge:SetAlpha( 1, 0 )
				end
			}
		} )
		txtForTheNext:RegisterAnimationSequence( "next_challenge", {
			{
				function ()
					return self.txtForTheNext:SetAlpha( 0, 0 )
				end
			}
		} )
		challengeTimer:RegisterAnimationSequence( "next_challenge", {
			{
				function ()
					return self.challengeTimer:SetAlpha( 0, 0 )
				end
			}
		} )
		txtChallengePaused:RegisterAnimationSequence( "next_challenge", {
			{
				function ()
					return self.txtChallengePaused:SetAlpha( 0, 0 )
				end
			}
		} )
		txtChallengeFailed:RegisterAnimationSequence( "next_challenge", {
			{
				function ()
					return self.txtChallengeFailed:SetAlpha( 0, 0 )
				end
			}
		} )
		txtChallengeComplete:RegisterAnimationSequence( "next_challenge", {
			{
				function ()
					return self.txtChallengeComplete:SetAlpha( 0, 0 )
				end
			}
		} )
		Backing:RegisterAnimationSequence( "next_challenge", {
			{
				function ()
					return self.Backing:SetAlpha( 0, 0 )
				end
			}
		} )
		challengeIcon:RegisterAnimationSequence( "next_challenge", {
			{
				function ()
					return self.challengeIcon:SetAlpha( 0, 240 )
				end
			}
		} )
		playerIcon:RegisterAnimationSequence( "next_challenge", {
			{
				function ()
					return self.playerIcon:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.next_challenge = function ()
			challengeBoxes:AnimateSequence( "next_challenge" )
			challengeProtectPlayerText:AnimateSequence( "next_challenge" )
			challengeDesc:AnimateSequence( "next_challenge" )
			txtNextChallenge:AnimateSequence( "next_challenge" )
			txtForTheNext:AnimateSequence( "next_challenge" )
			challengeTimer:AnimateSequence( "next_challenge" )
			txtChallengePaused:AnimateSequence( "next_challenge" )
			txtChallengeFailed:AnimateSequence( "next_challenge" )
			txtChallengeComplete:AnimateSequence( "next_challenge" )
			Backing:AnimateSequence( "next_challenge" )
			challengeIcon:AnimateSequence( "next_challenge" )
			playerIcon:AnimateSequence( "next_challenge" )
		end
		
		txtChallengePaused:RegisterAnimationSequence( "scaleIcon", {
			{
				function ()
					return self.txtChallengePaused:SetAlpha( 0, 0 )
				end
			}
		} )
		txtChallengeFailed:RegisterAnimationSequence( "scaleIcon", {
			{
				function ()
					return self.txtChallengeFailed:SetAlpha( 0, 0 )
				end
			}
		} )
		txtChallengeComplete:RegisterAnimationSequence( "scaleIcon", {
			{
				function ()
					return self.txtChallengeComplete:SetAlpha( 0, 0 )
				end
			}
		} )
		challengeIcon:RegisterAnimationSequence( "scaleIcon", {
			{
				function ()
					return self.challengeIcon:SetScale( -0.67, 0 )
				end
			}
		} )
		self._sequences.scaleIcon = function ()
			txtChallengePaused:AnimateSequence( "scaleIcon" )
			txtChallengeFailed:AnimateSequence( "scaleIcon" )
			txtChallengeComplete:AnimateSequence( "scaleIcon" )
			challengeIcon:AnimateSequence( "scaleIcon" )
		end
		
		txtChallengePaused:RegisterAnimationSequence( "clearIcon", {
			{
				function ()
					return self.txtChallengePaused:SetAlpha( 0, 0 )
				end
			}
		} )
		txtChallengeFailed:RegisterAnimationSequence( "clearIcon", {
			{
				function ()
					return self.txtChallengeFailed:SetAlpha( 0, 0 )
				end
			}
		} )
		txtChallengeComplete:RegisterAnimationSequence( "clearIcon", {
			{
				function ()
					return self.txtChallengeComplete:SetAlpha( 0, 0 )
				end
			}
		} )
		challengeIcon:RegisterAnimationSequence( "clearIcon", {
			{
				function ()
					return self.challengeIcon:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.clearIcon = function ()
			txtChallengePaused:AnimateSequence( "clearIcon" )
			txtChallengeFailed:AnimateSequence( "clearIcon" )
			txtChallengeComplete:AnimateSequence( "clearIcon" )
			challengeIcon:AnimateSequence( "clearIcon" )
		end
		
		challengeBoxes:RegisterAnimationSequence( "showPaused", {
			{
				function ()
					return self.challengeBoxes:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.challengeBoxes.Background:SetAlpha( 0, 0 )
				end
			},
			{
				function ()
					return self.challengeBoxes.neil:SetAlpha( 0, 0 )
				end
			},
			{
				function ()
					return self.challengeBoxes.neilPaused:SetAlpha( 1, 0 )
				end
			}
		} )
		challengeProtectPlayerText:RegisterAnimationSequence( "showPaused", {
			{
				function ()
					return self.challengeProtectPlayerText:SetAlpha( 0, 0 )
				end
			}
		} )
		challengeProtectPlayerNameCopy0:RegisterAnimationSequence( "showPaused", {
			{
				function ()
					return self.challengeProtectPlayerNameCopy0:SetAlpha( 0, 0 )
				end
			}
		} )
		challengeDesc:RegisterAnimationSequence( "showPaused", {
			{
				function ()
					return self.challengeDesc:SetAlpha( 0, 0 )
				end
			}
		} )
		txtNextChallenge:RegisterAnimationSequence( "showPaused", {
			{
				function ()
					return self.txtNextChallenge:SetAlpha( 0, 0 )
				end
			}
		} )
		txtForTheNext:RegisterAnimationSequence( "showPaused", {
			{
				function ()
					return self.txtForTheNext:SetAlpha( 0, 0 )
				end
			}
		} )
		challengeTimer:RegisterAnimationSequence( "showPaused", {
			{
				function ()
					return self.challengeTimer:SetAlpha( 0, 0 )
				end
			}
		} )
		txtChallengePaused:RegisterAnimationSequence( "showPaused", {
			{
				function ()
					return self.txtChallengePaused:SetAlpha( 0, 0 )
				end
			}
		} )
		txtChallengeFailed:RegisterAnimationSequence( "showPaused", {
			{
				function ()
					return self.txtChallengeFailed:SetAlpha( 0, 0 )
				end
			}
		} )
		txtChallengeComplete:RegisterAnimationSequence( "showPaused", {
			{
				function ()
					return self.txtChallengeComplete:SetAlpha( 0, 0 )
				end
			}
		} )
		Backing:RegisterAnimationSequence( "showPaused", {
			{
				function ()
					return self.Backing:SetAlpha( 0, 0 )
				end
			}
		} )
		challengeIcon:RegisterAnimationSequence( "showPaused", {
			{
				function ()
					return self.challengeIcon:SetAlpha( 0, 0 )
				end
			}
		} )
		playerIcon:RegisterAnimationSequence( "showPaused", {
			{
				function ()
					return self.playerIcon:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.showPaused = function ()
			challengeBoxes:AnimateSequence( "showPaused" )
			challengeProtectPlayerText:AnimateSequence( "showPaused" )
			challengeProtectPlayerNameCopy0:AnimateSequence( "showPaused" )
			challengeDesc:AnimateSequence( "showPaused" )
			txtNextChallenge:AnimateSequence( "showPaused" )
			txtForTheNext:AnimateSequence( "showPaused" )
			challengeTimer:AnimateSequence( "showPaused" )
			txtChallengePaused:AnimateSequence( "showPaused" )
			txtChallengeFailed:AnimateSequence( "showPaused" )
			txtChallengeComplete:AnimateSequence( "showPaused" )
			Backing:AnimateSequence( "showPaused" )
			challengeIcon:AnimateSequence( "showPaused" )
			playerIcon:AnimateSequence( "showPaused" )
		end
		
		challengeBoxes:RegisterAnimationSequence( "challengeComplete", {
			{
				function ()
					return self.challengeBoxes:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.challengeBoxes.neil:SetAlpha( 1, 0 )
				end
			}
		} )
		challengeProtectPlayerText:RegisterAnimationSequence( "challengeComplete", {
			{
				function ()
					return self.challengeProtectPlayerText:SetAlpha( 0, 0 )
				end
			}
		} )
		challengeProtectPlayerNameCopy0:RegisterAnimationSequence( "challengeComplete", {
			{
				function ()
					return self.challengeProtectPlayerNameCopy0:SetAlpha( 0, 0 )
				end
			}
		} )
		challengeDesc:RegisterAnimationSequence( "challengeComplete", {
			{
				function ()
					return self.challengeDesc:SetAlpha( 0, 0 )
				end
			}
		} )
		txtNextChallenge:RegisterAnimationSequence( "challengeComplete", {
			{
				function ()
					return self.txtNextChallenge:SetAlpha( 0, 0 )
				end
			}
		} )
		txtForTheNext:RegisterAnimationSequence( "challengeComplete", {
			{
				function ()
					return self.txtForTheNext:SetAlpha( 0, 0 )
				end
			}
		} )
		challengeTimer:RegisterAnimationSequence( "challengeComplete", {
			{
				function ()
					return self.challengeTimer:SetAlpha( 0, 0 )
				end
			}
		} )
		txtChallengePaused:RegisterAnimationSequence( "challengeComplete", {
			{
				function ()
					return self.txtChallengePaused:SetAlpha( 0, 0 )
				end
			}
		} )
		txtChallengeFailed:RegisterAnimationSequence( "challengeComplete", {
			{
				function ()
					return self.txtChallengeFailed:SetAlpha( 0, 0 )
				end
			}
		} )
		txtChallengeComplete:RegisterAnimationSequence( "challengeComplete", {
			{
				function ()
					return self.txtChallengeComplete:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.txtChallengeComplete:SetScale( 0, 0 )
				end
			}
		} )
		Backing:RegisterAnimationSequence( "challengeComplete", {
			{
				function ()
					return self.Backing:SetAlpha( 0, 0 )
				end
			}
		} )
		challengeIcon:RegisterAnimationSequence( "challengeComplete", {
			{
				function ()
					return self.challengeIcon:SetAlpha( 0, 0 )
				end
			}
		} )
		playerIcon:RegisterAnimationSequence( "challengeComplete", {
			{
				function ()
					return self.playerIcon:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.challengeComplete = function ()
			challengeBoxes:AnimateSequence( "challengeComplete" )
			challengeProtectPlayerText:AnimateSequence( "challengeComplete" )
			challengeProtectPlayerNameCopy0:AnimateSequence( "challengeComplete" )
			challengeDesc:AnimateSequence( "challengeComplete" )
			txtNextChallenge:AnimateSequence( "challengeComplete" )
			txtForTheNext:AnimateSequence( "challengeComplete" )
			challengeTimer:AnimateSequence( "challengeComplete" )
			txtChallengePaused:AnimateSequence( "challengeComplete" )
			txtChallengeFailed:AnimateSequence( "challengeComplete" )
			txtChallengeComplete:AnimateSequence( "challengeComplete" )
			Backing:AnimateSequence( "challengeComplete" )
			challengeIcon:AnimateSequence( "challengeComplete" )
			playerIcon:AnimateSequence( "challengeComplete" )
		end
		
		challengeBoxes:RegisterAnimationSequence( "challengeFailed", {
			{
				function ()
					return self.challengeBoxes:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.challengeBoxes.neil:SetAlpha( 0, 0 )
				end
			},
			{
				function ()
					return self.challengeBoxes.neilPaused:SetAlpha( 0, 0 )
				end
			},
			{
				function ()
					return self.challengeBoxes.neilFailed:SetAlpha( 1, 0 )
				end
			}
		} )
		challengeProtectPlayerText:RegisterAnimationSequence( "challengeFailed", {
			{
				function ()
					return self.challengeProtectPlayerText:SetAlpha( 0, 0 )
				end
			}
		} )
		challengeProtectPlayerNameCopy0:RegisterAnimationSequence( "challengeFailed", {
			{
				function ()
					return self.challengeProtectPlayerNameCopy0:SetAlpha( 0, 0 )
				end
			}
		} )
		challengeDesc:RegisterAnimationSequence( "challengeFailed", {
			{
				function ()
					return self.challengeDesc:SetAlpha( 0, 0 )
				end
			}
		} )
		txtNextChallenge:RegisterAnimationSequence( "challengeFailed", {
			{
				function ()
					return self.txtNextChallenge:SetAlpha( 0, 0 )
				end
			}
		} )
		txtForTheNext:RegisterAnimationSequence( "challengeFailed", {
			{
				function ()
					return self.txtForTheNext:SetAlpha( 0, 0 )
				end
			}
		} )
		challengeTimer:RegisterAnimationSequence( "challengeFailed", {
			{
				function ()
					return self.challengeTimer:SetAlpha( 0, 0 )
				end
			}
		} )
		txtChallengePaused:RegisterAnimationSequence( "challengeFailed", {
			{
				function ()
					return self.txtChallengePaused:SetAlpha( 0, 0 )
				end
			}
		} )
		txtChallengeFailed:RegisterAnimationSequence( "challengeFailed", {
			{
				function ()
					return self.txtChallengeFailed:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.txtChallengeFailed:SetScale( 0, 0 )
				end
			}
		} )
		txtChallengeComplete:RegisterAnimationSequence( "challengeFailed", {
			{
				function ()
					return self.txtChallengeComplete:SetAlpha( 0, 0 )
				end
			}
		} )
		Backing:RegisterAnimationSequence( "challengeFailed", {
			{
				function ()
					return self.Backing:SetAlpha( 0, 0 )
				end
			}
		} )
		challengeIcon:RegisterAnimationSequence( "challengeFailed", {
			{
				function ()
					return self.challengeIcon:SetAlpha( 0, 0 )
				end
			}
		} )
		playerIcon:RegisterAnimationSequence( "challengeFailed", {
			{
				function ()
					return self.playerIcon:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.challengeFailed = function ()
			challengeBoxes:AnimateSequence( "challengeFailed" )
			challengeProtectPlayerText:AnimateSequence( "challengeFailed" )
			challengeProtectPlayerNameCopy0:AnimateSequence( "challengeFailed" )
			challengeDesc:AnimateSequence( "challengeFailed" )
			txtNextChallenge:AnimateSequence( "challengeFailed" )
			txtForTheNext:AnimateSequence( "challengeFailed" )
			challengeTimer:AnimateSequence( "challengeFailed" )
			txtChallengePaused:AnimateSequence( "challengeFailed" )
			txtChallengeFailed:AnimateSequence( "challengeFailed" )
			txtChallengeComplete:AnimateSequence( "challengeFailed" )
			Backing:AnimateSequence( "challengeFailed" )
			challengeIcon:AnimateSequence( "challengeFailed" )
			playerIcon:AnimateSequence( "challengeFailed" )
		end
		
		challengeBoxes:RegisterAnimationSequence( "clearAll", {
			{
				function ()
					return self.challengeBoxes:SetAlpha( 0, 0 )
				end
			}
		} )
		challengeProtectPlayerText:RegisterAnimationSequence( "clearAll", {
			{
				function ()
					return self.challengeProtectPlayerText:SetAlpha( 0, 0 )
				end
			}
		} )
		challengeDesc:RegisterAnimationSequence( "clearAll", {
			{
				function ()
					return self.challengeDesc:SetAlpha( 0, 0 )
				end
			}
		} )
		txtNextChallenge:RegisterAnimationSequence( "clearAll", {
			{
				function ()
					return self.txtNextChallenge:SetAlpha( 0, 0 )
				end
			}
		} )
		txtForTheNext:RegisterAnimationSequence( "clearAll", {
			{
				function ()
					return self.txtForTheNext:SetAlpha( 0, 0 )
				end
			}
		} )
		challengeTimer:RegisterAnimationSequence( "clearAll", {
			{
				function ()
					return self.challengeTimer:SetAlpha( 0, 0 )
				end
			}
		} )
		txtChallengePaused:RegisterAnimationSequence( "clearAll", {
			{
				function ()
					return self.txtChallengePaused:SetAlpha( 0, 0 )
				end
			}
		} )
		txtChallengeFailed:RegisterAnimationSequence( "clearAll", {
			{
				function ()
					return self.txtChallengeFailed:SetAlpha( 0, 0 )
				end
			}
		} )
		txtChallengeComplete:RegisterAnimationSequence( "clearAll", {
			{
				function ()
					return self.txtChallengeComplete:SetAlpha( 0, 0 )
				end
			}
		} )
		Backing:RegisterAnimationSequence( "clearAll", {
			{
				function ()
					return self.Backing:SetAlpha( 0, 0 )
				end
			}
		} )
		challengeIcon:RegisterAnimationSequence( "clearAll", {
			{
				function ()
					return self.challengeIcon:SetAlpha( 0, 0 )
				end
			}
		} )
		playerIcon:RegisterAnimationSequence( "clearAll", {
			{
				function ()
					return self.playerIcon:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.clearAll = function ()
			challengeBoxes:AnimateSequence( "clearAll" )
			challengeProtectPlayerText:AnimateSequence( "clearAll" )
			challengeDesc:AnimateSequence( "clearAll" )
			txtNextChallenge:AnimateSequence( "clearAll" )
			txtForTheNext:AnimateSequence( "clearAll" )
			challengeTimer:AnimateSequence( "clearAll" )
			txtChallengePaused:AnimateSequence( "clearAll" )
			txtChallengeFailed:AnimateSequence( "clearAll" )
			txtChallengeComplete:AnimateSequence( "clearAll" )
			Backing:AnimateSequence( "clearAll" )
			challengeIcon:AnimateSequence( "clearAll" )
			playerIcon:AnimateSequence( "clearAll" )
		end
		
		challengeBoxes:RegisterAnimationSequence( "hidePauseIcon", {
			{
				function ()
					return self.challengeBoxes.Background:SetAlpha( 0.5, 0 )
				end
			},
			{
				function ()
					return self.challengeBoxes.neil:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.challengeBoxes.neilPaused:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.hidePauseIcon = function ()
			challengeBoxes:AnimateSequence( "hidePauseIcon" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	local f1_local16 = function ()
		if DataSources.inGame.CP.zombies.challenges.challengeMessageDisplay:GetValue( f1_local1 ) ~= nil and DataSources.inGame.CP.zombies.challenges.challengeMessageDisplay:GetValue( f1_local1 ) == 1 and DataSources.inGame.CP.zombies.challenges.challengeType:GetValue( f1_local1 ) ~= nil and DataSources.inGame.CP.zombies.challenges.challengeType:GetValue( f1_local1 ) == "amount" then
			ACTIONS.AnimateSequence( self, "challengeTypeAmountActive" )
		end
		if DataSources.inGame.CP.zombies.challenges.challengeMessageDisplay:GetValue( f1_local1 ) ~= nil and DataSources.inGame.CP.zombies.challenges.challengeMessageDisplay:GetValue( f1_local1 ) == 0 and DataSources.inGame.CP.zombies.challenges.challengeType:GetValue( f1_local1 ) ~= nil and DataSources.inGame.CP.zombies.challenges.challengeType:GetValue( f1_local1 ) == "amount" then
			ACTIONS.AnimateSequence( self, "challengeTypeAmountDeactivate" )
		end
		if DataSources.inGame.CP.zombies.challenges.challengeMessageDisplay:GetValue( f1_local1 ) ~= nil and DataSources.inGame.CP.zombies.challenges.challengeMessageDisplay:GetValue( f1_local1 ) == 1 and DataSources.inGame.CP.zombies.challenges.challengeType:GetValue( f1_local1 ) ~= nil and DataSources.inGame.CP.zombies.challenges.challengeType:GetValue( f1_local1 ) == "wave" then
			ACTIONS.AnimateSequence( self, "challengeTypeWave" )
		end
		if DataSources.inGame.CP.zombies.challenges.challengeMessageDisplay:GetValue( f1_local1 ) ~= nil and DataSources.inGame.CP.zombies.challenges.challengeMessageDisplay:GetValue( f1_local1 ) == 0 and DataSources.inGame.CP.zombies.challenges.challengeType:GetValue( f1_local1 ) ~= nil and DataSources.inGame.CP.zombies.challenges.challengeType:GetValue( f1_local1 ) == "wave" then
			ACTIONS.AnimateSequence( self, "challengeWaveDeactivate" )
		end
		if DataSources.inGame.CP.zombies.challenges.challengeMessageDisplay:GetValue( f1_local1 ) ~= nil and DataSources.inGame.CP.zombies.challenges.challengeMessageDisplay:GetValue( f1_local1 ) == 1 and DataSources.inGame.CP.zombies.challenges.challengeType:GetValue( f1_local1 ) ~= nil and DataSources.inGame.CP.zombies.challenges.challengeType:GetValue( f1_local1 ) == "player" then
			ACTIONS.AnimateSequence( self, "challengeTypePlayer" )
		end
		if DataSources.inGame.CP.zombies.challenges.challengeMessageDisplay:GetValue( f1_local1 ) ~= nil and DataSources.inGame.CP.zombies.challenges.challengeMessageDisplay:GetValue( f1_local1 ) == 0 and DataSources.inGame.CP.zombies.challenges.challengeType:GetValue( f1_local1 ) ~= nil and DataSources.inGame.CP.zombies.challenges.challengeType:GetValue( f1_local1 ) == "player" then
			ACTIONS.AnimateSequence( self, "challengeTypePlayerDeactivate" )
		end
		if DataSources.inGame.CP.zombies.challenges.challengeType:GetValue( f1_local1 ) ~= nil and DataSources.inGame.CP.zombies.challenges.challengeType:GetValue( f1_local1 ) == "nextchallenge" and DataSources.inGame.CP.zombies.challenges.challengeMessageDisplay:GetValue( f1_local1 ) ~= nil and DataSources.inGame.CP.zombies.challenges.challengeMessageDisplay:GetValue( f1_local1 ) == 4 then
			ACTIONS.AnimateSequence( self, "next_challenge" )
		end
		if DataSources.inGame.CP.zombies.challenges.challengeMessageDisplay:GetValue( f1_local1 ) ~= nil and DataSources.inGame.CP.zombies.challenges.challengeMessageDisplay:GetValue( f1_local1 ) == 5 then
			ACTIONS.AnimateSequence( self, "DefaultSequence" )
		end
		if DataSources.inGame.CP.zombies.challenges.challengeMessageDisplay:GetValue( f1_local1 ) ~= nil and DataSources.inGame.CP.zombies.challenges.challengeMessageDisplay:GetValue( f1_local1 ) == -1 then
			ACTIONS.AnimateSequence( self, "clearAll" )
		end
		if DataSources.inGame.CP.zombies.challenges.challengeMessageDisplay:GetValue( f1_local1 ) ~= nil and DataSources.inGame.CP.zombies.challenges.challengeMessageDisplay:GetValue( f1_local1 ) == 10 then
			ACTIONS.AnimateSequence( self, "showPaused" )
		end
		if DataSources.inGame.CP.zombies.challenges.challengeMessageDisplay:GetValue( f1_local1 ) ~= nil and DataSources.inGame.CP.zombies.challenges.challengeMessageDisplay:GetValue( f1_local1 ) == 2 then
			ACTIONS.AnimateSequence( self, "challengeFailed" )
		end
		if DataSources.inGame.CP.zombies.challenges.challengeMessageDisplay:GetValue( f1_local1 ) ~= nil and DataSources.inGame.CP.zombies.challenges.challengeMessageDisplay:GetValue( f1_local1 ) == 3 then
			ACTIONS.AnimateSequence( self, "challengeComplete" )
		end
		if DataSources.inGame.CP.zombies.challenges.challengeMessageDisplay:GetValue( f1_local1 ) ~= nil and DataSources.inGame.CP.zombies.challenges.challengeMessageDisplay:GetValue( f1_local1 ) == 11 then
			ACTIONS.AnimateSequence( self, "hidePauseIcon" )
		end
	end
	
	self:SubscribeToModel( DataSources.inGame.CP.zombies.challenges.challengeMessageDisplay:GetModel( f1_local1 ), f1_local16 )
	self:SubscribeToModel( DataSources.inGame.CP.zombies.challenges.challengeType:GetModel( f1_local1 ), f1_local16 )
	return self
end

MenuBuilder.registerType( "challengeWidgetNew", challengeWidgetNew )
LockTable( _M )
