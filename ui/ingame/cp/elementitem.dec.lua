local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ( f1_arg0, f1_arg1, f1_arg2 )
	f1_arg0:SubscribeToDataSourceThroughElement( f1_arg0, "ref", function ()
		local f2_local0 = f1_arg0:GetDataSource()
		f2_local0 = f2_local0.ref:GetValue()
		f1_arg0.ref = f2_local0
		local f2_local1 = f1_arg0:GetDataSource()
		f1_arg0.name:setText( Engine.Localize( f2_local1.name:GetValue() ), 0 )
		f1_arg0.colorSquares:UpdateBadHeatNumbers( f2_local0, 1 )
		f1_arg0.name:SetGlitchEnabled( true )
		f1_arg0.name:SetGlitchEnabled( false )
		if not f1_arg0.subscribedToOmnvar then
			local f2_local2 = DataSources.inGame.CP.zombies.dlc3.elementValueChoice
			f1_arg0:SubscribeToModel( f2_local2:GetModel( f1_arg1 ), function ()
				local f3_local0 = f1_arg0:GetDataSource()
				f1_arg0.colorSquares:UpdateHeatNumbers( f3_local0.ref:GetValue(), f2_local2:GetValue( f1_arg1 ) )
			end, false )
			local f2_local3 = DataSources.inGame.CP.zombies.dlc3.elementBadValueChoice
			f1_arg0:SubscribeToModel( f2_local3:GetModel( f1_arg1 ), function ()
				local f4_local0 = f1_arg0:GetDataSource()
				f1_arg0.colorSquares:UpdateBadHeatNumbers( f4_local0.ref:GetValue(), f2_local3:GetValue( f1_arg1 ) )
			end, false )
			f1_arg0.subscribedToOmnvar = true
		end
	end )
end

function elementItem( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 747 * _1080p, 0, 80 * _1080p )
	self.id = "elementItem"
	local f5_local1 = controller and controller.controllerIndex
	if not f5_local1 and not Engine.InFrontend() then
		f5_local1 = self:getRootController()
	end
	assert( f5_local1 )
	local f5_local2 = self
	local name = nil
	
	name = LUI.UIText.new()
	name.id = "name"
	name:setText( Engine.Localize( "MENU_NEW" ), 0 )
	name:SetFontSize( 45 * _1080p )
	name:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	name:SetAlignment( LUI.Alignment.Left )
	name:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 11, _1080p * 643, _1080p * 17.5, _1080p * 62.5 )
	self:addElement( name )
	self.name = name
	
	local colorSquares = nil
	
	colorSquares = MenuBuilder.BuildRegisteredType( "colorSquares", {
		controllerIndex = f5_local1
	} )
	colorSquares.id = "colorSquares"
	colorSquares:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 651.24, _1080p * 731.24, 0, _1080p * 80 )
	self:addElement( colorSquares )
	self.colorSquares = colorSquares
	
	f0_local0( self, f5_local1, controller )
	return self
end

MenuBuilder.registerType( "elementItem", elementItem )
LockTable( _M )
