local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ( f1_arg0, f1_arg1, f1_arg2 )
	local f1_local0 = DataSources.inGame.MP.killcam.countdown
	f1_arg0:SubscribeToModel( f1_local0:GetModel( f1_arg1 ), function ()
		local f2_local0 = f1_local0:GetValue( f1_arg1 )
		if f2_local0 ~= nil and f2_local0 > 0 then
			local f2_local1 = f1_arg0.InfoLineGrid:getFirstChild()
			while f2_local1 do
				local f2_local2 = f2_local1:getNextSibling()
				ACTIONS.AnimateSequence( f2_local1, "AnimateRow" )
				f2_local1 = f2_local2
			end
		end
	end )
end

function DeathDetails( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 531 * _1080p, 0, 120 * _1080p )
	self.id = "DeathDetails"
	local f3_local1 = controller and controller.controllerIndex
	if not f3_local1 and not Engine.InFrontend() then
		f3_local1 = self:getRootController()
	end
	assert( f3_local1 )
	local f3_local2 = self
	local InfoLineGrid = nil
	
	InfoLineGrid = LUI.UIDataSourceGrid.new( nil, {
		maxVisibleColumns = 1,
		maxVisibleRows = 4,
		controllerIndex = f3_local1,
		buildChild = function ()
			return MenuBuilder.BuildRegisteredType( "DeathDetailsInfoLine", {
				controllerIndex = f3_local1
			} )
		end,
		wrapX = true,
		wrapY = true,
		spacingX = _1080p * -1,
		spacingY = _1080p * -1,
		columnWidth = _1080p * 532,
		rowHeight = _1080p * 40,
		scrollingThresholdX = 1,
		scrollingThresholdY = 1,
		adjustSizeToContent = false,
		horizontalAlignment = LUI.Alignment.Left,
		verticalAlignment = LUI.Alignment.Top,
		springCoefficient = 400,
		maxVelocity = 5000
	} )
	InfoLineGrid.id = "InfoLineGrid"
	InfoLineGrid:setUseStencil( false )
	InfoLineGrid:SetGridDataSource( DataSources.inGame.MP.deathDetails.infoLine, f3_local1 )
	InfoLineGrid:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, _1080p * 34, _1080p * 191 )
	self:addElement( InfoLineGrid )
	self.InfoLineGrid = InfoLineGrid
	
	local HeaderLineBorderThicker = nil
	
	HeaderLineBorderThicker = LUI.UIBorder.new( {
		borderThicknessLeft = _1080p * 2,
		borderThicknessRight = _1080p * 2,
		borderThicknessTop = _1080p * 0,
		borderThicknessBottom = _1080p * 2
	} )
	HeaderLineBorderThicker.id = "HeaderLineBorderThicker"
	HeaderLineBorderThicker:SetAlpha( 0.8, 0 )
	HeaderLineBorderThicker:SetBorderThicknessLeft( _1080p * 2, 0 )
	HeaderLineBorderThicker:SetBorderThicknessRight( _1080p * 2, 0 )
	HeaderLineBorderThicker:SetBorderThicknessTop( _1080p * 0, 0 )
	HeaderLineBorderThicker:SetBorderThicknessBottom( _1080p * 2, 0 )
	HeaderLineBorderThicker:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, _1080p * 12, _1080p * 34 )
	self:addElement( HeaderLineBorderThicker )
	self.HeaderLineBorderThicker = HeaderLineBorderThicker
	
	local HeaderLineBorder = nil
	
	HeaderLineBorder = LUI.UIBorder.new( {
		borderThicknessLeft = _1080p * 1,
		borderThicknessRight = _1080p * 1,
		borderThicknessTop = _1080p * 0,
		borderThicknessBottom = _1080p * 1
	} )
	HeaderLineBorder.id = "HeaderLineBorder"
	HeaderLineBorder:SetBorderThicknessTop( _1080p * 0, 0 )
	HeaderLineBorder:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, _1080p * 12, _1080p * 34 )
	self:addElement( HeaderLineBorder )
	self.HeaderLineBorder = HeaderLineBorder
	
	local AttackersLabel = nil
	
	AttackersLabel = LUI.UIText.new()
	AttackersLabel.id = "AttackersLabel"
	AttackersLabel:SetFontSize( 22 * _1080p )
	AttackersLabel:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	AttackersLabel:SetAlignment( LUI.Alignment.Left )
	AttackersLabel:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 10, _1080p * 362, _1080p * 4, _1080p * 26 )
	AttackersLabel:SubscribeToModel( DataSources.inGame.MP.deathDetails.attackerCount:GetModel( f3_local1 ), function ()
		local f5_local0 = DataSources.inGame.MP.deathDetails.attackerCount:GetValue( f3_local1 )
		if f5_local0 ~= nil then
			AttackersLabel:setText( ToUpperCase( LocalizeIntoString( f5_local0, "MP_ATTACKERS" ) ), 0 )
		end
	end )
	self:addElement( AttackersLabel )
	self.AttackersLabel = AttackersLabel
	
	local HitCountLabel = nil
	
	HitCountLabel = LUI.UIText.new()
	HitCountLabel.id = "HitCountLabel"
	HitCountLabel:SetFontSize( 22 * _1080p )
	HitCountLabel:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	HitCountLabel:SetAlignment( LUI.Alignment.Left )
	HitCountLabel:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 362, _1080p * 525, _1080p * 4, _1080p * 26 )
	HitCountLabel:SubscribeToModel( DataSources.inGame.MP.deathDetails.totalHitCount:GetModel( f3_local1 ), function ()
		local f6_local0 = DataSources.inGame.MP.deathDetails.totalHitCount:GetValue( f3_local1 )
		if f6_local0 ~= nil then
			HitCountLabel:setText( ToUpperCase( LocalizeIntoString( f6_local0, "MP_HITS" ) ), 0 )
		end
	end )
	self:addElement( HitCountLabel )
	self.HitCountLabel = HitCountLabel
	
	f0_local0( self, f3_local1, controller )
	return self
end

MenuBuilder.registerType( "DeathDetails", DeathDetails )
LockTable( _M )
