local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function Populate( f1_arg0, f1_arg1 )
	assert( f1_arg1.map )
	local f1_local0 = string.match( f1_arg1.map, "^sa_" )
	local f1_local1 = string.match( f1_arg1.map, "^ja_" )
	if not f1_local0 then
		local f1_local2 = not f1_local1
	else
		local f1_local2 = false
	end
	local f1_local3 = f1_arg1.missionState == "complete"
	assert( f1_arg0.Type )
	assert( f1_arg0.Type.Text )
	assert( f1_arg0.Type.Background )
	if f1_local0 then
		f1_arg0.Type.Text:setText( Engine.Localize( "MENU_SP_ASSAULT_KEY" ) )
		f1_arg0.Type.Background:SetRGBFromTable( SWATCHES.OpsMap.SideMission )
		f1_arg0.Description:SetRGBFromTable( SWATCHES.OpsMap.SideMission )
	elseif f1_local1 then
		f1_arg0.Type.Text:setText( Engine.Localize( "OPS_MAP_JACKAL_STRIKE_NAME" ) )
		f1_arg0.Type.Background:SetRGBFromTable( SWATCHES.OpsMap.SideMission )
		f1_arg0.Description:SetRGBFromTable( SWATCHES.OpsMap.SideMission )
	else
		f1_arg0.Type.Text:setText( Engine.Localize( "OPS_MAP_PRIMARY_MISSION" ) )
		f1_arg0.Type.Background:SetRGBFromTable( SWATCHES.OpsMap.Mainline )
		f1_arg0.Description:SetRGBFromTable( SWATCHES.OpsMap.Mainline )
	end
	if f1_arg0.MissionIcon then
		f1_arg0.MissionIcon:closeTree()
		f1_arg0.MissionIcon = nil
	end
	if f1_local0 then
		f1_arg0.MissionIcon = MenuBuilder.BuildRegisteredType( "OpsMapIconSA" )
		f1_arg0.MissionIcon:SetScale( -0.7 )
	elseif f1_local1 then
		f1_arg0.MissionIcon = MenuBuilder.BuildRegisteredType( "OpsMapIconJA" )
		f1_arg0.MissionIcon:SetScale( -0.7 )
	else
		f1_arg0.MissionIcon = MenuBuilder.BuildRegisteredType( "OpsMapIconML" )
		f1_arg0.MissionIcon:SetScale( -0.55 )
	end
	f1_arg0.MissionIcon:SetRGBFromInt( 0 )
	f1_arg0.MissionIcon:SetAnchorsAndPosition( 0, 1, 0.5, 0.5, 20, 20, 0, 0 )
	f1_arg0.Type:addElement( f1_arg0.MissionIcon )
	assert( f1_arg0.Banner )
	assert( f1_arg1.fluffImage )
	f1_arg0.Banner:setImage( RegisterMaterial( f1_arg1.fluffImage ) )
	assert( f1_arg0.Success )
	assert( f1_arg0.Success.Value )
	if f1_arg1.missionProbability and not f1_local3 then
		f1_arg0.Success.Value:setText( Engine.Localize( "MENU_SP_STAT_NUM_PERCENT", f1_arg1.missionProbability ) )
		f1_arg0.Success:SetAlpha( 1 )
		local f1_local4 = tonumber( f1_arg1.missionProbability ) or 100
		if f1_local4 >= 75 then
			f1_arg0.Success.Value:SetRGBFromTable( SWATCHES.OpsMap.probabilityGood )
		elseif f1_local4 >= 40 then
			f1_arg0.Success.Value:SetRGBFromTable( SWATCHES.OpsMap.probabilityMedium )
		else
			f1_arg0.Success.Value:SetRGBFromTable( SWATCHES.OpsMap.probabilityBad )
		end
	else
		f1_arg0.Success:SetAlpha( 0 )
	end
	assert( f1_arg1.displayName )
	f1_arg0.Type.MissionName:setText( ToUpperCase( Engine.Localize( f1_arg1.missionName ) ) )
	if IsLanguageOversizedFont() then
		f1_arg0.Type.MissionName:SetTop( -22 * _1080p, 0 )
	end
	assert( f1_arg0.Description )
	local f1_local4 = Engine.Localize( f1_arg1.description )
	if f1_local3 and #f1_arg1.descriptionCompleted > 0 then
		f1_local4 = Engine.Localize( f1_arg1.descriptionCompleted )
	end
	f1_arg0.Description:setText( f1_local4 )
	assert( f1_arg0.Target )
	assert( f1_arg0.Target.Value )
	assert( f1_arg1.missionTarget )
	f1_arg0.Target.Value:setText( Engine.Localize( f1_arg1.missionTarget ) )
	assert( f1_arg0.RewardsWrapper )
	local f1_local5 = SPSharedUtils.GetLevelRewards( f1_arg1.map )
	for f1_local6 = 1, 4, 1 do
		local f1_local9 = f1_local5[f1_local6]
		local f1_local10 = f1_arg0.RewardsWrapper.Rewards["Reward" .. f1_local6]
		assert( f1_local10 )
		if f1_local9 then
			assert( f1_local9.icon )
			assert( f1_local9.type )
			assert( f1_local9.value )
			assert( f1_local10.Icon )
			assert( f1_local10.Type )
			assert( f1_local10.Value )
			f1_local10.Icon:setImage( RegisterMaterial( f1_local9.icon ) )
			f1_local10.Type:setText( f1_local9.type )
			f1_local10.Value:setText( f1_local9.value )
			f1_local10:SetAlpha( 1 )
			f1_local10:SetTop( 0 )
			f1_local10:SetBottom( 24 * _1080p )
		else
			f1_local10:SetAlpha( 0 )
			f1_local10:SetTop( 0 )
			f1_local10:SetBottom( 0 )
		end
	end
	assert( f1_arg0.Authorize )
	assert( f1_arg0.Authorize.Text )
	if f1_local3 then
		f1_arg0.Authorize.Text:setText( Engine.Localize( "LUA_MENU_COMPLETED_CAPS" ) )
		f1_arg0.Authorize.Text:SetRGBFromTable( SWATCHES.OpsMap.probabilityGood )
		f1_arg0.Success:SetAlpha( 0 )
		f1_arg0.Success:SetTop( 0 )
		f1_arg0.Success:SetBottom( 0 )
	else
		f1_arg0.Authorize.Text:setText( Engine.Localize( "OPS_MAP_PRESS_TO_DEPLOY" ) )
		f1_arg0.Authorize.Text:SetRGBFromTable( SWATCHES.OpsMap.deploy )
		f1_arg0.Success:SetAlpha( 1 )
		f1_arg0.Success:SetTop( 0 )
		f1_arg0.Success:SetBottom( 36 * _1080p )
	end
end

function MissionPopup()
	local f2_local0 = MenuBuilder.BuildRegisteredType( "MissionPopupContent" )
	f2_local0:SetAnchorsAndPosition( 0, 1, 0, 0, 60, 60 + 450 * _1080p, 0, 0 )
	f2_local0:SetAlpha( 0 )
	local f2_local1 = MenuBuilder.BuildRegisteredType( "MissionPopupFrame" )
	f2_local1:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, 0, 0 )
	f2_local1:setPriority( -1 )
	f2_local0:addElement( f2_local1 )
	f2_local0.Populate = Populate
	f2_local0:registerEventHandler( "populate", function ( element, event )
		assert( event.poi )
		return element:Populate( event.poi )
	end )
	f2_local0:registerEventHandler( "slide_in", function ( element, event )
		element:SetAlpha( 1, 50 )
		element:SetGlitchEnabled( true )
		element:SetGlitchAmount( 0.8 )
		element:SetGlitchBlockWidth( 50 )
		element:SetGlitchBlockHeight( 50 )
		element:SetGlitchDistortionRange( 16 )
		element:SetGlitchScanlinePitch( 10 )
		element:SetGlitchMaskPitch( 10 )
		element:SetGlitchAmount( 0.2, 150 )
		element:SetGlitchBlockWidth( 20, 150 )
		element:SetGlitchBlockHeight( 80, 150 )
		local f4_local0 = element:SetGlitchDistortionRange( 80, 150 )
		f4_local0.onComplete = function ()
			element:SetGlitchEnabled( false )
		end
		
	end )
	f2_local0:registerEventHandler( "slide_out", function ( element, event )
		element:SetAlpha( 0, 150 )
		element:SetGlitchEnabled( true )
		element:SetGlitchAmount( 0.8 )
		element:SetGlitchBlockWidth( 50 )
		element:SetGlitchBlockHeight( 50 )
		element:SetGlitchDistortionRange( 16 )
		element:SetGlitchScanlinePitch( 10 )
		element:SetGlitchMaskPitch( 10 )
	end )
	return f2_local0
end

MenuBuilder.registerType( "MissionPopup", MissionPopup )
LockTable( _M )
