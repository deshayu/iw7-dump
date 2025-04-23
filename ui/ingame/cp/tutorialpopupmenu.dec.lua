local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function PostLoadFunc( f1_arg0, f1_arg1, f1_arg2 )
	assert( f1_arg0.Accept )
	f1_arg0.Accept.m_requireFocusType = FocusType.MouseOver
	if Engine.IsPC() then
		f1_arg0.Accept:addEventHandler( "button_action", function ( f2_arg0, f2_arg1 )
			ACTIONS.ZombieTutorialResumeGame( f1_arg0 )
			ACTIONS.AnimateSequence( f1_arg0, "reset" )
			ACTIONS.CloseAllMenus( f1_arg0 )
		end )
	end
end

function tutorialPopupMenu( menu, controller )
	local self = LUI.UIVerticalNavigator.new()
	self.id = "tutorialPopupMenu"
	self._animationSets = {}
	self._sequences = {}
	local f3_local1 = controller and controller.controllerIndex
	if not f3_local1 and not Engine.InFrontend() then
		f3_local1 = self:getRootController()
	end
	assert( f3_local1 )
	self.soundSet = "zomTutorial"
	self:playSound( "menu_open" )
	local f3_local2 = self
	local laser = nil
	
	laser = LUI.UIImage.new()
	laser.id = "laser"
	laser:SetXRotation( -181, 0 )
	laser:SetZRotation( -291, 0 )
	laser:SetScale( -0.55, 0 )
	laser:setImage( RegisterMaterial( "zombies_blaster_beam" ), 0 )
	laser:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1133.45, _1080p * 1389.45, _1080p * 507.79, _1080p * 763.79 )
	self:addElement( laser )
	self.laser = laser
	
	local AlienShooter = nil
	
	AlienShooter = LUI.UIImage.new()
	AlienShooter.id = "AlienShooter"
	AlienShooter:SetXRotation( 180, 0 )
	AlienShooter:SetScale( -0.67, 0 )
	AlienShooter:setImage( RegisterMaterial( "zombies_alien_shooter" ), 0 )
	AlienShooter:SetUseAA( true )
	AlienShooter:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 952.45, _1080p * 1735.45, _1080p * 224.49, _1080p * 1133.49 )
	self:addElement( AlienShooter )
	self.AlienShooter = AlienShooter
	
	local tutorialPopup = nil
	
	tutorialPopup = MenuBuilder.BuildRegisteredType( "tutorialPopup", {
		controllerIndex = f3_local1
	} )
	tutorialPopup.id = "tutorialPopup"
	tutorialPopup:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 708.55, _1080p * 1133.45, _1080p * 215.89, _1080p * 635.79 )
	self:addElement( tutorialPopup )
	self.tutorialPopup = tutorialPopup
	
	local Accept = nil
	
	Accept = MenuBuilder.BuildRegisteredType( "TutorialPopupButton", {
		controllerIndex = f3_local1
	} )
	Accept.id = "Accept"
	Accept:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1029.47, _1080p * 1353.47, _1080p * 875.61, _1080p * 907.61 )
	self:addElement( Accept )
	self.Accept = Accept
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		self._sequences.initial = function ()
			
		end
		
		laser:RegisterAnimationSequence( "display", {
			{
				function ()
					return self.laser:SetAlpha( 0, 0 )
				end,
				function ()
					return self.laser:SetAlpha( 0, 440 )
				end,
				function ()
					return self.laser:SetAlpha( 1, 20 )
				end
			},
			{
				function ()
					return self.laser:SetScale( -0.7, 340 )
				end,
				function ()
					return self.laser:SetScale( -0.5, 60 )
				end
			},
			{
				function ()
					return self.laser:playSound( "fire", false, 400 )
				end
			},
			{
				function ()
					return self.laser:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1133.45, _1080p * 1389.45, _1080p * 518.79, _1080p * 774.79, 430 )
				end,
				function ()
					return self.laser:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 804.05, _1080p * 1060.05, _1080p * 356.62, _1080p * 612.62, 399 )
				end
			}
		} )
		AlienShooter:RegisterAnimationSequence( "display", {
			{
				function ()
					return self.AlienShooter:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.AlienShooter:SetScale( -0.37, 0 )
				end
			},
			{
				function ()
					return self.AlienShooter:SetYRotation( 180, 0 )
				end
			},
			{
				function ()
					return self.AlienShooter:SetXRotation( 0, 0 )
				end
			},
			{
				function ()
					return self.AlienShooter:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1657.7, _1080p * 2440.7, _1080p * 261.49, _1080p * 1158.49, 39 )
				end,
				function ()
					return self.AlienShooter:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 981.45, _1080p * 1764.45, _1080p * 261.49, _1080p * 1158.4, 169 )
				end
			}
		} )
		tutorialPopup:RegisterAnimationSequence( "display", {
			{
				function ()
					return self.tutorialPopup:SetAlpha( 0, 0 )
				end,
				function ()
					return self.tutorialPopup:SetAlpha( 1, 1100 )
				end
			},
			{
				function ()
					return self.tutorialPopup:SetScale( -0.98, 0 )
				end,
				function ()
					return self.tutorialPopup:SetScale( -0.98, 830 )
				end,
				function ()
					return self.tutorialPopup:SetScale( 0, 270 )
				end
			},
			{
				function ()
					return self.tutorialPopup:playSound( "explosion", false, 830 )
				end
			},
			{
				function ()
					return self.tutorialPopup:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 730.55, _1080p * 1155.45, _1080p * 278.87, _1080p * 698.77, 0 )
				end,
				function ()
					return self.tutorialPopup:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 730.55, _1080p * 1155.45, _1080p * 278.87, _1080p * 698.77, 829 )
				end,
				function ()
					return self.tutorialPopup:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 416.55, _1080p * 841.45, _1080p * -86.13, _1080p * 333.77, 270 )
				end
			}
		} )
		Accept:RegisterAnimationSequence( "display", {
			{
				function ()
					return self.Accept:SetAlpha( 0, 0 )
				end,
				function ()
					return self.Accept:SetAlpha( 0, 1260 )
				end,
				function ()
					return self.Accept:SetAlpha( 1, 110 )
				end
			},
			{
				function ()
					return self.Accept:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 697.95, _1080p * 1021.95, _1080p * 580.62, _1080p * 612.62, 0 )
				end
			}
		} )
		self._sequences.display = function ()
			laser:AnimateSequence( "display" )
			AlienShooter:AnimateSequence( "display" )
			tutorialPopup:AnimateSequence( "display" )
			Accept:AnimateSequence( "display" )
		end
		
		self._sequences.goAway = function ()
			
		end
		
		laser:RegisterAnimationSequence( "reset", {
			{
				function ()
					return self.laser:SetAlpha( 0, 0 )
				end
			}
		} )
		AlienShooter:RegisterAnimationSequence( "reset", {
			{
				function ()
					return self.AlienShooter:SetAlpha( 0, 0 )
				end
			},
			{
				function ()
					return self.AlienShooter:SetScale( -0.37, 0 )
				end
			},
			{
				function ()
					return self.AlienShooter:SetYRotation( 180, 0 )
				end
			},
			{
				function ()
					return self.AlienShooter:SetXRotation( 0, 0 )
				end
			}
		} )
		tutorialPopup:RegisterAnimationSequence( "reset", {
			{
				function ()
					return self.tutorialPopup:SetAlpha( 0, 0 )
				end
			},
			{
				function ()
					return self.tutorialPopup:SetScale( -0.98, 0 )
				end
			},
			{
				function ()
					return self.tutorialPopup:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 730.55, _1080p * 1155.45, _1080p * 278.87, _1080p * 698.77, 0 )
				end
			}
		} )
		Accept:RegisterAnimationSequence( "reset", {
			{
				function ()
					return self.Accept:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.reset = function ()
			laser:AnimateSequence( "reset" )
			AlienShooter:AnimateSequence( "reset" )
			tutorialPopup:AnimateSequence( "reset" )
			Accept:AnimateSequence( "reset" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	
	local bindButton = LUI.UIBindButton.new()
	bindButton.id = "selfBindButton"
	self:addElement( bindButton )
	self.bindButton = bindButton
	
	self.bindButton:addEventHandler( "button_primary", function ( f46_arg0, f46_arg1 )
		local f46_local0 = f46_arg1.controller or f3_local1
		ACTIONS.ZombieTutorialResumeGame( self )
		ACTIONS.AnimateSequence( self, "reset" )
		ACTIONS.CloseAllMenus( self )
	end )
	PostLoadFunc( self, f3_local1, controller )
	ACTIONS.AnimateSequence( self, "display" )
	return self
end

MenuBuilder.registerType( "tutorialPopupMenu", tutorialPopupMenu )
LockTable( _M )
