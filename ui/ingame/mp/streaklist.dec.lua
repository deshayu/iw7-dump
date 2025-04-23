local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ( f1_arg0, f1_arg1, f1_arg2 )
	local f1_local0 = assert
	local f1_local1 = f1_arg0.NormalStreaks
	if f1_local1 then
		f1_local1 = f1_arg0.GimmeStreak and f1_arg0.Blur
	end
	f1_local0( f1_local1, "Warning: Streak List Items Are Missing..." )
	f1_local0 = DataSources.inGame.player.gimmeStreak.isActive
	f1_local1 = 60
	local f1_local2 = 3
	if CONDITIONS.IsSplitscreen() then
		f1_arg0.Blur:SetDepth( 0, 0 )
	end
	local f1_local3 = function ()
		local f2_local0 = DataSources.inGame.player.streakCount:GetValue( f1_arg1 )
		local f2_local1 = f1_local0:GetValue( f1_arg1 )
		local f2_local2 = f1_local1 * f2_local0 + f1_local2 * f2_local0
		if f2_local1 then
			f2_local2 = f2_local2 + f1_local1
			f1_arg0.GimmeStreak:SetTop( _1080p * -f2_local2 )
			f1_arg0.GimmeStreak:SetBottom( _1080p * -1 * (f2_local2 - f1_local1) )
		end
		f1_arg0.Blur:SetTop( _1080p * -f2_local2 )
	end
	
	f1_local3()
	f1_arg0:SubscribeToModel( f1_local0:GetModel( f1_arg1 ), f1_local3, false )
	f1_arg0:SubscribeToModel( DataSources.inGame.player.streakCount:GetModel( f1_arg1 ), f1_local3, false )
	f1_arg0:SubscribeToModel( DataSources.inGame.player.affectedByEMP:GetModel( f1_arg1 ), function ( f3_arg0 )
		if DataModel.GetModelValue( f3_arg0 ) then
			MP.StartEMPGlitch( f1_arg0 )
		else
			MP.StopEMPGlitch( f1_arg0 )
		end
	end )
	f1_arg0:SubscribeToModel( DataSources.inGame.player.streakCount:GetModel( f1_arg1 ), function ()
		f1_arg0.NormalStreaks:SetNumRows( DataSources.inGame.player.streakCount:GetValue( f1_arg1 ) )
		f1_arg0.NormalStreaks:RefreshContent()
	end )
end

function StreakList( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 60 * _1080p, 0, 249 * _1080p )
	self.id = "StreakList"
	local f5_local1 = controller and controller.controllerIndex
	if not f5_local1 and not Engine.InFrontend() then
		f5_local1 = self:getRootController()
	end
	assert( f5_local1 )
	local f5_local2 = self
	local Blur = nil
	
	Blur = LUI.UIBlur.new()
	Blur.id = "Blur"
	Blur:SetRGBFromInt( 11776947, 0 )
	Blur:SetDepth( 4, 0 )
	Blur:SetUseAA( true )
	Blur:SetBlurStrength( 1, 0 )
	Blur:SetAnchorsAndPosition( 0, 0, 1, 0, _1080p * -2, _1080p * 1, _1080p * -249, 0 )
	self:addElement( Blur )
	self.Blur = Blur
	
	local NormalStreaks = nil
	
	NormalStreaks = LUI.UIDataSourceGrid.new( nil, {
		maxVisibleColumns = 1,
		maxVisibleRows = 3,
		controllerIndex = f5_local1,
		buildChild = function ()
			return MenuBuilder.BuildRegisteredType( "StreakWithProgress", {
				controllerIndex = f5_local1
			} )
		end,
		wrapX = true,
		wrapY = true,
		spacingX = _1080p * 3,
		spacingY = _1080p * 3,
		columnWidth = _1080p * 60,
		rowHeight = _1080p * 60,
		scrollingThresholdX = 1,
		scrollingThresholdY = 1,
		adjustSizeToContent = false,
		horizontalAlignment = LUI.Alignment.Left,
		verticalAlignment = LUI.Alignment.Bottom,
		springCoefficient = 400,
		maxVelocity = 5000
	} )
	NormalStreaks.id = "NormalStreaks"
	NormalStreaks:setUseStencil( false )
	NormalStreaks:SetGridDataSource( DataSources.inGame.player.streaks, f5_local1 )
	NormalStreaks:SetAnchorsAndPosition( 0, 1, 1, 0, 0, _1080p * 60, _1080p * -186, 0 )
	self:addElement( NormalStreaks )
	self.NormalStreaks = NormalStreaks
	
	local GimmeStreak = nil
	
	GimmeStreak = MenuBuilder.BuildRegisteredType( "GimmeStreak", {
		controllerIndex = f5_local1
	} )
	GimmeStreak.id = "GimmeStreak"
	GimmeStreak:SetDataSource( DataSources.inGame.player.gimmeStreak, f5_local1 )
	GimmeStreak:SetAnchorsAndPosition( 0, 1, 1, 0, 0, _1080p * 60, _1080p * -248, _1080p * -188 )
	self:addElement( GimmeStreak )
	self.GimmeStreak = GimmeStreak
	
	GimmeStreak:SetDataSource( DataSources.inGame.player.gimmeStreak, f5_local1 )
	f0_local0( self, f5_local1, controller )
	return self
end

MenuBuilder.registerType( "StreakList", StreakList )
LockTable( _M )
