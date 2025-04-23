local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ( f1_arg0, f1_arg1, f1_arg2 )
	f1_arg0.Place:SetShadowUOffset( -0 )
	f1_arg0.Place:SetShadowVOffset( -0 )
	f1_arg0.Score:SetShadowUOffset( -0 )
	f1_arg0.Score:SetShadowVOffset( -0 )
	assert( f1_arg0.Playercard )
	if f1_arg0.Playercard.RankIcon then
		f1_arg0.Playercard.RankIcon:SetAlpha( 0 )
	end
	if f1_arg0.Playercard.Rank then
		f1_arg0.Playercard.Rank:SetAlpha( 0 )
	end
end

function BroshotPlayercard( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 420 * _1080p, 0, 170 * _1080p )
	self.id = "BroshotPlayercard"
	self._animationSets = {}
	self._sequences = {}
	local f2_local1 = controller and controller.controllerIndex
	if not f2_local1 and not Engine.InFrontend() then
		f2_local1 = self:getRootController()
	end
	assert( f2_local1 )
	local f2_local2 = self
	local Playercard = nil
	
	Playercard = MenuBuilder.BuildRegisteredType( "SmallPlayerCard", {
		controllerIndex = f2_local1
	} )
	Playercard.id = "Playercard"
	Playercard:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 420, _1080p * 50, _1080p * 170 )
	self:addElement( Playercard )
	self.Playercard = Playercard
	
	local Place = nil
	
	Place = LUI.UIStyledText.new()
	Place.id = "Place"
	Place:SetRGBFromTable( SWATCHES.genericButton.background, 0 )
	Place:setText( "", 0 )
	Place:SetFontSize( 38 * _1080p )
	Place:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	Place:SetAlignment( LUI.Alignment.Center )
	Place:SetShadowMinDistance( -0.01, 0 )
	Place:SetShadowMaxDistance( 0.01, 0 )
	Place:SetShadowRGBFromInt( 0, 0 )
	Place:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 120, _1080p * 5, _1080p * 43 )
	self:addElement( Place )
	self.Place = Place
	
	local Score = nil
	
	Score = LUI.UIStyledText.new()
	Score.id = "Score"
	Score:SetRGBFromTable( SWATCHES.genericButton.background, 0 )
	Score:setText( "", 0 )
	Score:SetFontSize( 32 * _1080p )
	Score:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	Score:SetAlignment( LUI.Alignment.Left )
	Score:SetShadowMinDistance( -0.01, 0 )
	Score:SetShadowMaxDistance( 0.01, 0 )
	Score:SetShadowRGBFromInt( 0, 0 )
	Score:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 150, 0, _1080p * 8, _1080p * 40 )
	self:addElement( Score )
	self.Score = Score
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		Place:RegisterAnimationSequence( "FirstPlace", {
			{
				function ()
					return self.Place:SetRGBFromTable( SWATCHES.genericButton.highlight, 0 )
				end
			},
			{
				function ()
					return self.Place:SetOutlineRGBFromInt( 16767744, 0 )
				end
			},
			{
				function ()
					return self.Place:SetOutlineMaxDistance( 0.3, 0 )
				end
			},
			{
				function ()
					return self.Place:SetOutlineMinDistance( -0.3, 0 )
				end
			}
		} )
		self._sequences.FirstPlace = function ()
			Place:AnimateSequence( "FirstPlace" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	f0_local0( self, f2_local1, controller )
	return self
end

MenuBuilder.registerType( "BroshotPlayercard", BroshotPlayercard )
LockTable( _M )
