local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function PostLoadFunc( f1_arg0, f1_arg1 )
	f1_arg0.Icon:SetMask( f1_arg0.Mask )
end

function InGameSuperSelectButton( menu, controller )
	local self = LUI.UIButton.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 350 * _1080p, 0, 100 * _1080p )
	self.id = "InGameSuperSelectButton"
	self._animationSets = {}
	self._sequences = {}
	local f2_local1 = controller and controller.controllerIndex
	if not f2_local1 and not Engine.InFrontend() then
		f2_local1 = self:getRootController()
	end
	assert( f2_local1 )
	local f2_local2 = self
	self:SubscribeToModelThroughElement( self, "isUnlocked", function ()
		local f3_local0 = self:GetDataSource()
		f3_local0 = f3_local0.isUnlocked:GetValue( f2_local1 )
		if f3_local0 ~= nil then
			self:SetButtonDisabled( Not( f3_local0 ) )
		end
	end )
	local BackgroundGradient = nil
	
	BackgroundGradient = LUI.UIImage.new()
	BackgroundGradient.id = "BackgroundGradient"
	BackgroundGradient:SetRGBFromInt( 0, 0 )
	BackgroundGradient:SetAlpha( 0.4, 0 )
	BackgroundGradient:setImage( RegisterMaterial( "widg_gradient_top_to_bottom_with_base" ), 0 )
	self:addElement( BackgroundGradient )
	self.BackgroundGradient = BackgroundGradient
	
	local Mask = nil
	
	Mask = LUI.UIImage.new()
	Mask.id = "Mask"
	Mask:setImage( RegisterMaterial( "wdg_large_mask" ), 0 )
	self:addElement( Mask )
	self.Mask = Mask
	
	local NameBackground = nil
	
	NameBackground = MenuBuilder.BuildRegisteredType( "GenericListButtonBackground", {
		controllerIndex = f2_local1
	} )
	NameBackground.id = "NameBackground"
	NameBackground:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, 0, _1080p * 22 )
	self:addElement( NameBackground )
	self.NameBackground = NameBackground
	
	local Name = nil
	
	Name = LUI.UIStyledText.new()
	Name.id = "Name"
	Name:SetFontSize( 19 * _1080p )
	Name:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	Name:SetAlignment( LUI.Alignment.Right )
	Name:SetStartupDelay( 1000 )
	Name:SetLineHoldTime( 400 )
	Name:SetAnimMoveTime( 500 )
	Name:SetEndDelay( 1000 )
	Name:SetCrossfadeTime( 500 )
	Name:SetAutoScrollStyle( LUI.UIStyledText.AutoScrollStyle.ScrollV )
	Name:SetMaxVisibleLines( 1 )
	Name:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 125, _1080p * -20, _1080p * 1.5, _1080p * 20.5 )
	Name:SubscribeToModelThroughElement( self, "name", function ()
		local f4_local0 = self:GetDataSource()
		f4_local0 = f4_local0.name:GetValue( f2_local1 )
		if f4_local0 ~= nil then
			Name:setText( f4_local0, 0 )
		end
	end )
	self:addElement( Name )
	self.Name = Name
	
	local GenericButtonSelection = nil
	
	GenericButtonSelection = MenuBuilder.BuildRegisteredType( "GenericButtonSelection", {
		controllerIndex = f2_local1
	} )
	GenericButtonSelection.id = "GenericButtonSelection"
	GenericButtonSelection:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 350, _1080p * 20.5, _1080p * 100 )
	self:addElement( GenericButtonSelection )
	self.GenericButtonSelection = GenericButtonSelection
	
	local Icon = nil
	
	Icon = LUI.UIImage.new()
	Icon.id = "Icon"
	Icon:SetAnchorsAndPosition( 0.5, 0.5, 0, 0, _1080p * -146, _1080p * -46, 0, 0 )
	Icon:SubscribeToModelThroughElement( self, "fullImage", function ()
		local f5_local0 = self:GetDataSource()
		f5_local0 = f5_local0.fullImage:GetValue( f2_local1 )
		if f5_local0 ~= nil then
			Icon:setImage( RegisterMaterial( f5_local0 ), 0 )
		end
	end )
	self:addElement( Icon )
	self.Icon = Icon
	
	local LockIcon = nil
	
	LockIcon = LUI.UIImage.new()
	LockIcon.id = "LockIcon"
	LockIcon:SetAlpha( 0, 0 )
	LockIcon:setImage( RegisterMaterial( "icon_slot_locked" ), 0 )
	LockIcon:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 47, _1080p * 111, _1080p * 18, _1080p * 82 )
	self:addElement( LockIcon )
	self.LockIcon = LockIcon
	
	self._animationSets.DefaultAnimationSet = function ()
		Icon:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.Icon:SetRGBFromTable( SWATCHES.ingameRigSelect.portraitUnfocused, 0 )
				end
			}
		} )
		self._sequences.DefaultSequence = function ()
			Icon:AnimateSequence( "DefaultSequence" )
		end
		
		Name:RegisterAnimationSequence( "GainFocus", {
			{
				function ()
					return self.Name:SetRGBFromInt( 0, 0 )
				end
			}
		} )
		Icon:RegisterAnimationSequence( "GainFocus", {
			{
				function ()
					return self.Icon:SetScale( 0, 0 )
				end,
				function ()
					return self.Icon:SetScale( 0.1, 100 )
				end
			},
			{
				function ()
					return self.Icon:SetRGBFromTable( SWATCHES.ingameRigSelect.portraitUnfocused, 0 )
				end,
				function ()
					return self.Icon:SetRGBFromTable( SWATCHES.ingameRigSelect.portraitSelected, 100 )
				end
			}
		} )
		self._sequences.GainFocus = function ()
			Name:AnimateSequence( "GainFocus" )
			Icon:AnimateSequence( "GainFocus" )
		end
		
		Name:RegisterAnimationSequence( "Focus", {
			{
				function ()
					return self.Name:SetRGBFromInt( 0, 0 )
				end
			}
		} )
		Icon:RegisterAnimationSequence( "Focus", {
			{
				function ()
					return self.Icon:SetScale( 0.1, 0 )
				end
			},
			{
				function ()
					return self.Icon:SetRGBFromTable( SWATCHES.ingameRigSelect.portraitSelected, 100 )
				end
			}
		} )
		self._sequences.Focus = function ()
			Name:AnimateSequence( "Focus" )
			Icon:AnimateSequence( "Focus" )
		end
		
		Name:RegisterAnimationSequence( "LoseFocus", {
			{
				function ()
					return self.Name:SetRGBFromInt( 16777215, 0 )
				end
			}
		} )
		Icon:RegisterAnimationSequence( "LoseFocus", {
			{
				function ()
					return self.Icon:SetScale( 0.1, 0 )
				end,
				function ()
					return self.Icon:SetScale( 0, 100 )
				end
			},
			{
				function ()
					return self.Icon:SetRGBFromTable( SWATCHES.ingameRigSelect.portraitSelected, 0 )
				end,
				function ()
					return self.Icon:SetRGBFromTable( SWATCHES.ingameRigSelect.portraitUnfocused, 100 )
				end
			}
		} )
		self._sequences.LoseFocus = function ()
			Name:AnimateSequence( "LoseFocus" )
			Icon:AnimateSequence( "LoseFocus" )
		end
		
	end
	
	self._animationSets.Disabled = function ()
		Icon:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.Icon:SetRGBFromTable( SWATCHES.ingameRigSelect.portraitDisabled, 0 )
				end
			}
		} )
		LockIcon:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.LockIcon:SetAlpha( 1, 0 )
				end
			}
		} )
		self._sequences.DefaultSequence = function ()
			Icon:AnimateSequence( "DefaultSequence" )
			LockIcon:AnimateSequence( "DefaultSequence" )
		end
		
		Name:RegisterAnimationSequence( "GainFocus", {
			{
				function ()
					return self.Name:SetRGBFromInt( 0, 0 )
				end
			}
		} )
		Icon:RegisterAnimationSequence( "GainFocus", {
			{
				function ()
					return self.Icon:SetScale( 0, 0 )
				end,
				function ()
					return self.Icon:SetScale( 0.1, 100 )
				end
			},
			{
				function ()
					return self.Icon:SetRGBFromTable( SWATCHES.ingameRigSelect.portraitDisabled, 0 )
				end
			}
		} )
		LockIcon:RegisterAnimationSequence( "GainFocus", {
			{
				function ()
					return self.LockIcon:SetAlpha( 1, 0 )
				end
			}
		} )
		self._sequences.GainFocus = function ()
			Name:AnimateSequence( "GainFocus" )
			Icon:AnimateSequence( "GainFocus" )
			LockIcon:AnimateSequence( "GainFocus" )
		end
		
		Name:RegisterAnimationSequence( "Focus", {
			{
				function ()
					return self.Name:SetRGBFromInt( 0, 0 )
				end
			}
		} )
		Icon:RegisterAnimationSequence( "Focus", {
			{
				function ()
					return self.Icon:SetScale( 0.1, 0 )
				end
			},
			{
				function ()
					return self.Icon:SetRGBFromTable( SWATCHES.ingameRigSelect.portraitDisabled, 0 )
				end
			}
		} )
		LockIcon:RegisterAnimationSequence( "Focus", {
			{
				function ()
					return self.LockIcon:SetAlpha( 1, 0 )
				end
			}
		} )
		self._sequences.Focus = function ()
			Name:AnimateSequence( "Focus" )
			Icon:AnimateSequence( "Focus" )
			LockIcon:AnimateSequence( "Focus" )
		end
		
		Name:RegisterAnimationSequence( "LoseFocus", {
			{
				function ()
					return self.Name:SetRGBFromInt( 16777215, 0 )
				end
			}
		} )
		Icon:RegisterAnimationSequence( "LoseFocus", {
			{
				function ()
					return self.Icon:SetScale( 0.1, 0 )
				end,
				function ()
					return self.Icon:SetScale( 0, 100 )
				end
			},
			{
				function ()
					return self.Icon:SetRGBFromTable( SWATCHES.ingameRigSelect.portraitDisabled, 0 )
				end
			}
		} )
		LockIcon:RegisterAnimationSequence( "LoseFocus", {
			{
				function ()
					return self.LockIcon:SetAlpha( 1, 0 )
				end
			}
		} )
		self._sequences.LoseFocus = function ()
			Name:AnimateSequence( "LoseFocus" )
			Icon:AnimateSequence( "LoseFocus" )
			LockIcon:AnimateSequence( "LoseFocus" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	self:addEventHandler( "button_action", function ( f46_arg0, f46_arg1 )
		local f46_local0 = f46_arg1.controller or f2_local1
		ACTIONS.NotifyScriptSuperSelected( self, f46_arg0, f46_local0 )
		ACTIONS.OpenInGameRigPerkSelectMenu( self, f46_arg0, f46_local0 )
		ACTIONS.AnimateSequence( self, "Focus" )
		ACTIONS.AnimateSequenceByElement( self, {
			elementName = "NameBackground",
			sequenceName = "ButtonOver",
			elementPath = "NameBackground"
		} )
	end )
	self:addEventHandler( "gain_focus", function ( f47_arg0, f47_arg1 )
		local f47_local0 = f47_arg1.controller or f2_local1
		ACTIONS.AnimateSequence( self, "GainFocus" )
	end )
	self:addEventHandler( "lose_focus", function ( f48_arg0, f48_arg1 )
		local f48_local0 = f48_arg1.controller or f2_local1
		ACTIONS.AnimateSequence( self, "LoseFocus" )
	end )
	self:SubscribeToModelThroughElement( self, "isUnlocked", function ()
		local f49_local0 = self:GetDataSource()
		if f49_local0.isUnlocked:GetValue( f2_local1 ) ~= nil then
			f49_local0 = self:GetDataSource()
			if f49_local0.isUnlocked:GetValue( f2_local1 ) == true then
				ACTIONS.SetAnimationSet( self, "DefaultAnimationSet" )
			end
		end
		f49_local0 = self:GetDataSource()
		if f49_local0.isUnlocked:GetValue( f2_local1 ) ~= nil then
			f49_local0 = self:GetDataSource()
			if f49_local0.isUnlocked:GetValue( f2_local1 ) == false then
				ACTIONS.SetAnimationSet( self, "Disabled" )
			end
		end
	end )
	PostLoadFunc( self, f2_local1, controller )
	ACTIONS.AnimateSequence( self, "DefaultSequence" )
	return self
end

MenuBuilder.registerType( "InGameSuperSelectButton", InGameSuperSelectButton )
LockTable( _M )
