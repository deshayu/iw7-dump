local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function RobotHackReticles()
	local f1_local0 = {
		entityTag = "j_spine4",
		minScale = 1
	}
	local f1_local1 = {}
	local f1_local2 = {}
	local f1_local3 = 10
	for f1_local4 = 0, f1_local3 - 1, 1 do
		table.insert( f1_local1, LUI.DataSourceFromOmnvar.new( "ui_reticles_" .. f1_local4 .. "_target_ent" ) )
		table.insert( f1_local2, LUI.DataSourceFromOmnvar.new( "ui_reticles_" .. f1_local4 .. "_lock_state" ) )
	end
	return LUI.TargetingReticles.new( {
		widgetType = "HackControlTargetMarker",
		anchoringOptions = f1_local0,
		entityDataSources = f1_local1,
		stateDataSources = f1_local2
	} )
end

MenuBuilder.registerType( "RobotHackReticles", RobotHackReticles )
LockTable( _M )
