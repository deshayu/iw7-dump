local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ( f1_arg0, f1_arg1 )
	CODCASTER.InitToolbarButton( f1_arg0.SelectPlayer, Engine.Localize( ButtonMap.button_primary.string ), Engine.Localize( "CODCASTER_SELECT_PLAYER" ), false )
	if Engine.IsPC() and Engine.IsGamepadEnabled() == 0 then
		CODCASTER.InitToolbarButton( f1_arg0.HighlightPlayer, Engine.Localize( "CODCASTER_HIGHLIGHT_PLAYER_PC" ), Engine.Localize( "CODCASTER_HIGHLIGHT_PLAYER" ), false )
	else
		CODCASTER.InitToolbarButton( f1_arg0.HighlightPlayer, Engine.Localize( "CODCASTER_HIGHLIGHT_PLAYER_BUTTON" ), Engine.Localize( "CODCASTER_HIGHLIGHT_PLAYER" ), false )
	end
end

f0_local1 = function ( f2_arg0, f2_arg1, f2_arg2 )
	if Engine.IsPC() then
		f2_arg0:registerEventHandler( "empty_menu_stack", function ( element, event )
			f0_local0( element, f2_arg1 )
		end )
	end
	f0_local0( f2_arg0, f2_arg1 )
end

function CodcasterToolbarLeftButtons( menu, controller )
	local self = LUI.UIHorizontalStackedLayout.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 542 * _1080p, 0, 115 * _1080p )
	self.id = "CodcasterToolbarLeftButtons"
	local f4_local1 = controller and controller.controllerIndex
	if not f4_local1 and not Engine.InFrontend() then
		f4_local1 = self:getRootController()
	end
	assert( f4_local1 )
	local f4_local2 = self
	self:SetSpacing( 5 )
	local SelectPlayer = nil
	
	SelectPlayer = MenuBuilder.BuildRegisteredType( "CodcasterToolbarButton", {
		controllerIndex = f4_local1
	} )
	SelectPlayer.id = "SelectPlayer"
	SelectPlayer.ButtonIcon:SetLeft( _1080p * 0, 0 )
	SelectPlayer.ButtonIcon:SetRight( _1080p * 32, 0 )
	SelectPlayer.ButtonText:SetLeft( _1080p * 35, 0 )
	SelectPlayer.ButtonText:SetRight( _1080p * 192, 0 )
	SelectPlayer:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 427.5, _1080p * 627.5, _1080p * 43, _1080p * 72 )
	self:addElement( SelectPlayer )
	self.SelectPlayer = SelectPlayer
	
	local HighlightPlayer = nil
	
	HighlightPlayer = MenuBuilder.BuildRegisteredType( "CodcasterToolbarButton", {
		controllerIndex = f4_local1
	} )
	HighlightPlayer.id = "HighlightPlayer"
	HighlightPlayer.ButtonIcon:SetLeft( _1080p * 0, 0 )
	HighlightPlayer.ButtonIcon:SetRight( _1080p * 32, 0 )
	HighlightPlayer.ButtonText:SetLeft( _1080p * 35, 0 )
	HighlightPlayer.ButtonText:SetRight( _1080p * 192, 0 )
	HighlightPlayer:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 171, _1080p * 371, _1080p * 43, _1080p * 72 )
	self:addElement( HighlightPlayer )
	self.HighlightPlayer = HighlightPlayer
	
	f0_local1( self, f4_local1, controller )
	return self
end

MenuBuilder.registerType( "CodcasterToolbarLeftButtons", CodcasterToolbarLeftButtons )
LockTable( _M )
