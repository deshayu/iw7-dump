local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ( f1_arg0, f1_arg1, f1_arg2 )
	f1_arg0.previouslySelected = false
end

function codcaster_ScoreLogoWidget( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 406 * _1080p, 0, 165 * _1080p )
	self.id = "codcaster_ScoreLogoWidget"
	self._animationSets = {}
	self._sequences = {}
	local f2_local1 = controller and controller.controllerIndex
	if not f2_local1 and not Engine.InFrontend() then
		f2_local1 = self:getRootController()
	end
	assert( f2_local1 )
	local f2_local2 = self
	local Blur = nil
	
	Blur = LUI.UIBlur.new()
	Blur.id = "Blur"
	Blur:setImage( RegisterMaterial( "codcaster_scoreboard_team_mask" ), 0 )
	Blur:SetUMin( 0.92, 0 )
	Blur:SetUMax( 0, 0 )
	Blur:SetVMin( 0.01, 0 )
	Blur:SetBlendMode( BLEND_MODE.blend )
	Blur:SetBlurStrength( 0.75, 0 )
	Blur:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * 77.17, _1080p * 0.3, 0, _1080p * -1 )
	self:addElement( Blur )
	self.Blur = Blur
	
	local teamcolor = nil
	
	teamcolor = LUI.UIImage.new()
	teamcolor.id = "teamcolor"
	teamcolor:SetAlpha( 0.8, 0 )
	teamcolor:SetDotPitchEnabled( true )
	teamcolor:SetDotPitchX( 6, 0 )
	teamcolor:SetDotPitchY( 3, 0 )
	teamcolor:SetDotPitchContrast( 0.15, 0 )
	teamcolor:SetDotPitchMode( 0 )
	teamcolor:setImage( RegisterMaterial( "codcaster_scoreboard_team_bg" ), 0 )
	teamcolor:SetUMin( 0.81, 0 )
	teamcolor:SetUMax( 0.01, 0 )
	teamcolor:SetVMin( 0.01, 0 )
	teamcolor:SetBlendMode( BLEND_MODE.blend )
	teamcolor:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * 75.17, _1080p * 0.3, 0, _1080p * -1 )
	self:addElement( teamcolor )
	self.teamcolor = teamcolor
	
	local Select = nil
	
	Select = LUI.UIImage.new()
	Select.id = "Select"
	Select:SetAlpha( 0, 0 )
	Select:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 76.17, _1080p * 79.17, _1080p * 62.71, _1080p * 161.71 )
	self:addElement( Select )
	self.Select = Select
	
	local logo = nil
	
	logo = LUI.UIImage.new()
	logo.id = "logo"
	logo:setImage( RegisterMaterial( "icon_faction_sdf_color" ), 0 )
	logo:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * 275.75, _1080p * -21, _1080p * 58.75, _1080p * 3 )
	self:addElement( logo )
	self.logo = logo
	
	local SelectionTeam = nil
	
	SelectionTeam = LUI.UIImage.new()
	SelectionTeam.id = "SelectionTeam"
	SelectionTeam:SetAlpha( 0, 0 )
	SelectionTeam:setImage( RegisterMaterial( "gradient_fadein_fadebottom" ), 0 )
	SelectionTeam:SetUMin( 0.01, 0 )
	SelectionTeam:SetUMax( 0.99, 0 )
	SelectionTeam:SetVMax( 0.99, 0 )
	SelectionTeam:SetBlendMode( BLEND_MODE.addWithAlpha )
	SelectionTeam:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -132.2, _1080p * 407.3, _1080p * 24, _1080p * 139 )
	self:addElement( SelectionTeam )
	self.SelectionTeam = SelectionTeam
	
	local Highlight = nil
	
	Highlight = LUI.UIImage.new()
	Highlight.id = "Highlight"
	Highlight:SetRGBFromInt( 0, 0 )
	Highlight:setImage( RegisterMaterial( "codcaster_shine" ), 0 )
	Highlight:SetUMin( 0.12, 0 )
	Highlight:SetUMax( 0.88, 0 )
	Highlight:SetVMin( -0, 0 )
	Highlight:SetBlendMode( BLEND_MODE.addWithAlpha )
	Highlight:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 77.67, _1080p * 400, _1080p * 28, _1080p * 164 )
	self:addElement( Highlight )
	self.Highlight = Highlight
	
	local TeamScore = nil
	
	TeamScore = LUI.UIStyledText.new()
	TeamScore.id = "TeamScore"
	TeamScore:setText( Engine.Localize( "MENU_NEW" ), 0 )
	TeamScore:SetFontSize( 50 * _1080p )
	TeamScore:SetFont( FONTS.GetFont( FONTS.MainExtended.File ) )
	TeamScore:SetAlignment( LUI.Alignment.Center )
	TeamScore:SetShadowMinDistance( -0.5, 0 )
	TeamScore:SetShadowMaxDistance( 0.5, 0 )
	TeamScore:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * 81.17, _1080p * -207.56, _1080p * 77.5, _1080p * -8.5 )
	self:addElement( TeamScore )
	self.TeamScore = TeamScore
	
	self._animationSets.DefaultAnimationSet = function ()
		TeamScore:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.TeamScore:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * 81.17, _1080p * -207.56, _1080p * 77.5, _1080p * -8.5, 0 )
				end
			}
		} )
		self._sequences.DefaultSequence = function ()
			TeamScore:AnimateSequence( "DefaultSequence" )
		end
		
		teamcolor:RegisterAnimationSequence( "Selected", {
			{
				function ()
					return self.teamcolor:SetAlpha( 0.7, 0 )
				end,
				function ()
					return self.teamcolor:SetAlpha( 1, 200 )
				end
			}
		} )
		Select:RegisterAnimationSequence( "Selected", {
			{
				function ()
					return self.Select:SetAlpha( 0, 0 )
				end,
				function ()
					return self.Select:SetAlpha( 1, 150 )
				end
			}
		} )
		logo:RegisterAnimationSequence( "Selected", {
			{
				function ()
					return self.logo:SetScale( -0.1, 0 )
				end,
				function ()
					return self.logo:SetScale( 0.05, 150 )
				end,
				function ()
					return self.logo:SetScale( 0.02, 150 )
				end
			},
			{
				function ()
					return self.logo:SetRGBFromInt( 13421772, 0 )
				end,
				function ()
					return self.logo:SetRGBFromInt( 16777215, 200 )
				end
			}
		} )
		SelectionTeam:RegisterAnimationSequence( "Selected", {
			{
				function ()
					return self.SelectionTeam:SetAlpha( 0, 0 )
				end,
				function ()
					return self.SelectionTeam:SetAlpha( 1, 200 )
				end,
				function ()
					return self.SelectionTeam:SetAlpha( 0.8, 100 )
				end
			}
		} )
		Highlight:RegisterAnimationSequence( "Selected", {
			{
				function ()
					return self.Highlight:SetUMax( 0.82, 0 )
				end,
				function ()
					return self.Highlight:SetUMax( 0.38, 120 )
				end,
				function ()
					return self.Highlight:SetUMax( -0.22, 180 )
				end
			},
			{
				function ()
					return self.Highlight:SetUMin( -0.02, 0 )
				end,
				function ()
					return self.Highlight:SetUMin( -0.38, 120 )
				end,
				function ()
					return self.Highlight:SetUMin( -1.02, 180 )
				end
			},
			{
				function ()
					return self.Highlight:SetRGBFromInt( 0, 0 )
				end,
				function ()
					return self.Highlight:SetRGBFromInt( 16777215, 200 )
				end,
				function ()
					return self.Highlight:SetRGBFromInt( 0, 100 )
				end
			}
		} )
		self._sequences.Selected = function ()
			teamcolor:AnimateSequence( "Selected" )
			Select:AnimateSequence( "Selected" )
			logo:AnimateSequence( "Selected" )
			SelectionTeam:AnimateSequence( "Selected" )
			Highlight:AnimateSequence( "Selected" )
		end
		
		teamcolor:RegisterAnimationSequence( "DeSelected", {
			{
				function ()
					return self.teamcolor:SetAlpha( 1, 0 )
				end,
				function ()
					return self.teamcolor:SetAlpha( 0.7, 150 )
				end
			}
		} )
		Select:RegisterAnimationSequence( "DeSelected", {
			{
				function ()
					return self.Select:SetAlpha( 1, 0 )
				end,
				function ()
					return self.Select:SetAlpha( 0, 150 )
				end
			}
		} )
		logo:RegisterAnimationSequence( "DeSelected", {
			{
				function ()
					return self.logo:SetScale( 0, 0 )
				end,
				function ()
					return self.logo:SetScale( -0.1, 150 )
				end
			},
			{
				function ()
					return self.logo:SetRGBFromInt( 16777215, 0 )
				end,
				function ()
					return self.logo:SetRGBFromInt( 13421772, 150 )
				end
			}
		} )
		SelectionTeam:RegisterAnimationSequence( "DeSelected", {
			{
				function ()
					return self.SelectionTeam:SetAlpha( 1, 0 )
				end,
				function ()
					return self.SelectionTeam:SetAlpha( 0, 200 )
				end
			}
		} )
		Highlight:RegisterAnimationSequence( "DeSelected", {
			{
				function ()
					return self.Highlight:SetRGBFromInt( 0, 0 )
				end
			}
		} )
		self._sequences.DeSelected = function ()
			teamcolor:AnimateSequence( "DeSelected" )
			Select:AnimateSequence( "DeSelected" )
			logo:AnimateSequence( "DeSelected" )
			SelectionTeam:AnimateSequence( "DeSelected" )
			Highlight:AnimateSequence( "DeSelected" )
		end
		
		TeamScore:RegisterAnimationSequence( "ThreeDigitScore", {
			{
				function ()
					return self.TeamScore:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * 83.92, _1080p * -210.81, _1080p * 86.71, _1080p * -22.29, 0 )
				end
			}
		} )
		self._sequences.ThreeDigitScore = function ()
			TeamScore:AnimateSequence( "ThreeDigitScore" )
		end
		
		TeamScore:RegisterAnimationSequence( "FourDigitScore", {
			{
				function ()
					return self.TeamScore:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * 85.92, _1080p * -214.81, _1080p * 91.81, _1080p * -30.06, 0 )
				end
			}
		} )
		self._sequences.FourDigitScore = function ()
			TeamScore:AnimateSequence( "FourDigitScore" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	f0_local0( self, f2_local1, controller )
	ACTIONS.AnimateSequence( self, "DefaultSequence" )
	return self
end

MenuBuilder.registerType( "codcaster_ScoreLogoWidget", codcaster_ScoreLogoWidget )
LockTable( _M )
