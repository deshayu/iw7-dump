local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = 2
f0_local1 = 1500
f0_local2 = -4
local f0_local3 = 1973790
local f0_local4 = 9868950
local f0_local5 = 16777215
local f0_local6 = function ( f1_arg0, f1_arg1 )
	for f1_local0 = 1, #f1_arg0.Items, 1 do
		f1_arg0.Items[f1_local0]:SetRGBFromInt( f0_local4, 0 )
		f1_arg0.ItemsHighlights[f1_local0]:SetAlpha( 0, 0 )
	end
	f1_arg0.ItemName.Text:setText( Engine.Localize( f1_arg0.ItemsNames[f1_arg1] ), 0 )
	f1_arg0.Items[f1_arg1]:SetRGBFromInt( f0_local5, 0 )
	f1_arg0.ItemsHighlights[f1_arg1]:SetAlpha( 1, 0 )
end

local f0_local7 = function ( f2_arg0 )
	return function ()
		if f2_arg0.containerIsVisible and f2_arg0:isInFocus() then
			f2_arg0:HighlightItem( f2_arg0.DisplayedItemId )
			f2_arg0.DisplayedItemId = f2_arg0.DisplayedItemId + 1
			if #f2_arg0.ItemsNames < f2_arg0.DisplayedItemId then
				f2_arg0.DisplayedItemId = 1
			end
			f2_arg0.itemCycleTween = f2_arg0:Wait( f0_local1 )
			f2_arg0.itemCycleTween.onComplete = f2_arg0:CycleItem()
		else
			f2_arg0.CycleTweenRunning = false
		end
	end
	
end

local f0_local8 = function ( f4_arg0 )
	if f4_arg0.isSelectable then
		for f4_local0 = 1, #f4_arg0.Items, 1 do
			f4_arg0.Items[f4_local0]:SetRGBFromInt( f0_local4, 0 )
			f4_arg0.ItemsHighlights[f4_local0]:SetAlpha( 0, 0 )
		end
		if f4_arg0:isInFocus() then
			f4_arg0.ItemName:SetAlpha( 1, 0 )
			if #f4_arg0.ItemsNames == 1 then
				f4_arg0:HighlightItem( 1 )
			elseif #f4_arg0.ItemsNames > 1 then
				f4_arg0.DisplayedItemId = 1
				if f4_arg0.CycleTweenRunning then
					f4_arg0.itemCycleTween.onComplete = function ()
						
					end
					
				end
				local f4_local1 = f4_arg0:CycleItem()
				f4_local1()
				f4_arg0.CycleTweenRunning = true
			end
		end
		f4_arg0.ItemName:SetAlpha( 0, 0 )
		if f4_arg0.CycleTweenRunning then
			f4_arg0.itemCycleTween.onComplete = function ()
				
			end
			
			f4_arg0.CycleTweenRunning = false
		end
	end
end

local f0_local9 = function ( f7_arg0, f7_arg1, f7_arg2, f7_arg3, f7_arg4, f7_arg5, f7_arg6, f7_arg7, f7_arg8 )
	f7_arg0.ItemsNames = f7_arg3
	f7_arg0:UpdateItemInfo()
	local f7_local0 = f7_arg4
	local f7_local1 = f7_arg1
	if f7_arg5 then
		f7_local0 = f7_local0 / 2
		f7_local1 = f7_local1 / 2
	end
	local f7_local2 = f7_local0 * math.ceil( #f7_arg2 / f0_local0 ) + f7_arg6 + f7_arg7
	if #f7_arg2 == 0 then
		f7_local2 = 0
		f7_arg0:SetAlpha( 0, 0 )
		f7_arg0:SetButtonDisabled( true )
		f7_arg0:SetFocusable( false )
		f7_arg0.containerIsVisible = false
	else
		f7_arg0:SetAlpha( 1, 0 )
		f7_arg0:SetButtonDisabled( false )
		f7_arg0:SetFocusable( true )
		f7_arg0.containerIsVisible = true
	end
	if f7_arg0.id == "RigContainer" then
		f7_arg0:SetFocusable( true )
	end
	local f7_local3 = {
		borderThicknessLeft = _1080p * 0,
		borderThicknessRight = _1080p * 2,
		borderThicknessTop = _1080p * 1,
		borderThicknessBottom = _1080p * 1
	}
	if #f7_arg2 > 0 and #f7_arg2 ~= #f7_arg0.Items then
		f7_arg0.Background:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * f7_local2, 0, _1080p * f7_arg1 )
		for f7_local4 = #f7_arg0.Items, 1, -1 do
			f7_arg0:removeElement( f7_arg0.Items[f7_local4] )
			table.remove( f7_arg0.Items, f7_local4 )
		end
		for f7_local4 = #f7_arg0.ItemsHighlights, 1, -1 do
			f7_arg0:removeElement( f7_arg0.ItemsHighlights[f7_local4] )
			table.remove( f7_arg0.ItemsHighlights, f7_local4 )
		end
		for f7_local4 = #f7_arg0.ItemsBorders, 1, -1 do
			f7_arg0:removeElement( f7_arg0.ItemsBorders[f7_local4] )
			table.remove( f7_arg0.ItemsBorders, f7_local4 )
		end
		for f7_local4 = 1, #f7_arg2, 1 do
			local self = LUI.UIImage.new()
			local f7_local8 = LUI.UIBorder.new( f7_local3 )
			local f7_local9 = 0
			if f7_arg5 and #f7_arg2 == 1 then
				f7_local9 = f7_local1 / 2
			elseif f7_local4 % 2 == 0 then
				f7_local9 = f7_local1
			end
			local f7_local10 = _1080p * (f7_local0 * (f7_local4 - 1 - math.floor( f7_local4 / f0_local0 )) + f7_arg6)
			local f7_local11 = _1080p * (f7_local0 * (f7_local4 - math.floor( f7_local4 / f0_local0 )) + f7_arg6)
			local f7_local12 = _1080p * f7_local9
			local f7_local13 = _1080p * (f7_local9 + f7_local1)
			local f7_local14 = f7_local10
			local f7_local15 = _1080p * f7_local2
			local f7_local16 = f7_local12
			local f7_local17 = f7_local13
			if #f7_arg2 == 1 then
				f7_local16 = 0
				f7_local17 = _1080p * f7_arg1
			end
			local f7_local18 = 5
			if f7_local4 <= 2 then
				f7_local14 = f7_local14 - f7_arg6
				if #f7_arg2 > 2 then
					f7_local10 = f7_local10 - f7_local18
					f7_local11 = f7_local11 - f7_local18
					f7_local15 = _1080p * f7_local2 / 2
				end
			elseif f7_local4 > 2 then
				f7_local10 = f7_local10 + f7_local18 - 1
				f7_local11 = f7_local11 + f7_local18 - 1
			end
			self:SetAnchorsAndPosition( 0, 1, 0, 1, f7_local10, f7_local11, f7_local12, f7_local13 )
			f7_local8:SetAnchorsAndPosition( 0, 1, 0, 1, 0, f7_local15, f7_local16, f7_local17 )
			self:SetAlpha( 1, 0 )
			f7_local8:SetAlpha( 0.4, 0 )
			f7_local8:SetRGBFromInt( f7_arg8, 0 )
			if f7_arg0.isSelectable then
				self:SetRGBFromInt( f0_local4, 0 )
				local f7_local19 = LUI.UIImage.new()
				f7_local19:SetAnchorsAndPosition( 0, 1, 0, 1, f7_local14, f7_local15, f7_local16, f7_local17 )
				f7_local19:SetAlpha( 0, 0 )
				f7_local19:SetRGBFromInt( 0, 0 )
				f7_arg0:addElement( f7_local19 )
				table.insert( f7_arg0.ItemsHighlights, f7_local19 )
			end
			f7_arg0:addElement( self )
			table.insert( f7_arg0.Items, self )
			f7_arg0:addElement( f7_local8 )
			table.insert( f7_arg0.ItemsBorders, Border )
		end
		if f7_arg0.isSelectable then
			f7_arg0:removeElement( f7_arg0.GenericButtonSelection )
			f7_arg0.GenericButtonSelection = MenuBuilder.BuildRegisteredType( "GenericButtonSelection", {
				controllerIndex = controllerIndex
			} )
			f7_arg0.GenericButtonSelection.id = "GenericButtonSelection"
			f7_arg0.GenericButtonSelection:SetAnchorsAndPosition( 0, 1, 0, 1, f0_local2, _1080p * f7_local2, 0, _1080p * f7_arg1 )
			f7_arg0:addElement( f7_arg0.GenericButtonSelection )
			f7_arg0.ItemName:SetLeft( _1080p * f7_local2 / 2 )
		else
			for f7_local4 = 1, #f7_arg2, 1 do
				f7_arg0.Items[f7_local4]:setImage( RegisterMaterial( f7_arg2[f7_local4] ), 0 )
			end
			return f7_local2
		end
	end
	for f7_local4 = 1, #f7_arg2, 1 do
		f7_arg0.Items[f7_local4]:setImage( RegisterMaterial( f7_arg2[f7_local4] ), 0 )
	end
	return f7_local2
end

local f0_local10 = function ( f8_arg0 )
	f8_arg0.isSelectable = false
	f8_arg0:removeElement( f8_arg0.GenericButtonSelection )
	f8_arg0:removeElement( f8_arg0.ItemName )
end

local f0_local11 = function ( f9_arg0, f9_arg1, f9_arg2 )
	f9_arg0.UpdateContainer = f0_local9
	f9_arg0.UpdateItemInfo = f0_local8
	f9_arg0.CycleItem = f0_local7
	f9_arg0.HighlightItem = f0_local6
	f9_arg0.SetUnselectable = f0_local10
	f9_arg0.CycleTweenRunning = false
	f9_arg0.isSelectable = true
	f9_arg0.width = f9_arg0:getWidth()
	f9_arg0.height = f9_arg0:getHeight()
	f9_arg0.Items = {}
	f9_arg0.ItemsHighlights = {}
	f9_arg0.ItemsNames = {}
	f9_arg0.ItemsBorders = {}
	f9_arg0.Background:SetRGBFromInt( f0_local3, 0 )
end

function CodCasterLoadoutItemContainer( menu, controller )
	local self = LUI.UIButton.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 106 * _1080p, 0, 106 * _1080p )
	self.id = "CodCasterLoadoutItemContainer"
	local f10_local1 = controller and controller.controllerIndex
	if not f10_local1 and not Engine.InFrontend() then
		f10_local1 = self:getRootController()
	end
	assert( f10_local1 )
	local f10_local2 = self
	local Background = nil
	
	Background = LUI.UIBlur.new()
	Background.id = "Background"
	Background:SetAlpha( 0.75, 0 )
	Background:SetDotPitchEnabled( true )
	Background:SetDotPitchX( 6, 0 )
	Background:SetDotPitchY( 3, 0 )
	Background:SetDotPitchContrast( 0.5, 0 )
	Background:SetDotPitchMode( 0 )
	Background:SetUseAA( true )
	Background:SetBlurStrength( 0.75, 0 )
	Background:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 106, 0, _1080p * 106, 0 )
	self:addElement( Background )
	self.Background = Background
	
	local GenericButtonSelection = nil
	
	GenericButtonSelection = MenuBuilder.BuildRegisteredType( "GenericButtonSelection", {
		controllerIndex = f10_local1
	} )
	GenericButtonSelection.id = "GenericButtonSelection"
	GenericButtonSelection:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 106, 0, _1080p * 106 )
	self:addElement( GenericButtonSelection )
	self.GenericButtonSelection = GenericButtonSelection
	
	local ItemName = nil
	
	ItemName = MenuBuilder.BuildRegisteredType( "CodCasterLoadoutItemName", {
		controllerIndex = f10_local1
	} )
	ItemName.id = "ItemName"
	ItemName:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 53, _1080p * 353, _1080p * -50, 0 )
	self:addElement( ItemName )
	self.ItemName = ItemName
	
	f0_local11( self, f10_local1, controller )
	return self
end

MenuBuilder.registerType( "CodCasterLoadoutItemContainer", CodCasterLoadoutItemContainer )
LockTable( _M )
