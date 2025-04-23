local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function OnWorldCallout( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 200 * _1080p, 0, 26 * _1080p )
	self.id = "OnWorldCallout"
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
	Background:SetRGBFromTable( SWATCHES.HUD.disabled, 0 )
	Background:SetAlpha( 0.4, 0 )
	self:addElement( Background )
	self.Background = Background
	
	local Border0 = nil
	
	Border0 = LUI.UIImage.new()
	Border0.id = "Border0"
	Border0:SetRGBFromTable( SWATCHES.HUD.stable, 0 )
	Border0:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, 0, _1080p * 2 )
	self:addElement( Border0 )
	self.Border0 = Border0
	
	local Border1 = nil
	
	Border1 = LUI.UIImage.new()
	Border1.id = "Border1"
	Border1:SetRGBFromTable( SWATCHES.HUD.stable, 0 )
	Border1:SetAnchorsAndPosition( 0, 0, 1, 0, 0, 0, _1080p * -2, 0 )
	self:addElement( Border1 )
	self.Border1 = Border1
	
	local Border2 = nil
	
	Border2 = LUI.UIImage.new()
	Border2.id = "Border2"
	Border2:SetRGBFromTable( SWATCHES.HUD.stable, 0 )
	Border2:SetAnchorsAndPosition( 1, 0, 0, 0, _1080p * -1, 0, 0, 0 )
	self:addElement( Border2 )
	self.Border2 = Border2
	
	local Border3 = nil
	
	Border3 = LUI.UIImage.new()
	Border3.id = "Border3"
	Border3:SetRGBFromTable( SWATCHES.HUD.stable, 0 )
	Border3:SetAnchorsAndPosition( 0, 1, 0, 0, _1080p * 1, 0, 0, 0 )
	self:addElement( Border3 )
	self.Border3 = Border3
	
	local Flair3 = nil
	
	Flair3 = LUI.UIImage.new()
	Flair3.id = "Flair3"
	Flair3:SetRGBFromTable( SWATCHES.HUD.stable, 0 )
	Flair3:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -79, 0, _1080p * -2, _1080p * -1 )
	self:addElement( Flair3 )
	self.Flair3 = Flair3
	
	local Flair2 = nil
	
	Flair2 = LUI.UIImage.new()
	Flair2.id = "Flair2"
	Flair2:SetRGBFromTable( SWATCHES.HUD.stable, 0 )
	Flair2:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 79, _1080p * -2, _1080p * -1 )
	self:addElement( Flair2 )
	self.Flair2 = Flair2
	
	local Flair1 = nil
	
	Flair1 = LUI.UIImage.new()
	Flair1.id = "Flair1"
	Flair1:SetRGBFromTable( SWATCHES.HUD.stable, 0 )
	Flair1:SetAnchorsAndPosition( 0, 1, 1, 0, 0, _1080p * 79, _1080p * 1, _1080p * 2 )
	self:addElement( Flair1 )
	self.Flair1 = Flair1
	
	local Flair0 = nil
	
	Flair0 = LUI.UIImage.new()
	Flair0.id = "Flair0"
	Flair0:SetRGBFromTable( SWATCHES.HUD.stable, 0 )
	Flair0:SetAnchorsAndPosition( 1, 0, 1, 0, 0, _1080p * -79, _1080p * 1, _1080p * 2 )
	self:addElement( Flair0 )
	self.Flair0 = Flair0
	
	local SideFlair1 = nil
	
	SideFlair1 = LUI.UIImage.new()
	SideFlair1.id = "SideFlair1"
	SideFlair1:SetRGBFromTable( SWATCHES.HUD.stable, 0 )
	SideFlair1:SetAnchorsAndPosition( 1, 0, 0.5, 0.5, _1080p * -3, _1080p * 2, 0, _1080p * 1 )
	self:addElement( SideFlair1 )
	self.SideFlair1 = SideFlair1
	
	local SideFlair0 = nil
	
	SideFlair0 = LUI.UIImage.new()
	SideFlair0.id = "SideFlair0"
	SideFlair0:SetRGBFromTable( SWATCHES.HUD.stable, 0 )
	SideFlair0:SetAnchorsAndPosition( 0, 1, 0.5, 0.5, _1080p * -2, _1080p * 3, 0, _1080p * 1 )
	self:addElement( SideFlair0 )
	self.SideFlair0 = SideFlair0
	
	local CalloutArrow0 = nil
	
	CalloutArrow0 = MenuBuilder.BuildRegisteredType( "CalloutArrow", {
		controllerIndex = f1_local1
	} )
	CalloutArrow0.id = "CalloutArrow0"
	CalloutArrow0:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -4.47, _1080p * 4.47, _1080p * 14.5, _1080p * 23.44 )
	self:addElement( CalloutArrow0 )
	self.CalloutArrow0 = CalloutArrow0
	
	local CalloutArrow1 = nil
	
	CalloutArrow1 = MenuBuilder.BuildRegisteredType( "CalloutArrow", {
		controllerIndex = f1_local1
	} )
	CalloutArrow1.id = "CalloutArrow1"
	CalloutArrow1:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 90, _1080p * 99, _1080p * 15, _1080p * 23.94 )
	self:addElement( CalloutArrow1 )
	self.CalloutArrow1 = CalloutArrow1
	
	local CalloutArrow2 = nil
	
	CalloutArrow2 = MenuBuilder.BuildRegisteredType( "CalloutArrow", {
		controllerIndex = f1_local1
	} )
	CalloutArrow2.id = "CalloutArrow2"
	CalloutArrow2:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -99.5, _1080p * -90.5, _1080p * 15, _1080p * 23.94 )
	self:addElement( CalloutArrow2 )
	self.CalloutArrow2 = CalloutArrow2
	
	local CalloutArrow3 = nil
	
	CalloutArrow3 = MenuBuilder.BuildRegisteredType( "CalloutArrow", {
		controllerIndex = f1_local1
	} )
	CalloutArrow3.id = "CalloutArrow3"
	CalloutArrow3:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -54, _1080p * -45, _1080p * 15.06, _1080p * 24 )
	self:addElement( CalloutArrow3 )
	self.CalloutArrow3 = CalloutArrow3
	
	local CalloutArrow4 = nil
	
	CalloutArrow4 = MenuBuilder.BuildRegisteredType( "CalloutArrow", {
		controllerIndex = f1_local1
	} )
	CalloutArrow4.id = "CalloutArrow4"
	CalloutArrow4:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 45.5, _1080p * 54.5, _1080p * 15, _1080p * 23.94 )
	self:addElement( CalloutArrow4 )
	self.CalloutArrow4 = CalloutArrow4
	
	local CalloutText = nil
	
	CalloutText = LUI.UIText.new()
	CalloutText.id = "CalloutText"
	CalloutText:SetRGBFromTable( SWATCHES.HUD.normal, 0 )
	CalloutText:SetFontSize( 22 * _1080p )
	CalloutText:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	CalloutText:SetAlignment( LUI.Alignment.Center )
	CalloutText:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * 1, _1080p * -1, _1080p * 2, _1080p * -2 )
	CalloutText:SubscribeToModelThroughElement( self, "string", function ()
		local f2_local0 = self:GetDataSource()
		f2_local0 = f2_local0.string:GetValue( f1_local1 )
		if f2_local0 ~= nil then
			CalloutText:setText( f2_local0, 0 )
		end
	end )
	self:addElement( CalloutText )
	self.CalloutText = CalloutText
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		Background:RegisterAnimationSequence( "FadeOut", {
			{
				function ()
					return self.Background:SetAlpha( 0.4, 0 )
				end,
				function ()
					return self.Background:SetAlpha( 1, 60 )
				end,
				function ()
					return self.Background:SetAlpha( 0.2, 70 )
				end,
				function ()
					return self.Background:SetAlpha( 0.75, 70 )
				end,
				function ()
					return self.Background:SetAlpha( 0.32, 60 )
				end,
				function ()
					return self.Background:SetAlpha( 0.9, 60 )
				end,
				function ()
					return self.Background:SetAlpha( 0.25, 60 )
				end,
				function ()
					return self.Background:SetAlpha( 0.9, 60 )
				end,
				function ()
					return self.Background:SetAlpha( 0.32, 60 )
				end,
				function ()
					return self.Background:SetAlpha( 0.75, 60 )
				end,
				function ()
					return self.Background:SetAlpha( 0.2, 80 )
				end,
				function ()
					return self.Background:SetAlpha( 0, 350 )
				end
			}
		} )
		Border0:RegisterAnimationSequence( "FadeOut", {
			{
				function ()
					return self.Border0:SetAlpha( 1, 0 )
				end,
				function ()
					return self.Border0:SetAlpha( 0.2, 60 )
				end,
				function ()
					return self.Border0:SetAlpha( 0.75, 60 )
				end,
				function ()
					return self.Border0:SetAlpha( 0.15, 80 )
				end,
				function ()
					return self.Border0:SetAlpha( 0, 90 )
				end
			}
		} )
		Border1:RegisterAnimationSequence( "FadeOut", {
			{
				function ()
					return self.Border1:SetAlpha( 0.2, 0 )
				end,
				function ()
					return self.Border1:SetAlpha( 0.1, 40 )
				end,
				function ()
					return self.Border1:SetAlpha( 0.88, 40 )
				end,
				function ()
					return self.Border1:SetAlpha( 0.33, 60 )
				end,
				function ()
					return self.Border1:SetAlpha( 0.75, 80 )
				end,
				function ()
					return self.Border1:SetAlpha( 0.2, 70 )
				end,
				function ()
					return self.Border1:SetAlpha( 0.9, 70 )
				end,
				function ()
					return self.Border1:SetAlpha( 0, 80 )
				end
			}
		} )
		Border2:RegisterAnimationSequence( "FadeOut", {
			{
				function ()
					return self.Border2:SetAlpha( 1, 0 )
				end,
				function ()
					return self.Border2:SetAlpha( 0.23, 50 )
				end,
				function ()
					return self.Border2:SetAlpha( 0.67, 70 )
				end,
				function ()
					return self.Border2:SetAlpha( 0.12, 60 )
				end,
				function ()
					return self.Border2:SetAlpha( 0.88, 80 )
				end,
				function ()
					return self.Border2:SetAlpha( 0.13, 90 )
				end,
				function ()
					return self.Border2:SetAlpha( 0.65, 110 )
				end,
				function ()
					return self.Border2:SetAlpha( 0, 110 )
				end
			}
		} )
		Border3:RegisterAnimationSequence( "FadeOut", {
			{
				function ()
					return self.Border3:SetAlpha( 1, 0 )
				end,
				function ()
					return self.Border3:SetAlpha( 0.15, 70 )
				end,
				function ()
					return self.Border3:SetAlpha( 0.85, 80 )
				end,
				function ()
					return self.Border3:SetAlpha( 0.32, 80 )
				end
			}
		} )
		Flair3:RegisterAnimationSequence( "FadeOut", {
			{
				function ()
					return self.Flair3:SetAlpha( 1, 0 )
				end,
				function ()
					return self.Flair3:SetAlpha( 0, 570 )
				end
			}
		} )
		Flair2:RegisterAnimationSequence( "FadeOut", {
			{
				function ()
					return self.Flair2:SetAlpha( 1, 0 )
				end,
				function ()
					return self.Flair2:SetAlpha( 0, 450 )
				end
			}
		} )
		Flair1:RegisterAnimationSequence( "FadeOut", {
			{
				function ()
					return self.Flair1:SetAlpha( 1, 0 )
				end,
				function ()
					return self.Flair1:SetAlpha( 0, 250 )
				end
			}
		} )
		Flair0:RegisterAnimationSequence( "FadeOut", {
			{
				function ()
					return self.Flair0:SetAlpha( 1, 0 )
				end,
				function ()
					return self.Flair0:SetAlpha( 0, 990 )
				end
			}
		} )
		SideFlair1:RegisterAnimationSequence( "FadeOut", {
			{
				function ()
					return self.SideFlair1:SetAlpha( 1, 0 )
				end,
				function ()
					return self.SideFlair1:SetAlpha( 0, 350 )
				end
			}
		} )
		SideFlair0:RegisterAnimationSequence( "FadeOut", {
			{
				function ()
					return self.SideFlair0:SetAlpha( 1, 0 )
				end,
				function ()
					return self.SideFlair0:SetAlpha( 0, 680 )
				end
			}
		} )
		CalloutArrow0:RegisterAnimationSequence( "FadeOut", {
			{
				function ()
					return self.CalloutArrow0:SetAlpha( 0, 0 )
				end
			}
		} )
		CalloutArrow1:RegisterAnimationSequence( "FadeOut", {
			{
				function ()
					return self.CalloutArrow1:SetAlpha( 0, 0 )
				end
			}
		} )
		CalloutArrow2:RegisterAnimationSequence( "FadeOut", {
			{
				function ()
					return self.CalloutArrow2:SetAlpha( 0, 0 )
				end
			}
		} )
		CalloutArrow3:RegisterAnimationSequence( "FadeOut", {
			{
				function ()
					return self.CalloutArrow3:SetAlpha( 0, 0 )
				end
			}
		} )
		CalloutArrow4:RegisterAnimationSequence( "FadeOut", {
			{
				function ()
					return self.CalloutArrow4:SetAlpha( 0, 0 )
				end
			}
		} )
		CalloutText:RegisterAnimationSequence( "FadeOut", {
			{
				function ()
					return self.CalloutText:SetAlpha( 1, 0 )
				end,
				function ()
					return self.CalloutText:SetAlpha( 0.15, 40 )
				end,
				function ()
					return self.CalloutText:SetAlpha( 0.72, 50 )
				end,
				function ()
					return self.CalloutText:SetAlpha( 0.31, 60 )
				end,
				function ()
					return self.CalloutText:SetAlpha( 0.99, 70 )
				end,
				function ()
					return self.CalloutText:SetAlpha( 0.1, 40 )
				end,
				function ()
					return self.CalloutText:SetAlpha( 0.76, 70 )
				end,
				function ()
					return self.CalloutText:SetAlpha( 0.21, 70 )
				end,
				function ()
					return self.CalloutText:SetAlpha( 0.97, 70 )
				end,
				function ()
					return self.CalloutText:SetAlpha( 0.31, 50 )
				end,
				function ()
					return self.CalloutText:SetAlpha( 0.65, 60 )
				end,
				function ()
					return self.CalloutText:SetAlpha( 0, 420 )
				end
			}
		} )
		self._sequences.FadeOut = function ()
			Background:AnimateSequence( "FadeOut" )
			Border0:AnimateSequence( "FadeOut" )
			Border1:AnimateSequence( "FadeOut" )
			Border2:AnimateSequence( "FadeOut" )
			Border3:AnimateSequence( "FadeOut" )
			Flair3:AnimateSequence( "FadeOut" )
			Flair2:AnimateSequence( "FadeOut" )
			Flair1:AnimateSequence( "FadeOut" )
			Flair0:AnimateSequence( "FadeOut" )
			SideFlair1:AnimateSequence( "FadeOut" )
			SideFlair0:AnimateSequence( "FadeOut" )
			CalloutArrow0:AnimateSequence( "FadeOut" )
			CalloutArrow1:AnimateSequence( "FadeOut" )
			CalloutArrow2:AnimateSequence( "FadeOut" )
			CalloutArrow3:AnimateSequence( "FadeOut" )
			CalloutArrow4:AnimateSequence( "FadeOut" )
			CalloutText:AnimateSequence( "FadeOut" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	self:SubscribeToModelThroughElement( self, "show", function ()
		local f72_local0 = self:GetDataSource()
		if f72_local0.show:GetValue( f1_local1 ) ~= nil then
			f72_local0 = self:GetDataSource()
			if f72_local0.show:GetValue( f1_local1 ) == false then
				ACTIONS.AnimateSequence( self, "FadeOut" )
			end
		end
	end )
	return self
end

MenuBuilder.registerType( "OnWorldCallout", OnWorldCallout )
LockTable( _M )
