local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ( f1_arg0, f1_arg1, f1_arg2 )
	assert( f1_arg0.progressBar )
	local f1_local0 = DataSources.inGame.CP.zombies.ghost.entanglerProgress
	f1_arg0:SubscribeToModel( f1_local0:GetModel( f1_arg1 ), function ()
		f1_arg0.progressBar:SetRightAnchor( 1 - LUI.clamp( f1_local0:GetValue( f1_arg1 ), 0, 1 ) )
	end )
end

function DeathRayCannonProgressBar( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 300 * _1080p, 0, 50 * _1080p )
	self.id = "DeathRayCannonProgressBar"
	self._animationSets = {}
	self._sequences = {}
	local f3_local1 = controller and controller.controllerIndex
	if not f3_local1 and not Engine.InFrontend() then
		f3_local1 = self:getRootController()
	end
	assert( f3_local1 )
	local f3_local2 = self
	local progressBarBorder = nil
	
	progressBarBorder = LUI.UIImage.new()
	progressBarBorder.id = "progressBarBorder"
	progressBarBorder:SetRGBFromInt( 2236448, 0 )
	progressBarBorder:SetAlpha( 0.8, 0 )
	progressBarBorder:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, _1080p * 16.5, _1080p * 37.61 )
	self:addElement( progressBarBorder )
	self.progressBarBorder = progressBarBorder
	
	local progressBar = nil
	
	progressBar = LUI.UIImage.new()
	progressBar.id = "progressBar"
	progressBar:setImage( RegisterMaterial( "cp_zmb_ghost_skull_fill_bar" ), 0 )
	progressBar:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 0, _1080p * 11.61, _1080p * 43.61 )
	self:addElement( progressBar )
	self.progressBar = progressBar
	
	local tracking = nil
	
	tracking = LUI.UIText.new()
	tracking.id = "tracking"
	tracking:setText( Engine.Localize( "CP_TOWN_RECHARGING" ), 0 )
	tracking:SetFontSize( 19 * _1080p )
	tracking:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	tracking:SetAlignment( LUI.Alignment.Center )
	tracking:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -150, _1080p * 150, _1080p * 19.11, _1080p * 36.11 )
	self:addElement( tracking )
	self.tracking = tracking
	
	self._animationSets.DefaultAnimationSet = function ()
		progressBarBorder:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.progressBarBorder:SetAlpha( 0, 50 )
				end
			}
		} )
		progressBar:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.progressBar:SetAlpha( 0, 50 )
				end
			}
		} )
		tracking:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.tracking:SetAlpha( 0, 50 )
				end
			}
		} )
		self._sequences.DefaultSequence = function ()
			progressBarBorder:AnimateSequence( "DefaultSequence" )
			progressBar:AnimateSequence( "DefaultSequence" )
			tracking:AnimateSequence( "DefaultSequence" )
		end
		
		progressBarBorder:RegisterAnimationSequence( "StartUsingDeathRayCannon", {
			{
				function ()
					return self.progressBarBorder:SetAlpha( 0.8, 50 )
				end
			}
		} )
		progressBar:RegisterAnimationSequence( "StartUsingDeathRayCannon", {
			{
				function ()
					return self.progressBar:SetAlpha( 1, 50 )
				end
			}
		} )
		tracking:RegisterAnimationSequence( "StartUsingDeathRayCannon", {
			{
				function ()
					return self.tracking:SetAlpha( 0, 50 )
				end
			}
		} )
		self._sequences.StartUsingDeathRayCannon = function ()
			progressBarBorder:AnimateSequence( "StartUsingDeathRayCannon" )
			progressBar:AnimateSequence( "StartUsingDeathRayCannon" )
			tracking:AnimateSequence( "StartUsingDeathRayCannon" )
		end
		
		progressBarBorder:RegisterAnimationSequence( "EndUsingDeathRayCannon", {
			{
				function ()
					return self.progressBarBorder:SetAlpha( 0, 50 )
				end
			}
		} )
		progressBar:RegisterAnimationSequence( "EndUsingDeathRayCannon", {
			{
				function ()
					return self.progressBar:SetAlpha( 0, 50 )
				end
			}
		} )
		tracking:RegisterAnimationSequence( "EndUsingDeathRayCannon", {
			{
				function ()
					return self.tracking:SetAlpha( 0, 50 )
				end
			}
		} )
		self._sequences.EndUsingDeathRayCannon = function ()
			progressBarBorder:AnimateSequence( "EndUsingDeathRayCannon" )
			progressBar:AnimateSequence( "EndUsingDeathRayCannon" )
			tracking:AnimateSequence( "EndUsingDeathRayCannon" )
		end
		
		progressBarBorder:RegisterAnimationSequence( "recharging", {
			{
				function ()
					return self.progressBarBorder:SetAlpha( 0.8, 50 )
				end
			}
		} )
		progressBar:RegisterAnimationSequence( "recharging", {
			{
				function ()
					return self.progressBar:SetAlpha( 0, 50 )
				end
			}
		} )
		tracking:RegisterAnimationSequence( "recharging", {
			{
				function ()
					return self.tracking:SetAlpha( 1, 50 )
				end
			}
		} )
		self._sequences.recharging = function ()
			progressBarBorder:AnimateSequence( "recharging" )
			progressBar:AnimateSequence( "recharging" )
			tracking:AnimateSequence( "recharging" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	self:SubscribeToModel( DataSources.inGame.CP.zombies.dlc3.deathRayCannonProgressState:GetModel( f3_local1 ), function ()
		if DataSources.inGame.CP.zombies.dlc3.deathRayCannonProgressState:GetValue( f3_local1 ) ~= nil and DataSources.inGame.CP.zombies.dlc3.deathRayCannonProgressState:GetValue( f3_local1 ) == 1 then
			ACTIONS.AnimateSequence( self, "StartUsingDeathRayCannon" )
		end
		if DataSources.inGame.CP.zombies.dlc3.deathRayCannonProgressState:GetValue( f3_local1 ) ~= nil and DataSources.inGame.CP.zombies.dlc3.deathRayCannonProgressState:GetValue( f3_local1 ) == 0 then
			ACTIONS.AnimateSequence( self, "EndUsingDeathRayCannon" )
		end
		if DataSources.inGame.CP.zombies.dlc3.deathRayCannonProgressState:GetValue( f3_local1 ) ~= nil and DataSources.inGame.CP.zombies.dlc3.deathRayCannonProgressState:GetValue( f3_local1 ) == 2 then
			ACTIONS.AnimateSequence( self, "recharging" )
		end
	end )
	f0_local0( self, f3_local1, controller )
	ACTIONS.AnimateSequence( self, "DefaultSequence" )
	return self
end

MenuBuilder.registerType( "DeathRayCannonProgressBar", DeathRayCannonProgressBar )
LockTable( _M )
