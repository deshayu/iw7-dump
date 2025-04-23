local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function KleenexPopup( menu, controller )
	local self = LUI.UIElement.new( {
		left = 0,
		right = 0,
		top = 0,
		bottom = 0,
		leftAnchor = true,
		rightAnchor = true,
		topAnchor = true,
		bottomAnchor = true
	} )
	self.id = "KleenexPopup"
	self._animationSets = {}
	self._sequences = {}
	local f1_local1 = controller or {}
	local f1_local2 = nil
	if Engine.InFrontend() then
		f1_local2 = f1_local1.controllerIndex
		if not f1_local2 then
			local f1_local3 = LUI.FlowManager.GetScopedData( self )
			assert( f1_local3 )
			f1_local2 = f1_local3.controllerIndex
		end
	else
		f1_local2 = self:getRootController()
	end
	if PreLoadFunc then
		PreLoadFunc( self, f1_local2 )
	end
	self:playSound( "menu_open" )
	local f1_local3 = self
	
	local Label0 = LUI.UIText.new()
	Label0.id = "Label0"
	Label0:SetAnchors( true, false, true, false )
	Label0:SetLeft( 315.67 )
	Label0:SetRight( 964.33 )
	Label0:SetTop( 248.33 )
	Label0:SetBottom( 313 )
	Label0:SetRGBFromInt( 16777215 )
	Label0:SetZRotation( -10 )
	Label0:SetScale( 0.5 )
	Label0:setText( Engine.Localize( "Please fill out your survey then press the center pad to continue!" ) )
	Label0:SetFont( CoD.TextSettings.NormalFont.Font )
	Label0:SetAlignment( LUI.Alignment.Center )
	self:addElement( Label0 )
	self.Label0 = Label0
	
	self._animationSets.DefaultAnimationSet = function ()
		local f2_local0 = {}
		Label0:registerAnimationState( "DefaultSequenceFrame1", {
			zRot = -10
		} )
		table.insert( f2_local0, {
			"DefaultSequenceFrame1",
			0,
			false,
			false
		} )
		Label0:registerAnimationState( "DefaultSequenceFrame2", {
			zRot = 10
		} )
		table.insert( f2_local0, {
			"DefaultSequenceFrame2",
			1000,
			false,
			false
		} )
		Label0:registerAnimationState( "DefaultSequenceFrame3", {
			zRot = -10
		} )
		table.insert( f2_local0, {
			"DefaultSequenceFrame3",
			1009,
			false,
			false
		} )
		Label0:RegisterAnimationSequence( "DefaultSequence", f2_local0 )
		self._sequences.DefaultSequence = function ()
			Label0:AnimateLoop( "DefaultSequence" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	Label0:addEventHandler( "gamepad_button", function ( f4_arg0, f4_arg1 )
		local f4_local0 = f4_arg1.controller or controller
		if CONDITIONS.ButtonSelect( self, f4_arg1 ) then
			ACTIONS.LeaveMenu( self )
			Engine.SetDvarInt( "cl_paused", 0 )
		end
	end )
	Label0:addEventHandler( "menu_create", function ( f5_arg0, f5_arg1 )
		local f5_local0 = f5_arg1.controller or controller
		ACTIONS.AnimateSequence( self, "DefaultSequence" )
		local self = LUI.UIElement.new( {
			worldBlur = 5
		} )
		self:setupWorldBlur()
		self.id = "kleenex_blur"
		self:addElement( self )
		Engine.SetDvarInt( "cl_paused", 1 )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, f1_local2 )
	end
	return self
end

MenuBuilder.registerType( "KleenexPopup", KleenexPopup )
LockTable( _M )
