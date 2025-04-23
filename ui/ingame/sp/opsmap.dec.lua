local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = 0
f0_local1 = "tag_player"
f0_local2 = 0.1
local f0_local3 = CoD.TextSettings.ButtonHelperFont
local f0_local4 = {
	locked = 0,
	incomplete = 1,
	complete = 2
}
function POI()
	return {
		name = "unnamed poi",
		orbits = "",
		image = "",
		r = 0,
		theta = 0,
		z = 0,
		scale = 100,
		category = nil,
		map = nil,
		description = "",
		descriptionCompleted = ""
	}
end

function OpsMapPOIs()
	local f2_local0 = {}
	local f2_local1 = Engine.GetDvarFloat( "opsMap_contentWidth" )
	local f2_local2 = Engine.TableGetRowCount( CSV.OpsMap.file )
	if f2_local2 > 0 then
		for f2_local3 = 0, f2_local2, 1 do
			local f2_local6 = CSV.ReadRow( CSV.OpsMap, f2_local3 )
			f2_local6.index = tonumber( f2_local6.index )
			if f2_local6.index ~= nil then
				f2_local6.r = tonumber( f2_local6.r )
				f2_local6.theta = tonumber( f2_local6.theta )
				f2_local6.scale = tonumber( f2_local6.scale )
				if f2_local6.scale == nil then
					f2_local6.scale = f2_local1
				end
				f2_local0[f2_local3 + 1] = f2_local6
			end
		end
	end
	return f2_local0
end

local f0_local5 = OpsMapPOIs()
local f0_local6 = function ( f3_arg0, f3_arg1 )
	assert( f3_arg1.displayName )
	assert( f3_arg1.mapName )
	local f3_local0 = nil
	local f3_local1 = {
		yOffset = 0,
		message = Engine.Localize( "OPS_MAP_CONFIRM_PROMPT", Engine.Localize( f3_arg1.displayName ) ),
		yesAction = function ( f4_arg0 )
			f3_local0:dispatchEventToRoot( {
				name = "leave_opsmap",
				map = f3_arg1.mapName,
				notify = "opsmap_" .. f3_arg1.mapName
			} )
		end,
		noAction = function ()
			OpsMap.BlockInput( f0_local0, false )
			OpsMap.ClearFocusedPOI( f0_local0 )
		end
	}
	OpsMap.BlockInput( f0_local0, true )
	return MenuBuilder.BuildRegisteredType( "PopupYesNo", f3_local1 )
end

local f0_local7 = 0
local f0_local8 = function ( f6_arg0, f6_arg1, f6_arg2, f6_arg3 )
	local f6_local0, f6_local1 = Game.GetWorldUnitsPerLUIPixel( f0_local0, f6_arg1 + Engine.GetDvarFloat( "opsMap_positionFromRefEnt" ) )
	local f6_local2 = 1280 * f6_local0
	local f6_local3 = f6_local2 / 2
	local f6_local4 = f6_local2 / f6_arg2
	local f6_local5 = f6_local4
	local f6_local6 = math.ceil( f6_local3 / f6_local5 )
	f6_local3 = f6_local5 * f6_local6
	local self = LUI.UIElement.new( {
		topAnchor = false,
		bottomAnchor = false,
		leftAnchor = false,
		rightAnchor = false,
		top = -f6_local3 / 2,
		bottom = f6_local3 / 2,
		left = -f6_local2 / 2,
		right = f6_local2 / 2
	} )
	self.id = "stars" .. f6_arg1
	self:SetupInWorldElement( {
		entityNum = f6_arg0,
		entityTag = f0_local1
	} )
	self:SetInWorldScale( 1 )
	self:SetDepthTestEnabled( false )
	self:SetFollowTagAngles( true )
	self:SetTagSpaceYaw( -90 )
	self:SetTagSpacePosition( f6_arg1, 0, 0 )
	for f6_local8 = 1, f6_local6, 1 do
		for f6_local11 = 1, f6_arg2, 1 do
			local f6_local14 = LUI.UIImage.new( {
				material = RegisterMaterial( (f6_local11 + f0_local7) % 2 and "ops_star_pattern_sharp_1" or "ops_star_pattern_sharp_2" ),
				topAnchor = true,
				bottomAnchor = false,
				leftAnchor = true,
				rightAnchor = false,
				top = (f6_local8 - 1) * f6_local5,
				height = f6_local5,
				left = (f6_local11 - 1) * f6_local4,
				width = f6_local4,
				zRot = (f0_local7 + f6_local11 + f6_local8) % 4 * 90,
				alpha = 0.3,
				red = 0.8,
				green = 0.9,
				blue = 1
			} )
			f6_local14.id = "starTile_" .. f6_local11 .. "_" .. f6_local8
			f6_local14:SetBlendMode( BLEND_MODE.addWithAlpha )
			self:addElement( f6_local14 )
		end
	end
	f0_local7 = f0_local7 + 1
	return self
end

local f0_local9 = function ( f7_arg0, f7_arg1, f7_arg2, f7_arg3, f7_arg4 )
	local f7_local0 = {}
	local f7_local1, f7_local2 = Game.GetWorldUnitsPerLUIPixel( f0_local0, Engine.GetDvarFloat( "opsMap_positionFromRefEnt" ) + f7_arg1 )
	local f7_local3 = 720 * f7_local2 * 2 * (f7_arg4 or 1)
	local self = LUI.UIImage.new( {
		material = RegisterMaterial( f7_arg2 ),
		topAnchor = true,
		bottomAnchor = false,
		leftAnchor = true,
		rightAnchor = false,
		top = 0,
		height = 0.5,
		left = 0,
		width = 1,
		alpha = f7_arg3
	} )
	self.id = "background"
	self:SetupInWorldElement( {
		entityNum = f7_arg0,
		entityTag = f0_local1
	} )
	self:SetDepthTestEnabled( false )
	self:SetFollowTagAngles( true )
	self:SetTagSpaceYaw( -90 )
	self:SetTagSpacePosition( f7_arg1, 0, 0 )
	self:SetInWorldScale( f7_local3 )
	return self
end

local f0_local10 = function ( f8_arg0 )
	local f8_local0 = Engine.GetDvarFloat( "opsMap_contentWidth" )
	local self = LUI.UIElement.new()
	self:SetAlpha( 0.2 )
	self.id = "Asteroids"
	local f8_local2 = LUI.UIImage.new( {
		material = RegisterMaterial( "ops_map_scr_base_rings_1" ),
		topAnchor = true,
		bottomAnchor = false,
		leftAnchor = true,
		rightAnchor = false,
		top = 0,
		height = 1,
		left = 0,
		width = 1
	} )
	f8_local2:SetupInWorldElement( {
		entityNum = f8_arg0,
		entityTag = f0_local1
	} )
	f8_local2:SetDepthTestEnabled( false )
	f8_local2:SetFollowTagAngles( true )
	f8_local2:SetTagSpacePitch( Engine.GetDvarFloat( "opsMap_pitch" ) )
	f8_local2:SetTagSpaceYaw( Engine.GetDvarFloat( "opsMap_yaw" ) )
	f8_local2:SetTagSpaceRoll( Engine.GetDvarFloat( "opsMap_roll" ) - 90 )
	f8_local2:SetTagSpacePosition( Engine.GetDvarFloat( "opsMap_positionFromRefEnt" ), 0, 0 )
	f8_local2:SetInWorldScale( f8_local0 )
	f8_local2:SetBlendMode( BLEND_MODE.addWithAlpha )
	self:addElement( f8_local2 )
	local f8_local3 = nil
	local f8_local4 = 0
	local f8_local5 = function ()
		f8_local4 = f8_local4 - 360
		local f9_local0 = f8_local2:SetZRotation( f8_local4, 1100000 )
		f9_local0.onComplete = f8_local3
	end
	
	f8_local5()
	f8_local5 = LUI.UIImage.new( {
		material = RegisterMaterial( "ops_map_scr_base_rings_1" ),
		topAnchor = true,
		bottomAnchor = false,
		leftAnchor = true,
		rightAnchor = false,
		top = 0,
		height = 1,
		left = 0,
		width = 1
	} )
	f8_local5:SetupInWorldElement( {
		entityNum = f8_arg0,
		entityTag = f0_local1
	} )
	f8_local5:SetDepthTestEnabled( false )
	f8_local5:SetFollowTagAngles( true )
	f8_local5:SetTagSpacePitch( Engine.GetDvarFloat( "opsMap_pitch" ) )
	f8_local5:SetTagSpaceYaw( Engine.GetDvarFloat( "opsMap_yaw" ) )
	f8_local5:SetTagSpaceRoll( Engine.GetDvarFloat( "opsMap_roll" ) - 90 )
	f8_local5:SetTagSpacePosition( Engine.GetDvarFloat( "opsMap_positionFromRefEnt" ), 0, 0 )
	f8_local5:SetInWorldScale( f8_local0 )
	f8_local5:SetBlendMode( BLEND_MODE.addWithAlpha )
	f8_local5:SetZRotation( 180 )
	self:addElement( f8_local5 )
	local f8_local6 = nil
	local f8_local7 = 180
	local f8_local8 = function ()
		f8_local7 = f8_local7 - 360
		local f10_local0 = f8_local5:SetZRotation( f8_local7, 700000 )
		f10_local0.onComplete = f8_local6
	end
	
	f8_local8()
	return self
end

local f0_local11 = function ( f11_arg0 )
	local f11_local0 = Engine.GetDvarFloat( "opsMap_contentWidth" )
	local f11_local1 = 0.1
	local self = LUI.UIElement.new( {
		topAnchor = true,
		bottomAnchor = false,
		leftAnchor = true,
		rightAnchor = false,
		top = 0,
		height = 1,
		left = 0,
		width = 1,
		alpha = f11_local1
	} )
	local f11_local3 = LUI.UIElement.new()
	self:addElement( f11_local3 )
	local f11_local4 = LUI.UIImage.new( {
		material = RegisterMaterial( "ops_map_scr_base_rings_2" )
	} )
	f11_local4:SetAnchors( 0, 0.5, 0, 0.5 )
	f11_local3:addElement( f11_local4 )
	local f11_local5 = LUI.UIImage.new( {
		material = RegisterMaterial( "ops_map_scr_base_rings_2" )
	} )
	f11_local5:SetAnchors( 1, 0.5, 0, 0.5 )
	f11_local3:addElement( f11_local5 )
	local f11_local6 = LUI.UIImage.new( {
		material = RegisterMaterial( "ops_map_scr_base_rings_2" )
	} )
	f11_local6:SetAnchors( 1, 0.5, 1, 0.5 )
	f11_local3:addElement( f11_local6 )
	local f11_local7 = LUI.UIImage.new( {
		material = RegisterMaterial( "ops_map_scr_base_rings_2" )
	} )
	f11_local7:SetAnchors( 0, 0.5, 1, 0.5 )
	f11_local3:addElement( f11_local7 )
	local f11_local8 = LUI.UIElement.new()
	f11_local8:SetAlpha( 0 )
	self:addElement( f11_local8 )
	local f11_local9 = LUI.UIImage.new( {
		material = RegisterMaterial( "ops_map_scr_base_rings_zoom_1" )
	} )
	f11_local9:SetAnchors( 0, 0.5, 0, 0.5 )
	f11_local8:addElement( f11_local9 )
	local f11_local10 = LUI.UIImage.new( {
		material = RegisterMaterial( "ops_map_scr_base_rings_zoom_1" )
	} )
	f11_local10:SetAnchors( 1, 0.5, 0, 0.5 )
	f11_local8:addElement( f11_local10 )
	local f11_local11 = LUI.UIImage.new( {
		material = RegisterMaterial( "ops_map_scr_base_rings_zoom_1" )
	} )
	f11_local11:SetAnchors( 1, 0.5, 1, 0.5 )
	f11_local8:addElement( f11_local11 )
	local f11_local12 = LUI.UIImage.new( {
		material = RegisterMaterial( "ops_map_scr_base_rings_zoom_1" )
	} )
	f11_local12:SetAnchors( 0, 0.5, 1, 0.5 )
	f11_local8:addElement( f11_local12 )
	self.id = "rings"
	self:SetupInWorldElement( {
		entityNum = f11_arg0,
		entityTag = f0_local1
	} )
	self:SetDepthTestEnabled( false )
	self:SetFollowTagAngles( true )
	self:SetTagSpacePitch( Engine.GetDvarFloat( "opsMap_pitch" ) )
	self:SetTagSpaceYaw( Engine.GetDvarFloat( "opsMap_yaw" ) )
	self:SetTagSpaceRoll( Engine.GetDvarFloat( "opsMap_roll" ) - 90 )
	self:SetTagSpacePosition( Engine.GetDvarFloat( "opsMap_positionFromRefEnt" ), 0, 0 )
	self:SetInWorldScale( f11_local0 )
	self:SetBlendMode( BLEND_MODE.addWithAlpha )
	self:addEventHandler( "zoomed_in", function ( f12_arg0, f12_arg1 )
		f11_local3:SetAlpha( 0, 500 )
		f11_local8:SetAlpha( 0.1, 500 )
	end )
	self:addEventHandler( "zoomed_out", function ( f13_arg0, f13_arg1 )
		f11_local3:SetAlpha( 1, 500 )
		f11_local8:SetAlpha( 0, 500 )
	end )
	self:SetAlpha( 0 )
	self:RegisterAnimationSequence( "on", {
		{
			function ()
				return self:SetAlpha( f11_local1 )
			end,
			function ()
				return self:SetAlpha( 0, 20 )
			end,
			function ()
				return self:SetAlpha( 0, math.random( 20, 50 ) )
			end,
			function ()
				return self:SetAlpha( f11_local1, 20 )
			end,
			function ()
				return self:SetAlpha( 0, 20 )
			end,
			function ()
				return self:SetAlpha( 0, math.random( 20, 50 ) )
			end,
			function ()
				return self:SetAlpha( f11_local1, 60 )
			end
		}
	} )
	self:AnimateSequence( "on" )
	return self
end

local f0_local12 = function ()
	local f21_local0 = 0.15
	local f21_local1 = 0.4
	local self = LUI.UIElement.new( {
		topAnchor = false,
		bottomAnchor = false,
		leftAnchor = false,
		rightAnchor = false,
		top = -64,
		bottom = 64,
		left = -64,
		right = 64
	} )
	self:addElement( LUI.UIImage.new( {
		material = RegisterMaterial( "ops_cursor_middle_1" ),
		topAnchor = true,
		bottomAnchor = true,
		leftAnchor = true,
		rightAnchor = true,
		top = 0,
		bottom = 0,
		left = 0,
		right = 0
	} ) )
	local f21_local3 = LUI.UIImage.new( {
		material = RegisterMaterial( "ops_cursor_big_notches_1" ),
		topAnchor = true,
		bottomAnchor = true,
		leftAnchor = true,
		rightAnchor = true,
		top = 0,
		bottom = 0,
		left = 0,
		right = 0,
		scale = 0.1
	} )
	self:addElement( f21_local3 )
	local f21_local4 = LUI.UIImage.new( {
		material = RegisterMaterial( "ops_cursor_small_notches_1" ),
		topAnchor = true,
		bottomAnchor = true,
		leftAnchor = true,
		rightAnchor = true,
		top = 0,
		bottom = 0,
		left = 0,
		right = 0,
		scale = 0
	} )
	self:addElement( f21_local4 )
	local f21_local5 = function ()
		f21_local4:SetZRotation( 90, 200, LUI.EASING.inOutCubic )
		f21_local3:SetZRotation( 90, 200, LUI.EASING.inOutCubic )
		f21_local4:SetScale( 0, 200, LUI.EASING.inOutQuadratic )
		f21_local3:SetScale( 0, 200, LUI.EASING.inOutQuadratic )
		self:SetScale( -0.3, 200, LUI.EASING.inOutQuadratic )
	end
	
	local f21_local6 = function ()
		f21_local4:SetZRotation( 180, 200, LUI.EASING.inOutCubic )
		f21_local3:SetZRotation( 180, 200, LUI.EASING.inOutCubic )
		f21_local4:SetScale( 0.3, 200, LUI.EASING.inOutQuadratic )
		f21_local3:SetScale( 0.3, 200, LUI.EASING.inOutQuadratic )
		local f23_local0 = self:SetScale( 0, 200, LUI.EASING.inOutQuadratic )
		f23_local0.onComplete = function ()
			f21_local3:SetZRotation( 0 )
			f21_local4:SetZRotation( 0 )
		end
		
	end
	
	local f21_local7 = 0.5
	local f21_local8 = LUI.UIElement.new( {
		topAnchor = true,
		bottomAnchor = true,
		leftAnchor = false,
		rightAnchor = true,
		top = 0,
		bottom = 0,
		left = -15,
		right = -15,
		alpha = f21_local7
	} )
	self:addElement( f21_local8 )
	local f21_local9 = function ( f25_arg0 )
		if f25_arg0 and not f21_local8.isOff then
			return 
		else
			f21_local8:SetAlpha( f21_local7 )
			local f25_local0 = f21_local8:SetAlpha( 0, 120 )
			f25_local0.onComplete = function ()
				f21_local8:SetAlpha( f21_local7 )
				f25_local0 = f21_local8:SetAlpha( 0, 120 )
				f25_local0.onComplete = function ()
					f21_local8:SetAlpha( f21_local7 )
					f21_local8.isOff = not f25_arg0
					if f21_local8.isOff then
						f21_local8:SetAlpha( 0, 120 )
					end
				end
				
			end
			
		end
	end
	
	f21_local8:addElement( LUI.UIImage.new( {
		material = RegisterMaterial( "white" ),
		topAnchor = true,
		bottomAnchor = true,
		leftAnchor = false,
		rightAnchor = false,
		top = 0,
		bottom = 0,
		left = -0.5,
		right = 0.5
	} ) )
	local f21_local10 = 4
	f21_local8:addElement( LUI.UIImage.new( {
		material = RegisterMaterial( "white" ),
		topAnchor = true,
		bottomAnchor = false,
		leftAnchor = false,
		rightAnchor = false,
		top = 0,
		bottom = f21_local10,
		left = -f21_local10 / 2,
		right = f21_local10 / 2
	} ) )
	f21_local8:addElement( LUI.UIImage.new( {
		material = RegisterMaterial( "white" ),
		topAnchor = false,
		bottomAnchor = true,
		leftAnchor = false,
		rightAnchor = false,
		top = -f21_local10,
		bottom = 0,
		left = -f21_local10 / 2,
		right = f21_local10 / 2
	} ) )
	self:registerEventHandler( "ops_map_focus", function ( element, event )
		assert( event.poiData )
		if event.poiData.category ~= "cluster" then
			f21_local9( false )
			f21_local5()
			element.focused = true
		end
	end )
	self:registerEventHandler( "ops_map_unfocus", function ( element, event )
		if element.focused then
			f21_local9( true )
			f21_local6()
			element.focused = false
		end
	end )
	local f21_local11 = LUI.DataSourceInControllerModel.new( "cg.SP.opsMap.zoom" )
	f21_local11 = f21_local11:GetModel( f0_local0 )
	local f21_local12 = nil
	self:SubscribeToModel( f21_local11, function ( f30_arg0 )
		local f30_local0 = DataModel.GetModelValue( f30_arg0 )
		local f30_local1 = f21_local1 - f30_local0 * (f21_local1 - f21_local0)
		f21_local8:SetTopAnchor( 0.5 - f30_local1 / 2 )
		f21_local8:SetBottomAnchor( 0.5 - f30_local1 / 2 )
		if f21_local12 and f21_local12 <= 0.05 and f30_local0 >= 0.05 then
			Engine.PlaySound( "ui_map_zoom" )
		end
		f21_local12 = f30_local0
		if self:GetCurrentMenu() then
			if f0_local2 < f30_local0 then
				AddZoomOutPrompt( self )
			else
				AddBackOutPrompt( self )
			end
		end
	end )
	self:SetAlpha( 0 )
	self:RegisterAnimationSequence( "turnOn", {
		{
			function ()
				return self:SetAlpha( 0, 1500 )
			end,
			function ()
				return self:SetAlpha( 1, 20 )
			end,
			function ()
				return self:SetAlpha( 0, 20 )
			end,
			function ()
				return self:SetAlpha( 0, 30 )
			end,
			function ()
				return self:SetAlpha( 1, 20 )
			end,
			function ()
				return self:SetAlpha( 0, 30 )
			end,
			function ()
				return self:SetAlpha( 0, 60 )
			end,
			function ()
				return self:SetAlpha( 1, 20 )
			end
		}
	} )
	self:AnimateSequence( "turnOn" )
	return self
end

local f0_local13 = function ( f39_arg0, f39_arg1, f39_arg2, f39_arg3 )
	if f39_arg3[f39_arg2.name] ~= f0_local4.locked then
		local self = LUI.UIImage.new( {
			material = RegisterMaterial( f39_arg2.domZoneImage ),
			topAnchor = true,
			bottomAnchor = false,
			leftAnchor = true,
			rightAnchor = false,
			top = 0,
			height = 1,
			left = 0,
			width = 1,
			alpha = 0.04
		} )
		self:SetupInWorldElement( {
			entityNum = f39_arg0,
			entityTag = f0_local1
		} )
		self:SetDepthTestEnabled( false )
		self:SetFollowTagAngles( true )
		self:SetTagSpacePitch( Engine.GetDvarFloat( "opsMap_pitch" ) )
		self:SetTagSpaceYaw( Engine.GetDvarFloat( "opsMap_yaw" ) )
		self:SetTagSpaceRoll( Engine.GetDvarFloat( "opsMap_roll" ) - 90 )
		local f39_local1, f39_local2, f39_local3 = OpsMap.PolarToCartesian( f0_local0, f39_arg2.r, f39_arg2.theta, f39_arg2.z, 1 )
		self:SetTagSpacePosition( f39_local1 + Engine.GetDvarFloat( "opsMap_positionFromRefEnt" ), f39_local2, f39_local3 )
		self:SetInWorldScale( Engine.GetDvarFloat( "opsMap_contentWidth" ) * f39_arg2.domScale )
		if f39_arg3[f39_arg2.name] == f0_local4.complete then
			self:SetRGBFromTable( SWATCHES.OpsMap.DomFriendly, 0 )
		else
			self:SetRGBFromTable( SWATCHES.OpsMap.DomEnemy, 0 )
		end
		f39_arg1:addElement( self )
	end
end

local f0_local14 = nil
f0_local14 = function ( f40_arg0 )
	local f40_local0 = 0
	for f40_local4, f40_local5 in ipairs( f0_local5 ) do
		if f40_local5.orbits ~= nil and f40_local5.orbits == f40_arg0.name then
			if f40_local5.category == "mission" then
				f40_local0 = f40_local0 + 1
			else
				f40_local0 = f40_local0 + f0_local14( f40_local5 )
			end
		end
	end
	return f40_local0
end

local f0_local15 = function ( f41_arg0 )
	if #f41_arg0 == 0 then
		return nil
	end
	for f41_local3, f41_local4 in ipairs( f0_local5 ) do
		if f41_local4.name == f41_arg0 then
			return f41_local4
		end
	end
	DebugPrint( "*** FindPOI - Couldn't find: " .. tostring( f41_arg0 ) )
	return nil
end

local f0_local16 = nil
f0_local16 = function ( f42_arg0 )
	local f42_local0 = Engine.GetDvarFloat( "opsMap_contentWidth" )
	local f42_local1 = 0
	local f42_local2 = 0
	local f42_local3 = 0
	if f42_arg0.orbits ~= nil then
		local f42_local4 = f0_local15( f42_arg0.orbits )
		if f42_local4 ~= nil then
			local f42_local5 = f42_local4.cartesianX
			local f42_local6 = f42_local4.cartesianY
			f42_local3 = f42_local4.cartesianZ
			f42_local2 = f42_local6
			f42_local1 = f42_local5
			f42_local0 = f42_local4.scale
		end
	end
	f42_arg0.cartesianX, f42_arg0.cartesianY, f42_arg0.cartesianZ = OpsMap.PolarToCartesian( f0_local0, f42_arg0.r, f42_arg0.theta, f42_arg0.z, 1 )
	f42_arg0.cartesianX = f42_arg0.cartesianX + f42_local1
	f42_arg0.cartesianY = f42_arg0.cartesianY + f42_local2
	f42_arg0.cartesianZ = f42_arg0.cartesianZ + f42_local3
	return f42_arg0.cartesianX, f42_arg0.cartesianY, f42_arg0.cartesianZ
end

function AddSelectPrompt( f43_arg0 )
	local f43_local0 = f43_arg0:GetCurrentMenu()
	assert( f43_local0 )
	f43_local0:processEvent( {
		name = "add_button_helper_text",
		button_ref = "button_primary",
		helper_text = Engine.Localize( "LUA_MENU_SELECT" ),
		clickable = false,
		side = "right"
	} )
end

function RemoveSelectPrompt( f44_arg0 )
	local f44_local0 = f44_arg0:GetCurrentMenu()
	assert( f44_local0 )
	f44_local0:processEvent( {
		name = "add_button_helper_text",
		button_ref = "button_primary",
		helper_text = "",
		clickable = false,
		side = "right"
	} )
end

function AddBackOutPrompt( f45_arg0 )
	local f45_local0 = f45_arg0:GetCurrentMenu()
	assert( f45_local0 )
	f45_local0:processEvent( {
		name = "add_button_helper_text",
		button_ref = "button_secondary",
		helper_text = Engine.Localize( "MENU_BACK" ),
		clickable = false,
		side = "right"
	} )
end

function AddZoomOutPrompt( f46_arg0 )
	local f46_local0 = f46_arg0:GetCurrentMenu()
	assert( f46_local0 )
	f46_local0:processEvent( {
		name = "add_button_helper_text",
		button_ref = "button_secondary",
		helper_text = Engine.Localize( "OPS_MAP_ZOOM_OUT" ),
		clickable = false,
		side = "right"
	} )
end

local f0_local17 = function ( f47_arg0, f47_arg1 )
	if Engine.IsVideoPlaying() then
		return 
	end
	local f47_local0 = f47_arg0.poi
	local f47_local1 = nil
	if f47_local0.category == "cluster" then
		f47_local1 = f0_local14( f47_local0 )
	end
	local f47_local2
	if f47_local0.map == nil or #f47_local0.map <= 0 then
		f47_local2 = false
	else
		f47_local2 = true
	end
	if f47_local2 then
		assert( f47_arg0.missionPopup )
		f47_arg0.missionPopup:processEvent( {
			name = "populate",
			poi = f47_local0
		} )
		f47_arg0.missionPopup:processEvent( {
			name = "slide_in"
		} )
	else
		assert( f47_arg0.sidePane )
		f47_arg0.sidePane:processEvent( {
			name = "populate",
			poi = f47_local0,
			type1missions = f47_local1
		} )
		f47_arg0.sidePane:processEvent( {
			name = "slide_in"
		} )
	end
	if f47_local0.showNameWhen == "hover" then
		f47_arg0.nameElement:SetAlpha( 1, 200 )
	end
	if f47_local0.category ~= "cluster" then
		Engine.PlayRumble( f0_local0, "ops_map_hover" )
	end
	if f47_local0.category == "cluster" or f47_local2 then
		AddSelectPrompt( f47_arg0 )
	else
		RemoveSelectPrompt( f47_arg0 )
	end
end

local f0_local18 = function ( f48_arg0, f48_arg1 )
	local f48_local0 = f48_arg0.poi
	assert( f48_arg0.sidePane )
	f48_arg0.sidePane:processEvent( {
		name = "slide_out"
	} )
	f48_arg0.missionPopup:processEvent( {
		name = "slide_out"
	} )
	if f48_local0.showNameWhen == "hover" then
		f48_arg0.nameElement:SetAlpha( 0, 200 )
	end
	RemoveSelectPrompt( f48_arg0 )
end

local f0_local19 = function ( f49_arg0, f49_arg1 )
	local f49_local0 = f49_arg1.scale
	local self = LUI.UIButton.new( {
		topAnchor = false,
		bottomAnchor = false,
		leftAnchor = false,
		rightAnchor = false,
		top = -f49_local0 / 2,
		bottom = f49_local0 / 2,
		left = -f49_local0 / 2,
		right = f49_local0 / 2
	} )
	self:setGainFocusSFX( nil )
	self:setActionSFX( nil )
	self.poi = f49_arg1
	local f49_local2, f49_local3, f49_local4 = f0_local16( f49_arg1 )
	f49_local2 = f49_local2 + Engine.GetDvarFloat( "opsMap_positionFromRefEnt" )
	if #f49_arg1.orbits > 0 and f49_arg1.category == "moon" then
		local f49_local5 = 0.8
		local f49_local6, f49_local7, f49_local8 = f0_local16( f0_local15( f49_arg1.orbits ) )
		local f49_local9 = LUI.UIImage.new( {
			material = RegisterMaterial( "ops_map_scr_orbit_ring_1" ),
			topAnchor = false,
			bottomAnchor = false,
			leftAnchor = false,
			rightAnchor = false,
			top = 0,
			height = 1,
			left = 0,
			width = 1,
			alpha = f49_local5
		} )
		f49_local9:SetupInWorldElement( {
			entityNum = f49_arg0,
			entityTag = f0_local1
		} )
		f49_local9:SetDepthTestEnabled( false )
		f49_local9:SetFollowTagAngles( true )
		f49_local9:SetTagSpacePosition( f49_local6 + Engine.GetDvarFloat( "opsMap_positionFromRefEnt" ), f49_local7, f49_local8 )
		local f49_local10, f49_local11, f49_local12 = f0_local16( {
			orbits = f49_arg1.orbits,
			r = f49_arg1.r * (1 + f49_arg1.theta),
			theta = 0,
			z = f49_arg1.r * (1 - f49_arg1.theta)
		} )
		local f49_local13, f49_local14, f49_local15 = OpsMap.GetOrbitRingAngles( f49_local6, f49_local7, f49_local8, f49_local2 - Engine.GetDvarFloat( "opsMap_positionFromRefEnt" ), f49_local3, f49_local4, f49_local10, f49_local11, f49_local12 )
		f49_local9:SetTagSpacePitch( f49_local13 )
		f49_local9:SetTagSpaceYaw( f49_local14 )
		f49_local9:SetTagSpaceRoll( f49_local15 )
		f49_local9:SetInWorldScale( Engine.GetDvarFloat( "opsMap_contentWidth" ) * f49_arg1.r + 0.08 )
		f49_local9:SetBlendMode( BLEND_MODE.addWithAlpha )
		self:addElement( f49_local9 )
		f49_local9:registerEventHandler( "zoomed_in", function ( element, event )
			local f50_local0 = element:Wait( 40 + math.random( 0, 300 ) )
			f50_local0.onComplete = function ()
				element:SetAlpha( 0, 50 )
			end
			
		end )
		f49_local9:registerEventHandler( "zoomed_out", function ( element, event )
			local f52_local0 = element:Wait( 40 + math.random( 0, 300 ) )
			f52_local0.onComplete = function ()
				element:SetAlpha( f49_local5, 50 )
			end
			
		end )
		local f49_local16 = nil
		local f49_local17 = 0
		local f49_local18
		if math.random() > 0.5 then
			f49_local18 = 1
			if not f49_local18 then
			
			else
				local f49_local19 = function ()
					f49_local17 = f49_local17 + f49_local18 * 360
					local f54_local0 = f49_local9:SetZRotation( f49_local17, 350000 )
					f54_local0.onComplete = f49_local16
				end
				
				f49_local19()
			end
		end
		f49_local18 = -1
	end
	local f49_local5 = 0
	local f49_local6 = 5000
	local f49_local7
	if f49_arg1.map == nil or #f49_arg1.map <= 0 then
		f49_local7 = false
	else
		f49_local7 = true
	end
	local f49_local8 = f49_local7 and string.match( f49_arg1.map, "^sa_" )
	local f49_local9 = f49_local7 and string.match( f49_arg1.map, "^ja_" )
	if f49_local7 and DataSources.inGame.SP.player.opsmapMissionStateData[f49_arg1.map] ~= nil then
		f49_arg1.missionState = DataSources.inGame.SP.player.opsmapMissionStateData[f49_arg1.map]:GetValue( f0_local0 )
		f49_arg1.missionProbability = DataSources.inGame.SP.player.missionProbability[f49_arg1.map]:GetValue( f0_local0 )
	end
	local f49_local10 = f49_arg1.missionState == "locked"
	local f49_local11 = f49_arg1.missionState == "complete"
	if f49_local10 then
		return poiRef, self
	elseif f49_local7 then
		f49_local5 = 0.7
		f49_local6 = f49_local5
		if f49_local8 or f49_local9 then
			local f49_local12 = f49_arg1.imageCloseUp
			if isMissionComplete and #f49_arg1.imageComplete > 0 then
				f49_local12 = f49_arg1.imageComplete
			end
			if f49_local12 then
				local f49_local13 = LUI.UIElement.new()
				f49_local13.id = "zoomedIcon"
				f49_local13:SetupAnchoredElement( {
					entityNum = f49_arg0,
					entityTag = f0_local1,
					naturalDistance = Engine.GetDvarFloat( "opsMap_zoomFurthest" ),
					minScale = 0,
					maxScale = 5000
				} )
				f49_local13:SetTagSpacePosition( f49_local2, f49_local3, f49_local4 )
				self:addElement( f49_local13 )
				local f49_local14 = LUI.UIImage.new( {
					material = RegisterMaterial( f49_local12 ),
					topAnchor = false,
					bottomAnchor = false,
					leftAnchor = false,
					rightAnchor = false,
					top = -3,
					bottom = 3,
					left = -6,
					right = 6
				} )
				f49_local14:SetScale( 0.75 )
				f49_local14:SetBlendMode( BLEND_MODE.addWithAlpha )
				f49_local14:SetAlpha( 0 )
				f49_local14.id = "icon"
				f49_local13:addElement( f49_local14 )
				f49_local14:registerEventHandler( "zoomed_in", function ( element, event )
					element:SetAlpha( 1, 50 )
				end )
				f49_local14:registerEventHandler( "zoomed_out", function ( element, event )
					element:SetAlpha( 0, 50 )
				end )
			end
		end
	end
	local f49_local12 = LUI.UIElement.new()
	f49_local12.id = "realScale"
	f49_local12:SetupAnchoredElement( {
		entityNum = f49_arg0,
		entityTag = f0_local1,
		naturalDistance = Engine.GetDvarFloat( "opsMap_zoomFurthest" ),
		minScale = f49_local5,
		maxScale = f49_local6
	} )
	f49_local12:SetTagSpacePosition( f49_local2, f49_local3, f49_local4 )
	self:addElement( f49_local12 )
	local f49_local13 = LUI.UIElement.new()
	f49_local13.id = "noScale"
	f49_local13:SetupAnchoredElement( {
		entityNum = f49_arg0,
		entityTag = f0_local1,
		naturalDistance = Engine.GetDvarFloat( "opsMap_zoomFurthest" ),
		minScale = 1,
		maxScale = 1
	} )
	f49_local13:SetTagSpacePosition( f49_local2, f49_local3, f49_local4 )
	self:addElement( f49_local13 )
	if f49_arg1.displayName and #f49_arg1.displayName > 0 then
		self.nameElement = MenuBuilder.BuildRegisteredType( "POIName", {
			poi = f49_arg1
		} )
		f49_local13:addElement( self.nameElement )
	end
	f49_local12:addElement( MenuBuilder.BuildRegisteredType( "POI", {
		poi = f49_arg1
	} ) )
	if #f49_arg1.map > 0 then
		if f49_local11 == false then
			self:addEventHandler( "button_action", function ( f57_arg0, f57_arg1 )
				if Game.GetOmnvar( "ui_opsmap_in_tutorial" ) then
					return 
				else
					local f57_local0 = {
						displayName = f49_arg1.missionName,
						mapName = f49_arg1.map
					}
					Engine.PlaySound( "ui_map_notification" )
					Engine.PlaySound( "ui_map_select" )
					LUI.FlowManager.RequestPopupMenu( nil, "OpsMapConfirmationPopup", false, f57_arg1.controller, false, f57_local0 )
				end
			end )
		end
	elseif f49_arg1.category ~= "cluster" then
		self:addEventHandler( "button_action", function ( f58_arg0, f58_arg1 )
			if Game.GetOmnvar( "ui_opsmap_in_tutorial" ) then
				return 
			else
				Engine.PlaySound( "ui_map_negative" )
			end
		end )
	elseif f49_arg1.category == "cluster" then
		self:addEventHandler( "button_action", function ( f59_arg0, f59_arg1 )
			if Game.GetOmnvar( "ui_opsmap_in_tutorial" ) then
				return 
			elseif f49_arg1.autoZoomValue ~= "" then
				OpsMap.AutoZoom( f0_local0, f49_arg1.autoZoomValue )
			end
		end )
	end
	local f49_local15
	if f49_arg1.category ~= "cluster" and f49_arg1.category ~= "planet" and f49_arg1.category ~= "mission" and f49_arg1.category ~= "moon" then
		f49_local15 = false
	else
		f49_local15 = true
	end
	local f49_local16 = f49_arg1.category ~= "cluster"
	local f49_local17 = f49_local15 and f49_arg1.category == "cluster"
	local f49_local18 = f49_local16
	self:addEventHandler( "zoomed_in", function ( f60_arg0, f60_arg1 )
		if f49_local16 then
			f60_arg0:SetAlpha( 1, 200 )
			if f60_arg0.nameElement and f49_arg1.showNameWhen == "zoomed_in" then
				f60_arg0.nameElement:SetAlpha( 1, 200 )
			end
		else
			f60_arg0:SetAlpha( 0, 200 )
		end
	end )
	if f49_local15 then
		self:SetAlpha( 1 )
		if self.nameElement and f49_arg1.showNameWhen ~= "always" then
			self.nameElement:SetAlpha( 0 )
		end
	else
		self:SetAlpha( 0 )
	end
	self:addEventHandler( "zoomed_out", function ( f61_arg0, f61_arg1 )
		if f49_local15 then
			f61_arg0:SetAlpha( 1, 200 )
			if f61_arg0.nameElement and f49_arg1.showNameWhen ~= "always" then
				f61_arg0.nameElement:SetAlpha( 0, 200 )
			end
		else
			f61_arg0:SetAlpha( 0, 200 )
		end
	end )
	self:addEventHandler( "button_over", f0_local17 )
	self:addEventHandler( "button_up", f0_local18 )
	local f49_local20 = OpsMap.RegisterPOI( f0_local0, f49_local2, f49_local3, f49_local4, f49_arg1.snapCursor == "1", tonumber( f49_arg1.focusRadius ), f49_local18, f49_local17 )
	if f49_local15 then
		local f49_local21 = f49_arg1.name and 100 or 300
		self:RegisterAnimationSequence( "on", {
			{
				function ()
					return self:SetAlpha( 0 )
				end,
				function ()
					return self:SetAlpha( 0, f49_local21 )
				end,
				function ()
					return self:SetAlpha( 1 )
				end,
				function ()
					return self:SetAlpha( 0, 20 )
				end,
				function ()
					return self:SetAlpha( 0, math.random( 20, 50 ) )
				end,
				function ()
					return self:SetAlpha( 1, 20 )
				end,
				function ()
					return self:SetAlpha( 0, 20 )
				end,
				function ()
					return self:SetAlpha( 0, math.random( 20, 50 ) )
				end,
				function ()
					return self:SetAlpha( 1, 60 )
				end
			}
		} )
		self:AnimateSequence( "on" )
	end
	return f49_local20, self
end

local f0_local20 = function ( f71_arg0 )
	while f71_arg0 ~= nil and f71_arg0 ~= "" do
		if string.find( f71_arg0, "Cluster" ) then
			return f71_arg0
		end
		f71_arg0 = Engine.TableLookup( CSV.OpsMap.file, CSV.OpsMap.cols.name, f71_arg0, CSV.OpsMap.cols.orbits )
	end
	return nil
end

local f0_local21 = function ( f72_arg0 )
	local f72_local0 = {}
	for f72_local4, f72_local5 in ipairs( f0_local5 ) do
		local f72_local6, f72_local7 = f0_local19( f72_arg0, f72_local5 )
		if f72_local6 ~= nil then
			f72_local0[f72_local6] = f72_local7
		end
	end
	return f72_local0
end

local f0_local22 = function ( f73_arg0 )
	local f73_local0, f73_local1, f73_local2, f73_local3 = GetTextDimensions( ToUpperCase( f73_arg0 ), f0_local3.Font, f0_local3.Height )
	return f73_local2 - f73_local0 + 5
end

local f0_local23 = function ( f74_arg0, f74_arg1 )
	local f74_local0 = f0_local22( f74_arg1 )
	local self = LUI.UIButton.new( {
		leftAnchor = true,
		rightAnchor = false,
		topAnchor = true,
		bottomAnchor = true,
		left = 0,
		width = f74_local0,
		top = 0,
		bottom = 0
	} )
	self.id = "helperTextButton"
	self.m_requireFocusType = FocusType.MouseOver
	local f74_local2 = LUI.UIHorizontalList.new( {
		leftAnchor = true,
		rightAnchor = false,
		topAnchor = true,
		bottomAnchor = true,
		left = 100,
		right = f74_local0,
		top = 0,
		bottom = 0,
		spacing = 5
	} )
	f74_local2.id = "helperHorizontalList"
	f74_arg0:SetAnchorsAndPosition( 0, 1, 0, 1, 0, -30, 120, 0 )
	f74_local2:addElement( f74_arg0 )
	local f74_local3 = LUI.UIText.new( {
		topAnchor = false,
		bottomAnchor = false,
		leftAnchor = true,
		rightAnchor = false,
		left = 0,
		width = f0_local22( f74_arg1 ),
		top = -f0_local3.Height / 3,
		bottom = f0_local3.Height / 3,
		font = f0_local3.Font,
		alignment = LUI.Alignment.Left
	} )
	f74_local3.id = "messageText"
	f74_local3:setText( f74_arg1 )
	f74_local3:SetOptOutRightToLeftAlignmentFlip( true )
	f74_local2:addElement( f74_local3 )
	self:addElement( f74_local2 )
	return self
end

local f0_local24 = function ()
	local self = LUI.UIElement.new()
	self:SetAnchors( 0, 0, 1, 0, 0 )
	self:SetLeft( _1080p * 0, 0 )
	self:SetRight( _1080p * -140, 0 )
	self:SetTop( _1080p * -180, 0 )
	self:SetBottom( _1080p * 0, 0 )
	self:SetCurvedRenderingX( 0.3 )
	self:SetCurvedRenderingY( -0.3 )
	self.id = "mapKey"
	local f75_local1 = 42
	local f75_local2 = 700
	local f75_local3 = 45
	local f75_local4 = LUI.UIImage.new( {
		material = RegisterMaterial( "widg_gradient_right_to_left" ),
		topAnchor = true,
		bottomAnchor = false,
		leftAnchor = false,
		rightAnchor = true,
		top = f75_local3,
		bottom = f75_local3 + f75_local1,
		left = -f75_local2,
		right = 100
	} )
	f75_local4:SetAlpha( 0.1 )
	self:addElement( f75_local4 )
	local f75_local5 = -35
	if IsLanguageArabic() then
		f75_local5 = -70
	end
	local f75_local6 = LUI.UIHorizontalList.new( {
		leftAnchor = true,
		rightAnchor = true,
		topAnchor = true,
		bottomAnchor = true,
		left = 0,
		right = f75_local5,
		top = 5,
		bottom = 0,
		alignment = LUI.Alignment.Right,
		spacing = 20
	} )
	f75_local6.id = "buttonHelperRightList"
	local f75_local7 = MenuBuilder.BuildRegisteredType( "OpsMapIconJA" )
	local f75_local8 = MenuBuilder.BuildRegisteredType( "OpsMapIconSA" )
	local f75_local9 = MenuBuilder.BuildRegisteredType( "OpsMapIconML" )
	f75_local7:SetScale( -0.6 )
	f75_local8:SetScale( -0.6 )
	f75_local9:SetScale( -0.5 )
	f75_local6:addElement( f0_local23( f75_local7, Engine.Localize( "MENU_SP_JACKAL_KEY" ) ) )
	f75_local6:addElement( f0_local23( f75_local8, Engine.Localize( "MENU_SP_ASSAULT_KEY" ) ) )
	f75_local6:addElement( f0_local23( f75_local9, Engine.Localize( "MENU_SP_MISSION_KEY" ) ) )
	self:addElement( f75_local6 )
	return self
end

local f0_local25 = function ()
	local f76_local0 = MenuBuilder.BuildRegisteredType( "button_helper_text_main" )
	f76_local0.id = "buttonHelperText"
	f76_local0:SetAnchors( 0, 0, 1, 0, 0 )
	f76_local0:SetLeft( _1080p * 0, 0 )
	f76_local0:SetRight( _1080p * 0, 0 )
	f76_local0:SetTop( _1080p * -65, 0 )
	f76_local0:SetBottom( _1080p * 0, 0 )
	f76_local0:AddButtonHelperTextToElement( f76_local0, {
		helper_text = Engine.Localize( "MENU_BACK" ),
		button_ref = "button_secondary",
		side = "right",
		clickable = false
	} )
	f76_local0:AddButtonHelperTextToElement( f76_local0, {
		helper_text = Engine.Localize( "OPS_MAP_TOGGLE_MAP_KEY" ),
		button_ref = "button_alt1",
		side = "right",
		clickable = false
	} )
	f76_local0:AddButtonHelperTextToElement( f76_local0, {
		helper_text = Engine.Localize( "OPS_MAP_TOGGLE_BUTTON_HELPER" ),
		button_ref = "button_alt2",
		side = "right",
		clickable = false
	} )
	f76_local0:AddButtonHelperTextToElement( f76_local0, {
		helper_text = Engine.Localize( "OPS_MAP_ZOOM" ),
		button_ref = "button_stickr_updown_noswap",
		side = "right",
		clickable = false
	} )
	return f76_local0
end

local f0_local26 = function ()
	f0_local0 = Engine.GetFirstActiveController()
	local f77_local0 = OpsMap.GetRefEntNumber( f0_local0 )
	local f77_local1 = {}
	local f77_local2 = {}
	local f77_local3 = {}
	OpsMap.Reset( f0_local0 )
	local f77_local4 = Engine.GetDvarFloat( "opsMap_refEntToInfinite" )
	local f77_local5 = Engine.GetDvarFloat( "opsMap_refEntToCloseStars" )
	local f77_local6 = Engine.GetDvarFloat( "opsMap_refEntToFarStars" )
	f77_local2.x, f77_local2.y, f77_local2.z = OpsMap.GetMapCenterPosition( f0_local0 )
	f77_local1.x, f77_local1.y, f77_local1.z = OpsMap.GetForwardVec( f0_local0 )
	local self = LUI.UIElement.new( {
		topAnchor = true,
		bottomAnchor = true,
		leftAnchor = true,
		rightAnchor = true,
		top = 0,
		bottom = 0,
		left = 0,
		right = 0
	} )
	self.id = "menu"
	local f77_local8 = LUI.UIBindButton.new()
	f77_local8.id = "bind"
	f77_local8:registerEventHandler( "button_secondary", function ( element, event )
		if not OpsMap.IsInputBlocked( f0_local0 ) and not Game.GetOmnvar( "ui_opsmap_in_tutorial" ) then
			local f78_local0 = LUI.DataSourceInControllerModel.new( "cg.SP.opsMap.zoom" )
			if f78_local0:GetValue( f0_local0 ) <= f0_local2 then
				Engine.PlaySound( "ui_map_exit" )
				element:dispatchEventToRoot( {
					name = "leave_opsmap",
					notify = "opsmap_cancel"
				} )
			else
				OpsMap.AutoZoom( f0_local0, 0 )
			end
		end
	end )
	f77_local8:registerEventHandler( "button_start", function ( element, event )
		if not OpsMap.IsInputBlocked( f0_local0 ) and not Game.GetOmnvar( "ui_opsmap_in_tutorial" ) then
			ACTIONS.PauseGame( element, true )
		end
	end )
	self:addElement( f77_local8 )
	local f77_local9 = f0_local9( f77_local0, f77_local4, "ops_map_scr_universe_bg_1", 1 )
	f77_local9.id = "background"
	self:addElement( f77_local9 )
	local f77_local10 = 3
	for f77_local11 = 1, f77_local10, 1 do
		self:addElement( f0_local8( f77_local0, f77_local5 + (f77_local6 - f77_local5) * (f77_local11 - 1) / (f77_local10 - 1), 3, f77_local1 ) )
	end
	local f77_local11 = f0_local10( f77_local0 )
	self:addElement( f77_local11 )
	local f77_local12 = f0_local11( f77_local0 )
	self:addElement( f77_local12 )
	local f77_local13 = LUI.UIElement.new()
	f77_local13.id = "DominationZones"
	self:addElement( f77_local13 )
	local f77_local14 = LUI.UIElement.new( {
		topAnchor = true,
		bottomAnchor = true,
		leftAnchor = true,
		rightAnchor = true,
		top = 0,
		bottom = 0,
		left = 0,
		right = 0
	} )
	f77_local14.id = "poisElement"
	self:addElement( f77_local14 )
	local f77_local15 = LUI.UIImage.new( {
		material = RegisterMaterial( "ops_map_scr_dot_grid" )
	} )
	f77_local15:SetAnchors( 0, 0.5, 0, 0 )
	self:addElement( f77_local15 )
	local f77_local16 = LUI.UIImage.new( {
		material = RegisterMaterial( "ops_map_scr_dot_grid" )
	} )
	f77_local16:SetAnchors( 1, 0.5, 0, 0 )
	self:addElement( f77_local16 )
	local f77_local17 = f0_local12()
	self:addElement( f77_local17 )
	local f77_local18 = MenuBuilder.BuildRegisteredType( "OpsMapSidePane" )
	self:addElement( f77_local18 )
	local f77_local19 = MenuBuilder.BuildRegisteredType( "MissionPopup" )
	self:addElement( f77_local19 )
	local f77_local20 = f0_local24()
	self:addElement( f77_local20 )
	local f77_local21 = MenuBuilder.BuildRegisteredType( "OpsMapOverlay2D" )
	self:addElement( f77_local21 )
	local f77_local22 = MenuBuilder.BuildRegisteredType( "TutorialMessage" )
	f77_local22:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, 210, 236 )
	self:addElement( f77_local22 )
	local f77_local23 = MenuBuilder.BuildRegisteredType( "BinkWindow" )
	if Engine.IsPC() then
		f77_local23:setupLetterboxElement()
	end
	self:addElement( f77_local23 )
	local f77_local24 = LUI.UIImage.new()
	f77_local24:SetAlpha( 0 )
	f77_local24:setImage( RegisterMaterial( "cinematic" ) )
	f77_local24:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, -560, 560, -240, 240 )
	self:addElement( f77_local24 )
	local f77_local25 = f0_local25()
	self:addElement( f77_local25 )
	local f77_local26 = true
	f77_local8:registerEventHandler( "button_alt2", function ( element, event )
		f77_local26 = not f77_local26
		if f77_local26 then
			f77_local25:SetAlpha( 1 )
		else
			f77_local25:SetAlpha( 0 )
		end
	end )
	local f77_local27 = true
	f77_local8:registerEventHandler( "button_alt1", function ( element, event )
		f77_local27 = not f77_local27
		if f77_local27 then
			f77_local20:SetAlpha( 1 )
		else
			f77_local20:SetAlpha( 0 )
		end
	end )
	local f77_local28 = f0_local21( f77_local0 )
	local f77_local29 = {}
	for f77_local36, f77_local37 in ipairs( f0_local5 ) do
		if f77_local37.category == "mission" then
			local opsmapTutorialText = f0_local20( f77_local37.orbits )
			if opsmapTutorialText then
				local f77_local34 = DataSources.inGame.SP.player.opsmapMissionStateData[f77_local37.map]:GetValue( f0_local0 )
				local f77_local35 = f77_local29[opsmapTutorialText]
				if f77_local34 == "locked" then
					if f77_local35 == nil then
						f77_local29[opsmapTutorialText] = f0_local4.locked
					end
				end
				if f77_local34 == "complete" then
					if f77_local35 == nil or f77_local35 == f0_local4.locked then
						f77_local29[opsmapTutorialText] = f0_local4.complete
					end
				end
				f77_local29[opsmapTutorialText] = f0_local4.incomplete
			end
		end
	end
	for f77_local36, f77_local37 in ipairs( f0_local5 ) do
		if f77_local37.category == "cluster" then
			f0_local13( f77_local0, f77_local13, f77_local37, f77_local29 )
		end
	end
	for f77_local36, f77_local37 in pairs( f77_local28 ) do
		f77_local37.sidePane = f77_local18
		f77_local37.missionPopup = f77_local19
		f77_local14:addElement( f77_local37 )
	end
	self:registerEventHandler( "ops_map_zoom", function ( element, event )
		if event.zoomedIn then
			f77_local14:processEvent( {
				name = "zoomed_in"
			} )
			f77_local12:processEvent( {
				name = "zoomed_in"
			} )
			f77_local11:SetAlpha( 0, 500, LUI.EASING.inOutQuadratic )
			Engine.NotifyServer( "opsmap_zoomed_in", 1 )
		elseif not event.init then
			f77_local14:processEvent( {
				name = "zoomed_out"
			} )
			f77_local12:processEvent( {
				name = "zoomed_out"
			} )
			f77_local11:SetAlpha( 0.2, 1000, LUI.EASING.inOutQuadratic )
		end
		return true
	end )
	self:processEvent( {
		name = "ops_map_zoom",
		init = true
	} )
	self.getFirstInFocus = function ( f83_arg0 )
		return f83_arg0
	end
	
	self:registerEventHandler( "gain_focus", function ( element, event )
		return true
	end )
	self.processEvent = function ( f85_arg0, f85_arg1 )
		if f85_arg1.name ~= "mousemove" and f85_arg1.name ~= "gamepad_sticks" then
			return LUI.UIElement.processEvent( f85_arg0, f85_arg1 )
		else
			
		end
	end
	
	self:registerEventHandler( "restore_focus", function ( element, event )
		return true
	end )
	self:registerEventHandler( "gamepad_button", function ( element, event )
		return OpsMap.IsInputBlocked( f0_local0 )
	end )
	self:registerEventHandler( "mousedown", function ( element, event )
		if event.button and event.button == "left" then
			element:processEvent( {
				name = "gamepad_button",
				button = "primary",
				down = true
			} )
		end
		return true
	end )
	self:registerEventHandler( "ops_map_focus", function ( element, event )
		assert( event.POI )
		if f77_local28[event.POI] then
			event.poiData = f77_local28[event.POI].poi
			f77_local28[event.POI]:processEvent( {
				name = "gain_focus"
			} )
		end
		f77_local17:processEvent( event )
		return true
	end )
	self:registerEventHandler( "ops_map_unfocus", function ( element, event )
		assert( event.POI )
		if f77_local28[event.POI] then
			event.poiData = f77_local28[event.POI].poi
			f77_local28[event.POI]:processEvent( {
				name = "lose_focus"
			} )
		end
		f77_local17:processEvent( event )
		return true
	end )
	f77_local30 = LUI.UIImage.new( {
		material = RegisterMaterial( "white" ),
		red = 0,
		green = 0,
		blue = 0,
		alpha = 0
	} )
	self:addElement( f77_local30 )
	f77_local31 = function ( f91_arg0 )
		DataSources.inGame.SP.showBink:SetValue( f0_local0, false )
		local f91_local0 = f77_local30:SetAlpha( 1, 200 )
		f91_local0.onComplete = function ()
			Engine.NotifyServer( f91_arg0, 0 )
			local f92_local0 = f77_local30:SetAlpha( 1, 200 )
			f92_local0.onComplete = function ()
				self:removeElement( f77_local17 )
				self:removeElement( f77_local18 )
				self:removeElement( f77_local19 )
				self:removeElement( f77_local21 )
				self:removeElement( f77_local22 )
				self:removeElement( f77_local15 )
				self:removeElement( f77_local16 )
				local f93_local0 = f77_local30:SetAlpha( 0, 200 )
				f93_local0.onComplete = function ()
					LUI.FlowManager.RequestCloseAllMenus()
					LUI.FlowManager.RequestLeaveMenu( self )
				end
				
			end
			
		end
		
	end
	
	self:registerEventHandler( "leave_opsmap", function ( element, event )
		assert( event.notify )
		OpsMap.BlockInput( f0_local0, true )
		if event.map then
			local f95_local0 = event.map
			if f95_local0 then
				f95_local0 = string.match( event.map, "^sa_" )
				if not f95_local0 then
					f95_local0 = string.match( event.map, "^ja_" )
				end
			end
			Engine.NotifyServer( "opsmap_bink_" .. event.map, 0 )
			local f95_local1 = {
				titan = "sc_titan_world_cic_briefing",
				rogue = "sc_rogue_world_cic_briefing",
				prisoner = "sc_prisoner_world_cic_briefing",
				sa_wounded = "sc_assault_hud_wounded_briefing",
				sa_assassination = "sc_assault_hud_assassination_briefing",
				sa_empambush = "sc_assault_hud_empambush_briefing",
				sa_vips = "sc_assault_hud_vips_briefing",
				ja_spacestation = "sc_assault_ja_spacestation_briefing",
				ja_asteroid = "sc_assault_ja_asteroid_briefing",
				ja_mining = "sc_assault_ja_mining_briefing",
				ja_titan = "sc_assault_ja_titan_briefing",
				ja_wreckage = "sc_assault_ja_wreckage_briefing"
			}
			local f95_local2 = f95_local1[event.map]
			if f95_local2 and not Engine.GetDvarBool( "dev_opsmap_skip_bink" ) then
				Engine.SetDvarBool( "bg_cinematicFullscreen", false )
				Engine.PlayMenuVideo( f95_local2, 0, 0 )
				if f95_local0 then
					f77_local23:SetAlpha( 1 )
					f77_local24:SetAlpha( 0 )
					DataSources.inGame.SP.showBink:SetValue( f0_local0, true )
				else
					f77_local23:SetAlpha( 0 )
					f77_local24:SetAlpha( 1 )
				end
			end
		end
		local f95_local0 = nil
		local f95_local1 = function ()
			if Engine.IsVideoFinished() then
				return f77_local31( event.notify )
			else
				local f96_local0 = element:Wait( 100 )
				f96_local0.onComplete = f95_local0
			end
		end
		
		f95_local1()
		return true
	end )
	f77_local32 = 0.8
	f77_local36 = nil
	f77_local36 = LUI.UIImage.new()
	f77_local36.id = "DarkenOverlay"
	f77_local36:SetRGBFromInt( 0, 0 )
	f77_local36:SetAlpha( 0, 0 )
	self:addElement( f77_local36 )
	self:registerEventHandler( "popup_inactive", function ( element, event )
		f77_local36:SetAlpha( 0 )
		OpsMap.ClearFocusedPOI( f0_local0 )
	end )
	self:registerEventHandler( "popup_active", function ( element, event )
		f77_local36:SetAlpha( f77_local32 )
	end )
	f77_local37 = Game.GetMapName()
	if f77_local37 == "shipcrib_europa" or f77_local37 == "shipcrib_titan" then
		local opsmapTutorialText = MenuBuilder.BuildRegisteredType( "OpsmapTutorial", {
			controllerIndex = f0_local0
		} )
		opsmapTutorialText.id = "OpsmapTutorial"
		opsmapTutorialText:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, 0, 0 )
		self:addElement( opsmapTutorialText )
		self.opsmapTutorialText = opsmapTutorialText
		
		DebugPrint( "created_menu_tut" )
	end
	return self
end

MenuBuilder.registerType( "OpsMapConfirmationPopup", f0_local6 )
MenuBuilder.registerType( "OpsMap", f0_local26 )
LUI.FlowManager.DisableLetterboxForMenu( "OpsMap" )
LUI.FlowManager.DontBlockMouseMoveEventsForMenu( "OpsMap" )
LUI.FlowManager.DisableMousePointerForMenu( "OpsMap" )
LUI.FlowManager.AlwaysVisibleForMenu( "OpsMap" )
LockTable( _M )
