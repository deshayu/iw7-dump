local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ( f1_arg0, f1_arg1, f1_arg2 )
	f1_arg0:registerEventHandler( "empty_menu_stack", function ( element, event )
		element.hint:setText( Engine.Localize( "COOP_INTERACTIONS_CRYPTID_HELPER" ), 0 )
	end )
end

function gameHelper( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 1920 * _1080p, 0, 1080 * _1080p )
	self.id = "gameHelper"
	self._animationSets = {}
	self._sequences = {}
	local f3_local1 = controller and controller.controllerIndex
	if not f3_local1 and not Engine.InFrontend() then
		f3_local1 = self:getRootController()
	end
	assert( f3_local1 )
	local f3_local2 = self
	local bg = nil
	
	bg = LUI.UIImage.new()
	bg.id = "bg"
	bg:SetRGBFromTable( SWATCHES.Reticles.Orange, 0 )
	bg:setImage( RegisterMaterial( "cp_zmb_game_helper" ), 0 )
	bg:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1218.7, _1080p * 1730.7, _1080p * 739, _1080p * 995 )
	self:addElement( bg )
	self.bg = bg
	
	local title = nil
	
	title = LUI.UIText.new()
	title.id = "title"
	title:SetRGBFromTable( SWATCHES.Reticles.Orange, 0 )
	title:setText( "Cryptid Attack", 0 )
	title:SetFontSize( 26 * _1080p )
	title:SetFont( FONTS.GetFont( FONTS.ZmClean.File ) )
	title:SetAlignment( LUI.Alignment.Center )
	title:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1325, _1080p * 1697, _1080p * 805, _1080p * 831 )
	self:addElement( title )
	self.title = title
	
	local hint = nil
	
	hint = LUI.UIText.new()
	hint.id = "hint"
	hint:SetRGBFromTable( SWATCHES.Reticles.White, 0 )
	hint:setText( Engine.Localize( "COOP_INTERACTIONS_CRYPTID_HELPER" ), 0 )
	hint:SetFontSize( 16 * _1080p )
	hint:SetFont( FONTS.GetFont( FONTS.ZmClean.File ) )
	hint:SetAlignment( LUI.Alignment.Center )
	hint:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1320, _1080p * 1629, _1080p * 904.06, _1080p * 920.06 )
	self:addElement( hint )
	self.hint = hint
	
	local topper = nil
	
	topper = LUI.UIImage.new()
	topper.id = "topper"
	topper:setImage( RegisterMaterial( "cp_zmb_ca_top" ), 0 )
	topper:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1218.7, _1080p * 1730.7, _1080p * 725, _1080p * 853 )
	self:addElement( topper )
	self.topper = topper
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		bg:RegisterAnimationSequence( "onCreate", {
			{
				function ()
					return self.bg:SetAlpha( 0, 0 )
				end
			}
		} )
		title:RegisterAnimationSequence( "onCreate", {
			{
				function ()
					return self.title:SetAlpha( 0, 0 )
				end
			}
		} )
		hint:RegisterAnimationSequence( "onCreate", {
			{
				function ()
					return self.hint:SetAlpha( 0, 0 )
				end
			}
		} )
		topper:RegisterAnimationSequence( "onCreate", {
			{
				function ()
					return self.topper:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.onCreate = function ()
			bg:AnimateSequence( "onCreate" )
			title:AnimateSequence( "onCreate" )
			hint:AnimateSequence( "onCreate" )
			topper:AnimateSequence( "onCreate" )
		end
		
		bg:RegisterAnimationSequence( "show", {
			{
				function ()
					return self.bg:SetAlpha( 1, 0 )
				end
			}
		} )
		title:RegisterAnimationSequence( "show", {
			{
				function ()
					return self.title:SetAlpha( 1, 0 )
				end
			}
		} )
		hint:RegisterAnimationSequence( "show", {
			{
				function ()
					return self.hint:SetAlpha( 1, 0 )
				end
			}
		} )
		topper:RegisterAnimationSequence( "show", {
			{
				function ()
					return self.topper:SetAlpha( 1, 0 )
				end
			}
		} )
		self._sequences.show = function ()
			bg:AnimateSequence( "show" )
			title:AnimateSequence( "show" )
			hint:AnimateSequence( "show" )
			topper:AnimateSequence( "show" )
		end
		
		bg:RegisterAnimationSequence( "hide", {
			{
				function ()
					return self.bg:SetAlpha( 0, 0 )
				end
			}
		} )
		title:RegisterAnimationSequence( "hide", {
			{
				function ()
					return self.title:SetAlpha( 0, 0 )
				end
			}
		} )
		hint:RegisterAnimationSequence( "hide", {
			{
				function ()
					return self.hint:SetAlpha( 0, 0 )
				end
			}
		} )
		topper:RegisterAnimationSequence( "hide", {
			{
				function ()
					return self.topper:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.hide = function ()
			bg:AnimateSequence( "hide" )
			title:AnimateSequence( "hide" )
			hint:AnimateSequence( "hide" )
			topper:AnimateSequence( "hide" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	self:SubscribeToModel( DataSources.inGame.CP.zombies.gameHelper:GetModel( f3_local1 ), function ()
		if DataSources.inGame.CP.zombies.gameHelper:GetValue( f3_local1 ) ~= nil and DataSources.inGame.CP.zombies.gameHelper:GetValue( f3_local1 ) == 1 then
			ACTIONS.AnimateSequence( self, "show" )
		end
		if DataSources.inGame.CP.zombies.gameHelper:GetValue( f3_local1 ) ~= nil and DataSources.inGame.CP.zombies.gameHelper:GetValue( f3_local1 ) == 0 then
			ACTIONS.AnimateSequence( self, "hide" )
		end
	end )
	f0_local0( self, f3_local1, controller )
	ACTIONS.AnimateSequence( self, "onCreate" )
	return self
end

MenuBuilder.registerType( "gameHelper", gameHelper )
LockTable( _M )
