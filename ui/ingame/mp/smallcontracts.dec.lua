local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ( f1_arg0, f1_arg1, f1_arg2 )
	assert( f1_arg0.Contracts )
	if Contracts.AreContractsOutOfDate( f1_arg1 ) then
		f1_arg0.Contracts:SetNumColumns( 0 )
		f1_arg0.Contracts:SetNumRows( 0 )
		return 
	end
	local f1_local0 = {}
	for f1_local1 = 0, 1, 1 do
		if not Contracts.CheckCompletion( f1_arg1, f1_local1 ) or not Contracts.HasGivenReward( f1_arg1, f1_local1 ) then
			table.insert( f1_local0, f1_local1 )
		end
	end
	f1_arg0.Contracts:SetRefreshChild( function ( f2_arg0, f2_arg1, f2_arg2 )
		local f2_local0 = CONDITIONS.IsSplitscreen() and f1_local0[f2_arg1 + 1] or f1_local0[f2_arg2 + 1]
		f2_arg0:SetupContract( f1_arg1, Contracts.GetCurrentChallengeID( f1_arg1, f2_local0 ), f2_local0 )
	end )
	if CONDITIONS.IsSplitscreen() then
		f1_arg0.Contracts:SetNumColumns( #f1_local0 )
		f1_arg0.Contracts:SetNumRows( 1 )
	else
		f1_arg0.Contracts:SetNumRows( #f1_local0 )
		f1_arg0.Contracts:SetNumColumns( 1 )
	end
end

function SmallContracts( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 922 * _1080p, 0, 332 * _1080p )
	self.id = "SmallContracts"
	local f3_local1 = controller and controller.controllerIndex
	if not f3_local1 and not Engine.InFrontend() then
		f3_local1 = self:getRootController()
	end
	assert( f3_local1 )
	local f3_local2 = self
	local Contracts = nil
	
	Contracts = LUI.UIGrid.new( nil, {
		maxVisibleColumns = 2,
		maxVisibleRows = 2,
		controllerIndex = f3_local1,
		buildChild = function ()
			return MenuBuilder.BuildRegisteredType( "SmallContract", {
				controllerIndex = f3_local1
			} )
		end,
		refreshChild = function ( f5_arg0, f5_arg1, f5_arg2 )
			
		end,
		numRows = 2,
		numColumns = 2,
		wrapX = true,
		wrapY = true,
		spacingX = _1080p * 12,
		spacingY = _1080p * 12,
		columnWidth = _1080p * 455,
		rowHeight = _1080p * 160,
		scrollingThresholdX = 1,
		scrollingThresholdY = 1,
		adjustSizeToContent = false,
		horizontalAlignment = LUI.Alignment.Left,
		verticalAlignment = LUI.Alignment.Top,
		springCoefficient = 400,
		maxVelocity = 5000
	} )
	Contracts.id = "Contracts"
	Contracts:setUseStencil( false )
	self:addElement( Contracts )
	self.Contracts = Contracts
	
	f0_local0( self, f3_local1, controller )
	return self
end

MenuBuilder.registerType( "SmallContracts", SmallContracts )
LockTable( _M )
