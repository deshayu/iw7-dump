local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function PostLoadFunc( f1_arg0, f1_arg1, f1_arg2 )
	f1_arg0:SetupInWorldElement( {
		useLeftHandIfAkimbo = true
	} )
	f1_arg0:AttachToViewModel()
	f1_arg0:SetViewModelTag( "j_shield_le" )
	f1_arg0:SetInWorldScale( 0.02 )
	f1_arg0:SetFollowTagAngles( true )
	f1_arg0:SetTagSpacePosition( 3, -2.6, 0.48 )
	f1_arg0:SetTagSpaceRoll( -12 )
	f1_arg0:SetTagSpacePitch( -1.2 )
	f1_arg0:SetTagSpaceYaw( 2.4 )
	f1_arg0:SetDelayedRender( true )
end

function WristPcDefaultScreen( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 300 * _1080p, 0, 75 * _1080p )
	self.id = "WristPcDefaultScreen"
	self._animationSets = {}
	self._sequences = {}
	local f2_local1 = controller and controller.controllerIndex
	if not f2_local1 and not Engine.InFrontend() then
		f2_local1 = self:getRootController()
	end
	assert( f2_local1 )
	local f2_local2 = self
	local Border = nil
	
	Border = LUI.UIImage.new()
	Border.id = "Border"
	Border:SetRGBFromTable( SWATCHES.wristPc.overlay, 0 )
	Border:setImage( RegisterMaterial( "hud_wrist_pc_border" ), 0 )
	Border:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * 28.93, _1080p * -21.07, _1080p * 17, _1080p * -11 )
	self:addElement( Border )
	self.Border = Border
	
	local Menu = nil
	
	Menu = LUI.UIImage.new()
	Menu.id = "Menu"
	Menu:SetRGBFromTable( SWATCHES.wristPc.overlay, 0 )
	Menu:setImage( RegisterMaterial( "hud_wrist_pc_default_menu" ), 0 )
	Menu:SetUseAA( true )
	Menu:SetBlendMode( BLEND_MODE.addWithAlpha )
	Menu:SetAnchorsAndPosition( 1, 0, 0, 0, _1080p * -92.93, _1080p * -27.07, _1080p * 17, _1080p * -11 )
	self:addElement( Menu )
	self.Menu = Menu
	
	local Logo = nil
	
	Logo = LUI.UIImage.new()
	Logo.id = "Logo"
	Logo:SetRGBFromTable( SWATCHES.wristPc.overlay, 0 )
	Logo:setImage( RegisterMaterial( "hud_wrist_pc_sato_logo" ), 0 )
	Logo:SetUseAA( true )
	Logo:SetBlendMode( BLEND_MODE.addWithAlpha )
	Logo:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 36, _1080p * 176, _1080p * 23, _1080p * 58 )
	self:addElement( Logo )
	self.Logo = Logo
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		Logo:RegisterAnimationSequence( "Idle", {
			{
				function ()
					return self.Logo:SetAlpha( 1, 0 )
				end,
				function ()
					return self.Logo:SetAlpha( 1, 2000 )
				end,
				function ()
					return self.Logo:SetAlpha( 0.4, 2000 )
				end,
				function ()
					return self.Logo:SetAlpha( 0.4, 1000 )
				end,
				function ()
					return self.Logo:SetAlpha( 1, 2000 )
				end
			}
		} )
		self._sequences.Idle = function ()
			Logo:AnimateLoop( "Idle" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	PostLoadFunc( self, f2_local1, controller )
	ACTIONS.AnimateSequence( self, "Idle" )
	return self
end

MenuBuilder.registerType( "WristPcDefaultScreen", WristPcDefaultScreen )
LockTable( _M )
