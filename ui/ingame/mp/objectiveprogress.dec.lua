local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ( f1_arg0, f1_arg1, f1_arg2 )
	assert( f1_arg0.StateLabel )
	assert( f1_arg0.ObjectiveProgressBar.Fill )
	local f1_local0 = Engine.GetDvarString( "ui_gametype" )
	f1_arg0.wasVisible = false
	ACTIONS.AnimateSequence( f1_arg0, "Hide" )
	local f1_local1 = function ()
		local f2_local0 = DataSources.inGame.HUD.objectiveProgress:GetValue( f1_arg1 )
		if f2_local0 ~= nil then
			local f2_local1 = DataSources.inGame.HUD.objectiveState:GetValue( f1_arg1 )
			local f2_local2
			if f2_local1 == nil or f2_local1 == 0 then
				f2_local2 = false
			else
				f2_local2 = true
			end
			local f2_local3 = nil
			if not f2_local2 or f2_local2 ~= f1_arg0.wasVisible then
				f2_local3 = 0
			else
				f2_local3 = 80
			end
			f1_arg0.ObjectiveProgressBar.Fill:SetRightAnchor( 1 - f2_local0, f2_local3 )
			f1_arg0.wasVisible = f2_local2
		end
	end
	
	if f1_local0 == "sd" or f1_local0 == "sr" or f1_local0 == "dd" then
		f1_arg0.StateLabel:SubscribeToModel( DataSources.inGame.HUD.objectiveState:GetModel( f1_arg1 ), function ()
			local f3_local0 = DataSources.inGame.HUD.objectiveState:GetValue( f1_arg1 )
			if f3_local0 ~= nil then
				if f3_local0 == 0 then
					ACTIONS.AnimateSequence( f1_arg0, "Hide" )
				elseif f3_local0 > 0 then
					ACTIONS.AnimateSequence( f1_arg0, "Show" )
				end
				if f3_local0 == 1 then
					f1_arg0.StateLabel:setText( ToUpperCase( Engine.Localize( "MP_PLANTING_EXPLOSIVE" ) ), 0 )
				elseif f3_local0 == 2 then
					f1_arg0.StateLabel:setText( ToUpperCase( Engine.Localize( "MP_DEFUSING_EXPLOSIVE" ) ), 0 )
				end
			end
		end )
		f1_arg0.ObjectiveProgressBar.Fill:SubscribeToModel( DataSources.inGame.HUD.objectiveProgress:GetModel( f1_arg1 ), f1_local1 )
	elseif f1_local0 == "dom" or f1_local0 == "grind" or f1_local0 == "koth" or f1_local0 == "grnd" or f1_local0 == "siege" then
		f1_arg0:SubscribeToModel( DataSources.inGame.HUD.objectiveState:GetModel( f1_arg1 ), function ()
			local f4_local0 = DataSources.inGame.HUD.objectiveState:GetValue( f1_arg1 )
			if f4_local0 ~= nil then
				if f4_local0 == 0 then
					ACTIONS.AnimateSequence( f1_arg0, "Hide" )
				else
					ACTIONS.AnimateSequence( f1_arg0, "Show" )
				end
				if f4_local0 < 0 then
					f1_arg0.StateLabel:setText( ToUpperCase( Engine.Localize( "LUA_MENU_CONTESTED" ) ), 0 )
				elseif f4_local0 == 1 then
					f1_arg0.StateLabel:setText( ToUpperCase( Engine.Localize( "LUA_MENU_SECURING_A" ) ), 0 )
				elseif f4_local0 == 2 then
					f1_arg0.StateLabel:setText( ToUpperCase( Engine.Localize( "LUA_MENU_SECURING_B" ) ), 0 )
				elseif f4_local0 == 3 then
					f1_arg0.StateLabel:setText( ToUpperCase( Engine.Localize( "LUA_MENU_SECURING_C" ) ), 0 )
				elseif f4_local0 == 4 then
					f1_arg0.StateLabel:setText( ToUpperCase( Engine.Localize( "MP_INGAME_ONLY_NEUTRALIZING_A" ) ), 0 )
				elseif f4_local0 == 5 then
					f1_arg0.StateLabel:setText( ToUpperCase( Engine.Localize( "MP_INGAME_ONLY_NEUTRALIZING_B" ) ), 0 )
				elseif f4_local0 == 6 then
					f1_arg0.StateLabel:setText( ToUpperCase( Engine.Localize( "MP_INGAME_ONLY_NEUTRALIZING_C" ) ), 0 )
				elseif f4_local0 == 7 then
					f1_arg0.StateLabel:setText( ToUpperCase( Engine.Localize( "LUA_MENU_SECURING" ) ), 0 )
				elseif f4_local0 == 8 then
					f1_arg0.StateLabel:setText( ToUpperCase( Engine.Localize( "LUA_MENU_DESTROYING" ) ), 0 )
				end
			end
		end )
		f1_arg0.ObjectiveProgressBar.Fill:SubscribeToModel( DataSources.inGame.HUD.objectiveProgress:GetModel( f1_arg1 ), f1_local1 )
	elseif f1_local0 == "ctf" then
		f1_arg0:SubscribeToModel( DataSources.inGame.HUD.objectiveState:GetModel( f1_arg1 ), function ()
			local f5_local0 = DataSources.inGame.HUD.objectiveState:GetValue( f1_arg1 )
			if f5_local0 ~= nil then
				if f5_local0 == 0 then
					ACTIONS.AnimateSequence( f1_arg0, "Hide" )
				else
					ACTIONS.AnimateSequence( f1_arg0, "Show" )
				end
				if f5_local0 < 0 then
					f1_arg0.StateLabel:setText( ToUpperCase( Engine.Localize( "LUA_MENU_CONTESTED" ) ), 0 )
				elseif f5_local0 == 1 then
					f1_arg0.StateLabel:setText( ToUpperCase( Engine.Localize( "MP_GRABBING_FLAG" ) ), 0 )
				elseif f5_local0 == 2 then
					f1_arg0.StateLabel:setText( ToUpperCase( Engine.Localize( "MP_RETURNING_FLAG" ) ), 0 )
				end
			end
		end )
		f1_arg0.ObjectiveProgressBar.Fill:SubscribeToModel( DataSources.inGame.HUD.objectiveProgress:GetModel( f1_arg1 ), f1_local1 )
	end
end

function ObjectiveProgress( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 300 * _1080p, 0, 50 * _1080p )
	self.id = "ObjectiveProgress"
	self._animationSets = {}
	self._sequences = {}
	local f6_local1 = controller and controller.controllerIndex
	if not f6_local1 and not Engine.InFrontend() then
		f6_local1 = self:getRootController()
	end
	assert( f6_local1 )
	local f6_local2 = self
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
	VerticalLine:SetAlpha( 0.6, 0 )
	VerticalLine:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 8.75, _1080p * 9.75, _1080p * 4.64, _1080p * 28 )
	self:addElement( VerticalLine )
	self.VerticalLine = VerticalLine
	
	local StateLabel = nil
	
	StateLabel = LUI.UIText.new()
	StateLabel.id = "StateLabel"
	StateLabel:setText( ToUpperCase( Engine.Localize( "MP_PLANTING_EXPLOSIVE" ) ), 0 )
	StateLabel:SetFontSize( 24 * _1080p )
	StateLabel:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	StateLabel:SetAlignment( LUI.Alignment.Left )
	StateLabel:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 16.5, _1080p * 289.5, _1080p * 4.64, _1080p * 28.64 )
	self:addElement( StateLabel )
	self.StateLabel = StateLabel
	
	local ObjectiveProgressBar = nil
	
	ObjectiveProgressBar = MenuBuilder.BuildRegisteredType( "ObjectiveProgressBar", {
		controllerIndex = f6_local1
	} )
	ObjectiveProgressBar.id = "ObjectiveProgressBar"
	ObjectiveProgressBar:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 10, _1080p * 285, _1080p * 33, _1080p * 43 )
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
					return self.VerticalLine:SetAlpha( 0.4, 0 )
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
	f0_local0( self, f6_local1, controller )
	return self
end

MenuBuilder.registerType( "ObjectiveProgress", ObjectiveProgress )
LockTable( _M )
