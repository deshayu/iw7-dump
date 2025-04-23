local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function ghostArcadeGameSkullDestroyed( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 365 * _1080p, 0, 177 * _1080p )
	self.id = "ghostArcadeGameSkullDestroyed"
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
	icon:setImage( RegisterMaterial( "zm_hud_pixel_skull" ), 0 )
	icon:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 39.2, _1080p * 162.2, _1080p * 40, _1080p * 162 )
	self:addElement( icon )
	self.icon = icon
	
	local x = nil
	
	x = LUI.UIText.new()
	x.id = "x"
	x:setText( "x", 0 )
	x:SetFontSize( 48 * _1080p )
	x:SetFont( FONTS.GetFont( FONTS.Digital.File ) )
	x:SetAlignment( LUI.Alignment.Left )
	x:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 168.2, _1080p * 203.05, _1080p * 94, _1080p * 142 )
	self:addElement( x )
	self.x = x
	
	local counter = nil
	
	counter = LUI.UIText.new()
	counter.id = "counter"
	counter:SetFontSize( 48 * _1080p )
	counter:SetFont( FONTS.GetFont( FONTS.Digital.File ) )
	counter:SetAlignment( LUI.Alignment.Left )
	counter:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 203.05, _1080p * 318.47, _1080p * 94, _1080p * 142 )
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
	Border:SetScale( 0.15, 0 )
	Border:setImage( RegisterMaterial( "cp_zmb_ghost_skull_counter_frame" ), 0 )
	Border:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 23.7, _1080p * 339.7, _1080p * 20.5, _1080p * 181.5 )
	self:addElement( Border )
	self.Border = Border
	
	local skullDestroyed = nil
	
	skullDestroyed = LUI.UIText.new()
	skullDestroyed.id = "skullDestroyed"
	skullDestroyed:setText( ToUpperCase( Engine.Localize( "CP_ZMB_GHOST_SKULL_DESTROYED" ) ), 0 )
	skullDestroyed:SetFontSize( 24 * _1080p )
	skullDestroyed:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	skullDestroyed:SetAlignment( LUI.Alignment.Center )
	skullDestroyed:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 4.7, _1080p * 365, _1080p * 1, _1080p * 25 )
	self:addElement( skullDestroyed )
	self.skullDestroyed = skullDestroyed
	
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
		x:RegisterAnimationSequence( "initial", {
			{
				function ()
					return self.x:SetAlpha( 0, 0 )
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
		self._sequences.initial = function ()
			icon:AnimateSequence( "initial" )
			x:AnimateSequence( "initial" )
			counter:AnimateSequence( "initial" )
			Border:AnimateSequence( "initial" )
			skullDestroyed:AnimateSequence( "initial" )
		end
		
		icon:RegisterAnimationSequence( "activate", {
			{
				function ()
					return self.icon:SetAlpha( 1, 0 )
				end
			}
		} )
		x:RegisterAnimationSequence( "activate", {
			{
				function ()
					return self.x:SetAlpha( 1, 0 )
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
		self._sequences.activate = function ()
			icon:AnimateSequence( "activate" )
			x:AnimateSequence( "activate" )
			counter:AnimateSequence( "activate" )
			Border:AnimateSequence( "activate" )
			skullDestroyed:AnimateSequence( "activate" )
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

MenuBuilder.registerType( "ghostArcadeGameSkullDestroyed", ghostArcadeGameSkullDestroyed )
LockTable( _M )
