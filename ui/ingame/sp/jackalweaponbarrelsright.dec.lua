local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function PostLoadFunc( f1_arg0, f1_arg1 )
	f1_arg0:SubscribeToModel( DataSources.inGame.jackal.weaponSecondary:GetModel( f1_arg1 ), function ()
		local f2_local0 = function ( f3_arg0, f3_arg1 )
			local f3_local0 = f3_arg1.controller or controller
			if DataSources.inGame.jackal.weaponSecondary:GetValue( f1_arg1 ) ~= nil and DataSources.inGame.jackal.weaponSecondary:GetValue( f1_arg1 ) == true then
				ACTIONS.AnimateSequence( f1_arg0, "primaryToSecondary" )
			end
			if DataSources.inGame.jackal.weaponSecondary:GetValue( f1_arg1 ) ~= nil and DataSources.inGame.jackal.weaponSecondary:GetValue( f1_arg1 ) == false then
				ACTIONS.AnimateSequence( f1_arg0, "secondaryToPrimary" )
			end
		end
		
		f2_local0( f1_arg0, {
			name = "datasource_event"
		} )
	end, true )
	f1_arg0:SubscribeToModel( DataSources.inGame.jackal.barrelWarnPrimaryR:GetModel( f1_arg1 ), function ()
		local f4_local0 = function ( f5_arg0, f5_arg1 )
			local f5_local0 = f5_arg1.controller or controller
			if DataSources.inGame.jackal.barrelWarnPrimaryR:GetValue( f1_arg1 ) ~= nil and DataSources.inGame.jackal.barrelWarnPrimaryR:GetValue( f1_arg1 ) == false then
				ACTIONS.AnimateSequenceByElement( f1_arg0, {
					elementName = "PrimaryTempBar",
					sequenceName = "cool",
					elementPath = "PrimaryTempBar"
				} )
			end
			if DataSources.inGame.jackal.barrelWarnPrimaryR:GetValue( f1_arg1 ) ~= nil and DataSources.inGame.jackal.barrelWarnPrimaryR:GetValue( f1_arg1 ) == true then
				ACTIONS.AnimateSequenceByElement( f1_arg0, {
					elementName = "PrimaryTempBar",
					sequenceName = "warning",
					elementPath = "PrimaryTempBar"
				} )
			end
		end
		
		f4_local0( f1_arg0, {
			name = "datasource_event"
		} )
	end, true )
	f1_arg0:SubscribeToModel( DataSources.inGame.jackal.barrelOverheatPrimaryR:GetModel( f1_arg1 ), function ()
		local f6_local0 = function ( f7_arg0, f7_arg1 )
			local f7_local0 = f7_arg1.controller or controller
			if DataSources.inGame.jackal.barrelOverheatPrimaryR:GetValue( f1_arg1 ) ~= nil and DataSources.inGame.jackal.barrelOverheatPrimaryR:GetValue( f1_arg1 ) == true then
				ACTIONS.AnimateSequenceByElement( f1_arg0, {
					elementName = "PrimaryTempBar",
					sequenceName = "overheat",
					elementPath = "PrimaryTempBar"
				} )
			end
			if DataSources.inGame.jackal.barrelOverheatPrimaryR:GetValue( f1_arg1 ) ~= nil and DataSources.inGame.jackal.barrelOverheatPrimaryR:GetValue( f1_arg1 ) == false and DataSources.inGame.jackal.barrelWarnPrimaryR:GetValue( f1_arg1 ) ~= nil and DataSources.inGame.jackal.barrelWarnPrimaryR:GetValue( f1_arg1 ) == true then
				ACTIONS.AnimateSequenceByElement( f1_arg0, {
					elementName = "PrimaryTempBar",
					sequenceName = "warning",
					elementPath = "PrimaryTempBar"
				} )
			end
		end
		
		f6_local0( f1_arg0, {
			name = "datasource_event"
		} )
	end, true )
	f1_arg0:SubscribeToModel( DataSources.inGame.jackal.barrelWarnSecondaryR:GetModel( f1_arg1 ), function ()
		local f8_local0 = function ( f9_arg0, f9_arg1 )
			local f9_local0 = f9_arg1.controller or controller
			if DataSources.inGame.jackal.barrelWarnSecondaryR:GetValue( f1_arg1 ) ~= nil and DataSources.inGame.jackal.barrelWarnSecondaryR:GetValue( f1_arg1 ) == false then
				ACTIONS.AnimateSequenceByElement( f1_arg0, {
					elementName = "SecondaryTempBar",
					sequenceName = "cool",
					elementPath = "SecondaryTempBar"
				} )
			end
			if DataSources.inGame.jackal.barrelWarnSecondaryR:GetValue( f1_arg1 ) ~= nil and DataSources.inGame.jackal.barrelWarnSecondaryR:GetValue( f1_arg1 ) == true then
				ACTIONS.AnimateSequenceByElement( f1_arg0, {
					elementName = "SecondaryTempBar",
					sequenceName = "warning",
					elementPath = "SecondaryTempBar"
				} )
			end
		end
		
		f8_local0( f1_arg0, {
			name = "datasource_event"
		} )
	end, true )
	f1_arg0:SubscribeToModel( DataSources.inGame.jackal.barrelOverheatSecondaryR:GetModel( f1_arg1 ), function ()
		local f10_local0 = function ( f11_arg0, f11_arg1 )
			local f11_local0 = f11_arg1.controller or controller
			if DataSources.inGame.jackal.barrelOverheatSecondaryR:GetValue( f1_arg1 ) ~= nil and DataSources.inGame.jackal.barrelOverheatSecondaryR:GetValue( f1_arg1 ) == true then
				ACTIONS.AnimateSequenceByElement( f1_arg0, {
					elementName = "SecondaryTempBar",
					sequenceName = "overheat",
					elementPath = "SecondaryTempBar"
				} )
			end
			if DataSources.inGame.jackal.barrelOverheatSecondaryR:GetValue( f1_arg1 ) ~= nil and DataSources.inGame.jackal.barrelOverheatSecondaryR:GetValue( f1_arg1 ) == false and DataSources.inGame.jackal.barrelWarnSecondaryR:GetValue( f1_arg1 ) ~= nil and DataSources.inGame.jackal.barrelWarnSecondaryR:GetValue( f1_arg1 ) == true then
				ACTIONS.AnimateSequenceByElement( f1_arg0, {
					elementName = "SecondaryTempBar",
					sequenceName = "warning",
					elementPath = "SecondaryTempBar"
				} )
			end
		end
		
		f10_local0( f1_arg0, {
			name = "datasource_event"
		} )
	end, true )
end

function JackalWeaponBarrelsRight( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 350 * _1080p, 0, 65 * _1080p )
	self.id = "JackalWeaponBarrelsRight"
	self._animationSets = {}
	self._sequences = {}
	local f12_local1 = controller and controller.controllerIndex
	if not f12_local1 and not Engine.InFrontend() then
		f12_local1 = self:getRootController()
	end
	assert( f12_local1 )
	local f12_local2 = self
	local PrimaryTempBar = nil
	
	PrimaryTempBar = MenuBuilder.BuildRegisteredType( "JackalBarrelTempBar", {
		controllerIndex = f12_local1
	} )
	PrimaryTempBar.id = "PrimaryTempBar"
	PrimaryTempBar:SetDepth( -10, 0 )
	PrimaryTempBar.Fill:SetAnchors( 1, 0, 0.5, 0.5, 0 )
	PrimaryTempBar.Fill:SetRight( _1080p * -5, 0 )
	PrimaryTempBar.WeaponName:SetAlignment( LUI.Alignment.Right )
	PrimaryTempBar:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -350, 0, 0, _1080p * 20 )
	PrimaryTempBar:SubscribeToModel( DataSources.inGame.jackal.barrelTempPrimaryR:GetModel( f12_local1 ), function ()
		local f13_local0 = DataSources.inGame.jackal.barrelTempPrimaryR:GetValue( f12_local1 )
		if f13_local0 ~= nil then
			PrimaryTempBar.Fill:SetLeft( _1080p * Subtract( Multiply( f13_local0, -340 ), 5 ), 0 )
		end
	end )
	PrimaryTempBar:SubscribeToModel( DataSources.inGame.jackal.equippedPrimary:GetModel( f12_local1 ), function ()
		local f14_local0 = DataSources.inGame.jackal.equippedPrimary:GetValue( f12_local1 )
		if f14_local0 ~= nil then
			PrimaryTempBar.WeaponName:setText( LocalizeString( f14_local0 ), 0 )
		end
	end )
	self:addElement( PrimaryTempBar )
	self.PrimaryTempBar = PrimaryTempBar
	
	local SecondaryTempBar = nil
	
	SecondaryTempBar = MenuBuilder.BuildRegisteredType( "JackalBarrelTempBar", {
		controllerIndex = f12_local1
	} )
	SecondaryTempBar.id = "SecondaryTempBar"
	SecondaryTempBar:SetAlpha( 0.25, 0 )
	SecondaryTempBar:SetDepth( 10, 0 )
	SecondaryTempBar.Fill:SetAnchors( 1, 0, 0.5, 0.5, 0 )
	SecondaryTempBar.Fill:SetRight( _1080p * -5, 0 )
	SecondaryTempBar.WeaponName:SetAlignment( LUI.Alignment.Right )
	SecondaryTempBar:SetAnchorsAndPosition( 1, 0, 1, 0, _1080p * -350, 0, _1080p * -20, 0 )
	SecondaryTempBar:SubscribeToModel( DataSources.inGame.jackal.barrelTempSecondaryR:GetModel( f12_local1 ), function ()
		local f15_local0 = DataSources.inGame.jackal.barrelTempSecondaryR:GetValue( f12_local1 )
		if f15_local0 ~= nil then
			SecondaryTempBar.Fill:SetLeft( _1080p * Subtract( Multiply( f15_local0, -340 ), 5 ), 0 )
		end
	end )
	SecondaryTempBar:SubscribeToModel( DataSources.inGame.jackal.equippedSecondary:GetModel( f12_local1 ), function ()
		local f16_local0 = DataSources.inGame.jackal.equippedSecondary:GetValue( f12_local1 )
		if f16_local0 ~= nil then
			SecondaryTempBar.WeaponName:setText( LocalizeString( f16_local0 ), 0 )
		end
	end )
	self:addElement( SecondaryTempBar )
	self.SecondaryTempBar = SecondaryTempBar
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		PrimaryTempBar:RegisterAnimationSequence( "primaryToSecondary", {
			{
				function ()
					return self.PrimaryTempBar:SetDepth( -10, 0 )
				end,
				function ()
					return self.PrimaryTempBar:SetDepth( 0, 300 )
				end,
				function ()
					return self.PrimaryTempBar:SetDepth( 0, 100 )
				end,
				function ()
					return self.PrimaryTempBar:SetDepth( 10, 300 )
				end
			},
			{
				function ()
					return self.PrimaryTempBar:SetAlpha( 1, 0 )
				end,
				function ()
					return self.PrimaryTempBar:SetAlpha( 0.25, 300 )
				end,
				function ()
					return self.PrimaryTempBar:SetAlpha( 0.25, 100 )
				end,
				function ()
					return self.PrimaryTempBar:SetAlpha( 0.25, 300 )
				end
			},
			{
				function ()
					return self.PrimaryTempBar:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -350, 0, 0, _1080p * 20, 0 )
				end,
				function ()
					return self.PrimaryTempBar:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -400, _1080p * -50, _1080p * 20, _1080p * 40, 300 )
				end,
				function ()
					return self.PrimaryTempBar:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -400, _1080p * -50, _1080p * 20, _1080p * 40, 99 )
				end,
				function ()
					return self.PrimaryTempBar:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -350, 0, _1080p * 40, _1080p * 60, 299 )
				end
			}
		} )
		SecondaryTempBar:RegisterAnimationSequence( "primaryToSecondary", {
			{
				function ()
					return self.SecondaryTempBar:SetDepth( 10, 0 )
				end,
				function ()
					return self.SecondaryTempBar:SetDepth( 0, 300 )
				end,
				function ()
					return self.SecondaryTempBar:SetDepth( 0, 100 )
				end,
				function ()
					return self.SecondaryTempBar:SetDepth( -10, 300 )
				end
			},
			{
				function ()
					return self.SecondaryTempBar:SetAlpha( 0.25, 0 )
				end,
				function ()
					return self.SecondaryTempBar:SetAlpha( 0.25, 300 )
				end,
				function ()
					return self.SecondaryTempBar:SetAlpha( 0.25, 100 )
				end,
				function ()
					return self.SecondaryTempBar:SetAlpha( 1, 300 )
				end
			},
			{
				function ()
					return self.SecondaryTempBar:SetAnchorsAndPosition( 1, 0, 1, 0, _1080p * -350, 0, _1080p * -20, 0, 0 )
				end,
				function ()
					return self.SecondaryTempBar:SetAnchorsAndPosition( 1, 0, 1, 0, _1080p * -300, _1080p * 50, _1080p * -40, _1080p * -20, 300 )
				end,
				function ()
					return self.SecondaryTempBar:SetAnchorsAndPosition( 1, 0, 1, 0, _1080p * -300, _1080p * 50, _1080p * -40, _1080p * -20, 99 )
				end,
				function ()
					return self.SecondaryTempBar:SetAnchorsAndPosition( 1, 0, 1, 0, _1080p * -350, 0, _1080p * -60, _1080p * -40, 299 )
				end
			}
		} )
		self._sequences.primaryToSecondary = function ()
			PrimaryTempBar:AnimateSequence( "primaryToSecondary" )
			SecondaryTempBar:AnimateSequence( "primaryToSecondary" )
		end
		
		PrimaryTempBar:RegisterAnimationSequence( "secondaryToPrimary", {
			{
				function ()
					return self.PrimaryTempBar:SetDepth( 10, 0 )
				end,
				function ()
					return self.PrimaryTempBar:SetDepth( 0, 300 )
				end,
				function ()
					return self.PrimaryTempBar:SetDepth( 0, 100 )
				end,
				function ()
					return self.PrimaryTempBar:SetDepth( -10, 300 )
				end
			},
			{
				function ()
					return self.PrimaryTempBar:SetAlpha( 0.25, 0 )
				end,
				function ()
					return self.PrimaryTempBar:SetAlpha( 0.25, 300 )
				end,
				function ()
					return self.PrimaryTempBar:SetAlpha( 0.25, 100 )
				end,
				function ()
					return self.PrimaryTempBar:SetAlpha( 1, 300 )
				end
			},
			{
				function ()
					return self.PrimaryTempBar:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -350, 0, _1080p * 40, _1080p * 60, 0 )
				end,
				function ()
					return self.PrimaryTempBar:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -400, _1080p * -50, _1080p * 20, _1080p * 40, 300 )
				end,
				function ()
					return self.PrimaryTempBar:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -400, _1080p * -50, _1080p * 20, _1080p * 40, 99 )
				end,
				function ()
					return self.PrimaryTempBar:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -350, 0, 0, _1080p * 20, 299 )
				end
			}
		} )
		SecondaryTempBar:RegisterAnimationSequence( "secondaryToPrimary", {
			{
				function ()
					return self.SecondaryTempBar:SetDepth( -10, 0 )
				end,
				function ()
					return self.SecondaryTempBar:SetDepth( 0, 300 )
				end,
				function ()
					return self.SecondaryTempBar:SetDepth( 0, 100 )
				end,
				function ()
					return self.SecondaryTempBar:SetDepth( 10, 300 )
				end
			},
			{
				function ()
					return self.SecondaryTempBar:SetAlpha( 1, 0 )
				end,
				function ()
					return self.SecondaryTempBar:SetAlpha( 0.25, 300 )
				end,
				function ()
					return self.SecondaryTempBar:SetAlpha( 0.25, 100 )
				end,
				function ()
					return self.SecondaryTempBar:SetAlpha( 0.25, 300 )
				end
			},
			{
				function ()
					return self.SecondaryTempBar:SetAnchorsAndPosition( 1, 0, 1, 0, _1080p * -350, 0, _1080p * -60, _1080p * -40, 0 )
				end,
				function ()
					return self.SecondaryTempBar:SetAnchorsAndPosition( 1, 0, 1, 0, _1080p * -300, _1080p * 50, _1080p * -40, _1080p * -20, 300 )
				end,
				function ()
					return self.SecondaryTempBar:SetAnchorsAndPosition( 1, 0, 1, 0, _1080p * -300, _1080p * 50, _1080p * -40, _1080p * -20, 99 )
				end,
				function ()
					return self.SecondaryTempBar:SetAnchorsAndPosition( 1, 0, 1, 0, _1080p * -350, 0, _1080p * -20, 0, 299 )
				end
			}
		} )
		self._sequences.secondaryToPrimary = function ()
			PrimaryTempBar:AnimateSequence( "secondaryToPrimary" )
			SecondaryTempBar:AnimateSequence( "secondaryToPrimary" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	PostLoadFunc( self, f12_local1, controller )
	return self
end

MenuBuilder.registerType( "JackalWeaponBarrelsRight", JackalWeaponBarrelsRight )
LockTable( _M )
