local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ( f1_arg0, f1_arg1 )
	f1_arg0.MaxCmdProcessedLabel:SetRGBFromTable( f1_arg1, 0 )
	f1_arg0.MaxCmdProcessedValue:SetRGBFromTable( f1_arg1, 0 )
	f1_arg0.MaxCmdQueuedLabel:SetRGBFromTable( f1_arg1, 0 )
	f1_arg0.MaxCmdQueuedValue:SetRGBFromTable( f1_arg1, 0 )
	f1_arg0.MaxCmdDroppedLabel:SetRGBFromTable( f1_arg1, 0 )
	f1_arg0.MaxCmdDroppedValue:SetRGBFromTable( f1_arg1, 0 )
end

f0_local1 = function ( f2_arg0, f2_arg1, f2_arg2 )
	if Engine.GetDvarBool( "killswitch_net_health_dev" ) ~= true then
		local f2_local0 = Engine.IsDedi()
		local f2_local1 = SWATCHES.Reticles.White
		local f2_local2 = SWATCHES.HUD.caution
		local f2_local3 = SWATCHES.HUD.colorblindEnemyTeam
		local f2_local4 = SWATCHES.HUD.enemyTeam
		f2_arg0:SubscribeToModel( DataSources.inGame.HUD.netPerf.isEnabled:GetModel(), function ( f3_arg0 )
			if DataModel.GetModelValue( f3_arg0 ) ~= true then
				f2_arg0:SetAlpha( 0, 0 )
			else
				f2_arg0:SetAlpha( 1, 0 )
			end
		end )
		f2_arg0:SubscribeToModel( DataSources.inGame.HUD.netPerf.maxExtrapolation:GetModel( f2_arg1 ), function ( f4_arg0 )
			local f4_local0 = DataModel.GetModelValue( f4_arg0 )
			if f4_local0 ~= nil then
				local f4_local1, f4_local2 = nil
				if f2_local0 then
					f4_local1 = Engine.GetDvarInt( "cg_netStatsExtrapolationLowDedi" )
					f4_local2 = Engine.GetDvarInt( "cg_netStatsExtrapolationHighDedi" )
				else
					f4_local1 = Engine.GetDvarInt( "cg_netStatsExtrapolationLow" )
					f4_local2 = Engine.GetDvarInt( "cg_netStatsExtrapolationHigh" )
				end
				f2_arg0.MaxExtrapolationValue:setText( f4_local0, 0 )
				if f4_local0 <= f4_local1 then
					f2_arg0.MaxExtrapolationLabel:SetRGBFromTable( f2_local1, 0 )
					f2_arg0.MaxExtrapolationValue:SetRGBFromTable( f2_local1, 0 )
				elseif f4_local0 <= f4_local2 then
					f2_arg0.MaxExtrapolationLabel:SetRGBFromTable( f2_local2, 0 )
					f2_arg0.MaxExtrapolationValue:SetRGBFromTable( f2_local2, 0 )
				else
					f2_arg0.MaxExtrapolationLabel:SetRGBFromTable( f2_local4, 0 )
					f2_arg0.MaxExtrapolationValue:SetRGBFromTable( f2_local4, 0 )
				end
			end
		end )
		f2_arg0:SubscribeToModel( DataSources.inGame.HUD.netPerf.maxInterpolation:GetModel( f2_arg1 ), function ( f5_arg0 )
			local f5_local0 = DataModel.GetModelValue( f5_arg0 )
			if f5_local0 ~= nil then
				local f5_local1, f5_local2 = nil
				if f2_local0 then
					f5_local1 = Engine.GetDvarInt( "cg_netStatsLatencyVariationLowDedi" )
					f5_local2 = Engine.GetDvarInt( "cg_netStatsLatencyVariationHighDedi" )
				else
					f5_local1 = Engine.GetDvarInt( "cg_netStatsLatencyVariationLow" )
					f5_local2 = Engine.GetDvarInt( "cg_netStatsLatencyVariationHigh" )
				end
				f2_arg0.MaxInterpolationValue:setText( f5_local0, 0 )
				if f5_local0 <= f5_local1 then
					f2_arg0.MaxInterpolationLabel:SetRGBFromTable( f2_local1, 0 )
					f2_arg0.MaxInterpolationValue:SetRGBFromTable( f2_local1, 0 )
				elseif f5_local0 <= f5_local2 then
					f2_arg0.MaxInterpolationLabel:SetRGBFromTable( f2_local2, 0 )
					f2_arg0.MaxInterpolationValue:SetRGBFromTable( f2_local2, 0 )
				else
					f2_arg0.MaxInterpolationLabel:SetRGBFromTable( f2_local4, 0 )
					f2_arg0.MaxInterpolationValue:SetRGBFromTable( f2_local4, 0 )
				end
			end
		end )
		f2_arg0:SubscribeToModel( DataSources.inGame.HUD.netPerf.ping:GetModel( f2_arg1 ), function ( f6_arg0 )
			local f6_local0 = DataModel.GetModelValue( f6_arg0 )
			if f6_local0 ~= nil then
				local f6_local1, f6_local2 = nil
				if f2_local0 then
					f6_local1 = Engine.GetDvarInt( "cg_netStatsPingLowDedi" )
					f6_local2 = Engine.GetDvarInt( "cg_netStatsPingHighDedi" )
				else
					f6_local1 = Engine.GetDvarInt( "cg_netStatsPingLow" )
					f6_local2 = Engine.GetDvarInt( "cg_netStatsPingHigh" )
				end
				f2_arg0.LatencyValue:setText( f6_local0, 0 )
				if f6_local0 <= f6_local1 then
					f2_arg0.LatencyLabel:SetRGBFromTable( f2_local1, 0 )
					f2_arg0.LatencyValue:SetRGBFromTable( f2_local1, 0 )
				elseif f6_local0 <= f6_local2 then
					f2_arg0.LatencyLabel:SetRGBFromTable( f2_local2, 0 )
					f2_arg0.LatencyValue:SetRGBFromTable( f2_local2, 0 )
				else
					f2_arg0.LatencyLabel:SetRGBFromTable( f2_local4, 0 )
					f2_arg0.LatencyValue:SetRGBFromTable( f2_local4, 0 )
				end
			end
		end )
		local f2_local5 = DataSources.inGame.HUD.netPerf.maxCmdProcessed
		local f2_local6 = DataSources.inGame.HUD.netPerf.maxCmdQueued
		local f2_local7 = DataSources.inGame.HUD.netPerf.maxCmdDropped
		local f2_local8 = function ()
			local f7_local0 = f2_local5:GetValue( f2_arg1 )
			local f7_local1 = f2_local6:GetValue( f2_arg1 )
			local f7_local2 = f2_local7:GetValue( f2_arg1 )
			if f7_local0 ~= nil and f7_local1 ~= nil and f7_local2 ~= nil then
				local f7_local3 = Engine.GetDvarInt( "cg_netStatsPacketsProcessed" )
				local f7_local4 = Engine.GetDvarInt( "cg_netStatsPacketsQueued" )
				local f7_local5 = Engine.GetDvarInt( "cg_netStatsPacketsDropped" )
				f2_arg0.MaxCmdProcessedValue:setText( f7_local0, 0 )
				f2_arg0.MaxCmdQueuedValue:setText( f7_local1, 0 )
				f2_arg0.MaxCmdDroppedValue:setText( f7_local2, 0 )
				if f7_local0 <= f7_local3 and f7_local1 <= f7_local4 and f7_local2 <= f7_local5 then
					f0_local0( f2_arg0, f2_local1 )
				end
				if f7_local3 < f7_local0 and f7_local1 <= f7_local4 and f7_local2 <= f7_local5 then
					f0_local0( f2_arg0, f2_local2 )
				end
				if f7_local4 < f7_local1 and f7_local2 <= f7_local5 then
					f0_local0( f2_arg0, f2_local3 )
				end
				if f7_local5 < f7_local2 then
					f0_local0( f2_arg0, f2_local4 )
				end
			end
		end
		
		f2_arg0:SubscribeToModel( f2_local5:GetModel( f2_arg1 ), f2_local8 )
		f2_arg0:SubscribeToModel( f2_local6:GetModel( f2_arg1 ), f2_local8 )
		f2_arg0:SubscribeToModel( f2_local7:GetModel( f2_arg1 ), f2_local8 )
	else
		f2_arg0:SetAlpha( 0, 0 )
	end
end

function NetStatsDev( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 175 * _1080p, 0, 96 * _1080p )
	self.id = "NetStatsDev"
	local f8_local1 = controller and controller.controllerIndex
	if not f8_local1 and not Engine.InFrontend() then
		f8_local1 = self:getRootController()
	end
	assert( f8_local1 )
	local f8_local2 = self
	local BG = nil
	
	BG = LUI.UIImage.new()
	BG.id = "BG"
	BG:SetRGBFromInt( 0, 0 )
	BG:SetAlpha( 0.5, 0 )
	BG:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * -5, _1080p * 5, _1080p * -5, _1080p * 5 )
	self:addElement( BG )
	self.BG = BG
	
	local MaxExtrapolationLabel = nil
	
	MaxExtrapolationLabel = LUI.UIText.new()
	MaxExtrapolationLabel.id = "MaxExtrapolationLabel"
	MaxExtrapolationLabel:setText( "Max Extrapolation:", 0 )
	MaxExtrapolationLabel:SetFontSize( 16 * _1080p )
	MaxExtrapolationLabel:SetFont( FONTS.GetFont( FONTS.Dev.File ) )
	MaxExtrapolationLabel:SetAlignment( LUI.Alignment.Left )
	MaxExtrapolationLabel:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 150, 0, _1080p * 16 )
	self:addElement( MaxExtrapolationLabel )
	self.MaxExtrapolationLabel = MaxExtrapolationLabel
	
	local MaxExtrapolationValue = nil
	
	MaxExtrapolationValue = LUI.UIText.new()
	MaxExtrapolationValue.id = "MaxExtrapolationValue"
	MaxExtrapolationValue:setText( "", 0 )
	MaxExtrapolationValue:SetFontSize( 16 * _1080p )
	MaxExtrapolationValue:SetFont( FONTS.GetFont( FONTS.Dev.File ) )
	MaxExtrapolationValue:SetAlignment( LUI.Alignment.Left )
	MaxExtrapolationValue:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 150, _1080p * 175, 0, _1080p * 16 )
	self:addElement( MaxExtrapolationValue )
	self.MaxExtrapolationValue = MaxExtrapolationValue
	
	local MaxInterpolationLabel = nil
	
	MaxInterpolationLabel = LUI.UIText.new()
	MaxInterpolationLabel.id = "MaxInterpolationLabel"
	MaxInterpolationLabel:setText( "Max Interpolation:", 0 )
	MaxInterpolationLabel:SetFontSize( 16 * _1080p )
	MaxInterpolationLabel:SetFont( FONTS.GetFont( FONTS.Dev.File ) )
	MaxInterpolationLabel:SetAlignment( LUI.Alignment.Left )
	MaxInterpolationLabel:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 150, _1080p * 16, _1080p * 32 )
	self:addElement( MaxInterpolationLabel )
	self.MaxInterpolationLabel = MaxInterpolationLabel
	
	local MaxInterpolationValue = nil
	
	MaxInterpolationValue = LUI.UIText.new()
	MaxInterpolationValue.id = "MaxInterpolationValue"
	MaxInterpolationValue:setText( "", 0 )
	MaxInterpolationValue:SetFontSize( 16 * _1080p )
	MaxInterpolationValue:SetFont( FONTS.GetFont( FONTS.Dev.File ) )
	MaxInterpolationValue:SetAlignment( LUI.Alignment.Left )
	MaxInterpolationValue:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 150, _1080p * 175, _1080p * 16, _1080p * 32 )
	self:addElement( MaxInterpolationValue )
	self.MaxInterpolationValue = MaxInterpolationValue
	
	local LatencyLabel = nil
	
	LatencyLabel = LUI.UIText.new()
	LatencyLabel.id = "LatencyLabel"
	LatencyLabel:setText( "Latency:", 0 )
	LatencyLabel:SetFontSize( 16 * _1080p )
	LatencyLabel:SetFont( FONTS.GetFont( FONTS.Dev.File ) )
	LatencyLabel:SetAlignment( LUI.Alignment.Left )
	LatencyLabel:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 150, _1080p * 32, _1080p * 48 )
	self:addElement( LatencyLabel )
	self.LatencyLabel = LatencyLabel
	
	local LatencyValue = nil
	
	LatencyValue = LUI.UIText.new()
	LatencyValue.id = "LatencyValue"
	LatencyValue:setText( "", 0 )
	LatencyValue:SetFontSize( 16 * _1080p )
	LatencyValue:SetFont( FONTS.GetFont( FONTS.Dev.File ) )
	LatencyValue:SetAlignment( LUI.Alignment.Left )
	LatencyValue:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 150, _1080p * 175, _1080p * 32, _1080p * 48 )
	self:addElement( LatencyValue )
	self.LatencyValue = LatencyValue
	
	local MaxCmdProcessedLabel = nil
	
	MaxCmdProcessedLabel = LUI.UIText.new()
	MaxCmdProcessedLabel.id = "MaxCmdProcessedLabel"
	MaxCmdProcessedLabel:setText( "Max Cmd Processed:", 0 )
	MaxCmdProcessedLabel:SetFontSize( 16 * _1080p )
	MaxCmdProcessedLabel:SetFont( FONTS.GetFont( FONTS.Dev.File ) )
	MaxCmdProcessedLabel:SetAlignment( LUI.Alignment.Left )
	MaxCmdProcessedLabel:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 150, _1080p * 48, _1080p * 64 )
	self:addElement( MaxCmdProcessedLabel )
	self.MaxCmdProcessedLabel = MaxCmdProcessedLabel
	
	local MaxCmdProcessedValue = nil
	
	MaxCmdProcessedValue = LUI.UIText.new()
	MaxCmdProcessedValue.id = "MaxCmdProcessedValue"
	MaxCmdProcessedValue:setText( "", 0 )
	MaxCmdProcessedValue:SetFontSize( 16 * _1080p )
	MaxCmdProcessedValue:SetFont( FONTS.GetFont( FONTS.Dev.File ) )
	MaxCmdProcessedValue:SetAlignment( LUI.Alignment.Left )
	MaxCmdProcessedValue:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 150, _1080p * 175, _1080p * 48, _1080p * 64 )
	self:addElement( MaxCmdProcessedValue )
	self.MaxCmdProcessedValue = MaxCmdProcessedValue
	
	local MaxCmdQueuedLabel = nil
	
	MaxCmdQueuedLabel = LUI.UIText.new()
	MaxCmdQueuedLabel.id = "MaxCmdQueuedLabel"
	MaxCmdQueuedLabel:setText( "Max Cmd Queued:", 0 )
	MaxCmdQueuedLabel:SetFontSize( 16 * _1080p )
	MaxCmdQueuedLabel:SetFont( FONTS.GetFont( FONTS.Dev.File ) )
	MaxCmdQueuedLabel:SetAlignment( LUI.Alignment.Left )
	MaxCmdQueuedLabel:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 150, _1080p * 64, _1080p * 80 )
	self:addElement( MaxCmdQueuedLabel )
	self.MaxCmdQueuedLabel = MaxCmdQueuedLabel
	
	local MaxCmdQueuedValue = nil
	
	MaxCmdQueuedValue = LUI.UIText.new()
	MaxCmdQueuedValue.id = "MaxCmdQueuedValue"
	MaxCmdQueuedValue:setText( "", 0 )
	MaxCmdQueuedValue:SetFontSize( 16 * _1080p )
	MaxCmdQueuedValue:SetFont( FONTS.GetFont( FONTS.Dev.File ) )
	MaxCmdQueuedValue:SetAlignment( LUI.Alignment.Left )
	MaxCmdQueuedValue:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 150, _1080p * 175, _1080p * 64, _1080p * 80 )
	self:addElement( MaxCmdQueuedValue )
	self.MaxCmdQueuedValue = MaxCmdQueuedValue
	
	local MaxCmdDroppedLabel = nil
	
	MaxCmdDroppedLabel = LUI.UIText.new()
	MaxCmdDroppedLabel.id = "MaxCmdDroppedLabel"
	MaxCmdDroppedLabel:setText( "Max Cmd Dropped:", 0 )
	MaxCmdDroppedLabel:SetFontSize( 16 * _1080p )
	MaxCmdDroppedLabel:SetFont( FONTS.GetFont( FONTS.Dev.File ) )
	MaxCmdDroppedLabel:SetAlignment( LUI.Alignment.Left )
	MaxCmdDroppedLabel:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 150, _1080p * 80, _1080p * 96 )
	self:addElement( MaxCmdDroppedLabel )
	self.MaxCmdDroppedLabel = MaxCmdDroppedLabel
	
	local MaxCmdDroppedValue = nil
	
	MaxCmdDroppedValue = LUI.UIText.new()
	MaxCmdDroppedValue.id = "MaxCmdDroppedValue"
	MaxCmdDroppedValue:setText( "", 0 )
	MaxCmdDroppedValue:SetFontSize( 16 * _1080p )
	MaxCmdDroppedValue:SetFont( FONTS.GetFont( FONTS.Dev.File ) )
	MaxCmdDroppedValue:SetAlignment( LUI.Alignment.Left )
	MaxCmdDroppedValue:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 150, _1080p * 175, _1080p * 80, _1080p * 96 )
	self:addElement( MaxCmdDroppedValue )
	self.MaxCmdDroppedValue = MaxCmdDroppedValue
	
	f0_local1( self, f8_local1, controller )
	return self
end

MenuBuilder.registerType( "NetStatsDev", NetStatsDev )
LockTable( _M )
