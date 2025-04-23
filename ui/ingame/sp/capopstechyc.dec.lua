local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function CapOpsTechyC( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 323.85 * _1080p, 0, 100 * _1080p )
	self.id = "CapOpsTechyC"
	self._animationSets = {}
	self._sequences = {}
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local HelperBarCapLeftCopy12 = nil
	
	HelperBarCapLeftCopy12 = LUI.UIImage.new()
	HelperBarCapLeftCopy12.id = "HelperBarCapLeftCopy12"
	HelperBarCapLeftCopy12:SetDotPitchEnabled( true )
	HelperBarCapLeftCopy12:SetDotPitchX( 0, 0 )
	HelperBarCapLeftCopy12:SetDotPitchY( 0, 0 )
	HelperBarCapLeftCopy12:SetDotPitchContrast( 0, 0 )
	HelperBarCapLeftCopy12:SetDotPitchMode( 0 )
	HelperBarCapLeftCopy12:setImage( RegisterMaterial( "hud_captain_computer_cap_right" ), 0 )
	HelperBarCapLeftCopy12:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 308.15, _1080p * 323.85, 0, _1080p * 101 )
	self:addElement( HelperBarCapLeftCopy12 )
	self.HelperBarCapLeftCopy12 = HelperBarCapLeftCopy12
	
	local TechACopy1 = nil
	
	TechACopy1 = LUI.UIImage.new()
	TechACopy1.id = "TechACopy1"
	TechACopy1:setImage( RegisterMaterial( "hud_captain_computer_techy_c" ), 0 )
	TechACopy1:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 16, _1080p * 321, _1080p * 1, _1080p * 99 )
	self:addElement( TechACopy1 )
	self.TechACopy1 = TechACopy1
	
	local HelperBarCapLeftCopy11 = nil
	
	HelperBarCapLeftCopy11 = LUI.UIImage.new()
	HelperBarCapLeftCopy11.id = "HelperBarCapLeftCopy11"
	HelperBarCapLeftCopy11:SetDotPitchEnabled( true )
	HelperBarCapLeftCopy11:SetDotPitchX( 0, 0 )
	HelperBarCapLeftCopy11:SetDotPitchY( 0, 0 )
	HelperBarCapLeftCopy11:SetDotPitchContrast( 0, 0 )
	HelperBarCapLeftCopy11:SetDotPitchMode( 0 )
	HelperBarCapLeftCopy11:setImage( RegisterMaterial( "hud_captain_computer_cap_left" ), 0 )
	HelperBarCapLeftCopy11:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 16, 0, _1080p * 101 )
	self:addElement( HelperBarCapLeftCopy11 )
	self.HelperBarCapLeftCopy11 = HelperBarCapLeftCopy11
	
	local Knob1 = nil
	
	Knob1 = LUI.UIImage.new()
	Knob1.id = "Knob1"
	Knob1:SetScale( 0.5, 0 )
	Knob1:setImage( RegisterMaterial( "hud_captain_computer_techy_knob" ), 0 )
	Knob1:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 79.55, _1080p * 102.55, _1080p * 31.14, _1080p * 51.62 )
	self:addElement( Knob1 )
	self.Knob1 = Knob1
	
	local Knob2 = nil
	
	Knob2 = LUI.UIImage.new()
	Knob2.id = "Knob2"
	Knob2:SetScale( 0.5, 0 )
	Knob2:setImage( RegisterMaterial( "hud_captain_computer_techy_knob" ), 0 )
	Knob2:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 41.55, _1080p * 64.55, _1080p * 31.14, _1080p * 51.62 )
	self:addElement( Knob2 )
	self.Knob2 = Knob2
	
	local Knob3 = nil
	
	Knob3 = LUI.UIImage.new()
	Knob3.id = "Knob3"
	Knob3:SetRGBFromInt( 16724787, 0 )
	Knob3:SetScale( 0.5, 0 )
	Knob3:setImage( RegisterMaterial( "hud_captain_computer_techy_knob" ), 0 )
	Knob3:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 79.55, _1080p * 102.55, _1080p * 66.38, _1080p * 86.86 )
	self:addElement( Knob3 )
	self.Knob3 = Knob3
	
	local Knob4 = nil
	
	Knob4 = LUI.UIImage.new()
	Knob4.id = "Knob4"
	Knob4:SetScale( 0.5, 0 )
	Knob4:setImage( RegisterMaterial( "hud_captain_computer_techy_knob" ), 0 )
	Knob4:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 41.55, _1080p * 64.55, _1080p * 66.38, _1080p * 86.86 )
	self:addElement( Knob4 )
	self.Knob4 = Knob4
	
	local Knob5 = nil
	
	Knob5 = LUI.UIImage.new()
	Knob5.id = "Knob5"
	Knob5:SetScale( 0.5, 0 )
	Knob5:setImage( RegisterMaterial( "hud_captain_computer_techy_knob" ), 0 )
	Knob5:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 230.55, _1080p * 253.55, _1080p * 31.14, _1080p * 51.62 )
	self:addElement( Knob5 )
	self.Knob5 = Knob5
	
	local Knob6 = nil
	
	Knob6 = LUI.UIImage.new()
	Knob6.id = "Knob6"
	Knob6:SetScale( 0.5, 0 )
	Knob6:setImage( RegisterMaterial( "hud_captain_computer_techy_knob" ), 0 )
	Knob6:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 193.55, _1080p * 216.55, _1080p * 31.14, _1080p * 51.62 )
	self:addElement( Knob6 )
	self.Knob6 = Knob6
	
	local Knob7 = nil
	
	Knob7 = LUI.UIImage.new()
	Knob7.id = "Knob7"
	Knob7:SetRGBFromInt( 16760064, 0 )
	Knob7:SetScale( 0.5, 0 )
	Knob7:setImage( RegisterMaterial( "hud_captain_computer_techy_knob" ), 0 )
	Knob7:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 230.55, _1080p * 253.55, _1080p * 66.38, _1080p * 86.86 )
	self:addElement( Knob7 )
	self.Knob7 = Knob7
	
	local Knob1Copy6 = nil
	
	Knob1Copy6 = LUI.UIImage.new()
	Knob1Copy6.id = "Knob1Copy6"
	Knob1Copy6:SetScale( 0.5, 0 )
	Knob1Copy6:setImage( RegisterMaterial( "hud_captain_computer_techy_knob" ), 0 )
	Knob1Copy6:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 193.55, _1080p * 216.55, _1080p * 66.38, _1080p * 86.86 )
	self:addElement( Knob1Copy6 )
	self.Knob1Copy6 = Knob1Copy6
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		Knob1:RegisterAnimationSequence( "TechLoop", {
			{
				function ()
					return self.Knob1:SetZRotation( -64, 0 )
				end,
				function ()
					return self.Knob1:SetZRotation( -101, 410 )
				end,
				function ()
					return self.Knob1:SetZRotation( -50.43, 1300 )
				end,
				function ()
					return self.Knob1:SetZRotation( -64, 1290 )
				end
			}
		} )
		Knob2:RegisterAnimationSequence( "TechLoop", {
			{
				function ()
					return self.Knob2:SetZRotation( 59, 0 )
				end,
				function ()
					return self.Knob2:SetZRotation( 26, 210 )
				end,
				function ()
					return self.Knob2:SetZRotation( 89.74, 1500 )
				end,
				function ()
					return self.Knob2:SetZRotation( 59, 1290 )
				end
			}
		} )
		Knob3:RegisterAnimationSequence( "TechLoop", {
			{
				function ()
					return self.Knob3:SetZRotation( 90, 0 )
				end,
				function ()
					return self.Knob3:SetZRotation( 49.83, 790 )
				end,
				function ()
					return self.Knob3:SetZRotation( 173, 500 )
				end,
				function ()
					return self.Knob3:SetZRotation( 90, 1710 )
				end
			}
		} )
		Knob4:RegisterAnimationSequence( "TechLoop", {
			{
				function ()
					return self.Knob4:SetZRotation( -44, 0 )
				end,
				function ()
					return self.Knob4:SetZRotation( -66, 660 )
				end,
				function ()
					return self.Knob4:SetZRotation( 46.41, 1320 )
				end,
				function ()
					return self.Knob4:SetZRotation( -44, 1020 )
				end
			}
		} )
		Knob5:RegisterAnimationSequence( "TechLoop", {
			{
				function ()
					return self.Knob5:SetZRotation( 33, 410 )
				end,
				function ()
					return self.Knob5:SetZRotation( -28.56, 1300 )
				end,
				function ()
					return self.Knob5:SetZRotation( 147.42, 270 )
				end,
				function ()
					return self.Knob5:SetZRotation( 33, 1020 )
				end
			}
		} )
		Knob6:RegisterAnimationSequence( "TechLoop", {
			{
				function ()
					return self.Knob6:SetZRotation( 31, 0 )
				end,
				function ()
					return self.Knob6:SetZRotation( -1, 410 )
				end,
				function ()
					return self.Knob6:SetZRotation( 7.54, 960 )
				end,
				function ()
					return self.Knob6:SetZRotation( -42.88, 830 )
				end,
				function ()
					return self.Knob6:SetZRotation( 31, 800 )
				end
			}
		} )
		Knob7:RegisterAnimationSequence( "TechLoop", {
			{
				function ()
					return self.Knob7:SetZRotation( -37, 0 )
				end,
				function ()
					return self.Knob7:SetZRotation( 36, 660 )
				end,
				function ()
					return self.Knob7:SetZRotation( 185.82, 1320 )
				end,
				function ()
					return self.Knob7:SetZRotation( -37, 1020 )
				end
			}
		} )
		Knob1Copy6:RegisterAnimationSequence( "TechLoop", {
			{
				function ()
					return self.Knob1Copy6:SetZRotation( -163, 0 )
				end,
				function ()
					return self.Knob1Copy6:SetZRotation( -97, 660 )
				end,
				function ()
					return self.Knob1Copy6:SetZRotation( -4.23, 1320 )
				end,
				function ()
					return self.Knob1Copy6:SetZRotation( -163, 1020 )
				end
			}
		} )
		self._sequences.TechLoop = function ()
			Knob1:AnimateLoop( "TechLoop" )
			Knob2:AnimateLoop( "TechLoop" )
			Knob3:AnimateLoop( "TechLoop" )
			Knob4:AnimateLoop( "TechLoop" )
			Knob5:AnimateLoop( "TechLoop" )
			Knob6:AnimateLoop( "TechLoop" )
			Knob7:AnimateLoop( "TechLoop" )
			Knob1Copy6:AnimateLoop( "TechLoop" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	ACTIONS.AnimateSequence( self, "TechLoop" )
	return self
end

MenuBuilder.registerType( "CapOpsTechyC", CapOpsTechyC )
LockTable( _M )
