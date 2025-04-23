local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function PostLoadFunc( f1_arg0, f1_arg1, f1_arg2 )
	f1_arg0:SetBlendMode( BLEND_MODE.addWithAlpha )
	local f1_local0 = DataSources.inGame.jackal.bootup
	f1_arg0:SubscribeToModel( f1_local0:GetModel( f1_arg1 ), function ()
		if f1_local0:GetValue( f1_arg1 ) then
			ACTIONS.AnimateSequence( f1_arg0, "bootup" )
		end
	end, true )
	f1_arg0:addEventHandler( "hud_anim_shutdown_off", function ( f3_arg0, f3_arg1 )
		if Game.GetOmnvar( "ui_jackal_hud_shutdown" ) then
			ACTIONS.AnimateSequence( f1_arg0, "shutdown" )
		end
	end )
end

function JackalOverlay( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 1920 * _1080p, 0, 1080 * _1080p )
	self.id = "JackalOverlay"
	self._animationSets = {}
	self._sequences = {}
	local f4_local1 = controller and controller.controllerIndex
	if not f4_local1 and not Engine.InFrontend() then
		f4_local1 = self:getRootController()
	end
	assert( f4_local1 )
	local f4_local2 = self
	local LeftSide = nil
	
	LeftSide = LUI.UIImage.new()
	LeftSide.id = "LeftSide"
	LeftSide:setImage( RegisterMaterial( "hud_jackal_overlay" ), 0 )
	LeftSide:SetAnchorsAndPosition( 0, 1, 0, 0, 0, _1080p * 960, 0, 0 )
	self:addElement( LeftSide )
	self.LeftSide = LeftSide
	
	local RightSide = nil
	
	RightSide = LUI.UIImage.new()
	RightSide.id = "RightSide"
	RightSide:setImage( RegisterMaterial( "hud_jackal_overlay" ), 0 )
	RightSide:SetAnchorsAndPosition( 1, 0, 0, 0, 0, _1080p * -960, 0, 0 )
	self:addElement( RightSide )
	self.RightSide = RightSide
	
	local Bootup = nil
	
	Bootup = LUI.UIImage.new()
	Bootup.id = "Bootup"
	Bootup:SetAlpha( 0, 0 )
	Bootup:setImage( RegisterMaterial( "hud_jackal_boot_00" ), 0 )
	self:addElement( Bootup )
	self.Bootup = Bootup
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		Bootup:RegisterAnimationSequence( "bootup", {
			{
				function ()
					return self.Bootup:setImage( RegisterMaterial( "hud_jackal_boot_00" ), 0 )
				end,
				function ()
					return self.Bootup:setImage( RegisterMaterial( "hud_jackal_boot_01" ), 40 )
				end,
				function ()
					return self.Bootup:setImage( RegisterMaterial( "hud_jackal_boot_02" ), 40 )
				end,
				function ()
					return self.Bootup:setImage( RegisterMaterial( "hud_jackal_boot_03" ), 40 )
				end,
				function ()
					return self.Bootup:setImage( RegisterMaterial( "hud_jackal_boot_04" ), 40 )
				end,
				function ()
					return self.Bootup:setImage( RegisterMaterial( "hud_jackal_boot_05" ), 40 )
				end,
				function ()
					return self.Bootup:setImage( RegisterMaterial( "hud_jackal_boot_06" ), 40 )
				end,
				function ()
					return self.Bootup:setImage( RegisterMaterial( "hud_jackal_boot_07" ), 40 )
				end,
				function ()
					return self.Bootup:setImage( RegisterMaterial( "hud_jackal_boot_08" ), 40 )
				end,
				function ()
					return self.Bootup:setImage( RegisterMaterial( "hud_jackal_boot_09" ), 40 )
				end,
				function ()
					return self.Bootup:setImage( RegisterMaterial( "hud_jackal_boot_10" ), 40 )
				end,
				function ()
					return self.Bootup:setImage( RegisterMaterial( "hud_jackal_boot_11" ), 40 )
				end,
				function ()
					return self.Bootup:setImage( RegisterMaterial( "hud_jackal_boot_12" ), 40 )
				end,
				function ()
					return self.Bootup:setImage( RegisterMaterial( "hud_jackal_boot_13" ), 40 )
				end,
				function ()
					return self.Bootup:setImage( RegisterMaterial( "hud_jackal_boot_14" ), 40 )
				end,
				function ()
					return self.Bootup:setImage( RegisterMaterial( "hud_jackal_boot_14" ), 40 )
				end
			},
			{
				function ()
					return self.Bootup:SetAlpha( 1, 0 )
				end,
				function ()
					return self.Bootup:SetAlpha( 1, 560 )
				end,
				function ()
					return self.Bootup:SetAlpha( 0, 40 )
				end
			}
		} )
		self._sequences.bootup = function ()
			Bootup:AnimateSequence( "bootup" )
		end
		
		Bootup:RegisterAnimationSequence( "shutdown", {
			{
				function ()
					return self.Bootup:setImage( RegisterMaterial( "hud_jackal_boot_14" ), 0 )
				end,
				function ()
					return self.Bootup:setImage( RegisterMaterial( "hud_jackal_boot_13" ), 40 )
				end,
				function ()
					return self.Bootup:setImage( RegisterMaterial( "hud_jackal_boot_12" ), 40 )
				end,
				function ()
					return self.Bootup:setImage( RegisterMaterial( "hud_jackal_boot_11" ), 40 )
				end,
				function ()
					return self.Bootup:setImage( RegisterMaterial( "hud_jackal_boot_10" ), 40 )
				end,
				function ()
					return self.Bootup:setImage( RegisterMaterial( "hud_jackal_boot_09" ), 40 )
				end,
				function ()
					return self.Bootup:setImage( RegisterMaterial( "hud_jackal_boot_08" ), 40 )
				end,
				function ()
					return self.Bootup:setImage( RegisterMaterial( "hud_jackal_boot_07" ), 40 )
				end,
				function ()
					return self.Bootup:setImage( RegisterMaterial( "hud_jackal_boot_06" ), 40 )
				end,
				function ()
					return self.Bootup:setImage( RegisterMaterial( "hud_jackal_boot_05" ), 40 )
				end,
				function ()
					return self.Bootup:setImage( RegisterMaterial( "hud_jackal_boot_04" ), 40 )
				end,
				function ()
					return self.Bootup:setImage( RegisterMaterial( "hud_jackal_boot_03" ), 40 )
				end,
				function ()
					return self.Bootup:setImage( RegisterMaterial( "hud_jackal_boot_02" ), 40 )
				end,
				function ()
					return self.Bootup:setImage( RegisterMaterial( "hud_jackal_boot_01" ), 40 )
				end,
				function ()
					return self.Bootup:setImage( RegisterMaterial( "hud_jackal_boot_00" ), 40 )
				end,
				function ()
					return self.Bootup:setImage( RegisterMaterial( "hud_jackal_boot_00" ), 40 )
				end
			},
			{
				function ()
					return self.Bootup:SetAlpha( 1, 0 )
				end,
				function ()
					return self.Bootup:SetAlpha( 1, 560 )
				end,
				function ()
					return self.Bootup:SetAlpha( 0, 40 )
				end
			}
		} )
		self._sequences.shutdown = function ()
			Bootup:AnimateSequence( "shutdown" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	PostLoadFunc( self, f4_local1, controller )
	return self
end

MenuBuilder.registerType( "JackalOverlay", JackalOverlay )
LockTable( _M )
