local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ( f1_arg0, f1_arg1, f1_arg2 )
	assert( f1_arg0.StateLabel )
	assert( f1_arg0.ObjectiveProgressBar.Fill )
	f1_arg0:SubscribeToModel( DataSources.inGame.HUD.secureState:GetModel( f1_arg1 ), function ()
		local f2_local0 = DataSources.inGame.HUD.secureState:GetValue( f1_arg1 )
		if f2_local0 ~= nil then
			if f2_local0 == 0 then
				ACTIONS.AnimateSequence( f1_arg0, "Hide" )
			elseif f2_local0 > 0 then
				ACTIONS.AnimateSequence( f1_arg0, "Show" )
			end
			if f2_local0 == 1 then
				f1_arg0.StateLabel:setText( ToUpperCase( Engine.Localize( "KILLSTREAKS_CAPTURING_CRATE" ) ), 0 )
			elseif f2_local0 == 2 then
				f1_arg0.StateLabel:setText( ToUpperCase( Engine.Localize( "LUA_MENU_ACQUIRING_INTEL" ) ), 0 )
			elseif f2_local0 == 3 then
				f1_arg0.StateLabel:setText( ToUpperCase( Engine.Localize( "KILLSTREAKS_BOX_GETTING_VEST" ) ), 0 )
			elseif f2_local0 == 4 then
				f1_arg0.StateLabel:setText( ToUpperCase( Engine.Localize( "KILLSTREAKS_DEPLOYABLE_AMMO_TAKING" ) ), 0 )
			elseif f2_local0 == 5 then
				f1_arg0.StateLabel:setText( ToUpperCase( Engine.Localize( "MPUI_REVIVING" ) ), 0 )
			elseif f2_local0 == 6 then
				f1_arg0.StateLabel:setText( ToUpperCase( Engine.Localize( "MPUI_BEING_REVIVED" ) ), 0 )
			elseif f2_local0 == 7 then
				f1_arg0.StateLabel:setText( ToUpperCase( Engine.Localize( "MP_BREACHING" ) ), 0 )
			elseif f2_local0 == 8 then
				f1_arg0.StateLabel:setText( ToUpperCase( Engine.Localize( "MP_PATCH_USING" ) ), 0 )
			end
		end
	end )
	f1_arg0.ObjectiveProgressBar.Fill:SubscribeToModel( DataSources.inGame.HUD.secureProgress:GetModel( f1_arg1 ), function ()
		local f3_local0 = DataSources.inGame.HUD.secureProgress:GetValue( f1_arg1 )
		if f3_local0 ~= nil then
			f1_arg0.ObjectiveProgressBar.Fill:SetRightAnchor( 1 - f3_local0, 0 )
		end
	end )
end

function GenericProgress( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 300 * _1080p, 0, 50 * _1080p )
	self.id = "GenericProgress"
	self._animationSets = {}
	self._sequences = {}
	local f4_local1 = controller and controller.controllerIndex
	if not f4_local1 and not Engine.InFrontend() then
		f4_local1 = self:getRootController()
	end
	assert( f4_local1 )
	local f4_local2 = self
	local Background = nil
	
	Background = LUI.UIImage.new()
	Background.id = "Background"
	Background:SetRGBFromInt( 7829367, 0 )
	Background:SetAlpha( 0.5, 0 )
	Background:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 300, 0, _1080p * 50 )
	self:addElement( Background )
	self.Background = Background
	
	local VerticalLine = nil
	
	VerticalLine = LUI.UIImage.new()
	VerticalLine.id = "VerticalLine"
	VerticalLine:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 8.75, _1080p * 9.75, _1080p * 4.64, _1080p * 28 )
	self:addElement( VerticalLine )
	self.VerticalLine = VerticalLine
	
	local StateLabel = nil
	
	StateLabel = LUI.UIText.new()
	StateLabel.id = "StateLabel"
	StateLabel:setText( ToUpperCase( Engine.Localize( "KILLSTREAKS_CAPTURING_CRATE" ) ), 0 )
	StateLabel:SetFontSize( 24 * _1080p )
	StateLabel:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	StateLabel:SetAlignment( LUI.Alignment.Left )
	StateLabel:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 16.5, _1080p * 289.5, _1080p * 4.64, _1080p * 28.64 )
	self:addElement( StateLabel )
	self.StateLabel = StateLabel
	
	local ObjectiveProgressBar = nil
	
	ObjectiveProgressBar = MenuBuilder.BuildRegisteredType( "ObjectiveProgressBar", {
		controllerIndex = f4_local1
	} )
	ObjectiveProgressBar.id = "ObjectiveProgressBar"
	ObjectiveProgressBar:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 10.5, _1080p * 289.5, _1080p * 33.29, _1080p * 43.29 )
	self:addElement( ObjectiveProgressBar )
	self.ObjectiveProgressBar = ObjectiveProgressBar
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		Background:RegisterAnimationSequence( "Show", {
			{
				function ()
					return self.Background:SetAlpha( 0.5, 0 )
				end
			}
		} )
		VerticalLine:RegisterAnimationSequence( "Show", {
			{
				function ()
					return self.VerticalLine:SetAlpha( 1, 0 )
				end
			}
		} )
		StateLabel:RegisterAnimationSequence( "Show", {
			{
				function ()
					return self.StateLabel:SetAlpha( 1, 0 )
				end
			}
		} )
		ObjectiveProgressBar:RegisterAnimationSequence( "Show", {
			{
				function ()
					return self.ObjectiveProgressBar:SetAlpha( 1, 0 )
				end
			}
		} )
		self._sequences.Show = function ()
			Background:AnimateSequence( "Show" )
			VerticalLine:AnimateSequence( "Show" )
			StateLabel:AnimateSequence( "Show" )
			ObjectiveProgressBar:AnimateSequence( "Show" )
		end
		
		Background:RegisterAnimationSequence( "Hide", {
			{
				function ()
					return self.Background:SetAlpha( 0, 0 )
				end
			}
		} )
		VerticalLine:RegisterAnimationSequence( "Hide", {
			{
				function ()
					return self.VerticalLine:SetAlpha( 0, 0 )
				end
			}
		} )
		StateLabel:RegisterAnimationSequence( "Hide", {
			{
				function ()
					return self.StateLabel:SetAlpha( 0, 0 )
				end
			}
		} )
		ObjectiveProgressBar:RegisterAnimationSequence( "Hide", {
			{
				function ()
					return self.ObjectiveProgressBar:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.Hide = function ()
			Background:AnimateSequence( "Hide" )
			VerticalLine:AnimateSequence( "Hide" )
			StateLabel:AnimateSequence( "Hide" )
			ObjectiveProgressBar:AnimateSequence( "Hide" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	f0_local0( self, f4_local1, controller )
	ACTIONS.AnimateSequence( self, "Hide" )
	return self
end

MenuBuilder.registerType( "GenericProgress", GenericProgress )
LockTable( _M )
