local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function PostLoadFunc( f1_arg0, f1_arg1, f1_arg2 )
	f1_arg0:SetYRotation( 20 * MP.SplitScreenRotModifier )
	f1_arg0:SetXRotation( 5 * MP.SplitScreenRotModifier )
	f1_arg0.Place:SetShadowUOffset( -0 )
	f1_arg0.Place:SetShadowVOffset( -0 )
	f1_arg0:SubscribeToModel( DataSources.inGame.HUD.uplinkTimerStopped:GetModel( f1_arg1 ), function ()
		if DataSources.inGame.HUD.uplinkTimerStopped:GetValue( f1_arg1 ) then
			f1_arg0.Timer:freeze()
		else
			f1_arg0.Timer:unfreeze()
		end
	end )
end

function UplinkTimer( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 380 * _1080p, 0, 54 * _1080p )
	self.id = "UplinkTimer"
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
	HighlightBAr:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 95, _1080p * 283, 0, _1080p * 44 )
	HighlightBAr:BindColorToModel( DataSources.inGame.HUD.uplinkBallStatusColor:GetModel( f3_local1 ) )
	self:addElement( HighlightBAr )
	self.HighlightBAr = HighlightBAr
	
	local Place = nil
	
	Place = LUI.UIStyledText.new()
	Place.id = "Place"
	Place:SetFontSize( 22 * _1080p )
	Place:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	Place:SetAlignment( LUI.Alignment.Center )
	Place:SetShadowMinDistance( -0.2, 0 )
	Place:SetShadowMaxDistance( 0.2, 0 )
	Place:SetOutlineRGBFromInt( 0, 0 )
	Place:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 7, _1080p * 371, _1080p * 47, _1080p * 69 )
	Place:SubscribeToModel( DataSources.inGame.HUD.uplinkTimerTextStatus:GetModel( f3_local1 ), function ()
		local f4_local0 = DataSources.inGame.HUD.uplinkTimerTextStatus:GetValue( f3_local1 )
		if f4_local0 ~= nil then
			Place:setText( ToUpperCase( f4_local0 ), 0 )
		end
	end )
	self:addElement( Place )
	self.Place = Place
	
	local Timer = nil
	
	Timer = MenuBuilder.BuildRegisteredType( "UICountdown", {
		controllerIndex = f3_local1
	} )
	Timer.id = "Timer"
	Timer:SetFontSize( 30 * _1080p )
	Timer:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	Timer:SetAlignment( LUI.Alignment.Center )
	Timer:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 27.5, _1080p * 352.5, _1080p * 6.5, _1080p * 36.5 )
	Timer:SubscribeToModel( DataSources.inGame.HUD.uplinkTimer:GetModel( f3_local1 ), function ()
		local f5_local0 = DataSources.inGame.HUD.uplinkTimer:GetValue( f3_local1 )
		if f5_local0 ~= nil then
			Timer:setEndTime( f5_local0 )
		end
	end )
	self:addElement( Timer )
	self.Timer = Timer
	
	local CapR = nil
	
	CapR = LUI.UIImage.new()
	CapR.id = "CapR"
	CapR:SetUseAA( true )
	CapR:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 282, _1080p * 286, 0, _1080p * 73 )
	self:addElement( CapR )
	self.CapR = CapR
	
	local CapRCopy0 = nil
	
	CapRCopy0 = LUI.UIImage.new()
	CapRCopy0.id = "CapRCopy0"
	CapRCopy0:SetUseAA( true )
	CapRCopy0:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 96, _1080p * 92, 0, _1080p * 73 )
	self:addElement( CapRCopy0 )
	self.CapRCopy0 = CapRCopy0
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		self._sequences.ShowBar = function ()
			
		end
		
		Timer:RegisterAnimationSequence( "HideBar", {
			{
				function ()
					return self.Timer:SetAlpha( 0, 200 )
				end,
				function ()
					return self.Timer:SetAlpha( 1, 200 )
				end
			}
		} )
		self._sequences.HideBar = function ()
			Timer:AnimateSequence( "HideBar" )
		end
		
		PlaceBg:RegisterAnimationSequence( "HideAll", {
			{
				function ()
					return self.PlaceBg:SetAlpha( 0, 100 )
				end
			}
		} )
		HighlightBAr:RegisterAnimationSequence( "HideAll", {
			{
				function ()
					return self.HighlightBAr:SetAlpha( 0, 100 )
				end
			}
		} )
		Place:RegisterAnimationSequence( "HideAll", {
			{
				function ()
					return self.Place:SetAlpha( 0, 100 )
				end
			}
		} )
		Timer:RegisterAnimationSequence( "HideAll", {
			{
				function ()
					return self.Timer:SetAlpha( 0, 100 )
				end
			}
		} )
		CapR:RegisterAnimationSequence( "HideAll", {
			{
				function ()
					return self.CapR:SetAlpha( 0, 100 )
				end
			}
		} )
		CapRCopy0:RegisterAnimationSequence( "HideAll", {
			{
				function ()
					return self.CapRCopy0:SetAlpha( 0, 100 )
				end
			}
		} )
		self._sequences.HideAll = function ()
			PlaceBg:AnimateSequence( "HideAll" )
			HighlightBAr:AnimateSequence( "HideAll" )
			Place:AnimateSequence( "HideAll" )
			Timer:AnimateSequence( "HideAll" )
			CapR:AnimateSequence( "HideAll" )
			CapRCopy0:AnimateSequence( "HideAll" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	local f3_local9 = function ()
		if DataSources.inGame.HUD.uplinkTimerShow:GetValue( f3_local1 ) ~= nil and DataSources.inGame.HUD.uplinkTimerShow:GetValue( f3_local1 ) == 1 then
			ACTIONS.AnimateSequence( self, "HideBar" )
		end
		if DataSources.inGame.HUD.uplinkTimerShow:GetValue( f3_local1 ) ~= nil and DataSources.inGame.HUD.uplinkTimerShow:GetValue( f3_local1 ) == 0 then
			ACTIONS.AnimateSequence( self, "HideAll" )
		end
	end
	
	self:SubscribeToModel( DataSources.inGame.HUD.uplinkTimerShow:GetModel( f3_local1 ), f3_local9 )
	self:SubscribeToModel( DataSources.inGame.HUD.uplinkTimer:GetModel( f3_local1 ), f3_local9 )
	PostLoadFunc( self, f3_local1, controller )
	return self
end

MenuBuilder.registerType( "UplinkTimer", UplinkTimer )
LockTable( _M )
