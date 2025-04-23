local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function PostLoadFunc( f1_arg0, f1_arg1 )
	local f1_local0 = DataSources.inGame.SP.showPIP:GetModel( f1_arg1 )
	f1_arg0:SubscribeToModel( f1_local0, function ()
		if not DataModel.GetModelValue( f1_local0 ) then
			ACTIONS.AnimateSequence( f1_arg0, "Close" )
		end
	end, true )
end

function ShipAssaultPip( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 538 * _1080p, 0, 308 * _1080p )
	self.id = "ShipAssaultPip"
	self._animationSets = {}
	self._sequences = {}
	local f3_local1 = controller and controller.controllerIndex
	if not f3_local1 and not Engine.InFrontend() then
		f3_local1 = self:getRootController()
	end
	assert( f3_local1 )
	local f3_local2 = self
	local Pip = nil
	
	Pip = LUI.UIImage.new()
	Pip.id = "Pip"
	Pip:setImage( RegisterMaterial( "pip_scene_overlay" ), 0 )
	Pip:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * 12, _1080p * -12, _1080p * 14, _1080p * -14 )
	self:addElement( Pip )
	self.Pip = Pip
	
	local Static = nil
	
	Static = LUI.UIImage.new()
	Static.id = "Static"
	Static:SetAlpha( 0.15, 0 )
	Static:setImage( RegisterMaterial( "hud_jackal_static" ), 0 )
	Static:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * 12, _1080p * -12, _1080p * 14, _1080p * -14 )
	self:addElement( Static )
	self.Static = Static
	
	local Frame = nil
	
	Frame = LUI.UIImage.new()
	Frame.id = "Frame"
	Frame:setImage( RegisterMaterial( "hud_security_pip_frame" ), 0 )
	self:addElement( Frame )
	self.Frame = Frame
	
	self._animationSets.DefaultAnimationSet = function ()
		Pip:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.Pip:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * 269, _1080p * -269, _1080p * 154, _1080p * -154, 0 )
				end,
				function ()
					return self.Pip:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * 12, _1080p * -12, _1080p * 14, _1080p * -14, 500, LUI.EASING.outBack )
				end
			}
		} )
		Static:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.Static:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * 269, _1080p * -269, _1080p * 154, _1080p * -154, 0 )
				end,
				function ()
					return self.Static:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * 12, _1080p * -12, _1080p * 14, _1080p * -14, 500, LUI.EASING.outBack )
				end
			}
		} )
		Frame:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.Frame:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * 269, _1080p * -269, _1080p * 154, _1080p * -154, 0 )
				end,
				function ()
					return self.Frame:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, 0, 0, 500, LUI.EASING.outBack )
				end
			}
		} )
		self._sequences.DefaultSequence = function ()
			Pip:AnimateSequence( "DefaultSequence" )
			Static:AnimateSequence( "DefaultSequence" )
			Frame:AnimateSequence( "DefaultSequence" )
		end
		
		Pip:RegisterAnimationSequence( "Close", {
			{
				function ()
					return self.Pip:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * 12, _1080p * -12, _1080p * 14, _1080p * -14, 0 )
				end,
				function ()
					return self.Pip:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * 269, _1080p * -269, _1080p * 154, _1080p * -154, 500, LUI.EASING.inBack )
				end
			}
		} )
		Static:RegisterAnimationSequence( "Close", {
			{
				function ()
					return self.Static:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * 12, _1080p * -12, _1080p * 14, _1080p * -14, 0 )
				end,
				function ()
					return self.Static:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * 269, _1080p * -269, _1080p * 154, _1080p * -154, 500, LUI.EASING.inBack )
				end
			}
		} )
		Frame:RegisterAnimationSequence( "Close", {
			{
				function ()
					return self.Frame:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, 0, 0, 0 )
				end,
				function ()
					return self.Frame:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * 269, _1080p * -269, _1080p * 154, _1080p * -154, 500, LUI.EASING.inBack )
				end
			}
		} )
		self._sequences.Close = function ()
			Pip:AnimateSequence( "Close" )
			Static:AnimateSequence( "Close" )
			Frame:AnimateSequence( "Close" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	PostLoadFunc( self, f3_local1, controller )
	ACTIONS.AnimateSequence( self, "DefaultSequence" )
	return self
end

MenuBuilder.registerType( "ShipAssaultPip", ShipAssaultPip )
LockTable( _M )
