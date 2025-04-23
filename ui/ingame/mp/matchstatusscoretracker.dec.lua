local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function MatchStatusScoreTracker( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 60 * _1080p, 0, 34 * _1080p )
	self.id = "MatchStatusScoreTracker"
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
	Background:SetAlpha( 0.15, 0 )
	Background:setImage( RegisterMaterial( "ui_default_white" ), 0 )
	self:addElement( Background )
	self.Background = Background
	
	local TeamScoreOutline = nil
	
	TeamScoreOutline = LUI.UIBorder.new( {
		borderThicknessLeft = _1080p * 1,
		borderThicknessRight = _1080p * 1,
		borderThicknessTop = _1080p * 1,
		borderThicknessBottom = _1080p * 1
	} )
	TeamScoreOutline.id = "TeamScoreOutline"
	TeamScoreOutline:SetRGBFromTable( SWATCHES.HUD.normal, 0 )
	self:addElement( TeamScoreOutline )
	self.TeamScoreOutline = TeamScoreOutline
	
	local TeamScore = nil
	
	TeamScore = LUI.UIText.new()
	TeamScore.id = "TeamScore"
	TeamScore:setText( Engine.Localize( "MENU_NEW" ), 0 )
	TeamScore:SetFontSize( 30 * _1080p )
	TeamScore:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	TeamScore:SetAlignment( LUI.Alignment.Left )
	TeamScore:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * 5, _1080p * -5, _1080p * 2, _1080p * -2 )
	self:addElement( TeamScore )
	self.TeamScore = TeamScore
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		TeamScore:RegisterAnimationSequence( "Winning", {
			{
				function ()
					return self.TeamScore:SetAlpha( 1, 0 )
				end
			}
		} )
		self._sequences.Winning = function ()
			TeamScore:AnimateSequence( "Winning" )
		end
		
		TeamScore:RegisterAnimationSequence( "Losing", {
			{
				function ()
					return self.TeamScore:SetAlpha( 0.5, 0 )
				end
			}
		} )
		self._sequences.Losing = function ()
			TeamScore:AnimateSequence( "Losing" )
		end
		
		TeamScore:RegisterAnimationSequence( "UpdateText", {
			{
				function ()
					return self.TeamScore:SetScale( 0.5, 0 )
				end,
				function ()
					return self.TeamScore:SetScale( 0, 100 )
				end
			}
		} )
		self._sequences.UpdateText = function ()
			TeamScore:AnimateSequence( "UpdateText" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	self:addEventHandler( "menu_create", function ( f11_arg0, f11_arg1 )
		local f11_local0 = f11_arg1.controller or f1_local1
		if CONDITIONS.InGame( self ) then
			ACTIONS.SetAnimationSet( self, "DefaultAnimationSet" )
		end
	end )
	return self
end

MenuBuilder.registerType( "MatchStatusScoreTracker", MatchStatusScoreTracker )
LockTable( _M )
