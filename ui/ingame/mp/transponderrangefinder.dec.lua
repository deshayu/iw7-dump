local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function TransponderRangeFinder( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 186 * _1080p, 0, 45 * _1080p )
	self.id = "TransponderRangeFinder"
	self._animationSets = {}
	self._sequences = {}
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local RangeFinder = nil
	
	RangeFinder = LUI.UIText.new()
	RangeFinder.id = "RangeFinder"
	RangeFinder:SetRGBFromInt( 4782552, 0 )
	RangeFinder:SetFontSize( 38 * _1080p )
	RangeFinder:SetFont( FONTS.GetFont( FONTS.MainExtended.File ) )
	RangeFinder:SetAlignment( LUI.Alignment.Left )
	RangeFinder:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 186, 0, _1080p * 38 )
	RangeFinder:SubscribeToModel( DataSources.inGame.player.suits.TransponderRangeFinder:GetModel( f1_local1 ), function ()
		local f2_local0 = DataSources.inGame.player.suits.TransponderRangeFinder:GetValue( f1_local1 )
		if f2_local0 ~= nil then
			RangeFinder:setText( f2_local0, 0 )
		end
	end )
	self:addElement( RangeFinder )
	self.RangeFinder = RangeFinder
	
	local WidgetName = nil
	
	WidgetName = LUI.UIText.new()
	WidgetName.id = "WidgetName"
	WidgetName:SetRGBFromInt( 4782552, 0 )
	WidgetName:setText( ToUpperCase( Engine.Localize( "LUA_MENU_MP_TRANSPONDER_RANGE_LABEL" ) ), 0 )
	WidgetName:SetFontSize( 16 * _1080p )
	WidgetName:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	WidgetName:SetAlignment( LUI.Alignment.Left )
	WidgetName:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 341, _1080p * -16, 0 )
	self:addElement( WidgetName )
	self.WidgetName = WidgetName
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		RangeFinder:RegisterAnimationSequence( "Hide", {
			{
				function ()
					return self.RangeFinder:SetAlpha( 1, 0 )
				end,
				function ()
					return self.RangeFinder:SetAlpha( 0, 1020 )
				end
			}
		} )
		WidgetName:RegisterAnimationSequence( "Hide", {
			{
				function ()
					return self.WidgetName:SetAlpha( 1, 0 )
				end,
				function ()
					return self.WidgetName:SetAlpha( 0, 1020 )
				end
			}
		} )
		self._sequences.Hide = function ()
			RangeFinder:AnimateSequence( "Hide" )
			WidgetName:AnimateSequence( "Hide" )
		end
		
		RangeFinder:RegisterAnimationSequence( "Show", {
			{
				function ()
					return self.RangeFinder:SetAlpha( 1, 0 )
				end
			}
		} )
		WidgetName:RegisterAnimationSequence( "Show", {
			{
				function ()
					return self.WidgetName:SetAlpha( 1, 0 )
				end
			}
		} )
		self._sequences.Show = function ()
			RangeFinder:AnimateSequence( "Show" )
			WidgetName:AnimateSequence( "Show" )
		end
		
		RangeFinder:RegisterAnimationSequence( "OutOfRange", {
			{
				function ()
					return self.RangeFinder:SetRGBFromInt( 4782552, 0 )
				end,
				function ()
					return self.RangeFinder:SetRGBFromInt( 15472666, 70 )
				end
			}
		} )
		WidgetName:RegisterAnimationSequence( "OutOfRange", {
			{
				function ()
					return self.WidgetName:SetRGBFromInt( 4782552, 0 )
				end,
				function ()
					return self.WidgetName:SetRGBFromInt( 15472666, 70 )
				end
			}
		} )
		self._sequences.OutOfRange = function ()
			RangeFinder:AnimateSequence( "OutOfRange" )
			WidgetName:AnimateSequence( "OutOfRange" )
		end
		
		RangeFinder:RegisterAnimationSequence( "InRange", {
			{
				function ()
					return self.RangeFinder:SetRGBFromInt( 15472666, 0 )
				end,
				function ()
					return self.RangeFinder:SetRGBFromInt( 3733993, 60 )
				end
			}
		} )
		WidgetName:RegisterAnimationSequence( "InRange", {
			{
				function ()
					return self.WidgetName:SetRGBFromInt( 15472666, 0 )
				end,
				function ()
					return self.WidgetName:SetRGBFromInt( 3733993, 60 )
				end
			}
		} )
		self._sequences.InRange = function ()
			RangeFinder:AnimateSequence( "InRange" )
			WidgetName:AnimateSequence( "InRange" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	self:SubscribeToModel( DataSources.inGame.player.suits.TransponderRangeFinder:GetModel( f1_local1 ), function ()
		if DataSources.inGame.player.suits.TransponderRangeFinder:GetValue( f1_local1 ) ~= nil and DataSources.inGame.player.suits.TransponderRangeFinder:GetValue( f1_local1 ) > 0 then
			ACTIONS.AnimateSequence( self, "Show" )
		end
		if DataSources.inGame.player.suits.TransponderRangeFinder:GetValue( f1_local1 ) ~= nil and DataSources.inGame.player.suits.TransponderRangeFinder:GetValue( f1_local1 ) == 0 then
			ACTIONS.AnimateSequence( self, "Hide" )
		end
		if DataSources.inGame.player.suits.TransponderRangeFinder:GetValue( f1_local1 ) ~= nil and DataSources.inGame.player.suits.TransponderRangeFinder:GetValue( f1_local1 ) > 1800 then
			ACTIONS.AnimateSequence( self, "OutOfRange" )
		end
		if DataSources.inGame.player.suits.TransponderRangeFinder:GetValue( f1_local1 ) ~= nil and DataSources.inGame.player.suits.TransponderRangeFinder:GetValue( f1_local1 ) <= 1800 then
			ACTIONS.AnimateSequence( self, "InRange" )
		end
	end )
	self:addEventHandler( "menu_create", function ( f24_arg0, f24_arg1 )
		local f24_local0 = f24_arg1.controller or f1_local1
		ACTIONS.AnimateSequence( self, "Hide" )
	end )
	return self
end

MenuBuilder.registerType( "TransponderRangeFinder", TransponderRangeFinder )
LockTable( _M )
