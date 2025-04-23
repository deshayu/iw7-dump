local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function JackalWeapons( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 110 * _1080p, 0, 32 * _1080p )
	self.id = "JackalWeapons"
	self._animationSets = {}
	self._sequences = {}
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local LeftLabel = nil
	
	LeftLabel = LUI.UIText.new()
	LeftLabel.id = "LeftLabel"
	LeftLabel:SetRGBFromTable( SWATCHES.jackal.stable, 0 )
	LeftLabel:setText( ToUpperCase( Engine.Localize( "JACKAL_30MM" ) ), 0 )
	LeftLabel:SetFontSize( 16 * _1080p )
	LeftLabel:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	LeftLabel:SetAlignment( LUI.Alignment.Center )
	LeftLabel:SetAnchorsAndPosition( 0, 1, 1, 0, 0, _1080p * 50, _1080p * -16, 0 )
	self:addElement( LeftLabel )
	self.LeftLabel = LeftLabel
	
	local LeftCheckBox = nil
	
	LeftCheckBox = MenuBuilder.BuildRegisteredType( "GenericCheckBox", {
		controllerIndex = f1_local1
	} )
	LeftCheckBox.id = "LeftCheckBox"
	LeftCheckBox.Frame:SetRGBFromTable( SWATCHES.jackal.stable, 0 )
	LeftCheckBox.Fill:SetRGBFromTable( SWATCHES.jackal.selected, 0 )
	LeftCheckBox:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 18, _1080p * 32, 0, _1080p * 14 )
	self:addElement( LeftCheckBox )
	self.LeftCheckBox = LeftCheckBox
	
	local Line = nil
	
	Line = LUI.UIImage.new()
	Line.id = "Line"
	Line:SetRGBFromTable( SWATCHES.jackal.stable, 0 )
	Line:SetAnchorsAndPosition( 0.5, 0.5, 0, 0, _1080p * -1, _1080p * 1, 0, _1080p * -14 )
	self:addElement( Line )
	self.Line = Line
	
	local RightLabel = nil
	
	RightLabel = LUI.UIText.new()
	RightLabel.id = "RightLabel"
	RightLabel:SetRGBFromTable( SWATCHES.jackal.stable, 0 )
	RightLabel:SetAlpha( 0.5, 0 )
	RightLabel:setText( ToUpperCase( Engine.Localize( "JACKAL_50MM" ) ), 0 )
	RightLabel:SetFontSize( 16 * _1080p )
	RightLabel:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	RightLabel:SetAlignment( LUI.Alignment.Center )
	RightLabel:SetAnchorsAndPosition( 1, 0, 1, 0, _1080p * -50, 0, _1080p * -16, 0 )
	self:addElement( RightLabel )
	self.RightLabel = RightLabel
	
	local RightCheckBox = nil
	
	RightCheckBox = MenuBuilder.BuildRegisteredType( "GenericCheckBox", {
		controllerIndex = f1_local1
	} )
	RightCheckBox.id = "RightCheckBox"
	RightCheckBox:SetAlpha( 0.5, 0 )
	RightCheckBox.Frame:SetRGBFromTable( SWATCHES.jackal.stable, 0 )
	RightCheckBox.Fill:SetRGBFromTable( SWATCHES.jackal.selected, 0 )
	RightCheckBox.Fill:SetAlpha( 0, 0 )
	RightCheckBox:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -32, _1080p * -18, 0, _1080p * 14 )
	self:addElement( RightCheckBox )
	self.RightCheckBox = RightCheckBox
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		LeftLabel:RegisterAnimationSequence( "guns", {
			{
				function ()
					return self.LeftLabel:SetAlpha( 1, 0 )
				end
			}
		} )
		LeftCheckBox:RegisterAnimationSequence( "guns", {
			{
				function ()
					return self.LeftCheckBox:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.LeftCheckBox.Fill:SetAlpha( 1, 0 )
				end
			}
		} )
		RightLabel:RegisterAnimationSequence( "guns", {
			{
				function ()
					return self.RightLabel:SetAlpha( 0.5, 0 )
				end
			}
		} )
		RightCheckBox:RegisterAnimationSequence( "guns", {
			{
				function ()
					return self.RightCheckBox:SetAlpha( 0.5, 0 )
				end
			},
			{
				function ()
					return self.RightCheckBox.Fill:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.guns = function ()
			LeftLabel:AnimateSequence( "guns" )
			LeftCheckBox:AnimateSequence( "guns" )
			RightLabel:AnimateSequence( "guns" )
			RightCheckBox:AnimateSequence( "guns" )
		end
		
		LeftLabel:RegisterAnimationSequence( "cannons", {
			{
				function ()
					return self.LeftLabel:SetAlpha( 0.5, 0 )
				end
			}
		} )
		LeftCheckBox:RegisterAnimationSequence( "cannons", {
			{
				function ()
					return self.LeftCheckBox.Fill:SetAlpha( 0, 0 )
				end
			},
			{
				function ()
					return self.LeftCheckBox:SetAlpha( 0.5, 0 )
				end
			}
		} )
		RightLabel:RegisterAnimationSequence( "cannons", {
			{
				function ()
					return self.RightLabel:SetAlpha( 1, 0 )
				end
			}
		} )
		RightCheckBox:RegisterAnimationSequence( "cannons", {
			{
				function ()
					return self.RightCheckBox:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.RightCheckBox.Fill:SetAlpha( 1, 0 )
				end
			}
		} )
		self._sequences.cannons = function ()
			LeftLabel:AnimateSequence( "cannons" )
			LeftCheckBox:AnimateSequence( "cannons" )
			RightLabel:AnimateSequence( "cannons" )
			RightCheckBox:AnimateSequence( "cannons" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	self:SubscribeToModel( DataSources.inGame.jackal.weaponName:GetModel( f1_local1 ), function ()
		if DataSources.inGame.jackal.weaponName:GetValue( f1_local1 ) ~= nil and DataSources.inGame.jackal.weaponName:GetValue( f1_local1 ) == "JACKAL_30MM" then
			ACTIONS.AnimateSequence( self, "guns" )
		end
		if DataSources.inGame.jackal.weaponName:GetValue( f1_local1 ) ~= nil and DataSources.inGame.jackal.weaponName:GetValue( f1_local1 ) == "JACKAL_50MM" then
			ACTIONS.AnimateSequence( self, "cannons" )
		end
	end )
	return self
end

MenuBuilder.registerType( "JackalWeapons", JackalWeapons )
LockTable( _M )
