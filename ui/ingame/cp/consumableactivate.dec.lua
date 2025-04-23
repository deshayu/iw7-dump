local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ( f1_arg0, f1_arg1, f1_arg2 )
	assert( f1_arg0.Ready )
	assert( f1_arg0.ActivateText )
	if not Engine.IsConsoleGame() then
		f1_arg0:registerEventHandler( "empty_menu_stack", function ( element, event )
			element.Ready:setText( Engine.Localize( "ZM_CONSUMABLES_READY" ), 0 )
			if Engine.IsGamepadEnabled() == 1 then
				element.ActivateText:setText( Engine.Localize( "ZM_CONSUMABLES_BUTTON_KEYS" ), 0 )
			else
				element.ActivateText:setText( Engine.Localize( "ZM_CONSUMABLES_BUTTON_KEYS_PC" ), 0 )
			end
		end )
	end
end

function ConsumableActivate( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 403 * _1080p, 0, 140 * _1080p )
	self.id = "ConsumableActivate"
	self._animationSets = {}
	self._sequences = {}
	local f3_local1 = controller and controller.controllerIndex
	if not f3_local1 and not Engine.InFrontend() then
		f3_local1 = self:getRootController()
	end
	assert( f3_local1 )
	local f3_local2 = self
	local BackingBox = nil
	
	BackingBox = LUI.UIImage.new()
	BackingBox.id = "BackingBox"
	BackingBox:SetRGBFromTable( SWATCHES.Zombies.menuHeader, 0 )
	BackingBox:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 401, _1080p * 2, _1080p * 30 )
	self:addElement( BackingBox )
	self.BackingBox = BackingBox
	
	local ConsumableUpName = nil
	
	ConsumableUpName = LUI.UIText.new()
	ConsumableUpName.id = "ConsumableUpName"
	ConsumableUpName:SetRGBFromInt( 0, 0 )
	ConsumableUpName:setText( Engine.Localize( "ZM_CONSUMABLES_SELECTION_READY" ), 0 )
	ConsumableUpName:SetFontSize( 26 * _1080p )
	ConsumableUpName:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	ConsumableUpName:SetAlignment( LUI.Alignment.Center )
	ConsumableUpName:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 386, _1080p * 2, _1080p * 28 )
	self:addElement( ConsumableUpName )
	self.ConsumableUpName = ConsumableUpName
	
	local Activated = nil
	
	Activated = LUI.UIText.new()
	Activated.id = "Activated"
	Activated:SetAlpha( 0, 0 )
	Activated:setText( Engine.Localize( "ZM_CONSUMABLES_ACTIVATED" ), 0 )
	Activated:SetFontSize( 30 * _1080p )
	Activated:SetFont( FONTS.GetFont( FONTS.MainExtended.File ) )
	Activated:setTextStyle( CoD.TextStyle.Outlined )
	Activated:SetAlignment( LUI.Alignment.Center )
	Activated:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 106, _1080p * 606, _1080p * 83, _1080p * 113 )
	self:addElement( Activated )
	self.Activated = Activated
	
	local Ready = nil
	
	Ready = LUI.UIText.new()
	Ready.id = "Ready"
	Ready:setText( Engine.Localize( "ZM_CONSUMABLES_READY" ), 0 )
	Ready:SetFontSize( 22 * _1080p )
	Ready:SetFont( FONTS.GetFont( FONTS.MainExtended.File ) )
	Ready:setTextStyle( CoD.TextStyle.Outlined )
	Ready:SetAlignment( LUI.Alignment.Center )
	Ready:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -50, _1080p * 451, _1080p * 35, _1080p * 57 )
	self:addElement( Ready )
	self.Ready = Ready
	
	local ActivateText = nil
	
	ActivateText = LUI.UIText.new()
	ActivateText.id = "ActivateText"
	ActivateText:setText( Engine.Localize( "ZM_CONSUMABLES_BUTTON_KEYS" ), 0 )
	ActivateText:SetFontSize( 22 * _1080p )
	ActivateText:SetFont( FONTS.GetFont( FONTS.MainExtended.File ) )
	ActivateText:setTextStyle( CoD.TextStyle.Outlined )
	ActivateText:SetAlignment( LUI.Alignment.Center )
	ActivateText:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -50, _1080p * 451, _1080p * 60, _1080p * 82 )
	self:addElement( ActivateText )
	self.ActivateText = ActivateText
	
	self._animationSets.DefaultAnimationSet = function ()
		BackingBox:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.BackingBox:SetAlpha( 0, 0 )
				end
			}
		} )
		ConsumableUpName:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.ConsumableUpName:SetAlpha( 0, 0 )
				end
			}
		} )
		Activated:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.Activated:SetAlpha( 0, 0 )
				end
			}
		} )
		Ready:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.Ready:SetAlpha( 0, 50 )
				end
			}
		} )
		ActivateText:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.ActivateText:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.DefaultSequence = function ()
			BackingBox:AnimateSequence( "DefaultSequence" )
			ConsumableUpName:AnimateSequence( "DefaultSequence" )
			Activated:AnimateSequence( "DefaultSequence" )
			Ready:AnimateSequence( "DefaultSequence" )
			ActivateText:AnimateSequence( "DefaultSequence" )
		end
		
		BackingBox:RegisterAnimationSequence( "CardReady", {
			{
				function ()
					return self.BackingBox:SetAlpha( 0, 180 )
				end,
				function ()
					return self.BackingBox:SetAlpha( 1, 460, LUI.EASING.inOutCubic )
				end,
				function ()
					return self.BackingBox:SetAlpha( 1, 5360 )
				end,
				function ()
					return self.BackingBox:SetAlpha( 0, 500, LUI.EASING.inOutCubic )
				end
			}
		} )
		ConsumableUpName:RegisterAnimationSequence( "CardReady", {
			{
				function ()
					return self.ConsumableUpName:SetAlpha( 0, 180 )
				end,
				function ()
					return self.ConsumableUpName:SetAlpha( 1, 460, LUI.EASING.inOutCubic )
				end,
				function ()
					return self.ConsumableUpName:SetAlpha( 1, 5360 )
				end,
				function ()
					return self.ConsumableUpName:SetAlpha( 0, 500, LUI.EASING.inOutCubic )
				end
			}
		} )
		Ready:RegisterAnimationSequence( "CardReady", {
			{
				function ()
					return self.Ready:SetAlpha( 0, 0 )
				end,
				function ()
					return self.Ready:SetAlpha( 0, 180 )
				end,
				function ()
					return self.Ready:SetAlpha( 1, 460, LUI.EASING.inOutCubic )
				end,
				function ()
					return self.Ready:SetAlpha( 1, 5360, LUI.EASING.inOutCubic )
				end,
				function ()
					return self.Ready:SetAlpha( 0, 500, LUI.EASING.inOutCubic )
				end
			}
		} )
		ActivateText:RegisterAnimationSequence( "CardReady", {
			{
				function ()
					return self.ActivateText:SetAlpha( 0, 180 )
				end,
				function ()
					return self.ActivateText:SetAlpha( 1, 460, LUI.EASING.inOutCubic )
				end,
				function ()
					return self.ActivateText:SetAlpha( 1, 5360 )
				end,
				function ()
					return self.ActivateText:SetAlpha( 0, 500, LUI.EASING.inOutCubic )
				end
			}
		} )
		self._sequences.CardReady = function ()
			BackingBox:AnimateSequence( "CardReady" )
			ConsumableUpName:AnimateSequence( "CardReady" )
			Ready:AnimateSequence( "CardReady" )
			ActivateText:AnimateSequence( "CardReady" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	self:SubscribeToModel( DataSources.inGame.CP.zombies.dpadUpActivated:GetModel( f3_local1 ), function ()
		if DataSources.inGame.CP.zombies.dpadUpActivated:GetValue( f3_local1 ) ~= nil and DataSources.inGame.CP.zombies.dpadUpActivated:GetValue( f3_local1 ) == 1 then
			ACTIONS.AnimateSequence( self, "CardReady" )
		end
		if DataSources.inGame.CP.zombies.dpadUpActivated:GetValue( f3_local1 ) ~= nil and DataSources.inGame.CP.zombies.dpadUpActivated:GetValue( f3_local1 ) == 5 then
			ACTIONS.AnimateSequence( self, "DefaultSequence" )
		end
	end )
	f0_local0( self, f3_local1, controller )
	ACTIONS.AnimateSequence( self, "DefaultSequence" )
	return self
end

MenuBuilder.registerType( "ConsumableActivate", ConsumableActivate )
LockTable( _M )
