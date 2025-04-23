local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function ApexArtificialHorizon( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 1428 * _1080p, 0, 688 * _1080p )
	self.id = "ApexArtificialHorizon"
	self._animationSets = {}
	self._sequences = {}
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local ReticleCircle = nil
	
	ReticleCircle = LUI.UIImage.new()
	ReticleCircle.id = "ReticleCircle"
	ReticleCircle:setImage( RegisterMaterial( "hud_apex_reticle_circle" ), 0 )
	ReticleCircle:SetBlendMode( BLEND_MODE.addWithAlpha )
	ReticleCircle:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -250, _1080p * 250, _1080p * -250, _1080p * 250 )
	self:addElement( ReticleCircle )
	self.ReticleCircle = ReticleCircle
	
	local MissileIconTL = nil
	
	MissileIconTL = LUI.UIImage.new()
	MissileIconTL.id = "MissileIconTL"
	MissileIconTL:setImage( RegisterMaterial( "hud_apex_reticle_missile_icon" ), 0 )
	MissileIconTL:SetBlendMode( BLEND_MODE.addWithAlpha )
	MissileIconTL:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -317, _1080p * -253, _1080p * -109, _1080p * -45 )
	self:addElement( MissileIconTL )
	self.MissileIconTL = MissileIconTL
	
	local MissileIconBL = nil
	
	MissileIconBL = LUI.UIImage.new()
	MissileIconBL.id = "MissileIconBL"
	MissileIconBL:setImage( RegisterMaterial( "hud_apex_reticle_missile_icon" ), 0 )
	MissileIconBL:SetBlendMode( BLEND_MODE.addWithAlpha )
	MissileIconBL:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -317, _1080p * -253, _1080p * 45, _1080p * 109 )
	self:addElement( MissileIconBL )
	self.MissileIconBL = MissileIconBL
	
	local MissileIconTR = nil
	
	MissileIconTR = LUI.UIImage.new()
	MissileIconTR.id = "MissileIconTR"
	MissileIconTR:setImage( RegisterMaterial( "hud_apex_reticle_missile_icon" ), 0 )
	MissileIconTR:SetBlendMode( BLEND_MODE.addWithAlpha )
	MissileIconTR:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 253, _1080p * 317, _1080p * -109, _1080p * -45 )
	self:addElement( MissileIconTR )
	self.MissileIconTR = MissileIconTR
	
	local MissileIconBR = nil
	
	MissileIconBR = LUI.UIImage.new()
	MissileIconBR.id = "MissileIconBR"
	MissileIconBR:setImage( RegisterMaterial( "hud_apex_reticle_missile_icon" ), 0 )
	MissileIconBR:SetBlendMode( BLEND_MODE.addWithAlpha )
	MissileIconBR:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 253, _1080p * 317, _1080p * 45, _1080p * 109 )
	self:addElement( MissileIconBR )
	self.MissileIconBR = MissileIconBR
	
	local DottedLineLeft = nil
	
	DottedLineLeft = LUI.UIImage.new()
	DottedLineLeft.id = "DottedLineLeft"
	DottedLineLeft:setImage( RegisterMaterial( "hud_apex_reticle_dots" ), 0 )
	DottedLineLeft:SetBlendMode( BLEND_MODE.addWithAlpha )
	DottedLineLeft:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -712, _1080p * -327, _1080p * -8, _1080p * 8 )
	self:addElement( DottedLineLeft )
	self.DottedLineLeft = DottedLineLeft
	
	local DottedLineRight = nil
	
	DottedLineRight = LUI.UIImage.new()
	DottedLineRight.id = "DottedLineRight"
	DottedLineRight:setImage( RegisterMaterial( "hud_apex_reticle_dots" ), 0 )
	DottedLineRight:SetBlendMode( BLEND_MODE.addWithAlpha )
	DottedLineRight:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 327, _1080p * 712, _1080p * -8, _1080p * 8 )
	self:addElement( DottedLineRight )
	self.DottedLineRight = DottedLineRight
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		MissileIconTL:RegisterAnimationSequence( "Reloading", {
			{
				function ()
					return self.MissileIconTL:setImage( RegisterMaterial( "hud_apex_reticle_missile_icon" ), 0 )
				end,
				function ()
					return self.MissileIconTL:setImage( RegisterMaterial( "hud_apex_reticle_missile_icon_disabled" ), 250 )
				end,
				function ()
					return self.MissileIconTL:setImage( RegisterMaterial( "hud_apex_reticle_missile_icon" ), 2850 )
				end
			},
			{
				function ()
					return self.MissileIconTL:SetAlpha( 1, 3080 )
				end,
				function ()
					return self.MissileIconTL:SetAlpha( 0, 20 )
				end,
				function ()
					return self.MissileIconTL:SetAlpha( 1, 310 )
				end
			}
		} )
		MissileIconBL:RegisterAnimationSequence( "Reloading", {
			{
				function ()
					return self.MissileIconBL:setImage( RegisterMaterial( "hud_apex_reticle_missile_icon" ), 0 )
				end,
				function ()
					return self.MissileIconBL:setImage( RegisterMaterial( "hud_apex_reticle_missile_icon_disabled" ), 650 )
				end,
				function ()
					return self.MissileIconBL:setImage( RegisterMaterial( "hud_apex_reticle_missile_icon" ), 3350 )
				end
			},
			{
				function ()
					return self.MissileIconBL:SetAlpha( 1, 3980 )
				end,
				function ()
					return self.MissileIconBL:SetAlpha( 0, 20 )
				end,
				function ()
					return self.MissileIconBL:SetAlpha( 1, 200 )
				end
			}
		} )
		MissileIconTR:RegisterAnimationSequence( "Reloading", {
			{
				function ()
					return self.MissileIconTR:setImage( RegisterMaterial( "hud_apex_reticle_missile_icon_disabled" ), 0 )
				end,
				function ()
					return self.MissileIconTR:setImage( RegisterMaterial( "hud_apex_reticle_missile_icon" ), 3400 )
				end
			},
			{
				function ()
					return self.MissileIconTR:SetAlpha( 1, 3380 )
				end,
				function ()
					return self.MissileIconTR:SetAlpha( 0, 20 )
				end,
				function ()
					return self.MissileIconTR:SetAlpha( 1, 350 )
				end
			}
		} )
		MissileIconBR:RegisterAnimationSequence( "Reloading", {
			{
				function ()
					return self.MissileIconBR:setImage( RegisterMaterial( "hud_apex_reticle_missile_icon" ), 0 )
				end,
				function ()
					return self.MissileIconBR:setImage( RegisterMaterial( "hud_apex_reticle_missile_icon_disabled" ), 450 )
				end,
				function ()
					return self.MissileIconBR:setImage( RegisterMaterial( "hud_apex_reticle_missile_icon" ), 3300 )
				end
			},
			{
				function ()
					return self.MissileIconBR:SetAlpha( 1, 3730 )
				end,
				function ()
					return self.MissileIconBR:SetAlpha( 0, 20 )
				end,
				function ()
					return self.MissileIconBR:SetAlpha( 1, 250 )
				end
			}
		} )
		self._sequences.Reloading = function ()
			MissileIconTL:AnimateSequence( "Reloading" )
			MissileIconBL:AnimateSequence( "Reloading" )
			MissileIconTR:AnimateSequence( "Reloading" )
			MissileIconBR:AnimateSequence( "Reloading" )
		end
		
		MissileIconTL:RegisterAnimationSequence( "Reloading2", {
			{
				function ()
					return self.MissileIconTL:setImage( RegisterMaterial( "hud_apex_reticle_missile_icon" ), 0 )
				end,
				function ()
					return self.MissileIconTL:setImage( RegisterMaterial( "hud_apex_reticle_missile_icon_disabled" ), 250 )
				end,
				function ()
					return self.MissileIconTL:setImage( RegisterMaterial( "hud_apex_reticle_missile_icon" ), 3750 )
				end
			},
			{
				function ()
					return self.MissileIconTL:SetAlpha( 1, 3980 )
				end,
				function ()
					return self.MissileIconTL:SetAlpha( 0, 20 )
				end,
				function ()
					return self.MissileIconTL:SetAlpha( 1, 310 )
				end
			}
		} )
		MissileIconBL:RegisterAnimationSequence( "Reloading2", {
			{
				function ()
					return self.MissileIconBL:setImage( RegisterMaterial( "hud_apex_reticle_missile_icon" ), 0 )
				end,
				function ()
					return self.MissileIconBL:setImage( RegisterMaterial( "hud_apex_reticle_missile_icon_disabled" ), 650 )
				end,
				function ()
					return self.MissileIconBL:setImage( RegisterMaterial( "hud_apex_reticle_missile_icon" ), 4250 )
				end
			},
			{
				function ()
					return self.MissileIconBL:SetAlpha( 1, 4880 )
				end,
				function ()
					return self.MissileIconBL:SetAlpha( 0, 20 )
				end,
				function ()
					return self.MissileIconBL:SetAlpha( 1, 200 )
				end
			}
		} )
		MissileIconTR:RegisterAnimationSequence( "Reloading2", {
			{
				function ()
					return self.MissileIconTR:setImage( RegisterMaterial( "hud_apex_reticle_missile_icon_disabled" ), 0 )
				end,
				function ()
					return self.MissileIconTR:setImage( RegisterMaterial( "hud_apex_reticle_missile_icon" ), 4300 )
				end
			},
			{
				function ()
					return self.MissileIconTR:SetAlpha( 1, 4280 )
				end,
				function ()
					return self.MissileIconTR:SetAlpha( 0, 20 )
				end,
				function ()
					return self.MissileIconTR:SetAlpha( 1, 350 )
				end
			}
		} )
		MissileIconBR:RegisterAnimationSequence( "Reloading2", {
			{
				function ()
					return self.MissileIconBR:setImage( RegisterMaterial( "hud_apex_reticle_missile_icon" ), 0 )
				end,
				function ()
					return self.MissileIconBR:setImage( RegisterMaterial( "hud_apex_reticle_missile_icon_disabled" ), 450 )
				end,
				function ()
					return self.MissileIconBR:setImage( RegisterMaterial( "hud_apex_reticle_missile_icon" ), 4200 )
				end
			},
			{
				function ()
					return self.MissileIconBR:SetAlpha( 1, 4630 )
				end,
				function ()
					return self.MissileIconBR:SetAlpha( 0, 20 )
				end,
				function ()
					return self.MissileIconBR:SetAlpha( 1, 250 )
				end
			}
		} )
		self._sequences.Reloading2 = function ()
			MissileIconTL:AnimateSequence( "Reloading2" )
			MissileIconBL:AnimateSequence( "Reloading2" )
			MissileIconTR:AnimateSequence( "Reloading2" )
			MissileIconBR:AnimateSequence( "Reloading2" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	self:SubscribeToModel( DataSources.inGame.MP.scorestreakHuds.miniJackalReload:GetModel( f1_local1 ), function ()
		if DataSources.inGame.MP.scorestreakHuds.miniJackalReload:GetValue( f1_local1 ) ~= nil and DataSources.inGame.MP.scorestreakHuds.miniJackalReload:GetValue( f1_local1 ) == true then
			ACTIONS.AnimateSequence( self, "Reloading" )
		end
	end )
	self:SubscribeToModel( DataSources.inGame.MP.scorestreakHuds.miniJackalReloadLong:GetModel( f1_local1 ), function ()
		if DataSources.inGame.MP.scorestreakHuds.miniJackalReloadLong:GetValue( f1_local1 ) ~= nil and DataSources.inGame.MP.scorestreakHuds.miniJackalReloadLong:GetValue( f1_local1 ) == true then
			ACTIONS.AnimateSequence( self, "Reloading2" )
		end
	end )
	return self
end

MenuBuilder.registerType( "ApexArtificialHorizon", ApexArtificialHorizon )
LockTable( _M )
