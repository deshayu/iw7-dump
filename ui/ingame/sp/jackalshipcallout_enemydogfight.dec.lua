local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function PostLoadFunc( f1_arg0, f1_arg1, f1_arg2 )
	if CONDITIONS.IsPC( f1_arg0 ) then
		assert( f1_arg0.LockonKey )
		local f1_local0 = function ()
			if Engine.IsGamepadEnabled() == 1 then
				ACTIONS.AnimateSequence( f1_arg0, "HidePCControls" )
			else
				ACTIONS.AnimateSequence( f1_arg0, "ShowPCControls" )
				f1_arg0.LockonKey:setText( LocalizeString( "JACKAL_KB_LOCKON" ), 0 )
			end
		end
		
		f1_arg0:registerEventHandler( "empty_menu_stack", function ( element, event )
			f1_local0()
		end )
		f1_arg0:registerEventHandler( "refresh_jackal_callouts", function ( element, event )
			f1_local0()
		end )
		f1_local0()
	end
end

function JackalShipCallout_enemyDogFight( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 10 * _1080p, 0, 10 * _1080p )
	self.id = "JackalShipCallout_enemyDogFight"
	self._animationSets = {}
	self._sequences = {}
	local f5_local1 = controller and controller.controllerIndex
	if not f5_local1 and not Engine.InFrontend() then
		f5_local1 = self:getRootController()
	end
	assert( f5_local1 )
	local f5_local2 = self
	local HorizontalLine = nil
	
	HorizontalLine = LUI.UIImage.new()
	HorizontalLine.id = "HorizontalLine"
	HorizontalLine:SetRGBFromTable( SWATCHES.jackal.calloutLineEnemy, 0 )
	HorizontalLine:setImage( RegisterMaterial( "ui_default_white" ), 0 )
	HorizontalLine:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 50, _1080p * 189, _1080p * -49, _1080p * -47 )
	self:addElement( HorizontalLine )
	self.HorizontalLine = HorizontalLine
	
	local DiagnolLine = nil
	
	DiagnolLine = LUI.UIImage.new()
	DiagnolLine.id = "DiagnolLine"
	DiagnolLine:SetRGBFromTable( SWATCHES.jackal.calloutLineEnemy, 0 )
	DiagnolLine:setImage( RegisterMaterial( "hud_diagnol_line" ), 0 )
	DiagnolLine:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 19, _1080p * 51, _1080p * -49, _1080p * -17 )
	self:addElement( DiagnolLine )
	self.DiagnolLine = DiagnolLine
	
	local PilotName = nil
	
	PilotName = LUI.UIText.new()
	PilotName.id = "PilotName"
	PilotName:SetRGBFromTable( SWATCHES.jackal.warning, 0 )
	PilotName:SetFontSize( 22 * _1080p )
	PilotName:SetFont( FONTS.GetFont( FONTS.MainExtended.File ) )
	PilotName:SetAlignment( LUI.Alignment.Left )
	PilotName:SetOptOutRightToLeftAlignmentFlip( true )
	PilotName:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 54, _1080p * 554, _1080p * -71, _1080p * -49 )
	PilotName:SubscribeToModelThroughElement( self, "name", function ()
		local f6_local0 = self:GetDataSource()
		f6_local0 = f6_local0.name:GetValue( f5_local1 )
		if f6_local0 ~= nil then
			PilotName:setText( LocalizeString( f6_local0 ), 0 )
		end
	end )
	self:addElement( PilotName )
	self.PilotName = PilotName
	
	local Distance = nil
	
	Distance = LUI.UIText.new()
	Distance.id = "Distance"
	Distance:SetRGBFromTable( SWATCHES.jackal.normal, 0 )
	Distance:SetAlpha( 0.8, 0 )
	Distance:setText( Engine.Localize( "JACKAL_ACE_LOCKON" ), 0 )
	Distance:SetFontSize( 22 * _1080p )
	Distance:SetFont( FONTS.GetFont( FONTS.MainExtended.File ) )
	Distance:SetAlignment( LUI.Alignment.Left )
	Distance:SetOptOutRightToLeftAlignmentFlip( true )
	Distance:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 111, _1080p * 497, _1080p * -44, _1080p * -22 )
	self:addElement( Distance )
	self.Distance = Distance
	
	local Icon = nil
	
	Icon = LUI.UIImage.new()
	Icon.id = "Icon"
	Icon:SetRGBFromTable( SWATCHES.jackal.normal, 0 )
	Icon:SetScale( 0.25, 0 )
	Icon:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 59, _1080p * 101, _1080p * -40, _1080p * -15 )
	Icon:SubscribeToModel( DataSources.alwaysLoaded.input.commands.speedThrowIcon:GetModel( f5_local1 ), function ()
		local f7_local0 = DataSources.alwaysLoaded.input.commands.speedThrowIcon:GetValue( f5_local1 )
		if f7_local0 ~= nil then
			Icon:setImage( RegisterMaterial( f7_local0 ), 0 )
		end
	end )
	self:addElement( Icon )
	self.Icon = Icon
	
	local LockonKey = nil
	
	LockonKey = LUI.UIText.new()
	LockonKey.id = "LockonKey"
	LockonKey:SetRGBFromTable( SWATCHES.jackal.normal, 0 )
	LockonKey:SetAlpha( 0, 0 )
	LockonKey:setText( Engine.Localize( "JACKAL_KB_LOCKON" ), 0 )
	LockonKey:SetFontSize( 45 * _1080p )
	LockonKey:SetFont( FONTS.GetFont( FONTS.MainExtended.File ) )
	LockonKey:SetAlignment( LUI.Alignment.Left )
	LockonKey:SetOptOutRightToLeftAlignmentFlip( true )
	LockonKey:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 54, _1080p * 554, _1080p * -43, _1080p * -22 )
	self:addElement( LockonKey )
	self.LockonKey = LockonKey
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		Icon:RegisterAnimationSequence( "Default", {
			{
				function ()
					return self.Icon:SetAlpha( 1, 0 )
				end,
				function ()
					return self.Icon:SetAlpha( 0.25, 200 )
				end,
				function ()
					return self.Icon:SetAlpha( 1, 200 )
				end
			}
		} )
		self._sequences.Default = function ()
			Icon:AnimateLoop( "Default" )
		end
		
		Distance:RegisterAnimationSequence( "ShowPCControls", {
			{
				function ()
					return self.Distance:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 54, _1080p * 554, _1080p * -22, 0, 0 )
				end
			}
		} )
		Icon:RegisterAnimationSequence( "ShowPCControls", {
			{
				function ()
					return self.Icon:SetAlpha( 0, 0 )
				end
			}
		} )
		LockonKey:RegisterAnimationSequence( "ShowPCControls", {
			{
				function ()
					return self.LockonKey:SetAlpha( 1, 0 )
				end
			}
		} )
		self._sequences.ShowPCControls = function ()
			Distance:AnimateSequence( "ShowPCControls" )
			Icon:AnimateSequence( "ShowPCControls" )
			LockonKey:AnimateSequence( "ShowPCControls" )
		end
		
		Distance:RegisterAnimationSequence( "HidePCControls", {
			{
				function ()
					return self.Distance:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 111, _1080p * 577, _1080p * -44, _1080p * -22, 0 )
				end
			}
		} )
		Icon:RegisterAnimationSequence( "HidePCControls", {
			{
				function ()
					return self.Icon:SetAlpha( 1, 0 )
				end
			}
		} )
		LockonKey:RegisterAnimationSequence( "HidePCControls", {
			{
				function ()
					return self.LockonKey:SetAlpha( 0, 0 )
				end
			},
			{
				function ()
					return self.LockonKey:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 54, _1080p * 707, _1080p * -43, _1080p * -22, 0 )
				end
			}
		} )
		self._sequences.HidePCControls = function ()
			Distance:AnimateSequence( "HidePCControls" )
			Icon:AnimateSequence( "HidePCControls" )
			LockonKey:AnimateSequence( "HidePCControls" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	PostLoadFunc( self, f5_local1, controller )
	return self
end

MenuBuilder.registerType( "JackalShipCallout_enemyDogFight", JackalShipCallout_enemyDogFight )
LockTable( _M )
