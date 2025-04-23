local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function PostLoadFunc( f1_arg0, f1_arg1 )
	f1_arg0:SetupInWorldElement( {} )
	f1_arg0:SetInWorldScale( 0.3 )
	f1_arg0:SetWorldSpacePosition( -9374, -202, -1695 )
	f1_arg0:SetWorldSpaceYaw( -90 )
end

function afterlifeRacingScoreboard( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 491 * _1080p, 0, 160 * _1080p )
	self.id = "afterlifeRacingScoreboard"
	self._animationSets = {}
	self._sequences = {}
	local f2_local1 = controller and controller.controllerIndex
	if not f2_local1 and not Engine.InFrontend() then
		f2_local1 = self:getRootController()
	end
	assert( f2_local1 )
	local f2_local2 = self
	local Title = nil
	
	Title = LUI.UIText.new()
	Title.id = "Title"
	Title:SetRGBFromTable( SWATCHES.text.primaryText, 0 )
	Title:setText( "Race The Pace", 0 )
	Title:SetFontSize( 36 * _1080p )
	Title:SetFont( FONTS.GetFont( FONTS.MainExtended.File ) )
	Title:SetAlignment( LUI.Alignment.Center )
	Title:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 491, _1080p * 4.5, _1080p * 40.5 )
	self:addElement( Title )
	self.Title = Title
	
	local subtitle = nil
	
	subtitle = LUI.UIText.new()
	subtitle.id = "subtitle"
	subtitle:SetRGBFromTable( SWATCHES.text.secondaryText, 0 )
	subtitle:setText( "Beat the pace horse", 0 )
	subtitle:SetFontSize( 19 * _1080p )
	subtitle:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	subtitle:SetAlignment( LUI.Alignment.Center )
	subtitle:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 491, _1080p * 37, _1080p * 56 )
	self:addElement( subtitle )
	self.subtitle = subtitle
	
	local Label0 = nil
	
	Label0 = LUI.UIText.new()
	Label0.id = "Label0"
	Label0:setText( "Race Beginning in", 0 )
	Label0:SetFontSize( 19 * _1080p )
	Label0:SetFont( FONTS.GetFont( FONTS.MainExtended.File ) )
	Label0:SetAlignment( LUI.Alignment.Center )
	Label0:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 6.78, _1080p * 491, _1080p * 66, _1080p * 85 )
	Label0:BindAlphaToModel( DataSources.inGame.CP.zombies.afterlifeRacingCountdown:GetModel( f2_local1 ) )
	self:addElement( Label0 )
	self.Label0 = Label0
	
	local Label0Copy0 = nil
	
	Label0Copy0 = LUI.UIText.new()
	Label0Copy0.id = "Label0Copy0"
	Label0Copy0:SetRGBFromTable( SWATCHES.CAC.weaponMeterBetter, 0 )
	Label0Copy0:SetFontSize( 48 * _1080p )
	Label0Copy0:SetFont( FONTS.GetFont( FONTS.Digital.File ) )
	Label0Copy0:SetAlignment( LUI.Alignment.Center )
	Label0Copy0:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 3.39, _1080p * 487.61, _1080p * 95, _1080p * 143 )
	Label0Copy0:BindAlphaToModel( DataSources.inGame.CP.zombies.afterlifeRacingCountdown:GetModel( f2_local1 ) )
	Label0Copy0:SubscribeToModel( DataSources.inGame.CP.zombies.afterlifeRacingCountdown:GetModel( f2_local1 ), function ()
		local f3_local0 = DataSources.inGame.CP.zombies.afterlifeRacingCountdown:GetValue( f2_local1 )
		if f3_local0 ~= nil then
			Label0Copy0:setText( f3_local0, 0 )
		end
	end )
	self:addElement( Label0Copy0 )
	self.Label0Copy0 = Label0Copy0
	
	local Label0Copy1 = nil
	
	Label0Copy1 = LUI.UIText.new()
	Label0Copy1.id = "Label0Copy1"
	Label0Copy1:SetRGBFromTable( SWATCHES.CAC.weaponMeterBetter, 0 )
	Label0Copy1:setText( "GO!", 0 )
	Label0Copy1:SetFontSize( 48 * _1080p )
	Label0Copy1:SetFont( FONTS.GetFont( FONTS.MainExtended.File ) )
	Label0Copy1:SetAlignment( LUI.Alignment.Center )
	Label0Copy1:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 3.39, _1080p * 487.61, _1080p * 87, _1080p * 135 )
	self:addElement( Label0Copy1 )
	self.Label0Copy1 = Label0Copy1
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		Label0Copy1:RegisterAnimationSequence( "showGo", {
			{
				function ()
					return self.Label0Copy1:SetAlpha( 1, 0 )
				end,
				function ()
					return self.Label0Copy1:SetAlpha( 1, 1000 )
				end,
				function ()
					return self.Label0Copy1:SetAlpha( 0, 20 )
				end
			}
		} )
		self._sequences.showGo = function ()
			Label0Copy1:AnimateSequence( "showGo" )
		end
		
		Label0Copy1:RegisterAnimationSequence( "hideGo", {
			{
				function ()
					return self.Label0Copy1:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.hideGo = function ()
			Label0Copy1:AnimateSequence( "hideGo" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	self:SubscribeToModel( DataSources.inGame.CP.zombies.afterlifeRacingCountdown:GetModel( f2_local1 ), function ()
		if DataSources.inGame.CP.zombies.afterlifeRacingCountdown:GetValue( f2_local1 ) ~= nil and DataSources.inGame.CP.zombies.afterlifeRacingCountdown:GetValue( f2_local1 ) == -1 then
			ACTIONS.AnimateSequence( self, "showGo" )
		end
		if DataSources.inGame.CP.zombies.afterlifeRacingCountdown:GetValue( f2_local1 ) ~= nil and DataSources.inGame.CP.zombies.afterlifeRacingCountdown:GetValue( f2_local1 ) >= 0 then
			ACTIONS.AnimateSequence( self, "hideGo" )
		end
	end )
	PostLoadFunc( self, f2_local1, controller )
	return self
end

MenuBuilder.registerType( "afterlifeRacingScoreboard", afterlifeRacingScoreboard )
LockTable( _M )
