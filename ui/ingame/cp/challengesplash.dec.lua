local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ( f1_arg0, f1_arg1, f1_arg2 )
	assert( f1_arg0.challengeDescription )
	assert( f1_arg0.challengeFailed )
	assert( f1_arg0.challengeComplete )
	f1_arg0.challengeDescription:SetShadowUOffset( -0 )
	f1_arg0.challengeDescription:SetShadowVOffset( -0 )
	f1_arg0.challengeFailed:SetShadowUOffset( -0 )
	f1_arg0.challengeFailed:SetShadowVOffset( -0 )
	f1_arg0.challengeComplete:SetShadowUOffset( -0 )
	f1_arg0.challengeComplete:SetShadowVOffset( -0 )
end

function challengeSplash( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 560 * _1080p, 0, 440 * _1080p )
	self.id = "challengeSplash"
	self._animationSets = {}
	self._sequences = {}
	local f2_local1 = controller and controller.controllerIndex
	if not f2_local1 and not Engine.InFrontend() then
		f2_local1 = self:getRootController()
	end
	assert( f2_local1 )
	local f2_local2 = self
	local LightRays = nil
	
	LightRays = MenuBuilder.BuildRegisteredType( "GenericSplashLightRays", {
		controllerIndex = f2_local1
	} )
	LightRays.id = "LightRays"
	LightRays:SetAlpha( 0, 0 )
	LightRays:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -255, _1080p * 257, _1080p * -331.5, _1080p * 180.5 )
	self:addElement( LightRays )
	self.LightRays = LightRays
	
	local styleIcon = nil
	
	styleIcon = LUI.UIImage.new()
	styleIcon.id = "styleIcon"
	styleIcon:SetAlpha( 0.1, 0 )
	styleIcon:SetScale( 0.5, 0 )
	styleIcon:SetBlendMode( BLEND_MODE.addWithAlpha )
	styleIcon:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -128, _1080p * 128, _1080p * -224, _1080p * 32 )
	styleIcon:SubscribeToModel( DataSources.inGame.CP.zombies.challenges.challengeSplashStyleIcon:GetModel( f2_local1 ), function ()
		local f3_local0 = DataSources.inGame.CP.zombies.challenges.challengeSplashStyleIcon:GetValue( f2_local1 )
		if f3_local0 ~= nil then
			styleIcon:setImage( RegisterMaterial( f3_local0 ), 0 )
		end
	end )
	self:addElement( styleIcon )
	self.styleIcon = styleIcon
	
	local SecondaryImageBacking = nil
	
	SecondaryImageBacking = LUI.UIImage.new()
	SecondaryImageBacking.id = "SecondaryImageBacking"
	SecondaryImageBacking:setImage( RegisterMaterial( "cp_disco_skill_splash_backing" ), 0 )
	SecondaryImageBacking:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 627.5, _1080p * 752.5, _1080p * 702.5, _1080p * 830.5 )
	self:addElement( SecondaryImageBacking )
	self.SecondaryImageBacking = SecondaryImageBacking
	
	local SecondaryImage = nil
	
	SecondaryImage = LUI.UIImage.new()
	SecondaryImage.id = "SecondaryImage"
	SecondaryImage:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 627.5, _1080p * 752.5, _1080p * 702.5, _1080p * 830.5 )
	SecondaryImage:SubscribeToModel( DataSources.inGame.CP.zombies.challenges.challengeUpgradeIcon:GetModel( f2_local1 ), function ()
		local f4_local0 = DataSources.inGame.CP.zombies.challenges.challengeUpgradeIcon:GetValue( f2_local1 )
		if f4_local0 ~= nil then
			SecondaryImage:setImage( RegisterMaterial( f4_local0 ), 0 )
		end
	end )
	self:addElement( SecondaryImage )
	self.SecondaryImage = SecondaryImage
	
	local challengeDescription = nil
	
	challengeDescription = LUI.UIStyledText.new()
	challengeDescription.id = "challengeDescription"
	challengeDescription:SetFontSize( 45 * _1080p )
	challengeDescription:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	challengeDescription:SetAlignment( LUI.Alignment.Center )
	challengeDescription:SetShadowMinDistance( -0.2, 0 )
	challengeDescription:SetShadowMaxDistance( 0.2, 0 )
	challengeDescription:SetShadowRGBFromInt( 0, 0 )
	challengeDescription:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * -114.5, _1080p * 131.5, _1080p * 218.5, _1080p * 263.5 )
	challengeDescription:SubscribeToModel( DataSources.inGame.CP.zombies.challenges.challengeMaxProgress:GetModel( f2_local1 ), function ()
		local f5_local0 = DataSources.inGame.CP.zombies.challenges.challengeMaxProgress:GetValue( f2_local1 )
		if f5_local0 ~= nil then
			challengeDescription:setText( LocalizeIntoString( f5_local0, DataSources.inGame.CP.zombies.challenges.challengeActivateText:GetValue( f2_local1 ) ), 0 )
		end
	end )
	challengeDescription:SubscribeToModel( DataSources.inGame.CP.zombies.challenges.challengeActivateText:GetModel( f2_local1 ), function ()
		local f6_local0 = DataSources.inGame.CP.zombies.challenges.challengeMaxProgress:GetValue( f2_local1 )
		if f6_local0 ~= nil then
			challengeDescription:setText( LocalizeIntoString( f6_local0, DataSources.inGame.CP.zombies.challenges.challengeActivateText:GetValue( f2_local1 ) ), 0 )
		end
	end )
	self:addElement( challengeDescription )
	self.challengeDescription = challengeDescription
	
	local challengeFailed = nil
	
	challengeFailed = LUI.UIStyledText.new()
	challengeFailed.id = "challengeFailed"
	challengeFailed:SetAlpha( 0, 0 )
	challengeFailed:SetFontSize( 45 * _1080p )
	challengeFailed:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	challengeFailed:SetAlignment( LUI.Alignment.Center )
	challengeFailed:SetShadowMinDistance( -0.2, 0 )
	challengeFailed:SetShadowMaxDistance( 0.2, 0 )
	challengeFailed:SetShadowRGBFromInt( 0, 0 )
	challengeFailed:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * -117.5, _1080p * 119.5, _1080p * 218.5, _1080p * 263.5 )
	challengeFailed:SubscribeToModel( DataSources.inGame.CP.zombies.challenges.challengeFailText:GetModel( f2_local1 ), function ()
		local f7_local0 = DataSources.inGame.CP.zombies.challenges.challengeFailText:GetValue( f2_local1 )
		if f7_local0 ~= nil then
			challengeFailed:setText( f7_local0, 0 )
		end
	end )
	self:addElement( challengeFailed )
	self.challengeFailed = challengeFailed
	
	local challengeComplete = nil
	
	challengeComplete = LUI.UIStyledText.new()
	challengeComplete.id = "challengeComplete"
	challengeComplete:SetFontSize( 45 * _1080p )
	challengeComplete:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	challengeComplete:SetAlignment( LUI.Alignment.Center )
	challengeComplete:SetShadowMinDistance( -0.2, 0 )
	challengeComplete:SetShadowMaxDistance( 0.2, 0 )
	challengeComplete:SetShadowRGBFromInt( 0, 0 )
	challengeComplete:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * -104, _1080p * 104, _1080p * 218.5, _1080p * 263.5 )
	challengeComplete:SubscribeToModel( DataSources.inGame.CP.zombies.challenges.challengeUpgradeText:GetModel( f2_local1 ), function ()
		local f8_local0 = DataSources.inGame.CP.zombies.challenges.challengeUpgradeText:GetValue( f2_local1 )
		if f8_local0 ~= nil then
			challengeComplete:setText( f8_local0, 0 )
		end
	end )
	self:addElement( challengeComplete )
	self.challengeComplete = challengeComplete
	
	self._animationSets.DefaultAnimationSet = function ()
		LightRays:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.LightRays:SetAlpha( 0, 0 )
				end
			}
		} )
		styleIcon:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.styleIcon:SetAlpha( 0, 0 )
				end
			},
			{
				function ()
					return self.styleIcon:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -128, _1080p * 128, _1080p * -224, _1080p * 32, 0 )
				end
			}
		} )
		SecondaryImageBacking:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.SecondaryImageBacking:SetAlpha( 0, 0 )
				end
			},
			{
				function ()
					return self.SecondaryImageBacking:SetScale( 0, 0 )
				end
			},
			{
				function ()
					return self.SecondaryImageBacking:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 218.5, _1080p * -216.5, _1080p * 80.5, _1080p * 208.5, 0 )
				end
			}
		} )
		SecondaryImage:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.SecondaryImage:SetAlpha( 0, 0 )
				end
			},
			{
				function ()
					return self.SecondaryImage:SetScale( 0, 0 )
				end
			},
			{
				function ()
					return self.SecondaryImage:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 218.5, _1080p * -216.5, _1080p * 80.5, _1080p * 208.5, 0 )
				end
			}
		} )
		challengeDescription:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.challengeDescription:SetAlpha( 0, 0 )
				end
			}
		} )
		challengeFailed:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.challengeFailed:SetAlpha( 0, 0 )
				end
			}
		} )
		challengeComplete:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.challengeComplete:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.DefaultSequence = function ()
			LightRays:AnimateSequence( "DefaultSequence" )
			styleIcon:AnimateSequence( "DefaultSequence" )
			SecondaryImageBacking:AnimateSequence( "DefaultSequence" )
			SecondaryImage:AnimateSequence( "DefaultSequence" )
			challengeDescription:AnimateSequence( "DefaultSequence" )
			challengeFailed:AnimateSequence( "DefaultSequence" )
			challengeComplete:AnimateSequence( "DefaultSequence" )
		end
		
		challengeDescription:RegisterAnimationSequence( "challengeActivated", {
			{
				function ()
					return self.challengeDescription:SetAlpha( 0, 0 )
				end
			}
		} )
		challengeFailed:RegisterAnimationSequence( "challengeActivated", {
			{
				function ()
					return self.challengeFailed:SetAlpha( 0, 0 )
				end
			}
		} )
		challengeComplete:RegisterAnimationSequence( "challengeActivated", {
			{
				function ()
					return self.challengeComplete:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.challengeActivated = function ()
			challengeDescription:AnimateSequence( "challengeActivated" )
			challengeFailed:AnimateSequence( "challengeActivated" )
			challengeComplete:AnimateSequence( "challengeActivated" )
		end
		
		challengeFailed:RegisterAnimationSequence( "challengeFailedAnim", {
			{
				function ()
					return self.challengeFailed:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.challengeFailedAnim = function ()
			challengeFailed:AnimateSequence( "challengeFailedAnim" )
		end
		
		LightRays:RegisterAnimationSequence( "challengeCompleteAnim", {
			{
				function ()
					return self.LightRays:SetAlpha( 0, 0 )
				end,
				function ()
					return self.LightRays:SetAlpha( 0.5, 200, LUI.EASING.outQuadratic )
				end,
				function ()
					return self.LightRays:SetAlpha( 0.75, 1800 )
				end,
				function ()
					return self.LightRays:SetAlpha( 0, 150 )
				end
			},
			{
				function ()
					return self.LightRays:SetScale( -0.5, 0 )
				end,
				function ()
					return self.LightRays:SetScale( 0, 200, LUI.EASING.outQuadratic )
				end,
				function ()
					return self.LightRays:SetScale( 0.15, 1950 )
				end
			}
		} )
		styleIcon:RegisterAnimationSequence( "challengeCompleteAnim", {
			{
				function ()
					return self.styleIcon:SetAlpha( 0, 0 )
				end,
				function ()
					return self.styleIcon:SetAlpha( 0.1, 200, LUI.EASING.outQuadratic )
				end,
				function ()
					return self.styleIcon:SetAlpha( 0.1, 1800 )
				end,
				function ()
					return self.styleIcon:SetAlpha( 0, 200 )
				end
			},
			{
				function ()
					return self.styleIcon:SetScale( 0.5, 0 )
				end,
				function ()
					return self.styleIcon:SetScale( 1.5, 2200 )
				end
			},
			{
				function ()
					return self.styleIcon:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -128, _1080p * 128, _1080p * -224, _1080p * 32, 0 )
				end
			}
		} )
		SecondaryImageBacking:RegisterAnimationSequence( "challengeCompleteAnim", {
			{
				function ()
					return self.SecondaryImageBacking:SetAlpha( 0, 0 )
				end,
				function ()
					return self.SecondaryImageBacking:SetAlpha( 1, 300, LUI.EASING.outBack )
				end,
				function ()
					return self.SecondaryImageBacking:SetAlpha( 1, 1880 )
				end,
				function ()
					return self.SecondaryImageBacking:SetAlpha( 0, 140 )
				end
			},
			{
				function ()
					return self.SecondaryImageBacking:SetScale( 4, 0 )
				end,
				function ()
					return self.SecondaryImageBacking:SetScale( 0.25, 300, LUI.EASING.outBack )
				end,
				function ()
					return self.SecondaryImageBacking:SetScale( 0.25, 1780 )
				end,
				function ()
					return self.SecondaryImageBacking:SetScale( -0.5, 240 )
				end
			},
			{
				function ()
					return self.SecondaryImageBacking:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 218.5, _1080p * -216.5, _1080p * 80.5, _1080p * 208.5, 0 )
				end,
				function ()
					return self.SecondaryImageBacking:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 218.5, _1080p * -216.5, _1080p * 80.5, _1080p * 208.5, 2079 )
				end,
				function ()
					return self.SecondaryImageBacking:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 907.5, _1080p * 472.5, _1080p * 922.5, _1080p * 1050.5, 240 )
				end
			}
		} )
		SecondaryImage:RegisterAnimationSequence( "challengeCompleteAnim", {
			{
				function ()
					return self.SecondaryImage:SetAlpha( 0, 0 )
				end,
				function ()
					return self.SecondaryImage:SetAlpha( 1, 300, LUI.EASING.outBack )
				end,
				function ()
					return self.SecondaryImage:SetAlpha( 1, 1880 )
				end,
				function ()
					return self.SecondaryImage:SetAlpha( 0, 140 )
				end
			},
			{
				function ()
					return self.SecondaryImage:SetScale( 4, 0 )
				end,
				function ()
					return self.SecondaryImage:SetScale( 0, 300, LUI.EASING.outBack )
				end,
				function ()
					return self.SecondaryImage:SetScale( 0, 1780 )
				end,
				function ()
					return self.SecondaryImage:SetScale( -0.5, 240 )
				end
			},
			{
				function ()
					return self.SecondaryImage:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 218.5, _1080p * -216.5, _1080p * 80.5, _1080p * 208.5, 0 )
				end,
				function ()
					return self.SecondaryImage:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 218.5, _1080p * -216.5, _1080p * 80.5, _1080p * 208.5, 2079 )
				end,
				function ()
					return self.SecondaryImage:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 907.5, _1080p * 472.5, _1080p * 922.5, _1080p * 1050.5, 240 )
				end
			}
		} )
		challengeDescription:RegisterAnimationSequence( "challengeCompleteAnim", {
			{
				function ()
					return self.challengeDescription:SetAlpha( 0, 0 )
				end
			}
		} )
		challengeComplete:RegisterAnimationSequence( "challengeCompleteAnim", {
			{
				function ()
					return self.challengeComplete:SetAlpha( 0, 0 )
				end,
				function ()
					return self.challengeComplete:SetAlpha( 1, 200, LUI.EASING.outQuadratic )
				end,
				function ()
					return self.challengeComplete:SetAlpha( 1, 1800 )
				end,
				function ()
					return self.challengeComplete:SetAlpha( 0, 150 )
				end
			}
		} )
		self._sequences.challengeCompleteAnim = function ()
			LightRays:AnimateSequence( "challengeCompleteAnim" )
			styleIcon:AnimateSequence( "challengeCompleteAnim" )
			SecondaryImageBacking:AnimateSequence( "challengeCompleteAnim" )
			SecondaryImage:AnimateSequence( "challengeCompleteAnim" )
			challengeDescription:AnimateSequence( "challengeCompleteAnim" )
			challengeComplete:AnimateSequence( "challengeCompleteAnim" )
		end
		
		challengeDescription:RegisterAnimationSequence( "targetPlayerAnim", {
			{
				function ()
					return self.challengeDescription:SetAlpha( 0, 0 )
				end
			}
		} )
		challengeFailed:RegisterAnimationSequence( "targetPlayerAnim", {
			{
				function ()
					return self.challengeFailed:SetAlpha( 0, 0 )
				end
			}
		} )
		challengeComplete:RegisterAnimationSequence( "targetPlayerAnim", {
			{
				function ()
					return self.challengeComplete:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.targetPlayerAnim = function ()
			challengeDescription:AnimateSequence( "targetPlayerAnim" )
			challengeFailed:AnimateSequence( "targetPlayerAnim" )
			challengeComplete:AnimateSequence( "targetPlayerAnim" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	self:SubscribeToModel( DataSources.inGame.CP.zombies.challenges.challengeMessageDisplay:GetModel( f2_local1 ), function ()
		if DataSources.inGame.CP.zombies.challenges.challengeMessageDisplay:GetValue( f2_local1 ) ~= nil and DataSources.inGame.CP.zombies.challenges.challengeMessageDisplay:GetValue( f2_local1 ) == 2 then
			ACTIONS.AnimateSequence( self, "challengeFailedAnim" )
		end
		if DataSources.inGame.CP.zombies.challenges.challengeMessageDisplay:GetValue( f2_local1 ) ~= nil and DataSources.inGame.CP.zombies.challenges.challengeMessageDisplay:GetValue( f2_local1 ) == 3 then
			
		else
			
		end
		if DataSources.inGame.CP.zombies.challenges.challengeType:GetValue( f2_local1 ) ~= nil and DataSources.inGame.CP.zombies.challenges.challengeType:GetValue( f2_local1 ) == "nextchallenge" then
			ACTIONS.AnimateSequence( self, "DefaultSequence" )
		end
	end )
	self:addEventHandler( "message_queue_show", function ( f76_arg0, f76_arg1 )
		local f76_local0 = f76_arg1.controller or f2_local1
		ACTIONS.AnimateSequence( self, "challengeCompleteAnim" )
	end )
	self:addEventHandler( "message_queue_hide", function ( f77_arg0, f77_arg1 )
		local f77_local0 = f77_arg1.controller or f2_local1
		ACTIONS.AnimateSequence( self, "DefaultSequence" )
	end )
	f0_local0( self, f2_local1, controller )
	ACTIONS.AnimateSequence( self, "DefaultSequence" )
	return self
end

MenuBuilder.registerType( "challengeSplash", challengeSplash )
LockTable( _M )
