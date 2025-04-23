local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function chiStyle( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 222 * _1080p, 0, 88 * _1080p )
	self.id = "chiStyle"
	self._animationSets = {}
	self._sequences = {}
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local GenericSplashLightRays = nil
	
	GenericSplashLightRays = MenuBuilder.BuildRegisteredType( "GenericSplashLightRays", {
		controllerIndex = f1_local1
	} )
	GenericSplashLightRays.id = "GenericSplashLightRays"
	GenericSplashLightRays:SetScale( -0.56, 0 )
	GenericSplashLightRays:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -187.36, _1080p * 324.64, _1080p * -203, _1080p * 309 )
	self:addElement( GenericSplashLightRays )
	self.GenericSplashLightRays = GenericSplashLightRays
	
	local chiStyleIcon = nil
	
	chiStyleIcon = LUI.UIImage.new()
	chiStyleIcon.id = "chiStyleIcon"
	chiStyleIcon:SetScale( -0.5, 0 )
	chiStyleIcon:SetUseAA( true )
	chiStyleIcon:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 4.64, _1080p * 132.64, _1080p * -11, _1080p * 117 )
	chiStyleIcon:SubscribeToModel( DataSources.inGame.CP.zombies.challenges.challengeIcon:GetModel( f1_local1 ), function ()
		local f2_local0 = DataSources.inGame.CP.zombies.challenges.challengeIcon:GetValue( f1_local1 )
		if f2_local0 ~= nil then
			chiStyleIcon:setImage( RegisterMaterial( f2_local0 ), 0 )
		end
	end )
	self:addElement( chiStyleIcon )
	self.chiStyleIcon = chiStyleIcon
	
	local ButtonFont = nil
	
	ButtonFont = LUI.UIText.new()
	ButtonFont.id = "ButtonFont"
	ButtonFont:setText( Engine.Localize( "CP_DISCO_CHI_STYLE_KEY" ), 0 )
	ButtonFont:SetFontSize( 38 * _1080p )
	ButtonFont:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	ButtonFont:SetAlignment( LUI.Alignment.Left )
	ButtonFont:SetOptOutRightToLeftAlignmentFlip( true )
	ButtonFont:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 102, _1080p * 438, _1080p * 34.5, _1080p * 72.5 )
	self:addElement( ButtonFont )
	self.ButtonFont = ButtonFont
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		GenericSplashLightRays:RegisterAnimationSequence( "craftedWeaponOn", {
			{
				function ()
					return self.GenericSplashLightRays:SetAlpha( 0, 0 )
				end,
				function ()
					return self.GenericSplashLightRays:SetAlpha( 0, 320 )
				end,
				function ()
					return self.GenericSplashLightRays:SetAlpha( 1, 710 )
				end,
				function ()
					return self.GenericSplashLightRays:SetAlpha( 1, 1330 )
				end,
				function ()
					return self.GenericSplashLightRays:SetAlpha( 0, 700 )
				end
			}
		} )
		chiStyleIcon:RegisterAnimationSequence( "craftedWeaponOn", {
			{
				function ()
					return self.chiStyleIcon:SetAlpha( 0.5, 0 )
				end,
				function ()
					return self.chiStyleIcon:SetAlpha( 1, 770 )
				end
			}
		} )
		ButtonFont:RegisterAnimationSequence( "craftedWeaponOn", {
			{
				function ()
					return self.ButtonFont:SetAlpha( 0, 0 )
				end,
				function ()
					return self.ButtonFont:SetAlpha( 0, 330 )
				end,
				function ()
					return self.ButtonFont:SetAlpha( 0.7, 440 )
				end
			}
		} )
		self._sequences.craftedWeaponOn = function ()
			GenericSplashLightRays:AnimateSequence( "craftedWeaponOn" )
			chiStyleIcon:AnimateSequence( "craftedWeaponOn" )
			ButtonFont:AnimateSequence( "craftedWeaponOn" )
		end
		
		GenericSplashLightRays:RegisterAnimationSequence( "craftedWeaponOff", {
			{
				function ()
					return self.GenericSplashLightRays:SetAlpha( 1, 0 )
				end,
				function ()
					return self.GenericSplashLightRays:SetAlpha( 0, 300 )
				end
			}
		} )
		chiStyleIcon:RegisterAnimationSequence( "craftedWeaponOff", {
			{
				function ()
					return self.chiStyleIcon:SetAlpha( 1, 0 )
				end,
				function ()
					return self.chiStyleIcon:SetAlpha( 0.5, 300 )
				end
			}
		} )
		ButtonFont:RegisterAnimationSequence( "craftedWeaponOff", {
			{
				function ()
					return self.ButtonFont:SetAlpha( 0, 0 )
				end,
				function ()
					return self.ButtonFont:SetAlpha( 0, 300 )
				end
			}
		} )
		self._sequences.craftedWeaponOff = function ()
			GenericSplashLightRays:AnimateSequence( "craftedWeaponOff" )
			chiStyleIcon:AnimateSequence( "craftedWeaponOff" )
			ButtonFont:AnimateSequence( "craftedWeaponOff" )
		end
		
		GenericSplashLightRays:RegisterAnimationSequence( "Hide", {
			{
				function ()
					return self.GenericSplashLightRays:SetAlpha( 0, 0 )
				end
			}
		} )
		chiStyleIcon:RegisterAnimationSequence( "Hide", {
			{
				function ()
					return self.chiStyleIcon:SetAlpha( 0, 0 )
				end
			}
		} )
		ButtonFont:RegisterAnimationSequence( "Hide", {
			{
				function ()
					return self.ButtonFont:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.Hide = function ()
			GenericSplashLightRays:AnimateSequence( "Hide" )
			chiStyleIcon:AnimateSequence( "Hide" )
			ButtonFont:AnimateSequence( "Hide" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	self:SubscribeToModel( DataSources.inGame.CP.zombies.dlc1.raveODMode:GetModel( f1_local1 ), function ()
		if DataSources.inGame.CP.zombies.dlc1.raveODMode:GetValue( f1_local1 ) ~= nil and DataSources.inGame.CP.zombies.dlc1.raveODMode:GetValue( f1_local1 ) > 0 then
			ACTIONS.AnimateSequence( self, "craftedWeaponOn" )
		end
		if DataSources.inGame.CP.zombies.dlc1.raveODMode:GetValue( f1_local1 ) ~= nil and DataSources.inGame.CP.zombies.dlc1.raveODMode:GetValue( f1_local1 ) == 0 then
			ACTIONS.AnimateSequence( self, "Hide" )
		end
	end )
	self:SubscribeToModel( DataSources.inGame.CP.zombies.dlc1.raveMode:GetModel( f1_local1 ), function ()
		if DataSources.inGame.CP.zombies.dlc1.raveMode:GetValue( f1_local1 ) ~= nil and DataSources.inGame.CP.zombies.dlc1.raveMode:GetValue( f1_local1 ) == 0 then
			ACTIONS.AnimateSequence( self, "craftedWeaponOff" )
		end
	end )
	ACTIONS.AnimateSequence( self, "Hide" )
	return self
end

MenuBuilder.registerType( "chiStyle", chiStyle )
LockTable( _M )
