local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
CoD.PrintModuleLoad( _NAME )
f0_local0 = 0.75
f0_local1 = {
	"inner",
	"middle",
	"outer"
}
f0_local2 = {
	"n",
	"ne",
	"e",
	"se",
	"s",
	"sw",
	"w",
	"nw"
}
local f0_local3 = {
	"north",
	"northeast",
	"east",
	"southeast",
	"south",
	"southwest",
	"west",
	"northwest"
}
local f0_local4 = {
	0,
	-45,
	-90,
	-135,
	-180,
	-225,
	-270,
	-315
}
local f0_local5 = {
	1,
	0.75,
	0.5,
	0.25,
	0,
	0.25,
	0.5,
	0.75
}
local f0_local6 = 450
local f0_local7 = 1000
assert( #f0_local1 == #{
	0,
	8,
	64
} )
local f0_local8 = 3
function IsSegmentLit( f1_arg0, f1_arg1 )
	if Engine.GetDvarInt( "ui_ringradar_no_layers" ) == 1 then
		return f1_arg0 ~= 0
	end
	local f1_local0 = assert
	local f1_local1
	if f1_arg1 < 1 or f1_arg1 > #f0_local1 then
		f1_local1 = false
	else
		f1_local1 = true
	end
	f1_local0( f1_local1 )
	return Engine.BitwiseAnd( f1_arg0, BitShiftLeft( 1, f1_arg1 - 1 ) ) > 0
end

function UpdateSegment( f2_arg0, f2_arg1 )
	f2_arg0:SetLit( IsSegmentLit( f2_arg0.dataSource:GetValue( f2_arg0:getRootController() ), f2_arg0.layerIdx ) )
end

function UpdateSegmentContainer( f3_arg0, f3_arg1 )
	if f3_arg1.value == 2 then
		f3_arg0.sectionImage.isVanishing = true
		f3_arg0:AnimateSequence( "wait_and_vanish" )
	end
end

function UpdateRadarContainer( f4_arg0, f4_arg1 )
	if f4_arg1.value == 2 then
		f4_arg0.radarBackground:AnimateSequence( "outro" )
		f4_arg0.radarRings:AnimateSequence( "outro" )
	end
end

function RingRadarRingPulse()
	local self = LUI.UIElement.new()
	self.id = "ring_radar_pulse_container"
	self:registerAnimationState( "default", {
		topAnchor = false,
		leftAnchor = false,
		bottomAnchor = false,
		rightAnchor = false,
		top = 0,
		left = 0,
		bottom = 0,
		right = 0,
		alpha = 1,
		zRot = 0
	} )
	self:animateToState( "default", 0 )
	local f5_local1 = LUI.UIImage.new()
	f5_local1.id = "ring_radar_pulse_image"
	f5_local1:registerAnimationState( "default", {
		topAnchor = false,
		leftAnchor = false,
		bottomAnchor = false,
		rightAnchor = false,
		width = 256 * f0_local0,
		height = 256 * f0_local0,
		alpha = 1,
		material = RegisterMaterial( "hud_jackal_interior_main_map_circle" )
	} )
	f5_local1:animateToState( "default", 0 )
	f5_local1:registerAnimationState( "beginPulse", {
		topAnchor = false,
		leftAnchor = false,
		bottomAnchor = false,
		rightAnchor = false,
		top = 0,
		left = 0,
		bottom = 0,
		right = 0,
		alpha = 1
	} )
	f5_local1:registerAnimationState( "endPulse", {
		topAnchor = false,
		leftAnchor = false,
		bottomAnchor = false,
		rightAnchor = false,
		width = 256 * f0_local0,
		height = 256 * f0_local0,
		alpha = 0
	} )
	f5_local1:RegisterAnimationSequence( "pulse", {
		{
			"beginPulse",
			0
		},
		{
			"beginPulse",
			500
		},
		{
			"endPulse",
			800,
			true,
			false
		},
		{
			"beginPulse",
			0
		},
		{
			"endPulse",
			800,
			true,
			false
		},
		{
			"beginPulse",
			0
		},
		{
			"endPulse",
			800,
			true,
			false
		},
		{
			"beginPulse",
			0
		}
	} )
	f5_local1:AnimateSequence( "pulse", 0 )
	self:addElement( f5_local1 )
	return self
end

function RingRadarSweep()
	local self = LUI.UIElement.new()
	self.id = "ring_radar_sweep_container"
	self:registerAnimationState( "default", {
		topAnchor = false,
		leftAnchor = false,
		bottomAnchor = false,
		rightAnchor = false,
		top = 0,
		left = 0,
		bottom = 0,
		right = 0,
		alpha = 0,
		zRot = 0
	} )
	self:registerAnimationState( "visible", {
		alpha = 1
	} )
	self:animateToState( "default", 0 )
	self:RegisterAnimationSequence( "sweep", {
		{
			"default",
			0
		},
		{
			"default",
			500
		},
		{
			"visible",
			50
		}
	} )
	self:AnimateSequence( "sweep", 0 )
	local f6_local1 = LUI.UIElement.new()
	f6_local1.id = "ring_radar_sweep_container"
	f6_local1:registerAnimationState( "default", {
		topAnchor = false,
		leftAnchor = false,
		bottomAnchor = false,
		rightAnchor = false,
		top = 0,
		left = 0,
		bottom = 0,
		right = 0,
		alpha = 1,
		zRot = 0
	} )
	f6_local1:registerAnimationState( "fullsweep", {
		zRot = -359
	} )
	f6_local1:animateToState( "default", 0 )
	f6_local1:RegisterAnimationSequence( "sweep", {
		{
			"default",
			0
		},
		{
			"fullsweep",
			600
		}
	} )
	f6_local1:AnimateLoop( "sweep", 0 )
	self:addElement( f6_local1 )
	local f6_local2 = LUI.UIImage.new()
	f6_local2.id = "ring_radar_sweep_image"
	f6_local2:registerAnimationState( "default", {
		topAnchor = false,
		leftAnchor = false,
		bottomAnchor = false,
		rightAnchor = false,
		top = -115,
		left = -118,
		bottom = 0,
		right = 0,
		alpha = 0.35,
		material = RegisterMaterial( "radar_ring_sweep" )
	} )
	f6_local2:animateToState( "default", 0 )
	f6_local1:addElement( f6_local2 )
	return self
end

function RingRadarCompassRing()
	local f7_local0 = -92
	local self = LUI.UIElement.new()
	self.id = "ring_radar_compass_container"
	self:registerAnimationState( "default", {
		topAnchor = false,
		leftAnchor = false,
		bottomAnchor = false,
		rightAnchor = false,
		top = 0,
		left = 0,
		bottom = 0,
		right = 0,
		alpha = 1
	} )
	self:animateToState( "default", 0 )
	local f7_local2 = LUI.UIText.new()
	f7_local2.id = "ring_radar_compass_north"
	f7_local2:setText( "North" )
	f7_local2:registerAnimationState( "default", {
		topAnchor = false,
		leftAnchor = false,
		bottomAnchor = false,
		rightAnchor = false,
		top = f7_local0,
		left = 0,
		bottom = f7_local0 + 16,
		right = 0,
		alignment = LUI.Alignment.Center,
		alpha = 1
	} )
	f7_local2:animateToState( "default", 0 )
	self:addElement( f7_local2 )
	local f7_local3 = LUI.UIImage.new()
	f7_local3.id = "ring_radar_compass_north_img"
	f7_local3:registerAnimationState( "default", {
		topAnchor = false,
		leftAnchor = false,
		bottomAnchor = false,
		rightAnchor = false,
		top = f7_local0,
		left = -8,
		bottom = f7_local0 + 16,
		right = 8,
		alignment = LUI.Alignment.Center,
		material = RegisterMaterial( "white_nocull_2d" ),
		alpha = 1
	} )
	f7_local3:animateToState( "default", 0 )
	self:addElement( f7_local3 )
	return self
end

function RingRadarGlitch()
	local self = LUI.UIImage.new()
	self.id = "ring_radar_glitch_image"
	self:registerAnimationState( "default", {
		topAnchor = false,
		leftAnchor = false,
		bottomAnchor = false,
		rightAnchor = false,
		width = 256 * f0_local0,
		height = 256 * f0_local0,
		material = RegisterMaterial( "radar_ring_glitch" ),
		alpha = 0.9
	} )
	self:registerAnimationState( "hidden", {
		alpha = 0
	} )
	self:RegisterAnimationSequence( "glitchAnimate", {
		{
			"hidden",
			0
		},
		{
			"default",
			250
		},
		{
			"hidden",
			700
		}
	} )
	self:AnimateSequence( "glitchAnimate" )
	return self
end

function RingRadarBackground()
	local self = LUI.UIElement.new( {
		width = 512 * f0_local0,
		height = 512 * f0_local0,
		scale = -1
	} )
	self.id = "ring_radar_background_container_id"
	self:registerAnimationState( "show", {
		alpha = 1,
		scale = 0
	} )
	self:registerAnimationState( "hide", {
		alpha = 0,
		scale = -1
	} )
	self:RegisterAnimationSequence( "intro", {
		{
			"hide",
			0
		},
		{
			"show",
			150
		}
	} )
	self:RegisterAnimationSequence( "outro", {
		{
			"show",
			0
		},
		{
			"hide",
			150
		}
	} )
	self:AnimateSequence( "intro" )
	local f9_local1 = LUI.UIBlur.new( {
		topAnchor = true,
		leftAnchor = true,
		bottomAnchor = true,
		rightAnchor = true
	} )
	f9_local1.id = "ring_radar_blur_id"
	f9_local1:setImage( RegisterMaterial( "hud_radar_bg_mask" ) )
	f9_local1:SetUseAA( true )
	f9_local1:SetBlurStrength( 2, 0 )
	f9_local1:SetDepth( 5 * f0_local0 )
	self:addElement( f9_local1 )
	local f9_local2 = LUI.UIImage.new( {
		topAnchor = true,
		leftAnchor = true,
		bottomAnchor = true,
		rightAnchor = true,
		material = RegisterMaterial( "hud_radar_bg" )
	} )
	f9_local2.id = "ring_radar_background_id"
	f9_local2:SetUseAA( true )
	f9_local2:SetDepth( 5 * f0_local0 )
	self:addElement( f9_local2 )
	return self
end

function RingRadarRings()
	local self = LUI.UIImage.new( {
		width = 256 * f0_local0,
		height = 256 * f0_local0,
		material = RegisterMaterial( "hud_radar_rings" ),
		alpha = 0.4,
		scale = -1
	} )
	self.id = "ring_radar_rings_id"
	self:SetUseAA( true )
	self:SetDepth( -5 * f0_local0 )
	self:registerAnimationState( "show", {
		alpha = 0.4,
		scale = 0
	} )
	self:registerAnimationState( "hide", {
		alpha = 0,
		scale = -1
	} )
	self:RegisterAnimationSequence( "intro", {
		{
			"hide",
			0
		},
		{
			"show",
			150
		}
	} )
	self:RegisterAnimationSequence( "outro", {
		{
			"show",
			0
		},
		{
			"hide",
			150
		}
	} )
	self:AnimateSequence( "intro" )
	return self
end

function RingRadarIntroRings()
	local self = LUI.UIImage.new( {
		width = 256 * f0_local0,
		height = 256 * f0_local0,
		material = RegisterMaterial( "hud_radar_bg" ),
		alpha = 0,
		scale = -1
	} )
	self.id = "ring_radar_intro_rings_id"
	self:SetUseAA( true )
	self:SetDepth( 5 * f0_local0 )
	self:registerAnimationState( "show", {
		alpha = 1,
		scale = 1
	} )
	self:registerAnimationState( "hide", {
		alpha = 0,
		scale = 1
	} )
	self:RegisterAnimationSequence( "intro", {
		{
			"hide",
			150
		},
		{
			"show",
			500
		},
		{
			"hide",
			0
		},
		{
			"show",
			100
		},
		{
			"hide",
			0
		},
		{
			"show",
			100
		},
		{
			"hide",
			0
		},
		{
			"show",
			100
		},
		{
			"hide",
			0
		},
		{
			"show",
			100
		},
		{
			"hide",
			0
		},
		{
			"show",
			100
		},
		{
			"hide",
			0
		},
		{
			"show",
			100
		},
		{
			"hide",
			500
		}
	} )
	self:AnimateSequence( "intro" )
	return self
end

function RingRadarIntroSides()
	local self = LUI.UIElement.new( {
		width = 512 * f0_local0,
		height = 512 * f0_local0,
		scale = 0,
		alpha = 1
	} )
	self.id = "ring_radar_background_container_id"
	local f12_local1 = LUI.UIBlur.new( {
		topAnchor = true,
		leftAnchor = false,
		bottomAnchor = true,
		rightAnchor = true,
		alpha = 1,
		scale = 0
	} )
	f12_local1.id = "ring_radar_blur_side_right"
	f12_local1:setImage( RegisterMaterial( "hud_radar_bg_side" ) )
	f12_local1:SetAnchorsAndPosition( 0, 1, 1, 1, -256 * f0_local0, 0, 0, 0 )
	f12_local1:SetUseAA( true )
	f12_local1:SetBlurStrength( 2, 0 )
	f12_local1:SetDepth( 5 * f0_local0 )
	f12_local1:SetRGBFromInt( 11776947, 0 )
	self:addElement( f12_local1 )
	local f12_local2 = LUI.UIBlur.new( {
		topAnchor = true,
		leftAnchor = true,
		bottomAnchor = true,
		rightAnchor = false,
		alpha = 0,
		scale = 0
	} )
	f12_local2.id = "ring_radar_blur_side_left"
	f12_local2:setImage( RegisterMaterial( "hud_radar_bg_side" ) )
	f12_local2:SetAnchorsAndPosition( 1, 0, 1, 1, 0, 256 * f0_local0, 0, 0 )
	f12_local2:SetUseAA( true )
	f12_local2:SetBlurStrength( 2, 0 )
	f12_local2:SetDepth( 5 * f0_local0 )
	f12_local2:SetZRotation( -180 )
	f12_local2:SetRGBFromInt( 11776947, 0 )
	self:addElement( f12_local2 )
	f12_local1:registerAnimationState( "start", {
		leftAnchor = false,
		rightAnchor = true,
		topAnchor = true,
		bottomAnchor = true,
		left = -256,
		right = 0,
		top = 0,
		bottom = 0,
		alpha = 1
	} )
	f12_local1:registerAnimationState( "end", {
		leftAnchor = false,
		rightAnchor = true,
		topAnchor = true,
		bottomAnchor = true,
		left = 100,
		right = 356 * f0_local0,
		top = 0,
		bottom = 0,
		alpha = 0
	} )
	f12_local1:RegisterAnimationSequence( "intro", {
		{
			"start",
			0
		},
		{
			"end",
			500
		}
	} )
	f12_local2:registerAnimationState( "start", {
		leftAnchor = true,
		rightAnchor = false,
		topAnchor = true,
		bottomAnchor = true,
		left = 24,
		right = 280,
		top = 0,
		bottom = 0,
		alpha = 1
	} )
	f12_local2:registerAnimationState( "end", {
		leftAnchor = true,
		rightAnchor = false,
		topAnchor = true,
		bottomAnchor = true,
		left = -332,
		right = -76 * f0_local0,
		top = 0,
		bottom = 0,
		alpha = 0
	} )
	f12_local2:RegisterAnimationSequence( "intro", {
		{
			"start",
			0
		},
		{
			"end",
			500
		}
	} )
	f12_local1:AnimateSequence( "intro" )
	f12_local2:AnimateSequence( "intro" )
	return self
end

function RingRadarContent()
	local self = LUI.UIElement.new()
	self.id = "radar_container"
	self:registerAnimationState( "default", {
		topAnchor = true,
		leftAnchor = true,
		bottomAnchor = true,
		rightAnchor = true,
		top = 0,
		left = 0,
		bottom = 0,
		right = 0
	} )
	self:SetXRotation( -80 )
	self:animateToState( "default", 0 )
	self:registerOmnvarHandler( "ui_ringradar_enabled", UpdateRadarContainer )
	local f13_local1 = RingRadarBackground()
	self.radarBackground = f13_local1
	self:addElement( f13_local1 )
	for f13_local13, f13_local14 in pairs( f0_local2 ) do
		local f13_local15 = LUI.UIElement.new()
		f13_local15.id = "ring_radar_dir_" .. f13_local14
		f13_local15:registerAnimationState( "default", {
			topAnchor = true,
			leftAnchor = true,
			bottomAnchor = true,
			rightAnchor = true,
			top = 0,
			left = 0,
			bottom = 0,
			right = 0,
			alpha = 1,
			zRot = f0_local4[f13_local13]
		} )
		f13_local15:animateToState( "default", 0 )
		self:addElement( f13_local15 )
		for f13_local5, f13_local6 in pairs( f0_local1 ) do
			local f13_local8 = LUI.UIElement.new()
			f13_local8.id = "radar_container_" .. f13_local6 .. "_" .. f13_local14
			f13_local8:registerAnimationState( "default", {
				topAnchor = false,
				leftAnchor = false,
				bottomAnchor = true,
				rightAnchor = false,
				top = -128 * f0_local0,
				left = -64 * f0_local0,
				bottom = 0 * f0_local0,
				right = 64 * f0_local0,
				alpha = 1
			} )
			f13_local8:registerAnimationState( "hidden", {
				alpha = 0
			} )
			f13_local8:registerAnimationState( "faded", {
				alpha = 0.5
			} )
			f13_local8:RegisterAnimationSequence( "wait_and_vanish", {
				{
					"default",
					f0_local5[f13_local13] * f0_local6 + (3 - f13_local5) * 15
				},
				{
					"hidden",
					250
				}
			} )
			f13_local8:RegisterAnimationSequence( "pulse", {
				{
					"faded",
					0
				},
				{
					"default",
					100
				},
				{
					"faded",
					0
				},
				{
					"default",
					250
				}
			} )
			f13_local8:registerOmnvarHandler( "ui_ringradar_enabled", UpdateSegmentContainer )
			local f13_local9 = f13_local8:Wait( 500 - f0_local5[f13_local13] * f0_local6 + (3 - f13_local5) * 15 )
			f13_local9.onComplete = function ()
				f13_local8:animateToState( "default", 100 )
			end
			
			f13_local15:addElement( f13_local8 )
			local f13_local10 = "hud_radar_ring_" .. f13_local6
			local f13_local11 = "hud_radar_ring_" .. f13_local6 .. "_lit"
			local f13_local12 = LUI.UIImage.new( {
				topAnchor = true,
				leftAnchor = true,
				bottomAnchor = true,
				rightAnchor = true,
				top = 0,
				left = 0,
				bottom = 0,
				right = 0,
				material = RegisterMaterial( f13_local10 ),
				alpha = 0
			} )
			f13_local12:registerAnimationState( "show", {
				alpha = 1
			} )
			f13_local12:registerAnimationState( "faded", {
				alpha = 0.38
			} )
			f13_local12:RegisterAnimationSequence( "pulse", {
				{
					"faded",
					0
				},
				{
					"show",
					100
				},
				{
					"faded",
					0
				},
				{
					"show",
					250
				}
			} )
			f13_local12.id = f13_local10 .. "_" .. f13_local14
			f13_local12:SetUseAA( true )
			f13_local12.dataSource = DataSources.inGame.HUD.ringRadar[f0_local3[f13_local13]]
			assert( f13_local12.dataSource )
			f13_local12.layerIdx = f13_local5
			f13_local12.layer = f13_local6
			f13_local12.directionIdx = f13_local13
			f13_local12.isVanishing = false
			f13_local12.SetLit = function ( f15_arg0, f15_arg1 )
				if f15_arg1 == f15_arg0.isLit then
					return 
				end
				f15_arg0.isLit = f15_arg1
				if f15_arg1 then
					f15_arg0:SetAlpha( 1, 100 )
					f15_arg0:SetDepth( -5 * f0_local0, 100 )
					f15_arg0:setImage( RegisterMaterial( f13_local11 ) )
					f15_arg0:SetBlendMode( BLEND_MODE.addWithAlpha )
					if f15_arg0.layer == "inner" and not f15_arg0.isVanishing then
						local f15_local0 = f15_arg0:getParent()
						f15_local0:AnimateSequence( "pulse", 0 )
					end
				else
					f15_arg0:SetAlpha( 0.38 )
					f15_arg0:SetDepth( 0, 100 )
					f15_arg0:setImage( RegisterMaterial( f13_local10 ) )
					f15_arg0:SetBlendMode( BLEND_MODE.disabled )
				end
			end
			
			f13_local12:registerEventHandler( "update_ring_radar", UpdateSegment )
			f13_local8.sectionImage = f13_local12
			f13_local8:addElement( f13_local12 )
		end
	end
	self:addElement( RingRadarRingPulse() )
	f13_local3 = LUI.UITimer.new( nil, {
		interval = 100,
		event = "update_ring_radar"
	} )
	f13_local3.id = "refresh_timer"
	self:addElement( f13_local3 )
	f13_local4 = RingRadarRings()
	self.radarRings = f13_local4
	self:addElement( f13_local4 )
	f13_local13 = RingRadarIntroRings()
	self.radarRingsIntro = f13_local13
	self:addElement( f13_local13 )
	f13_local14 = RingRadarIntroSides()
	self.radarBlurSidesContainer = f13_local14
	self:addElement( f13_local14 )
	return self
end

function RingRadarDef()
	local self = LUI.UIElement.new()
	self.id = "ring_radar"
	self:registerAnimationState( "default", {
		topAnchor = false,
		leftAnchor = false,
		bottomAnchor = true,
		rightAnchor = false,
		top = -160,
		left = 0,
		bottom = -160,
		right = 0,
		alpha = 1,
		scale = -0.25
	} )
	self:animateToState( "default", 0 )
	local f16_local1 = function ( f17_arg0, f17_arg1 )
		if f17_arg1.value == 0 then
			f17_arg0.contentOn = false
			if f17_arg0.content then
				f17_arg0.content:closeTree()
				f17_arg0.content = nil
			end
		elseif f17_arg1.value == 1 then
			if f17_arg0.content and not f17_arg0.contentOn then
				f17_arg0.content:closeTree()
				f17_arg0.content = nil
			end
			f17_arg0.contentOn = true
			if not f17_arg0.content then
				f17_arg0.content = RingRadarContent()
				f17_arg0:addElement( f17_arg0.content )
			end
		elseif f17_arg1.value == 2 then
			f17_arg0.contentOn = false
			if f17_arg0.content then
				local f17_local0 = f17_arg0.content
				local f17_local1 = f17_arg0:Wait( f0_local7 )
				f17_local1.onComplete = function ()
					if f17_arg0.content == f17_local0 then
						f17_arg0.content:closeTree()
						f17_arg0.content = nil
					end
				end
				
			end
		end
	end
	
	self:registerOmnvarHandler( "ui_ringradar_enabled", f16_local1 )
	f16_local1( self, {
		value = Game.GetOmnvar( "ui_ringradar_enabled" )
	} )
	self:SubscribeToModel( DataSources.inGame.player.affectedByEMP:GetModel( self:getRootController() ), function ( f19_arg0 )
		if DataModel.GetModelValue( f19_arg0 ) then
			MP.StartEMPGlitch( self )
		else
			MP.StopEMPGlitch( self )
		end
	end )
	return self
end

MenuBuilder.registerType( "ringRadarDef", RingRadarDef )
LockTable( _M )
