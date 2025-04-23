local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function PostLoadFunc( f1_arg0, f1_arg1, f1_arg2 )
	if not CONDITIONS.IsSplitscreen() then
		f1_arg0:setupLetterboxElement( true )
	end
end

function Inventory( menu, controller )
	local self = LUI.UIElement.new()
	self.id = "Inventory"
	self._animationSets = {}
	self._sequences = {}
	local f2_local1 = controller and controller.controllerIndex
	if not f2_local1 and not Engine.InFrontend() then
		f2_local1 = self:getRootController()
	end
	assert( f2_local1 )
	self:playSound( "menu_open" )
	local f2_local2 = self
	local ZomScoreboard = nil
	
	ZomScoreboard = MenuBuilder.BuildRegisteredType( "ZomScoreboard", {
		controllerIndex = f2_local1
	} )
	ZomScoreboard.id = "ZomScoreboard"
	ZomScoreboard:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 96, _1080p * 1170, _1080p * 54, _1080p * 449 )
	self:addElement( ZomScoreboard )
	self.ZomScoreboard = ZomScoreboard
	
	local StickerPack = nil
	
	StickerPack = MenuBuilder.BuildRegisteredType( "StickerPack", {
		controllerIndex = f2_local1
	} )
	StickerPack.id = "StickerPack"
	StickerPack:SetAnchorsAndPosition( 0, 0, 1, 0, 0, 0, _1080p * -300, 0 )
	self:addElement( StickerPack )
	self.StickerPack = StickerPack
	
	local fateInventory5CardWidget = nil
	
	fateInventory5CardWidget = MenuBuilder.BuildRegisteredType( "fateInventory5CardWidget", {
		controllerIndex = f2_local1
	} )
	fateInventory5CardWidget.id = "fateInventory5CardWidget"
	fateInventory5CardWidget.FateCard5.cardBacking:SetAlpha( 0, 0 )
	fateInventory5CardWidget.FateCard4.cardBacking:SetAlpha( 0, 0 )
	fateInventory5CardWidget.FateCard3.cardBacking:SetAlpha( 0, 0 )
	fateInventory5CardWidget.FateCard2.cardBacking:SetAlpha( 0, 0 )
	fateInventory5CardWidget.FateCard1.cardBacking:SetAlpha( 0, 0 )
	fateInventory5CardWidget:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -687, _1080p * -96, _1080p * 54, _1080p * 156 )
	self:addElement( fateInventory5CardWidget )
	self.fateInventory5CardWidget = fateInventory5CardWidget
	
	local DoubleXPNotifications = nil
	
	DoubleXPNotifications = MenuBuilder.BuildRegisteredType( "DoubleXPNotifications", {
		controllerIndex = f2_local1
	} )
	DoubleXPNotifications.id = "DoubleXPNotifications"
	DoubleXPNotifications:SetScale( -0.5, 0 )
	DoubleXPNotifications:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1437.75, _1080p * 1952.75, _1080p * 138, _1080p * 266 )
	self:addElement( DoubleXPNotifications )
	self.DoubleXPNotifications = DoubleXPNotifications
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		ZomScoreboard:RegisterAnimationSequence( "Splitscreen", {
			{
				function ()
					return self.ZomScoreboard:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 96, _1080p * 1551, _1080p * 62, _1080p * 457, 0 )
				end
			}
		} )
		self._sequences.Splitscreen = function ()
			ZomScoreboard:AnimateSequence( "Splitscreen" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	PostLoadFunc( self, f2_local1, controller )
	if CONDITIONS.IsSplitscreen( self ) then
		ACTIONS.AnimateSequence( self, "Splitscreen" )
	end
	return self
end

MenuBuilder.registerType( "Inventory", Inventory )
LockTable( _M )
