local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = "inGame.SP.loadouts.jackalDecalSelect"
f0_local1 = function ( f1_arg0 )
	return function ( f2_arg0, f2_arg1 )
		return f1_arg0.jackalSetup.jackalDecal:GetValue( f2_arg1 ) == f2_arg0
	end
	
end

f0_local2 = function ( f3_arg0 )
	return f3_arg0 == Cac.scannedSPItemStates.SCANNED
end

local f0_local3 = function ( f4_arg0 )
	local f4_local0
	if f4_arg0 ~= Cac.scannedSPItemStates.UNLOCKED then
		f4_local0 = f0_local2( f4_arg0 )
	else
		f4_local0 = true
	end
	return f4_local0
end

local f0_local4 = function ( f5_arg0, f5_arg1, f5_arg2 )
	assert( f5_arg2 )
	assert( f5_arg0.Decals )
	assert( f5_arg0.DecalImage )
	assert( f5_arg0.JackalDecalDetails )
	if Engine.IsDevelopmentBuild() and not f5_arg2.loadoutIndex then
		DebugPrint( "WARNING: Missing \"loadoutIndex\" option for JackalDecalSelect menu. Only OK after a MyChanges." )
		f5_arg2.loadoutIndex = 0
	end
	assert( f5_arg2.loadoutIndex )
	local f5_local0 = GetProgressionLoadoutDataSources()
	f5_arg0.loadoutDataSource = f5_local0:GetDataSourceAtIndex( f5_arg2.loadoutIndex )
	f5_local0 = {}
	for f5_local1 = 1, Engine.TableGetRowCount( CSV.jackalDecals.file ) - 1, 1 do
		table.insert( f5_local0, CSV.ReadRow( CSV.jackalDecals, f5_local1 ) )
	end
	local f5_local1 = LUI.DataSourceFromList.new( #f5_local0 )
	f5_local1.MakeDataSourceAtIndex = function ( f6_arg0, f6_arg1 )
		local f6_local0 = f5_local0[f6_arg1 + 1]
		local f6_local1 = LUI.DataSourceInGlobalModel.new( f0_local0 .. "." .. f6_arg1 .. ".ref", f6_local0.ref )
		local f6_local2 = DataSources.inGame.SP.player.jackalDecalState[f6_local0.ref]
		return {
			ref = f6_local1,
			name = LUI.DataSourceInGlobalModel.new( f0_local0 .. "." .. f6_arg1 .. ".name", f6_local0.name ),
			image = LUI.DataSourceInGlobalModel.new( f0_local0 .. "." .. f6_arg1 .. ".image", f6_local0.image ),
			fullImage = LUI.DataSourceInGlobalModel.new( f0_local0 .. "." .. f6_arg1 .. ".fullImage", f6_local0.fullImage ),
			desc = LUI.DataSourceInGlobalModel.new( f0_local0 .. "." .. f6_arg1 .. ".desc", f6_local0.desc ),
			isEquipped = f6_local1:Filter( "isEquipped", f0_local1( f5_arg0.loadoutDataSource ) ),
			isScanned = f6_local2:Filter( "isScanned", f0_local2 ),
			isUnlocked = f6_local2:Filter( "isUnlocked", f0_local3 ),
			stateDataSource = f6_local2,
			unlockText = LUI.DataSourceInGlobalModel.new( f0_local0 .. "." .. f6_arg1 .. ".unlockText", Engine.TableLookup( CSV.jackalDecals.file, CSV.jackalDecals.cols.ref, f6_local0.ref, CSV.jackalDecals.cols.unlockText ) )
		}
	end
	
	f5_local1.GetDefaultFocusIndex = function ()
		local f7_local0 = f5_arg0.loadoutDataSource.jackalSetup.jackalDecal:GetValue( f5_arg1 )
		assert( f7_local0 and #f7_local0 > 0 )
		for f7_local1 = 0, f5_local1:GetCountValue( f5_arg1 ) - 1, 1 do
			local f7_local4 = f5_local1:GetDataSourceAtIndex( f7_local1 )
			if f7_local0 == f7_local4.ref:GetValue( f5_arg1 ) then
				return f7_local1
			end
		end
	end
	
	f5_arg0.Decals:SetGridDataSource( f5_local1, f5_arg1 )
	f5_arg0.DecalImage:SubscribeToModelThroughElement( f5_arg0.Decals, "fullImage", function ()
		ACTIONS.AnimateSequence( f5_arg0, "UpdateImage" )
		local f8_local0 = f5_arg0.DecalImage
		local f8_local1 = f8_local0
		f8_local0 = f8_local0.setImage
		local f8_local2 = RegisterMaterial
		local f8_local3 = f5_arg0.Decals:GetDataSource()
		f8_local0( f8_local1, f8_local2( f8_local3.fullImage:GetValue( f5_arg1 ) ), 0 )
	end )
	f5_arg0.JackalDecalDetails:SetDataSourceThroughElement( f5_arg0.Decals, nil )
	f5_arg0.MenuTitle.MenuBreadcrumbs:setText( ToUpperCase( Engine.Localize( "LUA_MENU_MP_ARMORY" ) .. " / " .. Engine.Localize( "LUA_MENU_MP_LOADOUT_SELECT" ) .. " / " .. f5_arg0.loadoutDataSource.name:GetValue( f5_arg1 ) ), 0 )
end

function JackalDecalSelect( menu, controller )
	local self = LUI.UIElement.new()
	self.id = "JackalDecalSelect"
	self._animationSets = {}
	self._sequences = {}
	local f9_local1 = controller and controller.controllerIndex
	if not f9_local1 and not Engine.InFrontend() then
		f9_local1 = self:getRootController()
	end
	assert( f9_local1 )
	self:playSound( "menu_open" )
	local f9_local2 = self
	local Decals = nil
	
	Decals = LUI.UIDataSourceGrid.new( nil, {
		maxVisibleColumns = 2,
		maxVisibleRows = 6,
		controllerIndex = f9_local1,
		buildChild = function ()
			return MenuBuilder.BuildRegisteredType( "JackalDecal", {
				controllerIndex = f9_local1
			} )
		end,
		wrapX = false,
		wrapY = false,
		spacingX = _1080p * 6,
		spacingY = _1080p * 6,
		columnWidth = _1080p * 306,
		rowHeight = _1080p * 100.5,
		scrollingThresholdX = 1,
		scrollingThresholdY = 1,
		adjustSizeToContent = false,
		horizontalAlignment = LUI.Alignment.Left,
		verticalAlignment = LUI.Alignment.Top,
		springCoefficient = 400,
		maxVelocity = 5000
	} )
	Decals.id = "Decals"
	Decals:setUseStencil( true )
	Decals:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 146, _1080p * 764, _1080p * 216, _1080p * 849 )
	self:addElement( Decals )
	self.Decals = Decals
	
	local MenuTitle = nil
	
	MenuTitle = MenuBuilder.BuildRegisteredType( "MenuTitle", {
		controllerIndex = f9_local1
	} )
	MenuTitle.id = "MenuTitle"
	MenuTitle.MenuTitle:setText( Engine.Localize( "LUA_MENU_JACKAL_DECAL" ), 0 )
	MenuTitle.MenuBreadcrumbs:setText( LocalizeString( "LUA_MENU_LOADOUTS" ), 0 )
	MenuTitle.Icon:SetTop( _1080p * -10, 0 )
	MenuTitle.Icon:SetBottom( _1080p * 80, 0 )
	MenuTitle.Icon:setImage( RegisterMaterial( "icon_usna_symbol" ), 0 )
	MenuTitle:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 96, _1080p * 1056, _1080p * 54, _1080p * 134 )
	self:addElement( MenuTitle )
	self.MenuTitle = MenuTitle
	
	local ButtonHelperBar = nil
	
	ButtonHelperBar = MenuBuilder.BuildRegisteredType( "ButtonHelperBar", {
		controllerIndex = f9_local1
	} )
	ButtonHelperBar.id = "ButtonHelperBar"
	ButtonHelperBar:SetAnchorsAndPosition( 0, 0, 1, 0, 0, 0, _1080p * -85, 0 )
	self:addElement( ButtonHelperBar )
	self.ButtonHelperBar = ButtonHelperBar
	
	local JackalBase = nil
	
	JackalBase = LUI.UIImage.new()
	JackalBase.id = "JackalBase"
	JackalBase:setImage( RegisterMaterial( "icon_jackal_livery_base" ), 0 )
	JackalBase:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 838, _1080p * 1862, _1080p * 346, _1080p * 858 )
	self:addElement( JackalBase )
	self.JackalBase = JackalBase
	
	local DecalImage = nil
	
	DecalImage = LUI.UIImage.new()
	DecalImage.id = "DecalImage"
	DecalImage:SetDotPitchEnabled( true )
	DecalImage:SetDotPitchX( 0, 0 )
	DecalImage:SetDotPitchY( 0, 0 )
	DecalImage:SetDotPitchContrast( 0, 0 )
	DecalImage:SetDotPitchMode( 0 )
	DecalImage:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 838, _1080p * 1862, _1080p * 346, _1080p * 858 )
	DecalImage:SubscribeToModelThroughElement( self, "fullImage", function ()
		local f11_local0 = self:GetDataSource()
		f11_local0 = f11_local0.fullImage:GetValue( f9_local1 )
		if f11_local0 ~= nil then
			DecalImage:setImage( RegisterMaterial( f11_local0 ), 0 )
		end
	end )
	self:addElement( DecalImage )
	self.DecalImage = DecalImage
	
	local JackalDecalDetails = nil
	
	JackalDecalDetails = MenuBuilder.BuildRegisteredType( "JackalDecalDetails", {
		controllerIndex = f9_local1
	} )
	JackalDecalDetails.id = "JackalDecalDetails"
	JackalDecalDetails:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 780, _1080p * 1920, _1080p * 216, _1080p * 882 )
	self:addElement( JackalDecalDetails )
	self.JackalDecalDetails = JackalDecalDetails
	
	local DecalScrollbar = nil
	
	DecalScrollbar = MenuBuilder.BuildRegisteredType( "VerticalMinimalScrollbar", {
		controllerIndex = f9_local1
	} )
	DecalScrollbar.id = "DecalScrollbar"
	DecalScrollbar:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 130, _1080p * 147, _1080p * 216, _1080p * 849 )
	self:addElement( DecalScrollbar )
	self.DecalScrollbar = DecalScrollbar
	
	local ArrowUp = nil
	
	ArrowUp = MenuBuilder.BuildRegisteredType( "ArrowUp", {
		controllerIndex = f9_local1
	} )
	ArrowUp.id = "ArrowUp"
	ArrowUp:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 527.5, _1080p * 547.5, _1080p * 851, _1080p * 891 )
	self:addElement( ArrowUp )
	self.ArrowUp = ArrowUp
	
	local ArrowDown = nil
	
	ArrowDown = MenuBuilder.BuildRegisteredType( "ArrowDown", {
		controllerIndex = f9_local1
	} )
	ArrowDown.id = "ArrowDown"
	ArrowDown:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 362.5, _1080p * 382.5, _1080p * 850, _1080p * 890 )
	self:addElement( ArrowDown )
	self.ArrowDown = ArrowDown
	
	local ListCount = nil
	
	ListCount = LUI.UIText.new()
	ListCount.id = "ListCount"
	ListCount:setText( "1/15", 0 )
	ListCount:SetFontSize( 24 * _1080p )
	ListCount:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	ListCount:SetAlignment( LUI.Alignment.Center )
	ListCount:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 382.5, _1080p * 527.5, _1080p * 858, _1080p * 882 )
	self:addElement( ListCount )
	self.ListCount = ListCount
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		DecalImage:RegisterAnimationSequence( "UpdateImage", {
			{
				function ()
					return self.DecalImage:SetAlpha( 0, 0 )
				end,
				function ()
					return self.DecalImage:SetAlpha( 1, 30 )
				end,
				function ()
					return self.DecalImage:SetAlpha( 0, 30 )
				end,
				function ()
					return self.DecalImage:SetAlpha( 1, 30 )
				end,
				function ()
					return self.DecalImage:SetAlpha( 0, 30 )
				end,
				function ()
					return self.DecalImage:SetAlpha( 1, 30 )
				end
			},
			{
				function ()
					return self.DecalImage:SetDotPitchX( 52, 0 )
				end,
				function ()
					return self.DecalImage:SetDotPitchX( 0, 300 )
				end
			},
			{
				function ()
					return self.DecalImage:SetDotPitchY( 43, 0 )
				end,
				function ()
					return self.DecalImage:SetDotPitchY( 0, 300 )
				end
			},
			{
				function ()
					return self.DecalImage:SetDotPitchContrast( 0.8, 0 )
				end,
				function ()
					return self.DecalImage:SetDotPitchContrast( 0, 300 )
				end
			}
		} )
		self._sequences.UpdateImage = function ()
			DecalImage:AnimateSequence( "UpdateImage" )
		end
		
		JackalBase:RegisterAnimationSequence( "MenuOpen", {
			{
				function ()
					return self.JackalBase:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 720, _1080p * 1744, _1080p * 346, _1080p * 858, 0 )
				end,
				function ()
					return self.JackalBase:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 838, _1080p * 1862, _1080p * 346, _1080p * 858, 300, LUI.EASING.outQuadratic )
				end
			}
		} )
		DecalImage:RegisterAnimationSequence( "MenuOpen", {
			{
				function ()
					return self.DecalImage:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 720, _1080p * 1744, _1080p * 346, _1080p * 858, 0 )
				end,
				function ()
					return self.DecalImage:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 838, _1080p * 1862, _1080p * 346, _1080p * 858, 300, LUI.EASING.outQuadratic )
				end
			}
		} )
		self._sequences.MenuOpen = function ()
			JackalBase:AnimateSequence( "MenuOpen" )
			DecalImage:AnimateSequence( "MenuOpen" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	local f9_local13 = LUI.UIScrollbar.new
	local bindButton = {
		direction = LUI.DIRECTION.vertical,
		eventListener = DecalScrollbar,
		startCap = DecalScrollbar.startCap,
		endCap = DecalScrollbar.endCap
	}
	local f9_local15 = DecalScrollbar.sliderArea
	if f9_local15 then
		f9_local15 = DecalScrollbar.sliderArea.slider
	end
	bindButton.slider = f9_local15
	f9_local15 = DecalScrollbar.sliderArea
	if f9_local15 then
		f9_local15 = DecalScrollbar.sliderArea.fixedSizeSlider
	end
	bindButton.fixedSizeSlider = f9_local15
	Decals:AddScrollbar( f9_local13( bindButton ) )
	Decals:AddArrow( ArrowUp )
	Decals:AddArrow( ArrowDown )
	Decals:AddItemNumbers( ListCount )
	self.addButtonHelperFunction = function ( f32_arg0, f32_arg1 )
		f32_arg0:AddButtonHelperText( {
			helper_text = Engine.Localize( "LUA_MENU_SELECT" ),
			button_ref = "button_primary",
			side = "left",
			clickable = true
		} )
		f32_arg0:AddButtonHelperText( {
			helper_text = Engine.Localize( "MENU_BACK" ),
			button_ref = "button_secondary",
			side = "left",
			priority = 10,
			clickable = true
		} )
	end
	
	self:addEventHandler( "menu_create", self.addButtonHelperFunction )
	
	bindButton = LUI.UIBindButton.new()
	bindButton.id = "selfBindButton"
	self:addElement( bindButton )
	self.bindButton = bindButton
	
	self.bindButton:addEventHandler( "button_secondary", function ( f33_arg0, f33_arg1 )
		local f33_local0 = f33_arg1.controller or f9_local1
		ACTIONS.LeaveMenu( self )
	end )
	f0_local4( self, f9_local1, controller )
	ACTIONS.AnimateSequence( self, "MenuOpen" )
	return self
end

MenuBuilder.registerType( "JackalDecalSelect", JackalDecalSelect )
LockTable( _M )
