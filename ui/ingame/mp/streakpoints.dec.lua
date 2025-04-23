local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function StreakPoints( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 64 * _1080p, 0, 32 * _1080p )
	self.id = "StreakPoints"
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
	Background:setImage( RegisterMaterial( "hud_scorestreak_points_bg" ), 0 )
	Background:SetUseAA( true )
	Background:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, _1080p * -2, _1080p * 34 )
	self:addElement( Background )
	self.Background = Background
	
	local RemainingPoints = nil
	
	RemainingPoints = LUI.UIText.new()
	RemainingPoints.id = "RemainingPoints"
	RemainingPoints:SetFontSize( 22 * _1080p )
	RemainingPoints:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	RemainingPoints:SetAlignment( LUI.Alignment.Center )
	RemainingPoints:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 2, _1080p * -7, _1080p * 5, _1080p * 27 )
	RemainingPoints:SubscribeToModelThroughElement( self, "remainingPoints", function ()
		local f2_local0 = self:GetDataSource()
		f2_local0 = f2_local0.remainingPoints:GetValue( f1_local1 )
		if f2_local0 ~= nil then
			RemainingPoints:setText( f2_local0, 0 )
		end
	end )
	self:addElement( RemainingPoints )
	self.RemainingPoints = RemainingPoints
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		Background:RegisterAnimationSequence( "ShowScore", {
			{
				function ()
					return self.Background:SetAlpha( 1, 0 )
				end
			}
		} )
		RemainingPoints:RegisterAnimationSequence( "ShowScore", {
			{
				function ()
					return self.RemainingPoints:SetAlpha( 1, 0 )
				end
			}
		} )
		self._sequences.ShowScore = function ()
			Background:AnimateSequence( "ShowScore" )
			RemainingPoints:AnimateSequence( "ShowScore" )
		end
		
		Background:RegisterAnimationSequence( "HideScore", {
			{
				function ()
					return self.Background:SetAlpha( 0, 0 )
				end
			}
		} )
		RemainingPoints:RegisterAnimationSequence( "HideScore", {
			{
				function ()
					return self.RemainingPoints:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.HideScore = function ()
			Background:AnimateSequence( "HideScore" )
			RemainingPoints:AnimateSequence( "HideScore" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	self:SubscribeToModelThroughElement( self, "remainingPoints", function ()
		local f11_local0 = self:GetDataSource()
		if f11_local0.remainingPoints:GetValue( f1_local1 ) ~= nil then
			f11_local0 = self:GetDataSource()
			if f11_local0.remainingPoints:GetValue( f1_local1 ) > 0 then
				ACTIONS.AnimateSequence( self, "ShowScore" )
			end
		end
		f11_local0 = self:GetDataSource()
		if f11_local0.remainingPoints:GetValue( f1_local1 ) ~= nil then
			f11_local0 = self:GetDataSource()
			if f11_local0.remainingPoints:GetValue( f1_local1 ) == 0 then
				ACTIONS.AnimateSequence( self, "HideScore" )
			end
		end
	end )
	return self
end

MenuBuilder.registerType( "StreakPoints", StreakPoints )
LockTable( _M )
