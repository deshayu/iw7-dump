local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function LockonTargets()
	local f1_local0 = {
		entityTag = "j_spine4",
		minScale = 0.75,
		maxScale = 1.25,
		naturalDistance = 400,
		onScope = LUI.UIAnchoredElement.ON_SCOPE.hide
	}
	local f1_local1 = {}
	local f1_local2 = {}
	local f1_local3 = 4
	for f1_local4 = 0, f1_local3 - 1, 1 do
		table.insert( f1_local1, LUI.DataSourceFromOmnvar.new( "ui_lockon_target_ent_" .. f1_local4 ) )
		table.insert( f1_local2, {
			state = LUI.DataSourceFromOmnvar.new( "ui_lockon_target_state_" .. f1_local4 ),
			name = LUI.DataSourceFromOmnvar.new( "ui_lockon_target_name_" .. f1_local4 ),
			health = LUI.DataSourceFromOmnvar.new( "ui_lockon_target_health_" .. f1_local4 )
		} )
	end
	return LUI.TargetingReticles.new( {
		widgetType = "LockonTarget",
		anchoringOptions = f1_local0,
		entityDataSources = f1_local1,
		stateDataSources = f1_local2
	} )
end

MenuBuilder.registerType( "LockonTargets", LockonTargets )
LockTable( _M )
