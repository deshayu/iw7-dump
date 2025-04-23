local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function OnWorldCallouts()
	local self = LUI.UIElement.new( CoD.CreateState( 0, 0, 0, 0, CoD.AnchorTypes.None ) )
	self.id = "OnWorldCallouts"
	self.callouts = {}
	local f1_local1 = 0
	local f1_local2 = DataSources.inGame.MP.callouts:GetCountValue( f1_local1 )
	for f1_local3 = 0, f1_local2 - 1, 1 do
		local f1_local6 = f1_local3
		local f1_local7 = DataSources.inGame.MP.callouts:GetDataSourceAtIndex( f1_local6, f1_local1 )
		self:SubscribeToModel( f1_local7.entity:GetModel( f1_local1 ), function ( f2_arg0 )
			local f2_local0 = DataModel.GetModelValue( f2_arg0 )
			if f2_local0 == GameScriptConstants.EntityNumNone then
				if self.callouts[f1_local6] then
					self.callouts[f1_local6]:close()
					self.callouts[f1_local6] = nil
				end
			else
				if not self.callouts[f1_local6] then
					local f2_local1 = MenuBuilder.BuildRegisteredType( "OnWorldCallout" )
					f2_local1.id = "callout_" .. f1_local6
					f2_local1:SetupAnchoredElement( {
						minScale = 0.5,
						maxScale = 1.2,
						naturalDistance = 1000,
						screenOffsetX = 0,
						screenOffsetY = 0
					} )
					f2_local1:SetDataSource( f1_local7, f1_local1 )
					self.callouts[f1_local6] = f2_local1
					self:addElement( self.callouts[f1_local6] )
				end
				assert( self.callouts[f1_local6].SetEntityNum )
				self.callouts[f1_local6]:SetEntityNum( f2_local0 )
			end
		end )
	end
	return self
end

MenuBuilder.registerType( "OnWorldCallouts", OnWorldCallouts )
LockTable( _M )
