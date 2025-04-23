local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function JackalEquipDetails( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 1507 * _1080p, 0, 200 * _1080p )
	self.id = "JackalEquipDetails"
	self._animationSets = {}
	self._sequences = {}
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local CACItemHeader = nil
	
	CACItemHeader = MenuBuilder.BuildRegisteredType( "CACItemHeader", {
		controllerIndex = f1_local1
	} )
	CACItemHeader.id = "CACItemHeader"
	CACItemHeader.ItemDescription:SetRight( _1080p * 1300, 0 )
	CACItemHeader.ItemName:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	CACItemHeader:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, 0, _1080p * 100 )
	CACItemHeader:SubscribeToModelThroughElement( self, "desc", function ()
		local f2_local0 = self:GetDataSource()
		f2_local0 = f2_local0.desc:GetValue( f1_local1 )
		if f2_local0 ~= nil then
			CACItemHeader.ItemDescription:setText( LocalizeString( f2_local0 ), 0 )
		end
	end )
	CACItemHeader:SubscribeToModelThroughElement( self, "name", function ()
		local f3_local0 = self:GetDataSource()
		f3_local0 = f3_local0.name:GetValue( f1_local1 )
		if f3_local0 ~= nil then
			CACItemHeader.ItemName:setText( LocalizeString( f3_local0 ), 0 )
		end
	end )
	self:addElement( CACItemHeader )
	self.CACItemHeader = CACItemHeader
	
	local f1_local4 = nil
	if not Engine.IsMultiplayer() and CONDITIONS.IsSingleplayer( self ) then
		f1_local4 = LUI.UIImage.new()
		f1_local4.id = "SPStrip"
		f1_local4:SetRGBFromTable( SWATCHES.itemRarity.quality0, 0 )
		f1_local4:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 11, 0, _1080p * 100 )
		self:addElement( f1_local4 )
		self.SPStrip = f1_local4
	end
	local UnlockCriteria = nil
	
	UnlockCriteria = MenuBuilder.BuildRegisteredType( "UnlockCriteria", {
		controllerIndex = f1_local1
	} )
	UnlockCriteria.id = "UnlockCriteria"
	UnlockCriteria:SetDataSourceThroughElement( self, nil )
	UnlockCriteria:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 11, _1080p * 380, _1080p * 200, _1080p * 220 )
	UnlockCriteria:SubscribeToModelThroughElement( self, "unlockText", function ()
		local f4_local0 = self:GetDataSource()
		f4_local0 = f4_local0.unlockText:GetValue( f1_local1 )
		if f4_local0 ~= nil then
			UnlockCriteria.UnlockDesc:setText( LocalizeString( f4_local0 ), 0 )
		end
	end )
	self:addElement( UnlockCriteria )
	self.UnlockCriteria = UnlockCriteria
	
	local ShowcaseLock = nil
	
	ShowcaseLock = MenuBuilder.BuildRegisteredType( "ShowcaseLock", {
		controllerIndex = f1_local1
	} )
	ShowcaseLock.id = "ShowcaseLock"
	ShowcaseLock:SetDataSourceThroughElement( self, nil )
	ShowcaseLock:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -245, _1080p * 267, _1080p * 130, _1080p * 642 )
	self:addElement( ShowcaseLock )
	self.ShowcaseLock = ShowcaseLock
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		CACItemHeader:RegisterAnimationSequence( "OpenMenu", {
			{
				function ()
					return self.CACItemHeader:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 323, 0, 0, _1080p * 100, 0 )
				end,
				function ()
					return self.CACItemHeader:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, 0, _1080p * 100, 300, LUI.EASING.outQuadratic )
				end
			}
		} )
		if not Engine.IsMultiplayer() and CONDITIONS.IsSingleplayer( self ) then
			f1_local4:RegisterAnimationSequence( "OpenMenu", {
				{
					function ()
						return self.SPStrip:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 323, _1080p * 335, 0, _1080p * 100, 0 )
					end,
					function ()
						return self.SPStrip:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 11, 0, _1080p * 100, 300, LUI.EASING.outQuadratic )
					end
				}
			} )
		end
		self._sequences.OpenMenu = function ()
			CACItemHeader:AnimateSequence( "OpenMenu" )
			if not Engine.IsMultiplayer() and CONDITIONS.IsSingleplayer( self ) then
				f1_local4:AnimateSequence( "OpenMenu" )
			end
		end
		
		UnlockCriteria:RegisterAnimationSequence( "HideUnlockCriteria", {
			{
				function ()
					return self.UnlockCriteria:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.HideUnlockCriteria = function ()
			UnlockCriteria:AnimateSequence( "HideUnlockCriteria" )
		end
		
		UnlockCriteria:RegisterAnimationSequence( "ShowUnlockCriteria", {
			{
				function ()
					return self.UnlockCriteria:SetAlpha( 1, 0 )
				end
			}
		} )
		self._sequences.ShowUnlockCriteria = function ()
			UnlockCriteria:AnimateSequence( "ShowUnlockCriteria" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	UnlockCriteria:SetDataSourceThroughElement( self, nil )
	ShowcaseLock:SetDataSourceThroughElement( self, nil )
	self:SubscribeToModelThroughElement( self, "desc", function ()
		ACTIONS.AnimateSequenceByElement( self, {
			elementName = "CACItemHeader",
			sequenceName = "UpdateDescription",
			elementPath = "CACItemHeader"
		} )
	end )
	self:addEventHandler( "menu_create", function ( f17_arg0, f17_arg1 )
		local f17_local0 = f17_arg1.controller or f1_local1
		ACTIONS.AnimateSequence( self, "OpenMenu" )
	end )
	self:SubscribeToModelThroughElement( self, "isUnlocked", function ()
		local f18_local0 = self:GetDataSource()
		if f18_local0.isUnlocked:GetValue( f1_local1 ) ~= nil then
			f18_local0 = self:GetDataSource()
			if f18_local0.isUnlocked:GetValue( f1_local1 ) == true then
				ACTIONS.AnimateSequence( self, "HideUnlockCriteria" )
			end
		end
		f18_local0 = self:GetDataSource()
		if f18_local0.isUnlocked:GetValue( f1_local1 ) ~= nil then
			f18_local0 = self:GetDataSource()
			if f18_local0.isUnlocked:GetValue( f1_local1 ) == false then
				ACTIONS.AnimateSequence( self, "ShowUnlockCriteria" )
			end
		end
	end )
	return self
end

MenuBuilder.registerType( "JackalEquipDetails", JackalEquipDetails )
LockTable( _M )
