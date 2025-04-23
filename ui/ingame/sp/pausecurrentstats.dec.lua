local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function PauseCurrentStats( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 1123 * _1080p, 0, 114 * _1080p )
	self.id = "PauseCurrentStats"
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local f1_local3 = nil
	if DataSources.inGame.SP.totalLootRooms:GetValue( f1_local1 ) ~= nil and DataSources.inGame.SP.totalLootRooms:GetValue( f1_local1 ) > 0 then
		f1_local3 = LUI.UIText.new()
		f1_local3.id = "LootRoomTitle"
		f1_local3:SetRGBFromInt( 14737632, 0 )
		f1_local3:SetAlpha( 0.8, 0 )
		f1_local3:setText( Engine.Localize( "LUA_MENU_LOOT_ROOMS_FOUND" ), 0 )
		f1_local3:SetFontSize( 36 * _1080p )
		f1_local3:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
		f1_local3:setTextStyle( CoD.TextStyle.Outlined )
		f1_local3:SetAlignment( LUI.Alignment.Right )
		f1_local3:SetOptOutRightToLeftAlignmentFlip( true )
		f1_local3:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -1078, _1080p * -668, _1080p * 41, _1080p * 77 )
		self:addElement( f1_local3 )
		self.LootRoomTitle = f1_local3
	end
	local f1_local4 = nil
	if DataSources.inGame.SP.totalLootRooms:GetValue( f1_local1 ) ~= nil and DataSources.inGame.SP.totalLootRooms:GetValue( f1_local1 ) > 0 then
		f1_local4 = LUI.UIText.new()
		f1_local4.id = "LootRoomsCount"
		f1_local4:SetRGBFromInt( 5483955, 0 )
		f1_local4:SetAlpha( 0.8, 0 )
		f1_local4:SetFontSize( 36 * _1080p )
		f1_local4:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
		f1_local4:setTextStyle( CoD.TextStyle.Outlined )
		f1_local4:SetAlignment( LUI.Alignment.Left )
		f1_local4:SetOptOutRightToLeftAlignmentFlip( true )
		f1_local4:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -661, _1080p * -491, _1080p * 41, _1080p * 77 )
		f1_local4:SubscribeToModel( DataSources.inGame.SP.lootRoomsFraction:GetModel( f1_local1 ), function ()
			local f2_local0 = DataSources.inGame.SP.lootRoomsFraction:GetValue( f1_local1 )
			if f2_local0 ~= nil then
				f1_local4:setText( f2_local0, 0 )
			end
		end )
		self:addElement( f1_local4 )
		self.LootRoomsCount = f1_local4
	end
	return self
end

MenuBuilder.registerType( "PauseCurrentStats", PauseCurrentStats )
LockTable( _M )
