local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ( f1_arg0, f1_arg1 )
	assert( f1_arg0.SoulPowerTitle, "WARNING: After Life Self Revive Progress Items Are Missing..." )
	f1_arg0.SoulPowerTitle:SetShadowUOffset( -0 )
	f1_arg0.SoulPowerTitle:SetShadowVOffset( -0 )
	local f1_local0 = DataSources.inGame.CP.zombies.inAfterlifeArcade
	local f1_local1 = DataSources.inGame.CP.zombies.afterlifeHasSelfReviveToken
	f1_arg0:SubscribeToModel( f1_local0:GetModel( f1_arg1 ), function ()
		local f2_local0 = f1_local0:GetValue( f1_arg1 )
		local f2_local1 = f1_local1:GetValue( f1_arg1 ) == 1
		if f2_local0 then
			if f2_local1 then
				ACTIONS.AnimateSequence( f1_arg0, "ShowTokenMessage" )
			else
				ACTIONS.AnimateSequence( f1_arg0, "Bootup" )
			end
		end
	end )
	f1_arg0:SubscribeToModel( f1_local1:GetModel( f1_arg1 ), function ( f3_arg0 )
		if DataModel.GetModelValue( f3_arg0 ) == 1 then
			ACTIONS.AnimateSequence( f1_arg0, "ShowTokenMessage" )
		end
	end, true )
end

function afterlifeSelfReviveProgress( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 1920 * _1080p, 0, 10 * _1080p )
	self.id = "afterlifeSelfReviveProgress"
	self._animationSets = {}
	self._sequences = {}
	local f4_local1 = controller and controller.controllerIndex
	if not f4_local1 and not Engine.InFrontend() then
		f4_local1 = self:getRootController()
	end
	assert( f4_local1 )
	local f4_local2 = self
	local ArcaneSpinner = nil
	
	ArcaneSpinner = MenuBuilder.BuildRegisteredType( "AfterLifeArcaneSpinner", {
		controllerIndex = f4_local1
	} )
	ArcaneSpinner.id = "ArcaneSpinner"
	ArcaneSpinner:SetAlpha( 0, 0 )
	ArcaneSpinner:SetScale( -0.5, 0 )
	ArcaneSpinner:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -256, _1080p * 256, _1080p * -256, _1080p * 256 )
	self:addElement( ArcaneSpinner )
	self.ArcaneSpinner = ArcaneSpinner
	
	local ProgressBar = nil
	
	ProgressBar = MenuBuilder.BuildRegisteredType( "AfterLifeProgressBar", {
		controllerIndex = f4_local1
	} )
	ProgressBar.id = "ProgressBar"
	ProgressBar:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -590, _1080p * 590, _1080p * -5, _1080p * 5 )
	self:addElement( ProgressBar )
	self.ProgressBar = ProgressBar
	
	local SoulPowerTitle = nil
	
	SoulPowerTitle = LUI.UIStyledText.new()
	SoulPowerTitle.id = "SoulPowerTitle"
	SoulPowerTitle:setText( ToUpperCase( Engine.Localize( "ZOMBIE_HUD_SOUL_POWER" ) ), 0 )
	SoulPowerTitle:SetFontSize( 30 * _1080p )
	SoulPowerTitle:SetFont( FONTS.GetFont( FONTS.ZmClean.File ) )
	SoulPowerTitle:SetAlignment( LUI.Alignment.Center )
	SoulPowerTitle:SetShadowMinDistance( -0.2, 0 )
	SoulPowerTitle:SetShadowMaxDistance( 0.2, 0 )
	SoulPowerTitle:SetDecodeUseSystemTime( false )
	SoulPowerTitle:SetAnchorsAndPosition( 0, 0, 0.5, 0.5, 0, 0, _1080p * -35, _1080p * -5 )
	self:addElement( SoulPowerTitle )
	self.SoulPowerTitle = SoulPowerTitle
	
	local Message = nil
	
	Message = MenuBuilder.BuildRegisteredType( "AfterLifeMessage", {
		controllerIndex = f4_local1
	} )
	Message.id = "Message"
	Message.MessageText:setText( Engine.Localize( "CP_ZOMBIE_AFTERLIFE_ARCADE_WELCOME" ), 0 )
	Message:SetAnchorsAndPosition( 0, 0, 0.5, 0.5, 0, 0, _1080p * -15, _1080p * 15 )
	self:addElement( Message )
	self.Message = Message
	
	local f4_local7 = nil
	if CONDITIONS.IsRave( self ) then
		f4_local7 = LUI.UIImage.new()
		f4_local7.id = "Ghost"
		f4_local7:SetScale( -0.71, 0 )
		f4_local7:setImage( RegisterMaterial( "zm_hud_pixel_skull" ), 0 )
		f4_local7:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 832, _1080p * 1088, _1080p * -195.12, _1080p * 60.88 )
		f4_local7:BindAlphaToModel( DataSources.inGame.CP.zombies.ghost.ghostAfterLifeIconAlpha:GetModel( f4_local1 ) )
		self:addElement( f4_local7 )
		self.Ghost = f4_local7
	end
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		ArcaneSpinner:RegisterAnimationSequence( "Bootup", {
			{
				function ()
					return self.ArcaneSpinner:SetAlpha( 0, 0 )
				end
			}
		} )
		ProgressBar:RegisterAnimationSequence( "Bootup", {
			{
				function ()
					return self.ProgressBar:SetAlpha( 0, 0 )
				end,
				function ()
					return self.ProgressBar:SetAlpha( 0, 2600 )
				end,
				function ()
					return self.ProgressBar:SetAlpha( 1, 200 )
				end
			}
		} )
		SoulPowerTitle:RegisterAnimationSequence( "Bootup", {
			{
				function ()
					return self.SoulPowerTitle:SetAlpha( 0, 0 )
				end,
				function ()
					return self.SoulPowerTitle:SetAlpha( 0, 2600 )
				end,
				function ()
					return self.SoulPowerTitle:SetAlpha( 1, 200 )
				end
			}
		} )
		Message:RegisterAnimationSequence( "Bootup", {
			{
				function ()
					return self.Message:SetAlpha( 0, 0 )
				end,
				function ()
					return self.Message:SetAlpha( 0, 300, LUI.EASING.outBack )
				end,
				function ()
					return self.Message:SetAlpha( 0, 2000 )
				end,
				function ()
					return self.Message:SetAlpha( 0, 300, LUI.EASING.inBack )
				end
			},
			{
				function ()
					return self.Message:SetScale( -1, 0 )
				end,
				function ()
					return self.Message:SetScale( 0, 300, LUI.EASING.outBack )
				end,
				function ()
					return self.Message:SetScale( 0, 2000 )
				end,
				function ()
					return self.Message:SetScale( -1, 300, LUI.EASING.inBack )
				end
			},
			{
				function ()
					return self.Message.MessageText:setText( Engine.Localize( "CP_ZOMBIE_AFTERLIFE_ARCADE_WELCOME" ), 0 )
				end
			}
		} )
		if CONDITIONS.IsRave( self ) then
			f4_local7:RegisterAnimationSequence( "Bootup", {
				{
					function ()
						return self.Ghost:SetScale( -0.99, 0 )
					end,
					function ()
						return self.Ghost:SetScale( -0.99, 2600 )
					end,
					function ()
						return self.Ghost:SetScale( -0.71, 200 )
					end
				}
			} )
		end
		self._sequences.Bootup = function ()
			ArcaneSpinner:AnimateSequence( "Bootup" )
			ProgressBar:AnimateSequence( "Bootup" )
			SoulPowerTitle:AnimateSequence( "Bootup" )
			Message:AnimateSequence( "Bootup" )
			if CONDITIONS.IsRave( self ) then
				f4_local7:AnimateSequence( "Bootup" )
			end
		end
		
		ArcaneSpinner:RegisterAnimationSequence( "ShowTokenMessage", {
			{
				function ()
					return self.ArcaneSpinner:SetScale( -1, 0 )
				end,
				function ()
					return self.ArcaneSpinner:SetScale( -1, 200 )
				end,
				function ()
					return self.ArcaneSpinner:SetScale( 1, 1000 )
				end
			},
			{
				function ()
					return self.ArcaneSpinner:SetAlpha( 0, 0 )
				end,
				function ()
					return self.ArcaneSpinner:SetAlpha( 0, 200 )
				end,
				function ()
					return self.ArcaneSpinner:SetAlpha( 1, 500 )
				end,
				function ()
					return self.ArcaneSpinner:SetAlpha( 0, 500 )
				end
			}
		} )
		ProgressBar:RegisterAnimationSequence( "ShowTokenMessage", {
			{
				function ()
					return self.ProgressBar:SetAlpha( 1, 0 )
				end,
				function ()
					return self.ProgressBar:SetAlpha( 0, 200 )
				end
			}
		} )
		SoulPowerTitle:RegisterAnimationSequence( "ShowTokenMessage", {
			{
				function ()
					return self.SoulPowerTitle:SetAlpha( 1, 0 )
				end,
				function ()
					return self.SoulPowerTitle:SetAlpha( 0, 200 )
				end
			}
		} )
		Message:RegisterAnimationSequence( "ShowTokenMessage", {
			{
				function ()
					return self.Message:SetAlpha( 0, 0 )
				end,
				function ()
					return self.Message:SetAlpha( 0, 200 )
				end,
				function ()
					return self.Message:SetAlpha( 1, 300, LUI.EASING.outBack )
				end
			},
			{
				function ()
					return self.Message:SetScale( -1, 0 )
				end,
				function ()
					return self.Message:SetScale( -1, 200 )
				end,
				function ()
					return self.Message:SetScale( 0, 300, LUI.EASING.outBack )
				end
			},
			{
				function ()
					return self.Message.MessageText:setText( Engine.Localize( "CP_ZOMBIE_EARN_SELF_REVIVE" ), 0 )
				end
			}
		} )
		self._sequences.ShowTokenMessage = function ()
			ArcaneSpinner:AnimateSequence( "ShowTokenMessage" )
			ProgressBar:AnimateSequence( "ShowTokenMessage" )
			SoulPowerTitle:AnimateSequence( "ShowTokenMessage" )
			Message:AnimateSequence( "ShowTokenMessage" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	f0_local0( self, f4_local1, controller )
	return self
end

MenuBuilder.registerType( "afterlifeSelfReviveProgress", afterlifeSelfReviveProgress )
LockTable( _M )
