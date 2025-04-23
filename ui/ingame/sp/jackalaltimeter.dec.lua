local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function JackalAltimeter( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 64 * _1080p, 0, 330 * _1080p )
	self.id = "JackalAltimeter"
	self._animationSets = {}
	self._sequences = {}
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local Bracket = nil
	
	Bracket = LUI.UIImage.new()
	Bracket.id = "Bracket"
	Bracket:setImage( RegisterMaterial( "hud_jackal_launch_meter_bracket" ), 0 )
	Bracket:SetAnchorsAndPosition( 0, 1, 0.5, 0.5, _1080p * 28, _1080p * 60, _1080p * -256, _1080p * 256 )
	self:addElement( Bracket )
	self.Bracket = Bracket
	
	local Arrow = nil
	
	Arrow = LUI.UIImage.new()
	Arrow.id = "Arrow"
	Arrow:SetAlpha( 0.7, 0 )
	Arrow:SetZRotation( 180, 0 )
	Arrow:setImage( RegisterMaterial( "hud_jackal_launch_meter_arrow" ), 0 )
	Arrow:SetAnchorsAndPosition( 0, 1, 0.5, 0.5, _1080p * 36, _1080p * 68, _1080p * -8, _1080p * 8 )
	self:addElement( Arrow )
	self.Arrow = Arrow
	
	local Altimeter = nil
	
	Altimeter = MenuBuilder.BuildRegisteredType( "Altimeter", {
		stretch = 0.4,
		controllerIndex = f1_local1
	} )
	Altimeter.id = "Altimeter"
	Altimeter:SetAlpha( 0.7, 0 )
	Altimeter:setImage( RegisterMaterial( "hud_jackal_launch_alt_meter_numbers" ), 0 )
	Altimeter:SetAnchorsAndPosition( 0, 1, 0.5, 0.5, 0, _1080p * 64, _1080p * -165, _1080p * 165 )
	self:addElement( Altimeter )
	self.Altimeter = Altimeter
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		self._sequences.ShowCharging = function ()
			
		end
		
		self._sequences.HideCharging = function ()
			
		end
		
		Bracket:RegisterAnimationSequence( "ShowAll", {
			{
				function ()
					return self.Bracket:SetAlpha( 1, 0 )
				end
			}
		} )
		Arrow:RegisterAnimationSequence( "ShowAll", {
			{
				function ()
					return self.Arrow:SetAlpha( 0.7, 0 )
				end
			}
		} )
		Altimeter:RegisterAnimationSequence( "ShowAll", {
			{
				function ()
					return self.Altimeter:SetAlpha( 0.7, 0 )
				end
			}
		} )
		self._sequences.ShowAll = function ()
			Bracket:AnimateSequence( "ShowAll" )
			Arrow:AnimateSequence( "ShowAll" )
			Altimeter:AnimateSequence( "ShowAll" )
		end
		
		Bracket:RegisterAnimationSequence( "HideAll", {
			{
				function ()
					return self.Bracket:SetAlpha( 0, 0 )
				end
			}
		} )
		Arrow:RegisterAnimationSequence( "HideAll", {
			{
				function ()
					return self.Arrow:SetAlpha( 0, 0 )
				end
			}
		} )
		Altimeter:RegisterAnimationSequence( "HideAll", {
			{
				function ()
					return self.Altimeter:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.HideAll = function ()
			Bracket:AnimateSequence( "HideAll" )
			Arrow:AnimateSequence( "HideAll" )
			Altimeter:AnimateSequence( "HideAll" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	return self
end

MenuBuilder.registerType( "JackalAltimeter", JackalAltimeter )
LockTable( _M )
