local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function tigerChiTree( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 899 * _1080p, 0, 252 * _1080p )
	self.id = "tigerChiTree"
	self._animationSets = {}
	self._sequences = {}
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local tiger3line = nil
	
	tiger3line = LUI.UIImage.new()
	tiger3line.id = "tiger3line"
	tiger3line:SetZRotation( 34, 0 )
	tiger3line:setImage( RegisterMaterial( "zm_dlc2_inventory_line" ), 0 )
	tiger3line:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 74.96, _1080p * 138.96, _1080p * 171.92, _1080p * 175.92 )
	self:addElement( tiger3line )
	self.tiger3line = tiger3line
	
	local tiger3back = nil
	
	tiger3back = LUI.UIImage.new()
	tiger3back.id = "tiger3back"
	tiger3back:SetZRotation( -2, 0 )
	tiger3back:SetScale( -0.64, 0 )
	tiger3back:setImage( RegisterMaterial( "zm_dlc2_dragon_skill_icon_3_off" ), 0 )
	tiger3back:SetUseAA( true )
	tiger3back:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 128, _1080p * 123.96, _1080p * 251.96 )
	tiger3back:BindAlphaToModel( DataSources.inGame.CP.zombies.dlc2.tiger3BackingAlphaFilter:GetModel( f1_local1 ) )
	self:addElement( tiger3back )
	self.tiger3back = tiger3back
	
	local tiger3 = nil
	
	tiger3 = LUI.UIImage.new()
	tiger3.id = "tiger3"
	tiger3:SetZRotation( -2, 0 )
	tiger3:SetScale( -0.64, 0 )
	tiger3:setImage( RegisterMaterial( "zm_dlc2_tiger_skill_icon_3" ), 0 )
	tiger3:SetBlendMode( BLEND_MODE.blend )
	tiger3:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 128, _1080p * 123.96, _1080p * 251.96 )
	tiger3:BindAlphaToModel( DataSources.inGame.CP.zombies.dlc2.tiger3AlphaFilter:GetModel( f1_local1 ) )
	self:addElement( tiger3 )
	self.tiger3 = tiger3
	
	local tiger2back = nil
	
	tiger2back = LUI.UIImage.new()
	tiger2back.id = "tiger2back"
	tiger2back:SetZRotation( -1, 0 )
	tiger2back:SetScale( -0.64, 0 )
	tiger2back:setImage( RegisterMaterial( "zm_dlc2_dragon_skill_icon_2_off" ), 0 )
	tiger2back:SetUseAA( true )
	tiger2back:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 128, _1080p * 64, _1080p * 192 )
	tiger2back:BindAlphaToModel( DataSources.inGame.CP.zombies.dlc2.tiger2BackingAlphaFilter:GetModel( f1_local1 ) )
	self:addElement( tiger2back )
	self.tiger2back = tiger2back
	
	local tiger2line = nil
	
	tiger2line = LUI.UIImage.new()
	tiger2line.id = "tiger2line"
	tiger2line:SetZRotation( 4, 0 )
	tiger2line:setImage( RegisterMaterial( "zm_dlc2_inventory_line" ), 0 )
	tiger2line:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 71.96, _1080p * 135.96, _1080p * 122.5, _1080p * 126.5 )
	self:addElement( tiger2line )
	self.tiger2line = tiger2line
	
	local tiger2 = nil
	
	tiger2 = LUI.UIImage.new()
	tiger2.id = "tiger2"
	tiger2:SetZRotation( -1, 0 )
	tiger2:SetScale( -0.64, 0 )
	tiger2:setImage( RegisterMaterial( "zm_dlc2_tiger_skill_icon_2" ), 0 )
	tiger2:SetBlendMode( BLEND_MODE.blend )
	tiger2:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 128, _1080p * 64, _1080p * 192 )
	tiger2:BindAlphaToModel( DataSources.inGame.CP.zombies.dlc2.tiger2AlphaFilter:GetModel( f1_local1 ) )
	self:addElement( tiger2 )
	self.tiger2 = tiger2
	
	local tiger1line = nil
	
	tiger1line = LUI.UIImage.new()
	tiger1line.id = "tiger1line"
	tiger1line:SetZRotation( -13, 0 )
	tiger1line:setImage( RegisterMaterial( "zm_dlc2_inventory_line" ), 0 )
	tiger1line:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 74.96, _1080p * 138.96, _1080p * 69.5, _1080p * 73.5 )
	self:addElement( tiger1line )
	self.tiger1line = tiger1line
	
	local tiger1back = nil
	
	tiger1back = LUI.UIImage.new()
	tiger1back.id = "tiger1back"
	tiger1back:SetZRotation( -4, 0 )
	tiger1back:SetScale( -0.64, 0 )
	tiger1back:setImage( RegisterMaterial( "zm_dlc2_dragon_skill_icon_1_off" ), 0 )
	tiger1back:SetUseAA( true )
	tiger1back:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 128, 0, _1080p * 128 )
	tiger1back:BindAlphaToModel( DataSources.inGame.CP.zombies.dlc2.tiger1BackingAlphaFilter:GetModel( f1_local1 ) )
	self:addElement( tiger1back )
	self.tiger1back = tiger1back
	
	local tiger1 = nil
	
	tiger1 = LUI.UIImage.new()
	tiger1.id = "tiger1"
	tiger1:SetZRotation( -4, 0 )
	tiger1:SetScale( -0.64, 0 )
	tiger1:setImage( RegisterMaterial( "zm_dlc2_tiger_skill_icon_1" ), 0 )
	tiger1:SetBlendMode( BLEND_MODE.blend )
	tiger1:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 128, 0, _1080p * 128 )
	tiger1:BindAlphaToModel( DataSources.inGame.CP.zombies.dlc2.tiger1AlphaFilter:GetModel( f1_local1 ) )
	self:addElement( tiger1 )
	self.tiger1 = tiger1
	
	local tigerGlow = nil
	
	tigerGlow = LUI.UIImage.new()
	tigerGlow.id = "tigerGlow"
	tigerGlow:SetScale( 0.5, 0 )
	tigerGlow:setImage( RegisterMaterial( "zm_dlc2_inventory_tiger_glow" ), 0 )
	tigerGlow:SetUseAA( true )
	tigerGlow:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 96, _1080p * 224, _1080p * 63, _1080p * 191 )
	tigerGlow:BindAlphaToModel( DataSources.inGame.CP.zombies.dlc2.chiStyleInvTigerGlowFilter:GetModel( f1_local1 ) )
	self:addElement( tigerGlow )
	self.tigerGlow = tigerGlow
	
	local Tiger = nil
	
	Tiger = LUI.UIImage.new()
	Tiger.id = "Tiger"
	Tiger:SetScale( 0.5, 0 )
	Tiger:setImage( RegisterMaterial( "zm_dlc2_inventory_tiger" ), 0 )
	Tiger:SetUseAA( true )
	Tiger:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 95, _1080p * 223, _1080p * 64, _1080p * 192 )
	Tiger:BindAlphaToModel( DataSources.inGame.CP.zombies.dlc2.chiStyleInvTigerAlphaFilter:GetModel( f1_local1 ) )
	self:addElement( Tiger )
	self.Tiger = Tiger
	
	local tigerI = nil
	
	tigerI = LUI.UIImage.new()
	tigerI.id = "tigerI"
	tigerI:SetScale( -0.35, 0 )
	tigerI:setImage( RegisterMaterial( "zm_dlc2_inventory_i" ), 0 )
	tigerI:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 27.04, _1080p * 59.04, _1080p * 48, _1080p * 80 )
	self:addElement( tigerI )
	self.tigerI = tigerI
	
	local tigerII = nil
	
	tigerII = LUI.UIImage.new()
	tigerII.id = "tigerII"
	tigerII:SetScale( -0.35, 0 )
	tigerII:setImage( RegisterMaterial( "zm_dlc2_inventory_ii" ), 0 )
	tigerII:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 27.04, _1080p * 59.04, _1080p * 126.1, _1080p * 158.1 )
	self:addElement( tigerII )
	self.tigerII = tigerII
	
	local tigerIII = nil
	
	tigerIII = LUI.UIImage.new()
	tigerIII.id = "tigerIII"
	tigerIII:SetScale( -0.35, 0 )
	tigerIII:setImage( RegisterMaterial( "zm_dlc2_inventory_iii" ), 0 )
	tigerIII:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 27.04, _1080p * 59.04, _1080p * 164.6, _1080p * 196.6 )
	self:addElement( tigerIII )
	self.tigerIII = tigerIII
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		tigerGlow:RegisterAnimationSequence( "GlowPulse", {
			{
				function ()
					return self.tigerGlow:SetScale( 0.65, 0 )
				end,
				function ()
					return self.tigerGlow:SetScale( 0.3, 2000 )
				end,
				function ()
					return self.tigerGlow:SetScale( 0.65, 2000 )
				end
			}
		} )
		self._sequences.GlowPulse = function ()
			tigerGlow:AnimateLoop( "GlowPulse" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	ACTIONS.AnimateSequence( self, "GlowPulse" )
	return self
end

MenuBuilder.registerType( "tigerChiTree", tigerChiTree )
LockTable( _M )
