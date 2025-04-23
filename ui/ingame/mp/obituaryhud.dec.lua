local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
CoD.PrintModuleLoad( _NAME )
f0_local0 = 0
f0_local1 = FONTS.MainMedium
f0_local2 = 16
local f0_local3 = function ( f1_arg0 )
	f1_arg0:SetShadowMinDistance( -0.2, 0 )
	f1_arg0:SetShadowMaxDistance( 0.2, 0 )
	f1_arg0:SetShadowRGBFromInt( 0, 0 )
	f1_arg0:SetShadowUOffset( -0 )
	f1_arg0:SetShadowVOffset( -0 )
end

local f0_local4 = function ()
	local f2_local0 = Game.GetPlayerTeam()
	if MLG.IsMLGSpectator() then
		f2_local0 = Game.GetLastMLGSpectateTeam()
	elseif f2_local0 == Teams.spectator then
		f2_local0 = Game.GetPlayerTeam( Game.GetPlayerstateClientnum() )
	end
	return f2_local0
end

local f0_local5 = function ( f3_arg0 )
	local f3_local0 = SWATCHES.HUD.enemyTeam
	if MLG.IsMLGSpectator() then
		if GameX.gameModeIsFFA( GameX.GetGameMode() ) then
			f3_local0 = GetColorTableFromIntColor( GetIntForColor( SWATCHES.HUD.enemyTeam ) )
		else
			local f3_local1 = Engine.GetFirstActiveController()
			if f3_arg0 == Teams.allies then
				f3_local0 = GetColorTableFromIntColor( CODCASTER.GetTeam2Color( f3_local1 ) )
			else
				f3_local0 = GetColorTableFromIntColor( CODCASTER.GetTeam1Color( f3_local1 ) )
			end
		end
	end
	return f3_local0
end

local f0_local6 = function ( f4_arg0 )
	local f4_local0 = SWATCHES.HUD.friendlyTeam
	if MLG.IsMLGSpectator() then
		if GameX.gameModeIsFFA( GameX.GetGameMode() ) then
			f4_local0 = GetColorTableFromIntColor( GetIntForColor( SWATCHES.HUD.enemyTeam ) )
		else
			local f4_local1 = Engine.GetFirstActiveController()
			if f4_arg0 == Teams.allies then
				f4_local0 = GetColorTableFromIntColor( CODCASTER.GetTeam1Color( f4_local1 ) )
			else
				f4_local0 = GetColorTableFromIntColor( CODCASTER.GetTeam2Color( f4_local1 ) )
			end
		end
	end
	return f4_local0
end

local f0_local7 = function ( f5_arg0 )
	local self = LUI.UIElement.new( {
		topAnchor = true,
		leftAnchor = true,
		bottomAnchor = false,
		rightAnchor = false,
		top = 0,
		left = 0,
		height = f0_local2,
		alpha = 0,
		scale = 0
	} )
	self.id = "obitItemElemId"
	self:registerAnimationState( "opening", {
		topAnchor = true,
		leftAnchor = true,
		bottomAnchor = false,
		rightAnchor = false,
		top = 0,
		left = 0,
		height = f0_local2,
		alpha = 1,
		scale = 0.2
	} )
	self:registerAnimationState( "active", {
		topAnchor = true,
		leftAnchor = true,
		bottomAnchor = false,
		rightAnchor = false,
		top = 0,
		left = 0,
		height = f0_local2,
		alpha = 1,
		scale = 0
	} )
	self:animateToState( "default", 0 )
	local f5_local1 = function ()
		f5_arg0._pool:DeallocateElement( self )
		self:close()
	end
	
	self:registerEventHandler( "menu_create", MBh.AnimateSequenceAndCallback( {
		{
			"default",
			0
		},
		{
			"opening",
			75
		},
		{
			"active",
			75
		},
		{
			"active",
			5000
		},
		{
			"default",
			250
		}
	}, f5_local1 ) )
	self:registerEventHandler( "menu_close", MBh.AnimateSequenceAndCallback( {
		{
			"active",
			0
		},
		{
			"default",
			250
		}
	}, f5_local1 ) )
	return self
end

local f0_local8 = function ( f7_arg0, f7_arg1 )
	local f7_local0 = f0_local4()
	local f7_local1 = utils.mp.DebugRemapGamerTag.GetRemappedGamerTag( Game.GetPlayerName( f7_arg1.victim ) )
	local f7_local2, f7_local3, f7_local4, f7_local5 = GetTextDimensions( f7_local1, FONTS.GetFont( f0_local1.File ), f0_local2 / _1080p )
	f7_arg0.width = f7_local4 * _1080p - f7_local2 * _1080p + 3
	f7_arg0:setText( f7_local1 )
	if Game.GetPlayerTeam( f7_arg1.victim ) == f7_local0 then
		local f7_local6
		if Game.GetPlayerClientnum() == f7_arg1.victim then
			f7_local6 = not MLG.IsMLGSpectator()
		else
			f7_local6 = false
		end
		if f7_local6 then
			f7_arg0:SetRGBFromTable( COLORS.white )
		elseif GameX.gameModeIsFFA() then
			f7_arg0:SetRGBFromTable( f0_local5( f7_local0 ) )
		else
			f7_arg0:SetRGBFromTable( f0_local6( f7_local0 ) )
		end
	else
		f7_arg0:SetRGBFromTable( f0_local5( f7_local0 ) )
	end
end

local f0_local9 = function ()
	local self = LUI.UIStyledText.new( {
		topAnchor = true,
		leftAnchor = true,
		bottomAnchor = true,
		rightAnchor = false,
		top = 0,
		bottom = 0,
		right = 0,
		font = FONTS.GetFont( f0_local1.File ),
		red = COLORS.white.r,
		green = COLORS.white.g,
		blue = COLORS.white.b,
		alignment = LUI.Alignment.Left
	} )
	self.id = "obitVictimTextId"
	self:SetOptOutRightToLeftAlignmentFlip( true )
	self:animateToState( "default", 0 )
	self:SetWordWrap( false )
	f0_local3( self )
	return self
end

local f0_local10 = function ( f9_arg0, f9_arg1 )
	local f9_local0 = f0_local4()
	local f9_local1 = utils.mp.DebugRemapGamerTag.GetRemappedGamerTag( Game.GetPlayerName( f9_arg1.attacker ) )
	local f9_local2, f9_local3, f9_local4, f9_local5 = GetTextDimensions( f9_local1, FONTS.GetFont( f0_local1.File ), f0_local2 / _1080p )
	f9_arg0.width = f9_local4 * _1080p - f9_local2 * _1080p + 3
	f9_arg0:setText( f9_local1 )
	if Game.GetPlayerTeam( f9_arg1.attacker ) == f9_local0 then
		if Game.GetPlayerClientnum() == f9_arg1.attacker then
			f9_arg0:SetRGBFromTable( COLORS.white )
		elseif GameX.gameModeIsFFA() then
			f9_arg0:SetRGBFromTable( f0_local5( f9_local0 ) )
		else
			f9_arg0:SetRGBFromTable( f0_local6( f9_local0 ) )
		end
	else
		f9_arg0:SetRGBFromTable( f0_local5( f9_local0 ) )
	end
end

local f0_local11 = function ()
	local self = LUI.UIStyledText.new( {
		leftAnchor = true,
		rightAnchor = false,
		topAnchor = false,
		bottomAnchor = false,
		top = 0,
		bottom = 0,
		right = 0,
		font = FONTS.GetFont( f0_local1.File ),
		red = COLORS.white.r,
		green = COLORS.white.g,
		blue = COLORS.white.b,
		alignment = LUI.Alignment.Left
	} )
	self.id = "obitAttackerTextId"
	self:SetOptOutRightToLeftAlignmentFlip( true )
	self:animateToState( "default", 0 )
	self:SetWordWrap( false )
	f0_local3( self )
	return self
end

local f0_local12 = function ( menu, controller )
	local self = LUI.UIElement.new( {
		topAnchor = true,
		leftAnchor = false,
		bottomAnchor = true,
		rightAnchor = true,
		top = 0,
		right = 0,
		width = controller or 5
	} )
	self.id = "obitSpacer" .. menu
	self:animateToState( "default", 0 )
	return self
end

local f0_local13 = function ()
	local self = LUI.UIImage.new( {
		leftAnchor = true,
		rightAnchor = true,
		topAnchor = false,
		bottomAnchor = true,
		top = 3,
		left = 0,
		bottom = 0,
		right = 0
	} )
	self.id = "obitWeaponLootRarityId"
	self:SetUseAA( true )
	return self
end

local f0_local14 = function ( f13_arg0, f13_arg1 )
	f13_arg0:setImage( f13_arg1.icon )
	local f13_local0 = f0_local2 * Engine.GetMaterialAspectRatio( f13_arg1.icon )
	f13_arg0.width = f13_local0
	if f13_arg1.flip then
		f13_arg0:SetAnchorsAndPosition( 1, 0, 0.5, 0.5, -f13_local0, 0, -f0_local2 / 2, f0_local2 / 2 )
	else
		f13_arg0:SetAnchorsAndPosition( 1, 0, 0.5, 0.5, 0, f13_local0, -f0_local2 / 2, f0_local2 / 2 )
	end
	if f13_arg1.weaponQuality then
		f13_arg0.WeaponLootRarityElement:SetRGBFromTable( Cac.GetLootQualityColorSwatch( f13_arg1.weaponQuality ) )
		f13_arg0:addElement( f13_arg0.WeaponLootRarityElement )
		f13_arg0.WeaponLootRarityElementActive = true
	elseif f13_arg0.WeaponLootRarityElementActive then
		f13_arg0:removeElement( f13_arg0.WeaponLootRarityElement )
		f13_arg0.WeaponLootRarityElementActive = false
	end
end

local f0_local15 = function ( f14_arg0 )
	local self = LUI.UIImage.new( {
		topAnchor = true,
		leftAnchor = true,
		bottomAnchor = true,
		rightAnchor = false,
		top = -f0_local2 / 2,
		bottom = f0_local2 / 2,
		right = 0
	} )
	self.id = "obitWeaponImageId"
	self.WeaponLootRarityElement = f0_local13()
	self.WeaponLootRarityElementActive = false
	return self
end

local f0_local16 = function ( f15_arg0 )
	local f15_local0 = f0_local2 + 10
	local self = LUI.UIElement.new( {
		leftAnchor = true,
		rightAnchor = false,
		topAnchor = true,
		bottomAnchor = false,
		top = 0,
		left = 0,
		height = 0,
		width = 512,
		alpha = 0,
		alignment = LUI.Alignment.Right,
		spacing = 0
	} )
	self.id = "connectTextElemId"
	self:registerAnimationState( "opening", {
		topAnchor = true,
		leftAnchor = true,
		bottomAnchor = false,
		rightAnchor = false,
		top = 0,
		left = 0,
		height = f15_local0,
		width = 512,
		alpha = 1
	} )
	self:registerAnimationState( "active", {
		topAnchor = true,
		leftAnchor = true,
		bottomAnchor = false,
		rightAnchor = false,
		top = 0,
		left = 0,
		height = f0_local2,
		width = 512,
		alpha = 0.8
	} )
	self:animateToState( "default", 0 )
	self:registerEventHandler( "menu_create", MBh.AnimateSequenceAndClose( {
		{
			"default",
			0
		},
		{
			"opening",
			75
		},
		{
			"active",
			75
		},
		{
			"active",
			5000
		},
		{
			"default",
			250
		}
	} ) )
	self:registerEventHandler( "menu_close", MBh.AnimateSequenceAndClose( {
		{
			"active",
			0
		},
		{
			"default",
			250
		}
	} ) )
	local f15_local2 = LUI.UIStyledText.new( {
		topAnchor = true,
		leftAnchor = true,
		bottomAnchor = true,
		rightAnchor = true,
		alignment = LUI.Alignment.Left,
		font = FONTS.GetFont( f0_local1.File ),
		red = COLORS.white.r,
		green = COLORS.white.g,
		blue = COLORS.white.b
	} )
	f15_local2.id = "connectTextId"
	f15_local2:setText( f15_arg0.message )
	f0_local3( f15_local2 )
	f15_local2:SetFontSize( f15_local0 )
	self:addElement( f15_local2 )
	f15_local2:SetOptOutRightToLeftAlignmentFlip( true )
	return self
end

local f0_local17 = function ( f16_arg0 )
	local f16_local0 = f0_local7( f16_arg0 )
	f16_local0.VictimTextElem = f0_local9()
	f16_local0.WeaponImageElem = f0_local15()
	f16_local0.AttackerTextElement = f0_local11()
	f16_local0:addElement( f16_local0.AttackerTextElement )
	f16_local0:addElement( f16_local0.WeaponImageElem )
	f16_local0:addElement( f16_local0.VictimTextElem )
	return f16_local0
end

local f0_local18 = function ( f17_arg0 )
	f17_arg0._pool = LUI.LUIElementPool.new( {
		initialPoolSize = 5,
		maxPoolSize = 5,
		buildElement = function ()
			return f0_local17( f17_arg0 )
		end
	} )
end

local f0_local19 = function ( f19_arg0, f19_arg1 )
	local f19_local0 = nil
	if f19_arg1.name == "obituary" then
		f19_local0 = f19_arg0._pool:AllocateElement()
		local f19_local1
		if f19_arg1.attacker == nil or f19_arg1.attacker == f19_arg1.victim then
			f19_local1 = false
		else
			f19_local1 = true
		end
		if f19_local0.AttackerTextElementActive and not f19_local1 then
			f19_local0:removeElement( f19_local0.AttackerTextElement )
			f19_local0.AttackerTextElementActive = false
		end
		if f19_local1 then
			f0_local10( f19_local0.AttackerTextElement, f19_arg1 )
			if not f19_local0.AttackerTextElementActive then
				f19_local0:addElement( f19_local0.AttackerTextElement )
				f19_local0.AttackerTextElementActive = true
			end
		end
		f0_local14( f19_local0.WeaponImageElem, f19_arg1 )
		f0_local8( f19_local0.VictimTextElem, f19_arg1 )
		local f19_local2 = 10 * _1080p
		local f19_local3, f19_local4 = nil
		local f19_local5 = 0
		if f19_local1 then
			f19_local3 = f19_local5
			f19_local5 = f19_local5 + f19_local0.AttackerTextElement.width
			f19_local0.AttackerTextElement:SetAnchorsAndPosition( 1, 0, 0, 0, f19_local3, f19_local5, 0, 0 )
			f19_local0.WeaponImageElem:SetLeft( f19_local5 )
			f19_local5 = f19_local5 + f19_local0.WeaponImageElem.width
			f19_local0.WeaponImageElem:SetRight( f19_local5 )
			f19_local5 = f19_local5 + f19_local2
			f19_local0.VictimTextElem:SetAnchorsAndPosition( 1, 0, 0, 0, f19_local5, f19_local5 + f19_local0.VictimTextElem.width, 0, 0 )
		else
			f19_local0.WeaponImageElem:SetLeft( f19_local5 )
			f19_local5 = f19_local5 + f19_local0.WeaponImageElem.width
			f19_local0.WeaponImageElem:SetRight( f19_local5 )
			f19_local5 = f19_local5 + f19_local2
			f19_local0.VictimTextElem:SetAnchorsAndPosition( 1, 0, 0, 0, f19_local5, f19_local5 + f19_local0.VictimTextElem.width, 0, 0 )
		end
	elseif f19_arg1.bold ~= nil and f19_arg1.bold == false and f19_arg1.message ~= nil then
		f19_local0 = f0_local16( f19_arg1 )
	end
	if f19_local0 ~= nil then
		f19_local0:processEvent( {
			name = "menu_create"
		} )
		f19_local0.id = "obitElemId" .. f0_local0
		f0_local0 = f0_local0 + 1
		local f19_local1 = f19_arg0:getFirstChild()
		if f19_local1 then
			f19_local0:addElementBefore( f19_local1 )
		else
			f19_arg0:addElement( f19_local0 )
		end
	end
	local f19_local1 = f19_arg0:getNumChildren()
	local f19_local2 = f19_arg0:getLastChild()
	local f19_local3 = CONDITIONS.IsSplitscreen( f19_arg0 ) and 2 or 4
	if f19_local2 and f19_local3 < f19_local1 then
		f19_local2:processEvent( {
			name = "menu_close"
		} )
		f19_local1 = f19_local1 - 1
		while f19_local3 < f19_local1 do
			local f19_local4 = f19_local2:getPreviousSibling()
			if f19_local4 then
				f19_local4:processEvent( {
					name = "menu_close"
				} )
			end
			f19_local1 = f19_local1 - 1
		end
	end
end

function obituaryHudDef()
	local self = LUI.UIElement.new()
	self.id = "obituaryHudDef"
	local f20_local1 = LUI.UIElement.new()
	self:addElement( f20_local1 )
	f20_local1.id = "obituaryHudId"
	local f20_local2 = f20_local1
	local f20_local3 = f20_local1.registerAnimationState
	local f20_local4 = "default"
	local f20_local5 = {
		topAnchor = false,
		leftAnchor = true,
		bottomAnchor = true,
		rightAnchor = false
	}
	if not MLG.IsMLGSpectator() or not -165 then
		local f20_local6 = CONDITIONS.IsSplitscreen()
		local f20_local7 = -100
		local f20_local8 = -150
	end
	f20_local5.bottom = f20_local6 and f20_local7 or f20_local8
	f20_local5.left = CONDITIONS.IsSplitscreen() and 90 or 60
	f20_local5.height = 256
	f20_local5.width = 256
	f20_local5.alpha = 1
	f20_local3( f20_local2, f20_local4, f20_local5 )
	f20_local1:animateToState( "default", 0 )
	f20_local1:registerAnimationState( "inactive", {
		alpha = 0
	} )
	f20_local3 = LUI.UIVerticalList.new( {
		topAnchor = true,
		leftAnchor = true,
		bottomAnchor = true,
		rightAnchor = true,
		top = 0,
		left = 0,
		bottom = 0,
		right = 0,
		spacing = 3,
		alignment = MLG.IsMLGSpectator() and LUI.Alignment.Bottom or LUI.Alignment.Bottom
	} )
	f0_local18( f20_local3 )
	f20_local3.id = "obituaryVLId"
	f20_local3:animateToState( "default", 0 )
	f20_local3:registerEventHandler( "obituary", f0_local19 )
	f20_local3:registerEventHandler( "game_message", f0_local19 )
	f20_local1:addElement( f20_local3 )
	f20_local2 = CONDITIONS.IsSplitscreen() and 0.5 or 1
	f20_local1:SetXRotation( -5 * f20_local2 )
	f20_local1:SetYRotation( 30 * f20_local2 )
	return self
end

MenuBuilder.registerType( "obituaryHudDef", obituaryHudDef )
LockTable( _M )
