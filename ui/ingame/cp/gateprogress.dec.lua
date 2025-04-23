local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function gateProgress( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 664 * _1080p, 0, 129 * _1080p )
	self.id = "gateProgress"
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local maxValue = nil
	
	maxValue = LUI.UIText.new()
	maxValue.id = "maxValue"
	maxValue:SetFontSize( 32 * _1080p )
	maxValue:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	maxValue:SetAlignment( LUI.Alignment.Left )
	maxValue:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 509, _1080p * 613, _1080p * 46, _1080p * 78 )
	maxValue:SubscribeToModel( DataSources.inGame.CP.zombies.escape.gateScore:GetModel( f1_local1 ), function ()
		local f2_local0 = DataSources.inGame.CP.zombies.escape.gateScore:GetValue( f1_local1 )
		if f2_local0 ~= nil then
			maxValue:setText( f2_local0, 0 )
		end
	end )
	self:addElement( maxValue )
	self.maxValue = maxValue
	
	local progressBarBacking = nil
	
	progressBarBacking = LUI.UIImage.new()
	progressBarBacking.id = "progressBarBacking"
	progressBarBacking:SetRGBFromInt( 5000268, 0 )
	progressBarBacking:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 97, _1080p * 500, _1080p * 51, _1080p * 78 )
	self:addElement( progressBarBacking )
	self.progressBarBacking = progressBarBacking
	
	local progressBar = nil
	
	progressBar = LUI.UIImage.new()
	progressBar.id = "progressBar"
	progressBar:SetAnchors( 0, 1, 0, 1, 0 )
	progressBar:SetLeft( _1080p * 100, 0 )
	progressBar:SetTop( _1080p * 54, 0 )
	progressBar:SetBottom( _1080p * 75, 0 )
	progressBar:SetRGBFromInt( 16187600, 0 )
	progressBar:SubscribeToModel( DataSources.inGame.CP.zombies.escape.currentProgress:GetModel( f1_local1 ), function ()
		local f3_local0 = DataSources.inGame.CP.zombies.escape.currentProgress:GetValue( f1_local1 )
		if f3_local0 ~= nil then
			progressBar:SetRight( _1080p * Add( Multiply( f3_local0, 400 ), 100 ), 0 )
		end
	end )
	self:addElement( progressBar )
	self.progressBar = progressBar
	
	local PlayerIcon = nil
	
	PlayerIcon = LUI.UIImage.new()
	PlayerIcon.id = "PlayerIcon"
	PlayerIcon:SetScale( -0.2, 0 )
	PlayerIcon:setImage( RegisterMaterial( "cp_zmb_plyr_1" ), 0 )
	PlayerIcon:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -12.8, _1080p * 115.2, _1080p * 0.5, _1080p * 128.5 )
	self:addElement( PlayerIcon )
	self.PlayerIcon = PlayerIcon
	
	local comboMultiplier = nil
	
	comboMultiplier = LUI.UIText.new()
	comboMultiplier.id = "comboMultiplier"
	comboMultiplier:SetRGBFromInt( 16187600, 0 )
	comboMultiplier:SetFontSize( 62 * _1080p )
	comboMultiplier:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	comboMultiplier:SetAlignment( LUI.Alignment.Left )
	comboMultiplier:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 311, _1080p * 811, _1080p * 78, _1080p * 140 )
	comboMultiplier:SubscribeToModel( DataSources.inGame.CP.zombies.escape.comboMultiplier:GetModel( f1_local1 ), function ()
		local f4_local0 = DataSources.inGame.CP.zombies.escape.comboMultiplier:GetValue( f1_local1 )
		if f4_local0 ~= nil then
			comboMultiplier:setText( f4_local0, 0 )
		end
	end )
	self:addElement( comboMultiplier )
	self.comboMultiplier = comboMultiplier
	
	local X = nil
	
	X = LUI.UIText.new()
	X.id = "X"
	X:SetRGBFromInt( 16187600, 0 )
	X:setText( "X", 0 )
	X:SetFontSize( 45 * _1080p )
	X:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	X:SetAlignment( LUI.Alignment.Left )
	X:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 281.64, _1080p * 781.64, _1080p * 86.5, _1080p * 129 )
	self:addElement( X )
	self.X = X
	
	return self
end

MenuBuilder.registerType( "gateProgress", gateProgress )
LockTable( _M )
