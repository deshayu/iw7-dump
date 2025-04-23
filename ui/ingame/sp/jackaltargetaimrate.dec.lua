local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function PostLoadFunc( f1_arg0, f1_arg1 )
	f1_arg0:SubscribeToModel( DataSources.inGame.jackal.noGunsModeActive:GetModel( f1_arg1 ), function ()
		local f2_local0 = function ( f3_arg0, f3_arg1 )
			local f3_local0 = f3_arg1.controller or controller
			if DataSources.inGame.jackal.noGunsModeActive:GetValue( f1_arg1 ) ~= nil and DataSources.inGame.jackal.noGunsModeActive:GetValue( f1_arg1 ) == true then
				ACTIONS.AnimateSequence( f1_arg0, "guns_disabled" )
			end
			if DataSources.inGame.jackal.noGunsModeActive:GetValue( f1_arg1 ) ~= nil and DataSources.inGame.jackal.noGunsModeActive:GetValue( f1_arg1 ) == false then
				ACTIONS.AnimateSequence( f1_arg0, "guns_enabled" )
			end
		end
		
		f2_local0( f1_arg0, {
			name = "datasource_event"
		} )
	end, true )
end

function JackalTargetAimRate( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 48 * _1080p, 0, 48 * _1080p )
	self.id = "JackalTargetAimRate"
	self._animationSets = {}
	self._sequences = {}
	local f4_local1 = controller and controller.controllerIndex
	if not f4_local1 and not Engine.InFrontend() then
		f4_local1 = self:getRootController()
	end
	assert( f4_local1 )
	self.soundSet = "jackal"
	local f4_local2 = self
	local TargetAimRatePieces = nil
	
	TargetAimRatePieces = MenuBuilder.BuildRegisteredType( "jackalTargetAimRatePieces", {
		controllerIndex = f4_local1
	} )
	TargetAimRatePieces.id = "TargetAimRatePieces"
	TargetAimRatePieces:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -24, _1080p * 24, _1080p * -24, _1080p * 24 )
	self:addElement( TargetAimRatePieces )
	self.TargetAimRatePieces = TargetAimRatePieces
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		TargetAimRatePieces:RegisterAnimationSequence( "guns_disabled", {
			{
				function ()
					return self.TargetAimRatePieces:SetAlpha( 1, 0 )
				end,
				function ()
					return self.TargetAimRatePieces:SetAlpha( 0, 170 )
				end
			},
			{
				function ()
					return self.TargetAimRatePieces:SetScale( 0, 0 )
				end,
				function ()
					return self.TargetAimRatePieces:SetScale( 0.8, 170 )
				end
			}
		} )
		self._sequences.guns_disabled = function ()
			TargetAimRatePieces:AnimateSequence( "guns_disabled" )
		end
		
		TargetAimRatePieces:RegisterAnimationSequence( "guns_enabled", {
			{
				function ()
					return self.TargetAimRatePieces:SetAlpha( 0, 0 )
				end,
				function ()
					return self.TargetAimRatePieces:SetAlpha( 1, 190 )
				end
			},
			{
				function ()
					return self.TargetAimRatePieces:SetScale( 0.8, 0 )
				end,
				function ()
					return self.TargetAimRatePieces:SetScale( 0, 190 )
				end
			}
		} )
		self._sequences.guns_enabled = function ()
			TargetAimRatePieces:AnimateSequence( "guns_enabled" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	PostLoadFunc( self, f4_local1, controller )
	return self
end

MenuBuilder.registerType( "JackalTargetAimRate", JackalTargetAimRate )
LockTable( _M )
