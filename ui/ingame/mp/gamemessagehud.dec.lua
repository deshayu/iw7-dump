local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
CoD.PrintModuleLoad( _NAME )
f0_local0 = function ( f1_arg0, f1_arg1 )
	if (Engine.IsAliensMode() or f1_arg1.bold) and f1_arg1.message then
		f1_arg0:setText( f1_arg1.message )
		local f1_local0 = MBh.AnimateSequence( {
			{
				"opening",
				0
			},
			{
				"active",
				100
			},
			{
				"active",
				2500
			},
			{
				"default",
				100
			}
		} )
		f1_local0( f1_arg0 )
	end
end

MenuBuilder.registerType( "gameMessageHudDef", function ()
	local self = LUI.UIElement.new()
	self.id = "gameMessagesID"
	self:registerAnimationState( "default", {
		topAnchor = true,
		bottomAnchor = false,
		leftAnchor = false,
		rightAnchor = false,
		top = 200,
		height = 32,
		left = -32,
		right = 32
	} )
	self:animateToState( "default" )
	local f2_local1 = LUI.UIText.new()
	f2_local1.id = "text"
	f2_local1:setTextStyle( CoD.TextStyle.Shadowed )
	f2_local1:registerAnimationState( "default", {
		alignment = LUI.Alignment.Center,
		font = CoD.TextSettings.HudEuroNormalFont.Font,
		topAnchor = true,
		bottomAnchor = false,
		leftAnchor = true,
		rightAnchor = true,
		top = 0,
		bottom = 0,
		left = -2000,
		right = 2000,
		alpha = 0
	} )
	f2_local1:registerAnimationState( "opening", {
		font = CoD.TextSettings.HudEuroNormalFont.Font,
		topAnchor = true,
		bottomAnchor = false,
		leftAnchor = true,
		rightAnchor = true,
		top = 0,
		bottom = 80 + CoD.TextSettings.HudEuroNormalFont.Height,
		left = -2000,
		right = 2000,
		alpha = 1
	} )
	f2_local1:registerAnimationState( "active", {
		font = CoD.TextSettings.HudEuroNormalFont.Font,
		topAnchor = true,
		bottomAnchor = false,
		leftAnchor = true,
		rightAnchor = true,
		top = 0,
		bottom = CoD.TextSettings.HudEuroNormalFont.Height,
		left = -2000,
		right = 2000,
		alpha = 1
	} )
	f2_local1:animateToState( "default" )
	f2_local1:registerEventHandler( "game_message", f0_local0 )
	self:addElement( f2_local1 )
	return self
end )
LockTable( _M )
