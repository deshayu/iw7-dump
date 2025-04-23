local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function TrinityMissile( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 100 * _1080p, 0, 200 * _1080p )
	self.id = "TrinityMissile"
	self._animationSets = {}
	self._sequences = {}
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local Missile = nil
	
	Missile = LUI.UIImage.new()
	Missile.id = "Missile"
	Missile:setImage( RegisterMaterial( "hud_trinity_missile" ), 0 )
	Missile:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -10, _1080p * 10, _1080p * -19, _1080p * 17 )
	self:addElement( Missile )
	self.Missile = Missile
	
	local Border = nil
	
	Border = LUI.UIBorder.new( {
		borderThicknessLeft = _1080p * 1,
		borderThicknessRight = _1080p * 1,
		borderThicknessTop = _1080p * 1,
		borderThicknessBottom = _1080p * 1
	} )
	Border.id = "Border"
	Border:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -21, _1080p * 21, _1080p * -21, _1080p * 21 )
	self:addElement( Border )
	self.Border = Border
	
	local Fire = nil
	
	Fire = LUI.UIText.new()
	Fire.id = "Fire"
	Fire:setText( ToUpperCase( Engine.Localize( "HUD_FIRE" ) ), 0 )
	Fire:SetFontSize( 18 * _1080p )
	Fire:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	Fire:SetAlignment( LUI.Alignment.Center )
	Fire:SetAnchorsAndPosition( 0, 0, 0.5, 0.5, 0, 0, _1080p * 28, _1080p * 46 )
	self:addElement( Fire )
	self.Fire = Fire
	
	local MissileNum = nil
	
	MissileNum = LUI.UIText.new()
	MissileNum.id = "MissileNum"
	MissileNum:setText( "1", 0 )
	MissileNum:SetFontSize( 18 * _1080p )
	MissileNum:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	MissileNum:SetAlignment( LUI.Alignment.Center )
	MissileNum:SetAnchorsAndPosition( 0, 0, 0.5, 0.5, 0, 0, _1080p * -40, _1080p * -22 )
	self:addElement( MissileNum )
	self.MissileNum = MissileNum
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		Missile:RegisterAnimationSequence( "Empty", {
			{
				function ()
					return self.Missile:SetRGBFromTable( SWATCHES.HUD.warning, 0 )
				end
			}
		} )
		Border:RegisterAnimationSequence( "Empty", {
			{
				function ()
					return self.Border:SetRGBFromTable( SWATCHES.HUD.warning, 0 )
				end
			},
			{
				function ()
					return self.Border:SetAlpha( 1, 0 )
				end,
				function ()
					return self.Border:SetAlpha( 0, 50 )
				end,
				function ()
					return self.Border:SetAlpha( 1, 50 )
				end,
				function ()
					return self.Border:SetAlpha( 0, 50 )
				end,
				function ()
					return self.Border:SetAlpha( 1, 50 )
				end
			}
		} )
		Fire:RegisterAnimationSequence( "Empty", {
			{
				function ()
					return self.Fire:SetAlpha( 0, 0 )
				end
			}
		} )
		MissileNum:RegisterAnimationSequence( "Empty", {
			{
				function ()
					return self.MissileNum:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.Empty = function ()
			Missile:AnimateSequence( "Empty" )
			Border:AnimateSequence( "Empty" )
			Fire:AnimateSequence( "Empty" )
			MissileNum:AnimateSequence( "Empty" )
		end
		
		Missile:RegisterAnimationSequence( "Refill", {
			{
				function ()
					return self.Missile:SetRGBFromInt( 15613731, 0 )
				end,
				function ()
					return self.Missile:SetRGBFromInt( 16777215, 200 )
				end
			}
		} )
		Border:RegisterAnimationSequence( "Refill", {
			{
				function ()
					return self.Border:SetRGBFromInt( 15613731, 0 )
				end,
				function ()
					return self.Border:SetRGBFromInt( 16777215, 200 )
				end
			}
		} )
		Fire:RegisterAnimationSequence( "Refill", {
			{
				function ()
					return self.Fire:SetAlpha( 0, 0 )
				end,
				function ()
					return self.Fire:SetAlpha( 1, 200 )
				end
			},
			{
				function ()
					return self.Fire:SetRGBFromInt( 16777215, 200 )
				end
			}
		} )
		MissileNum:RegisterAnimationSequence( "Refill", {
			{
				function ()
					return self.MissileNum:SetAlpha( 0, 0 )
				end,
				function ()
					return self.MissileNum:SetAlpha( 1, 200 )
				end
			},
			{
				function ()
					return self.MissileNum:SetRGBFromInt( 16777215, 200 )
				end
			}
		} )
		self._sequences.Refill = function ()
			Missile:AnimateSequence( "Refill" )
			Border:AnimateSequence( "Refill" )
			Fire:AnimateSequence( "Refill" )
			MissileNum:AnimateSequence( "Refill" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	return self
end

MenuBuilder.registerType( "TrinityMissile", TrinityMissile )
LockTable( _M )
