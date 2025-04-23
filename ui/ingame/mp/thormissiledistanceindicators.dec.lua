local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function ThorMissileDistanceIndicators()
	local self = LUI.UIElement.new( CoD.CreateState( 0, 0, 0, 0, CoD.AnchorTypes.All ) )
	self.id = "ThorMissileDistanceIndicators"
	self.indicators = {}
	local f1_local1 = 0
	local f1_local2 = DataSources.inGame.MP.scorestreakHuds.thorMissiles:GetCountValue( f1_local1 )
	for f1_local3 = 0, f1_local2 - 1, 1 do
		local f1_local6 = f1_local3
		local f1_local7 = DataSources.inGame.MP.scorestreakHuds.thorMissiles:GetDataSourceAtIndex( f1_local6, f1_local1 )
		self:SubscribeToModel( f1_local7.idValue:GetModel( f1_local1 ), function ( f2_arg0 )
			local f2_local0 = DataModel.GetModelValue( f2_arg0 )
			if f2_local0 == GameScriptConstants.EntityNumNone then
				if self.indicators[f1_local6] then
					self.indicators[f1_local6]:close()
					self.indicators[f1_local6] = nil
				end
			else
				if not self.indicators[f1_local6] then
					local f2_local1 = MenuBuilder.BuildRegisteredType( "ThorMissileDistanceIndicator" )
					f2_local1.id = "indicator_" .. f1_local6
					f2_local1:SetupAnchoredElement( {
						minScale = 0.5,
						maxScale = 1.2,
						naturalDistance = 1000,
						screenOffsetX = 50,
						screenOffsetY = -40,
						snapToScreenEdges = true
					} )
					f2_local1:SetDataSource( f1_local7, f1_local1 )
					self.indicators[f1_local6] = f2_local1
					self:addElement( self.indicators[f1_local6] )
				end
				assert( self.indicators[f1_local6].SetEntityNum )
				self.indicators[f1_local6]:SetEntityNum( f2_local0 )
			end
		end )
	end
	return self
end

MenuBuilder.registerType( "ThorMissileDistanceIndicators", ThorMissileDistanceIndicators )
LockTable( _M )
