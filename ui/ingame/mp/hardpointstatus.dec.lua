local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function PostLoadFunc( f1_arg0, f1_arg1, f1_arg2 )
	f1_arg0:SetYRotation( 15 )
	f1_arg0.Place:SetShadowUOffset( -0 )
	f1_arg0.Place:SetShadowVOffset( -0 )
	assert( f1_arg0.Place )
	assert( f1_arg0.PlaceBg )
	f1_arg0.Place:SubscribeToModel( DataSources.inGame.MP.hardpointCalloutAreaString:GetModel( f1_arg1 ), function ()
		local f2_local0 = DataSources.inGame.MP.hardpointCalloutAreaString:GetValue( f1_arg1 )
		if f2_local0 ~= nil then
			f2_local0 = ToUpperCase( f2_local0 )
			f1_arg0.Place:setText( f2_local0, 0 )
			local f2_local1 = f1_arg0.Place:GetCurrentFont()
			local f2_local2, f2_local3, f2_local4, f2_local5 = f1_arg0.Place:getLocalRect()
			local f2_local6, f2_local7, f2_local8, f2_local9 = GetTextDimensions( f2_local0, f2_local1, math.abs( f2_local5 - f2_local3 ), math.abs( f2_local4 - f2_local2 ) )
			local f2_local10 = f2_local7 - f2_local9 + _1080p * 51
			f1_arg0.PlaceBg:SetBottom( f2_local10, 100 )
			f1_arg0.CapL:SetBottom( f2_local10, 100 )
			f1_arg0.CapR:SetBottom( f2_local10, 100 )
		end
	end )
	f1_arg0:SubscribeToModel( DataSources.inGame.HUD.uplinkTimerStopped:GetModel( f1_arg1 ), function ()
		if DataSources.inGame.HUD.uplinkTimerStopped:GetValue( f1_arg1 ) then
			f1_arg0.Timer:freeze()
		else
			f1_arg0.Timer:unfreeze()
		end
	end )
end

function HardpointStatus( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 188 * _1080p, 0, 40 * _1080p )
	self.id = "HardpointStatus"
	local f4_local1 = controller and controller.controllerIndex
	if not f4_local1 and not Engine.InFrontend() then
		f4_local1 = self:getRootController()
	end
	assert( f4_local1 )
	local f4_local2 = self
	local PlaceBg = nil
	
	PlaceBg = LUI.UIImage.new()
	PlaceBg.id = "PlaceBg"
	PlaceBg:SetRGBFromInt( 0, 0 )
	PlaceBg:SetAlpha( 0.3, 0 )
	PlaceBg:SetUseAA( true )
	PlaceBg:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 188, 0, _1080p * 73 )
	self:addElement( PlaceBg )
	self.PlaceBg = PlaceBg
	
	local HighlightBAr = nil
	
	HighlightBAr = LUI.UIImage.new()
	HighlightBAr.id = "HighlightBAr"
	HighlightBAr:SetAlpha( 0.3, 0 )
	HighlightBAr:SetUseAA( true )
	HighlightBAr:SetAnchorsAndPosition( 0.5, 0.5, 1, 0, _1080p * -94, _1080p * 94, _1080p * -40, _1080p * 4 )
	HighlightBAr:BindColorToModel( DataSources.inGame.MP.hardpointStatusColor:GetModel( f4_local1 ) )
	self:addElement( HighlightBAr )
	self.HighlightBAr = HighlightBAr
	
	local Place = nil
	
	Place = LUI.UIStyledText.new()
	Place.id = "Place"
	Place:setText( ToUpperCase( "" ), 0 )
	Place:SetFontSize( 22 * _1080p )
	Place:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	Place:SetAlignment( LUI.Alignment.Center )
	Place:SetShadowMinDistance( -0.2, 0 )
	Place:SetShadowMaxDistance( 0.2, 0 )
	Place:SetOutlineRGBFromInt( 0, 0 )
	Place:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 4, _1080p * 184, _1080p * 47, _1080p * 69 )
	self:addElement( Place )
	self.Place = Place
	
	local Icon = nil
	
	Icon = LUI.UIImage.new()
	Icon.id = "Icon"
	Icon:setImage( RegisterMaterial( "hud_icon_hardpoint_diamond" ), 0 )
	Icon:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 15, _1080p * 55, _1080p * 2, _1080p * 42 )
	Icon:BindColorToModel( DataSources.inGame.MP.hardpointStatusColor:GetModel( f4_local1 ) )
	self:addElement( Icon )
	self.Icon = Icon
	
	local Timer = nil
	
	Timer = MenuBuilder.BuildRegisteredType( "UICountdown", {
		controllerIndex = f4_local1
	} )
	Timer.id = "Timer"
	Timer:SetFontSize( 30 * _1080p )
	Timer:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	Timer:SetAlignment( LUI.Alignment.Center )
	Timer:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 55, 0, _1080p * 7, _1080p * 37 )
	Timer:SubscribeToModel( DataSources.inGame.MP.hardpointTimer:GetModel( f4_local1 ), function ()
		local f5_local0 = DataSources.inGame.MP.hardpointTimer:GetValue( f4_local1 )
		if f5_local0 ~= nil then
			Timer:setEndTime( f5_local0 )
		end
	end )
	self:addElement( Timer )
	self.Timer = Timer
	
	local CapR = nil
	
	CapR = LUI.UIImage.new()
	CapR.id = "CapR"
	CapR:SetUseAA( true )
	CapR:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 188, _1080p * 191, 0, _1080p * 73 )
	self:addElement( CapR )
	self.CapR = CapR
	
	local CapL = nil
	
	CapL = LUI.UIImage.new()
	CapL.id = "CapL"
	CapL:SetUseAA( true )
	CapL:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -3, 0, 0, _1080p * 73 )
	self:addElement( CapL )
	self.CapL = CapL
	
	PostLoadFunc( self, f4_local1, controller )
	return self
end

MenuBuilder.registerType( "HardpointStatus", HardpointStatus )
LockTable( _M )
