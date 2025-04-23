local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function MarsRemoteMissileReticle( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 70 * _1080p, 0, 70 * _1080p )
	self.id = "MarsRemoteMissileReticle"
	self._animationSets = {}
	self._sequences = {}
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local CrossBig = nil
	
	CrossBig = MenuBuilder.BuildRegisteredType( "GenericReticleCrosshairs", {
		controllerIndex = f1_local1
	} )
	CrossBig.id = "CrossBig"
	CrossBig:SetRGBFromTable( SWATCHES.c12.lockOnIcon, 0 )
	CrossBig:SetAlpha( 0, 0 )
	CrossBig.rightLine:SetLeft( _1080p * -45, 0 )
	CrossBig.rightLine:SetTop( _1080p * -0.5, 0 )
	CrossBig.rightLine:SetBottom( _1080p * 0.5, 0 )
	CrossBig.leftLine:SetRight( _1080p * 45, 0 )
	CrossBig.leftLine:SetTop( _1080p * -0.5, 0 )
	CrossBig.leftLine:SetBottom( _1080p * 0.5, 0 )
	CrossBig.bottomLine:SetLeft( _1080p * -0.5, 0 )
	CrossBig.bottomLine:SetRight( _1080p * 0.5, 0 )
	CrossBig.bottomLine:SetTop( _1080p * -45, 0 )
	CrossBig.topLine:SetLeft( _1080p * -0.5, 0 )
	CrossBig.topLine:SetRight( _1080p * 0.5, 0 )
	CrossBig.topLine:SetBottom( _1080p * 45, 0 )
	CrossBig:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * -10, _1080p * 10, _1080p * -10, _1080p * 10 )
	self:addElement( CrossBig )
	self.CrossBig = CrossBig
	
	local Box = nil
	
	Box = MenuBuilder.BuildRegisteredType( "GenericBoxFillAndStroke", {
		controllerIndex = f1_local1
	} )
	Box.id = "Box"
	Box:SetZRotation( 45, 0 )
	Box:SetScale( -0.5, 0 )
	Box.Fill:SetAlpha( 0, 0 )
	Box.Stroke:SetRGBFromTable( SWATCHES.c12.lockOnIcon, 0 )
	Box.Stroke:SetBorderThicknessLeft( _1080p * 4, 0 )
	Box.Stroke:SetBorderThicknessRight( _1080p * 4, 0 )
	Box.Stroke:SetBorderThicknessTop( _1080p * 4, 0 )
	Box.Stroke:SetBorderThicknessBottom( _1080p * 4, 0 )
	Box:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, 0, 0 )
	self:addElement( Box )
	self.Box = Box
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		CrossBig:RegisterAnimationSequence( "enemy", {
			{
				function ()
					return self.CrossBig:SetAlpha( 0, 0 )
				end
			},
			{
				function ()
					return self.CrossBig:SetRGBFromTable( SWATCHES.HUD.warning, 0 )
				end
			}
		} )
		Box:RegisterAnimationSequence( "enemy", {
			{
				function ()
					return self.Box.Stroke:SetRGBFromTable( SWATCHES.c12.lockOnIcon, 0 )
				end
			},
			{
				function ()
					return self.Box:SetScale( -0.5, 0 )
				end,
				function ()
					return self.Box:SetScale( -0.25, 100 )
				end,
				function ()
					return self.Box:SetScale( -0.5, 100 )
				end
			},
			{
				function ()
					return self.Box:SetZRotation( 0, 0 )
				end,
				function ()
					return self.Box:SetZRotation( -45, 200 )
				end
			}
		} )
		self._sequences.enemy = function ()
			CrossBig:AnimateSequence( "enemy" )
			Box:AnimateSequence( "enemy" )
		end
		
		CrossBig:RegisterAnimationSequence( "friendly", {
			{
				function ()
					return self.CrossBig:SetAlpha( 0, 0 )
				end
			}
		} )
		Box:RegisterAnimationSequence( "friendly", {
			{
				function ()
					return self.Box:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.Box:SetZRotation( 0, 0 )
				end
			},
			{
				function ()
					return self.Box.Stroke:SetRGBFromTable( SWATCHES.HUD.friendlyTeam, 0 )
				end
			},
			{
				function ()
					return self.Box:SetScale( -0.5, 0 )
				end,
				function ()
					return self.Box:SetScale( -0.25, 100 )
				end,
				function ()
					return self.Box:SetScale( -0.5, 100 )
				end
			}
		} )
		self._sequences.friendly = function ()
			CrossBig:AnimateSequence( "friendly" )
			Box:AnimateSequence( "friendly" )
		end
		
		CrossBig:RegisterAnimationSequence( "aagun", {
			{
				function ()
					return self.CrossBig:SetAlpha( 0, 190 )
				end,
				function ()
					return self.CrossBig:SetAlpha( 1, 10 )
				end
			},
			{
				function ()
					return self.CrossBig.rightLine:SetLeft( _1080p * 0, 200 )
				end,
				function ()
					return self.CrossBig.rightLine:SetLeft( _1080p * -45, 100 )
				end
			},
			{
				function ()
					return self.CrossBig.leftLine:SetRight( _1080p * 0, 200 )
				end,
				function ()
					return self.CrossBig.leftLine:SetRight( _1080p * 45, 100 )
				end
			},
			{
				function ()
					return self.CrossBig.bottomLine:SetTop( _1080p * 0, 200 )
				end,
				function ()
					return self.CrossBig.bottomLine:SetTop( _1080p * -45, 100 )
				end
			},
			{
				function ()
					return self.CrossBig.topLine:SetBottom( _1080p * 0, 200 )
				end,
				function ()
					return self.CrossBig.topLine:SetBottom( _1080p * 45, 100 )
				end
			}
		} )
		Box:RegisterAnimationSequence( "aagun", {
			{
				function ()
					return self.Box:SetZRotation( 0, 0 )
				end,
				function ()
					return self.Box:SetZRotation( -45, 200 )
				end
			},
			{
				function ()
					return self.Box:SetScale( -0.5, 0 )
				end,
				function ()
					return self.Box:SetScale( 0.5, 100 )
				end,
				function ()
					return self.Box:SetScale( 0, 100 )
				end
			},
			{
				function ()
					return self.Box.Stroke:SetRGBFromTable( SWATCHES.c12.lockOnIcon, 0 )
				end
			}
		} )
		self._sequences.aagun = function ()
			CrossBig:AnimateSequence( "aagun" )
			Box:AnimateSequence( "aagun" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	self:SubscribeToModelThroughElement( self, "lockState", function ()
		local f38_local0 = self:GetDataSource()
		if f38_local0.lockState:GetValue( f1_local1 ) ~= nil then
			f38_local0 = self:GetDataSource()
			if f38_local0.lockState:GetValue( f1_local1 ) == 0 then
				ACTIONS.AnimateSequence( self, "friendly" )
			end
		end
		f38_local0 = self:GetDataSource()
		if f38_local0.lockState:GetValue( f1_local1 ) ~= nil then
			f38_local0 = self:GetDataSource()
			if f38_local0.lockState:GetValue( f1_local1 ) == 1 then
				ACTIONS.AnimateSequence( self, "enemy" )
			end
		end
		f38_local0 = self:GetDataSource()
		if f38_local0.lockState:GetValue( f1_local1 ) ~= nil then
			f38_local0 = self:GetDataSource()
			if f38_local0.lockState:GetValue( f1_local1 ) == 2 then
				ACTIONS.AnimateSequence( self, "aagun" )
			end
		end
	end )
	return self
end

MenuBuilder.registerType( "MarsRemoteMissileReticle", MarsRemoteMissileReticle )
LockTable( _M )
