local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ( f1_arg0, f1_arg1, f1_arg2 )
	f1_arg0.Fill:SetMask( f1_arg0.Mask )
	f1_arg0:SetBlendMode( BLEND_MODE.addWithAlpha )
	local f1_local0 = DataSources.inGame.jackal.boosterCharge:GetModel( f1_arg1 )
	local f1_local1 = DataSources.inGame.jackal.boostersCharging:GetModel( f1_arg1 )
	local f1_local2 = DataSources.inGame.jackal.launchState:GetModel( f1_arg1 )
	local f1_local3 = function ( f2_arg0 )
		local f2_local0 = nil
		if not DataModel.GetModelValue( f1_local1 ) or DataModel.GetModelValue( f1_local2 ) > JackalLaunchStates.Hover then
			f2_local0 = "Default"
		else
			local f2_local1 = DataModel.GetModelValue( f1_local0 )
			if f2_local1 < 1 then
				f2_local0 = "Priming"
			else
				f2_local0 = "Primed"
			end
			f1_arg0.Fill:SetTop( _1080p * Multiply( f2_local1, -750 ), 100 )
		end
		if f2_local0 ~= nil then
			ACTIONS.AnimateSequence( f1_arg0, f2_local0 )
		end
	end
	
	f1_arg0:SubscribeToModel( f1_local0, f1_local3, true )
	f1_arg0:SubscribeToModel( f1_local1, f1_local3, true )
end

function JackalLaunchOverlayCurveRight( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 128 * _1080p, 0, 750 * _1080p )
	self.id = "JackalLaunchOverlayCurveRight"
	self._animationSets = {}
	self._sequences = {}
	local f3_local1 = controller and controller.controllerIndex
	if not f3_local1 and not Engine.InFrontend() then
		f3_local1 = self:getRootController()
	end
	assert( f3_local1 )
	local f3_local2 = self
	local Fill = nil
	
	Fill = LUI.UIImage.new()
	Fill.id = "Fill"
	Fill:SetRGBFromTable( SWATCHES.jackal.launchPrimeBar, 0 )
	Fill:SetBlendMode( BLEND_MODE.addWithAlpha )
	Fill:SetAnchorsAndPosition( 1, 0, 1, 0, _1080p * -128, 0, 0, 0 )
	self:addElement( Fill )
	self.Fill = Fill
	
	local Mask = nil
	
	Mask = LUI.UIImage.new()
	Mask.id = "Mask"
	Mask:SetZRotation( 180, 0 )
	Mask:setImage( RegisterMaterial( "hud_jackal_launch_curved_prime_bar_mask" ), 0 )
	Mask:SetAnchorsAndPosition( 1, 0, 0.5, 0.5, _1080p * -128, 0, _1080p * -374, _1080p * 374 )
	self:addElement( Mask )
	self.Mask = Mask
	
	local Bracket = nil
	
	Bracket = LUI.UIImage.new()
	Bracket.id = "Bracket"
	Bracket:SetAlpha( 0.8, 0 )
	Bracket:SetZRotation( 180, 0 )
	Bracket:setImage( RegisterMaterial( "hud_jackal_launch_curved_edge_bracket" ), 0 )
	Bracket:SetAnchorsAndPosition( 1, 0, 0.5, 0.5, _1080p * -128, 0, _1080p * -374, _1080p * 374 )
	self:addElement( Bracket )
	self.Bracket = Bracket
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		Fill:RegisterAnimationSequence( "Default", {
			{
				function ()
					return self.Fill:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.Default = function ()
			Fill:AnimateSequence( "Default" )
		end
		
		Fill:RegisterAnimationSequence( "Priming", {
			{
				function ()
					return self.Fill:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.Fill:SetRGBFromTable( SWATCHES.jackal.launchPrimeBar, 0 )
				end
			}
		} )
		self._sequences.Priming = function ()
			Fill:AnimateSequence( "Priming" )
		end
		
		Fill:RegisterAnimationSequence( "Primed", {
			{
				function ()
					return self.Fill:SetAlpha( 1, 0 )
				end,
				function ()
					return self.Fill:SetAlpha( 0, 50 )
				end,
				function ()
					return self.Fill:SetAlpha( 1, 50 )
				end
			},
			{
				function ()
					return self.Fill:SetRGBFromTable( SWATCHES.jackal.boosterEngaged, 0 )
				end
			}
		} )
		self._sequences.Primed = function ()
			Fill:AnimateLoop( "Primed" )
		end
		
		Fill:RegisterAnimationSequence( "Engaged", {
			{
				function ()
					return self.Fill:SetAlpha( 1, 0 )
				end
			}
		} )
		self._sequences.Engaged = function ()
			Fill:AnimateSequence( "Engaged" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	f0_local0( self, f3_local1, controller )
	return self
end

MenuBuilder.registerType( "JackalLaunchOverlayCurveRight", JackalLaunchOverlayCurveRight )
LockTable( _M )
