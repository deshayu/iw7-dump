local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function JackalThrusterLabel( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 450 * _1080p, 0, 16 * _1080p )
	self.id = "JackalThrusterLabel"
	self._animationSets = {}
	self._sequences = {}
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local Label = nil
	
	Label = LUI.UIText.new()
	Label.id = "Label"
	Label:setText( "-----", 0 )
	Label:SetFontSize( 16 * _1080p )
	Label:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	Label:SetAlignment( LUI.Alignment.Left )
	self:addElement( Label )
	self.Label = Label
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		Label:RegisterAnimationSequence( "thrustersEngaged", {
			{
				function ()
					return self.Label:SetRGBFromTable( SWATCHES.jackal.normal, 300 )
				end
			}
		} )
		self._sequences.thrustersEngaged = function ()
			Label:AnimateSequence( "thrustersEngaged" )
		end
		
		Label:RegisterAnimationSequence( "thrustersDisabled", {
			{
				function ()
					return self.Label:SetRGBFromTable( SWATCHES.jackal.thrustBarWarning, 300 )
				end
			}
		} )
		self._sequences.thrustersDisabled = function ()
			Label:AnimateSequence( "thrustersDisabled" )
		end
		
		Label:RegisterAnimationSequence( "thrustersEnabled", {
			{
				function ()
					return self.Label:SetRGBFromTable( SWATCHES.jackal.normal, 300 )
				end
			}
		} )
		self._sequences.thrustersEnabled = function ()
			Label:AnimateSequence( "thrustersEnabled" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	Label:SubscribeToModel( DataSources.inGame.jackal.isThrusting:GetModel( f1_local1 ), function ()
		ACTIONS.SetText( self.Label, "JACKAL_THRUSTERS_ENGAGED" )
	end )
	return self
end

MenuBuilder.registerType( "JackalThrusterLabel", JackalThrusterLabel )
LockTable( _M )
