local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function JackalBarrelTempBar( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 350 * _1080p, 0, 20 * _1080p )
	self.id = "JackalBarrelTempBar"
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
	Background:SetRGBFromTable( SWATCHES.jackal.boosterBackground, 0 )
	Background:SetAlpha( 0.3, 0 )
	Background:SetUseAA( true )
	Background:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * -2, _1080p * 2, _1080p * -2, _1080p * 2 )
	self:addElement( Background )
	self.Background = Background
	
	local FillBackground = nil
	
	FillBackground = LUI.UIImage.new()
	FillBackground.id = "FillBackground"
	FillBackground:SetRGBFromTable( SWATCHES.jackal.stable, 0 )
	FillBackground:SetAlpha( 0.2, 0 )
	FillBackground:SetUseAA( true )
	FillBackground:SetAnchorsAndPosition( 0, 0, 0.5, 0.5, _1080p * 5, _1080p * -5, _1080p * -5, _1080p * 5 )
	self:addElement( FillBackground )
	self.FillBackground = FillBackground
	
	local Fill = nil
	
	Fill = LUI.UIImage.new()
	Fill.id = "Fill"
	Fill:SetRGBFromTable( SWATCHES.jackal.stableAlt, 0 )
	Fill:SetUseAA( true )
	Fill:SetAnchorsAndPosition( 0, 0, 0.5, 0.5, _1080p * 5, _1080p * -175, _1080p * -5, _1080p * 5 )
	self:addElement( Fill )
	self.Fill = Fill
	
	local FrameBottom = nil
	
	FrameBottom = LUI.UIImage.new()
	FrameBottom.id = "FrameBottom"
	FrameBottom:SetRGBFromTable( SWATCHES.jackal.stable, 0 )
	FrameBottom:SetAlpha( 0.5, 0 )
	FrameBottom:SetZRotation( 180, 0 )
	FrameBottom:setImage( RegisterMaterial( "hud_jackal_overheat_frame" ), 0 )
	FrameBottom:SetUseAA( true )
	FrameBottom:SetAnchorsAndPosition( 0, 0, 1, 0, 0, 0, _1080p * -8, 0 )
	self:addElement( FrameBottom )
	self.FrameBottom = FrameBottom
	
	local FrameTop = nil
	
	FrameTop = LUI.UIImage.new()
	FrameTop.id = "FrameTop"
	FrameTop:SetRGBFromTable( SWATCHES.jackal.stable, 0 )
	FrameTop:SetAlpha( 0.5, 0 )
	FrameTop:setImage( RegisterMaterial( "hud_jackal_overheat_frame" ), 0 )
	FrameTop:SetUseAA( true )
	FrameTop:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, 0, _1080p * 8 )
	self:addElement( FrameTop )
	self.FrameTop = FrameTop
	
	local WeaponName = nil
	
	WeaponName = LUI.UIText.new()
	WeaponName.id = "WeaponName"
	WeaponName:SetRGBFromTable( SWATCHES.jackal.stable, 0 )
	WeaponName:setText( "WEAPON", 0 )
	WeaponName:SetFontSize( 16 * _1080p )
	WeaponName:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	WeaponName:SetAlignment( LUI.Alignment.Left )
	WeaponName:SetOptOutRightToLeftAlignmentFlip( true )
	WeaponName:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, _1080p * -18, _1080p * -2 )
	self:addElement( WeaponName )
	self.WeaponName = WeaponName
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		FillBackground:RegisterAnimationSequence( "cool", {
			{
				function ()
					return self.FillBackground:SetRGBFromTable( SWATCHES.jackal.stable, 0 )
				end
			}
		} )
		Fill:RegisterAnimationSequence( "cool", {
			{
				function ()
					return self.Fill:SetRGBFromTable( SWATCHES.jackal.stableAlt, 0 )
				end
			},
			{
				function ()
					return self.Fill:SetAlpha( 1, 0 )
				end
			}
		} )
		FrameBottom:RegisterAnimationSequence( "cool", {
			{
				function ()
					return self.FrameBottom:SetRGBFromTable( SWATCHES.jackal.stable, 0 )
				end
			}
		} )
		FrameTop:RegisterAnimationSequence( "cool", {
			{
				function ()
					return self.FrameTop:SetRGBFromTable( SWATCHES.jackal.stable, 0 )
				end
			}
		} )
		WeaponName:RegisterAnimationSequence( "cool", {
			{
				function ()
					return self.WeaponName:SetRGBFromTable( SWATCHES.jackal.stable, 0 )
				end
			},
			{
				function ()
					return self.WeaponName:SetAlpha( 1, 0 )
				end
			}
		} )
		self._sequences.cool = function ()
			FillBackground:AnimateSequence( "cool" )
			Fill:AnimateSequence( "cool" )
			FrameBottom:AnimateSequence( "cool" )
			FrameTop:AnimateSequence( "cool" )
			WeaponName:AnimateSequence( "cool" )
		end
		
		FillBackground:RegisterAnimationSequence( "warning", {
			{
				function ()
					return self.FillBackground:SetRGBFromTable( SWATCHES.jackal.stable, 0 )
				end
			}
		} )
		Fill:RegisterAnimationSequence( "warning", {
			{
				function ()
					return self.Fill:SetRGBFromTable( SWATCHES.jackal.warning, 0 )
				end
			},
			{
				function ()
					return self.Fill:SetAlpha( 1, 0 )
				end,
				function ()
					return self.Fill:SetAlpha( 0.5, 100 )
				end,
				function ()
					return self.Fill:SetAlpha( 1, 100 )
				end
			}
		} )
		FrameBottom:RegisterAnimationSequence( "warning", {
			{
				function ()
					return self.FrameBottom:SetRGBFromTable( SWATCHES.jackal.stable, 0 )
				end
			}
		} )
		FrameTop:RegisterAnimationSequence( "warning", {
			{
				function ()
					return self.FrameTop:SetRGBFromTable( SWATCHES.jackal.stable, 0 )
				end
			}
		} )
		WeaponName:RegisterAnimationSequence( "warning", {
			{
				function ()
					return self.WeaponName:SetRGBFromTable( SWATCHES.jackal.stable, 0 )
				end
			},
			{
				function ()
					return self.WeaponName:SetAlpha( 1, 0 )
				end
			}
		} )
		self._sequences.warning = function ()
			FillBackground:AnimateLoop( "warning" )
			Fill:AnimateLoop( "warning" )
			FrameBottom:AnimateLoop( "warning" )
			FrameTop:AnimateLoop( "warning" )
			WeaponName:AnimateLoop( "warning" )
		end
		
		FillBackground:RegisterAnimationSequence( "overheat", {
			{
				function ()
					return self.FillBackground:SetRGBFromTable( SWATCHES.jackal.warning, 0 )
				end
			}
		} )
		Fill:RegisterAnimationSequence( "overheat", {
			{
				function ()
					return self.Fill:SetAlpha( 0, 0 )
				end,
				function ()
					return self.Fill:SetAlpha( 1, 50 )
				end,
				function ()
					return self.Fill:SetAlpha( 0.65, 50 )
				end
			},
			{
				function ()
					return self.Fill:SetRGBFromTable( SWATCHES.jackal.warning, 0 )
				end
			}
		} )
		FrameBottom:RegisterAnimationSequence( "overheat", {
			{
				function ()
					return self.FrameBottom:SetRGBFromTable( SWATCHES.jackal.warning, 0 )
				end
			}
		} )
		FrameTop:RegisterAnimationSequence( "overheat", {
			{
				function ()
					return self.FrameTop:SetRGBFromTable( SWATCHES.jackal.warning, 0 )
				end
			}
		} )
		WeaponName:RegisterAnimationSequence( "overheat", {
			{
				function ()
					return self.WeaponName:SetRGBFromTable( SWATCHES.jackal.warning, 0 )
				end
			},
			{
				function ()
					return self.WeaponName:SetAlpha( 0, 0 )
				end,
				function ()
					return self.WeaponName:SetAlpha( 1, 50 )
				end,
				function ()
					return self.WeaponName:SetAlpha( 0, 50 )
				end
			}
		} )
		self._sequences.overheat = function ()
			FillBackground:AnimateLoop( "overheat" )
			Fill:AnimateLoop( "overheat" )
			FrameBottom:AnimateLoop( "overheat" )
			FrameTop:AnimateLoop( "overheat" )
			WeaponName:AnimateLoop( "overheat" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	return self
end

MenuBuilder.registerType( "JackalBarrelTempBar", JackalBarrelTempBar )
LockTable( _M )
