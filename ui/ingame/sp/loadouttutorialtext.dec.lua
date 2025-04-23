local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function PostLoadFunc( f1_arg0, f1_arg1, f1_arg2 )
	local f1_local0 = Engine.GetLuiRoot()
	LUI.UIRoot.BlockButtonInput( f1_local0, true, "LoadoutTutorialText" )
	local f1_local1 = function ()
		if Game.GetOmnvar( "ui_loadouts_menu_disabled" ) then
			LUI.UIRoot.BlockButtonInput( f1_local0, true, "LoadoutTutorialText" )
			DebugPrint( "locked loadout input" )
		else
			LUI.UIRoot.BlockButtonInput( f1_local0, false, "LoadoutTutorialText" )
			DebugPrint( "un-locked" )
		end
	end
	
	local f1_local2 = Game.GetMapName()
	if f1_local2 == "shipcrib_moon" or f1_local2 == "shipcrib_titan" then
		f1_arg0:SubscribeToModel( DataSources.inGame.SP.loadoutDisableInput:GetModel( f1_arg1 ), f1_local1 )
	end
end

function LoadoutTutorialText( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 1920 * _1080p, 0, 1080 * _1080p )
	self.id = "LoadoutTutorialText"
	self._animationSets = {}
	self._sequences = {}
	local f3_local1 = controller and controller.controllerIndex
	if not f3_local1 and not Engine.InFrontend() then
		f3_local1 = self:getRootController()
	end
	assert( f3_local1 )
	local f3_local2 = self
	self:setUseStencil( true )
	local TutBG = nil
	
	TutBG = LUI.UIImage.new()
	TutBG.id = "TutBG"
	TutBG:SetRGBFromInt( 0, 0 )
	TutBG:SetAlpha( 0, 0 )
	TutBG:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 1920, 0, _1080p * 1080 )
	self:addElement( TutBG )
	self.TutBG = TutBG
	
	local TutText1 = nil
	
	TutText1 = LUI.UIText.new()
	TutText1.id = "TutText1"
	TutText1:SetAlpha( 0, 0 )
	TutText1:setText( ToUpperCase( Engine.Localize( "MENU_SP_EDIT_LOADOUT" ) ), 0 )
	TutText1:SetFontSize( 36 * _1080p )
	TutText1:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	TutText1:SetAlignment( LUI.Alignment.Center )
	TutText1:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 392.02, _1080p * 678.02, _1080p * 267, _1080p * 303 )
	self:addElement( TutText1 )
	self.TutText1 = TutText1
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		TutText1:RegisterAnimationSequence( "Tut1", {
			{
				function ()
					return self.TutText1:SetAlpha( 0, 0 )
				end,
				function ()
					return self.TutText1:SetAlpha( 0, 600 )
				end,
				function ()
					return self.TutText1:SetAlpha( 1, 100 )
				end,
				function ()
					return self.TutText1:SetAlpha( 0.5, 300 )
				end,
				function ()
					return self.TutText1:SetAlpha( 1, 300 )
				end,
				function ()
					return self.TutText1:SetAlpha( 0.5, 300 )
				end,
				function ()
					return self.TutText1:SetAlpha( 1, 300 )
				end,
				function ()
					return self.TutText1:SetAlpha( 1, 2350 )
				end,
				function ()
					return self.TutText1:SetAlpha( 0, 750 )
				end
			},
			{
				function ()
					return self.TutText1:setText( ToUpperCase( Engine.Localize( "MENU_SP_EDIT_LOADOUT" ) ), 0 )
				end
			},
			{
				function ()
					return self.TutText1:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 300.02, _1080p * 668.02, _1080p * 216, _1080p * 252, 0 )
				end
			}
		} )
		self._sequences.Tut1 = function ()
			TutText1:AnimateSequence( "Tut1" )
		end
		
		TutText1:RegisterAnimationSequence( "Tut2", {
			{
				function ()
					return self.TutText1:SetAlpha( 0, 0 )
				end,
				function ()
					return self.TutText1:SetAlpha( 0, 600 )
				end,
				function ()
					return self.TutText1:SetAlpha( 1, 100 )
				end,
				function ()
					return self.TutText1:SetAlpha( 0.5, 300 )
				end,
				function ()
					return self.TutText1:SetAlpha( 1, 300 )
				end,
				function ()
					return self.TutText1:SetAlpha( 0.5, 300 )
				end,
				function ()
					return self.TutText1:SetAlpha( 1, 300 )
				end,
				function ()
					return self.TutText1:SetAlpha( 1, 2350 )
				end,
				function ()
					return self.TutText1:SetAlpha( 0, 750 )
				end
			},
			{
				function ()
					return self.TutText1:setText( ToUpperCase( Engine.Localize( "MENU_SP_CHOOSE_PRIMARY" ) ), 0 )
				end
			},
			{
				function ()
					return self.TutText1:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 130, _1080p * 490.96, _1080p * 244, _1080p * 280, 0 )
				end
			}
		} )
		self._sequences.Tut2 = function ()
			TutText1:AnimateSequence( "Tut2" )
		end
		
		TutText1:RegisterAnimationSequence( "Tut3", {
			{
				function ()
					return self.TutText1:SetAlpha( 0, 0 )
				end,
				function ()
					return self.TutText1:SetAlpha( 0, 600 )
				end,
				function ()
					return self.TutText1:SetAlpha( 1, 100 )
				end,
				function ()
					return self.TutText1:SetAlpha( 0.5, 300 )
				end,
				function ()
					return self.TutText1:SetAlpha( 1, 300 )
				end,
				function ()
					return self.TutText1:SetAlpha( 0.5, 300 )
				end,
				function ()
					return self.TutText1:SetAlpha( 1, 300 )
				end,
				function ()
					return self.TutText1:SetAlpha( 1, 2350 )
				end,
				function ()
					return self.TutText1:SetAlpha( 0, 750 )
				end
			},
			{
				function ()
					return self.TutText1:setText( ToUpperCase( Engine.Localize( "MENU_SP_ENERGY_WEAPON_CHOOSE" ) ), 0 )
				end
			},
			{
				function ()
					return self.TutText1:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 130, _1080p * 416, _1080p * 239, _1080p * 275, 0 )
				end
			}
		} )
		self._sequences.Tut3 = function ()
			TutText1:AnimateSequence( "Tut3" )
		end
		
		TutText1:RegisterAnimationSequence( "Tut4", {
			{
				function ()
					return self.TutText1:SetAlpha( 0, 0 )
				end,
				function ()
					return self.TutText1:SetAlpha( 0, 600 )
				end,
				function ()
					return self.TutText1:SetAlpha( 1, 100 )
				end,
				function ()
					return self.TutText1:SetAlpha( 0.5, 300 )
				end,
				function ()
					return self.TutText1:SetAlpha( 1, 300 )
				end,
				function ()
					return self.TutText1:SetAlpha( 0.5, 300 )
				end,
				function ()
					return self.TutText1:SetAlpha( 1, 300 )
				end,
				function ()
					return self.TutText1:SetAlpha( 1, 2350 )
				end,
				function ()
					return self.TutText1:SetAlpha( 0, 750 )
				end
			},
			{
				function ()
					return self.TutText1:setText( ToUpperCase( Engine.Localize( "MENU_SP_SELECT_ATTACH" ) ), 0 )
				end
			},
			{
				function ()
					return self.TutText1:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 489.5, _1080p * 636.5, _1080p * 250.5, _1080p * 286.5, 0 )
				end
			}
		} )
		self._sequences.Tut4 = function ()
			TutText1:AnimateSequence( "Tut4" )
		end
		
		TutText1:RegisterAnimationSequence( "Tut5", {
			{
				function ()
					return self.TutText1:SetAlpha( 0, 0 )
				end,
				function ()
					return self.TutText1:SetAlpha( 0, 600 )
				end,
				function ()
					return self.TutText1:SetAlpha( 1, 100 )
				end,
				function ()
					return self.TutText1:SetAlpha( 0.5, 300 )
				end,
				function ()
					return self.TutText1:SetAlpha( 1, 300 )
				end,
				function ()
					return self.TutText1:SetAlpha( 0.5, 300 )
				end,
				function ()
					return self.TutText1:SetAlpha( 1, 300 )
				end,
				function ()
					return self.TutText1:SetAlpha( 1, 2350 )
				end,
				function ()
					return self.TutText1:SetAlpha( 0, 750 )
				end
			},
			{
				function ()
					return self.TutText1:setText( ToUpperCase( Engine.Localize( "MENU_SP_EQUIPMENT_SELECT" ) ), 0 )
				end
			},
			{
				function ()
					return self.TutText1:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 241.05, _1080p * 527.05, _1080p * 646.5, _1080p * 682.5, 0 )
				end
			}
		} )
		self._sequences.Tut5 = function ()
			TutText1:AnimateSequence( "Tut5" )
		end
		
		TutText1:RegisterAnimationSequence( "Tut6", {
			{
				function ()
					return self.TutText1:SetAlpha( 0, 0 )
				end,
				function ()
					return self.TutText1:SetAlpha( 0, 600 )
				end,
				function ()
					return self.TutText1:SetAlpha( 1, 100 )
				end,
				function ()
					return self.TutText1:SetAlpha( 0.5, 300 )
				end,
				function ()
					return self.TutText1:SetAlpha( 1, 300 )
				end,
				function ()
					return self.TutText1:SetAlpha( 0.5, 300 )
				end,
				function ()
					return self.TutText1:SetAlpha( 1, 300 )
				end,
				function ()
					return self.TutText1:SetAlpha( 1, 2350 )
				end,
				function ()
					return self.TutText1:SetAlpha( 0, 750 )
				end
			},
			{
				function ()
					return self.TutText1:setText( ToUpperCase( Engine.Localize( "MENU_SP_RESOURCE_LEVEL" ) ), 0 )
				end
			},
			{
				function ()
					return self.TutText1:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1501.06, _1080p * 1824, _1080p * 112.5, _1080p * 148.5, 0 )
				end
			}
		} )
		self._sequences.Tut6 = function ()
			TutText1:AnimateSequence( "Tut6" )
		end
		
		TutBG:RegisterAnimationSequence( "Create", {
			{
				function ()
					return self.TutBG:SetAlpha( 0, 0 )
				end
			}
		} )
		TutText1:RegisterAnimationSequence( "Create", {
			{
				function ()
					return self.TutText1:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.Create = function ()
			TutBG:AnimateSequence( "Create" )
			TutText1:AnimateSequence( "Create" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	self:SubscribeToModel( DataSources.inGame.SP.shipCrib.loadoutTutIndex:GetModel( f3_local1 ), function ()
		if DataSources.inGame.SP.shipCrib.loadoutTutIndex:GetValue( f3_local1 ) ~= nil and DataSources.inGame.SP.shipCrib.loadoutTutIndex:GetValue( f3_local1 ) == 1 then
			ACTIONS.AnimateSequence( self, "Tut1" )
		end
		if DataSources.inGame.SP.shipCrib.loadoutTutIndex:GetValue( f3_local1 ) ~= nil and DataSources.inGame.SP.shipCrib.loadoutTutIndex:GetValue( f3_local1 ) == 2 then
			ACTIONS.AnimateSequence( self, "Tut2" )
		end
		if DataSources.inGame.SP.shipCrib.loadoutTutIndex:GetValue( f3_local1 ) ~= nil and DataSources.inGame.SP.shipCrib.loadoutTutIndex:GetValue( f3_local1 ) == 3 then
			ACTIONS.AnimateSequence( self, "Tut3" )
		end
		if DataSources.inGame.SP.shipCrib.loadoutTutIndex:GetValue( f3_local1 ) ~= nil and DataSources.inGame.SP.shipCrib.loadoutTutIndex:GetValue( f3_local1 ) == 4 then
			ACTIONS.AnimateSequence( self, "Tut4" )
		end
		if DataSources.inGame.SP.shipCrib.loadoutTutIndex:GetValue( f3_local1 ) ~= nil and DataSources.inGame.SP.shipCrib.loadoutTutIndex:GetValue( f3_local1 ) == 5 then
			ACTIONS.AnimateSequence( self, "Tut5" )
		end
		if DataSources.inGame.SP.shipCrib.loadoutTutIndex:GetValue( f3_local1 ) ~= nil and DataSources.inGame.SP.shipCrib.loadoutTutIndex:GetValue( f3_local1 ) == 6 then
			ACTIONS.AnimateSequence( self, "Tut6" )
		end
		if DataSources.inGame.SP.shipCrib.loadoutTutIndex:GetValue( f3_local1 ) ~= nil and DataSources.inGame.SP.shipCrib.loadoutTutIndex:GetValue( f3_local1 ) == 0 then
			ACTIONS.AnimateSequence( self, "Create" )
		end
	end )
	PostLoadFunc( self, f3_local1, controller )
	ACTIONS.AnimateSequence( self, "Create" )
	return self
end

MenuBuilder.registerType( "LoadoutTutorialText", LoadoutTutorialText )
LockTable( _M )
