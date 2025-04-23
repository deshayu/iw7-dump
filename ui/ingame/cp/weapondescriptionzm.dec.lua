local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function weaponDescriptionZM( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 300 * _1080p, 0, 50 * _1080p )
	self.id = "weaponDescriptionZM"
	self._animationSets = {}
	self._sequences = {}
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local TextWeaponName = nil
	
	TextWeaponName = LUI.UIStyledText.new()
	TextWeaponName.id = "TextWeaponName"
	TextWeaponName:SetRGBFromTable( SWATCHES.text.primaryText, 0 )
	TextWeaponName:SetFontSize( 22 * _1080p )
	TextWeaponName:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	TextWeaponName:SetAlignment( LUI.Alignment.Right )
	TextWeaponName:SetShadowMinDistance( -0.02, 0 )
	TextWeaponName:SetShadowMaxDistance( 0.02, 0 )
	TextWeaponName:SetAnchorsAndPosition( 1, 0, 1, 0, _1080p * -448, 0, _1080p * -50, _1080p * -28 )
	TextWeaponName:SubscribeToModel( DataSources.inGame.player.currentWeapon.displayNameMultiline:GetModel( f1_local1 ), function ()
		local f2_local0 = DataSources.inGame.player.currentWeapon.displayNameMultiline:GetValue( f1_local1 )
		if f2_local0 ~= nil then
			TextWeaponName:setText( f2_local0, 0 )
		end
	end )
	self:addElement( TextWeaponName )
	self.TextWeaponName = TextWeaponName
	
	local TextAltMode = nil
	
	TextAltMode = LUI.UIStyledText.new()
	TextAltMode.id = "TextAltMode"
	TextAltMode:SetFontSize( 22 * _1080p )
	TextAltMode:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	TextAltMode:SetAlignment( LUI.Alignment.Right )
	TextAltMode:SetShadowMinDistance( -0.02, 0 )
	TextAltMode:SetShadowMaxDistance( 0.02, 0 )
	TextAltMode:SetAnchorsAndPosition( 0, 1, 1, 0, 0, _1080p * 88, _1080p * -50, _1080p * -28 )
	TextAltMode:SubscribeToModel( DataSources.inGame.player.currentWeapon.altModeDisplayName:GetModel( f1_local1 ), function ()
		local f3_local0 = DataSources.inGame.player.currentWeapon.altModeDisplayName:GetValue( f1_local1 )
		if f3_local0 ~= nil then
			TextAltMode:setText( f3_local0, 0 )
		end
	end )
	self:addElement( TextAltMode )
	self.TextAltMode = TextAltMode
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		TextWeaponName:RegisterAnimationSequence( "UpdatedWeaponName", {
			{
				function ()
					return self.TextWeaponName:SetAlpha( 1, 0 )
				end,
				function ()
					return self.TextWeaponName:SetAlpha( 1, 1000 )
				end,
				function ()
					return self.TextWeaponName:SetAlpha( 0, 1000 )
				end
			}
		} )
		self._sequences.UpdatedWeaponName = function ()
			TextWeaponName:AnimateSequence( "UpdatedWeaponName" )
		end
		
		TextAltMode:RegisterAnimationSequence( "UpdatedAltModeName", {
			{
				function ()
					return self.TextAltMode:SetAlpha( 1, 0 )
				end,
				function ()
					return self.TextAltMode:SetAlpha( 1, 1000 )
				end,
				function ()
					return self.TextAltMode:SetAlpha( 0, 1000 )
				end
			}
		} )
		self._sequences.UpdatedAltModeName = function ()
			TextAltMode:AnimateSequence( "UpdatedAltModeName" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	TextWeaponName:SubscribeToModel( DataSources.inGame.player.currentWeapon.displayName:GetModel( f1_local1 ), function ()
		ACTIONS.AnimateSequence( self, "UpdatedWeaponName" )
	end )
	TextWeaponName:SubscribeToModel( DataSources.inGame.player.currentWeapon.altModeDisplayName:GetModel( f1_local1 ), function ()
		ACTIONS.AnimateSequence( self, "UpdatedWeaponName" )
	end )
	TextAltMode:SubscribeToModel( DataSources.inGame.player.currentWeapon.altModeDisplayName:GetModel( f1_local1 ), function ()
		ACTIONS.AnimateSequence( self, "UpdatedAltModeName" )
	end )
	return self
end

MenuBuilder.registerType( "weaponDescriptionZM", weaponDescriptionZM )
LockTable( _M )
