local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function comboSplashes( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 562 * _1080p, 0, 267 * _1080p )
	self.id = "comboSplashes"
	self._animationSets = {}
	self._sequences = {}
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local comboSplashText = nil
	
	comboSplashText = LUI.UIStyledText.new()
	comboSplashText.id = "comboSplashText"
	comboSplashText:SetRGBFromInt( 15667172, 0 )
	comboSplashText:SetZRotation( 23, 0 )
	comboSplashText:SetFontSize( 45 * _1080p )
	comboSplashText:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	comboSplashText:SetAlignment( LUI.Alignment.Left )
	comboSplashText:SetDecodeLetterLength( 100 )
	comboSplashText:SetDecodeMaxRandChars( 4 )
	comboSplashText:SetDecodeUpdatesPerLetter( 4 )
	comboSplashText:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 123.82, _1080p * 623.82, _1080p * 43, _1080p * 86 )
	comboSplashText:SubscribeToModel( DataSources.inGame.CP.zombies.escape.comboSplashText:GetModel( f1_local1 ), function ()
		local f2_local0 = DataSources.inGame.CP.zombies.escape.comboSplashText:GetValue( f1_local1 )
		if f2_local0 ~= nil then
			comboSplashText:setText( f2_local0, 0 )
		end
	end )
	self:addElement( comboSplashText )
	self.comboSplashText = comboSplashText
	
	self._animationSets.DefaultAnimationSet = function ()
		comboSplashText:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.comboSplashText:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.DefaultSequence = function ()
			comboSplashText:AnimateSequence( "DefaultSequence" )
		end
		
		comboSplashText:RegisterAnimationSequence( "splashVisible", {
			{
				function ()
					return self.comboSplashText:SetAlpha( 0, 0 )
				end,
				function ()
					return self.comboSplashText:SetAlpha( 1, 400 )
				end,
				function ()
					return self.comboSplashText:SetAlpha( 1, 1470 )
				end,
				function ()
					return self.comboSplashText:SetAlpha( 0, 190 )
				end
			},
			{
				function ()
					return self.comboSplashText:SetZRotation( 0, 240 )
				end,
				function ()
					return self.comboSplashText:SetZRotation( 23, 240 )
				end
			},
			{
				function ()
					return self.comboSplashText:SetScale( -0.5, 250 )
				end,
				function ()
					return self.comboSplashText:SetScale( 1, 280 )
				end,
				function ()
					return self.comboSplashText:SetScale( 0, 210 )
				end
			}
		} )
		self._sequences.splashVisible = function ()
			comboSplashText:AnimateSequence( "splashVisible" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	self:SubscribeToModel( DataSources.inGame.CP.zombies.escape.comboSplash:GetModel( f1_local1 ), function ()
		if DataSources.inGame.CP.zombies.escape.comboSplash:GetValue( f1_local1 ) ~= nil and DataSources.inGame.CP.zombies.escape.comboSplash:GetValue( f1_local1 ) > 0 then
			ACTIONS.AnimateSequence( self, "splashVisible" )
		end
	end )
	ACTIONS.AnimateSequence( self, "DefaultSequence" )
	return self
end

MenuBuilder.registerType( "comboSplashes", comboSplashes )
LockTable( _M )
