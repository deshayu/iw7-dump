local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ( f1_arg0, f1_arg1, f1_arg2 )
	if Engine.IsPC() then
		assert( f1_arg0.ButtonFont )
		f1_arg0:registerEventHandler( "empty_menu_stack", function ( element, event )
			element.ButtonFont:setText( Engine.Localize( "ZOMBIE_HUD_BUTTON_KEY" ), 0 )
		end )
	end
end

function CraftedWeapon( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 38 * _1080p, 0, 39 * _1080p )
	self.id = "CraftedWeapon"
	self._animationSets = {}
	self._sequences = {}
	local f3_local1 = controller and controller.controllerIndex
	if not f3_local1 and not Engine.InFrontend() then
		f3_local1 = self:getRootController()
	end
	assert( f3_local1 )
	local f3_local2 = self
	local craftedWeapon = nil
	
	craftedWeapon = LUI.UIImage.new()
	craftedWeapon.id = "craftedWeapon"
	craftedWeapon:SetScale( -0.76, 0 )
	craftedWeapon:SetUseAA( true )
	craftedWeapon:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -41.36, _1080p * 86.64, _1080p * -45.5, _1080p * 82.5 )
	craftedWeapon:SubscribeToModel( DataSources.inGame.CP.zombies.craftedWeaponImage:GetModel( f3_local1 ), function ()
		local f4_local0 = DataSources.inGame.CP.zombies.craftedWeaponImage:GetValue( f3_local1 )
		if f4_local0 ~= nil then
			craftedWeapon:setImage( RegisterMaterial( f4_local0 ), 0 )
		end
	end )
	self:addElement( craftedWeapon )
	self.craftedWeapon = craftedWeapon
	
	local ButtonFont = nil
	
	ButtonFont = LUI.UIText.new()
	ButtonFont.id = "ButtonFont"
	ButtonFont:setText( Engine.Localize( "ZOMBIE_HUD_BUTTON_KEY" ), 0 )
	ButtonFont:SetFontSize( 14 * _1080p )
	ButtonFont:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	ButtonFont:SetAlignment( LUI.Alignment.Left )
	ButtonFont:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 0.64, _1080p * 336.64, _1080p * 25, _1080p * 39 )
	self:addElement( ButtonFont )
	self.ButtonFont = ButtonFont
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		craftedWeapon:RegisterAnimationSequence( "craftedWeaponOn", {
			{
				function ()
					return self.craftedWeapon:SetAlpha( 0, 0 )
				end,
				function ()
					return self.craftedWeapon:SetAlpha( 0, 150 )
				end,
				function ()
					return self.craftedWeapon:SetAlpha( 1, 390 )
				end
			},
			{
				function ()
					return self.craftedWeapon:SetScale( -0.8, 150 )
				end,
				function ()
					return self.craftedWeapon:SetScale( -0.8, 150 )
				end,
				function ()
					return self.craftedWeapon:SetScale( -0.75, 240 )
				end,
				function ()
					return self.craftedWeapon:SetScale( -0.79, 270 )
				end,
				function ()
					return self.craftedWeapon:SetScale( -0.75, 250 )
				end,
				function ()
					return self.craftedWeapon:SetScale( -0.81, 260 )
				end
			},
			{
				function ()
					return self.craftedWeapon:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -42.36, _1080p * 85.64, _1080p * -45.5, _1080p * 82.5, 0 )
				end
			}
		} )
		ButtonFont:RegisterAnimationSequence( "craftedWeaponOn", {
			{
				function ()
					return self.ButtonFont:SetAlpha( 0, 0 )
				end,
				function ()
					return self.ButtonFont:SetAlpha( 0, 630 )
				end,
				function ()
					return self.ButtonFont:SetAlpha( 0, 690 )
				end,
				function ()
					return self.ButtonFont:SetAlpha( 1, 150 )
				end
			}
		} )
		self._sequences.craftedWeaponOn = function ()
			craftedWeapon:AnimateSequence( "craftedWeaponOn" )
			ButtonFont:AnimateSequence( "craftedWeaponOn" )
		end
		
		craftedWeapon:RegisterAnimationSequence( "craftedWeaponOff", {
			{
				function ()
					return self.craftedWeapon:SetAlpha( 1, 0 )
				end,
				function ()
					return self.craftedWeapon:SetAlpha( 0, 300 )
				end
			}
		} )
		ButtonFont:RegisterAnimationSequence( "craftedWeaponOff", {
			{
				function ()
					return self.ButtonFont:SetAlpha( 1, 0 )
				end,
				function ()
					return self.ButtonFont:SetAlpha( 0, 300 )
				end
			}
		} )
		self._sequences.craftedWeaponOff = function ()
			craftedWeapon:AnimateSequence( "craftedWeaponOff" )
			ButtonFont:AnimateSequence( "craftedWeaponOff" )
		end
		
		ButtonFont:RegisterAnimationSequence( "cpFinal", {
			{
				function ()
					return self.ButtonFont:setText( Engine.Localize( "CP_FINAL_ENTANGLER_BUTTON" ), 0 )
				end
			}
		} )
		self._sequences.cpFinal = function ()
			ButtonFont:AnimateSequence( "cpFinal" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	if CONDITIONS.IsDLC4( self ) then
		ACTIONS.AnimateSequence( self, "cpFinal" )
	end
	self:SubscribeToModel( DataSources.inGame.CP.zombies.craftedWeapon:GetModel( f3_local1 ), function ()
		if DataSources.inGame.CP.zombies.craftedWeapon:GetValue( f3_local1 ) ~= nil and DataSources.inGame.CP.zombies.craftedWeapon:GetValue( f3_local1 ) > 0 then
			ACTIONS.AnimateSequence( self, "craftedWeaponOn" )
		end
		if DataSources.inGame.CP.zombies.craftedWeapon:GetValue( f3_local1 ) ~= nil and DataSources.inGame.CP.zombies.craftedWeapon:GetValue( f3_local1 ) == 0 then
			ACTIONS.AnimateSequence( self, "craftedWeaponOff" )
		end
	end )
	f0_local0( self, f3_local1, controller )
	return self
end

MenuBuilder.registerType( "CraftedWeapon", CraftedWeapon )
LockTable( _M )
