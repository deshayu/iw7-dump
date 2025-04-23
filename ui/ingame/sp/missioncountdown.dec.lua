local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function MissionCountdown( menu, controller )
	local self = LUI.UIButton.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 275 * _1080p, 0, 30 * _1080p )
	self.id = "MissionCountdown"
	self._animationSets = {}
	self._sequences = {}
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local Countdown = nil
	
	Countdown = LUI.UIText.new()
	Countdown.id = "Countdown"
	Countdown:SetFontSize( 20 * _1080p )
	Countdown:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	Countdown:SetAlignment( LUI.Alignment.Center )
	Countdown:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 3, _1080p * 272, _1080p * 3.5, _1080p * 26.5 )
	Countdown:SubscribeToModel( DataSources.inGame.SP.missionCountdown.timer:GetModel( f1_local1 ), function ()
		local f2_local0 = DataSources.inGame.SP.missionCountdown.timer:GetValue( f1_local1 )
		if f2_local0 ~= nil then
			Countdown:setText( LocalizeIntoString( MillisecondsToCountdownString( f2_local0 ), DataSources.inGame.SP.missionCountdown.missionText:GetValue( f1_local1 ) ), 0 )
		end
	end )
	Countdown:SubscribeToModel( DataSources.inGame.SP.missionCountdown.missionText:GetModel( f1_local1 ), function ()
		local f3_local0 = DataSources.inGame.SP.missionCountdown.timer:GetValue( f1_local1 )
		if f3_local0 ~= nil then
			Countdown:setText( LocalizeIntoString( MillisecondsToCountdownString( f3_local0 ), DataSources.inGame.SP.missionCountdown.missionText:GetValue( f1_local1 ) ), 0 )
		end
	end )
	self:addElement( Countdown )
	self.Countdown = Countdown
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		Countdown:RegisterAnimationSequence( "FadeIn", {
			{
				function ()
					return self.Countdown:SetAlpha( 1, 500 )
				end
			}
		} )
		self._sequences.FadeIn = function ()
			Countdown:AnimateSequence( "FadeIn" )
		end
		
		Countdown:RegisterAnimationSequence( "FadeOut", {
			{
				function ()
					return self.Countdown:SetAlpha( 0, 500 )
				end
			}
		} )
		self._sequences.FadeOut = function ()
			Countdown:AnimateSequence( "FadeOut" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	Countdown:SubscribeToModel( DataSources.inGame.SP.missionCountdown.timer:GetModel( f1_local1 ), function ()
		if DataSources.inGame.SP.missionCountdown.timer:GetValue( f1_local1 ) ~= nil and DataSources.inGame.SP.missionCountdown.timer:GetValue( f1_local1 ) == 0 then
			ACTIONS.AnimateSequence( self, "FadeOut" )
		end
		if DataSources.inGame.SP.missionCountdown.timer:GetValue( f1_local1 ) ~= nil and DataSources.inGame.SP.missionCountdown.timer:GetValue( f1_local1 ) > 0 then
			ACTIONS.AnimateSequence( self, "FadeIn" )
		end
	end )
	return self
end

MenuBuilder.registerType( "MissionCountdown", MissionCountdown )
LockTable( _M )
