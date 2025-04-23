local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ( f1_arg0, f1_arg1, f1_arg2 )
	local f1_local0 = f1_arg0.LeftButtons.SelectPlayer
	local f1_local1 = f1_local0
	f1_local0 = f1_local0.SetAlpha
	local f1_local2
	if f1_arg2 then
		f1_local2 = 1
		if not f1_local2 then
		
		else
			f1_local0( f1_local1, f1_local2 )
			f1_local0 = f1_arg0.LeftButtons.HighlightPlayer
			f1_local1 = f1_local0
			f1_local0 = f1_local0.SetAlpha
			if f1_arg2 then
				f1_local2 = 1
				if not f1_local2 then
				
				else
					f1_local0( f1_local1, f1_local2 )
					f1_local0 = f1_arg0.MiddleButtons.DisplayToolbar
					f1_local1 = f1_local0
					f1_local0 = f1_local0.SetAlpha
					if f1_arg2 then
						f1_local2 = 1
						if not f1_local2 then
						
						else
							f1_local0( f1_local1, f1_local2 )
							f1_local0 = f1_arg0.MiddleButtons.Map
							f1_local1 = f1_local0
							f1_local0 = f1_local0.SetAlpha
							if f1_arg2 then
								f1_local2 = 1
								if not f1_local2 then
								
								else
									f1_local0( f1_local1, f1_local2 )
									if f1_arg0.MiddleButtons.currentGameType ~= "gun" then
										f1_local0 = f1_arg0.MiddleButtons.Loadout
										f1_local1 = f1_local0
										f1_local0 = f1_local0.SetAlpha
										if f1_arg2 then
											f1_local2 = 1
											if not f1_local2 then
											
											else
												f1_local0( f1_local1, f1_local2 )
											end
										end
										f1_local2 = 0.3
									end
									if DataSources.inGame.player.isKeyboardConnected ~= nil and DataSources.inGame.player.isKeyboardConnected:GetValue( f1_arg1 ) then
										f1_local1 = f1_arg0.KeyboardButton.ButtonIcon
										f1_local2 = f1_local1
										f1_local1 = f1_local1.SetAlpha
										local f1_local3
										if f1_arg2 then
											f1_local3 = 1
											if not f1_local3 then
											
											else
												f1_local1( f1_local2, f1_local3 )
												f1_local1 = f1_arg0.KeyboardButton.ButtonText
												f1_local2 = f1_local1
												f1_local1 = f1_local1.SetAlpha
												if f1_arg2 then
													f1_local3 = 1
													if not f1_local3 then
													
													else
														f1_local1( f1_local2, f1_local3 )
													end
												end
												f1_local3 = 0.3
											end
										end
										f1_local3 = 0.3
									end
								end
							end
							f1_local2 = 0.3
						end
					end
					f1_local2 = 0.3
				end
			end
			f1_local2 = 0.3
		end
	end
	f1_local2 = 0.3
end

f0_local1 = function ( f2_arg0, f2_arg1, f2_arg2 )
	f2_arg0.GrayOutPrompts = f0_local0
	CODCASTER.InitToolbarButton( f2_arg0.KeyboardButton, Engine.Localize( "CODCASTER_KB_SHORTCUTS" ), Engine.Localize( "CODCASTER_KEYBOARD_SHORTCUTS" ), true )
	local f2_local0 = DataSources.inGame.player.isKeyboardConnected
	f2_arg0:SubscribeToModel( f2_local0:GetModel( f2_arg1 ), function ()
		local f3_local0 = f2_local0:GetValue( f2_arg1 )
		local f3_local1 = f2_arg0.KeyboardButton
		local f3_local2 = f3_local1
		f3_local1 = f3_local1.SetAlpha
		local f3_local3
		if f3_local0 then
			f3_local3 = 1
			if not f3_local3 then
			
			else
				f3_local1( f3_local2, f3_local3 )
			end
		end
		f3_local3 = 0
	end )
end

function CodcasterToolbar( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 1920 * _1080p, 0, 1080 * _1080p )
	self.id = "CodcasterToolbar"
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
	Background:SetRGBFromInt( 0, 0 )
	Background:SetAlpha( 0.75, 0 )
	Background:SetAnchorsAndPosition( 0, 0, 1, 0, _1080p * -500, _1080p * 500, _1080p * -85, _1080p * 127 )
	self:addElement( Background )
	self.Background = Background
	
	local MiddleButtons = nil
	
	MiddleButtons = MenuBuilder.BuildRegisteredType( "CodcasterToolbarMiddleButtons", {
		controllerIndex = f4_local1
	} )
	MiddleButtons.id = "MiddleButtons"
	MiddleButtons:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 638, _1080p * 1624, _1080p * 959.5, _1080p * 1074.5 )
	self:addElement( MiddleButtons )
	self.MiddleButtons = MiddleButtons
	
	local LeftButtons = nil
	
	LeftButtons = MenuBuilder.BuildRegisteredType( "CodcasterToolbarLeftButtons", {
		controllerIndex = f4_local1
	} )
	LeftButtons.id = "LeftButtons"
	LeftButtons:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 96, _1080p * 638, _1080p * 959.5, _1080p * 1074.5 )
	self:addElement( LeftButtons )
	self.LeftButtons = LeftButtons
	
	local KeyboardButton = nil
	
	KeyboardButton = MenuBuilder.BuildRegisteredType( "CodcasterToolbarButton", {
		controllerIndex = f4_local1
	} )
	KeyboardButton.id = "KeyboardButton"
	KeyboardButton.ButtonIcon:SetLeft( _1080p * 0, 0 )
	KeyboardButton.ButtonIcon:SetRight( _1080p * 42, 0 )
	KeyboardButton.ButtonText:SetLeft( _1080p * 45, 0 )
	KeyboardButton.ButtonText:SetRight( _1080p * 202, 0 )
	KeyboardButton:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1624, _1080p * 1824, _1080p * 1003, _1080p * 1032 )
	self:addElement( KeyboardButton )
	self.KeyboardButton = KeyboardButton
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		Background:RegisterAnimationSequence( "FadeIn", {
			{
				function ()
					return self.Background:SetAlpha( 0, 0 )
				end,
				function ()
					return self.Background:SetAlpha( 0.75, 80 )
				end
			},
			{
				function ()
					return self.Background:SetAnchorsAndPosition( 0, 0, 1, 0, 0, 0, _1080p * -54, _1080p * 74, 0 )
				end,
				function ()
					return self.Background:SetAnchorsAndPosition( 0, 0, 1, 0, 0, 0, _1080p * -85, _1080p * 43, 150 )
				end
			}
		} )
		MiddleButtons:RegisterAnimationSequence( "FadeIn", {
			{
				function ()
					return self.MiddleButtons:SetAlpha( 0, 0 )
				end,
				function ()
					return self.MiddleButtons:SetAlpha( 1, 150 )
				end
			},
			{
				function ()
					return self.MiddleButtons:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 638, _1080p * 1624, _1080p * 990.5, _1080p * 1105.5, 0 )
				end,
				function ()
					return self.MiddleButtons:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 638, _1080p * 1624, _1080p * 959.5, _1080p * 1074.5, 150 )
				end
			}
		} )
		LeftButtons:RegisterAnimationSequence( "FadeIn", {
			{
				function ()
					return self.LeftButtons:SetAlpha( 0, 0 )
				end,
				function ()
					return self.LeftButtons:SetAlpha( 1, 150 )
				end
			},
			{
				function ()
					return self.LeftButtons:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 96, _1080p * 638, _1080p * 990.5, _1080p * 1105.5, 0 )
				end,
				function ()
					return self.LeftButtons:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 96, _1080p * 638, _1080p * 959.5, _1080p * 1074.5, 150 )
				end
			}
		} )
		KeyboardButton:RegisterAnimationSequence( "FadeIn", {
			{
				function ()
					return self.KeyboardButton:SetAlpha( 0, 0 )
				end,
				function ()
					return self.KeyboardButton:SetAlpha( 1, 150 )
				end
			},
			{
				function ()
					return self.KeyboardButton:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1624, _1080p * 1824, _1080p * 1034, _1080p * 1063, 0 )
				end,
				function ()
					return self.KeyboardButton:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1624, _1080p * 1824, _1080p * 1003, _1080p * 1032, 150 )
				end
			}
		} )
		self._sequences.FadeIn = function ()
			Background:AnimateSequence( "FadeIn" )
			MiddleButtons:AnimateSequence( "FadeIn" )
			LeftButtons:AnimateSequence( "FadeIn" )
			KeyboardButton:AnimateSequence( "FadeIn" )
		end
		
		Background:RegisterAnimationSequence( "FadeOut", {
			{
				function ()
					return self.Background:SetAlpha( 0.75, 0 )
				end,
				function ()
					return self.Background:SetAlpha( 0, 150 )
				end
			},
			{
				function ()
					return self.Background:SetAnchorsAndPosition( 0, 0, 1, 0, 0, 0, _1080p * -85, _1080p * 43, 0 )
				end,
				function ()
					return self.Background:SetAnchorsAndPosition( 0, 0, 1, 0, 0, 0, _1080p * -54, _1080p * 74, 150 )
				end
			}
		} )
		MiddleButtons:RegisterAnimationSequence( "FadeOut", {
			{
				function ()
					return self.MiddleButtons:SetAlpha( 1, 0 )
				end,
				function ()
					return self.MiddleButtons:SetAlpha( 0, 80 )
				end
			},
			{
				function ()
					return self.MiddleButtons:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 638, _1080p * 1624, _1080p * 959.5, _1080p * 1074.5, 0 )
				end,
				function ()
					return self.MiddleButtons:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 638, _1080p * 1624, _1080p * 990.5, _1080p * 1105.5, 150 )
				end
			}
		} )
		LeftButtons:RegisterAnimationSequence( "FadeOut", {
			{
				function ()
					return self.LeftButtons:SetAlpha( 1, 0 )
				end,
				function ()
					return self.LeftButtons:SetAlpha( 0, 80 )
				end
			},
			{
				function ()
					return self.LeftButtons:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 96, _1080p * 638, _1080p * 959.5, _1080p * 1074.5, 0 )
				end,
				function ()
					return self.LeftButtons:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 96, _1080p * 638, _1080p * 990.5, _1080p * 1105.5, 150 )
				end
			}
		} )
		KeyboardButton:RegisterAnimationSequence( "FadeOut", {
			{
				function ()
					return self.KeyboardButton:SetAlpha( 1, 0 )
				end,
				function ()
					return self.KeyboardButton:SetAlpha( 0, 80 )
				end
			},
			{
				function ()
					return self.KeyboardButton:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1624, _1080p * 1824, _1080p * 1003, _1080p * 1032, 0 )
				end,
				function ()
					return self.KeyboardButton:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1624, _1080p * 1824, _1080p * 1034, _1080p * 1063, 150 )
				end
			}
		} )
		self._sequences.FadeOut = function ()
			Background:AnimateSequence( "FadeOut" )
			MiddleButtons:AnimateSequence( "FadeOut" )
			LeftButtons:AnimateSequence( "FadeOut" )
			KeyboardButton:AnimateSequence( "FadeOut" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	f0_local1( self, f4_local1, controller )
	return self
end

MenuBuilder.registerType( "CodcasterToolbar", CodcasterToolbar )
LockTable( _M )
