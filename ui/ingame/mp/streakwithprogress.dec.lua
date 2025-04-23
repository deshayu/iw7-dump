local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ( f1_arg0, f1_arg1 )
	local f1_local0 = function ()
		assert( f1_arg0.Streak )
		assert( f1_arg0.StreakPoints )
		local f2_local0 = f1_arg0:GetDataSource()
		local f2_local1 = f2_local0.percent:GetValue( f1_arg1 )
		local f2_local2 = f2_local0.isSlotSelected:GetValue( f1_arg1 )
		local f2_local3 = GameX.IsHardcoreMode()
		if f2_local3 then
			f1_arg0.Streak.ProgressBar:SetAlpha( 0 )
		else
			f1_arg0.Streak.ProgressBar:SetTopAnchor( 1 - f2_local1, 100 )
			if f2_local1 == 1 then
				f1_arg0.Streak.ProgressBar:SetAlpha( 0 )
			else
				f1_arg0.Streak.ProgressBar:SetAlpha( 1 )
			end
		end
		if f2_local3 then
			f1_arg0.StreakPoints:SetAlpha( 0 )
		else
			f1_arg0.StreakPoints:SetTopAnchor( 1 - f2_local1, 100 )
			f1_arg0.StreakPoints:SetTop( _1080p * -16, 100 )
			f1_arg0.StreakPoints:SetBottom( _1080p * 16, 100 )
			if f2_local2 then
				f1_arg0.StreakPoints:SetLeft( _1080p * -74, 100 )
				f1_arg0.StreakPoints:SetRight( _1080p * -10, 100 )
			else
				f1_arg0.StreakPoints:SetLeft( _1080p * -64, 100 )
				f1_arg0.StreakPoints:SetRight( _1080p * 0, 100 )
			end
		end
	end
	
	f1_arg0:SubscribeToModelThroughElement( f1_arg0, "percent", f1_local0, true )
	f1_arg0:SubscribeToModelThroughElement( f1_arg0, "isSlotSelected", f1_local0, true )
end

function StreakWithProgress( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 60 * _1080p, 0, 60 * _1080p )
	self.id = "StreakWithProgress"
	local f3_local1 = controller and controller.controllerIndex
	if not f3_local1 and not Engine.InFrontend() then
		f3_local1 = self:getRootController()
	end
	assert( f3_local1 )
	local f3_local2 = self
	local Streak = nil
	
	Streak = MenuBuilder.BuildRegisteredType( "Streak", {
		controllerIndex = f3_local1
	} )
	Streak.id = "Streak"
	Streak:SetDataSourceThroughElement( self, nil )
	Streak:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, 0, 0 )
	self:addElement( Streak )
	self.Streak = Streak
	
	local StreakPoints = nil
	
	StreakPoints = MenuBuilder.BuildRegisteredType( "StreakPoints", {
		controllerIndex = f3_local1
	} )
	StreakPoints.id = "StreakPoints"
	StreakPoints:SetDepth( -2, 0 )
	StreakPoints:SetDataSourceThroughElement( self, nil )
	StreakPoints:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -64, 0, 0, _1080p * 32 )
	self:addElement( StreakPoints )
	self.StreakPoints = StreakPoints
	
	Streak:SetDataSourceThroughElement( self, nil )
	StreakPoints:SetDataSourceThroughElement( self, nil )
	f0_local0( self, f3_local1, controller )
	return self
end

MenuBuilder.registerType( "StreakWithProgress", StreakWithProgress )
LockTable( _M )
