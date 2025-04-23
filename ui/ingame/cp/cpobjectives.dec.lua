local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
CoD.PrintModuleLoad( _NAME )
function CPObjectives()
	local f1_local0 = {
		File = "cp/ship/objectiveTable.csv",
		Ref = 0,
		Name = 1,
		Desc = 2,
		DurationL = 4,
		DurationM = 5
	}
	local f1_local1 = ""
	local f1_local2 = -1
	local self = LUI.UIElement.new()
	self.id = "objectives"
	self:registerAnimationState( "default", {
		topAnchor = true,
		bottomAnchor = true,
		leftAnchor = true,
		rightAnchor = true,
		top = 0,
		left = 0,
		right = 0,
		bottom = 0
	} )
	self:animateToState( "default" )
	local f1_local4 = LUI.UIElement.new()
	f1_local4.id = "content"
	f1_local4:registerAnimationState( "default", {
		topAnchor = true,
		bottomAnchor = false,
		leftAnchor = true,
		rightAnchor = false,
		top = 23,
		left = 0,
		width = 280,
		height = 80
	} )
	f1_local4:animateToState( "default" )
	local f1_local5 = LUI.UIImage.new()
	f1_local5.id = "background"
	f1_local5:registerAnimationState( "default", {
		material = RegisterMaterial( "hud_message_bg" ),
		topAnchor = true,
		bottomAnchor = true,
		leftAnchor = true,
		rightAnchor = true,
		top = 0,
		bottom = 0,
		left = 0,
		right = 0
	} )
	f1_local5:animateToState( "default" )
	local f1_local6 = LUI.UIText.new()
	f1_local6.id = "title"
	f1_local6:registerAnimationState( "default", CoD.ColorizeState( COLORS.yellow, {
		font = CoD.TextSettings.SmallFont.Font,
		alignment = LUI.Alignment.Left,
		topAnchor = true,
		bottomAnchor = false,
		leftAnchor = true,
		rightAnchor = false,
		left = 10,
		width = 441,
		top = -3,
		height = CoD.TextSettings.SmallFont.Height
	} ) )
	f1_local6:animateToState( "default" )
	f1_local4:addElement( f1_local6 )
	local f1_local7 = LUI.UIText.new()
	f1_local7.id = "value"
	f1_local7:registerAnimationState( "default", CoD.ColorizeState( COLORS.yellow, {
		font = CoD.TextSettings.SmallFont.Font,
		alignment = LUI.Alignment.Left,
		topAnchor = true,
		bottomAnchor = false,
		leftAnchor = true,
		rightAnchor = false,
		left = 10,
		width = 441,
		top = 15,
		height = CoD.TextSettings.SmallFont.Height
	} ) )
	f1_local7:animateToState( "default" )
	f1_local4:addElement( f1_local7 )
	local f1_local8 = LUI.UIElement.new()
	f1_local8.id = "splashes"
	f1_local8:registerAnimationState( "default", {
		topAnchor = true,
		bottomAnchor = false,
		leftAnchor = false,
		rightAnchor = false,
		top = 0,
		left = -605,
		width = 512,
		height = 110,
		alpha = 1
	} )
	f1_local8:registerAnimationState( "middle", {
		topAnchor = true,
		bottomAnchor = false,
		leftAnchor = false,
		rightAnchor = false,
		top = 0,
		left = -200,
		width = 512,
		height = 110,
		alpha = 1
	} )
	f1_local8:registerAnimationState( "hidden", {
		topAnchor = true,
		bottomAnchor = false,
		leftAnchor = false,
		rightAnchor = false,
		top = 0,
		left = -1200,
		width = 512,
		height = 110,
		alpha = 0
	} )
	f1_local8:animateToState( "hidden" )
	local f1_local9 = function ( f2_arg0, f2_arg1, f2_arg2 )
		local f2_local0 = f2_arg1.value
		if not f2_local0 or f2_local0 == -1 then
			f2_arg0:animateToState( "hidden", 0 )
			return 
		else
			local f2_local1 = tonumber( Engine.TableLookupByRow( f1_local0.File, f2_local0, f1_local0.DurationL ) ) * 1000
			local f2_local2 = tonumber( Engine.TableLookupByRow( f1_local0.File, f2_local0, f1_local0.DurationM ) ) * 1000
			f1_local6:setText( f2_arg2 )
			local f2_local3 = MBh.AnimateSequence( {
				{
					"hidden",
					0,
					true,
					true
				},
				{
					"middle",
					400,
					false,
					true
				},
				{
					"middle",
					f2_local2,
					true,
					true
				},
				{
					"default",
					400,
					true,
					false
				},
				{
					"default",
					f2_local1,
					true,
					true
				},
				{
					"hidden",
					200,
					true,
					false
				}
			} )
			f2_local3( f2_arg0, {} )
		end
	end
	
	local f1_local10 = function ( f3_arg0, f3_arg1, f3_arg2 )
		f1_local7:setText( Engine.Localize( Engine.TableLookupByRow( f1_local0.File, f1_local2, f1_local0.Desc ), f3_arg2 ) )
	end
	
	f1_local8:registerOmnvarHandler( "ui_objective_idx", function ( f4_arg0, f4_arg1 )
		f1_local2 = f4_arg1.value
		f1_local9( f4_arg0, f4_arg1, Engine.Localize( Engine.TableLookupByRow( f1_local0.File, f1_local2, f1_local0.Name ) ) )
	end )
	f1_local8:registerOmnvarHandler( "ui_objective_optional_number", function ( f5_arg0, f5_arg1 )
		f1_local10( f5_arg0, f5_arg1, f5_arg1.value )
	end )
	f1_local8:addElement( f1_local5 )
	f1_local8:addElement( f1_local4 )
	self:addElement( f1_local8 )
	return self
end

MenuBuilder.registerType( "CPObjectives", CPObjectives )
LockTable( _M )
