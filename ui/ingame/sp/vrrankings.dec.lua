local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function VRRankings( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 1062 * _1080p, 0, 715 * _1080p )
	self.id = "VRRankings"
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	self:setUseStencil( true )
	local ListTitle = nil
	
	ListTitle = LUI.UIText.new()
	ListTitle.id = "ListTitle"
	ListTitle:setText( "VR Rankings", 0 )
	ListTitle:SetFontSize( 45 * _1080p )
	ListTitle:SetFont( FONTS.GetFont( FONTS.Digital.File ) )
	ListTitle:SetAlignment( LUI.Alignment.Center )
	ListTitle:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 250, _1080p * 750, 0, _1080p * 62 )
	self:addElement( ListTitle )
	self.ListTitle = ListTitle
	
	local Scenario1 = nil
	
	Scenario1 = LUI.UIText.new()
	Scenario1.id = "Scenario1"
	Scenario1:setText( "EMP", 0 )
	Scenario1:SetFontSize( 45 * _1080p )
	Scenario1:SetFont( FONTS.GetFont( FONTS.Digital.File ) )
	Scenario1:SetAlignment( LUI.Alignment.Left )
	Scenario1:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 500, _1080p * 85, _1080p * 130 )
	self:addElement( Scenario1 )
	self.Scenario1 = Scenario1
	
	local FirstPlace = nil
	
	FirstPlace = LUI.UIText.new()
	FirstPlace.id = "FirstPlace"
	FirstPlace:setText( "1.", 0 )
	FirstPlace:SetFontSize( 45 * _1080p )
	FirstPlace:SetFont( FONTS.GetFont( FONTS.Digital.File ) )
	FirstPlace:SetAlignment( LUI.Alignment.Left )
	FirstPlace:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 91, _1080p * 141.43, _1080p * 186.43 )
	self:addElement( FirstPlace )
	self.FirstPlace = FirstPlace
	
	local SecondPlace = nil
	
	SecondPlace = LUI.UIText.new()
	SecondPlace.id = "SecondPlace"
	SecondPlace:setText( "2.", 0 )
	SecondPlace:SetFontSize( 45 * _1080p )
	SecondPlace:SetFont( FONTS.GetFont( FONTS.Digital.File ) )
	SecondPlace:SetAlignment( LUI.Alignment.Left )
	SecondPlace:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 91, _1080p * 186.43, _1080p * 231.43 )
	self:addElement( SecondPlace )
	self.SecondPlace = SecondPlace
	
	local ThirdPlace = nil
	
	ThirdPlace = LUI.UIText.new()
	ThirdPlace.id = "ThirdPlace"
	ThirdPlace:setText( "3.", 0 )
	ThirdPlace:SetFontSize( 45 * _1080p )
	ThirdPlace:SetFont( FONTS.GetFont( FONTS.Digital.File ) )
	ThirdPlace:SetAlignment( LUI.Alignment.Left )
	ThirdPlace:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 91, _1080p * 231.43, _1080p * 276.43 )
	self:addElement( ThirdPlace )
	self.ThirdPlace = ThirdPlace
	
	local Name1 = nil
	
	Name1 = LUI.UIText.new()
	Name1.id = "Name1"
	Name1:setText( "Reese 360", 0 )
	Name1:SetFontSize( 45 * _1080p )
	Name1:SetFont( FONTS.GetFont( FONTS.Digital.File ) )
	Name1:SetAlignment( LUI.Alignment.Right )
	Name1:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 91, _1080p * 500, _1080p * 141.43, _1080p * 186.43 )
	self:addElement( Name1 )
	self.Name1 = Name1
	
	local Name10 = nil
	
	Name10 = LUI.UIText.new()
	Name10.id = "Name10"
	Name10:setText( "Kashima 210", 0 )
	Name10:SetFontSize( 45 * _1080p )
	Name10:SetFont( FONTS.GetFont( FONTS.Digital.File ) )
	Name10:SetAlignment( LUI.Alignment.Right )
	Name10:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 91, _1080p * 500, _1080p * 231.43, _1080p * 276.43 )
	self:addElement( Name10 )
	self.Name10 = Name10
	
	local Name11 = nil
	
	Name11 = LUI.UIText.new()
	Name11.id = "Name11"
	Name11:setText( "Salter 230", 0 )
	Name11:SetFontSize( 45 * _1080p )
	Name11:SetFont( FONTS.GetFont( FONTS.Digital.File ) )
	Name11:SetAlignment( LUI.Alignment.Right )
	Name11:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 91, _1080p * 500, _1080p * 186.43, _1080p * 231.43 )
	self:addElement( Name11 )
	self.Name11 = Name11
	
	local Line10 = nil
	
	Line10 = LUI.UIImage.new()
	Line10.id = "Line10"
	Line10:setImage( RegisterMaterial( "hud_message_tics" ), 0 )
	Line10:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 1061.5, _1080p * 295.43, _1080p * 276.43 )
	self:addElement( Line10 )
	self.Line10 = Line10
	
	local Line100 = nil
	
	Line100 = LUI.UIImage.new()
	Line100.id = "Line100"
	Line100:setImage( RegisterMaterial( "hud_message_tics" ), 0 )
	Line100:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 1061.5, _1080p * 81, _1080p * 62 )
	self:addElement( Line100 )
	self.Line100 = Line100
	
	local Scenario2 = nil
	
	Scenario2 = LUI.UIText.new()
	Scenario2.id = "Scenario2"
	Scenario2:setText( "Firing Range", 0 )
	Scenario2:SetFontSize( 45 * _1080p )
	Scenario2:SetFont( FONTS.GetFont( FONTS.Digital.File ) )
	Scenario2:SetAlignment( LUI.Alignment.Left )
	Scenario2:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 500, _1080p * 306, _1080p * 351 )
	self:addElement( Scenario2 )
	self.Scenario2 = Scenario2
	
	local FirstPlace0 = nil
	
	FirstPlace0 = LUI.UIText.new()
	FirstPlace0.id = "FirstPlace0"
	FirstPlace0:setText( "1.", 0 )
	FirstPlace0:SetFontSize( 45 * _1080p )
	FirstPlace0:SetFont( FONTS.GetFont( FONTS.Digital.File ) )
	FirstPlace0:SetAlignment( LUI.Alignment.Left )
	FirstPlace0:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 91, _1080p * 351, _1080p * 396 )
	self:addElement( FirstPlace0 )
	self.FirstPlace0 = FirstPlace0
	
	local SecondPlace0 = nil
	
	SecondPlace0 = LUI.UIText.new()
	SecondPlace0.id = "SecondPlace0"
	SecondPlace0:setText( "2.", 0 )
	SecondPlace0:SetFontSize( 45 * _1080p )
	SecondPlace0:SetFont( FONTS.GetFont( FONTS.Digital.File ) )
	SecondPlace0:SetAlignment( LUI.Alignment.Left )
	SecondPlace0:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 91, _1080p * 396, _1080p * 441 )
	self:addElement( SecondPlace0 )
	self.SecondPlace0 = SecondPlace0
	
	local ThirdPlace0 = nil
	
	ThirdPlace0 = LUI.UIText.new()
	ThirdPlace0.id = "ThirdPlace0"
	ThirdPlace0:setText( "3.", 0 )
	ThirdPlace0:SetFontSize( 45 * _1080p )
	ThirdPlace0:SetFont( FONTS.GetFont( FONTS.Digital.File ) )
	ThirdPlace0:SetAlignment( LUI.Alignment.Left )
	ThirdPlace0:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 91, _1080p * 441, _1080p * 486 )
	self:addElement( ThirdPlace0 )
	self.ThirdPlace0 = ThirdPlace0
	
	local Name12 = nil
	
	Name12 = LUI.UIText.new()
	Name12.id = "Name12"
	Name12:setText( "Reese 360", 0 )
	Name12:SetFontSize( 45 * _1080p )
	Name12:SetFont( FONTS.GetFont( FONTS.Digital.File ) )
	Name12:SetAlignment( LUI.Alignment.Right )
	Name12:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 91, _1080p * 500, _1080p * 351, _1080p * 396 )
	self:addElement( Name12 )
	self.Name12 = Name12
	
	local Name100 = nil
	
	Name100 = LUI.UIText.new()
	Name100.id = "Name100"
	Name100:setText( "Kashima 210", 0 )
	Name100:SetFontSize( 45 * _1080p )
	Name100:SetFont( FONTS.GetFont( FONTS.Digital.File ) )
	Name100:SetAlignment( LUI.Alignment.Right )
	Name100:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 91, _1080p * 500, _1080p * 441, _1080p * 486 )
	self:addElement( Name100 )
	self.Name100 = Name100
	
	local Name110 = nil
	
	Name110 = LUI.UIText.new()
	Name110.id = "Name110"
	Name110:setText( "Salter 230", 0 )
	Name110:SetFontSize( 45 * _1080p )
	Name110:SetFont( FONTS.GetFont( FONTS.Digital.File ) )
	Name110:SetAlignment( LUI.Alignment.Right )
	Name110:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 91, _1080p * 500, _1080p * 396, _1080p * 441 )
	self:addElement( Name110 )
	self.Name110 = Name110
	
	local Line101 = nil
	
	Line101 = LUI.UIImage.new()
	Line101.id = "Line101"
	Line101:setImage( RegisterMaterial( "hud_message_tics" ), 0 )
	Line101:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 1061.5, _1080p * 505, _1080p * 486 )
	self:addElement( Line101 )
	self.Line101 = Line101
	
	local Scenario20 = nil
	
	Scenario20 = LUI.UIText.new()
	Scenario20.id = "Scenario20"
	Scenario20:setText( "The Pit", 0 )
	Scenario20:SetFontSize( 45 * _1080p )
	Scenario20:SetFont( FONTS.GetFont( FONTS.Digital.File ) )
	Scenario20:SetAlignment( LUI.Alignment.Left )
	Scenario20:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 500, _1080p * 505, _1080p * 550 )
	self:addElement( Scenario20 )
	self.Scenario20 = Scenario20
	
	local FirstPlace00 = nil
	
	FirstPlace00 = LUI.UIText.new()
	FirstPlace00.id = "FirstPlace00"
	FirstPlace00:setText( "1.", 0 )
	FirstPlace00:SetFontSize( 45 * _1080p )
	FirstPlace00:SetFont( FONTS.GetFont( FONTS.Digital.File ) )
	FirstPlace00:SetAlignment( LUI.Alignment.Left )
	FirstPlace00:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 91, _1080p * 550, _1080p * 595 )
	self:addElement( FirstPlace00 )
	self.FirstPlace00 = FirstPlace00
	
	local SecondPlace00 = nil
	
	SecondPlace00 = LUI.UIText.new()
	SecondPlace00.id = "SecondPlace00"
	SecondPlace00:setText( "2.", 0 )
	SecondPlace00:SetFontSize( 45 * _1080p )
	SecondPlace00:SetFont( FONTS.GetFont( FONTS.Digital.File ) )
	SecondPlace00:SetAlignment( LUI.Alignment.Left )
	SecondPlace00:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 91, _1080p * 595, _1080p * 640 )
	self:addElement( SecondPlace00 )
	self.SecondPlace00 = SecondPlace00
	
	local ThirdPlace00 = nil
	
	ThirdPlace00 = LUI.UIText.new()
	ThirdPlace00.id = "ThirdPlace00"
	ThirdPlace00:setText( "3.", 0 )
	ThirdPlace00:SetFontSize( 45 * _1080p )
	ThirdPlace00:SetFont( FONTS.GetFont( FONTS.Digital.File ) )
	ThirdPlace00:SetAlignment( LUI.Alignment.Left )
	ThirdPlace00:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 91, _1080p * 640, _1080p * 685 )
	self:addElement( ThirdPlace00 )
	self.ThirdPlace00 = ThirdPlace00
	
	local Name120 = nil
	
	Name120 = LUI.UIText.new()
	Name120.id = "Name120"
	Name120:setText( "Reese 360", 0 )
	Name120:SetFontSize( 45 * _1080p )
	Name120:SetFont( FONTS.GetFont( FONTS.Digital.File ) )
	Name120:SetAlignment( LUI.Alignment.Right )
	Name120:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 91, _1080p * 530.75, _1080p * 550, _1080p * 595 )
	self:addElement( Name120 )
	self.Name120 = Name120
	
	local Name1000 = nil
	
	Name1000 = LUI.UIText.new()
	Name1000.id = "Name1000"
	Name1000:setText( "Kashima 210", 0 )
	Name1000:SetFontSize( 45 * _1080p )
	Name1000:SetFont( FONTS.GetFont( FONTS.Digital.File ) )
	Name1000:SetAlignment( LUI.Alignment.Right )
	Name1000:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 91, _1080p * 530.75, _1080p * 640, _1080p * 685 )
	self:addElement( Name1000 )
	self.Name1000 = Name1000
	
	local Name1100 = nil
	
	Name1100 = LUI.UIText.new()
	Name1100.id = "Name1100"
	Name1100:setText( "Salter 230", 0 )
	Name1100:SetFontSize( 45 * _1080p )
	Name1100:SetFont( FONTS.GetFont( FONTS.Digital.File ) )
	Name1100:SetAlignment( LUI.Alignment.Right )
	Name1100:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 91, _1080p * 530.75, _1080p * 595, _1080p * 640 )
	self:addElement( Name1100 )
	self.Name1100 = Name1100
	
	local Line1010 = nil
	
	Line1010 = LUI.UIImage.new()
	Line1010.id = "Line1010"
	Line1010:setImage( RegisterMaterial( "hud_message_tics" ), 0 )
	Line1010:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 1061.5, _1080p * 714.57, _1080p * 695.57 )
	self:addElement( Line1010 )
	self.Line1010 = Line1010
	
	local FirstPlace10 = nil
	
	FirstPlace10 = LUI.UIText.new()
	FirstPlace10.id = "FirstPlace10"
	FirstPlace10:setText( "4.", 0 )
	FirstPlace10:SetFontSize( 45 * _1080p )
	FirstPlace10:SetFont( FONTS.GetFont( FONTS.Digital.File ) )
	FirstPlace10:SetAlignment( LUI.Alignment.Left )
	FirstPlace10:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 561.5, _1080p * 621.75, _1080p * 351, _1080p * 396 )
	self:addElement( FirstPlace10 )
	self.FirstPlace10 = FirstPlace10
	
	local SecondPlace10 = nil
	
	SecondPlace10 = LUI.UIText.new()
	SecondPlace10.id = "SecondPlace10"
	SecondPlace10:setText( "5.", 0 )
	SecondPlace10:SetFontSize( 45 * _1080p )
	SecondPlace10:SetFont( FONTS.GetFont( FONTS.Digital.File ) )
	SecondPlace10:SetAlignment( LUI.Alignment.Left )
	SecondPlace10:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 561.5, _1080p * 621.75, _1080p * 396, _1080p * 441 )
	self:addElement( SecondPlace10 )
	self.SecondPlace10 = SecondPlace10
	
	local ThirdPlace10 = nil
	
	ThirdPlace10 = LUI.UIText.new()
	ThirdPlace10.id = "ThirdPlace10"
	ThirdPlace10:setText( "6.", 0 )
	ThirdPlace10:SetFontSize( 45 * _1080p )
	ThirdPlace10:SetFont( FONTS.GetFont( FONTS.Digital.File ) )
	ThirdPlace10:SetAlignment( LUI.Alignment.Left )
	ThirdPlace10:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 561.5, _1080p * 621.75, _1080p * 441, _1080p * 486 )
	self:addElement( ThirdPlace10 )
	self.ThirdPlace10 = ThirdPlace10
	
	local Name130 = nil
	
	Name130 = LUI.UIText.new()
	Name130.id = "Name130"
	Name130:setText( "...", 0 )
	Name130:SetFontSize( 45 * _1080p )
	Name130:SetFont( FONTS.GetFont( FONTS.Digital.File ) )
	Name130:SetAlignment( LUI.Alignment.Right )
	Name130:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 621.75, _1080p * 1030.75, _1080p * 351, _1080p * 396 )
	self:addElement( Name130 )
	self.Name130 = Name130
	
	local Name1010 = nil
	
	Name1010 = LUI.UIText.new()
	Name1010.id = "Name1010"
	Name1010:setText( "...", 0 )
	Name1010:SetFontSize( 45 * _1080p )
	Name1010:SetFont( FONTS.GetFont( FONTS.Digital.File ) )
	Name1010:SetAlignment( LUI.Alignment.Right )
	Name1010:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 621.75, _1080p * 1030.75, _1080p * 441, _1080p * 486 )
	self:addElement( Name1010 )
	self.Name1010 = Name1010
	
	local Name1110 = nil
	
	Name1110 = LUI.UIText.new()
	Name1110.id = "Name1110"
	Name1110:setText( "...", 0 )
	Name1110:SetFontSize( 45 * _1080p )
	Name1110:SetFont( FONTS.GetFont( FONTS.Digital.File ) )
	Name1110:SetAlignment( LUI.Alignment.Right )
	Name1110:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 621.75, _1080p * 1030.75, _1080p * 396, _1080p * 441 )
	self:addElement( Name1110 )
	self.Name1110 = Name1110
	
	local FirstPlace100 = nil
	
	FirstPlace100 = LUI.UIText.new()
	FirstPlace100.id = "FirstPlace100"
	FirstPlace100:setText( "4.", 0 )
	FirstPlace100:SetFontSize( 45 * _1080p )
	FirstPlace100:SetFont( FONTS.GetFont( FONTS.Digital.File ) )
	FirstPlace100:SetAlignment( LUI.Alignment.Left )
	FirstPlace100:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 562.75, _1080p * 621.75, _1080p * 141.43, _1080p * 186.43 )
	self:addElement( FirstPlace100 )
	self.FirstPlace100 = FirstPlace100
	
	local SecondPlace100 = nil
	
	SecondPlace100 = LUI.UIText.new()
	SecondPlace100.id = "SecondPlace100"
	SecondPlace100:setText( "5.", 0 )
	SecondPlace100:SetFontSize( 45 * _1080p )
	SecondPlace100:SetFont( FONTS.GetFont( FONTS.Digital.File ) )
	SecondPlace100:SetAlignment( LUI.Alignment.Left )
	SecondPlace100:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 562.75, _1080p * 621.75, _1080p * 186.43, _1080p * 231.43 )
	self:addElement( SecondPlace100 )
	self.SecondPlace100 = SecondPlace100
	
	local ThirdPlace100 = nil
	
	ThirdPlace100 = LUI.UIText.new()
	ThirdPlace100.id = "ThirdPlace100"
	ThirdPlace100:setText( "6.", 0 )
	ThirdPlace100:SetFontSize( 45 * _1080p )
	ThirdPlace100:SetFont( FONTS.GetFont( FONTS.Digital.File ) )
	ThirdPlace100:SetAlignment( LUI.Alignment.Left )
	ThirdPlace100:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 562.75, _1080p * 621.75, _1080p * 231.43, _1080p * 276.43 )
	self:addElement( ThirdPlace100 )
	self.ThirdPlace100 = ThirdPlace100
	
	local Name1300 = nil
	
	Name1300 = LUI.UIText.new()
	Name1300.id = "Name1300"
	Name1300:setText( "...", 0 )
	Name1300:SetFontSize( 45 * _1080p )
	Name1300:SetFont( FONTS.GetFont( FONTS.Digital.File ) )
	Name1300:SetAlignment( LUI.Alignment.Right )
	Name1300:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 621.75, _1080p * 1030.75, _1080p * 141.43, _1080p * 186.43 )
	self:addElement( Name1300 )
	self.Name1300 = Name1300
	
	local Name10100 = nil
	
	Name10100 = LUI.UIText.new()
	Name10100.id = "Name10100"
	Name10100:setText( "...", 0 )
	Name10100:SetFontSize( 45 * _1080p )
	Name10100:SetFont( FONTS.GetFont( FONTS.Digital.File ) )
	Name10100:SetAlignment( LUI.Alignment.Right )
	Name10100:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 621.75, _1080p * 1030.75, _1080p * 231.43, _1080p * 276.43 )
	self:addElement( Name10100 )
	self.Name10100 = Name10100
	
	local Name11100 = nil
	
	Name11100 = LUI.UIText.new()
	Name11100.id = "Name11100"
	Name11100:setText( "...", 0 )
	Name11100:SetFontSize( 45 * _1080p )
	Name11100:SetFont( FONTS.GetFont( FONTS.Digital.File ) )
	Name11100:SetAlignment( LUI.Alignment.Right )
	Name11100:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 621.75, _1080p * 1030.75, _1080p * 186.43, _1080p * 231.43 )
	self:addElement( Name11100 )
	self.Name11100 = Name11100
	
	local FirstPlace1000 = nil
	
	FirstPlace1000 = LUI.UIText.new()
	FirstPlace1000.id = "FirstPlace1000"
	FirstPlace1000:setText( "4.", 0 )
	FirstPlace1000:SetFontSize( 45 * _1080p )
	FirstPlace1000:SetFont( FONTS.GetFont( FONTS.Digital.File ) )
	FirstPlace1000:SetAlignment( LUI.Alignment.Left )
	FirstPlace1000:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 562.75, _1080p * 621.75, _1080p * 550, _1080p * 595 )
	self:addElement( FirstPlace1000 )
	self.FirstPlace1000 = FirstPlace1000
	
	local SecondPlace1000 = nil
	
	SecondPlace1000 = LUI.UIText.new()
	SecondPlace1000.id = "SecondPlace1000"
	SecondPlace1000:setText( "5.", 0 )
	SecondPlace1000:SetFontSize( 45 * _1080p )
	SecondPlace1000:SetFont( FONTS.GetFont( FONTS.Digital.File ) )
	SecondPlace1000:SetAlignment( LUI.Alignment.Left )
	SecondPlace1000:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 562.75, _1080p * 621.75, _1080p * 595, _1080p * 640 )
	self:addElement( SecondPlace1000 )
	self.SecondPlace1000 = SecondPlace1000
	
	local ThirdPlace1000 = nil
	
	ThirdPlace1000 = LUI.UIText.new()
	ThirdPlace1000.id = "ThirdPlace1000"
	ThirdPlace1000:setText( "6.", 0 )
	ThirdPlace1000:SetFontSize( 45 * _1080p )
	ThirdPlace1000:SetFont( FONTS.GetFont( FONTS.Digital.File ) )
	ThirdPlace1000:SetAlignment( LUI.Alignment.Left )
	ThirdPlace1000:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 562.75, _1080p * 621.75, _1080p * 640, _1080p * 685 )
	self:addElement( ThirdPlace1000 )
	self.ThirdPlace1000 = ThirdPlace1000
	
	local Name13000 = nil
	
	Name13000 = LUI.UIText.new()
	Name13000.id = "Name13000"
	Name13000:setText( "...", 0 )
	Name13000:SetFontSize( 45 * _1080p )
	Name13000:SetFont( FONTS.GetFont( FONTS.Digital.File ) )
	Name13000:SetAlignment( LUI.Alignment.Right )
	Name13000:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 621.75, _1080p * 1030.75, _1080p * 550, _1080p * 595 )
	self:addElement( Name13000 )
	self.Name13000 = Name13000
	
	local Name101000 = nil
	
	Name101000 = LUI.UIText.new()
	Name101000.id = "Name101000"
	Name101000:setText( "...", 0 )
	Name101000:SetFontSize( 45 * _1080p )
	Name101000:SetFont( FONTS.GetFont( FONTS.Digital.File ) )
	Name101000:SetAlignment( LUI.Alignment.Right )
	Name101000:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 621.75, _1080p * 1030.75, _1080p * 640, _1080p * 685 )
	self:addElement( Name101000 )
	self.Name101000 = Name101000
	
	local Name111000 = nil
	
	Name111000 = LUI.UIText.new()
	Name111000.id = "Name111000"
	Name111000:setText( "...", 0 )
	Name111000:SetFontSize( 45 * _1080p )
	Name111000:SetFont( FONTS.GetFont( FONTS.Digital.File ) )
	Name111000:SetAlignment( LUI.Alignment.Right )
	Name111000:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 621.75, _1080p * 1030.75, _1080p * 595, _1080p * 640 )
	self:addElement( Name111000 )
	self.Name111000 = Name111000
	
	return self
end

MenuBuilder.registerType( "VRRankings", VRRankings )
LockTable( _M )
