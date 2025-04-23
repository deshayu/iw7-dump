local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ( f1_arg0, f1_arg1, f1_arg2 )
	if Engine.IsGamepadEnabled() ~= 1 then
		f1_arg0.DPad:closeTree()
	end
	local f1_local0 = nil
	if GameX.IsRankedMatch() then
		f1_local0 = DataSources.alwaysLoaded.playerData.MP.rankedloadouts.squadMembers
	else
		f1_local0 = DataSources.alwaysLoaded.playerData.MP.privateloadouts.squadMembers
	end
	local f1_local1 = 4
	local f1_local2 = 24
	for f1_local3 = 1, 4, 1 do
		local f1_local6 = f1_arg0["Slot" .. f1_local3]
		assert( f1_local6 )
		f1_local6:SetShadowUOffset( -0 )
		f1_local6:SetShadowVOffset( -0 )
		f1_local6:SetWordWrap( false )
		local f1_local7 = f1_local0.taunts
		local f1_local8 = Game.GetOmnvar( "ui_selected_archetype" )
		if f1_local8 >= 0 then
			f1_local7 = f1_local0.archetypePreferences[f1_local8].taunts
		end
		local f1_local9 = Engine.TableLookup( CSV.taunts.file, CSV.taunts.cols.ref, f1_local7[f1_local3 - 1]:GetValue( f1_arg1 ), CSV.taunts.cols.name )
		if Engine.IsGamepadEnabled() ~= 1 then
			local f1_local10 = f1_local3 * (f1_local2 + f1_local1) * _1080p
			f1_local6:SetAlignment( LUI.Alignment.Right )
			f1_local6:SetAnchorsAndPosition( 1, 0, 0, 1, 0, 0, f1_local10, f1_local10 + f1_local2 * _1080p )
			f1_local6:setText( Engine.Localize( "MP_INGAME_ONLY_BROSHOT_KEY_TAUNT", "[{+actionslot " .. f1_local3 + 2 .. "}]", f1_local9 ) )
		else
			f1_local6:setText( Engine.Localize( f1_local9 ) )
		end
	end
end

function BroshotTaunt( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 600 * _1080p, 0, 150 * _1080p )
	self.id = "BroshotTaunt"
	local f2_local1 = controller and controller.controllerIndex
	if not f2_local1 and not Engine.InFrontend() then
		f2_local1 = self:getRootController()
	end
	assert( f2_local1 )
	local f2_local2 = self
	local DPad = nil
	
	DPad = LUI.UIImage.new()
	DPad.id = "DPad"
	DPad:setImage( RegisterMaterial( "button_dpad" ), 0 )
	DPad:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -24, _1080p * 24, _1080p * -24, _1080p * 24 )
	self:addElement( DPad )
	self.DPad = DPad
	
	local Slot1 = nil
	
	Slot1 = LUI.UIStyledText.new()
	Slot1.id = "Slot1"
	Slot1:setText( "", 0 )
	Slot1:SetFontSize( 26 * _1080p )
	Slot1:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	Slot1:SetAlignment( LUI.Alignment.Center )
	Slot1:SetShadowMinDistance( -0.2, 0 )
	Slot1:SetShadowMaxDistance( 0.2, 0 )
	Slot1:SetShadowRGBFromInt( 0, 0 )
	Slot1:SetAnchorsAndPosition( 0, 0, 0.5, 0.5, 0, 0, _1080p * -56, _1080p * -30 )
	self:addElement( Slot1 )
	self.Slot1 = Slot1
	
	local Slot2 = nil
	
	Slot2 = LUI.UIStyledText.new()
	Slot2.id = "Slot2"
	Slot2:setText( "", 0 )
	Slot2:SetFontSize( 26 * _1080p )
	Slot2:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	Slot2:SetAlignment( LUI.Alignment.Center )
	Slot2:SetShadowMinDistance( -0.2, 0 )
	Slot2:SetShadowMaxDistance( 0.2, 0 )
	Slot2:SetShadowRGBFromInt( 0, 0 )
	Slot2:SetAnchorsAndPosition( 0, 0, 0.5, 0.5, 0, 0, _1080p * 30, _1080p * 56 )
	self:addElement( Slot2 )
	self.Slot2 = Slot2
	
	local Slot3 = nil
	
	Slot3 = LUI.UIStyledText.new()
	Slot3.id = "Slot3"
	Slot3:setText( "", 0 )
	Slot3:SetFontSize( 26 * _1080p )
	Slot3:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	Slot3:SetAlignment( LUI.Alignment.Right )
	Slot3:SetShadowMinDistance( -0.2, 0 )
	Slot3:SetShadowMaxDistance( 0.2, 0 )
	Slot3:SetShadowRGBFromInt( 0, 0 )
	Slot3:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -300, _1080p * -50, _1080p * -13, _1080p * 13 )
	self:addElement( Slot3 )
	self.Slot3 = Slot3
	
	local Slot4 = nil
	
	Slot4 = LUI.UIStyledText.new()
	Slot4.id = "Slot4"
	Slot4:setText( "", 0 )
	Slot4:SetFontSize( 26 * _1080p )
	Slot4:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	Slot4:SetAlignment( LUI.Alignment.Left )
	Slot4:SetShadowMinDistance( -0.2, 0 )
	Slot4:SetShadowMaxDistance( 0.2, 0 )
	Slot4:SetShadowRGBFromInt( 0, 0 )
	Slot4:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 50, _1080p * 300, _1080p * -13, _1080p * 13 )
	self:addElement( Slot4 )
	self.Slot4 = Slot4
	
	f0_local0( self, f2_local1, controller )
	return self
end

MenuBuilder.registerType( "BroshotTaunt", BroshotTaunt )
LockTable( _M )
