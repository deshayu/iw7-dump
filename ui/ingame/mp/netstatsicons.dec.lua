local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ( f1_arg0, f1_arg1, f1_arg2 )
	if Engine.GetDvarBool( "killswitch_net_health_icons" ) ~= true and not IsSystemLink() then
		assert( f1_arg0.Extrapolation )
		assert( f1_arg0.LatencyVariation )
		assert( f1_arg0.HighLatency )
		assert( f1_arg0.PacketBursting )
		local f1_local0 = Engine.IsDedi()
		local f1_local1 = SWATCHES.HUD.caution
		local f1_local2 = SWATCHES.HUD.colorblindEnemyTeam
		local f1_local3 = SWATCHES.HUD.enemyTeam
		local f1_local4 = DataSources.inGame.HUD.netPerf.isEnabled
		f1_arg0:SubscribeToModel( f1_local4:GetModel(), function ( f2_arg0 )
			if DataModel.GetModelValue( f2_arg0 ) ~= true then
				f1_arg0:SetAlpha( 0, 0 )
			else
				f1_arg0:SetAlpha( 0.5, 0 )
			end
		end )
		f1_arg0:SubscribeToModel( DataSources.inGame.HUD.netPerf.maxExtrapolation:GetModel( f1_arg1 ), function ( f3_arg0 )
			local f3_local0 = DataModel.GetModelValue( f3_arg0 )
			if f3_local0 ~= nil then
				local f3_local1, f3_local2 = nil
				if f1_local0 then
					f3_local1 = Engine.GetDvarInt( "cg_netStatsExtrapolationLowDedi" )
					f3_local2 = Engine.GetDvarInt( "cg_netStatsExtrapolationHighDedi" )
				else
					f3_local1 = Engine.GetDvarInt( "cg_netStatsExtrapolationLow" )
					f3_local2 = Engine.GetDvarInt( "cg_netStatsExtrapolationHigh" )
				end
				if f3_local1 < f3_local0 then
					f1_arg0.Extrapolation:SetAlpha( 1, 0 )
					if f3_local0 <= f3_local2 then
						f1_arg0.Extrapolation:SetRGBFromTable( f1_local1, 0 )
					else
						f1_arg0.Extrapolation:SetRGBFromTable( f1_local3, 0 )
					end
				else
					f1_arg0.Extrapolation:SetAlpha( 0, 0 )
				end
			end
		end )
		f1_arg0:SubscribeToModel( DataSources.inGame.HUD.netPerf.maxInterpolation:GetModel( f1_arg1 ), function ( f4_arg0 )
			local f4_local0 = DataModel.GetModelValue( f4_arg0 )
			if f4_local0 ~= nil then
				local f4_local1, f4_local2 = nil
				if f1_local0 then
					f4_local1 = Engine.GetDvarInt( "cg_netStatsLatencyVariationLowDedi" )
					f4_local2 = Engine.GetDvarInt( "cg_netStatsLatencyVariationHighDedi" )
				else
					f4_local1 = Engine.GetDvarInt( "cg_netStatsLatencyVariationLow" )
					f4_local2 = Engine.GetDvarInt( "cg_netStatsLatencyVariationHigh" )
				end
				if f4_local1 < f4_local0 then
					f1_arg0.LatencyVariation:SetAlpha( 1, 0 )
					if f4_local0 <= f4_local2 then
						f1_arg0.LatencyVariation:SetRGBFromTable( f1_local1, 0 )
					else
						f1_arg0.LatencyVariation:SetRGBFromTable( f1_local3, 0 )
					end
				else
					f1_arg0.LatencyVariation:SetAlpha( 0, 0 )
				end
			end
		end )
		f1_arg0:SubscribeToModel( DataSources.inGame.HUD.netPerf.ping:GetModel( f1_arg1 ), function ( f5_arg0 )
			local f5_local0 = DataModel.GetModelValue( f5_arg0 )
			if f5_local0 ~= nil then
				local f5_local1, f5_local2 = nil
				if f1_local0 then
					f5_local1 = Engine.GetDvarInt( "cg_netStatsPingLowDedi" )
					f5_local2 = Engine.GetDvarInt( "cg_netStatsPingHighDedi" )
				else
					f5_local1 = Engine.GetDvarInt( "cg_netStatsPingLow" )
					f5_local2 = Engine.GetDvarInt( "cg_netStatsPingHigh" )
				end
				if f5_local1 < f5_local0 then
					f1_arg0.HighLatency:SetAlpha( 1, 0 )
					if f5_local0 <= f5_local2 then
						f1_arg0.HighLatency:SetRGBFromTable( f1_local1, 0 )
					else
						f1_arg0.HighLatency:SetRGBFromTable( f1_local3, 0 )
					end
				else
					f1_arg0.HighLatency:SetAlpha( 0, 0 )
				end
			end
		end )
		local f1_local5 = DataSources.inGame.HUD.netPerf.maxCmdReceived
		local f1_local6 = DataSources.inGame.HUD.netPerf.maxCmdQueued
		local f1_local7 = DataSources.inGame.HUD.netPerf.maxCmdDropped
		local f1_local8 = function ()
			local f6_local0 = f1_local5:GetValue( f1_arg1 )
			local f6_local1 = f1_local6:GetValue( f1_arg1 )
			local f6_local2 = f1_local7:GetValue( f1_arg1 )
			if f6_local0 ~= nil and f6_local1 ~= nil and f6_local2 ~= nil then
				local f6_local3 = Engine.GetDvarInt( "cg_netStatsTimeReceived" )
				local f6_local4 = Engine.GetDvarInt( "cg_netStatsTimeQueued" )
				local f6_local5 = Engine.GetDvarInt( "cg_netStatsPacketsDropped" )
				if f6_local3 < f6_local0 or f6_local4 < f6_local1 or f6_local5 < f6_local2 then
					f1_arg0.PacketBursting:SetAlpha( 1, 0 )
					if f6_local3 < f6_local0 and f6_local1 <= f6_local4 and f6_local2 <= f6_local5 then
						f1_arg0.PacketBursting:SetRGBFromTable( f1_local1, 0 )
					end
					if f6_local4 < f6_local1 and f6_local2 <= f6_local5 then
						f1_arg0.PacketBursting:SetRGBFromTable( f1_local2, 0 )
					end
					if f6_local5 < f6_local2 then
						f1_arg0.PacketBursting:SetRGBFromTable( f1_local3, 0 )
					end
				else
					f1_arg0.PacketBursting:SetAlpha( 0, 0 )
				end
			else
				f1_arg0.PacketBursting:SetAlpha( 0, 0 )
			end
		end
		
		f1_arg0:SubscribeToModel( f1_local5:GetModel( f1_arg1 ), f1_local8 )
		f1_arg0:SubscribeToModel( f1_local6:GetModel( f1_arg1 ), f1_local8 )
		f1_arg0:SubscribeToModel( f1_local7:GetModel( f1_arg1 ), f1_local8 )
		f1_arg0:registerEventHandler( "empty_menu_stack", function ( element, event )
			f1_arg0.showWidgetTime = Engine.GetMilliseconds() + Engine.GetDvarInt( "cg_netStatsTimerCloseMenus" )
			f1_arg0:SetAlpha( 0, 0 )
		end )
		f1_arg0:SubscribeToModel( DataSources.inGame.player.spawnCount:GetModel( f1_arg1 ), function ()
			f1_arg0.showWidgetTime = Engine.GetMilliseconds() + Engine.GetDvarInt( "cg_netStatsTimerRespawn" )
			f1_arg0:SetAlpha( 0, 0 )
		end )
		local f1_local9 = nil
		local f1_local10 = function ()
			local f9_local0 = f1_arg0:Wait( 100 )
			f9_local0.onComplete = f1_local9
			if f1_arg0.showWidgetTime and f1_local4:GetValue( f1_arg1 ) then
				if f1_arg0.showWidgetTime <= Engine.GetMilliseconds() then
					f1_arg0:SetAlpha( 0.5, 0 )
					f1_arg0.showWidgetTime = nil
				end
			else
				f1_arg0.showWidgetTime = nil
			end
		end
		
		f1_local10()
	else
		f1_arg0:SetAlpha( 0, 0 )
	end
end

function NetStatsIcons( menu, controller )
	local self = LUI.UIVerticalStackedLayout.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 32 * _1080p, 0, 128 * _1080p )
	self.id = "NetStatsIcons"
	local f10_local1 = controller and controller.controllerIndex
	if not f10_local1 and not Engine.InFrontend() then
		f10_local1 = self:getRootController()
	end
	assert( f10_local1 )
	local f10_local2 = self
	local Extrapolation = nil
	
	Extrapolation = LUI.UIImage.new()
	Extrapolation.id = "Extrapolation"
	Extrapolation:SetAlpha( 0, 0 )
	Extrapolation:setImage( RegisterMaterial( "hud_icon_net_extrapolation" ), 0 )
	Extrapolation:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 32, 0, _1080p * 32 )
	self:addElement( Extrapolation )
	self.Extrapolation = Extrapolation
	
	local LatencyVariation = nil
	
	LatencyVariation = LUI.UIImage.new()
	LatencyVariation.id = "LatencyVariation"
	LatencyVariation:SetAlpha( 0, 0 )
	LatencyVariation:setImage( RegisterMaterial( "hud_icon_net_latency_variation" ), 0 )
	LatencyVariation:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 32, _1080p * 32, _1080p * 64 )
	self:addElement( LatencyVariation )
	self.LatencyVariation = LatencyVariation
	
	local HighLatency = nil
	
	HighLatency = LUI.UIImage.new()
	HighLatency.id = "HighLatency"
	HighLatency:SetAlpha( 0, 0 )
	HighLatency:setImage( RegisterMaterial( "hud_icon_net_latency_high" ), 0 )
	HighLatency:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 32, _1080p * 64, _1080p * 96 )
	self:addElement( HighLatency )
	self.HighLatency = HighLatency
	
	local PacketBursting = nil
	
	PacketBursting = LUI.UIImage.new()
	PacketBursting.id = "PacketBursting"
	PacketBursting:SetAlpha( 0, 0 )
	PacketBursting:setImage( RegisterMaterial( "hud_icon_net_packet_burst" ), 0 )
	PacketBursting:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 32, _1080p * 96, _1080p * 128 )
	self:addElement( PacketBursting )
	self.PacketBursting = PacketBursting
	
	f0_local0( self, f10_local1, controller )
	return self
end

MenuBuilder.registerType( "NetStatsIcons", NetStatsIcons )
LockTable( _M )
