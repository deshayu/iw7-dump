local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ( f1_arg0, f1_arg1, f1_arg2 )
	f1_arg0:SetBlendMode( BLEND_MODE.addWithAlpha )
end

function C12TargetWindow( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 1920 * _1080p, 0, 1080 * _1080p )
	self.id = "C12TargetWindow"
	self._animationSets = {}
	self._sequences = {}
	local f2_local1 = controller and controller.controllerIndex
	if not f2_local1 and not Engine.InFrontend() then
		f2_local1 = self:getRootController()
	end
	assert( f2_local1 )
	local f2_local2 = self
	local LeftHorzAccent = nil
	
	LeftHorzAccent = LUI.UIImage.new()
	LeftHorzAccent.id = "LeftHorzAccent"
	LeftHorzAccent:SetAlpha( 0.2, 0 )
	LeftHorzAccent:setImage( RegisterMaterial( "hud_c12_target_horz_accent" ), 0 )
	LeftHorzAccent:SetUseAA( true )
	LeftHorzAccent:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -486, _1080p * -230, _1080p * -16, _1080p * 16 )
	self:addElement( LeftHorzAccent )
	self.LeftHorzAccent = LeftHorzAccent
	
	local RightHorzAccent = nil
	
	RightHorzAccent = LUI.UIImage.new()
	RightHorzAccent.id = "RightHorzAccent"
	RightHorzAccent:SetAlpha( 0.2, 0 )
	RightHorzAccent:SetZRotation( 180, 0 )
	RightHorzAccent:setImage( RegisterMaterial( "hud_c12_target_horz_accent" ), 0 )
	RightHorzAccent:SetUseAA( true )
	RightHorzAccent:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 230, _1080p * 486, _1080p * -16, _1080p * 16 )
	self:addElement( RightHorzAccent )
	self.RightHorzAccent = RightHorzAccent
	
	local Crosshair = nil
	
	Crosshair = LUI.UIImage.new()
	Crosshair.id = "Crosshair"
	Crosshair:setImage( RegisterMaterial( "hud_c12_target_crosshair" ), 0 )
	Crosshair:SetUseAA( true )
	Crosshair:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -128, _1080p * 128, _1080p * -128, _1080p * 128 )
	self:addElement( Crosshair )
	self.Crosshair = Crosshair
	
	local FrameBL = nil
	
	FrameBL = LUI.UIImage.new()
	FrameBL.id = "FrameBL"
	FrameBL:setImage( RegisterMaterial( "hud_c12_target_frame_corner" ), 0 )
	FrameBL:SetUseAA( true )
	FrameBL:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -444, _1080p * -188, _1080p * 234, _1080p * 266 )
	self:addElement( FrameBL )
	self.FrameBL = FrameBL
	
	local FrameBR = nil
	
	FrameBR = LUI.UIImage.new()
	FrameBR.id = "FrameBR"
	FrameBR:setImage( RegisterMaterial( "hud_c12_target_frame_corner" ), 0 )
	FrameBR:SetUseAA( true )
	FrameBR:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 444, _1080p * 188, _1080p * 234, _1080p * 266 )
	self:addElement( FrameBR )
	self.FrameBR = FrameBR
	
	local FrameTL = nil
	
	FrameTL = LUI.UIImage.new()
	FrameTL.id = "FrameTL"
	FrameTL:setImage( RegisterMaterial( "hud_c12_target_frame_corner" ), 0 )
	FrameTL:SetUseAA( true )
	FrameTL:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -444, _1080p * -188, _1080p * -234, _1080p * -266 )
	self:addElement( FrameTL )
	self.FrameTL = FrameTL
	
	local FrameTR = nil
	
	FrameTR = LUI.UIImage.new()
	FrameTR.id = "FrameTR"
	FrameTR:setImage( RegisterMaterial( "hud_c12_target_frame_corner" ), 0 )
	FrameTR:SetUseAA( true )
	FrameTR:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 444, _1080p * 188, _1080p * -234, _1080p * -266 )
	self:addElement( FrameTR )
	self.FrameTR = FrameTR
	
	local FrameSquareTL = nil
	
	FrameSquareTL = LUI.UIImage.new()
	FrameSquareTL.id = "FrameSquareTL"
	FrameSquareTL:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 532, _1080p * 536, _1080p * 295, _1080p * 299 )
	self:addElement( FrameSquareTL )
	self.FrameSquareTL = FrameSquareTL
	
	local TargetingLabel = nil
	
	TargetingLabel = LUI.UIText.new()
	TargetingLabel.id = "TargetingLabel"
	TargetingLabel:setText( Engine.Localize( "HUD_C12_TARGETING" ), 0 )
	TargetingLabel:SetFontSize( 16 * _1080p )
	TargetingLabel:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	TargetingLabel:SetAlignment( LUI.Alignment.Left )
	TargetingLabel:SetOptOutRightToLeftAlignmentFlip( true )
	TargetingLabel:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 540, _1080p * 1040, _1080p * 289, _1080p * 305 )
	self:addElement( TargetingLabel )
	self.TargetingLabel = TargetingLabel
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		LeftHorzAccent:RegisterAnimationSequence( "Bootup", {
			{
				function ()
					return self.LeftHorzAccent:SetAlpha( 0, 0 )
				end,
				function ()
					return self.LeftHorzAccent:SetAlpha( 0, 100 )
				end,
				function ()
					return self.LeftHorzAccent:SetAlpha( 0.2, 200, LUI.EASING.outBack )
				end
			},
			{
				function ()
					return self.LeftHorzAccent:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -256, 0, _1080p * -16, _1080p * 16, 0 )
				end,
				function ()
					return self.LeftHorzAccent:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -256, 0, _1080p * -16, _1080p * 16, 100 )
				end,
				function ()
					return self.LeftHorzAccent:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -486, _1080p * -230, _1080p * -16, _1080p * 16, 200, LUI.EASING.outBack )
				end
			}
		} )
		RightHorzAccent:RegisterAnimationSequence( "Bootup", {
			{
				function ()
					return self.RightHorzAccent:SetAlpha( 0, 0 )
				end,
				function ()
					return self.RightHorzAccent:SetAlpha( 0, 100 )
				end,
				function ()
					return self.RightHorzAccent:SetAlpha( 0.2, 200, LUI.EASING.outBack )
				end
			},
			{
				function ()
					return self.RightHorzAccent:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, 0, _1080p * 256, _1080p * -16, _1080p * 16, 0 )
				end,
				function ()
					return self.RightHorzAccent:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, 0, _1080p * 256, _1080p * -16, _1080p * 16, 100 )
				end,
				function ()
					return self.RightHorzAccent:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 230, _1080p * 486, _1080p * -16, _1080p * 16, 200, LUI.EASING.outBack )
				end
			}
		} )
		Crosshair:RegisterAnimationSequence( "Bootup", {
			{
				function ()
					return self.Crosshair:SetAlpha( 0, 0 )
				end,
				function ()
					return self.Crosshair:SetAlpha( 0, 50 )
				end,
				function ()
					return self.Crosshair:SetAlpha( 1, 200, LUI.EASING.outBack )
				end
			},
			{
				function ()
					return self.Crosshair:SetScale( -0.9, 0 )
				end,
				function ()
					return self.Crosshair:SetScale( -0.9, 50 )
				end,
				function ()
					return self.Crosshair:SetScale( 0, 200, LUI.EASING.outBack )
				end
			}
		} )
		FrameBL:RegisterAnimationSequence( "Bootup", {
			{
				function ()
					return self.FrameBL:SetAlpha( 0, 0 )
				end,
				function ()
					return self.FrameBL:SetAlpha( 1, 200, LUI.EASING.outBack )
				end
			},
			{
				function ()
					return self.FrameBL:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -444, _1080p * -188, 0, _1080p * 32, 0 )
				end,
				function ()
					return self.FrameBL:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -444, _1080p * -188, _1080p * 234, _1080p * 266, 200, LUI.EASING.outBack )
				end
			}
		} )
		FrameBR:RegisterAnimationSequence( "Bootup", {
			{
				function ()
					return self.FrameBR:SetAlpha( 0, 0 )
				end,
				function ()
					return self.FrameBR:SetAlpha( 1, 200, LUI.EASING.outBack )
				end
			},
			{
				function ()
					return self.FrameBR:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 444, _1080p * 188, 0, _1080p * 32, 0 )
				end,
				function ()
					return self.FrameBR:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 444, _1080p * 188, _1080p * 234, _1080p * 266, 200, LUI.EASING.outBack )
				end
			}
		} )
		FrameTL:RegisterAnimationSequence( "Bootup", {
			{
				function ()
					return self.FrameTL:SetAlpha( 0, 0 )
				end,
				function ()
					return self.FrameTL:SetAlpha( 1, 200, LUI.EASING.outBack )
				end
			},
			{
				function ()
					return self.FrameTL:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -444, _1080p * -188, 0, _1080p * -32, 0 )
				end,
				function ()
					return self.FrameTL:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -444, _1080p * -188, _1080p * -234, _1080p * -266, 200, LUI.EASING.outBack )
				end
			}
		} )
		FrameTR:RegisterAnimationSequence( "Bootup", {
			{
				function ()
					return self.FrameTR:SetAlpha( 0, 0 )
				end,
				function ()
					return self.FrameTR:SetAlpha( 1, 200, LUI.EASING.outBack )
				end
			},
			{
				function ()
					return self.FrameTR:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 444, _1080p * 188, 0, _1080p * -32, 0 )
				end,
				function ()
					return self.FrameTR:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 444, _1080p * 188, _1080p * -234, _1080p * -266, 200, LUI.EASING.outBack )
				end
			}
		} )
		FrameSquareTL:RegisterAnimationSequence( "Bootup", {
			{
				function ()
					return self.FrameSquareTL:SetAlpha( 0, 0 )
				end,
				function ()
					return self.FrameSquareTL:SetAlpha( 0, 150 )
				end,
				function ()
					return self.FrameSquareTL:SetAlpha( 0.75, 50 )
				end
			}
		} )
		TargetingLabel:RegisterAnimationSequence( "Bootup", {
			{
				function ()
					return self.TargetingLabel:SetAlpha( 0, 0 )
				end,
				function ()
					return self.TargetingLabel:SetAlpha( 0, 150 )
				end,
				function ()
					return self.TargetingLabel:SetAlpha( 1, 50 )
				end
			}
		} )
		self._sequences.Bootup = function ()
			LeftHorzAccent:AnimateSequence( "Bootup" )
			RightHorzAccent:AnimateSequence( "Bootup" )
			Crosshair:AnimateSequence( "Bootup" )
			FrameBL:AnimateSequence( "Bootup" )
			FrameBR:AnimateSequence( "Bootup" )
			FrameTL:AnimateSequence( "Bootup" )
			FrameTR:AnimateSequence( "Bootup" )
			FrameSquareTL:AnimateSequence( "Bootup" )
			TargetingLabel:AnimateSequence( "Bootup" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	self:SubscribeToModel( DataSources.inGame.HUD.overlay.isC12Active:GetModel( f2_local1 ), function ()
		if DataSources.inGame.HUD.overlay.isC12Active:GetValue( f2_local1 ) ~= nil and DataSources.inGame.HUD.overlay.isC12Active:GetValue( f2_local1 ) == 1 then
			ACTIONS.AnimateSequence( self, "Bootup" )
		end
	end )
	f0_local0( self, f2_local1, controller )
	return self
end

MenuBuilder.registerType( "C12TargetWindow", C12TargetWindow )
LockTable( _M )
