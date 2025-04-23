local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function PostLoadFunc( f1_arg0, f1_arg1, f1_arg2 )
	local f1_local0 = math.random( 10, 40 ) * 0.01
	f1_arg0:RegisterAnimationSequence( "update", {
		{
			function ()
				return f1_arg0:SetAlpha( f1_local0, 30 )
			end,
			function ()
				return f1_arg0:SetAlpha( 0, math.random( 100, 1000 ) )
			end,
			function ()
				return f1_arg0:SetAlpha( f1_local0, 0 )
			end,
			function ()
				return f1_arg0:SetAlpha( f1_local0, 30 )
			end,
			function ()
				return f1_arg0:SetAlpha( 0, 0 )
			end,
			function ()
				return f1_arg0:SetAlpha( 0, 30 )
			end,
			function ()
				return f1_arg0:SetAlpha( f1_local0, 0 )
			end,
			function ()
				return f1_arg0:SetAlpha( f1_local0, 30 )
			end,
			function ()
				return f1_arg0:SetAlpha( 0, 0 )
			end,
			function ()
				return f1_arg0:SetAlpha( 0, 30 )
			end,
			function ()
				return f1_arg0:SetAlpha( f1_local0, 100 )
			end
		}
	} )
	f1_arg0:AnimateSequence( "update" )
end

function LocationSelectorGridCell( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 128 * _1080p, 0, 128 * _1080p )
	self.id = "LocationSelectorGridCell"
	local f13_local1 = controller and controller.controllerIndex
	if not f13_local1 and not Engine.InFrontend() then
		f13_local1 = self:getRootController()
	end
	assert( f13_local1 )
	local f13_local2 = self
	local cell = nil
	
	cell = LUI.UIImage.new()
	cell.id = "cell"
	cell:SetRGBFromInt( 0, 0 )
	self:addElement( cell )
	self.cell = cell
	
	PostLoadFunc( self, f13_local1, controller )
	return self
end

MenuBuilder.registerType( "LocationSelectorGridCell", LocationSelectorGridCell )
LockTable( _M )
