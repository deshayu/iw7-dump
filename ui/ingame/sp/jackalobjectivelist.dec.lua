local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function JackalObjectiveList( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 281 * _1080p, 0, 40 * _1080p )
	self.id = "JackalObjectiveList"
	self._animationSets = {}
	self._sequences = {}
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local f1_local3 = nil
	if not Engine.InFrontend() then
		f1_local3 = LUI.UIDataSourceToggleList.new( nil, {
			listDataSource = DataSources.inGame.jackal.activeJackalObjectives,
			controlDataSource = DataSources.inGame.jackal.activeJackalObjectiveBits,
			buildChild = function ()
				return MenuBuilder.BuildRegisteredType( "JackalObjective", {
					controllerIndex = f1_local1
				} )
			end,
			controller = f1_local1,
			orderedIndices = false,
			direction = LUI.DIRECTION.vertical,
			horizontalAlignment = LUI.Alignment.Right,
			verticalAlignment = LUI.Alignment.None,
			animateInDuration = 0,
			animateOutDuration = 250,
			animationVariance = 0
		} )
		f1_local3.id = "Objectives"
		f1_local3:SetYRotation( -50, 0 )
		f1_local3:SetDepth( -50, 0 )
		f1_local3:SetAnchorsAndPosition( 0, 0, 1, 0, 0, 0, 0, _1080p * 144 )
		self:addElement( f1_local3 )
		self.Objectives = f1_local3
	end
	local JackalObjectiveListTopBar0 = nil
	
	JackalObjectiveListTopBar0 = MenuBuilder.BuildRegisteredType( "JackalObjectiveListTopBar", {
		controllerIndex = f1_local1
	} )
	JackalObjectiveListTopBar0.id = "JackalObjectiveListTopBar0"
	JackalObjectiveListTopBar0:SetYRotation( -50, 0 )
	JackalObjectiveListTopBar0:SetDepth( -50, 0 )
	JackalObjectiveListTopBar0:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, 0, 0 )
	self:addElement( JackalObjectiveListTopBar0 )
	self.JackalObjectiveListTopBar0 = JackalObjectiveListTopBar0
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		if not Engine.InFrontend() then
			f1_local3:RegisterAnimationSequence( "Default", {
				{
					function ()
						return self.Objectives:SetAlpha( 0, 0 )
					end
				}
			} )
		end
		self._sequences.Default = function ()
			if not Engine.InFrontend() then
				f1_local3:AnimateSequence( "Default" )
			end
		end
		
		if not Engine.InFrontend() then
			f1_local3:RegisterAnimationSequence( "Bootup", {
				{
					function ()
						return self.Objectives:SetAlpha( 0, 0 )
					end,
					function ()
						return self.Objectives:SetAlpha( 0, 400 )
					end,
					function ()
						return self.Objectives:SetAlpha( 1, 200 )
					end
				}
			} )
		end
		self._sequences.Bootup = function ()
			if not Engine.InFrontend() then
				f1_local3:AnimateSequence( "Bootup" )
			end
		end
		
		if not Engine.InFrontend() then
			f1_local3:RegisterAnimationSequence( "Shutdown", {
				{
					function ()
						return self.Objectives:SetAlpha( 1, 0 )
					end,
					function ()
						return self.Objectives:SetAlpha( 0, 200 )
					end
				}
			} )
		end
		self._sequences.Shutdown = function ()
			if not Engine.InFrontend() then
				f1_local3:AnimateSequence( "Shutdown" )
			end
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	self:SubscribeToModel( DataSources.inGame.jackal.jackalObjectivesEnabled:GetModel( f1_local1 ), function ()
		if DataSources.inGame.jackal.jackalObjectivesEnabled:GetValue( f1_local1 ) ~= nil and DataSources.inGame.jackal.jackalObjectivesEnabled:GetValue( f1_local1 ) == 1 then
			ACTIONS.AnimateSequence( self, "Bootup" )
			ACTIONS.AnimateSequenceByElement( self, {
				elementName = "JackalObjectiveListTopBar0",
				sequenceName = "Bootup",
				elementPath = "JackalObjectiveListTopBar0"
			} )
		end
		if DataSources.inGame.jackal.jackalObjectivesEnabled:GetValue( f1_local1 ) ~= nil and DataSources.inGame.jackal.jackalObjectivesEnabled:GetValue( f1_local1 ) == 0 then
			ACTIONS.AnimateSequence( self, "Shutdown" )
			ACTIONS.AnimateSequenceByElement( self, {
				elementName = "JackalObjectiveListTopBar0",
				sequenceName = "Shutdown",
				elementPath = "JackalObjectiveListTopBar0"
			} )
		end
	end )
	if DataSources.inGame.jackal.jackalObjectivesEnabled:GetValue( f1_local1 ) ~= nil and DataSources.inGame.jackal.jackalObjectivesEnabled:GetValue( f1_local1 ) == 0 then
		ACTIONS.AnimateSequence( self, "Default" )
		ACTIONS.AnimateSequenceByElement( self, {
			elementName = "JackalObjectiveListTopBar0",
			sequenceName = "Default",
			elementPath = "JackalObjectiveListTopBar0"
		} )
	end
	if DataSources.inGame.jackal.jackalObjectivesEnabled:GetValue( f1_local1 ) ~= nil and DataSources.inGame.jackal.jackalObjectivesEnabled:GetValue( f1_local1 ) == 1 then
		ACTIONS.AnimateSequence( self, "Bootup" )
		ACTIONS.AnimateSequenceByElement( self, {
			elementName = "JackalObjectiveListTopBar0",
			sequenceName = "Bootup",
			elementPath = "JackalObjectiveListTopBar0"
		} )
	end
	return self
end

MenuBuilder.registerType( "JackalObjectiveList", JackalObjectiveList )
LockTable( _M )
