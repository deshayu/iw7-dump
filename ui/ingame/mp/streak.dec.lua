local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ( f1_arg0, f1_arg1, f1_arg2 )
	assert( f1_arg0.ProgressBar, "WARNING: Streak Items Are Missing..." )
	local f1_local0 = f1_arg0.ProgressBar
	if CONDITIONS.IsSplitscreen() then
		f1_arg0.Background:SetDepth( 0, 0 )
		f1_arg0.ProgressBar:SetDepth( 0, 0 )
		f1_arg0.Border:SetDepth( 0, 0 )
		f1_arg0.Icon:SetDepth( 0, 0 )
		f1_arg0.Arrow:SetDepth( 0, 0 )
	end
	local f1_local1 = function ()
		local f2_local0 = f1_arg0:GetDataSource()
		f2_local0 = f2_local0.isActive:GetValue( f1_arg1 )
		local f2_local1 = f1_arg0:GetDataSource()
		f2_local1 = f2_local1.isSlotSelected:GetValue( f1_arg1 )
		local f2_local2 = nil
		if f2_local0 then
			if f2_local1 then
				f2_local2 = "Selected"
			else
				f2_local2 = "Unselected"
			end
		else
			f2_local2 = "Unuseable"
		end
		ACTIONS.AnimateSequence( f1_arg0, f2_local2 )
		if f2_local0 then
			ACTIONS.AnimateSequence( f1_arg0, "GlowActive" )
		end
	end
	
	f1_arg0:SubscribeToModelThroughElement( f1_arg0, "isActive", f1_local1, true )
	f1_arg0:SubscribeToModelThroughElement( f1_arg0, "isSlotSelected", f1_local1, true )
	f1_arg0._lastStreakState = false
	f1_arg0:SubscribeToModelThroughElement( f1_arg0, "isActive", function ()
		local f3_local0 = f1_arg0:GetDataSource()
		f3_local0 = f3_local0.isActive:GetValue( f1_arg1 )
		if f3_local0 ~= nil then
			if f1_arg0._lastStreakState == false and f3_local0 then
				ACTIONS.AnimateSequence( f1_arg0, "Gained" )
			end
			f1_arg0._lastStreakState = f3_local0
		end
	end, true )
	local f1_local2 = DataSources.inGame.player.super.superActive
	f1_arg0:SubscribeToModel( f1_local2:GetModel( f1_arg1 ), function ()
		local f4_local0 = f1_local2:GetValue( f1_arg1 )
		local f4_local1 = DataSources.inGame.player.super.superMeterRef:GetValue( f1_arg1 )
		local f4_local2 = nil
		if f4_local0 and f4_local1 == "super_amplify" then
			f4_local2 = SWATCHES.scorestreakButton.amplify
		else
			f4_local2 = SWATCHES.scorestreakButton.fill
		end
		f1_local0:SetRGBFromTable( f4_local2, 100 )
	end )
end

function Streak( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 60 * _1080p, 0, 60 * _1080p )
	self.id = "Streak"
	self._animationSets = {}
	self._sequences = {}
	local f5_local1 = controller and controller.controllerIndex
	if not f5_local1 and not Engine.InFrontend() then
		f5_local1 = self:getRootController()
	end
	assert( f5_local1 )
	local f5_local2 = self
	local Background = nil
	
	Background = LUI.UIImage.new()
	Background.id = "Background"
	Background:SetRGBFromTable( SWATCHES.scorestreakButton.background, 0 )
	Background:SetAlpha( 0, 0 )
	Background:SetDepth( 2, 0 )
	Background:setImage( RegisterMaterial( "widg_gradient_bottom_to_top_opaque" ), 0 )
	Background:SetUseAA( true )
	self:addElement( Background )
	self.Background = Background
	
	local ProgressBar = nil
	
	ProgressBar = LUI.UIImage.new()
	ProgressBar.id = "ProgressBar"
	ProgressBar:SetAlpha( 0.4, 0 )
	ProgressBar:SetDepth( 0.5, 0 )
	ProgressBar:setImage( RegisterMaterial( "widg_gradient_bottom_to_top_opaque" ), 0 )
	ProgressBar:SetUseAA( true )
	ProgressBar:SetBlendMode( BLEND_MODE.addWithAlpha )
	ProgressBar:SetAnchorsAndPosition( 0, 0, 1, 0, 0, 0, 0, 0 )
	self:addElement( ProgressBar )
	self.ProgressBar = ProgressBar
	
	local Border = nil
	
	Border = LUI.UIBorder.new( {
		borderThicknessLeft = _1080p * 1,
		borderThicknessRight = _1080p * 1,
		borderThicknessTop = _1080p * 3,
		borderThicknessBottom = _1080p * 1
	} )
	Border.id = "Border"
	Border:SetRGBFromTable( SWATCHES.scorestreakButton.normal, 0 )
	Border:SetDepth( -0.5, 0 )
	Border:SetBorderThicknessTop( _1080p * 3, 0 )
	self:addElement( Border )
	self.Border = Border
	
	local IconGlow = nil
	
	IconGlow = LUI.UIImage.new()
	IconGlow.id = "IconGlow"
	IconGlow:SetRGBFromInt( 16767744, 0 )
	IconGlow:SetAlpha( 0, 0 )
	IconGlow:setImage( RegisterMaterial( "hud_glow" ), 0 )
	IconGlow:SetBlendMode( BLEND_MODE.blend )
	IconGlow:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -15, _1080p * 75, _1080p * -22, _1080p * 82 )
	self:addElement( IconGlow )
	self.IconGlow = IconGlow
	
	local Icon = nil
	
	Icon = LUI.UIImage.new()
	Icon.id = "Icon"
	Icon:SetDepth( -0.5, 0 )
	Icon:SetUseAA( true )
	Icon:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -24, _1080p * 24, _1080p * -24, _1080p * 24 )
	Icon:SubscribeToModelThroughElement( self, "icon", function ()
		local f6_local0 = self:GetDataSource()
		f6_local0 = f6_local0.icon:GetValue( f5_local1 )
		if f6_local0 ~= nil then
			Icon:setImage( RegisterMaterial( f6_local0 ), 0 )
		end
	end )
	self:addElement( Icon )
	self.Icon = Icon
	
	local Arrow = nil
	
	Arrow = LUI.UIImage.new()
	Arrow.id = "Arrow"
	Arrow:SetRGBFromTable( SWATCHES.scorestreakButton.highlight, 0 )
	Arrow:SetZRotation( 90, 0 )
	Arrow:SetDepth( -2, 0 )
	Arrow:setImage( RegisterMaterial( "hud_arrow" ), 0 )
	Arrow:SetUseAA( true )
	Arrow:SetAnchorsAndPosition( 1, 0, 0.5, 0.5, 0, _1080p * 16, _1080p * -8, _1080p * 8 )
	self:addElement( Arrow )
	self.Arrow = Arrow
	
	local Glow = nil
	
	Glow = LUI.UIImage.new()
	Glow.id = "Glow"
	Glow:setImage( RegisterMaterial( "wdg_ellipse_glow" ), 0 )
	Glow:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, _1080p * -2, _1080p * -54 )
	self:addElement( Glow )
	self.Glow = Glow
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		Background:RegisterAnimationSequence( "Unuseable", {
			{
				function ()
					return self.Background:SetRGBFromTable( SWATCHES.scorestreakButton.background, 0 )
				end
			},
			{
				function ()
					return self.Background:SetZRotation( 0, 0 )
				end
			},
			{
				function ()
					return self.Background:SetAlpha( 0, 0 )
				end
			}
		} )
		Border:RegisterAnimationSequence( "Unuseable", {
			{
				function ()
					return self.Border:SetRGBFromInt( 8421504, 0 )
				end
			},
			{
				function ()
					return self.Border:SetBorderThicknessLeft( _1080p * 1, 0 )
				end
			},
			{
				function ()
					return self.Border:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, 0, 0, 0 )
				end
			}
		} )
		Icon:RegisterAnimationSequence( "Unuseable", {
			{
				function ()
					return self.Icon:SetRGBFromInt( 13421772, 0 )
				end
			},
			{
				function ()
					return self.Icon:SetBlendMode( BLEND_MODE.disabled )
				end
			}
		} )
		Arrow:RegisterAnimationSequence( "Unuseable", {
			{
				function ()
					return self.Arrow:SetAlpha( 0, 0 )
				end
			}
		} )
		Glow:RegisterAnimationSequence( "Unuseable", {
			{
				function ()
					return self.Glow:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.Unuseable = function ()
			Background:AnimateSequence( "Unuseable" )
			Border:AnimateSequence( "Unuseable" )
			Icon:AnimateSequence( "Unuseable" )
			Arrow:AnimateSequence( "Unuseable" )
			Glow:AnimateSequence( "Unuseable" )
		end
		
		Background:RegisterAnimationSequence( "Selected", {
			{
				function ()
					return self.Background:SetRGBFromTable( SWATCHES.scorestreakButton.backgroundHighlight, 0 )
				end
			},
			{
				function ()
					return self.Background:SetZRotation( 180, 0 )
				end
			},
			{
				function ()
					return self.Background:SetAlpha( 0.75, 0 )
				end
			},
			{
				function ()
					return self.Background:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, 0, 0, 0 )
				end,
				function ()
					return self.Background:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * -1, 0, 0, 0, 150 )
				end
			}
		} )
		Border:RegisterAnimationSequence( "Selected", {
			{
				function ()
					return self.Border:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.Border:SetRGBFromTable( SWATCHES.scorestreakButton.highlight, 0 )
				end
			},
			{
				function ()
					return self.Border:SetBorderThicknessLeft( _1080p * 2, 0 )
				end,
				function ()
					return self.Border:SetBorderThicknessLeft( _1080p * 7, 150 )
				end
			},
			{
				function ()
					return self.Border:SetBorderThicknessTop( _1080p * 4, 0 )
				end
			},
			{
				function ()
					return self.Border:SetBorderThicknessBottom( _1080p * 2, 0 )
				end
			},
			{
				function ()
					return self.Border:SetBorderThicknessRight( _1080p * 2, 0 )
				end
			},
			{
				function ()
					return self.Border:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, 0, 0, 0 )
				end,
				function ()
					return self.Border:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * -6, 0, 0, 0, 150 )
				end
			}
		} )
		Arrow:RegisterAnimationSequence( "Selected", {
			{
				function ()
					return self.Arrow:SetAlpha( 0, 0 )
				end,
				function ()
					return self.Arrow:SetAlpha( 1, 150 )
				end
			},
			{
				function ()
					return self.Arrow:SetAnchorsAndPosition( 1, 0, 0.5, 0.5, _1080p * -5, _1080p * 11, _1080p * -8, _1080p * 8, 0 )
				end,
				function ()
					return self.Arrow:SetAnchorsAndPosition( 1, 0, 0.5, 0.5, 0, _1080p * 16, _1080p * -8, _1080p * 8, 150 )
				end
			}
		} )
		Glow:RegisterAnimationSequence( "Selected", {
			{
				function ()
					return self.Glow:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.Glow:SetScale( 0.32, 0 )
				end
			}
		} )
		self._sequences.Selected = function ()
			Background:AnimateSequence( "Selected" )
			Border:AnimateSequence( "Selected" )
			Arrow:AnimateSequence( "Selected" )
			Glow:AnimateSequence( "Selected" )
		end
		
		Background:RegisterAnimationSequence( "Unselected", {
			{
				function ()
					return self.Background:SetRGBFromTable( SWATCHES.scorestreakButton.background, 0 )
				end
			},
			{
				function ()
					return self.Background:SetZRotation( 0, 0 )
				end
			},
			{
				function ()
					return self.Background:SetAlpha( 0, 0 )
				end
			}
		} )
		Border:RegisterAnimationSequence( "Unselected", {
			{
				function ()
					return self.Border:SetRGBFromTable( SWATCHES.scorestreakButton.highlight, 0 )
				end
			},
			{
				function ()
					return self.Border:SetBorderThicknessLeft( _1080p * 2, 0 )
				end
			},
			{
				function ()
					return self.Border:SetBorderThicknessRight( _1080p * 2, 0 )
				end
			},
			{
				function ()
					return self.Border:SetBorderThicknessBottom( _1080p * 2, 0 )
				end
			},
			{
				function ()
					return self.Border:SetBorderThicknessTop( _1080p * 4, 0 )
				end
			},
			{
				function ()
					return self.Border:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, 0, 0, 0 )
				end
			}
		} )
		Arrow:RegisterAnimationSequence( "Unselected", {
			{
				function ()
					return self.Arrow:SetAlpha( 0, 0 )
				end
			}
		} )
		Glow:RegisterAnimationSequence( "Unselected", {
			{
				function ()
					return self.Glow:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.Glow:SetScale( 0, 0 )
				end
			}
		} )
		self._sequences.Unselected = function ()
			Background:AnimateSequence( "Unselected" )
			Border:AnimateSequence( "Unselected" )
			Arrow:AnimateSequence( "Unselected" )
			Glow:AnimateSequence( "Unselected" )
		end
		
		Glow:RegisterAnimationSequence( "GlowActive", {
			{
				function ()
					return self.Glow:SetUMin( 0, 0 )
				end
			}
		} )
		self._sequences.GlowActive = function ()
			Glow:AnimateSequence( "GlowActive" )
		end
		
		Background:RegisterAnimationSequence( "UseSelected", {
			{
				function ()
					return self.Background:SetAlpha( 0, 0 )
				end
			}
		} )
		Border:RegisterAnimationSequence( "UseSelected", {
			{
				function ()
					return self.Border:SetBorderThicknessLeft( _1080p * 6, 0 )
				end,
				function ()
					return self.Border:SetBorderThicknessLeft( _1080p * 1, 300, LUI.EASING.outCubic )
				end
			},
			{
				function ()
					return self.Border:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * -5, 0, 0, 0, 0 )
				end,
				function ()
					return self.Border:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, 0, 0, 300, LUI.EASING.outCubic )
				end
			}
		} )
		Arrow:RegisterAnimationSequence( "UseSelected", {
			{
				function ()
					return self.Arrow:SetAlpha( 1, 0 )
				end,
				function ()
					return self.Arrow:SetAlpha( 1, 330 )
				end,
				function ()
					return self.Arrow:SetAlpha( 0, 130 )
				end
			},
			{
				function ()
					return self.Arrow:SetAnchorsAndPosition( 1, 0, 0.5, 0.5, 0, _1080p * 16, _1080p * -8, _1080p * 8, 0 )
				end,
				function ()
					return self.Arrow:SetAnchorsAndPosition( 1, 0, 0.5, 0.5, _1080p * 9, _1080p * 25, _1080p * -8, _1080p * 8, 189, LUI.EASING.outCubic )
				end
			}
		} )
		Glow:RegisterAnimationSequence( "UseSelected", {
			{
				function ()
					return self.Glow:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.UseSelected = function ()
			Background:AnimateSequence( "UseSelected" )
			Border:AnimateSequence( "UseSelected" )
			Arrow:AnimateSequence( "UseSelected" )
			Glow:AnimateSequence( "UseSelected" )
		end
		
		IconGlow:RegisterAnimationSequence( "Gained", {
			{
				function ()
					return self.IconGlow:SetScale( 0.29, 0 )
				end,
				function ()
					return self.IconGlow:SetScale( 0.77, 200, LUI.EASING.inQuadratic )
				end,
				function ()
					return self.IconGlow:SetScale( 0, 200 )
				end
			},
			{
				function ()
					return self.IconGlow:SetAlpha( 1, 0 )
				end,
				function ()
					return self.IconGlow:SetAlpha( 1, 200, LUI.EASING.inQuadratic )
				end,
				function ()
					return self.IconGlow:SetAlpha( 1, 200 )
				end,
				function ()
					return self.IconGlow:SetAlpha( 0, 300 )
				end
			}
		} )
		Icon:RegisterAnimationSequence( "Gained", {
			{
				function ()
					return self.Icon:SetScale( 0.11, 0 )
				end,
				function ()
					return self.Icon:SetScale( 0.36, 200, LUI.EASING.inOutQuadratic )
				end,
				function ()
					return self.Icon:SetScale( 0, 200, LUI.EASING.inOutQuadratic )
				end
			}
		} )
		self._sequences.Gained = function ()
			IconGlow:AnimateSequence( "Gained" )
			Icon:AnimateSequence( "Gained" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	f0_local0( self, f5_local1, controller )
	return self
end

MenuBuilder.registerType( "Streak", Streak )
LockTable( _M )
