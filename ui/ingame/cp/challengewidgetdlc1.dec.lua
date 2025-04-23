local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function challengeWidgetDLC1( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 530 * _1080p, 0, 237 * _1080p )
	self.id = "challengeWidgetDLC1"
	self._animationSets = {}
	self._sequences = {}
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local challengeBoxes = nil
	
	challengeBoxes = MenuBuilder.BuildRegisteredType( "challengeBoxesDLC1", {
		controllerIndex = f1_local1
	} )
	challengeBoxes.id = "challengeBoxes"
	challengeBoxes.Background:SetAlpha( 0, 0 )
	challengeBoxes.neil:SetAlpha( 0, 0 )
	challengeBoxes:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 42.33, _1080p * 311.33, _1080p * 58.07, _1080p * 177.07 )
	self:addElement( challengeBoxes )
	self.challengeBoxes = challengeBoxes
	
	local challengeDesc = nil
	
	challengeDesc = LUI.UIText.new()
	challengeDesc.id = "challengeDesc"
	challengeDesc:SetAlpha( 0, 0 )
	challengeDesc:SetFontSize( 22 * _1080p )
	challengeDesc:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	challengeDesc:SetAlignment( LUI.Alignment.Left )
	challengeDesc:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 168.25, _1080p * 395.59, _1080p * 79.41, _1080p * 101.41 )
	challengeDesc:SubscribeToModel( DataSources.inGame.CP.zombies.challenges.challengeProgressAmountLeft:GetModel( f1_local1 ), function ()
		local f2_local0 = DataSources.inGame.CP.zombies.challenges.challengeProgressAmountLeft:GetValue( f1_local1 )
		if f2_local0 ~= nil then
			challengeDesc:setText( LocalizeIntoString( f2_local0, DataSources.inGame.CP.zombies.challenges.challengeActivateText:GetValue( f1_local1 ) ), 0 )
		end
	end )
	challengeDesc:SubscribeToModel( DataSources.inGame.CP.zombies.challenges.challengeActivateText:GetModel( f1_local1 ), function ()
		local f3_local0 = DataSources.inGame.CP.zombies.challenges.challengeProgressAmountLeft:GetValue( f1_local1 )
		if f3_local0 ~= nil then
			challengeDesc:setText( LocalizeIntoString( f3_local0, DataSources.inGame.CP.zombies.challenges.challengeActivateText:GetValue( f1_local1 ) ), 0 )
		end
	end )
	self:addElement( challengeDesc )
	self.challengeDesc = challengeDesc
	
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
		local f4_local0 = DataSources.inGame.CP.zombies.challenges.challengeTimer:GetValue( f1_local1 )
		if f4_local0 ~= nil then
			challengeTimer:setEndTime( f4_local0 )
		end
	end )
	self:addElement( challengeTimer )
	self.challengeTimer = challengeTimer
	
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
		local f5_local0 = DataSources.inGame.CP.zombies.challenges.challengeFailText:GetValue( f1_local1 )
		if f5_local0 ~= nil then
			txtChallengeFailed:setText( f5_local0, 0 )
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
		local f6_local0 = DataSources.inGame.CP.zombies.challenges.challengeCompleteText:GetValue( f1_local1 )
		if f6_local0 ~= nil then
			txtChallengeComplete:setText( f6_local0, 0 )
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
		challengeTimer:RegisterAnimationSequence( "challengeTypeAmountActive", {
			{
				function ()
					return self.challengeTimer:SetAlpha( 0, 0 )
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
		self._sequences.challengeTypeAmountActive = function ()
			challengeBoxes:AnimateSequence( "challengeTypeAmountActive" )
			challengeDesc:AnimateSequence( "challengeTypeAmountActive" )
			challengeTimer:AnimateSequence( "challengeTypeAmountActive" )
			txtChallengeFailed:AnimateSequence( "challengeTypeAmountActive" )
			txtChallengeComplete:AnimateSequence( "challengeTypeAmountActive" )
			Backing:AnimateSequence( "challengeTypeAmountActive" )
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
		challengeTimer:RegisterAnimationSequence( "challengeTypeAmountDeactivate", {
			{
				function ()
					return self.challengeTimer:SetAlpha( 0, 0 )
				end,
				function ()
					return self.challengeTimer:SetAlpha( 0, 250 )
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
		self._sequences.challengeTypeAmountDeactivate = function ()
			challengeBoxes:AnimateSequence( "challengeTypeAmountDeactivate" )
			challengeDesc:AnimateSequence( "challengeTypeAmountDeactivate" )
			challengeTimer:AnimateSequence( "challengeTypeAmountDeactivate" )
			txtChallengeFailed:AnimateSequence( "challengeTypeAmountDeactivate" )
			txtChallengeComplete:AnimateSequence( "challengeTypeAmountDeactivate" )
			Backing:AnimateSequence( "challengeTypeAmountDeactivate" )
		end
		
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
		self._sequences.scaleIcon = function ()
			txtChallengeFailed:AnimateSequence( "scaleIcon" )
			txtChallengeComplete:AnimateSequence( "scaleIcon" )
		end
		
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
		self._sequences.clearIcon = function ()
			txtChallengeFailed:AnimateSequence( "clearIcon" )
			txtChallengeComplete:AnimateSequence( "clearIcon" )
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
		challengeDesc:RegisterAnimationSequence( "challengeComplete", {
			{
				function ()
					return self.challengeDesc:SetAlpha( 0, 0 )
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
		self._sequences.challengeComplete = function ()
			challengeBoxes:AnimateSequence( "challengeComplete" )
			challengeDesc:AnimateSequence( "challengeComplete" )
			challengeTimer:AnimateSequence( "challengeComplete" )
			txtChallengeFailed:AnimateSequence( "challengeComplete" )
			txtChallengeComplete:AnimateSequence( "challengeComplete" )
			Backing:AnimateSequence( "challengeComplete" )
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
			}
		} )
		challengeDesc:RegisterAnimationSequence( "challengeFailed", {
			{
				function ()
					return self.challengeDesc:SetAlpha( 0, 0 )
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
		self._sequences.challengeFailed = function ()
			challengeBoxes:AnimateSequence( "challengeFailed" )
			challengeDesc:AnimateSequence( "challengeFailed" )
			challengeTimer:AnimateSequence( "challengeFailed" )
			txtChallengeFailed:AnimateSequence( "challengeFailed" )
			txtChallengeComplete:AnimateSequence( "challengeFailed" )
			Backing:AnimateSequence( "challengeFailed" )
		end
		
		challengeBoxes:RegisterAnimationSequence( "clearAll", {
			{
				function ()
					return self.challengeBoxes:SetAlpha( 0, 0 )
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
		challengeTimer:RegisterAnimationSequence( "clearAll", {
			{
				function ()
					return self.challengeTimer:SetAlpha( 0, 0 )
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
		self._sequences.clearAll = function ()
			challengeBoxes:AnimateSequence( "clearAll" )
			challengeDesc:AnimateSequence( "clearAll" )
			challengeTimer:AnimateSequence( "clearAll" )
			txtChallengeFailed:AnimateSequence( "clearAll" )
			txtChallengeComplete:AnimateSequence( "clearAll" )
			Backing:AnimateSequence( "clearAll" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	local f1_local9 = function ()
		if DataSources.inGame.CP.zombies.challenges.challengeMessageDisplay:GetValue( f1_local1 ) ~= nil and DataSources.inGame.CP.zombies.challenges.challengeMessageDisplay:GetValue( f1_local1 ) == 1 and DataSources.inGame.CP.zombies.challenges.challengeType:GetValue( f1_local1 ) ~= nil and DataSources.inGame.CP.zombies.challenges.challengeType:GetValue( f1_local1 ) == "amount" then
			ACTIONS.AnimateSequence( self, "challengeTypeAmountActive" )
		end
		if DataSources.inGame.CP.zombies.challenges.challengeMessageDisplay:GetValue( f1_local1 ) ~= nil and DataSources.inGame.CP.zombies.challenges.challengeMessageDisplay:GetValue( f1_local1 ) == 0 and DataSources.inGame.CP.zombies.challenges.challengeType:GetValue( f1_local1 ) ~= nil and DataSources.inGame.CP.zombies.challenges.challengeType:GetValue( f1_local1 ) == "amount" then
			ACTIONS.AnimateSequence( self, "challengeTypeAmountDeactivate" )
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
	
	self:SubscribeToModel( DataSources.inGame.CP.zombies.challenges.challengeMessageDisplay:GetModel( f1_local1 ), f1_local9 )
	self:SubscribeToModel( DataSources.inGame.CP.zombies.challenges.challengeType:GetModel( f1_local1 ), f1_local9 )
	return self
end

MenuBuilder.registerType( "challengeWidgetDLC1", challengeWidgetDLC1 )
LockTable( _M )
