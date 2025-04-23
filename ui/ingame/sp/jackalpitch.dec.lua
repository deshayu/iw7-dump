local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ( f1_arg0, f1_arg1, f1_arg2 )
	f1_arg0.Numbers:SetMask( f1_arg0.Mask )
	local f1_local0 = DataSources.inGame.jackal.launchPitch
	f1_arg0:SubscribeToModel( f1_local0:GetModel( f1_arg1 ), function ()
		local f2_local0 = f1_local0:GetValue( f1_arg1 )
		if f2_local0 ~= nil then
			local f2_local1 = f2_local0 / 180 * 460
			f1_arg0.Numbers:SetTop( -512 * _1080p + f2_local1, 100 )
			f1_arg0.Numbers:SetBottom( 512 * _1080p + f2_local1, 100 )
		end
	end )
end

function JackalPitch( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 64 * _1080p, 0, 330 * _1080p )
	self.id = "JackalPitch"
	local f3_local1 = controller and controller.controllerIndex
	if not f3_local1 and not Engine.InFrontend() then
		f3_local1 = self:getRootController()
	end
	assert( f3_local1 )
	local f3_local2 = self
	local Numbers = nil
	
	Numbers = LUI.UIImage.new()
	Numbers.id = "Numbers"
	Numbers:SetAlpha( 0.9, 0 )
	Numbers:setImage( RegisterMaterial( "hud_jackal_launch_pitch_meter_numbers" ), 0 )
	Numbers:SetAnchorsAndPosition( 0, 1, 0.5, 0.5, 0, _1080p * 64, _1080p * -512, _1080p * 512 )
	self:addElement( Numbers )
	self.Numbers = Numbers
	
	local Mask = nil
	
	Mask = LUI.UIImage.new()
	Mask.id = "Mask"
	Mask:setImage( RegisterMaterial( "hud_jackal_launch_pitch_numbers_mask" ), 0 )
	self:addElement( Mask )
	self.Mask = Mask
	
	local Bracket = nil
	
	Bracket = LUI.UIImage.new()
	Bracket.id = "Bracket"
	Bracket:SetZRotation( 180, 0 )
	Bracket:setImage( RegisterMaterial( "hud_jackal_launch_meter_bracket" ), 0 )
	Bracket:SetAnchorsAndPosition( 0, 1, 0.5, 0.5, _1080p * -32, 0, _1080p * -256, _1080p * 256 )
	self:addElement( Bracket )
	self.Bracket = Bracket
	
	local Arrow = nil
	
	Arrow = LUI.UIImage.new()
	Arrow.id = "Arrow"
	Arrow:SetAlpha( 0.7, 0 )
	Arrow:setImage( RegisterMaterial( "hud_jackal_launch_meter_arrow" ), 0 )
	Arrow:SetAnchorsAndPosition( 0, 1, 0.5, 0.5, _1080p * -37, _1080p * -5, _1080p * -8, _1080p * 8 )
	self:addElement( Arrow )
	self.Arrow = Arrow
	
	f0_local0( self, f3_local1, controller )
	return self
end

MenuBuilder.registerType( "JackalPitch", JackalPitch )
LockTable( _M )
