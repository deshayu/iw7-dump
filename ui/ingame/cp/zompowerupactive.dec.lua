local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ( f1_arg0, f1_arg1, f1_arg2 )
	f1_arg0.PowerUpIcon:SubscribeToModel( DataSources.inGame.CP.zombies.powerups.activePowerupIcon:GetModel( f1_arg1 ), function ( f2_arg0 )
		local f2_local0 = DataModel.GetModelValue( f2_arg0 )
		if f2_local0 == nil or f2_local0 == "" then
			f2_local0 = "ui_default_white_multiply"
		end
		f1_arg0.PowerUpIcon:setImage( RegisterMaterial( f2_local0 ), 0 )
	end )
end

function ZomPowerupActive( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 352 * _1080p, 0, 204 * _1080p )
	self.id = "ZomPowerupActive"
	self._animationSets = {}
	self._sequences = {}
	local f3_local1 = controller and controller.controllerIndex
	if not f3_local1 and not Engine.InFrontend() then
		f3_local1 = self:getRootController()
	end
	assert( f3_local1 )
	local f3_local2 = self
	local Arcane = nil
	
	Arcane = LUI.UIImage.new()
	Arcane.id = "Arcane"
	Arcane:setImage( RegisterMaterial( "zm_tix_arcane_spinner" ), 0 )
	Arcane:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -79, _1080p * 433, _1080p * -193.5, _1080p * 318.5 )
	self:addElement( Arcane )
	self.Arcane = Arcane
	
	local GlowCopy0 = nil
	
	GlowCopy0 = LUI.UIImage.new()
	GlowCopy0.id = "GlowCopy0"
	GlowCopy0:SetScale( -0.14, 0 )
	GlowCopy0:setImage( RegisterMaterial( "zm_powerup_glow_element" ), 0 )
	GlowCopy0:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -79, _1080p * 433, _1080p * -193.5, _1080p * 318.5 )
	self:addElement( GlowCopy0 )
	self.GlowCopy0 = GlowCopy0
	
	local Glow = nil
	
	Glow = LUI.UIImage.new()
	Glow.id = "Glow"
	Glow:setImage( RegisterMaterial( "zm_powerup_glow_element" ), 0 )
	Glow:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -79, _1080p * 433, _1080p * -193.5, _1080p * 318.5 )
	self:addElement( Glow )
	self.Glow = Glow
	
	local PowerUpIcon = nil
	
	PowerUpIcon = LUI.UIImage.new()
	PowerUpIcon.id = "PowerUpIcon"
	PowerUpIcon:SetScale( 0.5, 0 )
	PowerUpIcon:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 121, _1080p * -119, _1080p * 8.5, _1080p * 116.5 )
	self:addElement( PowerUpIcon )
	self.PowerUpIcon = PowerUpIcon
	
	local PowerUpName = nil
	
	PowerUpName = LUI.UIText.new()
	PowerUpName.id = "PowerUpName"
	PowerUpName:SetFontSize( 36 * _1080p )
	PowerUpName:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	PowerUpName:SetAlignment( LUI.Alignment.Center )
	PowerUpName:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * -74, _1080p * 74, _1080p * 161.5, _1080p * 197.5 )
	PowerUpName:SubscribeToModel( DataSources.inGame.CP.zombies.powerups.activePowerupName:GetModel( f3_local1 ), function ()
		local f4_local0 = DataSources.inGame.CP.zombies.powerups.activePowerupName:GetValue( f3_local1 )
		if f4_local0 ~= nil then
			PowerUpName:setText( ToUpperCase( f4_local0 ), 0 )
		end
	end )
	self:addElement( PowerUpName )
	self.PowerUpName = PowerUpName
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		Arcane:RegisterAnimationSequence( "show", {
			{
				function ()
					return self.Arcane:SetAlpha( 0, 0 )
				end,
				function ()
					return self.Arcane:SetAlpha( 0, 310 )
				end,
				function ()
					return self.Arcane:SetAlpha( 0.75, 50 )
				end,
				function ()
					return self.Arcane:SetAlpha( 0.75, 420 )
				end,
				function ()
					return self.Arcane:SetAlpha( 0, 40 )
				end
			},
			{
				function ()
					return self.Arcane:SetZRotation( 0, 310 )
				end,
				function ()
					return self.Arcane:SetZRotation( 31.07, 510 )
				end
			},
			{
				function ()
					return self.Arcane:SetScale( -0.44, 330 )
				end
			}
		} )
		GlowCopy0:RegisterAnimationSequence( "show", {
			{
				function ()
					return self.GlowCopy0:SetAlpha( 0, 0 )
				end,
				function ()
					return self.GlowCopy0:SetAlpha( 0, 130 )
				end,
				function ()
					return self.GlowCopy0:SetAlpha( 1, 330 )
				end,
				function ()
					return self.GlowCopy0:SetAlpha( 0, 180 )
				end,
				function ()
					return self.GlowCopy0:SetAlpha( 0, 180 )
				end
			},
			{
				function ()
					return self.GlowCopy0:SetScale( -0.5, 0 )
				end,
				function ()
					return self.GlowCopy0:SetScale( -0.65, 130 )
				end,
				function ()
					return self.GlowCopy0:SetScale( -0.1, 120 )
				end,
				function ()
					return self.GlowCopy0:SetScale( -0.55, 270 )
				end,
				function ()
					return self.GlowCopy0:SetScale( -0.55, 300 )
				end
			},
			{
				function ()
					return self.GlowCopy0:SetZRotation( 84, 0 )
				end,
				function ()
					return self.GlowCopy0:SetZRotation( 146, 820 )
				end
			},
			{
				function ()
					return self.GlowCopy0:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -79, _1080p * 433, _1080p * -193.5, _1080p * 318.5, 819 )
				end
			}
		} )
		Glow:RegisterAnimationSequence( "show", {
			{
				function ()
					return self.Glow:SetAlpha( 0, 0 )
				end,
				function ()
					return self.Glow:SetAlpha( 0, 130 )
				end,
				function ()
					return self.Glow:SetAlpha( 0.75, 310 )
				end,
				function ()
					return self.Glow:SetAlpha( 1, 20 )
				end,
				function ()
					return self.Glow:SetAlpha( 0, 180 )
				end
			},
			{
				function ()
					return self.Glow:SetZRotation( 0, 0 )
				end,
				function ()
					return self.Glow:SetZRotation( 146, 820 )
				end
			},
			{
				function ()
					return self.Glow:SetScale( -0.65, 130 )
				end,
				function ()
					return self.Glow:SetScale( -0.1, 120 )
				end,
				function ()
					return self.Glow:SetScale( -0.14, 570 )
				end
			}
		} )
		PowerUpIcon:RegisterAnimationSequence( "show", {
			{
				function ()
					return self.PowerUpIcon:SetAlpha( 0, 0 )
				end,
				function ()
					return self.PowerUpIcon:SetAlpha( 0, 130 )
				end,
				function ()
					return self.PowerUpIcon:SetAlpha( 1, 50 )
				end,
				function ()
					return self.PowerUpIcon:SetAlpha( 1, 640 )
				end
			},
			{
				function ()
					return self.PowerUpIcon:SetScale( 0.5, 0 )
				end,
				function ()
					return self.PowerUpIcon:SetScale( 0.95, 160 )
				end,
				function ()
					return self.PowerUpIcon:SetScale( 1.25, 90 )
				end,
				function ()
					return self.PowerUpIcon:SetScale( 1.25, 380 )
				end,
				function ()
					return self.PowerUpIcon:SetScale( -0.25, 60 )
				end,
				function ()
					return self.PowerUpIcon:SetScale( -0.25, 130 )
				end
			},
			{
				function ()
					return self.PowerUpIcon:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 124, _1080p * -116, _1080p * 8.5, _1080p * 116.5, 0 )
				end
			}
		} )
		PowerUpName:RegisterAnimationSequence( "show", {
			{
				function ()
					return self.PowerUpName:SetAlpha( 0, 0 )
				end,
				function ()
					return self.PowerUpName:SetAlpha( 0, 130 )
				end,
				function ()
					return self.PowerUpName:SetAlpha( 1, 50 )
				end,
				function ()
					return self.PowerUpName:SetAlpha( 1, 640 )
				end
			},
			{
				function ()
					return self.PowerUpName:SetScale( 0.97, 180 )
				end,
				function ()
					return self.PowerUpName:SetScale( 0, 10 )
				end,
				function ()
					return self.PowerUpName:SetScale( 0, 70 )
				end,
				function ()
					return self.PowerUpName:SetScale( 0, 560 )
				end
			},
			{
				function ()
					return self.PowerUpName:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -74, _1080p * 426, _1080p * 161.5, _1080p * 197.5, 0 )
				end
			}
		} )
		self._sequences.show = function ()
			Arcane:AnimateSequence( "show" )
			GlowCopy0:AnimateSequence( "show" )
			Glow:AnimateSequence( "show" )
			PowerUpIcon:AnimateSequence( "show" )
			PowerUpName:AnimateSequence( "show" )
		end
		
		Arcane:RegisterAnimationSequence( "showfull", {
			{
				function ()
					return self.Arcane:SetAlpha( 0, 0 )
				end,
				function ()
					return self.Arcane:SetAlpha( 0, 310 )
				end,
				function ()
					return self.Arcane:SetAlpha( 0.75, 50 )
				end,
				function ()
					return self.Arcane:SetAlpha( 0.75, 310 )
				end,
				function ()
					return self.Arcane:SetAlpha( 0, 120 )
				end
			},
			{
				function ()
					return self.Arcane:SetZRotation( 0, 310 )
				end,
				function ()
					return self.Arcane:SetZRotation( 31.07, 360 )
				end,
				function ()
					return self.Arcane:SetZRotation( 82, 590 )
				end
			},
			{
				function ()
					return self.Arcane:SetScale( -0.44, 330 )
				end
			},
			{
				function ()
					return self.Arcane:SetYRotation( -14, 1270 )
				end
			}
		} )
		GlowCopy0:RegisterAnimationSequence( "showfull", {
			{
				function ()
					return self.GlowCopy0:SetAlpha( 0, 0 )
				end,
				function ()
					return self.GlowCopy0:SetAlpha( 0, 130 )
				end,
				function ()
					return self.GlowCopy0:SetAlpha( 1, 330 )
				end,
				function ()
					return self.GlowCopy0:SetAlpha( 0, 180 )
				end,
				function ()
					return self.GlowCopy0:SetAlpha( 0, 30 )
				end
			},
			{
				function ()
					return self.GlowCopy0:SetScale( -0.5, 0 )
				end,
				function ()
					return self.GlowCopy0:SetScale( -0.65, 130 )
				end,
				function ()
					return self.GlowCopy0:SetScale( -0.1, 230 )
				end,
				function ()
					return self.GlowCopy0:SetScale( -0.55, 160 )
				end,
				function ()
					return self.GlowCopy0:SetScale( -0.55, 150 )
				end
			},
			{
				function ()
					return self.GlowCopy0:SetZRotation( 84, 0 )
				end,
				function ()
					return self.GlowCopy0:SetZRotation( 231.65, 670 )
				end,
				function ()
					return self.GlowCopy0:SetZRotation( 441, 950 )
				end
			}
		} )
		Glow:RegisterAnimationSequence( "showfull", {
			{
				function ()
					return self.Glow:SetAlpha( 0, 0 )
				end,
				function ()
					return self.Glow:SetAlpha( 0, 130 )
				end,
				function ()
					return self.Glow:SetAlpha( 0.75, 310 )
				end,
				function ()
					return self.Glow:SetAlpha( 1, 20 )
				end,
				function ()
					return self.Glow:SetAlpha( 0, 180 )
				end,
				function ()
					return self.Glow:SetAlpha( 0, 30 )
				end
			},
			{
				function ()
					return self.Glow:SetScale( -0.65, 130 )
				end,
				function ()
					return self.Glow:SetScale( -0.1, 230 )
				end,
				function ()
					return self.Glow:SetScale( -0.14, 310 )
				end
			},
			{
				function ()
					return self.Glow:SetZRotation( 0, 130 )
				end,
				function ()
					return self.Glow:SetZRotation( 0, 540 )
				end
			}
		} )
		PowerUpIcon:RegisterAnimationSequence( "showfull", {
			{
				function ()
					return self.PowerUpIcon:SetAlpha( 0, 0 )
				end,
				function ()
					return self.PowerUpIcon:SetAlpha( 0, 130 )
				end,
				function ()
					return self.PowerUpIcon:SetAlpha( 1, 50 )
				end,
				function ()
					return self.PowerUpIcon:SetAlpha( 1, 490 )
				end,
				function ()
					return self.PowerUpIcon:SetAlpha( 1, 470 )
				end,
				function ()
					return self.PowerUpIcon:SetAlpha( 0, 90 )
				end
			},
			{
				function ()
					return self.PowerUpIcon:SetScale( 0.5, 0 )
				end,
				function ()
					return self.PowerUpIcon:SetScale( 0, 130 )
				end,
				function ()
					return self.PowerUpIcon:SetScale( 1.25, 230 )
				end,
				function ()
					return self.PowerUpIcon:SetScale( -0.45, 100 )
				end,
				function ()
					return self.PowerUpIcon:SetScale( -0.45, 210 )
				end
			},
			{
				function ()
					return self.PowerUpIcon:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 124, _1080p * -116, _1080p * 8.5, _1080p * 116.5, 0 )
				end,
				function ()
					return self.PowerUpIcon:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 122.21, _1080p * -117.79, _1080p * 8.5, _1080p * 116.5, 670 )
				end,
				function ()
					return self.PowerUpIcon:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * -717.79, _1080p * -957.79, _1080p * -529.5, _1080p * -421.5, 359 )
				end
			}
		} )
		PowerUpName:RegisterAnimationSequence( "showfull", {
			{
				function ()
					return self.PowerUpName:SetAlpha( 0, 0 )
				end,
				function ()
					return self.PowerUpName:SetAlpha( 0, 150 )
				end,
				function ()
					return self.PowerUpName:SetAlpha( 1, 10 )
				end,
				function ()
					return self.PowerUpName:SetAlpha( 1, 510 )
				end,
				function ()
					return self.PowerUpName:SetAlpha( 1, 520 )
				end,
				function ()
					return self.PowerUpName:SetAlpha( 0, 300 )
				end
			},
			{
				function ()
					return self.PowerUpName:SetScale( 0.97, 160 )
				end,
				function ()
					return self.PowerUpName:SetScale( 0, 20 )
				end,
				function ()
					return self.PowerUpName:SetScale( 1, 490 )
				end,
				function ()
					return self.PowerUpName:SetScale( 1.25, 710 )
				end
			}
		} )
		self._sequences.showfull = function ()
			Arcane:AnimateSequence( "showfull" )
			GlowCopy0:AnimateSequence( "showfull" )
			Glow:AnimateSequence( "showfull" )
			PowerUpIcon:AnimateSequence( "showfull" )
			PowerUpName:AnimateSequence( "showfull" )
		end
		
		Arcane:RegisterAnimationSequence( "initial", {
			{
				function ()
					return self.Arcane:SetAlpha( 0, 0 )
				end
			}
		} )
		GlowCopy0:RegisterAnimationSequence( "initial", {
			{
				function ()
					return self.GlowCopy0:SetAlpha( 0, 0 )
				end
			}
		} )
		Glow:RegisterAnimationSequence( "initial", {
			{
				function ()
					return self.Glow:SetAlpha( 0, 0 )
				end
			}
		} )
		PowerUpIcon:RegisterAnimationSequence( "initial", {
			{
				function ()
					return self.PowerUpIcon:SetAlpha( 0, 0 )
				end
			}
		} )
		PowerUpName:RegisterAnimationSequence( "initial", {
			{
				function ()
					return self.PowerUpName:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.initial = function ()
			Arcane:AnimateSequence( "initial" )
			GlowCopy0:AnimateSequence( "initial" )
			Glow:AnimateSequence( "initial" )
			PowerUpIcon:AnimateSequence( "initial" )
			PowerUpName:AnimateSequence( "initial" )
		end
		
		Arcane:RegisterAnimationSequence( "hideright", {
			{
				function ()
					return self.Arcane:SetAlpha( 0, 0 )
				end,
				function ()
					return self.Arcane:SetAlpha( 0, 120 )
				end
			},
			{
				function ()
					return self.Arcane:SetZRotation( 31.07, 0 )
				end,
				function ()
					return self.Arcane:SetZRotation( 82, 590 )
				end
			},
			{
				function ()
					return self.Arcane:SetScale( -0.44, 0 )
				end
			}
		} )
		GlowCopy0:RegisterAnimationSequence( "hideright", {
			{
				function ()
					return self.GlowCopy0:SetAlpha( 0, 0 )
				end
			}
		} )
		Glow:RegisterAnimationSequence( "hideright", {
			{
				function ()
					return self.Glow:SetAlpha( 0, 0 )
				end
			}
		} )
		PowerUpIcon:RegisterAnimationSequence( "hideright", {
			{
				function ()
					return self.PowerUpIcon:SetScale( -0.25, 0 )
				end,
				function ()
					return self.PowerUpIcon:SetScale( -0.45, 210 )
				end
			},
			{
				function ()
					return self.PowerUpIcon:SetAlpha( 1, 20 )
				end,
				function ()
					return self.PowerUpIcon:SetAlpha( 1, 190 )
				end,
				function ()
					return self.PowerUpIcon:SetAlpha( 0, 90 )
				end
			},
			{
				function ()
					return self.PowerUpIcon:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 122.21, _1080p * -117.79, _1080p * 8.5, _1080p * 116.5, 0 )
				end,
				function ()
					return self.PowerUpIcon:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 825.04, _1080p * 585.04, _1080p * -149.33, _1080p * -41.33, 300 )
				end
			}
		} )
		PowerUpName:RegisterAnimationSequence( "hideright", {
			{
				function ()
					return self.PowerUpName:SetScale( 0.25, 0 )
				end
			},
			{
				function ()
					return self.PowerUpName:SetAlpha( 1, 0 )
				end,
				function ()
					return self.PowerUpName:SetAlpha( 0, 460 )
				end,
				function ()
					return self.PowerUpName:SetAlpha( 0, 140 )
				end
			},
			{
				function ()
					return self.PowerUpName:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -74, _1080p * 426, _1080p * 161.5, _1080p * 197.5, 0 )
				end
			}
		} )
		self._sequences.hideright = function ()
			Arcane:AnimateSequence( "hideright" )
			GlowCopy0:AnimateSequence( "hideright" )
			Glow:AnimateSequence( "hideright" )
			PowerUpIcon:AnimateSequence( "hideright" )
			PowerUpName:AnimateSequence( "hideright" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	self:addEventHandler( "message_queue_show", function ( f144_arg0, f144_arg1 )
		local f144_local0 = f144_arg1.controller or f3_local1
		ACTIONS.AnimateSequence( self, "show" )
	end )
	self:addEventHandler( "message_queue_hide", function ( f145_arg0, f145_arg1 )
		local f145_local0 = f145_arg1.controller or f3_local1
		ACTIONS.AnimateSequence( self, "hideright" )
	end )
	f0_local0( self, f3_local1, controller )
	ACTIONS.AnimateSequence( self, "initial" )
	return self
end

MenuBuilder.registerType( "ZomPowerupActive", ZomPowerupActive )
LockTable( _M )
