local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ( f1_arg0, f1_arg1, f1_arg2 )
	assert( type( f1_arg1 ) == "number" )
	assert( type( f1_arg2 ) == "number" )
	f1_arg0.Mask:SetAnchorsAndPosition( 0, 1 - LUI.clamp( f1_arg1, 0, 1 ), 0, 0, 0, 0, 0, 0, f1_arg2 )
end

f0_local1 = function ( f2_arg0, f2_arg1, f2_arg2 )
	f2_arg0.SetProgress = f0_local0
	f2_arg0.Fill:SetMask( f2_arg0.Mask )
	local f2_local0 = DataSources.inGame.CP.zombies.secureProgress
	f2_arg0:SubscribeToModel( f2_local0:GetModel( f2_arg1 ), function ()
		local f3_local0 = f2_local0:GetValue( f2_arg1 )
		if f3_local0 then
			f2_arg0:SetProgress( f3_local0, 0 )
		end
	end )
end

function ReviveProgressBarDLC3( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 220 * _1080p, 0, 32 * _1080p )
	self.id = "ReviveProgressBarDLC3"
	local f4_local1 = controller and controller.controllerIndex
	if not f4_local1 and not Engine.InFrontend() then
		f4_local1 = self:getRootController()
	end
	assert( f4_local1 )
	local f4_local2 = self
	local Fill = nil
	
	Fill = LUI.UIImage.new()
	Fill.id = "Fill"
	Fill:setImage( RegisterMaterial( "cp_town_revive_bar_fill" ), 0 )
	Fill:SetUseAA( true )
	Fill:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -124, _1080p * 126, _1080p * -16, _1080p * 16 )
	self:addElement( Fill )
	self.Fill = Fill
	
	local Mask = nil
	
	Mask = LUI.UIImage.new()
	Mask.id = "Mask"
	Mask:setImage( RegisterMaterial( "devil_stencil_mask" ), 0 )
	Mask:SetUseAA( true )
	Mask:SetAnchorsAndPosition( 0, 1, 0, 0, 0, 0, 0, 0 )
	self:addElement( Mask )
	self.Mask = Mask
	
	f0_local1( self, f4_local1, controller )
	return self
end

MenuBuilder.registerType( "ReviveProgressBarDLC3", ReviveProgressBarDLC3 )
LockTable( _M )
