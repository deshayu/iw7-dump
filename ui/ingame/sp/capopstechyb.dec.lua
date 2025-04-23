local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function CapopsTechyB( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 521.15 * _1080p, 0, 101 * _1080p )
	self.id = "CapopsTechyB"
	self._animationSets = {}
	self._sequences = {}
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local TechACopy0 = nil
	
	TechACopy0 = LUI.UIImage.new()
	TechACopy0.id = "TechACopy0"
	TechACopy0:setImage( RegisterMaterial( "hud_captain_computer_techy_b" ), 0 )
	TechACopy0:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 16, _1080p * 505.44, _1080p * 1, _1080p * 101 )
	self:addElement( TechACopy0 )
	self.TechACopy0 = TechACopy0
	
	local HelperBarCapLeftCopy9 = nil
	
	HelperBarCapLeftCopy9 = LUI.UIImage.new()
	HelperBarCapLeftCopy9.id = "HelperBarCapLeftCopy9"
	HelperBarCapLeftCopy9:SetDotPitchEnabled( true )
	HelperBarCapLeftCopy9:SetDotPitchX( 0, 0 )
	HelperBarCapLeftCopy9:SetDotPitchY( 0, 0 )
	HelperBarCapLeftCopy9:SetDotPitchContrast( 0, 0 )
	HelperBarCapLeftCopy9:SetDotPitchMode( 0 )
	HelperBarCapLeftCopy9:setImage( RegisterMaterial( "hud_captain_computer_cap_left" ), 0 )
	HelperBarCapLeftCopy9:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 16, 0, _1080p * 101 )
	self:addElement( HelperBarCapLeftCopy9 )
	self.HelperBarCapLeftCopy9 = HelperBarCapLeftCopy9
	
	local HelperBarCapLeftCopy10 = nil
	
	HelperBarCapLeftCopy10 = LUI.UIImage.new()
	HelperBarCapLeftCopy10.id = "HelperBarCapLeftCopy10"
	HelperBarCapLeftCopy10:SetDotPitchEnabled( true )
	HelperBarCapLeftCopy10:SetDotPitchX( 0, 0 )
	HelperBarCapLeftCopy10:SetDotPitchY( 0, 0 )
	HelperBarCapLeftCopy10:SetDotPitchContrast( 0, 0 )
	HelperBarCapLeftCopy10:SetDotPitchMode( 0 )
	HelperBarCapLeftCopy10:setImage( RegisterMaterial( "hud_captain_computer_cap_right" ), 0 )
	HelperBarCapLeftCopy10:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 505.44, _1080p * 521.15, 0, _1080p * 101 )
	self:addElement( HelperBarCapLeftCopy10 )
	self.HelperBarCapLeftCopy10 = HelperBarCapLeftCopy10
	
	local Bar1Under = nil
	
	Bar1Under = LUI.UIImage.new()
	Bar1Under.id = "Bar1Under"
	Bar1Under:SetRGBFromInt( 6710886, 0 )
	Bar1Under:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 25.27, _1080p * 161.27, _1080p * 50.5, _1080p * 57.64 )
	self:addElement( Bar1Under )
	self.Bar1Under = Bar1Under
	
	local Bar1 = nil
	
	Bar1 = LUI.UIImage.new()
	Bar1.id = "Bar1"
	Bar1:SetRGBFromInt( 10066329, 0 )
	Bar1:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 25.27, _1080p * 161.27, _1080p * 50.5, _1080p * 57.64 )
	self:addElement( Bar1 )
	self.Bar1 = Bar1
	
	local Bar2Under = nil
	
	Bar2Under = LUI.UIImage.new()
	Bar2Under.id = "Bar2Under"
	Bar2Under:SetRGBFromInt( 6710886, 0 )
	Bar2Under:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 25.27, _1080p * 161.27, _1080p * 81.5, _1080p * 88.64 )
	self:addElement( Bar2Under )
	self.Bar2Under = Bar2Under
	
	local Bar2 = nil
	
	Bar2 = LUI.UIImage.new()
	Bar2.id = "Bar2"
	Bar2:SetRGBFromInt( 11352628, 0 )
	Bar2:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 25.27, _1080p * 161.27, _1080p * 81.5, _1080p * 88.64 )
	self:addElement( Bar2 )
	self.Bar2 = Bar2
	
	local Bar3Under = nil
	
	Bar3Under = LUI.UIImage.new()
	Bar3Under.id = "Bar3Under"
	Bar3Under:SetRGBFromInt( 6710886, 0 )
	Bar3Under:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 180.27, _1080p * 316.27, _1080p * 81.5, _1080p * 88.64 )
	self:addElement( Bar3Under )
	self.Bar3Under = Bar3Under
	
	local Bar3 = nil
	
	Bar3 = LUI.UIImage.new()
	Bar3.id = "Bar3"
	Bar3:SetRGBFromInt( 10066329, 0 )
	Bar3:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 180.27, _1080p * 316.27, _1080p * 81.5, _1080p * 88.64 )
	self:addElement( Bar3 )
	self.Bar3 = Bar3
	
	local Bar4Under = nil
	
	Bar4Under = LUI.UIImage.new()
	Bar4Under.id = "Bar4Under"
	Bar4Under:SetRGBFromInt( 6710886, 0 )
	Bar4Under:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 180.27, _1080p * 316.27, _1080p * 50.5, _1080p * 57.64 )
	self:addElement( Bar4Under )
	self.Bar4Under = Bar4Under
	
	local Bar4 = nil
	
	Bar4 = LUI.UIImage.new()
	Bar4.id = "Bar4"
	Bar4:SetRGBFromInt( 10066329, 0 )
	Bar4:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 180.27, _1080p * 316.27, _1080p * 50.5, _1080p * 57.64 )
	self:addElement( Bar4 )
	self.Bar4 = Bar4
	
	local Bar5Under = nil
	
	Bar5Under = LUI.UIImage.new()
	Bar5Under.id = "Bar5Under"
	Bar5Under:SetRGBFromInt( 6710886, 0 )
	Bar5Under:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 334.27, _1080p * 486.27, _1080p * 50.5, _1080p * 57.64 )
	self:addElement( Bar5Under )
	self.Bar5Under = Bar5Under
	
	local Bar5 = nil
	
	Bar5 = LUI.UIImage.new()
	Bar5.id = "Bar5"
	Bar5:SetRGBFromInt( 11352628, 0 )
	Bar5:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 334.27, _1080p * 486.27, _1080p * 50.5, _1080p * 57.64 )
	self:addElement( Bar5 )
	self.Bar5 = Bar5
	
	local Bar6Under = nil
	
	Bar6Under = LUI.UIImage.new()
	Bar6Under.id = "Bar6Under"
	Bar6Under:SetRGBFromInt( 6710886, 0 )
	Bar6Under:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 334.27, _1080p * 486.27, _1080p * 81.5, _1080p * 88.64 )
	self:addElement( Bar6Under )
	self.Bar6Under = Bar6Under
	
	local Bar6 = nil
	
	Bar6 = LUI.UIImage.new()
	Bar6.id = "Bar6"
	Bar6:SetRGBFromInt( 10066329, 0 )
	Bar6:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 334.27, _1080p * 486.27, _1080p * 81.5, _1080p * 88.64 )
	self:addElement( Bar6 )
	self.Bar6 = Bar6
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		Bar1Under:RegisterAnimationSequence( "AnimLoop", {
			{
				function ()
					return self.Bar1Under:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 25.27, _1080p * 54.27, _1080p * 50.5, _1080p * 57.64, 0 )
				end,
				function ()
					return self.Bar1Under:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 25.27, _1080p * 69.27, _1080p * 50.5, _1080p * 57.64, 259 )
				end,
				function ()
					return self.Bar1Under:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 25.27, _1080p * 118.55, _1080p * 50.5, _1080p * 57.64, 680 )
				end,
				function ()
					return self.Bar1Under:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 25.27, _1080p * 115.58, _1080p * 50.5, _1080p * 57.64, 640 )
				end,
				function ()
					return self.Bar1Under:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 25.27, _1080p * 97.65, _1080p * 50.5, _1080p * 57.64, 669 )
				end,
				function ()
					return self.Bar1Under:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 25.27, _1080p * 147.05, _1080p * 50.5, _1080p * 57.64, 460 )
				end,
				function ()
					return self.Bar1Under:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 25.27, _1080p * 54.27, _1080p * 50.5, _1080p * 57.64, 289 )
				end
			}
		} )
		Bar1:RegisterAnimationSequence( "AnimLoop", {
			{
				function ()
					return self.Bar1:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 25.27, _1080p * 39.27, _1080p * 50.5, _1080p * 57.64, 0 )
				end,
				function ()
					return self.Bar1:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 25.27, _1080p * 64.27, _1080p * 50.5, _1080p * 57.64, 259 )
				end,
				function ()
					return self.Bar1:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 25.27, _1080p * 118.55, _1080p * 50.5, _1080p * 57.64, 680 )
				end,
				function ()
					return self.Bar1:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 25.27, _1080p * 109.92, _1080p * 50.5, _1080p * 57.64, 640 )
				end,
				function ()
					return self.Bar1:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 25.27, _1080p * 92.59, _1080p * 50.5, _1080p * 57.64, 669 )
				end,
				function ()
					return self.Bar1:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 25.27, _1080p * 145.89, _1080p * 50.5, _1080p * 57.64, 460 )
				end,
				function ()
					return self.Bar1:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 25.27, _1080p * 39.27, _1080p * 50.5, _1080p * 57.64, 289 )
				end
			}
		} )
		Bar2Under:RegisterAnimationSequence( "AnimLoop", {
			{
				function ()
					return self.Bar2Under:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 25.27, _1080p * 71.27, _1080p * 81.5, _1080p * 88.64, 0 )
				end,
				function ()
					return self.Bar2Under:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 25.27, _1080p * 94.27, _1080p * 81.5, _1080p * 88.64, 460 )
				end,
				function ()
					return self.Bar2Under:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 25.27, _1080p * 121.21, _1080p * 81.5, _1080p * 88.64, 780 )
				end,
				function ()
					return self.Bar2Under:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 25.27, _1080p * 133.75, _1080p * 81.5, _1080p * 88.64, 580 )
				end,
				function ()
					return self.Bar2Under:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 25.27, _1080p * 71.27, _1080p * 81.5, _1080p * 88.64, 1179 )
				end
			}
		} )
		Bar2:RegisterAnimationSequence( "AnimLoop", {
			{
				function ()
					return self.Bar2:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 25.27, _1080p * 63.27, _1080p * 81.5, _1080p * 88.64, 0 )
				end,
				function ()
					return self.Bar2:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 25.27, _1080p * 94.27, _1080p * 81.5, _1080p * 88.64, 460 )
				end,
				function ()
					return self.Bar2:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 25.27, _1080p * 115.75, _1080p * 81.5, _1080p * 88.64, 780 )
				end,
				function ()
					return self.Bar2:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 25.27, _1080p * 129.46, _1080p * 81.5, _1080p * 88.64, 580 )
				end,
				function ()
					return self.Bar2:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 25.27, _1080p * 55.68, _1080p * 81.5, _1080p * 88.64, 620 )
				end,
				function ()
					return self.Bar2:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 25.27, _1080p * 71.88, _1080p * 81.5, _1080p * 88.64, 309 )
				end,
				function ()
					return self.Bar2:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 25.27, _1080p * 63.27, _1080p * 81.5, _1080p * 88.64, 250 )
				end
			}
		} )
		Bar3Under:RegisterAnimationSequence( "AnimLoop", {
			{
				function ()
					return self.Bar3Under:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 180.27, _1080p * 218.27, _1080p * 81.5, _1080p * 88.64, 0 )
				end,
				function ()
					return self.Bar3Under:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 180.27, _1080p * 252.27, _1080p * 81.5, _1080p * 88.64, 310 )
				end,
				function ()
					return self.Bar3Under:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 180.27, _1080p * 280.21, _1080p * 81.5, _1080p * 88.64, 480 )
				end,
				function ()
					return self.Bar3Under:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 180.27, _1080p * 276.04, _1080p * 81.5, _1080p * 88.64, 469 )
				end,
				function ()
					return self.Bar3Under:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 180.27, _1080p * 278.46, _1080p * 81.5, _1080p * 88.64, 649 )
				end,
				function ()
					return self.Bar3Under:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 180.27, _1080p * 264.75, _1080p * 81.5, _1080p * 88.64, 520 )
				end,
				function ()
					return self.Bar3Under:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 180.27, _1080p * 218.27, _1080p * 81.5, _1080p * 88.64, 569 )
				end
			}
		} )
		Bar3:RegisterAnimationSequence( "AnimLoop", {
			{
				function ()
					return self.Bar3:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 180.27, _1080p * 199.27, _1080p * 81.5, _1080p * 88.64, 0 )
				end,
				function ()
					return self.Bar3:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 180.27, _1080p * 247.27, _1080p * 81.5, _1080p * 88.64, 310 )
				end,
				function ()
					return self.Bar3:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 180.27, _1080p * 264.71, _1080p * 81.5, _1080p * 88.64, 480 )
				end,
				function ()
					return self.Bar3:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 180.27, _1080p * 264.79, _1080p * 81.5, _1080p * 88.64, 469 )
				end,
				function ()
					return self.Bar3:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 180.27, _1080p * 269.32, _1080p * 81.5, _1080p * 88.64, 649 )
				end,
				function ()
					return self.Bar3:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 180.27, _1080p * 260.58, _1080p * 81.5, _1080p * 88.64, 520 )
				end,
				function ()
					return self.Bar3:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 180.27, _1080p * 199.27, _1080p * 81.5, _1080p * 88.64, 569 )
				end
			}
		} )
		Bar4Under:RegisterAnimationSequence( "AnimLoop", {
			{
				function ()
					return self.Bar4Under:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 180.27, _1080p * 262.27, _1080p * 50.5, _1080p * 57.64, 0 )
				end,
				function ()
					return self.Bar4Under:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 180.27, _1080p * 217.27, _1080p * 50.5, _1080p * 57.64, 379 )
				end,
				function ()
					return self.Bar4Under:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 180.27, _1080p * 252.77, _1080p * 50.5, _1080p * 57.64, 319 )
				end,
				function ()
					return self.Bar4Under:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 180.27, _1080p * 301.89, _1080p * 50.5, _1080p * 57.64, 1240 )
				end,
				function ()
					return self.Bar4Under:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 180.27, _1080p * 283.22, _1080p * 50.5, _1080p * 57.64, 659 )
				end,
				function ()
					return self.Bar4Under:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 180.27, _1080p * 262.27, _1080p * 50.5, _1080p * 57.64, 400 )
				end
			}
		} )
		Bar4:RegisterAnimationSequence( "AnimLoop", {
			{
				function ()
					return self.Bar4:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 180.27, _1080p * 251.27, _1080p * 50.5, _1080p * 57.64, 0 )
				end,
				function ()
					return self.Bar4:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 180.27, _1080p * 212.27, _1080p * 50.5, _1080p * 57.64, 379 )
				end,
				function ()
					return self.Bar4:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 180.27, _1080p * 249.04, _1080p * 50.5, _1080p * 57.64, 319 )
				end,
				function ()
					return self.Bar4:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 180.27, _1080p * 206.74, _1080p * 50.5, _1080p * 57.64, 719 )
				end,
				function ()
					return self.Bar4:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 180.27, _1080p * 297.4, _1080p * 50.5, _1080p * 57.64, 520 )
				end,
				function ()
					return self.Bar4:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 180.27, _1080p * 253.91, _1080p * 50.5, _1080p * 57.64, 309 )
				end,
				function ()
					return self.Bar4:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 180.27, _1080p * 258.68, _1080p * 50.5, _1080p * 57.64, 349 )
				end,
				function ()
					return self.Bar4:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 180.27, _1080p * 251.27, _1080p * 50.5, _1080p * 57.64, 400 )
				end
			}
		} )
		Bar5Under:RegisterAnimationSequence( "AnimLoop", {
			{
				function ()
					return self.Bar5Under:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 334.27, _1080p * 402.27, _1080p * 50.5, _1080p * 57.64, 0 )
				end,
				function ()
					return self.Bar5Under:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 334.27, _1080p * 406.27, _1080p * 50.5, _1080p * 57.64, 170 )
				end,
				function ()
					return self.Bar5Under:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 334.27, _1080p * 458.62, _1080p * 50.5, _1080p * 57.64, 459 )
				end,
				function ()
					return self.Bar5Under:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 334.27, _1080p * 457.45, _1080p * 50.5, _1080p * 57.64, 470 )
				end,
				function ()
					return self.Bar5Under:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 334.27, _1080p * 398.32, _1080p * 50.5, _1080p * 57.64, 590 )
				end,
				function ()
					return self.Bar5Under:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 334.27, _1080p * 425.61, _1080p * 50.5, _1080p * 57.64, 1089 )
				end,
				function ()
					return self.Bar5Under:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 334.27, _1080p * 402.27, _1080p * 50.5, _1080p * 57.64, 220 )
				end
			}
		} )
		Bar5:RegisterAnimationSequence( "AnimLoop", {
			{
				function ()
					return self.Bar5:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 334.27, _1080p * 389.27, _1080p * 50.5, _1080p * 57.64, 0 )
				end,
				function ()
					return self.Bar5:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 334.27, _1080p * 393.27, _1080p * 50.5, _1080p * 57.64, 170 )
				end,
				function ()
					return self.Bar5:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 334.27, _1080p * 450.62, _1080p * 50.5, _1080p * 57.64, 459 )
				end,
				function ()
					return self.Bar5:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 334.27, _1080p * 451.45, _1080p * 50.5, _1080p * 57.64, 470 )
				end,
				function ()
					return self.Bar5:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 334.27, _1080p * 370.14, _1080p * 50.5, _1080p * 57.64, 590 )
				end,
				function ()
					return self.Bar5:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 334.27, _1080p * 396.13, _1080p * 50.5, _1080p * 57.64, 409 )
				end,
				function ()
					return self.Bar5:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 334.27, _1080p * 408.95, _1080p * 50.5, _1080p * 57.64, 680 )
				end,
				function ()
					return self.Bar5:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 334.27, _1080p * 389.27, _1080p * 50.5, _1080p * 57.64, 220 )
				end
			}
		} )
		Bar6Under:RegisterAnimationSequence( "AnimLoop", {
			{
				function ()
					return self.Bar6Under:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 334.27, _1080p * 376.27, _1080p * 81.5, _1080p * 88.64, 0 )
				end,
				function ()
					return self.Bar6Under:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 334.27, _1080p * 462.27, _1080p * 81.5, _1080p * 88.64, 839 )
				end,
				function ()
					return self.Bar6Under:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 334.27, _1080p * 436.09, _1080p * 81.5, _1080p * 88.64, 1160 )
				end,
				function ()
					return self.Bar6Under:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 334.27, _1080p * 424.56, _1080p * 81.5, _1080p * 88.64, 359 )
				end,
				function ()
					return self.Bar6Under:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 334.27, _1080p * 416.72, _1080p * 81.5, _1080p * 88.64, 210 )
				end,
				function ()
					return self.Bar6Under:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 334.27, _1080p * 376.27, _1080p * 81.5, _1080p * 88.64, 430 )
				end
			}
		} )
		Bar6:RegisterAnimationSequence( "AnimLoop", {
			{
				function ()
					return self.Bar6:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 334.27, _1080p * 364.27, _1080p * 81.5, _1080p * 88.64, 0 )
				end,
				function ()
					return self.Bar6:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 334.27, _1080p * 456.27, _1080p * 81.5, _1080p * 88.64, 839 )
				end,
				function ()
					return self.Bar6:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 334.27, _1080p * 426.87, _1080p * 81.5, _1080p * 88.64, 1160 )
				end,
				function ()
					return self.Bar6:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 334.27, _1080p * 364.27, _1080p * 81.5, _1080p * 88.64, 1000 )
				end
			}
		} )
		self._sequences.AnimLoop = function ()
			Bar1Under:AnimateLoop( "AnimLoop" )
			Bar1:AnimateLoop( "AnimLoop" )
			Bar2Under:AnimateLoop( "AnimLoop" )
			Bar2:AnimateLoop( "AnimLoop" )
			Bar3Under:AnimateLoop( "AnimLoop" )
			Bar3:AnimateLoop( "AnimLoop" )
			Bar4Under:AnimateLoop( "AnimLoop" )
			Bar4:AnimateLoop( "AnimLoop" )
			Bar5Under:AnimateLoop( "AnimLoop" )
			Bar5:AnimateLoop( "AnimLoop" )
			Bar6Under:AnimateLoop( "AnimLoop" )
			Bar6:AnimateLoop( "AnimLoop" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	ACTIONS.AnimateSequence( self, "AnimLoop" )
	return self
end

MenuBuilder.registerType( "CapopsTechyB", CapopsTechyB )
LockTable( _M )
