local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function WristPCShieldMeter( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 512 * _1080p, 0, 64 * _1080p )
	self.id = "WristPCShieldMeter"
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local Background = nil
	
	Background = LUI.UIImage.new()
	Background.id = "Background"
	Background:SetAlpha( 0.01, 0 )
	Background:SetAnchorsAndPosition( 0, 0, 0.5, 0.5, _1080p * 10, _1080p * -10, _1080p * -15, _1080p * 15 )
	Background:BindColorToModel( DataSources.inGame.player.secondaryPower.color:GetModel( f1_local1 ) )
	self:addElement( Background )
	self.Background = Background
	
	local Frame = nil
	
	Frame = LUI.UIImage.new()
	Frame.id = "Frame"
	Frame:setImage( RegisterMaterial( "hud_wrist_pc_shield_meter_frame" ), 0 )
	Frame:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -256, _1080p * 256, _1080p * -32, _1080p * 32 )
	Frame:BindColorToModel( DataSources.inGame.player.secondaryPower.color:GetModel( f1_local1 ) )
	self:addElement( Frame )
	self.Frame = Frame
	
	local Fill = nil
	
	Fill = LUI.UIImage.new()
	Fill.id = "Fill"
	Fill:SetAnchors( 0, 1, 0.5, 0.5, 0 )
	Fill:SetLeft( _1080p * 11, 0 )
	Fill:SetTop( _1080p * -15, 0 )
	Fill:SetBottom( _1080p * 15, 0 )
	Fill:SetAlpha( 0.58, 0 )
	Fill:setImage( RegisterMaterial( "ui_default_white_intense" ), 0 )
	Fill:SubscribeToModel( DataSources.inGame.player.secondaryPower.rechargeProgress:GetModel( f1_local1 ), function ()
		local f2_local0 = DataSources.inGame.player.secondaryPower.rechargeProgress:GetValue( f1_local1 )
		if f2_local0 ~= nil then
			Fill:SetRight( _1080p * Add( Multiply( Multiply( Divide( f2_local0, 10 ), 0.01 ), 490 ), 11 ), 0 )
		end
	end )
	Fill:BindColorToModel( DataSources.inGame.player.secondaryPower.color:GetModel( f1_local1 ) )
	self:addElement( Fill )
	self.Fill = Fill
	
	local Tab = nil
	
	Tab = LUI.UIImage.new()
	Tab.id = "Tab"
	Tab:SetAnchors( 0, 1, 0.5, 0.5, 0 )
	Tab:SetTop( _1080p * -15, 0 )
	Tab:SetBottom( _1080p * 15, 0 )
	Tab:setImage( RegisterMaterial( "ui_default_white_intense" ), 0 )
	Tab:SubscribeToModel( DataSources.inGame.player.secondaryPower.rechargeProgress:GetModel( f1_local1 ), function ()
		local f3_local0 = DataSources.inGame.player.secondaryPower.rechargeProgress:GetValue( f1_local1 )
		if f3_local0 ~= nil then
			Tab:SetLeft( _1080p * Add( Multiply( Multiply( Divide( f3_local0, 10 ), 0.01 ), 490 ), 11 ), 0 )
		end
	end )
	Tab:SubscribeToModel( DataSources.inGame.player.secondaryPower.rechargeProgress:GetModel( f1_local1 ), function ()
		local f4_local0 = DataSources.inGame.player.secondaryPower.rechargeProgress:GetValue( f1_local1 )
		if f4_local0 ~= nil then
			Tab:SetRight( _1080p * Add( Add( Multiply( Multiply( Divide( f4_local0, 10 ), 0.01 ), 490 ), 6 ), 11 ), 0 )
		end
	end )
	self:addElement( Tab )
	self.Tab = Tab
	
	local Arrow = nil
	
	Arrow = LUI.UIImage.new()
	Arrow.id = "Arrow"
	Arrow:SetAnchors( 0, 1, 0, 1, 0 )
	Arrow:SetTop( _1080p * 0, 0 )
	Arrow:SetBottom( _1080p * 16, 0 )
	Arrow:setImage( RegisterMaterial( "hud_arrow" ), 0 )
	Arrow:SubscribeToModel( DataSources.inGame.player.secondaryPower.rechargeProgress:GetModel( f1_local1 ), function ()
		local f5_local0 = DataSources.inGame.player.secondaryPower.rechargeProgress:GetValue( f1_local1 )
		if f5_local0 ~= nil then
			Arrow:SetLeft( _1080p * Add( Add( Multiply( Multiply( Divide( f5_local0, 10 ), 0.01 ), 490 ), -5 ), 11 ), 0 )
		end
	end )
	Arrow:SubscribeToModel( DataSources.inGame.player.secondaryPower.rechargeProgress:GetModel( f1_local1 ), function ()
		local f6_local0 = DataSources.inGame.player.secondaryPower.rechargeProgress:GetValue( f1_local1 )
		if f6_local0 ~= nil then
			Arrow:SetRight( _1080p * Add( Add( Multiply( Multiply( Divide( f6_local0, 10 ), 0.01 ), 490 ), 11 ), 11 ), 0 )
		end
	end )
	self:addElement( Arrow )
	self.Arrow = Arrow
	
	return self
end

MenuBuilder.registerType( "WristPCShieldMeter", WristPCShieldMeter )
LockTable( _M )
