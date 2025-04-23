local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function DeathHint( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 1000 * _1080p, 0, 40 * _1080p )
	self.id = "DeathHint"
	self._animationSets = {}
	self._sequences = {}
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local DeathQuote = nil
	
	DeathQuote = LUI.UIText.new()
	DeathQuote.id = "DeathQuote"
	DeathQuote:SetRGBFromTable( SWATCHES.HUD.stable, 0 )
	DeathQuote:SetFontSize( 36 * _1080p )
	DeathQuote:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	DeathQuote:setTextStyle( CoD.TextStyle.Shadowed )
	DeathQuote:SetAlignment( LUI.Alignment.Center )
	DeathQuote:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 1000, 0, _1080p * 36 )
	DeathQuote:SubscribeToModel( DataSources.inGame.SP.deathHint.deathQuote:GetModel( f1_local1 ), function ()
		local f2_local0 = DataSources.inGame.SP.deathHint.deathQuote:GetValue( f1_local1 )
		if f2_local0 ~= nil then
			DeathQuote:setText( f2_local0, 0 )
		end
	end )
	self:addElement( DeathQuote )
	self.DeathQuote = DeathQuote
	
	local DeathIcon = nil
	
	DeathIcon = LUI.UIImage.new()
	DeathIcon.id = "DeathIcon"
	DeathIcon:SetRGBFromTable( SWATCHES.HUD.stable, 0 )
	DeathIcon:SetScale( 0.5, 0 )
	DeathIcon:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -32, _1080p * 32, _1080p * 90, _1080p * 154 )
	DeathIcon:BindAlphaToModel( DataSources.inGame.SP.deathHint.deathIconAlpha:GetModel( f1_local1 ) )
	DeathIcon:SubscribeToModel( DataSources.inGame.SP.deathHint.deathIcon:GetModel( f1_local1 ), function ()
		local f3_local0 = DataSources.inGame.SP.deathHint.deathIcon:GetValue( f1_local1 )
		if f3_local0 ~= nil then
			DeathIcon:setImage( RegisterMaterial( f3_local0 ), 0 )
		end
	end )
	self:addElement( DeathIcon )
	self.DeathIcon = DeathIcon
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		DeathQuote:RegisterAnimationSequence( "FadeIn", {
			{
				function ()
					return self.DeathQuote:SetAlpha( 1, 500 )
				end
			}
		} )
		self._sequences.FadeIn = function ()
			DeathQuote:AnimateSequence( "FadeIn" )
		end
		
		DeathQuote:RegisterAnimationSequence( "FadeOut", {
			{
				function ()
					return self.DeathQuote:SetAlpha( 0, 500 )
				end
			}
		} )
		self._sequences.FadeOut = function ()
			DeathQuote:AnimateSequence( "FadeOut" )
			DeathIcon:AnimateSequence( "FadeOut" )
		end
		
		self._sequences.FadeInIcon = function ()
			DeathIcon:AnimateSequence( "FadeInIcon" )
		end
		
		DeathQuote:RegisterAnimationSequence( "fadeInJackal", {
			{
				function ()
					return self.DeathQuote:SetAlpha( 0, 0 )
				end,
				function ()
					return self.DeathQuote:SetAlpha( 0, 490 )
				end,
				function ()
					return self.DeathQuote:SetAlpha( 1, 1070 )
				end
			}
		} )
		self._sequences.fadeInJackal = function ()
			DeathQuote:AnimateSequence( "fadeInJackal" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	local f1_local5 = function ()
		if DataSources.inGame.SP.deathHint.deathQuote:GetValue( f1_local1 ) ~= nil and DataSources.inGame.SP.deathHint.deathQuote:GetValue( f1_local1 ) ~= "" and DataSources.inGame.jackal.deathQuote:GetValue( f1_local1 ) ~= nil and DataSources.inGame.jackal.deathQuote:GetValue( f1_local1 ) == false then
			ACTIONS.AnimateSequence( self, "FadeIn" )
		end
		if DataSources.inGame.SP.deathHint.deathQuote:GetValue( f1_local1 ) ~= nil and DataSources.inGame.SP.deathHint.deathQuote:GetValue( f1_local1 ) ~= "" and DataSources.inGame.jackal.deathQuote:GetValue( f1_local1 ) ~= nil and DataSources.inGame.jackal.deathQuote:GetValue( f1_local1 ) == true then
			ACTIONS.AnimateSequence( self, "fadeInJackal" )
		end
	end
	
	self:SubscribeToModel( DataSources.inGame.SP.deathHint.deathQuote:GetModel( f1_local1 ), f1_local5 )
	self:SubscribeToModel( DataSources.inGame.jackal.deathQuote:GetModel( f1_local1 ), f1_local5 )
	self:SubscribeToModel( DataSources.inGame.SP.deathHint.deathIcon:GetModel( f1_local1 ), function ()
		if DataSources.inGame.SP.deathHint.deathIcon:GetValue( f1_local1 ) ~= nil and DataSources.inGame.SP.deathHint.deathIcon:GetValue( f1_local1 ) == "" then
			ACTIONS.AnimateSequence( self, "FadeOut" )
		end
		if DataSources.inGame.SP.deathHint.deathIcon:GetValue( f1_local1 ) ~= nil and DataSources.inGame.SP.deathHint.deathIcon:GetValue( f1_local1 ) ~= "" then
			ACTIONS.AnimateSequence( self, "FadeInIcon" )
		end
	end )
	return self
end

MenuBuilder.registerType( "DeathHint", DeathHint )
LockTable( _M )
