local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function PostLoadFunc( f1_arg0, f1_arg1, f1_arg2 )
	f1_arg0:SetYRotation( -15 )
	f1_arg0:SetXRotation( -15 )
end

function HardpointIcon( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 64 * _1080p, 0, 64 * _1080p )
	self.id = "HardpointIcon"
	self._animationSets = {}
	self._sequences = {}
	local f2_local1 = controller and controller.controllerIndex
	if not f2_local1 and not Engine.InFrontend() then
		f2_local1 = self:getRootController()
	end
	assert( f2_local1 )
	local f2_local2 = self
	local Icon = nil
	
	Icon = LUI.UIImage.new()
	Icon.id = "Icon"
	Icon:setImage( RegisterMaterial( "hud_icon_hardpoint" ), 0 )
	Icon:BindColorToModel( DataSources.inGame.MP.hardpointStatusColor:GetModel( f2_local1 ) )
	self:addElement( Icon )
	self.Icon = Icon
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		Icon:RegisterAnimationSequence( "Hide", {
			{
				function ()
					return self.Icon:SetAlpha( 0, 200 )
				end
			}
		} )
		self._sequences.Hide = function ()
			Icon:AnimateSequence( "Hide" )
		end
		
		Icon:RegisterAnimationSequence( "Show", {
			{
				function ()
					return self.Icon:SetAlpha( 1, 300 )
				end
			},
			{
				function ()
					return self.Icon:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, 0, 0, 850 )
				end,
				function ()
					return self.Icon:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, _1080p * 7, _1080p * 7, 149, LUI.EASING.outQuadratic )
				end,
				function ()
					return self.Icon:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, 0, 0, 149, LUI.EASING.outQuadratic )
				end
			}
		} )
		self._sequences.Show = function ()
			Icon:AnimateLoop( "Show" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	Icon:SubscribeToModel( DataSources.inGame.MP.atHardpoint:GetModel( f2_local1 ), function ()
		if DataSources.inGame.MP.atHardpoint:GetValue( f2_local1 ) ~= nil and DataSources.inGame.MP.atHardpoint:GetValue( f2_local1 ) == true then
			ACTIONS.AnimateSequence( self, "Show" )
		end
		if DataSources.inGame.MP.atHardpoint:GetValue( f2_local1 ) ~= nil and DataSources.inGame.MP.atHardpoint:GetValue( f2_local1 ) == false then
			ACTIONS.AnimateSequence( self, "Hide" )
		end
	end )
	self:SubscribeToModel( DataSources.inGame.MP.atHardpoint:GetModel( f2_local1 ), function ()
		if DataSources.inGame.MP.atHardpoint:GetValue( f2_local1 ) ~= nil and DataSources.inGame.MP.atHardpoint:GetValue( f2_local1 ) == true then
			ACTIONS.AnimateSequence( self, "Show" )
		end
		if DataSources.inGame.MP.atHardpoint:GetValue( f2_local1 ) ~= nil and DataSources.inGame.MP.atHardpoint:GetValue( f2_local1 ) == false then
			ACTIONS.AnimateSequence( self, "Hide" )
		end
	end )
	PostLoadFunc( self, f2_local1, controller )
	ACTIONS.AnimateSequence( self, "Hide" )
	return self
end

MenuBuilder.registerType( "HardpointIcon", HardpointIcon )
LockTable( _M )
