local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function PostLoadFunc( f1_arg0, f1_arg1 )
	f1_arg0.Portrait:SetMask( f1_arg0.Mask )
	f1_arg0:registerEventHandler( "grid_anim", function ( element, event )
		element:SetAlpha( event.value )
	end )
end

function InGameRigSelectButton( menu, controller )
	local self = LUI.UIButton.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 350 * _1080p, 0, 100 * _1080p )
	self.id = "InGameRigSelectButton"
	self._animationSets = {}
	self._sequences = {}
	local f3_local1 = controller and controller.controllerIndex
	if not f3_local1 and not Engine.InFrontend() then
		f3_local1 = self:getRootController()
	end
	assert( f3_local1 )
	local f3_local2 = self
	self:SubscribeToModelThroughElement( self, "isUnlocked", function ()
		local f4_local0 = self:GetDataSource()
		f4_local0 = f4_local0.isUnlocked:GetValue( f3_local1 )
		if f4_local0 ~= nil then
			self:SetButtonDisabled( Not( f4_local0 ) )
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
		controllerIndex = f3_local1
	} )
	NameBackground.id = "NameBackground"
	NameBackground:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 350, 0, _1080p * 22 )
	self:addElement( NameBackground )
	self.NameBackground = NameBackground
	
	local Portrait = nil
	
	Portrait = LUI.UIImage.new()
	Portrait.id = "Portrait"
	Portrait:SetRGBFromInt( 12434877, 0 )
	Portrait:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 176, _1080p * -23, _1080p * 153 )
	Portrait:SubscribeToModelThroughElement( self, "rigHeadshot", function ()
		local f5_local0 = self:GetDataSource()
		f5_local0 = f5_local0.rigHeadshot:GetValue( f3_local1 )
		if f5_local0 ~= nil then
			Portrait:setImage( RegisterMaterial( f5_local0 ), 0 )
		end
	end )
	self:addElement( Portrait )
	self.Portrait = Portrait
	
	local Name = nil
	
	Name = LUI.UIText.new()
	Name.id = "Name"
	Name:SetFontSize( 19 * _1080p )
	Name:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	Name:SetAlignment( LUI.Alignment.Right )
	Name:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 176, _1080p * -20, _1080p * 1.5, _1080p * 20.5 )
	Name:SubscribeToModelThroughElement( self, "name", function ()
		local f6_local0 = self:GetDataSource()
		f6_local0 = f6_local0.name:GetValue( f3_local1 )
		if f6_local0 ~= nil then
			Name:setText( f6_local0, 0 )
		end
	end )
	self:addElement( Name )
	self.Name = Name
	
	local GenericButtonSelection0 = nil
	
	GenericButtonSelection0 = MenuBuilder.BuildRegisteredType( "GenericButtonSelection", {
		controllerIndex = f3_local1
	} )
	GenericButtonSelection0.id = "GenericButtonSelection0"
	GenericButtonSelection0:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, _1080p * 22, 0 )
	self:addElement( GenericButtonSelection0 )
	self.GenericButtonSelection0 = GenericButtonSelection0
	
	local LockIcon = nil
	
	LockIcon = LUI.UIImage.new()
	LockIcon.id = "LockIcon"
	LockIcon:SetAlpha( 0, 0 )
	LockIcon:setImage( RegisterMaterial( "icon_slot_locked" ), 0 )
	LockIcon:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 56, _1080p * 120, _1080p * 18, _1080p * 82 )
	self:addElement( LockIcon )
	self.LockIcon = LockIcon
	
	self._animationSets.DefaultAnimationSet = function ()
		Portrait:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.Portrait:SetRGBFromTable( SWATCHES.ingameRigSelect.portraitUnfocused, 0 )
				end
			}
		} )
		Name:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.Name:SetRGBFromInt( 16777215, 0 )
				end
			}
		} )
		LockIcon:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.LockIcon:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.DefaultSequence = function ()
			Portrait:AnimateSequence( "DefaultSequence" )
			Name:AnimateSequence( "DefaultSequence" )
			LockIcon:AnimateSequence( "DefaultSequence" )
		end
		
		Portrait:RegisterAnimationSequence( "OnFocus", {
			{
				function ()
					return self.Portrait:SetRGBFromTable( SWATCHES.ingameRigSelect.portraitSelected, 0 )
				end
			},
			{
				function ()
					return self.Portrait:SetScale( 0, 0 )
				end,
				function ()
					return self.Portrait:SetScale( 0.1, 100 )
				end
			}
		} )
		Name:RegisterAnimationSequence( "OnFocus", {
			{
				function ()
					return self.Name:SetRGBFromInt( 0, 0 )
				end
			}
		} )
		LockIcon:RegisterAnimationSequence( "OnFocus", {
			{
				function ()
					return self.LockIcon:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.OnFocus = function ()
			Portrait:AnimateSequence( "OnFocus" )
			Name:AnimateSequence( "OnFocus" )
			LockIcon:AnimateSequence( "OnFocus" )
		end
		
		Portrait:RegisterAnimationSequence( "OnLoseFocus", {
			{
				function ()
					return self.Portrait:SetRGBFromTable( SWATCHES.ingameRigSelect.portraitUnfocused, 0 )
				end
			},
			{
				function ()
					return self.Portrait:SetScale( 0.1, 0 )
				end,
				function ()
					return self.Portrait:SetScale( 0, 100 )
				end
			}
		} )
		Name:RegisterAnimationSequence( "OnLoseFocus", {
			{
				function ()
					return self.Name:SetRGBFromInt( 16777215, 0 )
				end
			}
		} )
		LockIcon:RegisterAnimationSequence( "OnLoseFocus", {
			{
				function ()
					return self.LockIcon:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.OnLoseFocus = function ()
			Portrait:AnimateSequence( "OnLoseFocus" )
			Name:AnimateSequence( "OnLoseFocus" )
			LockIcon:AnimateSequence( "OnLoseFocus" )
		end
		
		Portrait:RegisterAnimationSequence( "Selected", {
			{
				function ()
					return self.Portrait:SetRGBFromTable( SWATCHES.ingameRigSelect.portraitSelected, 0 )
				end
			},
			{
				function ()
					return self.Portrait:SetScale( 0.1, 0 )
				end
			}
		} )
		Name:RegisterAnimationSequence( "Selected", {
			{
				function ()
					return self.Name:SetRGBFromInt( 0, 0 )
				end
			}
		} )
		LockIcon:RegisterAnimationSequence( "Selected", {
			{
				function ()
					return self.LockIcon:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.Selected = function ()
			Portrait:AnimateSequence( "Selected" )
			Name:AnimateSequence( "Selected" )
			LockIcon:AnimateSequence( "Selected" )
		end
		
	end
	
	self._animationSets.Locked = function ()
		Portrait:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.Portrait:SetRGBFromTable( SWATCHES.ingameRigSelect.portraitDisabled, 0 )
				end
			}
		} )
		Name:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.Name:SetRGBFromInt( 16777215, 0 )
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
			Portrait:AnimateSequence( "DefaultSequence" )
			Name:AnimateSequence( "DefaultSequence" )
			LockIcon:AnimateSequence( "DefaultSequence" )
		end
		
		Portrait:RegisterAnimationSequence( "OnFocus", {
			{
				function ()
					return self.Portrait:SetRGBFromTable( SWATCHES.ingameRigSelect.portraitDisabled, 0 )
				end
			},
			{
				function ()
					return self.Portrait:SetScale( 0, 0 )
				end,
				function ()
					return self.Portrait:SetScale( 0.1, 100 )
				end
			}
		} )
		Name:RegisterAnimationSequence( "OnFocus", {
			{
				function ()
					return self.Name:SetRGBFromInt( 0, 0 )
				end
			}
		} )
		LockIcon:RegisterAnimationSequence( "OnFocus", {
			{
				function ()
					return self.LockIcon:SetAlpha( 1, 0 )
				end
			}
		} )
		self._sequences.OnFocus = function ()
			Portrait:AnimateSequence( "OnFocus" )
			Name:AnimateSequence( "OnFocus" )
			LockIcon:AnimateSequence( "OnFocus" )
		end
		
		Portrait:RegisterAnimationSequence( "OnLoseFocus", {
			{
				function ()
					return self.Portrait:SetRGBFromTable( SWATCHES.ingameRigSelect.portraitDisabled, 0 )
				end
			},
			{
				function ()
					return self.Portrait:SetScale( 0.1, 0 )
				end,
				function ()
					return self.Portrait:SetScale( 0, 100 )
				end
			}
		} )
		Name:RegisterAnimationSequence( "OnLoseFocus", {
			{
				function ()
					return self.Name:SetRGBFromInt( 16777215, 0 )
				end
			}
		} )
		LockIcon:RegisterAnimationSequence( "OnLoseFocus", {
			{
				function ()
					return self.LockIcon:SetAlpha( 1, 0 )
				end
			}
		} )
		self._sequences.OnLoseFocus = function ()
			Portrait:AnimateSequence( "OnLoseFocus" )
			Name:AnimateSequence( "OnLoseFocus" )
			LockIcon:AnimateSequence( "OnLoseFocus" )
		end
		
		Portrait:RegisterAnimationSequence( "Selected", {
			{
				function ()
					return self.Portrait:SetRGBFromTable( SWATCHES.ingameRigSelect.portraitDisabled, 0 )
				end
			},
			{
				function ()
					return self.Portrait:SetScale( 0.1, 0 )
				end
			}
		} )
		Name:RegisterAnimationSequence( "Selected", {
			{
				function ()
					return self.Name:SetRGBFromInt( 0, 0 )
				end
			}
		} )
		LockIcon:RegisterAnimationSequence( "Selected", {
			{
				function ()
					return self.LockIcon:SetAlpha( 1, 0 )
				end
			}
		} )
		self._sequences.Selected = function ()
			Portrait:AnimateSequence( "Selected" )
			Name:AnimateSequence( "Selected" )
			LockIcon:AnimateSequence( "Selected" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	self:addEventHandler( "gain_focus", function ( f51_arg0, f51_arg1 )
		local f51_local0 = f51_arg1.controller or f3_local1
		ACTIONS.AnimateSequence( self, "OnFocus" )
	end )
	self:addEventHandler( "lose_focus", function ( f52_arg0, f52_arg1 )
		local f52_local0 = f52_arg1.controller or f3_local1
		ACTIONS.AnimateSequence( self, "OnLoseFocus" )
	end )
	self:addEventHandler( "button_action", function ( f53_arg0, f53_arg1 )
		local f53_local0 = f53_arg1.controller or f3_local1
		ACTIONS.OpenInGameSuperSelectMenu( self, f53_arg0, f53_local0 )
		ACTIONS.NotifyScriptRigSelected( self, f53_arg0, f53_local0 )
		ACTIONS.AnimateSequence( self, "Selected" )
		ACTIONS.AnimateSequenceByElement( self, {
			elementName = "NameBackground",
			sequenceName = "ButtonOver",
			elementPath = "NameBackground"
		} )
	end )
	self:SubscribeToModelThroughElement( self, "isUnlocked", function ()
		local f54_local0 = self:GetDataSource()
		if f54_local0.isUnlocked:GetValue( f3_local1 ) ~= nil then
			f54_local0 = self:GetDataSource()
			if f54_local0.isUnlocked:GetValue( f3_local1 ) == true then
				ACTIONS.SetAnimationSet( self, "DefaultAnimationSet" )
			end
		end
		f54_local0 = self:GetDataSource()
		if f54_local0.isUnlocked:GetValue( f3_local1 ) ~= nil then
			f54_local0 = self:GetDataSource()
			if f54_local0.isUnlocked:GetValue( f3_local1 ) == false then
				ACTIONS.SetAnimationSet( self, "Locked" )
			end
		end
	end )
	PostLoadFunc( self, f3_local1, controller )
	ACTIONS.AnimateSequence( self, "DefaultSequence" )
	return self
end

MenuBuilder.registerType( "InGameRigSelectButton", InGameRigSelectButton )
LockTable( _M )
