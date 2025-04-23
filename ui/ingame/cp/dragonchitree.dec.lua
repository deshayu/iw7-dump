local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function dragonChiTree( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 899 * _1080p, 0, 252 * _1080p )
	self.id = "dragonChiTree"
	self._animationSets = {}
	self._sequences = {}
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local dragon3line = nil
	
	dragon3line = LUI.UIImage.new()
	dragon3line.id = "dragon3line"
	dragon3line:SetZRotation( 17, 0 )
	dragon3line:setImage( RegisterMaterial( "zm_dlc2_inventory_line" ), 0 )
	dragon3line:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 73.46, _1080p * 137.46, _1080p * 178.46, _1080p * 181.96 )
	self:addElement( dragon3line )
	self.dragon3line = dragon3line
	
	local dragon3back = nil
	
	dragon3back = LUI.UIImage.new()
	dragon3back.id = "dragon3back"
	dragon3back:SetZRotation( 5, 0 )
	dragon3back:SetScale( -0.64, 0 )
	dragon3back:setImage( RegisterMaterial( "zm_dlc2_dragon_skill_icon_3_off" ), 0 )
	dragon3back:SetUseAA( true )
	dragon3back:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 128, _1080p * 123.96, _1080p * 251.96 )
	dragon3back:BindAlphaToModel( DataSources.inGame.CP.zombies.dlc2.dragon3BackingAlphaFilter:GetModel( f1_local1 ) )
	self:addElement( dragon3back )
	self.dragon3back = dragon3back
	
	local dragon3 = nil
	
	dragon3 = LUI.UIImage.new()
	dragon3.id = "dragon3"
	dragon3:SetZRotation( 5, 0 )
	dragon3:SetScale( -0.64, 0 )
	dragon3:setImage( RegisterMaterial( "zm_dlc2_dragon_skill_icon_3" ), 0 )
	dragon3:SetBlendMode( BLEND_MODE.blend )
	dragon3:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 128, _1080p * 123.96, _1080p * 251.96 )
	dragon3:BindAlphaToModel( DataSources.inGame.CP.zombies.dlc2.dragon3AlphaFilter:GetModel( f1_local1 ) )
	self:addElement( dragon3 )
	self.dragon3 = dragon3
	
	local dragon2line = nil
	
	dragon2line = LUI.UIImage.new()
	dragon2line.id = "dragon2line"
	dragon2line:setImage( RegisterMaterial( "zm_dlc2_inventory_line" ), 0 )
	dragon2line:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 69.46, _1080p * 133.46, _1080p * 128.04, _1080p * 131.54 )
	self:addElement( dragon2line )
	self.dragon2line = dragon2line
	
	local dragon2back = nil
	
	dragon2back = LUI.UIImage.new()
	dragon2back.id = "dragon2back"
	dragon2back:SetZRotation( -7, 0 )
	dragon2back:SetScale( -0.64, 0 )
	dragon2back:setImage( RegisterMaterial( "zm_dlc2_dragon_skill_icon_2_off" ), 0 )
	dragon2back:SetUseAA( true )
	dragon2back:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 128, _1080p * 64, _1080p * 192 )
	dragon2back:BindAlphaToModel( DataSources.inGame.CP.zombies.dlc2.dragon2BackingAlphaFilter:GetModel( f1_local1 ) )
	self:addElement( dragon2back )
	self.dragon2back = dragon2back
	
	local dragon2 = nil
	
	dragon2 = LUI.UIImage.new()
	dragon2.id = "dragon2"
	dragon2:SetZRotation( -4, 0 )
	dragon2:SetScale( -0.64, 0 )
	dragon2:setImage( RegisterMaterial( "zm_dlc2_dragon_skill_icon_2" ), 0 )
	dragon2:SetBlendMode( BLEND_MODE.blend )
	dragon2:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 128, _1080p * 64, _1080p * 192 )
	dragon2:BindAlphaToModel( DataSources.inGame.CP.zombies.dlc2.dragon2AlphaFilter:GetModel( f1_local1 ) )
	self:addElement( dragon2 )
	self.dragon2 = dragon2
	
	local dragon1line = nil
	
	dragon1line = LUI.UIImage.new()
	dragon1line.id = "dragon1line"
	dragon1line:SetZRotation( -17, 0 )
	dragon1line:setImage( RegisterMaterial( "zm_dlc2_inventory_line" ), 0 )
	dragon1line:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 79.46, _1080p * 143.46, _1080p * 69.54, _1080p * 73.54 )
	self:addElement( dragon1line )
	self.dragon1line = dragon1line
	
	local dragon1back = nil
	
	dragon1back = LUI.UIImage.new()
	dragon1back.id = "dragon1back"
	dragon1back:SetZRotation( 5, 0 )
	dragon1back:SetScale( -0.64, 0 )
	dragon1back:setImage( RegisterMaterial( "zm_dlc2_dragon_skill_icon_1_off" ), 0 )
	dragon1back:SetUseAA( true )
	dragon1back:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 128, 0, _1080p * 128 )
	dragon1back:BindAlphaToModel( DataSources.inGame.CP.zombies.dlc2.dragon1BackingAlphaFilter:GetModel( f1_local1 ) )
	self:addElement( dragon1back )
	self.dragon1back = dragon1back
	
	local dragon1 = nil
	
	dragon1 = LUI.UIImage.new()
	dragon1.id = "dragon1"
	dragon1:SetZRotation( 4, 0 )
	dragon1:SetScale( -0.64, 0 )
	dragon1:setImage( RegisterMaterial( "zm_dlc2_dragon_skill_icon_1" ), 0 )
	dragon1:SetBlendMode( BLEND_MODE.blend )
	dragon1:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 128, 0, _1080p * 128 )
	dragon1:BindAlphaToModel( DataSources.inGame.CP.zombies.dlc2.dragon1AlphaFilter:GetModel( f1_local1 ) )
	self:addElement( dragon1 )
	self.dragon1 = dragon1
	
	local dragonGlow = nil
	
	dragonGlow = LUI.UIImage.new()
	dragonGlow.id = "dragonGlow"
	dragonGlow:SetScale( 0.49, 0 )
	dragonGlow:setImage( RegisterMaterial( "zm_dlc2_inventory_dragon_glow" ), 0 )
	dragonGlow:SetUseAA( true )
	dragonGlow:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 98.28, _1080p * 226.28, _1080p * 61, _1080p * 189 )
	dragonGlow:BindAlphaToModel( DataSources.inGame.CP.zombies.dlc2.chiStyleInvDragonGlowFilter:GetModel( f1_local1 ) )
	self:addElement( dragonGlow )
	self.dragonGlow = dragonGlow
	
	local Dragon = nil
	
	Dragon = LUI.UIImage.new()
	Dragon.id = "Dragon"
	Dragon:SetScale( 0.5, 0 )
	Dragon:setImage( RegisterMaterial( "zm_dlc2_inventory_dragon" ), 0 )
	Dragon:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 95.96, _1080p * 223.96, _1080p * 64, _1080p * 192 )
	Dragon:BindAlphaToModel( DataSources.inGame.CP.zombies.dlc2.chiStyleInvDragonAlphaFilter:GetModel( f1_local1 ) )
	self:addElement( Dragon )
	self.Dragon = Dragon
	
	local dragonI = nil
	
	dragonI = LUI.UIImage.new()
	dragonI.id = "dragonI"
	dragonI:SetScale( -0.35, 0 )
	dragonI:setImage( RegisterMaterial( "zm_dlc2_inventory_i" ), 0 )
	dragonI:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 30.54, _1080p * 62.54, _1080p * 49.04, _1080p * 81.04 )
	self:addElement( dragonI )
	self.dragonI = dragonI
	
	local dragonII = nil
	
	dragonII = LUI.UIImage.new()
	dragonII.id = "dragonII"
	dragonII:SetScale( -0.35, 0 )
	dragonII:setImage( RegisterMaterial( "zm_dlc2_inventory_ii" ), 0 )
	dragonII:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 24.94, _1080p * 56.94, _1080p * 111.14, _1080p * 143.14 )
	self:addElement( dragonII )
	self.dragonII = dragonII
	
	local dragonIII = nil
	
	dragonIII = LUI.UIImage.new()
	dragonIII.id = "dragonIII"
	dragonIII:SetScale( -0.35, 0 )
	dragonIII:setImage( RegisterMaterial( "zm_dlc2_inventory_iii" ), 0 )
	dragonIII:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 30.54, _1080p * 62.54, _1080p * 189.34, _1080p * 221.34 )
	self:addElement( dragonIII )
	self.dragonIII = dragonIII
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		dragonGlow:RegisterAnimationSequence( "GlowPulse", {
			{
				function ()
					return self.dragonGlow:SetScale( 0.65, 0 )
				end,
				function ()
					return self.dragonGlow:SetScale( 0.3, 2000 )
				end,
				function ()
					return self.dragonGlow:SetScale( 0.65, 2000 )
				end
			}
		} )
		self._sequences.GlowPulse = function ()
			dragonGlow:AnimateLoop( "GlowPulse" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	ACTIONS.AnimateSequence( self, "GlowPulse" )
	return self
end

MenuBuilder.registerType( "dragonChiTree", dragonChiTree )
LockTable( _M )
