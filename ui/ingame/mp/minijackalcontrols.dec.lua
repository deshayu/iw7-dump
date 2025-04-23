local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function PostLoadFunc( f1_arg0, f1_arg1, f1_arg2 )
	if GameX.IsSplitscreen() then
		assert( f1_arg0.Fire )
		assert( f1_arg0.Missile )
		assert( f1_arg0.Up )
		assert( f1_arg0.Down )
		assert( f1_arg0.L3Boost )
		f1_arg0.Fire:SetAnchorsAndPosition( 0.5, 0.5, 1, 0, _1080p * 33, _1080p * 655, _1080p * -185, _1080p * -157 )
		f1_arg0.Missile:SetAnchorsAndPosition( 0.5, 0.5, 1, 0, _1080p * 210, _1080p * 898, _1080p * -115, _1080p * -87 )
		f1_arg0.Up:SetAnchorsAndPosition( 0.5, 0.5, 1, 0, _1080p * -898, _1080p * -210, _1080p * -115, _1080p * -87 )
		f1_arg0.Down:SetAnchorsAndPosition( 0.5, 0.5, 1, 0, _1080p * -655, _1080p * 33, _1080p * -185, _1080p * -157 )
		f1_arg0.L3Boost:SetAnchorsAndPosition( 0.5, 0.5, 1, 0, _1080p * -500, _1080p * 500, _1080p * -115, _1080p * -87 )
	end
	if Game.GetOmnvar( "ui_minijackal_controls" ) == 2 then
		f1_arg0.Fire:setText( Engine.Localize( "LUA_MENU_MP_MINIJACKAL_FIRE_LASER" ), 0 )
	end
end

function MinijackalControls( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 1920 * _1080p, 0, 1080 * _1080p )
	self.id = "MinijackalControls"
	local f2_local1 = controller and controller.controllerIndex
	if not f2_local1 and not Engine.InFrontend() then
		f2_local1 = self:getRootController()
	end
	assert( f2_local1 )
	local f2_local2 = self
	local Fire = nil
	
	Fire = LUI.UIText.new()
	Fire.id = "Fire"
	Fire:setText( Engine.Localize( "LUA_MENU_MP_MINIJACKAL_FIRE" ), 0 )
	Fire:SetFontSize( 26 * _1080p )
	Fire:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	Fire:setTextStyle( CoD.TextStyle.Shadowed )
	Fire:SetAlignment( LUI.Alignment.Center )
	Fire:SetOptOutRightToLeftAlignmentFlip( true )
	Fire:SetAnchorsAndPosition( 0.5, 0.5, 1, 0, _1080p * 33, _1080p * 655, _1080p * -282, _1080p * -256 )
	self:addElement( Fire )
	self.Fire = Fire
	
	local Missile = nil
	
	Missile = LUI.UIText.new()
	Missile.id = "Missile"
	Missile:setText( Engine.Localize( "LUA_MENU_MP_MINIJACKAL_MISSILE" ), 0 )
	Missile:SetFontSize( 26 * _1080p )
	Missile:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	Missile:setTextStyle( CoD.TextStyle.Shadowed )
	Missile:SetAlignment( LUI.Alignment.Center )
	Missile:SetOptOutRightToLeftAlignmentFlip( true )
	Missile:SetAnchorsAndPosition( 0.5, 0.5, 1, 0, _1080p * 210, _1080p * 898, _1080p * -212, _1080p * -186 )
	self:addElement( Missile )
	self.Missile = Missile
	
	local Up = nil
	
	Up = LUI.UIText.new()
	Up.id = "Up"
	Up:setText( Engine.Localize( "LUA_MENU_MP_MINIJACKAL_UP" ), 0 )
	Up:SetFontSize( 26 * _1080p )
	Up:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	Up:setTextStyle( CoD.TextStyle.Shadowed )
	Up:SetAlignment( LUI.Alignment.Center )
	Up:SetAnchorsAndPosition( 0.5, 0.5, 1, 0, _1080p * -898, _1080p * -210, _1080p * -212, _1080p * -186 )
	self:addElement( Up )
	self.Up = Up
	
	local Down = nil
	
	Down = LUI.UIText.new()
	Down.id = "Down"
	Down:setText( Engine.Localize( "LUA_MENU_MP_MINIJACKAL_DOWN" ), 0 )
	Down:SetFontSize( 26 * _1080p )
	Down:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	Down:setTextStyle( CoD.TextStyle.Shadowed )
	Down:SetAlignment( LUI.Alignment.Center )
	Down:SetAnchorsAndPosition( 0.5, 0.5, 1, 0, _1080p * -655, _1080p * 33, _1080p * -282, _1080p * -256 )
	self:addElement( Down )
	self.Down = Down
	
	local L3Boost = nil
	
	L3Boost = LUI.UIText.new()
	L3Boost.id = "L3Boost"
	L3Boost:setText( Engine.Localize( "LUA_MENU_MP_MINIJACKAL_BOOST" ), 0 )
	L3Boost:SetFontSize( 26 * _1080p )
	L3Boost:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	L3Boost:setTextStyle( CoD.TextStyle.Shadowed )
	L3Boost:SetAlignment( LUI.Alignment.Center )
	L3Boost:SetAnchorsAndPosition( 0.5, 0.5, 1, 0, _1080p * -500, _1080p * 500, _1080p * -127, _1080p * -101 )
	self:addElement( L3Boost )
	self.L3Boost = L3Boost
	
	PostLoadFunc( self, f2_local1, controller )
	return self
end

MenuBuilder.registerType( "MinijackalControls", MinijackalControls )
LockTable( _M )
