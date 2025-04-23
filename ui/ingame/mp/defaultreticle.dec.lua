local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function DefaultReticle( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 128 * _1080p, 0, 128 * _1080p )
	self.id = "DefaultReticle"
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
	Background:SetAlpha( 0.4, 0 )
	self:addElement( Background )
	self.Background = Background
	
	local CenterPoint = nil
	
	CenterPoint = LUI.UIImage.new()
	CenterPoint.id = "CenterPoint"
	CenterPoint:SetRGBFromInt( 16711680, 0 )
	CenterPoint:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -2, _1080p * 2, _1080p * -2, _1080p * 2 )
	self:addElement( CenterPoint )
	self.CenterPoint = CenterPoint
	
	local HitText = nil
	
	HitText = LUI.UIText.new()
	HitText.id = "HitText"
	HitText:SetAlpha( 0, 0 )
	HitText:setText( Engine.Localize( "LUA_MENU_HITS_CAPS" ), 0 )
	HitText:SetFontSize( 16 * _1080p )
	HitText:SetFont( FONTS.GetFont( FONTS.Digital.File ) )
	HitText:SetAlignment( LUI.Alignment.Center )
	HitText:SetAnchorsAndPosition( 0, 0, 1, 0, 0, 0, _1080p * -86, _1080p * -70 )
	self:addElement( HitText )
	self.HitText = HitText
	
	local foo = nil
	
	foo = LUI.UIImage.new()
	foo.id = "foo"
	foo:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 12.2, _1080p * 32.2, _1080p * 9.56, _1080p * 30 )
	self:addElement( foo )
	self.foo = foo
	
	local bar = nil
	
	bar = LUI.UIImage.new()
	bar.id = "bar"
	bar:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 92.12, _1080p * 114.12, _1080p * 9.56, _1080p * 30.56 )
	bar:BindAlphaToModel( DataSources.inGame.player.currentWeapon.adsPercent:GetModel( f1_local1 ) )
	self:addElement( bar )
	self.bar = bar
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		HitText:RegisterAnimationSequence( "Hit", {
			{
				function ()
					return self.HitText:SetAlpha( 0, 0 )
				end,
				function ()
					return self.HitText:SetAlpha( 1, 280 )
				end,
				function ()
					return self.HitText:SetAlpha( 0, 230 )
				end
			}
		} )
		self._sequences.Hit = function ()
			HitText:AnimateSequence( "Hit" )
			bar:AnimateSequence( "Hit" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	local f1_local8 = function ()
		if DataSources.inGame.HUD.hitMarker.type:GetValue( f1_local1 ) ~= nil and DataSources.inGame.HUD.hitMarker.type:GetValue( f1_local1 ) ~= "None" then
			ACTIONS.AnimateSequence( self, "Hit" )
		end
	end
	
	self:SubscribeToModel( DataSources.inGame.HUD.hitMarker.type:GetModel( f1_local1 ), f1_local8 )
	self:SubscribeToModel( DataSources.inGame.HUD.hitMarker.typeNotify:GetModel( f1_local1 ), f1_local8 )
	return self
end

MenuBuilder.registerType( "DefaultReticle", DefaultReticle )
LockTable( _M )
