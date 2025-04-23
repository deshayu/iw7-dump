local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function FragReticle( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 300 * _1080p, 0, 300 * _1080p )
	self.id = "FragReticle"
	self._animationSets = {}
	self._sequences = {}
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local Border0 = nil
	
	Border0 = LUI.UIBorder.new( {
		borderThicknessLeft = _1080p * 1,
		borderThicknessRight = _1080p * 1,
		borderThicknessTop = _1080p * 1,
		borderThicknessBottom = _1080p * 1
	} )
	Border0.id = "Border0"
	Border0:SetRGBFromTable( SWATCHES.Callouts.teamFree, 0 )
	Border0:SetAlpha( 0, 0 )
	Border0:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 145, _1080p * 155, _1080p * 145, _1080p * 155 )
	self:addElement( Border0 )
	self.Border0 = Border0
	
	local VerticalLine = nil
	
	VerticalLine = LUI.UIImage.new()
	VerticalLine.id = "VerticalLine"
	VerticalLine:SetRGBFromTable( SWATCHES.Callouts.teamFree, 0 )
	VerticalLine:SetAlpha( 0, 0 )
	VerticalLine:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 149.5, _1080p * 150.5, _1080p * 115, _1080p * 145 )
	self:addElement( VerticalLine )
	self.VerticalLine = VerticalLine
	
	local HorizontalLine = nil
	
	HorizontalLine = LUI.UIImage.new()
	HorizontalLine.id = "HorizontalLine"
	HorizontalLine:SetRGBFromTable( SWATCHES.Callouts.teamFree, 0 )
	HorizontalLine:SetAlpha( 0, 0 )
	HorizontalLine:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 150.5, _1080p * 180, _1080p * 115, _1080p * 116 )
	self:addElement( HorizontalLine )
	self.HorizontalLine = HorizontalLine
	
	local SPARCalloutFrame0 = nil
	
	SPARCalloutFrame0 = MenuBuilder.BuildRegisteredType( "SPARCalloutFrame", {
		controllerIndex = f1_local1
	} )
	SPARCalloutFrame0.id = "SPARCalloutFrame0"
	SPARCalloutFrame0:SetAlpha( 0, 0 )
	SPARCalloutFrame0.Background:SetAlpha( 0.15, 0 )
	SPARCalloutFrame0:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 180, _1080p * 180, _1080p * 103, _1080p * 128 )
	self:addElement( SPARCalloutFrame0 )
	self.SPARCalloutFrame0 = SPARCalloutFrame0
	
	local NotificationNode = nil
	
	NotificationNode = LUI.UIImage.new()
	NotificationNode.id = "NotificationNode"
	NotificationNode:SetRGBFromTable( SWATCHES.HUD.stable, 0 )
	NotificationNode:SetAlpha( 0, 0 )
	NotificationNode:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 40, _1080p * 52, _1080p * -41, _1080p * -29 )
	self:addElement( NotificationNode )
	self.NotificationNode = NotificationNode
	
	local KillConfirmedText = nil
	
	KillConfirmedText = LUI.UIText.new()
	KillConfirmedText.id = "KillConfirmedText"
	KillConfirmedText:SetRGBFromTable( SWATCHES.HUD.stable, 0 )
	KillConfirmedText:SetAlpha( 0, 0 )
	KillConfirmedText:setText( Engine.Localize( "HUD_KILL" ), 0 )
	KillConfirmedText:SetFontSize( 22 * _1080p )
	KillConfirmedText:SetFont( FONTS.GetFont( FONTS.MainExtended.File ) )
	KillConfirmedText:SetAlignment( LUI.Alignment.Left )
	KillConfirmedText:SetOptOutRightToLeftAlignmentFlip( true )
	KillConfirmedText:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 60, _1080p * 230, _1080p * -47, _1080p * -25 )
	self:addElement( KillConfirmedText )
	self.KillConfirmedText = KillConfirmedText
	
	local InjuredText = nil
	
	InjuredText = LUI.UIText.new()
	InjuredText.id = "InjuredText"
	InjuredText:SetRGBFromTable( SWATCHES.HUD.stable, 0 )
	InjuredText:SetAlpha( 0, 0 )
	InjuredText:setText( Engine.Localize( "HUD_INJURED" ), 0 )
	InjuredText:SetFontSize( 22 * _1080p )
	InjuredText:SetFont( FONTS.GetFont( FONTS.MainExtended.File ) )
	InjuredText:SetAlignment( LUI.Alignment.Left )
	InjuredText:SetOptOutRightToLeftAlignmentFlip( true )
	InjuredText:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 60, _1080p * 230, _1080p * -47, _1080p * -25 )
	self:addElement( InjuredText )
	self.InjuredText = InjuredText
	
	local UninjuredText = nil
	
	UninjuredText = LUI.UIText.new()
	UninjuredText.id = "UninjuredText"
	UninjuredText:SetRGBFromTable( SWATCHES.HUD.stable, 0 )
	UninjuredText:SetAlpha( 0, 0 )
	UninjuredText:setText( Engine.Localize( "HUD_NO_INJURY" ), 0 )
	UninjuredText:SetFontSize( 22 * _1080p )
	UninjuredText:SetFont( FONTS.GetFont( FONTS.MainExtended.File ) )
	UninjuredText:SetAlignment( LUI.Alignment.Left )
	UninjuredText:SetOptOutRightToLeftAlignmentFlip( true )
	UninjuredText:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 60, _1080p * 230, _1080p * -47, _1080p * -25 )
	self:addElement( UninjuredText )
	self.UninjuredText = UninjuredText
	
	local X2 = nil
	
	X2 = LUI.UIImage.new()
	X2.id = "X2"
	X2:SetRGBFromTable( SWATCHES.HUD.warning, 0 )
	X2:SetAlpha( 0, 0 )
	X2:SetZRotation( 45, 0 )
	X2:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 194.03, _1080p * 197.97, _1080p * 103.83, _1080p * 126.17 )
	self:addElement( X2 )
	self.X2 = X2
	
	local X1 = nil
	
	X1 = LUI.UIImage.new()
	X1.id = "X1"
	X1:SetRGBFromTable( SWATCHES.HUD.warning, 0 )
	X1:SetAlpha( 0, 0 )
	X1:SetZRotation( -45, 0 )
	X1:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 193.97, _1080p * 198.03, _1080p * 103.5, _1080p * 126.5 )
	self:addElement( X1 )
	self.X1 = X1
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		NotificationNode:RegisterAnimationSequence( "kill", {
			{
				function ()
					return self.NotificationNode:SetRGBFromTable( SWATCHES.HUD.warning, 0 )
				end
			},
			{
				function ()
					return self.NotificationNode:SetAlpha( 0, 0 )
				end
			}
		} )
		KillConfirmedText:RegisterAnimationSequence( "kill", {
			{
				function ()
					return self.KillConfirmedText:SetAlpha( 0, 0 )
				end,
				function ()
					return self.KillConfirmedText:SetAlpha( 0, 440 )
				end,
				function ()
					return self.KillConfirmedText:SetAlpha( 1, 10 )
				end
			}
		} )
		InjuredText:RegisterAnimationSequence( "kill", {
			{
				function ()
					return self.InjuredText:SetAlpha( 0, 0 )
				end
			}
		} )
		UninjuredText:RegisterAnimationSequence( "kill", {
			{
				function ()
					return self.UninjuredText:SetAlpha( 0, 0 )
				end
			}
		} )
		X2:RegisterAnimationSequence( "kill", {
			{
				function ()
					return self.X2:SetAlpha( 0, 0 )
				end,
				function ()
					return self.X2:SetAlpha( 0, 390 )
				end,
				function ()
					return self.X2:SetAlpha( 1, 10 )
				end
			}
		} )
		X1:RegisterAnimationSequence( "kill", {
			{
				function ()
					return self.X1:SetAlpha( 0, 0 )
				end,
				function ()
					return self.X1:SetAlpha( 0, 390 )
				end,
				function ()
					return self.X1:SetAlpha( 1, 10 )
				end
			}
		} )
		self._sequences.kill = function ()
			NotificationNode:AnimateSequence( "kill" )
			KillConfirmedText:AnimateSequence( "kill" )
			InjuredText:AnimateSequence( "kill" )
			UninjuredText:AnimateSequence( "kill" )
			X2:AnimateSequence( "kill" )
			X1:AnimateSequence( "kill" )
		end
		
		NotificationNode:RegisterAnimationSequence( "injured", {
			{
				function ()
					return self.NotificationNode:SetRGBFromTable( SWATCHES.HUD.caution, 0 )
				end
			},
			{
				function ()
					return self.NotificationNode:SetAlpha( 0, 390 )
				end,
				function ()
					return self.NotificationNode:SetAlpha( 1, 10 )
				end
			}
		} )
		KillConfirmedText:RegisterAnimationSequence( "injured", {
			{
				function ()
					return self.KillConfirmedText:SetAlpha( 0, 0 )
				end
			}
		} )
		InjuredText:RegisterAnimationSequence( "injured", {
			{
				function ()
					return self.InjuredText:SetAlpha( 0, 0 )
				end,
				function ()
					return self.InjuredText:SetAlpha( 0, 440 )
				end,
				function ()
					return self.InjuredText:SetAlpha( 1, 10 )
				end
			}
		} )
		UninjuredText:RegisterAnimationSequence( "injured", {
			{
				function ()
					return self.UninjuredText:SetAlpha( 0, 0 )
				end
			}
		} )
		X2:RegisterAnimationSequence( "injured", {
			{
				function ()
					return self.X2:SetAlpha( 0, 0 )
				end
			}
		} )
		X1:RegisterAnimationSequence( "injured", {
			{
				function ()
					return self.X1:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.injured = function ()
			NotificationNode:AnimateSequence( "injured" )
			KillConfirmedText:AnimateSequence( "injured" )
			InjuredText:AnimateSequence( "injured" )
			UninjuredText:AnimateSequence( "injured" )
			X2:AnimateSequence( "injured" )
			X1:AnimateSequence( "injured" )
		end
		
		NotificationNode:RegisterAnimationSequence( "noinjury", {
			{
				function ()
					return self.NotificationNode:SetRGBFromTable( SWATCHES.HUD.stable, 0 )
				end
			},
			{
				function ()
					return self.NotificationNode:SetAlpha( 0, 390 )
				end,
				function ()
					return self.NotificationNode:SetAlpha( 1, 10 )
				end
			}
		} )
		KillConfirmedText:RegisterAnimationSequence( "noinjury", {
			{
				function ()
					return self.KillConfirmedText:SetAlpha( 0, 0 )
				end
			}
		} )
		InjuredText:RegisterAnimationSequence( "noinjury", {
			{
				function ()
					return self.InjuredText:SetAlpha( 0, 0 )
				end
			}
		} )
		UninjuredText:RegisterAnimationSequence( "noinjury", {
			{
				function ()
					return self.UninjuredText:SetAlpha( 0, 0 )
				end,
				function ()
					return self.UninjuredText:SetAlpha( 0, 440 )
				end,
				function ()
					return self.UninjuredText:SetAlpha( 1, 10 )
				end
			}
		} )
		X2:RegisterAnimationSequence( "noinjury", {
			{
				function ()
					return self.X2:SetAlpha( 0, 0 )
				end
			}
		} )
		X1:RegisterAnimationSequence( "noinjury", {
			{
				function ()
					return self.X1:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.noinjury = function ()
			NotificationNode:AnimateSequence( "noinjury" )
			KillConfirmedText:AnimateSequence( "noinjury" )
			InjuredText:AnimateSequence( "noinjury" )
			UninjuredText:AnimateSequence( "noinjury" )
			X2:AnimateSequence( "noinjury" )
			X1:AnimateSequence( "noinjury" )
		end
		
		Border0:RegisterAnimationSequence( "AnimateOn", {
			{
				function ()
					return self.Border0:SetScale( -1, 0 )
				end,
				function ()
					return self.Border0:SetScale( 0, 200 )
				end
			},
			{
				function ()
					return self.Border0:SetAlpha( 0, 0 )
				end,
				function ()
					return self.Border0:SetAlpha( 0.5, 10 )
				end
			}
		} )
		VerticalLine:RegisterAnimationSequence( "AnimateOn", {
			{
				function ()
					return self.VerticalLine:SetAlpha( 0.5, 0 )
				end
			},
			{
				function ()
					return self.VerticalLine:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 149.5, _1080p * 150.5, _1080p * 145, _1080p * 145, 0 )
				end,
				function ()
					return self.VerticalLine:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 149.5, _1080p * 150.5, _1080p * 145, _1080p * 145, 200 )
				end,
				function ()
					return self.VerticalLine:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 149.5, _1080p * 150.5, _1080p * 115, _1080p * 145, 49 )
				end
			}
		} )
		HorizontalLine:RegisterAnimationSequence( "AnimateOn", {
			{
				function ()
					return self.HorizontalLine:SetAlpha( 0.5, 0 )
				end
			},
			{
				function ()
					return self.HorizontalLine:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 150.5, _1080p * 150.5, _1080p * 115, _1080p * 116, 0 )
				end,
				function ()
					return self.HorizontalLine:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 150.5, _1080p * 150.5, _1080p * 115, _1080p * 116, 250 )
				end,
				function ()
					return self.HorizontalLine:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 150.5, _1080p * 180, _1080p * 115, _1080p * 116, 50 )
				end
			}
		} )
		SPARCalloutFrame0:RegisterAnimationSequence( "AnimateOn", {
			{
				function ()
					return self.SPARCalloutFrame0:SetAlpha( 0, 0 )
				end,
				function ()
					return self.SPARCalloutFrame0:SetAlpha( 0, 290 )
				end,
				function ()
					return self.SPARCalloutFrame0:SetAlpha( 1, 10 )
				end
			},
			{
				function ()
					return self.SPARCalloutFrame0:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 180, _1080p * 180, _1080p * 103, _1080p * 128, 0 )
				end,
				function ()
					return self.SPARCalloutFrame0:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 180, _1080p * 180, _1080p * 103, _1080p * 128, 300 )
				end,
				function ()
					return self.SPARCalloutFrame0:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 180, _1080p * 325, _1080p * 103, _1080p * 128, 99, LUI.EASING.outBack )
				end
			}
		} )
		NotificationNode:RegisterAnimationSequence( "AnimateOn", {
			{
				function ()
					return self.NotificationNode:SetScale( 0, 400 )
				end,
				function ()
					return self.NotificationNode:SetScale( 0.25, 50 )
				end,
				function ()
					return self.NotificationNode:SetScale( 0, 50 )
				end
			}
		} )
		X2:RegisterAnimationSequence( "AnimateOn", {
			{
				function ()
					return self.X2:SetScale( 0, 400 )
				end,
				function ()
					return self.X2:SetScale( 0.25, 50 )
				end,
				function ()
					return self.X2:SetScale( 0, 50 )
				end
			}
		} )
		X1:RegisterAnimationSequence( "AnimateOn", {
			{
				function ()
					return self.X1:SetScale( 0, 400 )
				end,
				function ()
					return self.X1:SetScale( 0.25, 50 )
				end,
				function ()
					return self.X1:SetScale( 0, 50 )
				end
			}
		} )
		self._sequences.AnimateOn = function ()
			Border0:AnimateSequence( "AnimateOn" )
			VerticalLine:AnimateSequence( "AnimateOn" )
			HorizontalLine:AnimateSequence( "AnimateOn" )
			SPARCalloutFrame0:AnimateSequence( "AnimateOn" )
			NotificationNode:AnimateSequence( "AnimateOn" )
			X2:AnimateSequence( "AnimateOn" )
			X1:AnimateSequence( "AnimateOn" )
		end
		
		Border0:RegisterAnimationSequence( "AnimateOff", {
			{
				function ()
					return self.Border0:SetScale( 0, 300 )
				end,
				function ()
					return self.Border0:SetScale( -1, 100 )
				end
			},
			{
				function ()
					return self.Border0:SetAlpha( 0.5, 400 )
				end,
				function ()
					return self.Border0:SetAlpha( 0, 10 )
				end
			}
		} )
		VerticalLine:RegisterAnimationSequence( "AnimateOff", {
			{
				function ()
					return self.VerticalLine:SetAlpha( 0.5, 300 )
				end,
				function ()
					return self.VerticalLine:SetAlpha( 0, 10 )
				end
			},
			{
				function ()
					return self.VerticalLine:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 149.5, _1080p * 150.5, _1080p * 115, _1080p * 145, 250 )
				end,
				function ()
					return self.VerticalLine:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 149.5, _1080p * 150.5, _1080p * 145, _1080p * 145, 50 )
				end
			}
		} )
		HorizontalLine:RegisterAnimationSequence( "AnimateOff", {
			{
				function ()
					return self.HorizontalLine:SetAlpha( 0.5, 250 )
				end,
				function ()
					return self.HorizontalLine:SetAlpha( 0, 10 )
				end
			},
			{
				function ()
					return self.HorizontalLine:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 150.5, _1080p * 180, _1080p * 115, _1080p * 116, 209 )
				end,
				function ()
					return self.HorizontalLine:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 150.5, _1080p * 150.5, _1080p * 115, _1080p * 116, 40 )
				end
			}
		} )
		SPARCalloutFrame0:RegisterAnimationSequence( "AnimateOff", {
			{
				function ()
					return self.SPARCalloutFrame0:SetAlpha( 1, 200 )
				end,
				function ()
					return self.SPARCalloutFrame0:SetAlpha( 0, 10 )
				end
			},
			{
				function ()
					return self.SPARCalloutFrame0:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 180, _1080p * 325, _1080p * 103, _1080p * 128, 100 )
				end,
				function ()
					return self.SPARCalloutFrame0:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 180, _1080p * 180, _1080p * 103, _1080p * 128, 100 )
				end
			}
		} )
		NotificationNode:RegisterAnimationSequence( "AnimateOff", {
			{
				function ()
					return self.NotificationNode:SetScale( 0, 0 )
				end,
				function ()
					return self.NotificationNode:SetScale( 0.25, 50 )
				end,
				function ()
					return self.NotificationNode:SetScale( -1, 50 )
				end
			}
		} )
		KillConfirmedText:RegisterAnimationSequence( "AnimateOff", {
			{
				function ()
					return self.KillConfirmedText:SetAlpha( 0, 100 )
				end
			},
			{
				function ()
					return self.KillConfirmedText:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 60, _1080p * 230, _1080p * -44, _1080p * -26, 0 )
				end,
				function ()
					return self.KillConfirmedText:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 65, _1080p * 235, _1080p * -44, _1080p * -26, 100 )
				end
			}
		} )
		InjuredText:RegisterAnimationSequence( "AnimateOff", {
			{
				function ()
					return self.InjuredText:SetAlpha( 0, 100 )
				end
			},
			{
				function ()
					return self.InjuredText:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 60, _1080p * 230, _1080p * -44, _1080p * -26, 0 )
				end,
				function ()
					return self.InjuredText:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 65, _1080p * 235, _1080p * -44, _1080p * -26, 100 )
				end
			}
		} )
		UninjuredText:RegisterAnimationSequence( "AnimateOff", {
			{
				function ()
					return self.UninjuredText:SetAlpha( 0, 100 )
				end
			},
			{
				function ()
					return self.UninjuredText:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 60, _1080p * 230, _1080p * -44, _1080p * -26, 0 )
				end,
				function ()
					return self.UninjuredText:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 65, _1080p * 235, _1080p * -44, _1080p * -26, 100 )
				end
			}
		} )
		X2:RegisterAnimationSequence( "AnimateOff", {
			{
				function ()
					return self.X2:SetScale( 0, 0 )
				end,
				function ()
					return self.X2:SetScale( 0.25, 50 )
				end,
				function ()
					return self.X2:SetScale( -1, 50 )
				end
			}
		} )
		X1:RegisterAnimationSequence( "AnimateOff", {
			{
				function ()
					return self.X1:SetScale( 0, 0 )
				end,
				function ()
					return self.X1:SetScale( 0.25, 50 )
				end,
				function ()
					return self.X1:SetScale( -1, 50 )
				end
			}
		} )
		self._sequences.AnimateOff = function ()
			Border0:AnimateSequence( "AnimateOff" )
			VerticalLine:AnimateSequence( "AnimateOff" )
			HorizontalLine:AnimateSequence( "AnimateOff" )
			SPARCalloutFrame0:AnimateSequence( "AnimateOff" )
			NotificationNode:AnimateSequence( "AnimateOff" )
			KillConfirmedText:AnimateSequence( "AnimateOff" )
			InjuredText:AnimateSequence( "AnimateOff" )
			UninjuredText:AnimateSequence( "AnimateOff" )
			X2:AnimateSequence( "AnimateOff" )
			X1:AnimateSequence( "AnimateOff" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	self:SubscribeToModelThroughElement( self, "lockState", function ()
		local f103_local0 = self:GetDataSource()
		if f103_local0.lockState:GetValue( f1_local1 ) ~= nil then
			f103_local0 = self:GetDataSource()
			if f103_local0.lockState:GetValue( f1_local1 ) == 1 then
				ACTIONS.AnimateSequence( self, "kill" )
				ACTIONS.AnimateSequence( self, "AnimateOn" )
			end
		end
		f103_local0 = self:GetDataSource()
		if f103_local0.lockState:GetValue( f1_local1 ) ~= nil then
			f103_local0 = self:GetDataSource()
			if f103_local0.lockState:GetValue( f1_local1 ) == 2 then
				ACTIONS.AnimateSequence( self, "injured" )
				ACTIONS.AnimateSequence( self, "AnimateOn" )
			end
		end
		f103_local0 = self:GetDataSource()
		if f103_local0.lockState:GetValue( f1_local1 ) ~= nil then
			f103_local0 = self:GetDataSource()
			if f103_local0.lockState:GetValue( f1_local1 ) == 3 then
				ACTIONS.AnimateSequence( self, "noinjury" )
				ACTIONS.AnimateSequence( self, "AnimateOn" )
			end
		end
	end )
	return self
end

MenuBuilder.registerType( "FragReticle", FragReticle )
LockTable( _M )
