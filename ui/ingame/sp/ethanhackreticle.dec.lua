local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function EthanHackReticle( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 1080 * _1080p, 0, 800 * _1080p )
	self.id = "EthanHackReticle"
	self._animationSets = {}
	self._sequences = {}
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local InnerCircle = nil
	
	InnerCircle = LUI.UIImage.new()
	InnerCircle.id = "InnerCircle"
	InnerCircle:setImage( RegisterMaterial( "hud_ethan_reticle_inner_circ_dots" ), 0 )
	InnerCircle:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -100, _1080p * 100, _1080p * -100, _1080p * 100 )
	self:addElement( InnerCircle )
	self.InnerCircle = InnerCircle
	
	local HexTR = nil
	
	HexTR = LUI.UIImage.new()
	HexTR.id = "HexTR"
	HexTR:setImage( RegisterMaterial( "hud_ethan_reticle_hex_corner" ), 0 )
	HexTR:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, 0, _1080p * 380, _1080p * -380, 0 )
	self:addElement( HexTR )
	self.HexTR = HexTR
	
	local HexBR = nil
	
	HexBR = LUI.UIImage.new()
	HexBR.id = "HexBR"
	HexBR:setImage( RegisterMaterial( "hud_ethan_reticle_hex_corner" ), 0 )
	HexBR:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, 0, _1080p * 380, _1080p * 380, 0 )
	self:addElement( HexBR )
	self.HexBR = HexBR
	
	local HexBL = nil
	
	HexBL = LUI.UIImage.new()
	HexBL.id = "HexBL"
	HexBL:setImage( RegisterMaterial( "hud_ethan_reticle_hex_corner" ), 0 )
	HexBL:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, 0, _1080p * -380, _1080p * 380, 0 )
	self:addElement( HexBL )
	self.HexBL = HexBL
	
	local HexTL = nil
	
	HexTL = LUI.UIImage.new()
	HexTL.id = "HexTL"
	HexTL:setImage( RegisterMaterial( "hud_ethan_reticle_hex_corner" ), 0 )
	HexTL:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, 0, _1080p * -380, _1080p * -380, 0 )
	self:addElement( HexTL )
	self.HexTL = HexTL
	
	local DiagTR = nil
	
	DiagTR = LUI.UIImage.new()
	DiagTR.id = "DiagTR"
	DiagTR:setImage( RegisterMaterial( "hud_ethan_reticle_diag_segment" ), 0 )
	DiagTR:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 153, _1080p * 361, _1080p * -214, _1080p * -86 )
	self:addElement( DiagTR )
	self.DiagTR = DiagTR
	
	local DiagBR = nil
	
	DiagBR = LUI.UIImage.new()
	DiagBR.id = "DiagBR"
	DiagBR:setImage( RegisterMaterial( "hud_ethan_reticle_diag_segment" ), 0 )
	DiagBR:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 153, _1080p * 361, _1080p * 214, _1080p * 86 )
	self:addElement( DiagBR )
	self.DiagBR = DiagBR
	
	local DiagBL = nil
	
	DiagBL = LUI.UIImage.new()
	DiagBL.id = "DiagBL"
	DiagBL:setImage( RegisterMaterial( "hud_ethan_reticle_diag_segment" ), 0 )
	DiagBL:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -153, _1080p * -361, _1080p * 214, _1080p * 86 )
	self:addElement( DiagBL )
	self.DiagBL = DiagBL
	
	local DiagTL = nil
	
	DiagTL = LUI.UIImage.new()
	DiagTL.id = "DiagTL"
	DiagTL:setImage( RegisterMaterial( "hud_ethan_reticle_diag_segment" ), 0 )
	DiagTL:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -153, _1080p * -361, _1080p * -214, _1080p * -86 )
	self:addElement( DiagTL )
	self.DiagTL = DiagTL
	
	local ArcTR = nil
	
	ArcTR = LUI.UIImage.new()
	ArcTR.id = "ArcTR"
	ArcTR:setImage( RegisterMaterial( "hud_ethan_reticle_arc_segment" ), 0 )
	ArcTR:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 406, _1080p * 534, _1080p * -314, _1080p * -58 )
	self:addElement( ArcTR )
	self.ArcTR = ArcTR
	
	local ArcTL = nil
	
	ArcTL = LUI.UIImage.new()
	ArcTL.id = "ArcTL"
	ArcTL:setImage( RegisterMaterial( "hud_ethan_reticle_arc_segment" ), 0 )
	ArcTL:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -406, _1080p * -534, _1080p * -314, _1080p * -58 )
	self:addElement( ArcTL )
	self.ArcTL = ArcTL
	
	local ArcBR = nil
	
	ArcBR = LUI.UIImage.new()
	ArcBR.id = "ArcBR"
	ArcBR:setImage( RegisterMaterial( "hud_ethan_reticle_arc_segment" ), 0 )
	ArcBR:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 406, _1080p * 534, _1080p * 314, _1080p * 58 )
	self:addElement( ArcBR )
	self.ArcBR = ArcBR
	
	local ArcBL = nil
	
	ArcBL = LUI.UIImage.new()
	ArcBL.id = "ArcBL"
	ArcBL:setImage( RegisterMaterial( "hud_ethan_reticle_arc_segment" ), 0 )
	ArcBL:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -406, _1080p * -534, _1080p * 314, _1080p * 58 )
	self:addElement( ArcBL )
	self.ArcBL = ArcBL
	
	local Border = nil
	
	Border = LUI.UIBorder.new( {
		borderThicknessLeft = _1080p * 2,
		borderThicknessRight = _1080p * 2,
		borderThicknessTop = _1080p * 2,
		borderThicknessBottom = _1080p * 2
	} )
	Border.id = "Border"
	Border:SetBorderThicknessLeft( _1080p * 2, 0 )
	Border:SetBorderThicknessRight( _1080p * 2, 0 )
	Border:SetBorderThicknessTop( _1080p * 2, 0 )
	Border:SetBorderThicknessBottom( _1080p * 2, 0 )
	Border:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -100, _1080p * 100, _1080p * 170, _1080p * 190 )
	self:addElement( Border )
	self.Border = Border
	
	local TrackingText = nil
	
	TrackingText = LUI.UIText.new()
	TrackingText.id = "TrackingText"
	TrackingText:setText( Engine.Localize( "HUD_TRACKING_VISION" ), 0 )
	TrackingText:SetFontSize( 16 * _1080p )
	TrackingText:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	TrackingText:SetAlignment( LUI.Alignment.Center )
	TrackingText:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -96, _1080p * 96, _1080p * 172, _1080p * 188 )
	self:addElement( TrackingText )
	self.TrackingText = TrackingText
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		InnerCircle:RegisterAnimationSequence( "BootUp", {
			{
				function ()
					return self.InnerCircle:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -342, _1080p * 342, _1080p * -342, _1080p * 342, 0 )
				end,
				function ()
					return self.InnerCircle:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -100, _1080p * 100, _1080p * -100, _1080p * 100, 500, LUI.EASING.inOutQuadratic )
				end
			}
		} )
		HexTR:RegisterAnimationSequence( "BootUp", {
			{
				function ()
					return self.HexTR:SetAlpha( 0, 0 )
				end,
				function ()
					return self.HexTR:SetAlpha( 1, 500, LUI.EASING.inOutQuadratic )
				end
			},
			{
				function ()
					return self.HexTR:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, 0, _1080p * 190, _1080p * -190, 0, 0 )
				end,
				function ()
					return self.HexTR:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, 0, _1080p * 380, _1080p * -380, 0, 500, LUI.EASING.inOutQuadratic )
				end
			}
		} )
		HexBR:RegisterAnimationSequence( "BootUp", {
			{
				function ()
					return self.HexBR:SetAlpha( 0, 0 )
				end,
				function ()
					return self.HexBR:SetAlpha( 1, 500, LUI.EASING.inOutQuadratic )
				end
			},
			{
				function ()
					return self.HexBR:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, 0, _1080p * 190, _1080p * 190, 0, 0 )
				end,
				function ()
					return self.HexBR:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, 0, _1080p * 380, _1080p * 380, 0, 500, LUI.EASING.inOutQuadratic )
				end
			}
		} )
		HexBL:RegisterAnimationSequence( "BootUp", {
			{
				function ()
					return self.HexBL:SetAlpha( 0, 0 )
				end,
				function ()
					return self.HexBL:SetAlpha( 1, 500, LUI.EASING.inOutQuadratic )
				end
			},
			{
				function ()
					return self.HexBL:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, 0, _1080p * -190, _1080p * 190, 0, 0 )
				end,
				function ()
					return self.HexBL:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, 0, _1080p * -380, _1080p * 380, 0, 500, LUI.EASING.inOutQuadratic )
				end
			}
		} )
		HexTL:RegisterAnimationSequence( "BootUp", {
			{
				function ()
					return self.HexTL:SetAlpha( 0, 0 )
				end,
				function ()
					return self.HexTL:SetAlpha( 1, 500, LUI.EASING.inOutQuadratic )
				end
			},
			{
				function ()
					return self.HexTL:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, 0, _1080p * -190, _1080p * -190, 0, 0 )
				end,
				function ()
					return self.HexTL:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, 0, _1080p * -380, _1080p * -380, 0, 500, LUI.EASING.inOutQuadratic )
				end
			}
		} )
		DiagTR:RegisterAnimationSequence( "BootUp", {
			{
				function ()
					return self.DiagTR:SetAlpha( 0, 0 )
				end,
				function ()
					return self.DiagTR:SetAlpha( 0, 500 )
				end,
				function ()
					return self.DiagTR:SetAlpha( 1, 500, LUI.EASING.outBack )
				end
			},
			{
				function ()
					return self.DiagTR:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 278, _1080p * 486, _1080p * -284, _1080p * -156, 0 )
				end,
				function ()
					return self.DiagTR:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 278, _1080p * 486, _1080p * -284, _1080p * -156, 500 )
				end,
				function ()
					return self.DiagTR:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 153, _1080p * 361, _1080p * -214, _1080p * -86, 500, LUI.EASING.outBack )
				end
			}
		} )
		DiagBR:RegisterAnimationSequence( "BootUp", {
			{
				function ()
					return self.DiagBR:SetAlpha( 0, 0 )
				end,
				function ()
					return self.DiagBR:SetAlpha( 0, 500 )
				end,
				function ()
					return self.DiagBR:SetAlpha( 1, 500, LUI.EASING.outBack )
				end
			},
			{
				function ()
					return self.DiagBR:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 278, _1080p * 486, _1080p * 284, _1080p * 156, 0 )
				end,
				function ()
					return self.DiagBR:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 278, _1080p * 486, _1080p * 284, _1080p * 156, 500 )
				end,
				function ()
					return self.DiagBR:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 153, _1080p * 361, _1080p * 214, _1080p * 86, 500, LUI.EASING.outBack )
				end
			}
		} )
		DiagBL:RegisterAnimationSequence( "BootUp", {
			{
				function ()
					return self.DiagBL:SetAlpha( 0, 0 )
				end,
				function ()
					return self.DiagBL:SetAlpha( 0, 500 )
				end,
				function ()
					return self.DiagBL:SetAlpha( 1, 500, LUI.EASING.outBack )
				end
			},
			{
				function ()
					return self.DiagBL:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -278, _1080p * -486, _1080p * 284, _1080p * 156, 0 )
				end,
				function ()
					return self.DiagBL:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -278, _1080p * -486, _1080p * 284, _1080p * 156, 500 )
				end,
				function ()
					return self.DiagBL:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -153, _1080p * -361, _1080p * 214, _1080p * 86, 500, LUI.EASING.outBack )
				end
			}
		} )
		DiagTL:RegisterAnimationSequence( "BootUp", {
			{
				function ()
					return self.DiagTL:SetAlpha( 0, 0 )
				end,
				function ()
					return self.DiagTL:SetAlpha( 0, 500 )
				end,
				function ()
					return self.DiagTL:SetAlpha( 1, 500, LUI.EASING.outBack )
				end
			},
			{
				function ()
					return self.DiagTL:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -278, _1080p * -486, _1080p * -284, _1080p * -156, 0 )
				end,
				function ()
					return self.DiagTL:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -278, _1080p * -486, _1080p * -284, _1080p * -156, 500 )
				end,
				function ()
					return self.DiagTL:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -153, _1080p * -361, _1080p * -214, _1080p * -86, 500, LUI.EASING.outBack )
				end
			}
		} )
		ArcTR:RegisterAnimationSequence( "BootUp", {
			{
				function ()
					return self.ArcTR:SetAlpha( 0, 0 )
				end,
				function ()
					return self.ArcTR:SetAlpha( 0, 500 )
				end,
				function ()
					return self.ArcTR:SetAlpha( 1, 500, LUI.EASING.outQuadratic )
				end
			},
			{
				function ()
					return self.ArcTR:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 506, _1080p * 634, _1080p * -364, _1080p * -108, 0 )
				end,
				function ()
					return self.ArcTR:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 506, _1080p * 634, _1080p * -364, _1080p * -108, 500 )
				end,
				function ()
					return self.ArcTR:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 406, _1080p * 534, _1080p * -314, _1080p * -58, 500, LUI.EASING.outQuadratic )
				end
			}
		} )
		ArcTL:RegisterAnimationSequence( "BootUp", {
			{
				function ()
					return self.ArcTL:SetAlpha( 0, 0 )
				end,
				function ()
					return self.ArcTL:SetAlpha( 0, 500 )
				end,
				function ()
					return self.ArcTL:SetAlpha( 1, 500, LUI.EASING.outQuadratic )
				end
			},
			{
				function ()
					return self.ArcTL:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -506, _1080p * -634, _1080p * -364, _1080p * -108, 0 )
				end,
				function ()
					return self.ArcTL:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -506, _1080p * -634, _1080p * -364, _1080p * -108, 500 )
				end,
				function ()
					return self.ArcTL:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -406, _1080p * -534, _1080p * -314, _1080p * -58, 500, LUI.EASING.outQuadratic )
				end
			}
		} )
		ArcBR:RegisterAnimationSequence( "BootUp", {
			{
				function ()
					return self.ArcBR:SetAlpha( 0, 0 )
				end,
				function ()
					return self.ArcBR:SetAlpha( 0, 500 )
				end,
				function ()
					return self.ArcBR:SetAlpha( 1, 500, LUI.EASING.outQuadratic )
				end
			},
			{
				function ()
					return self.ArcBR:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 506, _1080p * 634, _1080p * 364, _1080p * 108, 0 )
				end,
				function ()
					return self.ArcBR:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 506, _1080p * 634, _1080p * 364, _1080p * 108, 500 )
				end,
				function ()
					return self.ArcBR:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 406, _1080p * 534, _1080p * 314, _1080p * 58, 500, LUI.EASING.outQuadratic )
				end
			}
		} )
		ArcBL:RegisterAnimationSequence( "BootUp", {
			{
				function ()
					return self.ArcBL:SetAlpha( 0, 0 )
				end,
				function ()
					return self.ArcBL:SetAlpha( 0, 500 )
				end,
				function ()
					return self.ArcBL:SetAlpha( 1, 500, LUI.EASING.outQuadratic )
				end
			},
			{
				function ()
					return self.ArcBL:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -506, _1080p * -634, _1080p * 364, _1080p * 108, 0 )
				end,
				function ()
					return self.ArcBL:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -506, _1080p * -634, _1080p * 364, _1080p * 108, 500 )
				end,
				function ()
					return self.ArcBL:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -406, _1080p * -534, _1080p * 314, _1080p * 58, 500, LUI.EASING.outQuadratic )
				end
			}
		} )
		Border:RegisterAnimationSequence( "BootUp", {
			{
				function ()
					return self.Border:SetAlpha( 0, 0 )
				end,
				function ()
					return self.Border:SetAlpha( 0, 720 )
				end,
				function ()
					return self.Border:SetAlpha( 0.8, 280 )
				end
			}
		} )
		TrackingText:RegisterAnimationSequence( "BootUp", {
			{
				function ()
					return self.TrackingText:SetAlpha( 0, 0 )
				end,
				function ()
					return self.TrackingText:SetAlpha( 0, 720 )
				end,
				function ()
					return self.TrackingText:SetAlpha( 0.8, 280 )
				end
			}
		} )
		self._sequences.BootUp = function ()
			InnerCircle:AnimateSequence( "BootUp" )
			HexTR:AnimateSequence( "BootUp" )
			HexBR:AnimateSequence( "BootUp" )
			HexBL:AnimateSequence( "BootUp" )
			HexTL:AnimateSequence( "BootUp" )
			DiagTR:AnimateSequence( "BootUp" )
			DiagBR:AnimateSequence( "BootUp" )
			DiagBL:AnimateSequence( "BootUp" )
			DiagTL:AnimateSequence( "BootUp" )
			ArcTR:AnimateSequence( "BootUp" )
			ArcTL:AnimateSequence( "BootUp" )
			ArcBR:AnimateSequence( "BootUp" )
			ArcBL:AnimateSequence( "BootUp" )
			Border:AnimateSequence( "BootUp" )
			TrackingText:AnimateSequence( "BootUp" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	return self
end

MenuBuilder.registerType( "EthanHackReticle", EthanHackReticle )
LockTable( _M )
