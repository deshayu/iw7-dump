local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ( f1_arg0, f1_arg1, f1_arg2 )
	local f1_local0 = 0.33
	local f1_local1 = 0.67
	f1_arg0.UpperRight:SetLeftAnchor( f1_local1 )
	f1_arg0.UpperRight:SetLeft( 0 )
	f1_arg0.UpperRight:SetBottomAnchor( f1_local1 )
	f1_arg0.UpperRight:SetBottom( 0 )
	f1_arg0.UpperCenter:SetLeftAnchor( f1_local0 )
	f1_arg0.UpperCenter:SetLeft( 0 )
	f1_arg0.UpperCenter:SetRightAnchor( f1_local0 )
	f1_arg0.UpperCenter:SetRight( 0 )
	f1_arg0.UpperCenter:SetBottomAnchor( f1_local1 )
	f1_arg0.UpperCenter:SetBottom( 0 )
	f1_arg0.UpperLeft:SetRightAnchor( f1_local1 )
	f1_arg0.UpperLeft:SetRight( 0 )
	f1_arg0.UpperLeft:SetBottomAnchor( f1_local1 )
	f1_arg0.UpperLeft:SetBottom( 0 )
	f1_arg0.MidRight:SetLeftAnchor( f1_local1 )
	f1_arg0.MidRight:SetLeft( 0 )
	f1_arg0.MidRight:SetTopAnchor( f1_local0 )
	f1_arg0.MidRight:SetTop( 0 )
	f1_arg0.MidRight:SetBottomAnchor( f1_local0 )
	f1_arg0.MidRight:SetBottom( 0 )
	f1_arg0.MidLeft:SetRightAnchor( f1_local1 )
	f1_arg0.MidLeft:SetRight( 0 )
	f1_arg0.MidLeft:SetTopAnchor( f1_local0 )
	f1_arg0.MidLeft:SetTop( 0 )
	f1_arg0.MidLeft:SetBottomAnchor( f1_local0 )
	f1_arg0.MidLeft:SetBottom( 0 )
	f1_arg0.LowerRight:SetLeftAnchor( f1_local1 )
	f1_arg0.LowerRight:SetLeft( 0 )
	f1_arg0.LowerRight:SetTopAnchor( f1_local1 )
	f1_arg0.LowerRight:SetTop( 0 )
	f1_arg0.LowerCenter:SetLeftAnchor( f1_local0 )
	f1_arg0.LowerCenter:SetLeft( 0 )
	f1_arg0.LowerCenter:SetRightAnchor( f1_local0 )
	f1_arg0.LowerCenter:SetRight( 0 )
	f1_arg0.LowerCenter:SetTopAnchor( f1_local1 )
	f1_arg0.LowerCenter:SetTop( 0 )
	f1_arg0.LowerLeft:SetRightAnchor( f1_local1 )
	f1_arg0.LowerLeft:SetRight( 0 )
	f1_arg0.LowerLeft:SetTopAnchor( f1_local1 )
	f1_arg0.LowerLeft:SetTop( 0 )
end

function EdgeGlowContainer( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 1920 * _1080p, 0, 1080 * _1080p )
	self.id = "EdgeGlowContainer"
	local f2_local1 = controller and controller.controllerIndex
	if not f2_local1 and not Engine.InFrontend() then
		f2_local1 = self:getRootController()
	end
	assert( f2_local1 )
	local f2_local2 = self
	local UpperRight = nil
	
	UpperRight = MenuBuilder.BuildRegisteredType( "EdgeGlow", {
		controllerIndex = f2_local1
	} )
	UpperRight.id = "UpperRight"
	UpperRight:SetDataSource( DataSources.inGame.MP, f2_local1 )
	UpperRight.Image0:setImage( RegisterMaterial( "hud_edge_glow_right" ), 0 )
	UpperRight:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -640, 0, 0, _1080p * 360 )
	self:addElement( UpperRight )
	self.UpperRight = UpperRight
	
	local UpperCenter = nil
	
	UpperCenter = MenuBuilder.BuildRegisteredType( "EdgeGlow", {
		controllerIndex = f2_local1
	} )
	UpperCenter.id = "UpperCenter"
	UpperCenter:SetDataSource( DataSources.inGame.MP, f2_local1 )
	UpperCenter.Image0:setImage( RegisterMaterial( "hud_edge_glow_top" ), 0 )
	UpperCenter:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -320, _1080p * 320, 0, _1080p * 360 )
	self:addElement( UpperCenter )
	self.UpperCenter = UpperCenter
	
	local UpperLeft = nil
	
	UpperLeft = MenuBuilder.BuildRegisteredType( "EdgeGlow", {
		controllerIndex = f2_local1
	} )
	UpperLeft.id = "UpperLeft"
	UpperLeft:SetDataSource( DataSources.inGame.MP, f2_local1 )
	UpperLeft.Image0:setImage( RegisterMaterial( "hud_edge_glow_left" ), 0 )
	UpperLeft:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 640, 0, _1080p * 360 )
	self:addElement( UpperLeft )
	self.UpperLeft = UpperLeft
	
	local LowerRight = nil
	
	LowerRight = MenuBuilder.BuildRegisteredType( "EdgeGlow", {
		controllerIndex = f2_local1
	} )
	LowerRight.id = "LowerRight"
	LowerRight:SetZRotation( 180, 0 )
	LowerRight:SetDataSource( DataSources.inGame.MP, f2_local1 )
	LowerRight.Image0:setImage( RegisterMaterial( "hud_edge_glow_left" ), 0 )
	LowerRight:SetAnchorsAndPosition( 1, 0, 1, 0, _1080p * -640, 0, _1080p * -360, 0 )
	self:addElement( LowerRight )
	self.LowerRight = LowerRight
	
	local LowerCenter = nil
	
	LowerCenter = MenuBuilder.BuildRegisteredType( "EdgeGlow", {
		controllerIndex = f2_local1
	} )
	LowerCenter.id = "LowerCenter"
	LowerCenter:SetZRotation( 180, 0 )
	LowerCenter:SetDataSource( DataSources.inGame.MP, f2_local1 )
	LowerCenter.Image0:setImage( RegisterMaterial( "hud_edge_glow_top" ), 0 )
	LowerCenter:SetAnchorsAndPosition( 0.5, 0.5, 1, 0, _1080p * -320, _1080p * 320, _1080p * -360, 0 )
	self:addElement( LowerCenter )
	self.LowerCenter = LowerCenter
	
	local LowerLeft = nil
	
	LowerLeft = MenuBuilder.BuildRegisteredType( "EdgeGlow", {
		controllerIndex = f2_local1
	} )
	LowerLeft.id = "LowerLeft"
	LowerLeft:SetZRotation( 180, 0 )
	LowerLeft:SetDataSource( DataSources.inGame.MP, f2_local1 )
	LowerLeft.Image0:setImage( RegisterMaterial( "hud_edge_glow_right" ), 0 )
	LowerLeft:SetAnchorsAndPosition( 0, 1, 1, 0, 0, _1080p * 640, _1080p * -360, 0 )
	self:addElement( LowerLeft )
	self.LowerLeft = LowerLeft
	
	local MidRight = nil
	
	MidRight = MenuBuilder.BuildRegisteredType( "EdgeGlow", {
		controllerIndex = f2_local1
	} )
	MidRight.id = "MidRight"
	MidRight:SetZRotation( 180, 0 )
	MidRight:SetDataSource( DataSources.inGame.MP, f2_local1 )
	MidRight.Image0:setImage( RegisterMaterial( "hud_edge_glow_mid" ), 0 )
	MidRight:SetAnchorsAndPosition( 1, 0, 0.5, 0.5, _1080p * -640, 0, _1080p * -180, _1080p * 180 )
	self:addElement( MidRight )
	self.MidRight = MidRight
	
	local MidLeft = nil
	
	MidLeft = MenuBuilder.BuildRegisteredType( "EdgeGlow", {
		controllerIndex = f2_local1
	} )
	MidLeft.id = "MidLeft"
	MidLeft:SetDataSource( DataSources.inGame.MP, f2_local1 )
	MidLeft.Image0:setImage( RegisterMaterial( "hud_edge_glow_mid" ), 0 )
	MidLeft:SetAnchorsAndPosition( 0, 1, 0.5, 0.5, 0, _1080p * 640, _1080p * -180, _1080p * 180 )
	self:addElement( MidLeft )
	self.MidLeft = MidLeft
	
	local Vignette = nil
	
	Vignette = MenuBuilder.BuildRegisteredType( "EdgeGlow", {
		controllerIndex = f2_local1
	} )
	Vignette.id = "Vignette"
	Vignette:SetDataSource( DataSources.inGame.MP, f2_local1 )
	Vignette.Image0:setImage( RegisterMaterial( "bkgd_vignette" ), 0 )
	Vignette:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 1920, _1080p * 5, _1080p * 1080 )
	self:addElement( Vignette )
	self.Vignette = Vignette
	
	UpperRight:SubscribeToModel( DataSources.inGame.MP.edgeGlowUpperRight:GetModel( f2_local1 ), function ()
		if DataSources.inGame.MP.edgeGlowUpperRight:GetValue( f2_local1 ) ~= nil and DataSources.inGame.MP.edgeGlowUpperRight:GetValue( f2_local1 ) == true then
			ACTIONS.AnimateSequenceByElement( self, {
				elementName = "UpperRight",
				sequenceName = "PerkPulse",
				elementPath = "UpperRight"
			} )
		end
		if DataSources.inGame.MP.edgeGlowUpperRight:GetValue( f2_local1 ) ~= nil and DataSources.inGame.MP.edgeGlowUpperRight:GetValue( f2_local1 ) == false then
			ACTIONS.AnimateSequenceByElement( self, {
				elementName = "UpperRight",
				sequenceName = "DefaultSequence",
				elementPath = ""
			} )
		end
	end )
	UpperCenter:SubscribeToModel( DataSources.inGame.MP.edgeGlowUpperCenter:GetModel( f2_local1 ), function ()
		if DataSources.inGame.MP.edgeGlowUpperCenter:GetValue( f2_local1 ) ~= nil and DataSources.inGame.MP.edgeGlowUpperCenter:GetValue( f2_local1 ) == true then
			ACTIONS.AnimateSequenceByElement( self, {
				elementName = "UpperCenter",
				sequenceName = "PerkPulse",
				elementPath = "UpperCenter"
			} )
		end
		if DataSources.inGame.MP.edgeGlowUpperCenter:GetValue( f2_local1 ) ~= nil and DataSources.inGame.MP.edgeGlowUpperCenter:GetValue( f2_local1 ) == false then
			ACTIONS.AnimateSequenceByElement( self, {
				elementName = "UpperCenter",
				sequenceName = "DefaultSequence",
				elementPath = ""
			} )
		end
	end )
	UpperLeft:SubscribeToModel( DataSources.inGame.MP.edgeGlowUpperLeft:GetModel( f2_local1 ), function ()
		if DataSources.inGame.MP.edgeGlowUpperLeft:GetValue( f2_local1 ) ~= nil and DataSources.inGame.MP.edgeGlowUpperLeft:GetValue( f2_local1 ) == true then
			ACTIONS.AnimateSequenceByElement( self, {
				elementName = "UpperLeft",
				sequenceName = "PerkPulse",
				elementPath = "UpperLeft"
			} )
		end
		if DataSources.inGame.MP.edgeGlowUpperLeft:GetValue( f2_local1 ) ~= nil and DataSources.inGame.MP.edgeGlowUpperLeft:GetValue( f2_local1 ) == false then
			ACTIONS.AnimateSequenceByElement( self, {
				elementName = "UpperLeft",
				sequenceName = "DefaultSequence",
				elementPath = ""
			} )
		end
	end )
	LowerRight:SubscribeToModel( DataSources.inGame.MP.edgeGlowLowerRight:GetModel( f2_local1 ), function ()
		if DataSources.inGame.MP.edgeGlowLowerRight:GetValue( f2_local1 ) ~= nil and DataSources.inGame.MP.edgeGlowLowerRight:GetValue( f2_local1 ) == true then
			ACTIONS.AnimateSequenceByElement( self, {
				elementName = "LowerRight",
				sequenceName = "PerkPulse",
				elementPath = "LowerRight"
			} )
		end
		if DataSources.inGame.MP.edgeGlowLowerRight:GetValue( f2_local1 ) ~= nil and DataSources.inGame.MP.edgeGlowLowerRight:GetValue( f2_local1 ) == false then
			ACTIONS.AnimateSequenceByElement( self, {
				elementName = "LowerRight",
				sequenceName = "DefaultSequence",
				elementPath = ""
			} )
		end
	end )
	LowerCenter:SubscribeToModel( DataSources.inGame.MP.edgeGlowLowerCenter:GetModel( f2_local1 ), function ()
		if DataSources.inGame.MP.edgeGlowLowerCenter:GetValue( f2_local1 ) ~= nil and DataSources.inGame.MP.edgeGlowLowerCenter:GetValue( f2_local1 ) == true then
			ACTIONS.AnimateSequenceByElement( self, {
				elementName = "LowerCenter",
				sequenceName = "PerkPulse",
				elementPath = "LowerCenter"
			} )
		end
		if DataSources.inGame.MP.edgeGlowLowerCenter:GetValue( f2_local1 ) ~= nil and DataSources.inGame.MP.edgeGlowLowerCenter:GetValue( f2_local1 ) == false then
			ACTIONS.AnimateSequenceByElement( self, {
				elementName = "LowerCenter",
				sequenceName = "DefaultSequence",
				elementPath = ""
			} )
		end
	end )
	LowerLeft:SubscribeToModel( DataSources.inGame.MP.edgeGlowLowerLeft:GetModel( f2_local1 ), function ()
		if DataSources.inGame.MP.edgeGlowLowerLeft:GetValue( f2_local1 ) ~= nil and DataSources.inGame.MP.edgeGlowLowerLeft:GetValue( f2_local1 ) == true then
			ACTIONS.AnimateSequenceByElement( self, {
				elementName = "LowerLeft",
				sequenceName = "PerkPulse",
				elementPath = "LowerLeft"
			} )
		end
		if DataSources.inGame.MP.edgeGlowLowerLeft:GetValue( f2_local1 ) ~= nil and DataSources.inGame.MP.edgeGlowLowerLeft:GetValue( f2_local1 ) == false then
			ACTIONS.AnimateSequenceByElement( self, {
				elementName = "LowerLeft",
				sequenceName = "DefaultSequence",
				elementPath = ""
			} )
		end
	end )
	MidRight:SubscribeToModel( DataSources.inGame.MP.edgeGlowMidRight:GetModel( f2_local1 ), function ()
		if DataSources.inGame.MP.edgeGlowMidRight:GetValue( f2_local1 ) ~= nil and DataSources.inGame.MP.edgeGlowMidRight:GetValue( f2_local1 ) == true then
			ACTIONS.AnimateSequenceByElement( self, {
				elementName = "MidRight",
				sequenceName = "PerkPulse",
				elementPath = "MidRight"
			} )
		end
		if DataSources.inGame.MP.edgeGlowMidRight:GetValue( f2_local1 ) ~= nil and DataSources.inGame.MP.edgeGlowMidRight:GetValue( f2_local1 ) == false then
			ACTIONS.AnimateSequenceByElement( self, {
				elementName = "MidRight",
				sequenceName = "DefaultSequence",
				elementPath = ""
			} )
		end
	end )
	MidLeft:SubscribeToModel( DataSources.inGame.MP.edgeGlowMidLeft:GetModel( f2_local1 ), function ()
		if DataSources.inGame.MP.edgeGlowMidLeft:GetValue( f2_local1 ) ~= nil and DataSources.inGame.MP.edgeGlowMidLeft:GetValue( f2_local1 ) == true then
			ACTIONS.AnimateSequenceByElement( self, {
				elementName = "MidLeft",
				sequenceName = "PerkPulse",
				elementPath = "MidLeft"
			} )
		end
		if DataSources.inGame.MP.edgeGlowMidLeft:GetValue( f2_local1 ) ~= nil and DataSources.inGame.MP.edgeGlowMidLeft:GetValue( f2_local1 ) == false then
			ACTIONS.AnimateSequenceByElement( self, {
				elementName = "MidLeft",
				sequenceName = "DefaultSequence",
				elementPath = ""
			} )
		end
	end )
	local f2_local12 = function ()
		if DataSources.inGame.MP.edgeGlowVignette:GetValue( f2_local1 ) ~= nil and DataSources.inGame.MP.edgeGlowVignette:GetValue( f2_local1 ) == true then
			ACTIONS.AnimateSequenceByElement( self, {
				elementName = "Vignette",
				sequenceName = "PerkPulse",
				elementPath = "Vignette"
			} )
		end
		if DataSources.inGame.MP.edgeGlowVignette:GetValue( f2_local1 ) ~= nil and DataSources.inGame.MP.edgeGlowVignette:GetValue( f2_local1 ) == false then
			ACTIONS.AnimateSequenceByElement( self, {
				elementName = "Vignette",
				sequenceName = "DefaultSequence",
				elementPath = "Vignette"
			} )
		end
	end
	
	Vignette:SubscribeToModel( DataSources.inGame.MP.edgeGlowVignette:GetModel( f2_local1 ), f2_local12 )
	Vignette:SubscribeToModel( DataSources.inGame.MP.edgeGlowMidLeft:GetModel( f2_local1 ), f2_local12 )
	UpperRight:SetDataSource( DataSources.inGame.MP, f2_local1 )
	UpperCenter:SetDataSource( DataSources.inGame.MP, f2_local1 )
	UpperLeft:SetDataSource( DataSources.inGame.MP, f2_local1 )
	LowerRight:SetDataSource( DataSources.inGame.MP, f2_local1 )
	LowerCenter:SetDataSource( DataSources.inGame.MP, f2_local1 )
	LowerLeft:SetDataSource( DataSources.inGame.MP, f2_local1 )
	MidRight:SetDataSource( DataSources.inGame.MP, f2_local1 )
	MidLeft:SetDataSource( DataSources.inGame.MP, f2_local1 )
	Vignette:SetDataSource( DataSources.inGame.MP, f2_local1 )
	f0_local0( self, f2_local1, controller )
	return self
end

MenuBuilder.registerType( "EdgeGlowContainer", EdgeGlowContainer )
LockTable( _M )
