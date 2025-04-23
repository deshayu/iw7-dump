local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function PostLoadFunc( f1_arg0, f1_arg1 )
	local f1_local0 = DataSources.inGame.jackal.specialistAdsMask
	local f1_local1 = DataSources.inGame.jackal.aimTrackPercent
	f1_arg0:SubscribeToModel( f1_local1:GetModel( f1_arg1 ), function ()
		local f2_local0 = f1_local1:GetValue( f1_arg1 ) * f1_local0:GetValue( f1_arg1 )
		f1_arg0.Inner:SetAlpha( 1 * f2_local0, 0 )
		f1_arg0.Inner:SetScale( 0.6 * f2_local0 + 0.15 + -1, 0 )
		f1_arg0.Outer:SetAlpha( 1 * f2_local0, 0 )
		f1_arg0.Outer:SetZRotation( 45 * f2_local0, 0 )
		f1_arg0.Outer:SetScale( 0.6 * f2_local0 + 0.4 + -1, 0 )
		f1_arg0.circle:SetAlpha( Mirror( f2_local0, 0, 1 ), 0 )
		f1_arg0.circle:SetScale( 0.3 * f2_local0 + 0.25 + -1, 0 )
	end )
end

function jackalTargetAimRatePieces( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 48 * _1080p, 0, 48 * _1080p )
	self.id = "jackalTargetAimRatePieces"
	local f3_local1 = controller and controller.controllerIndex
	if not f3_local1 and not Engine.InFrontend() then
		f3_local1 = self:getRootController()
	end
	assert( f3_local1 )
	self.soundSet = "jackal"
	local f3_local2 = self
	local Inner = nil
	
	Inner = LUI.UIImage.new()
	Inner.id = "Inner"
	Inner:setImage( RegisterMaterial( "hud_jackal_strike_reticule_piece_center_square_sm" ), 0 )
	Inner:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -8, _1080p * 8, _1080p * -8, _1080p * 8 )
	self:addElement( Inner )
	self.Inner = Inner
	
	local Outer = nil
	
	Outer = LUI.UIImage.new()
	Outer.id = "Outer"
	Outer:setImage( RegisterMaterial( "hud_jackal_strike_reticule_piece_center_square_med" ), 0 )
	Outer:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -8, _1080p * 8, _1080p * -8, _1080p * 8 )
	self:addElement( Outer )
	self.Outer = Outer
	
	local circle = nil
	
	circle = LUI.UIImage.new()
	circle.id = "circle"
	circle:setImage( RegisterMaterial( "hud_jackal_strike_reticule_piece_center_circle_md" ), 0 )
	circle:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -20, _1080p * 20, _1080p * -20, _1080p * 20 )
	self:addElement( circle )
	self.circle = circle
	
	PostLoadFunc( self, f3_local1, controller )
	return self
end

MenuBuilder.registerType( "jackalTargetAimRatePieces", jackalTargetAimRatePieces )
LockTable( _M )
