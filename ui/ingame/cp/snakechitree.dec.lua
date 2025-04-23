local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function snakeChiTree( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 899 * _1080p, 0, 252 * _1080p )
	self.id = "snakeChiTree"
	self._animationSets = {}
	self._sequences = {}
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local snake3line = nil
	
	snake3line = LUI.UIImage.new()
	snake3line.id = "snake3line"
	snake3line:SetZRotation( 27, 0 )
	snake3line:setImage( RegisterMaterial( "zm_dlc2_inventory_line" ), 0 )
	snake3line:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 70.96, _1080p * 134.96, _1080p * 178.5, _1080p * 182.5 )
	self:addElement( snake3line )
	self.snake3line = snake3line
	
	local snake3back = nil
	
	snake3back = LUI.UIImage.new()
	snake3back.id = "snake3back"
	snake3back:SetZRotation( -4, 0 )
	snake3back:SetScale( -0.64, 0 )
	snake3back:setImage( RegisterMaterial( "zm_dlc2_dragon_skill_icon_3_off" ), 0 )
	snake3back:SetUseAA( true )
	snake3back:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 128, _1080p * 123.96, _1080p * 251.96 )
	snake3back:BindAlphaToModel( DataSources.inGame.CP.zombies.dlc2.snake3BackingAlphaFilter:GetModel( f1_local1 ) )
	self:addElement( snake3back )
	self.snake3back = snake3back
	
	local snake3 = nil
	
	snake3 = LUI.UIImage.new()
	snake3.id = "snake3"
	snake3:SetZRotation( -4, 0 )
	snake3:SetScale( -0.64, 0 )
	snake3:setImage( RegisterMaterial( "zm_dlc2_snake_skill_icon_3" ), 0 )
	snake3:SetBlendMode( BLEND_MODE.blend )
	snake3:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 128, _1080p * 123.96, _1080p * 251.96 )
	snake3:BindAlphaToModel( DataSources.inGame.CP.zombies.dlc2.snake3AlphaFilter:GetModel( f1_local1 ) )
	self:addElement( snake3 )
	self.snake3 = snake3
	
	local snake2line = nil
	
	snake2line = LUI.UIImage.new()
	snake2line.id = "snake2line"
	snake2line:SetZRotation( 9, 0 )
	snake2line:setImage( RegisterMaterial( "zm_dlc2_inventory_line" ), 0 )
	snake2line:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 81.42, _1080p * 145.42, _1080p * 120, _1080p * 124 )
	self:addElement( snake2line )
	self.snake2line = snake2line
	
	local snake2back = nil
	
	snake2back = LUI.UIImage.new()
	snake2back.id = "snake2back"
	snake2back:SetZRotation( -10, 0 )
	snake2back:SetScale( -0.64, 0 )
	snake2back:setImage( RegisterMaterial( "zm_dlc2_dragon_skill_icon_2_off" ), 0 )
	snake2back:SetUseAA( true )
	snake2back:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 128, _1080p * 64, _1080p * 192 )
	snake2back:BindAlphaToModel( DataSources.inGame.CP.zombies.dlc2.snake2BackingAlphaFilter:GetModel( f1_local1 ) )
	self:addElement( snake2back )
	self.snake2back = snake2back
	
	local snake2 = nil
	
	snake2 = LUI.UIImage.new()
	snake2.id = "snake2"
	snake2:SetZRotation( -10, 0 )
	snake2:SetScale( -0.64, 0 )
	snake2:setImage( RegisterMaterial( "zm_dlc2_snake_skill_icon_2" ), 0 )
	snake2:SetBlendMode( BLEND_MODE.blend )
	snake2:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 128, _1080p * 64, _1080p * 192 )
	snake2:BindAlphaToModel( DataSources.inGame.CP.zombies.dlc2.snake2AlphaFilter:GetModel( f1_local1 ) )
	self:addElement( snake2 )
	self.snake2 = snake2
	
	local snake1line = nil
	
	snake1line = LUI.UIImage.new()
	snake1line.id = "snake1line"
	snake1line:SetZRotation( -13, 0 )
	snake1line:setImage( RegisterMaterial( "zm_dlc2_inventory_line" ), 0 )
	snake1line:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 79.42, _1080p * 143.42, _1080p * 64, _1080p * 68 )
	self:addElement( snake1line )
	self.snake1line = snake1line
	
	local snake1back = nil
	
	snake1back = LUI.UIImage.new()
	snake1back.id = "snake1back"
	snake1back:SetZRotation( 3, 0 )
	snake1back:SetScale( -0.64, 0 )
	snake1back:setImage( RegisterMaterial( "zm_dlc2_dragon_skill_icon_1_off" ), 0 )
	snake1back:SetUseAA( true )
	snake1back:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 128, 0, _1080p * 128 )
	snake1back:BindAlphaToModel( DataSources.inGame.CP.zombies.dlc2.snake1BackingAlphaFilter:GetModel( f1_local1 ) )
	self:addElement( snake1back )
	self.snake1back = snake1back
	
	local snake1 = nil
	
	snake1 = LUI.UIImage.new()
	snake1.id = "snake1"
	snake1:SetZRotation( 3, 0 )
	snake1:SetScale( -0.64, 0 )
	snake1:setImage( RegisterMaterial( "zm_dlc2_snake_skill_icon_1" ), 0 )
	snake1:SetBlendMode( BLEND_MODE.blend )
	snake1:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 128, 0, _1080p * 128 )
	snake1:BindAlphaToModel( DataSources.inGame.CP.zombies.dlc2.snake1AlphaFilter:GetModel( f1_local1 ) )
	self:addElement( snake1 )
	self.snake1 = snake1
	
	local snakeGlow = nil
	
	snakeGlow = LUI.UIImage.new()
	snakeGlow.id = "snakeGlow"
	snakeGlow:SetScale( 0.5, 0 )
	snakeGlow:setImage( RegisterMaterial( "zm_dlc2_inventory_snake_glow" ), 0 )
	snakeGlow:SetUseAA( true )
	snakeGlow:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 104.96, _1080p * 232.96, _1080p * 60, _1080p * 188 )
	snakeGlow:BindAlphaToModel( DataSources.inGame.CP.zombies.dlc2.chiStyleInvSnakeGlowFilter:GetModel( f1_local1 ) )
	self:addElement( snakeGlow )
	self.snakeGlow = snakeGlow
	
	local Snake = nil
	
	Snake = LUI.UIImage.new()
	Snake.id = "Snake"
	Snake:SetScale( 0.5, 0 )
	Snake:setImage( RegisterMaterial( "zm_dlc2_inventory_snake" ), 0 )
	Snake:SetUseAA( true )
	Snake:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 104.96, _1080p * 232.96, _1080p * 63, _1080p * 191 )
	Snake:BindAlphaToModel( DataSources.inGame.CP.zombies.dlc2.chiStyleInvSnakeAlphaFilter:GetModel( f1_local1 ) )
	self:addElement( Snake )
	self.Snake = Snake
	
	local snakeI = nil
	
	snakeI = LUI.UIImage.new()
	snakeI.id = "snakeI"
	snakeI:SetScale( -0.35, 0 )
	snakeI:setImage( RegisterMaterial( "zm_dlc2_inventory_i" ), 0 )
	snakeI:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 30, _1080p * 62, _1080p * 41.04, _1080p * 73.04 )
	self:addElement( snakeI )
	self.snakeI = snakeI
	
	local snakeII = nil
	
	snakeII = LUI.UIImage.new()
	snakeII.id = "snakeII"
	snakeII:SetScale( -0.35, 0 )
	snakeII:setImage( RegisterMaterial( "zm_dlc2_inventory_ii" ), 0 )
	snakeII:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 30, _1080p * 62, _1080p * 122.4, _1080p * 154.4 )
	self:addElement( snakeII )
	self.snakeII = snakeII
	
	local snakeIII = nil
	
	snakeIII = LUI.UIImage.new()
	snakeIII.id = "snakeIII"
	snakeIII:SetScale( -0.35, 0 )
	snakeIII:setImage( RegisterMaterial( "zm_dlc2_inventory_iii" ), 0 )
	snakeIII:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 30, _1080p * 62, _1080p * 185.4, _1080p * 217.4 )
	self:addElement( snakeIII )
	self.snakeIII = snakeIII
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		snakeGlow:RegisterAnimationSequence( "GlowPulse", {
			{
				function ()
					return self.snakeGlow:SetScale( 0.65, 0 )
				end,
				function ()
					return self.snakeGlow:SetScale( 0.3, 2000 )
				end,
				function ()
					return self.snakeGlow:SetScale( 0.65, 2000 )
				end
			}
		} )
		self._sequences.GlowPulse = function ()
			snakeGlow:AnimateLoop( "GlowPulse" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	ACTIONS.AnimateSequence( self, "GlowPulse" )
	return self
end

MenuBuilder.registerType( "snakeChiTree", snakeChiTree )
LockTable( _M )
