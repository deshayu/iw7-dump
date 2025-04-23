local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function PostLoadFunc( f1_arg0, f1_arg1, f1_arg2 )
	f1_arg0:SetYRotation( 30 )
	f1_arg0:SetXRotation( -10 * MP.SplitScreenRotModifier )
	f1_arg0:SubscribeToModel( DataSources.inGame.HUD.crankedTimerStopped:GetModel( f1_arg1 ), function ()
		if DataSources.inGame.HUD.crankedTimerStopped:GetValue( f1_arg1 ) then
			f1_arg0.Timer:freeze()
		else
			f1_arg0.Timer:unfreeze()
		end
	end )
end

function CrankedTimer( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 380 * _1080p, 0, 54 * _1080p )
	self.id = "CrankedTimer"
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
	PlaceBg:SetAlpha( 0, 0 )
	PlaceBg:SetUseAA( true )
	PlaceBg:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 95, _1080p * 283, 0, _1080p * 73 )
	self:addElement( PlaceBg )
	self.PlaceBg = PlaceBg
	
	local HighlightBAr = nil
	
	HighlightBAr = LUI.UIImage.new()
	HighlightBAr.id = "HighlightBAr"
	HighlightBAr:SetRGBFromTable( SWATCHES.HUD.Countdown, 0 )
	HighlightBAr:SetAlpha( 0, 0 )
	HighlightBAr:SetUseAA( true )
	HighlightBAr:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 95, _1080p * 283, 0, _1080p * 54 )
	self:addElement( HighlightBAr )
	self.HighlightBAr = HighlightBAr
	
	local Place = nil
	
	Place = LUI.UIStyledText.new()
	Place.id = "Place"
	Place:SetAlpha( 0, 0 )
	Place:setText( ToUpperCase( Engine.Localize( "MP_CRANKED" ) ), 0 )
	Place:SetFontSize( 22 * _1080p )
	Place:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	Place:SetAlignment( LUI.Alignment.Center )
	Place:SetShadowMinDistance( -0.2, 0 )
	Place:SetShadowMaxDistance( 0.2, 0 )
	Place:SetOutlineRGBFromInt( 0, 0 )
	Place:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 7, _1080p * 371, _1080p * 51, _1080p * 73 )
	self:addElement( Place )
	self.Place = Place
	
	local Timer = nil
	
	Timer = MenuBuilder.BuildRegisteredType( "UICountdown", {
		controllerIndex = f3_local1
	} )
	Timer.id = "Timer"
	Timer:SetAlpha( 0, 0 )
	Timer:SetFontSize( 50 * _1080p )
	Timer:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	Timer:SetAlignment( LUI.Alignment.Center )
	Timer:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 27.5, _1080p * 352.5, _1080p * 4, _1080p * 54 )
	Timer:SubscribeToModel( DataSources.inGame.HUD.crankedTimer:GetModel( f3_local1 ), function ()
		local f4_local0 = DataSources.inGame.HUD.crankedTimer:GetValue( f3_local1 )
		if f4_local0 ~= nil then
			Timer:setEndTime( f4_local0 )
		end
	end )
	self:addElement( Timer )
	self.Timer = Timer
	
	local CapR = nil
	
	CapR = LUI.UIImage.new()
	CapR.id = "CapR"
	CapR:SetRGBFromTable( SWATCHES.HUD.Countdown, 0 )
	CapR:SetAlpha( 0, 0 )
	CapR:SetUseAA( true )
	CapR:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 283, _1080p * 288, 0, _1080p * 73 )
	self:addElement( CapR )
	self.CapR = CapR
	
	local CapRCopy0 = nil
	
	CapRCopy0 = LUI.UIImage.new()
	CapRCopy0.id = "CapRCopy0"
	CapRCopy0:SetRGBFromTable( SWATCHES.HUD.Countdown, 0 )
	CapRCopy0:SetAlpha( 0, 0 )
	CapRCopy0:SetUseAA( true )
	CapRCopy0:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 95, _1080p * 89, 0, _1080p * 73 )
	self:addElement( CapRCopy0 )
	self.CapRCopy0 = CapRCopy0
	
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
		Place:RegisterAnimationSequence( "ShowBar", {
			{
				function ()
					return self.Place:SetAlpha( 1, 100 )
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
		CapRCopy0:RegisterAnimationSequence( "ShowBar", {
			{
				function ()
					return self.CapRCopy0:SetAlpha( 1, 100 )
				end
			}
		} )
		self._sequences.ShowBar = function ()
			PlaceBg:AnimateSequence( "ShowBar" )
			HighlightBAr:AnimateSequence( "ShowBar" )
			Place:AnimateSequence( "ShowBar" )
			Timer:AnimateSequence( "ShowBar" )
			CapR:AnimateSequence( "ShowBar" )
			CapRCopy0:AnimateSequence( "ShowBar" )
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
					return self.HighlightBAr:SetRGBFromTable( SWATCHES.HUD.disabled, 0 )
				end,
				function ()
					return self.HighlightBAr:SetRGBFromTable( SWATCHES.HUD.Countdown, 100 )
				end
			},
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
					return self.Timer:SetRGBFromTable( SWATCHES.HUD.disabled, 0 )
				end,
				function ()
					return self.Timer:SetRGBFromTable( SWATCHES.HUD.Countdown, 100 )
				end
			},
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
		
		HighlightBAr:RegisterAnimationSequence( "FinalSeconds", {
			{
				function ()
					return self.HighlightBAr:SetAlpha( 1, 0 )
				end,
				function ()
					return self.HighlightBAr:SetAlpha( 1, 500 )
				end,
				function ()
					return self.HighlightBAr:SetAlpha( 1, 500 )
				end
			},
			{
				function ()
					return self.HighlightBAr:SetRGBFromTable( SWATCHES.HUD.Countdown, 0 )
				end,
				function ()
					return self.HighlightBAr:SetRGBFromTable( SWATCHES.HUD.background, 500 )
				end,
				function ()
					return self.HighlightBAr:SetRGBFromTable( SWATCHES.HUD.Countdown, 500 )
				end
			}
		} )
		Place:RegisterAnimationSequence( "FinalSeconds", {
			{
				function ()
					return self.Place:SetAlpha( 1, 0 )
				end,
				function ()
					return self.Place:SetAlpha( 0.5, 500 )
				end,
				function ()
					return self.Place:SetAlpha( 1, 500 )
				end
			}
		} )
		Timer:RegisterAnimationSequence( "FinalSeconds", {
			{
				function ()
					return self.Timer:SetDotPitchMode( 1 )
				end
			},
			{
				function ()
					return self.Timer:SetRGBFromTable( SWATCHES.HUD.background, 0 )
				end,
				function ()
					return self.Timer:SetRGBFromTable( SWATCHES.HUD.Countdown, 500 )
				end,
				function ()
					return self.Timer:SetRGBFromTable( SWATCHES.HUD.background, 500 )
				end
			}
		} )
		CapR:RegisterAnimationSequence( "FinalSeconds", {
			{
				function ()
					return self.CapR:SetRGBFromTable( SWATCHES.HUD.Countdown, 0 )
				end
			},
			{
				function ()
					return self.CapR:SetAlpha( 1, 0 )
				end,
				function ()
					return self.CapR:SetAlpha( 0.5, 500, LUI.EASING.inOutBack )
				end,
				function ()
					return self.CapR:SetAlpha( 1, 500, LUI.EASING.inOutBack )
				end
			}
		} )
		CapRCopy0:RegisterAnimationSequence( "FinalSeconds", {
			{
				function ()
					return self.CapRCopy0:SetRGBFromTable( SWATCHES.HUD.Countdown, 0 )
				end
			},
			{
				function ()
					return self.CapRCopy0:SetAlpha( 1, 0 )
				end,
				function ()
					return self.CapRCopy0:SetAlpha( 0.5, 500, LUI.EASING.inOutBack )
				end,
				function ()
					return self.CapRCopy0:SetAlpha( 1, 500, LUI.EASING.inOutBack )
				end
			}
		} )
		self._sequences.FinalSeconds = function ()
			HighlightBAr:AnimateLoop( "FinalSeconds" )
			Place:AnimateLoop( "FinalSeconds" )
			Timer:AnimateLoop( "FinalSeconds" )
			CapR:AnimateLoop( "FinalSeconds" )
			CapRCopy0:AnimateLoop( "FinalSeconds" )
		end
		
		PlaceBg:RegisterAnimationSequence( "Refresh", {
			{
				function ()
					return self.PlaceBg:SetAlpha( 0.3, 0 )
				end,
				function ()
					return self.PlaceBg:SetAlpha( 0.6, 150 )
				end,
				function ()
					return self.PlaceBg:SetAlpha( 0.3, 150 )
				end
			},
			{
				function ()
					return self.PlaceBg:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 95, _1080p * 283, 0, _1080p * 73, 0 )
				end,
				function ()
					return self.PlaceBg:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 93, _1080p * 285, _1080p * -8, _1080p * 73, 150 )
				end,
				function ()
					return self.PlaceBg:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 95, _1080p * 283, 0, _1080p * 73, 150 )
				end
			}
		} )
		HighlightBAr:RegisterAnimationSequence( "Refresh", {
			{
				function ()
					return self.HighlightBAr:SetAlpha( 0.3, 0 )
				end,
				function ()
					return self.HighlightBAr:SetAlpha( 0.6, 150 )
				end,
				function ()
					return self.HighlightBAr:SetAlpha( 0.3, 150 )
				end
			},
			{
				function ()
					return self.HighlightBAr:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 95, _1080p * 288, 0, _1080p * 54, 0 )
				end,
				function ()
					return self.HighlightBAr:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 95, _1080p * 288, _1080p * -8, _1080p * 54, 150 )
				end,
				function ()
					return self.HighlightBAr:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 95, _1080p * 288, 0, _1080p * 54, 150 )
				end
			}
		} )
		Place:RegisterAnimationSequence( "Refresh", {
			{
				function ()
					return self.Place:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.Place:SetRGBFromTable( SWATCHES.HUD.normal, 0 )
				end,
				function ()
					return self.Place:SetRGBFromTable( SWATCHES.HUD.Countdown, 150 )
				end,
				function ()
					return self.Place:SetRGBFromTable( SWATCHES.HUD.normal, 150 )
				end
			},
			{
				function ()
					return self.Place:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 7, _1080p * 371, _1080p * 50, _1080p * 73, 0 )
				end,
				function ()
					return self.Place:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 7, _1080p * 371, _1080p * 43, _1080p * 73, 150 )
				end,
				function ()
					return self.Place:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 7, _1080p * 371, _1080p * 50, _1080p * 73, 150 )
				end
			}
		} )
		Timer:RegisterAnimationSequence( "Refresh", {
			{
				function ()
					return self.Timer:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.Timer:SetRGBFromTable( SWATCHES.HUD.Countdown, 0 )
				end,
				function ()
					return self.Timer:SetRGBFromTable( SWATCHES.HUD.normal, 150 )
				end,
				function ()
					return self.Timer:SetRGBFromTable( SWATCHES.HUD.Countdown, 150 )
				end
			},
			{
				function ()
					return self.Timer:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 27.5, _1080p * 352.5, _1080p * 5, _1080p * 54, 0 )
				end,
				function ()
					return self.Timer:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 27.5, _1080p * 352.5, _1080p * -8, _1080p * 50, 150 )
				end,
				function ()
					return self.Timer:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 27.5, _1080p * 352.5, _1080p * 4, _1080p * 54, 150 )
				end
			}
		} )
		CapR:RegisterAnimationSequence( "Refresh", {
			{
				function ()
					return self.CapR:SetAlpha( 1, 0 )
				end,
				function ()
					return self.CapR:SetAlpha( 1, 300 )
				end
			},
			{
				function ()
					return self.CapR:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 283, _1080p * 288, 0, _1080p * 73, 0 )
				end,
				function ()
					return self.CapR:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 283, _1080p * 295, _1080p * -8, _1080p * 73, 150 )
				end,
				function ()
					return self.CapR:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 283, _1080p * 288, 0, _1080p * 73, 150 )
				end
			}
		} )
		CapRCopy0:RegisterAnimationSequence( "Refresh", {
			{
				function ()
					return self.CapRCopy0:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.CapRCopy0:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 95, _1080p * 90, 0, _1080p * 73, 0 )
				end,
				function ()
					return self.CapRCopy0:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 95, _1080p * 83, _1080p * -8, _1080p * 73, 150 )
				end,
				function ()
					return self.CapRCopy0:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 95, _1080p * 90, 0, _1080p * 73, 150 )
				end
			}
		} )
		self._sequences.Refresh = function ()
			PlaceBg:AnimateSequence( "Refresh" )
			HighlightBAr:AnimateSequence( "Refresh" )
			Place:AnimateSequence( "Refresh" )
			Timer:AnimateSequence( "Refresh" )
			CapR:AnimateSequence( "Refresh" )
			CapRCopy0:AnimateSequence( "Refresh" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	self:SubscribeToModel( DataSources.inGame.HUD.crankedTimer:GetModel( f3_local1 ), function ()
		if DataSources.inGame.HUD.crankedTimer:GetValue( f3_local1 ) ~= nil and DataSources.inGame.HUD.crankedTimer:GetValue( f3_local1 ) > 5 then
			ACTIONS.AnimateSequence( self, "ShowBar" )
			ACTIONS.AnimateSequence( self, "Refresh" )
		end
		if DataSources.inGame.HUD.crankedTimer:GetValue( f3_local1 ) ~= nil and DataSources.inGame.HUD.crankedTimer:GetValue( f3_local1 ) <= 0 then
			ACTIONS.AnimateSequence( self, "HideAll" )
		end
	end )
	self:SubscribeToModel( DataSources.inGame.HUD.crankedTimerFinalSeconds:GetModel( f3_local1 ), function ()
		if DataSources.inGame.HUD.crankedTimerFinalSeconds:GetValue( f3_local1 ) ~= nil and DataSources.inGame.HUD.crankedTimerFinalSeconds:GetValue( f3_local1 ) == true then
			ACTIONS.AnimateSequence( self, "FinalSeconds" )
		end
		if DataSources.inGame.HUD.crankedTimerFinalSeconds:GetValue( f3_local1 ) ~= nil and DataSources.inGame.HUD.crankedTimerFinalSeconds:GetValue( f3_local1 ) == false then
			ACTIONS.AnimateSequence( self, "HideAll" )
		end
	end )
	PostLoadFunc( self, f3_local1, controller )
	return self
end

MenuBuilder.registerType( "CrankedTimer", CrankedTimer )
LockTable( _M )
