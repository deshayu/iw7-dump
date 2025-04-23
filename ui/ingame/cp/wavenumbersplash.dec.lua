local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function waveNumberSplash( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 256 * _1080p, 0, 423 * _1080p )
	self.id = "waveNumberSplash"
	self._animationSets = {}
	self._sequences = {}
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local ClapboardArm = nil
	
	ClapboardArm = MenuBuilder.BuildRegisteredType( "CPClapboardArm", {
		controllerIndex = f1_local1
	} )
	ClapboardArm.id = "ClapboardArm"
	ClapboardArm:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 14, _1080p * 15, _1080p * 259, _1080p * 291 )
	self:addElement( ClapboardArm )
	self.ClapboardArm = ClapboardArm
	
	local ClapboardBase = nil
	
	ClapboardBase = MenuBuilder.BuildRegisteredType( "CPClapboardBase", {
		controllerIndex = f1_local1
	} )
	ClapboardBase.id = "ClapboardBase"
	ClapboardBase:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 6, _1080p * 7, _1080p * 264, _1080p * 304 )
	self:addElement( ClapboardBase )
	self.ClapboardBase = ClapboardBase
	
	self._animationSets.DefaultAnimationSet = function ()
		ClapboardArm:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.ClapboardArm:SetAlpha( 0, 0 )
				end
			}
		} )
		ClapboardBase:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.ClapboardBase:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.DefaultSequence = function ()
			ClapboardArm:AnimateSequence( "DefaultSequence" )
			ClapboardBase:AnimateSequence( "DefaultSequence" )
		end
		
		ClapboardArm:RegisterAnimationSequence( "show", {
			{
				function ()
					return self.ClapboardArm:SetAlpha( 0, 0 )
				end,
				function ()
					return self.ClapboardArm:SetAlpha( 1, 150 )
				end
			},
			{
				function ()
					return self.ClapboardArm:SetZRotation( 0, 1500 )
				end,
				function ()
					return self.ClapboardArm:SetZRotation( 60, 300, LUI.EASING.outBack )
				end,
				function ()
					return self.ClapboardArm:SetZRotation( 0, 200, LUI.EASING.outBack )
				end
			}
		} )
		ClapboardBase:RegisterAnimationSequence( "show", {
			{
				function ()
					return self.ClapboardBase:SetAlpha( 0, 0 )
				end,
				function ()
					return self.ClapboardBase:SetAlpha( 1, 150 )
				end
			},
			{
				function ()
					return self.ClapboardBase:SetZRotation( 0, 1880 )
				end,
				function ()
					return self.ClapboardBase:SetZRotation( -4, 40 )
				end,
				function ()
					return self.ClapboardBase:SetZRotation( 0, 80 )
				end
			}
		} )
		self._sequences.show = function ()
			ClapboardArm:AnimateSequence( "show" )
			ClapboardBase:AnimateSequence( "show" )
		end
		
		ClapboardArm:RegisterAnimationSequence( "hide", {
			{
				function ()
					return self.ClapboardArm:SetAlpha( 1, 0 )
				end,
				function ()
					return self.ClapboardArm:SetAlpha( 0, 200 )
				end
			}
		} )
		ClapboardBase:RegisterAnimationSequence( "hide", {
			{
				function ()
					return self.ClapboardBase:SetAlpha( 1, 0 )
				end,
				function ()
					return self.ClapboardBase:SetAlpha( 0, 200 )
				end
			}
		} )
		self._sequences.hide = function ()
			ClapboardArm:AnimateSequence( "hide" )
			ClapboardBase:AnimateSequence( "hide" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	self:addEventHandler( "message_queue_show", function ( f22_arg0, f22_arg1 )
		local f22_local0 = f22_arg1.controller or f1_local1
		ACTIONS.AnimateSequence( self, "show" )
	end )
	self:addEventHandler( "message_queue_hide", function ( f23_arg0, f23_arg1 )
		local f23_local0 = f23_arg1.controller or f1_local1
		ACTIONS.AnimateSequence( self, "hide" )
	end )
	ACTIONS.AnimateSequence( self, "DefaultSequence" )
	return self
end

MenuBuilder.registerType( "waveNumberSplash", waveNumberSplash )
LockTable( _M )
