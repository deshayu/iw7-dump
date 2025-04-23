local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function PostLoadFunc( f1_arg0, f1_arg1, f1_arg2 )
	f1_arg0:SetXRotation( -35 * MP.SplitScreenRotModifier )
	f1_arg0:SubscribeToModel( DataSources.inGame.HUD.uplinkTimerStopped:GetModel( f1_arg1 ), function ()
		if DataSources.inGame.HUD.uplinkTimerStopped:GetValue( f1_arg1 ) then
			f1_arg0.Timer:freeze()
		else
			f1_arg0.Timer:unfreeze()
		end
	end )
end

function UplinkCarrierTimer( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 380 * _1080p, 0, 54 * _1080p )
	self.id = "UplinkCarrierTimer"
	self._animationSets = {}
	self._sequences = {}
	local f3_local1 = controller and controller.controllerIndex
	if not f3_local1 and not Engine.InFrontend() then
		f3_local1 = self:getRootController()
	end
	assert( f3_local1 )
	local f3_local2 = self
	local PlaceBg = nil
	
	PlaceBg = LUI.UIImage.new()
	PlaceBg.id = "PlaceBg"
	PlaceBg:SetRGBFromInt( 0, 0 )
	PlaceBg:SetAlpha( 0.3, 0 )
	PlaceBg:SetUseAA( true )
	PlaceBg:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 95, _1080p * 283, 0, _1080p * 73 )
	self:addElement( PlaceBg )
	self.PlaceBg = PlaceBg
	
	local HighlightBAr = nil
	
	HighlightBAr = LUI.UIImage.new()
	HighlightBAr.id = "HighlightBAr"
	HighlightBAr:SetAlpha( 0.3, 0 )
	HighlightBAr:SetUseAA( true )
	HighlightBAr:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 95, _1080p * 283, 0, _1080p * 30 )
	HighlightBAr:BindColorToModel( DataSources.inGame.HUD.uplinkBallStatusColor:GetModel( f3_local1 ) )
	self:addElement( HighlightBAr )
	self.HighlightBAr = HighlightBAr
	
	local DescText = nil
	
	DescText = LUI.UIStyledText.new()
	DescText.id = "DescText"
	DescText:setText( ToUpperCase( Engine.Localize( "MP_TDEF_DRONE_DATA" ) ), 0 )
	DescText:SetFontSize( 16 * _1080p )
	DescText:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	DescText:SetAlignment( LUI.Alignment.Center )
	DescText:SetShadowMinDistance( -0.2, 0 )
	DescText:SetShadowMaxDistance( 0.2, 0 )
	DescText:SetOutlineRGBFromInt( 0, 0 )
	DescText:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -60, _1080p * 440, _1080p * 32, _1080p * 49 )
	self:addElement( DescText )
	self.DescText = DescText
	
	local Timer = nil
	
	Timer = MenuBuilder.BuildRegisteredType( "UICountdown", {
		controllerIndex = f3_local1
	} )
	Timer.id = "Timer"
	Timer:SetFontSize( 30 * _1080p )
	Timer:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	Timer:SetAlignment( LUI.Alignment.Center )
	Timer:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -61, _1080p * 439, 0, _1080p * 30 )
	Timer:SubscribeToModel( DataSources.inGame.HUD.uplinkTimer:GetModel( f3_local1 ), function ()
		local f4_local0 = DataSources.inGame.HUD.uplinkTimer:GetValue( f3_local1 )
		if f4_local0 ~= nil then
			Timer:setEndTime( f4_local0 )
		end
	end )
	self:addElement( Timer )
	self.Timer = Timer
	
	local CapR = nil
	
	CapR = LUI.UIImage.new()
	CapR.id = "CapR"
	CapR:SetUseAA( true )
	CapR:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 283, _1080p * 288, 0, _1080p * 73 )
	CapR:BindColorToModel( DataSources.inGame.HUD.uplinkBallStatusColor:GetModel( f3_local1 ) )
	self:addElement( CapR )
	self.CapR = CapR
	
	local CapL = nil
	
	CapL = LUI.UIImage.new()
	CapL.id = "CapL"
	CapL:SetUseAA( true )
	CapL:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 95, _1080p * 89, 0, _1080p * 73 )
	CapL:BindColorToModel( DataSources.inGame.HUD.uplinkBallStatusColor:GetModel( f3_local1 ) )
	self:addElement( CapL )
	self.CapL = CapL
	
	local Score = nil
	
	Score = LUI.UIStyledText.new()
	Score.id = "Score"
	Score:SetFontSize( 24 * _1080p )
	Score:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	Score:SetAlignment( LUI.Alignment.Center )
	Score:SetShadowMinDistance( -0.2, 0 )
	Score:SetShadowMaxDistance( 0.2, 0 )
	Score:SetOutlineRGBFromInt( 0, 0 )
	Score:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -61, _1080p * 439, _1080p * 49, _1080p * 73 )
	Score:SubscribeToModel( DataSources.inGame.HUD.tDefCurrentScore:GetModel( f3_local1 ), function ()
		local f5_local0 = DataSources.inGame.HUD.tDefCurrentScore:GetValue( f3_local1 )
		if f5_local0 ~= nil then
			Score:setText( ToUpperCase( f5_local0 ), 0 )
		end
	end )
	self:addElement( Score )
	self.Score = Score
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		PlaceBg:RegisterAnimationSequence( "ShowBar", {
			{
				function ()
					return self.PlaceBg:SetAlpha( 0.3, 100 )
				end
			}
		} )
		HighlightBAr:RegisterAnimationSequence( "ShowBar", {
			{
				function ()
					return self.HighlightBAr:SetAlpha( 0.3, 100 )
				end
			}
		} )
		Timer:RegisterAnimationSequence( "ShowBar", {
			{
				function ()
					return self.Timer:SetAlpha( 1, 100 )
				end
			}
		} )
		CapR:RegisterAnimationSequence( "ShowBar", {
			{
				function ()
					return self.CapR:SetAlpha( 1, 100 )
				end
			}
		} )
		CapL:RegisterAnimationSequence( "ShowBar", {
			{
				function ()
					return self.CapL:SetAlpha( 1, 100 )
				end
			}
		} )
		Score:RegisterAnimationSequence( "ShowBar", {
			{
				function ()
					return self.Score:SetAlpha( 1, 100 )
				end
			}
		} )
		self._sequences.ShowBar = function ()
			PlaceBg:AnimateSequence( "ShowBar" )
			HighlightBAr:AnimateSequence( "ShowBar" )
			Timer:AnimateSequence( "ShowBar" )
			CapR:AnimateSequence( "ShowBar" )
			CapL:AnimateSequence( "ShowBar" )
			Score:AnimateSequence( "ShowBar" )
		end
		
		PlaceBg:RegisterAnimationSequence( "HideBar", {
			{
				function ()
					return self.PlaceBg:SetAlpha( 0, 100 )
				end
			}
		} )
		HighlightBAr:RegisterAnimationSequence( "HideBar", {
			{
				function ()
					return self.HighlightBAr:SetAlpha( 0, 100 )
				end
			}
		} )
		DescText:RegisterAnimationSequence( "HideBar", {
			{
				function ()
					return self.DescText:SetAlpha( 0, 100 )
				end
			}
		} )
		Timer:RegisterAnimationSequence( "HideBar", {
			{
				function ()
					return self.Timer:SetAlpha( 0, 100 )
				end
			}
		} )
		CapR:RegisterAnimationSequence( "HideBar", {
			{
				function ()
					return self.CapR:SetAlpha( 0, 100 )
				end
			}
		} )
		CapL:RegisterAnimationSequence( "HideBar", {
			{
				function ()
					return self.CapL:SetAlpha( 0, 100 )
				end
			}
		} )
		Score:RegisterAnimationSequence( "HideBar", {
			{
				function ()
					return self.Score:SetAlpha( 0, 100 )
				end
			}
		} )
		self._sequences.HideBar = function ()
			PlaceBg:AnimateSequence( "HideBar" )
			HighlightBAr:AnimateSequence( "HideBar" )
			DescText:AnimateSequence( "HideBar" )
			Timer:AnimateSequence( "HideBar" )
			CapR:AnimateSequence( "HideBar" )
			CapL:AnimateSequence( "HideBar" )
			Score:AnimateSequence( "HideBar" )
		end
		
		Score:RegisterAnimationSequence( "UpdateData", {
			{
				function ()
					return self.Score:SetAlpha( 0, 100 )
				end,
				function ()
					return self.Score:SetAlpha( 1, 200 )
				end
			}
		} )
		self._sequences.UpdateData = function ()
			Score:AnimateSequence( "UpdateData" )
		end
		
		DescText:RegisterAnimationSequence( "ShowDesc", {
			{
				function ()
					return self.DescText:SetRGBFromInt( 16777215, 100 )
				end
			},
			{
				function ()
					return self.DescText:SetAlpha( 1, 100 )
				end
			}
		} )
		self._sequences.ShowDesc = function ()
			DescText:AnimateSequence( "ShowDesc" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	self:SubscribeToModel( DataSources.inGame.HUD.uplinkTimerHUD:GetModel( f3_local1 ), function ()
		if DataSources.inGame.HUD.uplinkTimerHUD:GetValue( f3_local1 ) ~= nil and DataSources.inGame.HUD.uplinkTimerHUD:GetValue( f3_local1 ) == true then
			ACTIONS.AnimateSequence( self, "ShowBar" )
		end
		if DataSources.inGame.HUD.uplinkTimerHUD:GetValue( f3_local1 ) ~= nil and DataSources.inGame.HUD.uplinkTimerHUD:GetValue( f3_local1 ) == false then
			ACTIONS.AnimateSequence( self, "HideBar" )
		end
		if DataSources.inGame.MP.match.gameType:GetValue( f3_local1 ) ~= nil and DataSources.inGame.MP.match.gameType:GetValue( f3_local1 ) == "tdef" and DataSources.inGame.HUD.uplinkTimerHUD:GetValue( f3_local1 ) ~= nil and DataSources.inGame.HUD.uplinkTimerHUD:GetValue( f3_local1 ) == true then
			ACTIONS.AnimateSequence( self, "ShowDesc" )
		end
	end )
	local f3_local10 = function ()
		if DataSources.inGame.HUD.uplinkTimerHUD:GetValue( f3_local1 ) ~= nil and DataSources.inGame.HUD.uplinkTimerHUD:GetValue( f3_local1 ) == true then
			ACTIONS.AnimateSequence( self, "UpdateData" )
		end
	end
	
	self:SubscribeToModel( DataSources.inGame.HUD.uplinkTimerHUD:GetModel( f3_local1 ), f3_local10 )
	self:SubscribeToModel( DataSources.inGame.MP.match.teamScoreFriendly:GetModel( f3_local1 ), f3_local10 )
	PostLoadFunc( self, f3_local1, controller )
	return self
end

MenuBuilder.registerType( "UplinkCarrierTimer", UplinkCarrierTimer )
LockTable( _M )
