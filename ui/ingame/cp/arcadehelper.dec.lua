local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ( f1_arg0, f1_arg1, f1_arg2 )
	f1_arg0:registerEventHandler( "empty_menu_stack", function ( element, event )
		element.hintModes:setText( Engine.Localize( "COOP_INTERACTIONS_ARCADE_HELPER_CYCLE_MODE" ), 0 )
		element.hintRestart:setText( Engine.Localize( "COOP_INTERACTIONS_ARCADE_HELPER_RESTART" ), 0 )
		element.hintFireJump:setText( Engine.Localize( "COOP_INTERACTIONS_ARCADE_HELPER_JUMP" ), 0 )
		element.hintQuit:setText( Engine.Localize( "COOP_INTERACTIONS_ARCADE_HELPER_QUIT" ), 0 )
	end )
end

function arcadeHelper( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 1920 * _1080p, 0, 1080 * _1080p )
	self.id = "arcadeHelper"
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
	bg:SetRGBFromInt( 6997709, 0 )
	bg:setImage( RegisterMaterial( "cp_zmb_arcade_helper" ), 0 )
	bg:SetUseAA( true )
	bg:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1218.7, _1080p * 1730.7, _1080p * 739, _1080p * 995 )
	self:addElement( bg )
	self.bg = bg
	
	local hintModes = nil
	
	hintModes = LUI.UIText.new()
	hintModes.id = "hintModes"
	hintModes:SetRGBFromTable( SWATCHES.Reticles.White, 0 )
	hintModes:setText( Engine.Localize( "COOP_INTERACTIONS_ARCADE_HELPER_CYCLE_MODE" ), 0 )
	hintModes:SetFontSize( 18 * _1080p )
	hintModes:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	hintModes:SetAlignment( LUI.Alignment.Left )
	hintModes:SetOptOutRightToLeftAlignmentFlip( true )
	hintModes:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1325.2, _1080p * 1474.7, _1080p * 884, _1080p * 902 )
	self:addElement( hintModes )
	self.hintModes = hintModes
	
	local hintRestart = nil
	
	hintRestart = LUI.UIText.new()
	hintRestart.id = "hintRestart"
	hintRestart:SetRGBFromTable( SWATCHES.Reticles.White, 0 )
	hintRestart:setText( Engine.Localize( "COOP_INTERACTIONS_ARCADE_HELPER_RESTART" ), 0 )
	hintRestart:SetFontSize( 18 * _1080p )
	hintRestart:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	hintRestart:SetAlignment( LUI.Alignment.Left )
	hintRestart:SetOptOutRightToLeftAlignmentFlip( true )
	hintRestart:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1482.2, _1080p * 1626.7, _1080p * 842, _1080p * 860 )
	self:addElement( hintRestart )
	self.hintRestart = hintRestart
	
	local hintFireJump = nil
	
	hintFireJump = LUI.UIText.new()
	hintFireJump.id = "hintFireJump"
	hintFireJump:SetRGBFromTable( SWATCHES.Reticles.White, 0 )
	hintFireJump:setText( Engine.Localize( "COOP_INTERACTIONS_ARCADE_HELPER_JUMP" ), 0 )
	hintFireJump:SetFontSize( 18 * _1080p )
	hintFireJump:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	hintFireJump:SetAlignment( LUI.Alignment.Left )
	hintFireJump:SetOptOutRightToLeftAlignmentFlip( true )
	hintFireJump:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1325.2, _1080p * 1474.7, _1080p * 842, _1080p * 860 )
	self:addElement( hintFireJump )
	self.hintFireJump = hintFireJump
	
	local topper = nil
	
	topper = LUI.UIImage.new()
	topper.id = "topper"
	topper:setImage( RegisterMaterial( "cp_zmb_arcade_top" ), 0 )
	topper:SetUseAA( true )
	topper:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1218.7, _1080p * 1730.7, _1080p * 725, _1080p * 853 )
	self:addElement( topper )
	self.topper = topper
	
	local hintQuit = nil
	
	hintQuit = LUI.UIText.new()
	hintQuit.id = "hintQuit"
	hintQuit:SetRGBFromTable( SWATCHES.Reticles.White, 0 )
	hintQuit:setText( Engine.Localize( "COOP_INTERACTIONS_ARCADE_HELPER_QUIT" ), 0 )
	hintQuit:SetFontSize( 18 * _1080p )
	hintQuit:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	hintQuit:SetAlignment( LUI.Alignment.Left )
	hintQuit:SetOptOutRightToLeftAlignmentFlip( true )
	hintQuit:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1482.2, _1080p * 1626.7, _1080p * 866, _1080p * 884 )
	self:addElement( hintQuit )
	self.hintQuit = hintQuit
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		bg:RegisterAnimationSequence( "oncreate", {
			{
				function ()
					return self.bg:SetAlpha( 0, 0 )
				end
			}
		} )
		hintModes:RegisterAnimationSequence( "oncreate", {
			{
				function ()
					return self.hintModes:SetAlpha( 0, 0 )
				end
			}
		} )
		hintRestart:RegisterAnimationSequence( "oncreate", {
			{
				function ()
					return self.hintRestart:SetAlpha( 0, 0 )
				end
			}
		} )
		hintFireJump:RegisterAnimationSequence( "oncreate", {
			{
				function ()
					return self.hintFireJump:SetAlpha( 0, 0 )
				end
			}
		} )
		topper:RegisterAnimationSequence( "oncreate", {
			{
				function ()
					return self.topper:SetAlpha( 0, 0 )
				end
			}
		} )
		hintQuit:RegisterAnimationSequence( "oncreate", {
			{
				function ()
					return self.hintQuit:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.oncreate = function ()
			bg:AnimateSequence( "oncreate" )
			hintModes:AnimateSequence( "oncreate" )
			hintRestart:AnimateSequence( "oncreate" )
			hintFireJump:AnimateSequence( "oncreate" )
			topper:AnimateSequence( "oncreate" )
			hintQuit:AnimateSequence( "oncreate" )
		end
		
		bg:RegisterAnimationSequence( "hide", {
			{
				function ()
					return self.bg:SetAlpha( 0, 0 )
				end
			}
		} )
		hintModes:RegisterAnimationSequence( "hide", {
			{
				function ()
					return self.hintModes:SetAlpha( 0, 0 )
				end
			}
		} )
		hintRestart:RegisterAnimationSequence( "hide", {
			{
				function ()
					return self.hintRestart:SetAlpha( 0, 0 )
				end
			}
		} )
		hintFireJump:RegisterAnimationSequence( "hide", {
			{
				function ()
					return self.hintFireJump:SetAlpha( 0, 0 )
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
		hintQuit:RegisterAnimationSequence( "hide", {
			{
				function ()
					return self.hintQuit:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.hide = function ()
			bg:AnimateSequence( "hide" )
			hintModes:AnimateSequence( "hide" )
			hintRestart:AnimateSequence( "hide" )
			hintFireJump:AnimateSequence( "hide" )
			topper:AnimateSequence( "hide" )
			hintQuit:AnimateSequence( "hide" )
		end
		
		bg:RegisterAnimationSequence( "show", {
			{
				function ()
					return self.bg:SetAlpha( 1, 0 )
				end
			}
		} )
		hintModes:RegisterAnimationSequence( "show", {
			{
				function ()
					return self.hintModes:SetAlpha( 1, 0 )
				end
			}
		} )
		hintRestart:RegisterAnimationSequence( "show", {
			{
				function ()
					return self.hintRestart:SetAlpha( 1, 0 )
				end
			}
		} )
		hintFireJump:RegisterAnimationSequence( "show", {
			{
				function ()
					return self.hintFireJump:SetAlpha( 1, 0 )
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
		hintQuit:RegisterAnimationSequence( "show", {
			{
				function ()
					return self.hintQuit:SetAlpha( 1, 0 )
				end
			}
		} )
		self._sequences.show = function ()
			bg:AnimateSequence( "show" )
			hintModes:AnimateSequence( "show" )
			hintRestart:AnimateSequence( "show" )
			hintFireJump:AnimateSequence( "show" )
			topper:AnimateSequence( "show" )
			hintQuit:AnimateSequence( "show" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	self:SubscribeToModel( DataSources.inGame.CP.zombies.arcadeHelper:GetModel( f3_local1 ), function ()
		if DataSources.inGame.CP.zombies.arcadeHelper:GetValue( f3_local1 ) ~= nil and DataSources.inGame.CP.zombies.arcadeHelper:GetValue( f3_local1 ) == 1 then
			ACTIONS.AnimateSequence( self, "show" )
		end
		if DataSources.inGame.CP.zombies.arcadeHelper:GetValue( f3_local1 ) ~= nil and DataSources.inGame.CP.zombies.arcadeHelper:GetValue( f3_local1 ) == 0 then
			ACTIONS.AnimateSequence( self, "hide" )
		end
	end )
	f0_local0( self, f3_local1, controller )
	ACTIONS.AnimateSequence( self, "oncreate" )
	return self
end

MenuBuilder.registerType( "arcadeHelper", arcadeHelper )
LockTable( _M )
