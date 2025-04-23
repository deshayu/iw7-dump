local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ( f1_arg0, f1_arg1, f1_arg2 )
	assert( type( f1_arg1 ) == "number" )
	assert( type( f1_arg2 ) == "number" )
	f1_arg0.Fill:SetAnchorsAndPosition( 0, 1 - LUI.clamp( f1_arg1, 0, 1 ), 0, 0, 0, 0, 0, 0, f1_arg2 )
	ACTIONS.AnimateSequence( f1_arg0, "Pulse" )
end

f0_local1 = function ( f2_arg0, f2_arg1, f2_arg2 )
	f2_arg0.SetProgress = f0_local0
	local f2_local0 = DataSources.inGame.CP.zombies.afterlifeSoulPowerEarned
	local f2_local1 = DataSources.inGame.CP.zombies.afterlifeSoulPowerGoal
	f2_arg0:SubscribeToModel( f2_local0:GetModel( f2_arg1 ), function ()
		local f3_local0 = f2_local0:GetValue( f2_arg1 )
		local f3_local1 = f2_local1:GetValue( f2_arg1 )
		local f3_local2 = nil
		if f3_local1 == 0 then
			f3_local2 = 0
		else
			f3_local2 = f3_local0 / f3_local1
		end
		if f3_local2 then
			f2_arg0:SetProgress( f3_local2, 100 )
		end
	end )
end

function AfterLifeProgressBar( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 300 * _1080p, 0, 10 * _1080p )
	self.id = "AfterLifeProgressBar"
	self._animationSets = {}
	self._sequences = {}
	local f4_local1 = controller and controller.controllerIndex
	if not f4_local1 and not Engine.InFrontend() then
		f4_local1 = self:getRootController()
	end
	assert( f4_local1 )
	local f4_local2 = self
	local Background = nil
	
	Background = LUI.UIImage.new()
	Background.id = "Background"
	Background:SetAlpha( 0.25, 0 )
	Background:SetUseAA( true )
	Background:SetBlendMode( BLEND_MODE.addWithAlpha )
	self:addElement( Background )
	self.Background = Background
	
	local Fill = nil
	
	Fill = LUI.UIImage.new()
	Fill.id = "Fill"
	Fill:SetRGBFromTable( SWATCHES.ZombiesAfterLife.FillColor, 0 )
	Fill:SetUseAA( true )
	Fill:SetAnchorsAndPosition( 0, 1, 0, 0, 0, 0, 0, 0 )
	self:addElement( Fill )
	self.Fill = Fill
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		Fill:RegisterAnimationSequence( "Pulse", {
			{
				function ()
					return self.Fill:SetRGBFromInt( 16777215, 0 )
				end,
				function ()
					return self.Fill:SetRGBFromTable( SWATCHES.ZombiesAfterLife.FillColor, 1000 )
				end
			}
		} )
		self._sequences.Pulse = function ()
			Fill:AnimateSequence( "Pulse" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	f0_local1( self, f4_local1, controller )
	return self
end

MenuBuilder.registerType( "AfterLifeProgressBar", AfterLifeProgressBar )
LockTable( _M )
