local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function PostLoadFunc( f1_arg0, f1_arg1, f1_arg2 )
	f1_arg0.SuperIcon:SubscribeToModel( DataSources.inGame.player.super.superMeterImageLarge:GetModel( f1_arg1 ), function ()
		local f2_local0 = DataSources.inGame.player.super.superMeterImageLarge:GetValue( f1_arg1 )
		if f2_local0 ~= nil and f2_local0 ~= "" and f2_local0 ~= "specialty_ks_null" then
			f1_arg0.SuperIcon:setImage( RegisterMaterial( f2_local0 ), 0 )
			f1_arg0.SuperIcon:SetAlpha( 1 )
		else
			f1_arg0.SuperIcon:SetAlpha( 0 )
		end
	end )
	f1_arg0:SubscribeToModel( DataSources.inGame.player.super.superMeterProgress:GetModel( f1_arg1 ), function ( f3_arg0 )
		local f3_local0 = DataModel.GetModelValue( f3_arg0 )
		if f3_local0 ~= nil then
			f1_arg0.Backing:SetProgressInC( f3_local0, 0, 0 )
			f1_arg0.RadialGlow:SetProgressInC( f3_local0, 0, 0 )
			f1_arg0.SuperMeterFill:SetProgressInC( f3_local0, 0, 0 )
		end
	end )
end

function SuperMeter( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 128 * _1080p, 0, 128 * _1080p )
	self.id = "SuperMeter"
	self._animationSets = {}
	self._sequences = {}
	local f4_local1 = controller and controller.controllerIndex
	if not f4_local1 and not Engine.InFrontend() then
		f4_local1 = self:getRootController()
	end
	assert( f4_local1 )
	local f4_local2 = self
	local Backing = nil
	
	Backing = MenuBuilder.BuildRegisteredType( "UIRadialProgressBar", {
		segmentCount = 2,
		segmentMaterial = "dpad_circle_segment",
		maskMaterial = "dpad_circle_mask",
		snapToMultiplesOfAngle = 0,
		controllerIndex = f4_local1
	} )
	Backing.id = "Backing"
	Backing:SetRGBFromInt( 0, 0 )
	Backing:SetAlpha( 0.4, 0 )
	Backing:SetProgress( 1 )
	self:addElement( Backing )
	self.Backing = Backing
	
	local RadialBacker = nil
	
	RadialBacker = LUI.UIImage.new()
	RadialBacker.id = "RadialBacker"
	RadialBacker:SetRGBFromInt( 0, 0 )
	RadialBacker:SetAlpha( 0.3, 0 )
	RadialBacker:setImage( RegisterMaterial( "dpad_circle_whole" ), 0 )
	RadialBacker:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * 2, _1080p * -2, _1080p * 2, _1080p * -2 )
	self:addElement( RadialBacker )
	self.RadialBacker = RadialBacker
	
	local RadialGlow = nil
	
	RadialGlow = MenuBuilder.BuildRegisteredType( "UIRadialProgressBar", {
		segmentCount = 2,
		segmentMaterial = "dpad_circle_glow_segment",
		maskMaterial = "dpad_circle_mask",
		snapToMultiplesOfAngle = 0,
		controllerIndex = f4_local1
	} )
	RadialGlow.id = "RadialGlow"
	RadialGlow:SetRGBFromTable( SWATCHES.superMeter.superMeterFillDim, 0 )
	RadialGlow:SetAlpha( 0.5, 0 )
	RadialGlow:SetDepth( 2, 0 )
	RadialGlow:setImage( RegisterMaterial( "dpad_circle_glow_segment" ), 0 )
	RadialGlow:SetBlendMode( BLEND_MODE.add )
	RadialGlow:SetProgress( 0.3 )
	RadialGlow:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * -4, _1080p * 4, _1080p * -4, _1080p * 4 )
	self:addElement( RadialGlow )
	self.RadialGlow = RadialGlow
	
	local SuperMeterFill = nil
	
	SuperMeterFill = MenuBuilder.BuildRegisteredType( "UIRadialProgressBar", {
		segmentCount = 2,
		segmentMaterial = "dpad_circle_segment",
		maskMaterial = "dpad_circle_mask",
		snapToMultiplesOfAngle = 0,
		controllerIndex = f4_local1
	} )
	SuperMeterFill.id = "SuperMeterFill"
	SuperMeterFill:SetRGBFromInt( 16767744, 0 )
	SuperMeterFill:setImage( RegisterMaterial( "dpad_circle_segment" ), 0 )
	SuperMeterFill:SetProgress( 0.3 )
	self:addElement( SuperMeterFill )
	self.SuperMeterFill = SuperMeterFill
	
	local IconBacker = nil
	
	IconBacker = LUI.UIImage.new()
	IconBacker.id = "IconBacker"
	IconBacker:SetRGBFromInt( 0, 0 )
	IconBacker:SetAlpha( 0.15, 0 )
	IconBacker:setImage( RegisterMaterial( "hud_ability_base_circle" ), 0 )
	IconBacker:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * 21, _1080p * -19, _1080p * 20, _1080p * -20 )
	self:addElement( IconBacker )
	self.IconBacker = IconBacker
	
	local Glow = nil
	
	Glow = LUI.UIImage.new()
	Glow.id = "Glow"
	Glow:SetRGBFromInt( 16637960, 0 )
	Glow:SetAlpha( 0, 0 )
	Glow:setImage( RegisterMaterial( "hud_glow" ), 0 )
	Glow:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * -10, _1080p * 10, _1080p * -10, _1080p * 10 )
	self:addElement( Glow )
	self.Glow = Glow
	
	local Frame = nil
	
	Frame = LUI.UIImage.new()
	Frame.id = "Frame"
	Frame:SetDepth( -2, 0 )
	Frame:setImage( RegisterMaterial( "hud_super_meter_frame" ), 0 )
	Frame:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * -10, _1080p * 10, _1080p * -10, _1080p * 10 )
	self:addElement( Frame )
	self.Frame = Frame
	
	local SuperIcon = nil
	
	SuperIcon = LUI.UIImage.new()
	SuperIcon.id = "SuperIcon"
	SuperIcon:SetDepth( -3, 0 )
	SuperIcon:SetScale( -0.15, 0 )
	SuperIcon:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -86, _1080p * 74, _1080p * -86, _1080p * 74 )
	self:addElement( SuperIcon )
	self.SuperIcon = SuperIcon
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		RadialGlow:RegisterAnimationSequence( "ChargedFlash", {
			{
				function ()
					return self.RadialGlow:SetAlpha( 0.5, 0 )
				end,
				function ()
					return self.RadialGlow:SetAlpha( 0.8, 500, LUI.EASING.outQuadratic )
				end,
				function ()
					return self.RadialGlow:SetAlpha( 0.5, 150, LUI.EASING.inQuadratic )
				end,
				function ()
					return self.RadialGlow:SetAlpha( 0.8, 460, LUI.EASING.outQuadratic )
				end,
				function ()
					return self.RadialGlow:SetAlpha( 0.5, 150, LUI.EASING.inQuadratic )
				end
			}
		} )
		SuperMeterFill:RegisterAnimationSequence( "ChargedFlash", {
			{
				function ()
					return self.SuperMeterFill:SetRGBFromTable( SWATCHES.superMeter.superMeterFillBright, 0 )
				end
			},
			{
				function ()
					return self.SuperMeterFill:SetAlpha( 1, 0 )
				end,
				function ()
					return self.SuperMeterFill:SetAlpha( 0.4, 500, LUI.EASING.outQuadratic )
				end,
				function ()
					return self.SuperMeterFill:SetAlpha( 1, 150, LUI.EASING.inQuadratic )
				end,
				function ()
					return self.SuperMeterFill:SetAlpha( 0.4, 460, LUI.EASING.outQuadratic )
				end,
				function ()
					return self.SuperMeterFill:SetAlpha( 1, 150, LUI.EASING.inQuadratic )
				end
			}
		} )
		self._sequences.ChargedFlash = function ()
			RadialGlow:AnimateLoop( "ChargedFlash" )
			SuperMeterFill:AnimateLoop( "ChargedFlash" )
		end
		
		RadialGlow:RegisterAnimationSequence( "InUse", {
			{
				function ()
					return self.RadialGlow:SetRGBFromInt( 7524607, 0 )
				end
			},
			{
				function ()
					return self.RadialGlow:SetAlpha( 0.5, 0 )
				end
			}
		} )
		SuperMeterFill:RegisterAnimationSequence( "InUse", {
			{
				function ()
					return self.SuperMeterFill:SetRGBFromInt( 1810175, 0 )
				end
			},
			{
				function ()
					return self.SuperMeterFill:SetAlpha( 1, 0 )
				end
			}
		} )
		SuperIcon:RegisterAnimationSequence( "InUse", {
			{
				function ()
					return self.SuperIcon:SetScale( 0, 0 )
				end,
				function ()
					return self.SuperIcon:SetScale( -0.1, 1000, LUI.EASING.inOutQuadratic )
				end
			}
		} )
		self._sequences.InUse = function ()
			RadialGlow:AnimateSequence( "InUse" )
			SuperMeterFill:AnimateSequence( "InUse" )
			SuperIcon:AnimateSequence( "InUse" )
		end
		
		self._sequences.FlashMeterUpdated = function ()
			
		end
		
		RadialGlow:RegisterAnimationSequence( "ChargedGlowFlash", {
			{
				function ()
					return self.RadialGlow:SetAlpha( 0.6, 0 )
				end,
				function ()
					return self.RadialGlow:SetAlpha( 0.5, 200, LUI.EASING.outQuadratic )
				end,
				function ()
					return self.RadialGlow:SetAlpha( 0.5, 100, LUI.EASING.outQuadratic )
				end
			},
			{
				function ()
					return self.RadialGlow:SetRGBFromTable( SWATCHES.superMeter.superMeterGlow, 0 )
				end
			},
			{
				function ()
					return self.RadialGlow:SetDepth( 2, 0 )
				end,
				function ()
					return self.RadialGlow:SetDepth( -9, 200, LUI.EASING.outQuadratic )
				end,
				function ()
					return self.RadialGlow:SetDepth( 2, 100, LUI.EASING.outQuadratic )
				end
			},
			{
				function ()
					return self.RadialGlow:SetScale( 0, 0 )
				end,
				function ()
					return self.RadialGlow:SetScale( 0.25, 200, LUI.EASING.outQuadratic )
				end,
				function ()
					return self.RadialGlow:SetScale( 0, 100, LUI.EASING.outQuadratic )
				end
			}
		} )
		SuperMeterFill:RegisterAnimationSequence( "ChargedGlowFlash", {
			{
				function ()
					return self.SuperMeterFill:SetScale( 0, 0 )
				end,
				function ()
					return self.SuperMeterFill:SetScale( 0.25, 200, LUI.EASING.outQuadratic )
				end,
				function ()
					return self.SuperMeterFill:SetScale( 0, 100, LUI.EASING.outQuadratic )
				end
			},
			{
				function ()
					return self.SuperMeterFill:SetDepth( 0, 0 )
				end,
				function ()
					return self.SuperMeterFill:SetDepth( -9, 200, LUI.EASING.outQuadratic )
				end,
				function ()
					return self.SuperMeterFill:SetDepth( 0, 100, LUI.EASING.outQuadratic )
				end
			}
		} )
		Glow:RegisterAnimationSequence( "ChargedGlowFlash", {
			{
				function ()
					return self.Glow:SetAlpha( 0, 0 )
				end,
				function ()
					return self.Glow:SetAlpha( 1, 50, LUI.EASING.outQuadratic )
				end,
				function ()
					return self.Glow:SetAlpha( 1, 150, LUI.EASING.outQuadratic )
				end,
				function ()
					return self.Glow:SetAlpha( 1, 100, LUI.EASING.outQuadratic )
				end,
				function ()
					return self.Glow:SetAlpha( 0, 10 )
				end
			},
			{
				function ()
					return self.Glow:SetScale( 0, 0 )
				end,
				function ()
					return self.Glow:SetScale( 0.5, 200, LUI.EASING.outQuadratic )
				end,
				function ()
					return self.Glow:SetScale( 0, 110 )
				end
			},
			{
				function ()
					return self.Glow:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * -46, _1080p * 46, _1080p * -88, _1080p * 75, 119 )
				end
			}
		} )
		Frame:RegisterAnimationSequence( "ChargedGlowFlash", {
			{
				function ()
					return self.Frame:SetScale( 0, 0 )
				end,
				function ()
					return self.Frame:SetScale( 0.25, 200, LUI.EASING.outQuadratic )
				end,
				function ()
					return self.Frame:SetScale( 0, 100, LUI.EASING.outQuadratic )
				end
			},
			{
				function ()
					return self.Frame:SetDepth( -2, 0 )
				end,
				function ()
					return self.Frame:SetDepth( -15, 200, LUI.EASING.outQuadratic )
				end,
				function ()
					return self.Frame:SetDepth( -2, 100, LUI.EASING.outQuadratic )
				end
			}
		} )
		SuperIcon:RegisterAnimationSequence( "ChargedGlowFlash", {
			{
				function ()
					return self.SuperIcon:SetDepth( -3, 0 )
				end,
				function ()
					return self.SuperIcon:SetDepth( -15, 200, LUI.EASING.outQuadratic )
				end,
				function ()
					return self.SuperIcon:SetDepth( -3, 100, LUI.EASING.outQuadratic )
				end
			},
			{
				function ()
					return self.SuperIcon:SetScale( 0, 0 )
				end,
				function ()
					return self.SuperIcon:SetScale( 0.25, 200, LUI.EASING.outQuadratic )
				end,
				function ()
					return self.SuperIcon:SetScale( 0, 100, LUI.EASING.outQuadratic )
				end
			},
			{
				function ()
					return self.SuperIcon:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -82, _1080p * 70, _1080p * -82, _1080p * 70, 0 )
				end
			}
		} )
		self._sequences.ChargedGlowFlash = function ()
			RadialGlow:AnimateSequence( "ChargedGlowFlash" )
			SuperMeterFill:AnimateSequence( "ChargedGlowFlash" )
			Glow:AnimateSequence( "ChargedGlowFlash" )
			Frame:AnimateSequence( "ChargedGlowFlash" )
			SuperIcon:AnimateSequence( "ChargedGlowFlash" )
		end
		
		RadialGlow:RegisterAnimationSequence( "MeterDefault", {
			{
				function ()
					return self.RadialGlow:SetAlpha( 0.4, 0 )
				end
			},
			{
				function ()
					return self.RadialGlow:SetRGBFromTable( SWATCHES.superMeter.superMeterProgression, 0 )
				end
			}
		} )
		SuperMeterFill:RegisterAnimationSequence( "MeterDefault", {
			{
				function ()
					return self.SuperMeterFill:SetRGBFromTable( SWATCHES.superMeter.superMeterProgression, 0 )
				end
			},
			{
				function ()
					return self.SuperMeterFill:SetAlpha( 1, 0 )
				end
			}
		} )
		SuperIcon:RegisterAnimationSequence( "MeterDefault", {
			{
				function ()
					return self.SuperIcon:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.SuperIcon:SetScale( -0.15, 0 )
				end
			}
		} )
		self._sequences.MeterDefault = function ()
			RadialGlow:AnimateSequence( "MeterDefault" )
			SuperMeterFill:AnimateSequence( "MeterDefault" )
			SuperIcon:AnimateSequence( "MeterDefault" )
		end
		
		SuperIcon:RegisterAnimationSequence( "HasASuper", {
			{
				function ()
					return self.SuperIcon:SetAlpha( 1, 0 )
				end
			}
		} )
		self._sequences.HasASuper = function ()
			SuperIcon:AnimateSequence( "HasASuper" )
		end
		
		SuperIcon:RegisterAnimationSequence( "NoSuper", {
			{
				function ()
					return self.SuperIcon:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.NoSuper = function ()
			SuperIcon:AnimateSequence( "NoSuper" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	self:SubscribeToModel( DataSources.inGame.player.super.superMeterState:GetModel( f4_local1 ), function ()
		if DataSources.inGame.player.super.superMeterState:GetValue( f4_local1 ) ~= nil and DataSources.inGame.player.super.superMeterState:GetValue( f4_local1 ) == 2 then
			ACTIONS.AnimateSequence( self, "ChargedFlash" )
			ACTIONS.AnimateSequence( self, "ChargedGlowFlash" )
		end
		if DataSources.inGame.player.super.superMeterState:GetValue( f4_local1 ) ~= nil and DataSources.inGame.player.super.superMeterState:GetValue( f4_local1 ) == 1 then
			ACTIONS.AnimateSequence( self, "MeterDefault" )
		end
		if DataSources.inGame.player.super.superMeterState:GetValue( f4_local1 ) ~= nil and DataSources.inGame.player.super.superMeterState:GetValue( f4_local1 ) == 3 then
			ACTIONS.AnimateSequence( self, "InUse" )
		end
	end )
	self:SubscribeToModel( DataSources.inGame.player.super.superMeterFlashProgress:GetModel( f4_local1 ), function ()
		ACTIONS.AnimateSequence( self, "FlashMeterUpdated" )
	end )
	PostLoadFunc( self, f4_local1, controller )
	return self
end

MenuBuilder.registerType( "SuperMeter", SuperMeter )
LockTable( _M )
