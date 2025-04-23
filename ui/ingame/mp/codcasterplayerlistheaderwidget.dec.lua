local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function AddColumnImageHeader( f1_arg0, f1_arg1, f1_arg2, f1_arg3 )
	local f1_local0 = 30
	local self = nil
	self = LUI.UIImage.new()
	self.id = "newColumnElement" .. f1_arg3
	self:SetAnchors( 0, 1, 0, 1, 0 )
	local f1_local2 = (CODCASTER.extraColumnsWidths[f1_arg3] - f1_local0) / 2
	self:SetLeft( _1080p * (f1_arg1 + f1_local2), 0 )
	self:SetRight( _1080p * (f1_arg1 + f1_local2 + f1_local0), 0 )
	self:SetTop( _1080p * 0, 0 )
	self:SetBottom( _1080p * f1_local0, 0 )
	self:setImage( RegisterMaterial( f1_arg2 ), 0 )
	f1_arg0:addElement( self )
	f1_arg0.newColumns[f1_arg3] = self
	return f1_arg1 + CODCASTER.extraColumnsWidths[f1_arg3]
end

function PostLoadFunc( f2_arg0, f2_arg1, f2_arg2 )
	local f2_local0 = CODCASTER.fixedColumnsWidth
	f2_arg0.newColumns = {}
	f2_local0 = AddColumnImageHeader( f2_arg0, AddColumnImageHeader( f2_arg0, CODCASTER.AddPlayerListColumn( f2_arg0, f2_local0, f2_arg1, Engine.Localize( "CODCASTER_COLUMN_KILLS_DEATHS" ), CODCASTER.extraColumnsWidths[1], 1 ), "codcaster_playerlist_killstreak", 2 ), CODCASTER.gameModeColumnSettings[GameX.GetGameMode()][CODCASTER.columnSettingImageName], 3 )
end

function CodCasterPlayerListHeaderWidget( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 542 * _1080p, 0, 32 * _1080p )
	self.id = "CodCasterPlayerListHeaderWidget"
	local f3_local1 = controller and controller.controllerIndex
	if not f3_local1 and not Engine.InFrontend() then
		f3_local1 = self:getRootController()
	end
	assert( f3_local1 )
	local f3_local2 = self
	local Background = nil
	
	Background = LUI.UIBlur.new()
	Background.id = "Background"
	Background:SetAlpha( 0.7, 0 )
	Background:SetDotPitchEnabled( true )
	Background:SetDotPitchX( 6, 0 )
	Background:SetDotPitchY( 3, 0 )
	Background:SetDotPitchContrast( 0.15, 0 )
	Background:SetDotPitchMode( 0 )
	Background:setImage( RegisterMaterial( "codcaster_playerlist_header" ), 0 )
	Background:SetUseAA( true )
	Background:SetBlurStrength( 1, 0 )
	Background:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, 0, _1080p * 32 )
	self:addElement( Background )
	self.Background = Background
	
	local Name = nil
	
	Name = MenuBuilder.BuildRegisteredType( "CodCasterTextField", {
		controllerIndex = f3_local1
	} )
	Name.id = "Name"
	Name.Field:SetTop( _1080p * -12, 0 )
	Name.Field:SetBottom( _1080p * 12, 0 )
	Name.Field:setText( ToUpperCase( "TEAM NAME" ), 0 )
	Name.Field:SetAlignment( LUI.Alignment.Left )
	Name:SetAnchorsAndPosition( 0, 1, 0, 0, _1080p * 28, _1080p * 348, 0, 0 )
	self:addElement( Name )
	self.Name = Name
	
	local BorderLeft = nil
	
	BorderLeft = LUI.UIBorder.new( {
		borderThicknessLeft = _1080p * 1,
		borderThicknessRight = _1080p * 1,
		borderThicknessTop = _1080p * 1,
		borderThicknessBottom = _1080p * 1
	} )
	BorderLeft.id = "BorderLeft"
	BorderLeft:SetAlpha( 0.25, 0 )
	BorderLeft:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, 0, _1080p * 32 )
	self:addElement( BorderLeft )
	self.BorderLeft = BorderLeft
	
	local ListenIn = nil
	
	ListenIn = LUI.UIImage.new()
	ListenIn.id = "ListenIn"
	ListenIn:SetAlpha( 0.5, 0 )
	ListenIn:setImage( RegisterMaterial( "icon_mic_talking" ), 0 )
	ListenIn:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 2, _1080p * 30, _1080p * 2, _1080p * 30 )
	self:addElement( ListenIn )
	self.ListenIn = ListenIn
	
	PostLoadFunc( self, f3_local1, controller )
	return self
end

MenuBuilder.registerType( "CodCasterPlayerListHeaderWidget", CodCasterPlayerListHeaderWidget )
LockTable( _M )
