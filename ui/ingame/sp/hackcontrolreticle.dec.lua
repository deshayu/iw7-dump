local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function PostLoadFunc( f1_arg0, f1_arg1, f1_arg2 )
	f1_arg0:addEventHandler( "bootup_anim", function ()
		ACTIONS.AnimateSequence( f1_arg0, "BootUp" )
	end )
	local f1_local0 = function ( f3_arg0 )
		local f3_local0 = nil
		local f3_local1 = function ()
			local f4_local0 = f3_arg0:SetZRotation( math.random( 0, 360 ), math.random( 200, 1000 ), math.random( LUI.EASING.linear, LUI.EASING.inOutBack ) )
			f4_local0.onComplete = f3_local0
		end
		
		f3_local1()
	end
	
	f1_local0( f1_arg0.Accent1 )
	f1_local0( f1_arg0.Accent2 )
	assert( f1_arg0.ExplodeHint )
	f1_arg0.ExplodeHint:SetShadowUOffset( -0 )
	f1_arg0.ExplodeHint:SetShadowVOffset( -0 )
end

function HackControlReticle( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 300 * _1080p, 0, 300 * _1080p )
	self.id = "HackControlReticle"
	self._animationSets = {}
	self._sequences = {}
	local f5_local1 = controller and controller.controllerIndex
	if not f5_local1 and not Engine.InFrontend() then
		f5_local1 = self:getRootController()
	end
	assert( f5_local1 )
	local f5_local2 = self
	local Ring = nil
	
	Ring = LUI.UIImage.new()
	Ring.id = "Ring"
	Ring:SetRGBFromTable( SWATCHES.robotHacking.warning, 0 )
	Ring:setImage( RegisterMaterial( "hud_ability_frame_outer_circle" ), 0 )
	Ring:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -64, _1080p * 64, _1080p * -64, _1080p * 64 )
	self:addElement( Ring )
	self.Ring = Ring
	
	local Accent1 = nil
	
	Accent1 = LUI.UIImage.new()
	Accent1.id = "Accent1"
	Accent1:SetAlpha( 0.2, 0 )
	Accent1:setImage( RegisterMaterial( "hud_ability_frame_spin" ), 0 )
	Accent1:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -64, _1080p * 64, _1080p * -64, _1080p * 64 )
	self:addElement( Accent1 )
	self.Accent1 = Accent1
	
	local Accent2 = nil
	
	Accent2 = LUI.UIImage.new()
	Accent2.id = "Accent2"
	Accent2:SetAlpha( 0.1, 0 )
	Accent2:setImage( RegisterMaterial( "hud_rt_circle_spin" ), 0 )
	Accent2:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -64, _1080p * 64, _1080p * -64, _1080p * 64 )
	self:addElement( Accent2 )
	self.Accent2 = Accent2
	
	local ExplodeHint = nil
	
	ExplodeHint = LUI.UIStyledText.new()
	ExplodeHint.id = "ExplodeHint"
	ExplodeHint:setText( Engine.Localize( "EQUIPMENT_HACK_HUD_EXPLODE_HINT" ), 0 )
	ExplodeHint:SetFontSize( 36 * _1080p )
	ExplodeHint:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	ExplodeHint:SetAlignment( LUI.Alignment.Center )
	ExplodeHint:SetShadowMinDistance( -0.2, 0 )
	ExplodeHint:SetShadowMaxDistance( 0.2, 0 )
	ExplodeHint:SetShadowRGBFromInt( 6236672, 0 )
	ExplodeHint:SetAnchorsAndPosition( 0, 0, 1, 0, _1080p * -100, _1080p * 100, _1080p * -36, 0 )
	ExplodeHint:BindAlphaToModel( DataSources.inGame.SP.hackControlSelfDestruct:GetModel( f5_local1 ) )
	self:addElement( ExplodeHint )
	self.ExplodeHint = ExplodeHint
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		Ring:RegisterAnimationSequence( "Off", {
			{
				function ()
					return self.Ring:SetAlpha( 0, 0 )
				end
			}
		} )
		Accent1:RegisterAnimationSequence( "Off", {
			{
				function ()
					return self.Accent1:SetAlpha( 0, 0 )
				end
			}
		} )
		Accent2:RegisterAnimationSequence( "Off", {
			{
				function ()
					return self.Accent2:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.Off = function ()
			Ring:AnimateSequence( "Off" )
			Accent1:AnimateSequence( "Off" )
			Accent2:AnimateSequence( "Off" )
		end
		
		Ring:RegisterAnimationSequence( "BootUp", {
			{
				function ()
					return self.Ring:SetAlpha( 0, 0 )
				end,
				function ()
					return self.Ring:SetAlpha( 1, 100 )
				end
			}
		} )
		Accent1:RegisterAnimationSequence( "BootUp", {
			{
				function ()
					return self.Accent1:SetAlpha( 0, 0 )
				end,
				function ()
					return self.Accent1:SetAlpha( 0.2, 100 )
				end
			}
		} )
		Accent2:RegisterAnimationSequence( "BootUp", {
			{
				function ()
					return self.Accent2:SetAlpha( 0, 0 )
				end,
				function ()
					return self.Accent2:SetAlpha( 0.1, 100 )
				end
			}
		} )
		self._sequences.BootUp = function ()
			Ring:AnimateSequence( "BootUp" )
			Accent1:AnimateSequence( "BootUp" )
			Accent2:AnimateSequence( "BootUp" )
		end
		
		Ring:RegisterAnimationSequence( "Outro", {
			{
				function ()
					return self.Ring:SetAlpha( 1, 0 )
				end,
				function ()
					return self.Ring:SetAlpha( 0, 150 )
				end
			}
		} )
		Accent1:RegisterAnimationSequence( "Outro", {
			{
				function ()
					return self.Accent1:SetAlpha( 0.2, 0 )
				end,
				function ()
					return self.Accent1:SetAlpha( 0, 150 )
				end
			}
		} )
		Accent2:RegisterAnimationSequence( "Outro", {
			{
				function ()
					return self.Accent2:SetAlpha( 0.1, 0 )
				end,
				function ()
					return self.Accent2:SetAlpha( 0, 150 )
				end
			}
		} )
		self._sequences.Outro = function ()
			Ring:AnimateSequence( "Outro" )
			Accent1:AnimateSequence( "Outro" )
			Accent2:AnimateSequence( "Outro" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	self:SubscribeToModel( DataSources.inGame.SP.hackControlOutro:GetModel( f5_local1 ), function ()
		if DataSources.inGame.SP.hackControlOutro:GetValue( f5_local1 ) ~= nil and DataSources.inGame.SP.hackControlOutro:GetValue( f5_local1 ) == 2 then
			ACTIONS.AnimateSequence( self, "Outro" )
		end
	end )
	PostLoadFunc( self, f5_local1, controller )
	ACTIONS.AnimateSequence( self, "Off" )
	return self
end

MenuBuilder.registerType( "HackControlReticle", HackControlReticle )
LockTable( _M )
