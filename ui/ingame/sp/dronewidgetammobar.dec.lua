local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ( f1_arg0, f1_arg1, f1_arg2 )
	f1_arg0.AmmoBarFill:SetAlpha( 1, 0 )
	f1_arg0:SubscribeToModelThroughElement( f1_arg0, "ammoBarPercent", function ()
		local f2_local0 = f1_arg0:GetDataSource()
		f2_local0 = f2_local0.ammoBarPercent:GetValue( f1_arg1 )
		if f2_local0 ~= nil then
			if f2_local0 == 0 then
				f1_arg0.AmmoBarFill:SetAlpha( 0, 0 )
			end
			f1_arg0.AmmoBarFill:SetLeft( _1080p * Multiply( Subtract( f2_local0, 1 ), -164 ), 0 )
		end
	end )
end

function DroneWidgetAmmoBar( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 164 * _1080p, 0, 16 * _1080p )
	self.id = "DroneWidgetAmmoBar"
	local f3_local1 = controller and controller.controllerIndex
	if not f3_local1 and not Engine.InFrontend() then
		f3_local1 = self:getRootController()
	end
	assert( f3_local1 )
	local f3_local2 = self
	local AmmoBarBg = nil
	
	AmmoBarBg = LUI.UIImage.new()
	AmmoBarBg.id = "AmmoBarBg"
	AmmoBarBg:SetRGBFromInt( 0, 0 )
	AmmoBarBg:SetAlpha( 0.25, 0 )
	AmmoBarBg:SetUseAA( true )
	AmmoBarBg:SetAnchorsAndPosition( 0, 0, 0.5, 0.5, 0, 0, _1080p * -2, _1080p * 2 )
	self:addElement( AmmoBarBg )
	self.AmmoBarBg = AmmoBarBg
	
	local AmmoBarFill = nil
	
	AmmoBarFill = LUI.UIImage.new()
	AmmoBarFill.id = "AmmoBarFill"
	AmmoBarFill:SetRGBFromInt( 6277069, 0 )
	AmmoBarFill:SetUseAA( true )
	AmmoBarFill:SetAnchorsAndPosition( 0, 0, 0.5, 0.5, 0, 0, _1080p * -2, _1080p * 2 )
	self:addElement( AmmoBarFill )
	self.AmmoBarFill = AmmoBarFill
	
	local AmmoBarCap = nil
	
	AmmoBarCap = LUI.UIImage.new()
	AmmoBarCap.id = "AmmoBarCap"
	AmmoBarCap:SetAnchors( 0, 1, 0.5, 0.5, 0 )
	AmmoBarCap:SetTop( _1080p * -2, 0 )
	AmmoBarCap:SetBottom( _1080p * 2, 0 )
	AmmoBarCap:SetUseAA( true )
	AmmoBarCap:SubscribeToModelThroughElement( self, "ammoBarPercent", function ()
		local f4_local0 = self:GetDataSource()
		f4_local0 = f4_local0.ammoBarPercent:GetValue( f3_local1 )
		if f4_local0 ~= nil then
			AmmoBarCap:SetLeft( _1080p * Multiply( Subtract( f4_local0, 1 ), -164 ), 0 )
		end
	end )
	AmmoBarCap:SubscribeToModelThroughElement( self, "ammoBarPercent", function ()
		local f5_local0 = self:GetDataSource()
		f5_local0 = f5_local0.ammoBarPercent:GetValue( f3_local1 )
		if f5_local0 ~= nil then
			AmmoBarCap:SetRight( _1080p * Subtract( Multiply( Subtract( f5_local0, 1 ), -164 ), 3 ), 0 )
		end
	end )
	self:addElement( AmmoBarCap )
	self.AmmoBarCap = AmmoBarCap
	
	f0_local0( self, f3_local1, controller )
	return self
end

MenuBuilder.registerType( "DroneWidgetAmmoBar", DroneWidgetAmmoBar )
LockTable( _M )
