local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function ZomPlayerAbilityBase( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 130 * _1080p, 0, 125 * _1080p )
	self.id = "ZomPlayerAbilityBase"
	self._animationSets = {}
	self._sequences = {}
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local AbilityIcon = nil
	
	AbilityIcon = LUI.UIImage.new()
	AbilityIcon.id = "AbilityIcon"
	AbilityIcon:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -50, _1080p * 50, 0, _1080p * 100 )
	self:addElement( AbilityIcon )
	self.AbilityIcon = AbilityIcon
	
	local PlayerAbilityWarning = nil
	
	PlayerAbilityWarning = MenuBuilder.BuildRegisteredType( "PlayerAbilityWarning", {
		controllerIndex = f1_local1
	} )
	PlayerAbilityWarning.id = "PlayerAbilityWarning"
	PlayerAbilityWarning:SetAlpha( 0, 0 )
	PlayerAbilityWarning:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -60, _1080p * 60, _1080p * -22, _1080p * -2 )
	self:addElement( PlayerAbilityWarning )
	self.PlayerAbilityWarning = PlayerAbilityWarning
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		AbilityIcon:RegisterAnimationSequence( "Available", {
			{
				function ()
					return self.AbilityIcon:SetAlpha( 1, 0 )
				end
			}
		} )
		self._sequences.Available = function ()
			AbilityIcon:AnimateSequence( "Available" )
		end
		
		AbilityIcon:RegisterAnimationSequence( "Unavailable", {
			{
				function ()
					return self.AbilityIcon:SetAlpha( 1, 0 )
				end
			}
		} )
		self._sequences.Unavailable = function ()
			AbilityIcon:AnimateSequence( "Unavailable" )
		end
		
		AbilityIcon:RegisterAnimationSequence( "UpdateAbility", {
			{
				function ()
					return self.AbilityIcon:SetScale( 0.5, 0 )
				end,
				function ()
					return self.AbilityIcon:SetScale( 0, 100 )
				end
			}
		} )
		self._sequences.UpdateAbility = function ()
			AbilityIcon:AnimateSequence( "UpdateAbility" )
		end
		
		AbilityIcon:RegisterAnimationSequence( "AbilityInUse", {
			{
				function ()
					return self.AbilityIcon:SetAlpha( 1, 0 )
				end
			}
		} )
		self._sequences.AbilityInUse = function ()
			AbilityIcon:AnimateSequence( "AbilityInUse" )
		end
		
		PlayerAbilityWarning:RegisterAnimationSequence( "AbilityWarningOn", {
			{
				function ()
					return self.PlayerAbilityWarning:SetAlpha( 1, 0 )
				end
			}
		} )
		self._sequences.AbilityWarningOn = function ()
			PlayerAbilityWarning:AnimateSequence( "AbilityWarningOn" )
		end
		
		PlayerAbilityWarning:RegisterAnimationSequence( "AbilityWarningOff", {
			{
				function ()
					return self.PlayerAbilityWarning:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.AbilityWarningOff = function ()
			PlayerAbilityWarning:AnimateSequence( "AbilityWarningOff" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	return self
end

MenuBuilder.registerType( "ZomPlayerAbilityBase", ZomPlayerAbilityBase )
LockTable( _M )
