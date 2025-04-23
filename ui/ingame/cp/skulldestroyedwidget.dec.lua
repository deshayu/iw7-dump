local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function skullDestroyedWidget( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 365 * _1080p, 0, 177 * _1080p )
	self.id = "skullDestroyedWidget"
	self._animationSets = {}
	self._sequences = {}
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local icon = nil
	
	icon = LUI.UIImage.new()
	icon.id = "icon"
	icon:SetScale( -0.19, 0 )
	icon:setImage( RegisterMaterial( "zm_hud_pixel_skull" ), 0 )
	icon:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 53.01, _1080p * 176.01, _1080p * 43.19, _1080p * 165.19 )
	self:addElement( icon )
	self.icon = icon
	
	local counter = nil
	
	counter = LUI.UIText.new()
	counter.id = "counter"
	counter:SetAlpha( 0.81, 0 )
	counter:SetFontSize( 64 * _1080p )
	counter:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	counter:SetAlignment( LUI.Alignment.Left )
	counter:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 212.85, _1080p * 328.27, _1080p * 84.5, _1080p * 148.5 )
	counter:SubscribeToModel( DataSources.inGame.CP.currentPlayerCash:GetModel( f1_local1 ), function ()
		local f2_local0 = DataSources.inGame.CP.currentPlayerCash:GetValue( f1_local1 )
		if f2_local0 ~= nil then
			counter:setText( f2_local0, 0 )
		end
	end )
	self:addElement( counter )
	self.counter = counter
	
	local Border = nil
	
	Border = LUI.UIImage.new()
	Border.id = "Border"
	Border:SetYRotation( 180, 0 )
	Border:setImage( RegisterMaterial( "cp_disco_buster_hudline" ), 0 )
	Border:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 47.01, _1080p * 340.47, _1080p * 126, _1080p * 158 )
	self:addElement( Border )
	self.Border = Border
	
	local skullDestroyed = nil
	
	skullDestroyed = LUI.UIText.new()
	skullDestroyed.id = "skullDestroyed"
	skullDestroyed:SetRGBFromInt( 1607874, 0 )
	skullDestroyed:setText( ToUpperCase( Engine.Localize( "CP_ZMB_GHOST_SKULLBUSTER_DESTROYED" ) ), 0 )
	skullDestroyed:SetFontSize( 30 * _1080p )
	skullDestroyed:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	skullDestroyed:SetAlignment( LUI.Alignment.Center )
	skullDestroyed:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 66.7, _1080p * 427, _1080p * 150.5, _1080p * 180.5 )
	self:addElement( skullDestroyed )
	self.skullDestroyed = skullDestroyed
	
	local Ximage = nil
	
	Ximage = LUI.UIImage.new()
	Ximage.id = "Ximage"
	Ximage:SetScale( -0.45, 0 )
	Ximage:setImage( RegisterMaterial( "cp_disco_buster_x" ), 0 )
	Ximage:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 154.25, _1080p * 218.25, _1080p * 89.6, _1080p * 153.6 )
	self:addElement( Ximage )
	self.Ximage = Ximage
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		icon:RegisterAnimationSequence( "initial", {
			{
				function ()
					return self.icon:SetAlpha( 0, 0 )
				end
			}
		} )
		counter:RegisterAnimationSequence( "initial", {
			{
				function ()
					return self.counter:SetAlpha( 0, 0 )
				end
			}
		} )
		Border:RegisterAnimationSequence( "initial", {
			{
				function ()
					return self.Border:SetAlpha( 0, 0 )
				end
			}
		} )
		skullDestroyed:RegisterAnimationSequence( "initial", {
			{
				function ()
					return self.skullDestroyed:SetAlpha( 0, 0 )
				end
			}
		} )
		Ximage:RegisterAnimationSequence( "initial", {
			{
				function ()
					return self.Ximage:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.initial = function ()
			icon:AnimateSequence( "initial" )
			counter:AnimateSequence( "initial" )
			Border:AnimateSequence( "initial" )
			skullDestroyed:AnimateSequence( "initial" )
			Ximage:AnimateSequence( "initial" )
		end
		
		icon:RegisterAnimationSequence( "activate", {
			{
				function ()
					return self.icon:SetAlpha( 1, 0 )
				end
			}
		} )
		counter:RegisterAnimationSequence( "activate", {
			{
				function ()
					return self.counter:SetAlpha( 1, 0 )
				end
			}
		} )
		Border:RegisterAnimationSequence( "activate", {
			{
				function ()
					return self.Border:SetAlpha( 1, 0 )
				end
			}
		} )
		skullDestroyed:RegisterAnimationSequence( "activate", {
			{
				function ()
					return self.skullDestroyed:SetAlpha( 1, 0 )
				end
			}
		} )
		Ximage:RegisterAnimationSequence( "activate", {
			{
				function ()
					return self.Ximage:SetAlpha( 1, 0 )
				end
			}
		} )
		self._sequences.activate = function ()
			icon:AnimateSequence( "activate" )
			counter:AnimateSequence( "activate" )
			Border:AnimateSequence( "activate" )
			skullDestroyed:AnimateSequence( "activate" )
			Ximage:AnimateSequence( "activate" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	self:SubscribeToModel( DataSources.inGame.CP.zombies.ghostArcadeIsActive:GetModel( f1_local1 ), function ()
		if DataSources.inGame.CP.zombies.ghostArcadeIsActive:GetValue( f1_local1 ) ~= nil and DataSources.inGame.CP.zombies.ghostArcadeIsActive:GetValue( f1_local1 ) == true then
			ACTIONS.AnimateSequence( self, "activate" )
		end
		if DataSources.inGame.CP.zombies.ghostArcadeIsActive:GetValue( f1_local1 ) ~= nil and DataSources.inGame.CP.zombies.ghostArcadeIsActive:GetValue( f1_local1 ) == false then
			ACTIONS.AnimateSequence( self, "initial" )
		end
	end )
	self:SubscribeToModel( DataSources.inGame.CP.zombies.showGhostArcadeScores:GetModel( f1_local1 ), function ()
		if DataSources.inGame.CP.zombies.showGhostArcadeScores:GetValue( f1_local1 ) ~= nil and DataSources.inGame.CP.zombies.showGhostArcadeScores:GetValue( f1_local1 ) > 0 then
			ACTIONS.AnimateSequence( self, "initial" )
		end
	end )
	ACTIONS.AnimateSequence( self, "initial" )
	return self
end

MenuBuilder.registerType( "skullDestroyedWidget", skullDestroyedWidget )
LockTable( _M )
