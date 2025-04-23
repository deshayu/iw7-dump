local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function JackalCallDownReticles()
	local f1_local0 = {
		minScale = 1,
		entityTag = "j_spine4"
	}
	local f1_local1 = {}
	local f1_local2 = 12
	for f1_local3 = 0, f1_local2 - 1, 1 do
		table.insert( f1_local1, LUI.DataSourceFromOmnvar.new( "ui_reticles_" .. f1_local3 .. "_target_ent" ) )
	end
	return LUI.TargetingReticles.new( {
		widgetType = "C12Reticle",
		anchoringOptions = f1_local0,
		entityDataSources = f1_local1
	} )
end

MenuBuilder.registerType( "JackalCallDownReticles", JackalCallDownReticles )
LockTable( _M )
