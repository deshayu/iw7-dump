local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function FragReticles()
	local f1_local0 = {
		entityTag = "j_spine4",
		minScale = 0.8,
		maxScale = 2,
		naturalDistance = 450
	}
	local f1_local1 = {}
	local f1_local2 = {}
	local f1_local3 = 8
	for f1_local4 = 0, f1_local3 - 1, 1 do
		table.insert( f1_local1, LUI.DataSourceFromOmnvar.new( "ui_fragreticles_" .. f1_local4 .. "_target_ent" ) )
		table.insert( f1_local2, LUI.DataSourceFromOmnvar.new( "ui_fragreticles_" .. f1_local4 .. "_lock_state" ) )
	end
	return LUI.TargetingReticles.new( {
		widgetType = "FragReticle",
		anchoringOptions = f1_local0,
		entityDataSources = f1_local1,
		stateDataSources = f1_local2
	} )
end

MenuBuilder.registerType( "FragReticles", FragReticles )
LockTable( _M )
