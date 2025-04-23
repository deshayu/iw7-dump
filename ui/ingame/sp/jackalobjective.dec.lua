local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function JackalObjective( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 281 * _1080p, 0, 24 * _1080p )
	self.id = "JackalObjective"
	self._animationSets = {}
	self._sequences = {}
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local Background = nil
	
	Background = LUI.UIImage.new()
	Background.id = "Background"
	Background:SetRGBFromInt( 0, 0 )
	Background:SetAlpha( 0.5, 0 )
	Background:setImage( RegisterMaterial( "ui_default_white" ), 0 )
	Background:SetUseAA( true )
	self:addElement( Background )
	self.Background = Background
	
	local CapLeft = nil
	
	CapLeft = LUI.UIImage.new()
	CapLeft.id = "CapLeft"
	CapLeft:SetAlpha( 0.4, 0 )
	CapLeft:setImage( RegisterMaterial( "ui_default_white" ), 0 )
	CapLeft:SetAnchorsAndPosition( 0, 1, 0, 0, 0, _1080p * 3, 0, 0 )
	self:addElement( CapLeft )
	self.CapLeft = CapLeft
	
	local CapRight = nil
	
	CapRight = LUI.UIImage.new()
	CapRight.id = "CapRight"
	CapRight:setImage( RegisterMaterial( "ui_default_white" ), 0 )
	CapRight:SetAnchorsAndPosition( 1, 0, 0, 0, _1080p * -3, 0, 0, 0 )
	self:addElement( CapRight )
	self.CapRight = CapRight
	
	local HeaderText = nil
	
	HeaderText = LUI.UIStyledText.new()
	HeaderText.id = "HeaderText"
	HeaderText:SetFontSize( 18 * _1080p )
	HeaderText:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	HeaderText:SetAlignment( LUI.Alignment.Right )
	HeaderText:SetShadowMinDistance( -0.2, 0 )
	HeaderText:SetShadowMaxDistance( 0.2, 0 )
	HeaderText:SetShadowRGBFromInt( 0, 0 )
	HeaderText:SetDecodeLetterLength( 25 )
	HeaderText:SetDecodeMaxRandChars( 3 )
	HeaderText:SetDecodeUpdatesPerLetter( 4 )
	HeaderText:SetAnchorsAndPosition( 1, 0, 0.5, 0.5, _1080p * -300, _1080p * -33, _1080p * -9, _1080p * 9 )
	HeaderText:SubscribeToModelThroughElement( self, "string", function ()
		local f2_local0 = self:GetDataSource()
		f2_local0 = f2_local0.string:GetValue( f1_local1 )
		if f2_local0 ~= nil then
			HeaderText:setText( ToUpperCase( LocalizeString( f2_local0 ) ), 0 )
		end
	end )
	self:addElement( HeaderText )
	self.HeaderText = HeaderText
	
	local LeftCheckBox = nil
	
	LeftCheckBox = MenuBuilder.BuildRegisteredType( "GenericCheckBox", {
		controllerIndex = f1_local1
	} )
	LeftCheckBox.id = "LeftCheckBox"
	LeftCheckBox.Frame:SetRGBFromTable( SWATCHES.jackal.stable, 0 )
	LeftCheckBox.Fill:SetRGBFromTable( SWATCHES.jackal.selected, 0 )
	LeftCheckBox.Fill:SetAlpha( 0, 0 )
	LeftCheckBox:SetAnchorsAndPosition( 1, 0, 0.5, 0.5, _1080p * -28, _1080p * -14, _1080p * -7, _1080p * 7 )
	self:addElement( LeftCheckBox )
	self.LeftCheckBox = LeftCheckBox
	
	local MaxKillsText = nil
	
	MaxKillsText = LUI.UIStyledText.new()
	MaxKillsText.id = "MaxKillsText"
	MaxKillsText:SetAlpha( 0, 0 )
	MaxKillsText:SetFontSize( 18 * _1080p )
	MaxKillsText:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	MaxKillsText:SetAlignment( LUI.Alignment.Right )
	MaxKillsText:SetShadowMinDistance( -0.2, 0 )
	MaxKillsText:SetShadowMaxDistance( 0.2, 0 )
	MaxKillsText:SetShadowRGBFromInt( 0, 0 )
	MaxKillsText:SetDecodeLetterLength( 25 )
	MaxKillsText:SetDecodeMaxRandChars( 3 )
	MaxKillsText:SetDecodeUpdatesPerLetter( 4 )
	MaxKillsText:SetAnchorsAndPosition( 1, 0, 0.5, 0.5, _1080p * -48, _1080p * -33, _1080p * -9, _1080p * 9 )
	MaxKillsText:SubscribeToModelThroughElement( self, "maxKills", function ()
		local f3_local0 = self:GetDataSource()
		f3_local0 = f3_local0.maxKills:GetValue( f1_local1 )
		if f3_local0 ~= nil then
			MaxKillsText:setText( f3_local0, 0 )
		end
	end )
	self:addElement( MaxKillsText )
	self.MaxKillsText = MaxKillsText
	
	local KillsText = nil
	
	KillsText = LUI.UIStyledText.new()
	KillsText.id = "KillsText"
	KillsText:SetAlpha( 0, 0 )
	KillsText:SetFontSize( 18 * _1080p )
	KillsText:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	KillsText:SetAlignment( LUI.Alignment.Right )
	KillsText:SetShadowMinDistance( -0.2, 0 )
	KillsText:SetShadowMaxDistance( 0.2, 0 )
	KillsText:SetShadowRGBFromInt( 0, 0 )
	KillsText:SetDecodeLetterLength( 25 )
	KillsText:SetDecodeMaxRandChars( 3 )
	KillsText:SetDecodeUpdatesPerLetter( 4 )
	KillsText:SetAnchorsAndPosition( 1, 0, 0.5, 0.5, _1080p * -79, _1080p * -54, _1080p * -9, _1080p * 9 )
	KillsText:SubscribeToModelThroughElement( self, "kills", function ()
		local f4_local0 = self:GetDataSource()
		f4_local0 = f4_local0.kills:GetValue( f1_local1 )
		if f4_local0 ~= nil then
			KillsText:setText( f4_local0, 0 )
		end
	end )
	self:addElement( KillsText )
	self.KillsText = KillsText
	
	local KillsTextFluff = nil
	
	KillsTextFluff = LUI.UIStyledText.new()
	KillsTextFluff.id = "KillsTextFluff"
	KillsTextFluff:SetAlpha( 0, 0 )
	KillsTextFluff:setText( "/", 0 )
	KillsTextFluff:SetFontSize( 18 * _1080p )
	KillsTextFluff:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	KillsTextFluff:SetAlignment( LUI.Alignment.Right )
	KillsTextFluff:SetShadowMinDistance( -0.2, 0 )
	KillsTextFluff:SetShadowMaxDistance( 0.2, 0 )
	KillsTextFluff:SetShadowRGBFromInt( 0, 0 )
	KillsTextFluff:SetDecodeLetterLength( 25 )
	KillsTextFluff:SetDecodeMaxRandChars( 3 )
	KillsTextFluff:SetDecodeUpdatesPerLetter( 4 )
	KillsTextFluff:SetAnchorsAndPosition( 1, 0, 0.5, 0.5, _1080p * -79, _1080p * -43, _1080p * -9, _1080p * 9 )
	self:addElement( KillsTextFluff )
	self.KillsTextFluff = KillsTextFluff
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		Background:RegisterAnimationSequence( "Bootup", {
			{
				function ()
					return self.Background:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * 274, 0, 0, 0, 0 )
				end,
				function ()
					return self.Background:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, 0, 0, 200, LUI.EASING.outBack )
				end
			}
		} )
		CapLeft:RegisterAnimationSequence( "Bootup", {
			{
				function ()
					return self.CapLeft:SetAnchorsAndPosition( 0, 1, 0, 0, _1080p * 274, _1080p * 277, 0, 0, 0 )
				end,
				function ()
					return self.CapLeft:SetAnchorsAndPosition( 0, 1, 0, 0, 0, _1080p * 3, 0, 0, 200, LUI.EASING.outBack )
				end
			}
		} )
		HeaderText:RegisterAnimationSequence( "Bootup", {
			{
				function ()
					return self.HeaderText:SetAlpha( 0, 0 )
				end,
				function ()
					return self.HeaderText:SetAlpha( 1, 200 )
				end
			}
		} )
		LeftCheckBox:RegisterAnimationSequence( "Bootup", {
			{
				function ()
					return self.LeftCheckBox:SetAlpha( 0, 0 )
				end,
				function ()
					return self.LeftCheckBox:SetAlpha( 1, 200 )
				end
			}
		} )
		self._sequences.Bootup = function ()
			Background:AnimateSequence( "Bootup" )
			CapLeft:AnimateSequence( "Bootup" )
			HeaderText:AnimateSequence( "Bootup" )
			LeftCheckBox:AnimateSequence( "Bootup" )
		end
		
		Background:RegisterAnimationSequence( "Shutdown", {
			{
				function ()
					return self.Background:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, 0, 0, 0 )
				end,
				function ()
					return self.Background:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * 274, 0, 0, 0, 200 )
				end
			}
		} )
		CapLeft:RegisterAnimationSequence( "Shutdown", {
			{
				function ()
					return self.CapLeft:SetAnchorsAndPosition( 0, 1, 0, 0, 0, _1080p * 3, 0, 0, 0 )
				end,
				function ()
					return self.CapLeft:SetAnchorsAndPosition( 0, 1, 0, 0, _1080p * 274, _1080p * 277, 0, 0, 200 )
				end
			}
		} )
		HeaderText:RegisterAnimationSequence( "Shutdown", {
			{
				function ()
					return self.HeaderText:SetAlpha( 1, 0 )
				end,
				function ()
					return self.HeaderText:SetAlpha( 0, 200 )
				end
			}
		} )
		LeftCheckBox:RegisterAnimationSequence( "Shutdown", {
			{
				function ()
					return self.LeftCheckBox:SetAlpha( 1, 0 )
				end,
				function ()
					return self.LeftCheckBox:SetAlpha( 0, 200 )
				end
			}
		} )
		MaxKillsText:RegisterAnimationSequence( "Shutdown", {
			{
				function ()
					return self.MaxKillsText:SetAlpha( 0, 0 )
				end
			}
		} )
		KillsText:RegisterAnimationSequence( "Shutdown", {
			{
				function ()
					return self.KillsText:SetAlpha( 0, 0 )
				end
			}
		} )
		KillsTextFluff:RegisterAnimationSequence( "Shutdown", {
			{
				function ()
					return self.KillsTextFluff:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.Shutdown = function ()
			Background:AnimateSequence( "Shutdown" )
			CapLeft:AnimateSequence( "Shutdown" )
			HeaderText:AnimateSequence( "Shutdown" )
			LeftCheckBox:AnimateSequence( "Shutdown" )
			MaxKillsText:AnimateSequence( "Shutdown" )
			KillsText:AnimateSequence( "Shutdown" )
			KillsTextFluff:AnimateSequence( "Shutdown" )
		end
		
		HeaderText:RegisterAnimationSequence( "Complete", {
			{
				function ()
					return self.HeaderText:SetRGBFromInt( 16777215, 0 )
				end,
				function ()
					return self.HeaderText:SetRGBFromTable( SWATCHES.HUD.disabled, 200 )
				end
			}
		} )
		LeftCheckBox:RegisterAnimationSequence( "Complete", {
			{
				function ()
					return self.LeftCheckBox.Fill:SetAlpha( 0, 0 )
				end,
				function ()
					return self.LeftCheckBox.Fill:SetAlpha( 1, 100 )
				end,
				function ()
					return self.LeftCheckBox.Fill:SetAlpha( 0, 100 )
				end,
				function ()
					return self.LeftCheckBox.Fill:SetAlpha( 1, 100 )
				end,
				function ()
					return self.LeftCheckBox.Fill:SetAlpha( 0, 100 )
				end,
				function ()
					return self.LeftCheckBox.Fill:SetAlpha( 1, 100 )
				end
			}
		} )
		MaxKillsText:RegisterAnimationSequence( "Complete", {
			{
				function ()
					return self.MaxKillsText:SetRGBFromInt( 16777215, 0 )
				end,
				function ()
					return self.MaxKillsText:SetRGBFromTable( SWATCHES.HUD.disabled, 200 )
				end
			}
		} )
		KillsText:RegisterAnimationSequence( "Complete", {
			{
				function ()
					return self.KillsText:SetRGBFromInt( 16777215, 0 )
				end,
				function ()
					return self.KillsText:SetRGBFromTable( SWATCHES.HUD.disabled, 200 )
				end
			}
		} )
		KillsTextFluff:RegisterAnimationSequence( "Complete", {
			{
				function ()
					return self.KillsTextFluff:SetRGBFromInt( 16777215, 0 )
				end,
				function ()
					return self.KillsTextFluff:SetRGBFromTable( SWATCHES.HUD.disabled, 200 )
				end
			}
		} )
		self._sequences.Complete = function ()
			HeaderText:AnimateSequence( "Complete" )
			LeftCheckBox:AnimateSequence( "Complete" )
			MaxKillsText:AnimateSequence( "Complete" )
			KillsText:AnimateSequence( "Complete" )
			KillsTextFluff:AnimateSequence( "Complete" )
		end
		
		HeaderText:RegisterAnimationSequence( "NotComplete", {
			{
				function ()
					return self.HeaderText:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.HeaderText:SetRGBFromInt( 16777215, 0 )
				end
			}
		} )
		LeftCheckBox:RegisterAnimationSequence( "NotComplete", {
			{
				function ()
					return self.LeftCheckBox.Fill:SetAlpha( 0, 0 )
				end
			}
		} )
		MaxKillsText:RegisterAnimationSequence( "NotComplete", {
			{
				function ()
					return self.MaxKillsText:SetRGBFromInt( 16777215, 0 )
				end
			}
		} )
		KillsText:RegisterAnimationSequence( "NotComplete", {
			{
				function ()
					return self.KillsText:SetRGBFromInt( 16777215, 0 )
				end
			}
		} )
		KillsTextFluff:RegisterAnimationSequence( "NotComplete", {
			{
				function ()
					return self.KillsTextFluff:SetRGBFromInt( 16777215, 0 )
				end
			}
		} )
		self._sequences.NotComplete = function ()
			HeaderText:AnimateSequence( "NotComplete" )
			LeftCheckBox:AnimateSequence( "NotComplete" )
			MaxKillsText:AnimateSequence( "NotComplete" )
			KillsText:AnimateSequence( "NotComplete" )
			KillsTextFluff:AnimateSequence( "NotComplete" )
		end
		
		HeaderText:RegisterAnimationSequence( "ShowKillCount", {
			{
				function ()
					return self.HeaderText:SetAnchorsAndPosition( 1, 0, 0.5, 0.5, _1080p * -300, _1080p * -71, _1080p * -9, _1080p * 9, 0 )
				end
			}
		} )
		MaxKillsText:RegisterAnimationSequence( "ShowKillCount", {
			{
				function ()
					return self.MaxKillsText:SetAlpha( 1, 0 )
				end
			}
		} )
		KillsText:RegisterAnimationSequence( "ShowKillCount", {
			{
				function ()
					return self.KillsText:SetAlpha( 1, 0 )
				end
			}
		} )
		KillsTextFluff:RegisterAnimationSequence( "ShowKillCount", {
			{
				function ()
					return self.KillsTextFluff:SetAlpha( 1, 0 )
				end
			}
		} )
		self._sequences.ShowKillCount = function ()
			HeaderText:AnimateSequence( "ShowKillCount" )
			MaxKillsText:AnimateSequence( "ShowKillCount" )
			KillsText:AnimateSequence( "ShowKillCount" )
			KillsTextFluff:AnimateSequence( "ShowKillCount" )
		end
		
		HeaderText:RegisterAnimationSequence( "HideKillCount", {
			{
				function ()
					return self.HeaderText:SetAnchorsAndPosition( 1, 0, 0.5, 0.5, _1080p * -300, _1080p * -33, _1080p * -9, _1080p * 9, 0 )
				end
			}
		} )
		MaxKillsText:RegisterAnimationSequence( "HideKillCount", {
			{
				function ()
					return self.MaxKillsText:SetAlpha( 0, 0 )
				end
			}
		} )
		KillsText:RegisterAnimationSequence( "HideKillCount", {
			{
				function ()
					return self.KillsText:SetAlpha( 0, 0 )
				end
			}
		} )
		KillsTextFluff:RegisterAnimationSequence( "HideKillCount", {
			{
				function ()
					return self.KillsTextFluff:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.HideKillCount = function ()
			HeaderText:AnimateSequence( "HideKillCount" )
			MaxKillsText:AnimateSequence( "HideKillCount" )
			KillsText:AnimateSequence( "HideKillCount" )
			KillsTextFluff:AnimateSequence( "HideKillCount" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	self:SubscribeToModelThroughElement( self, "state", function ()
		local f60_local0 = self:GetDataSource()
		if f60_local0.state:GetValue( f1_local1 ) ~= nil then
			f60_local0 = self:GetDataSource()
			if f60_local0.state:GetValue( f1_local1 ) == 1 then
				ACTIONS.AnimateSequence( self, "Bootup" )
				ACTIONS.AnimateSequence( self, "NotComplete" )
			end
		end
		f60_local0 = self:GetDataSource()
		if f60_local0.state:GetValue( f1_local1 ) ~= nil then
			f60_local0 = self:GetDataSource()
			if f60_local0.state:GetValue( f1_local1 ) == 2 then
				ACTIONS.AnimateSequence( self, "Complete" )
			end
		end
		f60_local0 = self:GetDataSource()
		if f60_local0.state:GetValue( f1_local1 ) ~= nil then
			f60_local0 = self:GetDataSource()
			if f60_local0.state:GetValue( f1_local1 ) == 3 then
				ACTIONS.AnimateSequence( self, "Shutdown" )
			end
		end
	end )
	self:SubscribeToModelThroughElement( self, "maxKills", function ()
		local f61_local0 = self:GetDataSource()
		if f61_local0.maxKills:GetValue( f1_local1 ) ~= nil then
			f61_local0 = self:GetDataSource()
			if f61_local0.maxKills:GetValue( f1_local1 ) > 0 then
				ACTIONS.AnimateSequence( self, "ShowKillCount" )
			end
		end
		f61_local0 = self:GetDataSource()
		if f61_local0.maxKills:GetValue( f1_local1 ) ~= nil then
			f61_local0 = self:GetDataSource()
			if f61_local0.maxKills:GetValue( f1_local1 ) == 0 then
				ACTIONS.AnimateSequence( self, "HideKillCount" )
			end
		end
	end )
	return self
end

MenuBuilder.registerType( "JackalObjective", JackalObjective )
LockTable( _M )
