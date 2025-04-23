local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function craneChiTree( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 899 * _1080p, 0, 252 * _1080p )
	self.id = "craneChiTree"
	self._animationSets = {}
	self._sequences = {}
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local crane3line = nil
	
	crane3line = LUI.UIImage.new()
	crane3line.id = "crane3line"
	crane3line:SetZRotation( 30, 0 )
	crane3line:setImage( RegisterMaterial( "zm_dlc2_inventory_line" ), 0 )
	crane3line:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 62.5, _1080p * 170.5, _1080p * 158.38, _1080p * 162.38 )
	self:addElement( crane3line )
	self.crane3line = crane3line
	
	local crane3back = nil
	
	crane3back = LUI.UIImage.new()
	crane3back.id = "crane3back"
	crane3back:SetZRotation( 4, 0 )
	crane3back:SetScale( -0.64, 0 )
	crane3back:setImage( RegisterMaterial( "zm_dlc2_dragon_skill_icon_3_off" ), 0 )
	crane3back:SetUseAA( true )
	crane3back:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 128, _1080p * 123.96, _1080p * 251.96 )
	crane3back:BindAlphaToModel( DataSources.inGame.CP.zombies.dlc2.crane3BackingAlphaFilter:GetModel( f1_local1 ) )
	self:addElement( crane3back )
	self.crane3back = crane3back
	
	local crane3 = nil
	
	crane3 = LUI.UIImage.new()
	crane3.id = "crane3"
	crane3:SetZRotation( 4, 0 )
	crane3:SetScale( -0.64, 0 )
	crane3:setImage( RegisterMaterial( "zm_dlc2_crane_skill_icon_3" ), 0 )
	crane3:SetBlendMode( BLEND_MODE.blend )
	crane3:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 128, _1080p * 123.96, _1080p * 251.96 )
	crane3:BindAlphaToModel( DataSources.inGame.CP.zombies.dlc2.crane3AlphaFilter:GetModel( f1_local1 ) )
	self:addElement( crane3 )
	self.crane3 = crane3
	
	local crane2back = nil
	
	crane2back = LUI.UIImage.new()
	crane2back.id = "crane2back"
	crane2back:SetZRotation( -5, 0 )
	crane2back:SetScale( -0.64, 0 )
	crane2back:setImage( RegisterMaterial( "zm_dlc2_dragon_skill_icon_2_off" ), 0 )
	crane2back:SetUseAA( true )
	crane2back:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 128, _1080p * 64, _1080p * 192 )
	crane2back:BindAlphaToModel( DataSources.inGame.CP.zombies.dlc2.crane2BackingAlphaFilter:GetModel( f1_local1 ) )
	self:addElement( crane2back )
	self.crane2back = crane2back
	
	local crane2line = nil
	
	crane2line = LUI.UIImage.new()
	crane2line.id = "crane2line"
	crane2line:SetZRotation( 1, 0 )
	crane2line:setImage( RegisterMaterial( "zm_dlc2_inventory_line" ), 0 )
	crane2line:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 80.5, _1080p * 144.5, _1080p * 126, _1080p * 130 )
	self:addElement( crane2line )
	self.crane2line = crane2line
	
	local crane2 = nil
	
	crane2 = LUI.UIImage.new()
	crane2.id = "crane2"
	crane2:SetZRotation( -5, 0 )
	crane2:SetScale( -0.64, 0 )
	crane2:setImage( RegisterMaterial( "zm_dlc2_crane_skill_icon_2" ), 0 )
	crane2:SetBlendMode( BLEND_MODE.blend )
	crane2:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 128, _1080p * 64, _1080p * 192 )
	crane2:BindAlphaToModel( DataSources.inGame.CP.zombies.dlc2.crane2AlphaFilter:GetModel( f1_local1 ) )
	self:addElement( crane2 )
	self.crane2 = crane2
	
	local crane1line = nil
	
	crane1line = LUI.UIImage.new()
	crane1line.id = "crane1line"
	crane1line:SetZRotation( -13, 0 )
	crane1line:setImage( RegisterMaterial( "zm_dlc2_inventory_line" ), 0 )
	crane1line:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 72.5, _1080p * 136.5, _1080p * 65.96, _1080p * 69.96 )
	self:addElement( crane1line )
	self.crane1line = crane1line
	
	local crane1back = nil
	
	crane1back = LUI.UIImage.new()
	crane1back.id = "crane1back"
	crane1back:SetZRotation( 15, 0 )
	crane1back:SetScale( -0.64, 0 )
	crane1back:setImage( RegisterMaterial( "zm_dlc2_dragon_skill_icon_1_off" ), 0 )
	crane1back:SetUseAA( true )
	crane1back:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 128, 0, _1080p * 128 )
	crane1back:BindAlphaToModel( DataSources.inGame.CP.zombies.dlc2.crane1BackingAlphaFilter:GetModel( f1_local1 ) )
	self:addElement( crane1back )
	self.crane1back = crane1back
	
	local crane1 = nil
	
	crane1 = LUI.UIImage.new()
	crane1.id = "crane1"
	crane1:SetZRotation( 15, 0 )
	crane1:SetScale( -0.64, 0 )
	crane1:setImage( RegisterMaterial( "zm_dlc2_crane_skill_icon_1" ), 0 )
	crane1:SetBlendMode( BLEND_MODE.blend )
	crane1:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 128, 0, _1080p * 128 )
	crane1:BindAlphaToModel( DataSources.inGame.CP.zombies.dlc2.crane1AlphaFilter:GetModel( f1_local1 ) )
	self:addElement( crane1 )
	self.crane1 = crane1
	
	local craneGlow = nil
	
	craneGlow = LUI.UIImage.new()
	craneGlow.id = "craneGlow"
	craneGlow:SetScale( 0.5, 0 )
	craneGlow:setImage( RegisterMaterial( "zm_dlc2_inventory_crane_glow" ), 0 )
	craneGlow:SetUseAA( true )
	craneGlow:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 95, _1080p * 223, _1080p * 54.92, _1080p * 182.92 )
	craneGlow:BindAlphaToModel( DataSources.inGame.CP.zombies.dlc2.chiStyleInvCraneGlowFilter:GetModel( f1_local1 ) )
	self:addElement( craneGlow )
	self.craneGlow = craneGlow
	
	local Crane = nil
	
	Crane = LUI.UIImage.new()
	Crane.id = "Crane"
	Crane:SetScale( 0.5, 0 )
	Crane:setImage( RegisterMaterial( "zm_dlc2_inventory_crane" ), 0 )
	Crane:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 95, _1080p * 223, _1080p * 54.92, _1080p * 182.92 )
	Crane:BindAlphaToModel( DataSources.inGame.CP.zombies.dlc2.chiStyleInvCraneAlphaFilter:GetModel( f1_local1 ) )
	self:addElement( Crane )
	self.Crane = Crane
	
	local craneI = nil
	
	craneI = LUI.UIImage.new()
	craneI.id = "craneI"
	craneI:SetScale( -0.35, 0 )
	craneI:setImage( RegisterMaterial( "zm_dlc2_inventory_i" ), 0 )
	craneI:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 21, _1080p * 53, _1080p * 46.42, _1080p * 78.42 )
	self:addElement( craneI )
	self.craneI = craneI
	
	local craneII = nil
	
	craneII = LUI.UIImage.new()
	craneII.id = "craneII"
	craneII:SetScale( -0.35, 0 )
	craneII:setImage( RegisterMaterial( "zm_dlc2_inventory_ii" ), 0 )
	craneII:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 26.6, _1080p * 58.6, _1080p * 112.56, _1080p * 144.56 )
	self:addElement( craneII )
	self.craneII = craneII
	
	local craneIII = nil
	
	craneIII = LUI.UIImage.new()
	craneIII.id = "craneIII"
	craneIII:SetScale( -0.35, 0 )
	craneIII:setImage( RegisterMaterial( "zm_dlc2_inventory_iii" ), 0 )
	craneIII:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 26.6, _1080p * 58.6, _1080p * 182.36, _1080p * 214.36 )
	self:addElement( craneIII )
	self.craneIII = craneIII
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		craneGlow:RegisterAnimationSequence( "GlowPulse", {
			{
				function ()
					return self.craneGlow:SetScale( 0.65, 0 )
				end,
				function ()
					return self.craneGlow:SetScale( 0.3, 2000 )
				end,
				function ()
					return self.craneGlow:SetScale( 0.65, 2000 )
				end
			}
		} )
		self._sequences.GlowPulse = function ()
			craneGlow:AnimateLoop( "GlowPulse" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	ACTIONS.AnimateSequence( self, "GlowPulse" )
	return self
end

MenuBuilder.registerType( "craneChiTree", craneChiTree )
LockTable( _M )
