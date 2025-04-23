local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function GimmeStreak( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 60 * _1080p, 0, 60 * _1080p )
	self.id = "GimmeStreak"
	self._animationSets = {}
	self._sequences = {}
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local Streak = nil
	
	Streak = MenuBuilder.BuildRegisteredType( "Streak", {
		controllerIndex = f1_local1
	} )
	Streak.id = "Streak"
	Streak:SetDataSource( DataSources.inGame.player.gimmeStreak, f1_local1 )
	Streak:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, 0, 0 )
	self:addElement( Streak )
	self.Streak = Streak
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		Streak:RegisterAnimationSequence( "Hidden", {
			{
				function ()
					return self.Streak:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.Hidden = function ()
			Streak:AnimateSequence( "Hidden" )
		end
		
		Streak:RegisterAnimationSequence( "Visible", {
			{
				function ()
					return self.Streak:SetAlpha( 1, 0 )
				end
			}
		} )
		self._sequences.Visible = function ()
			Streak:AnimateSequence( "Visible" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	Streak:SetDataSource( DataSources.inGame.player.gimmeStreak, f1_local1 )
	self:SubscribeToModelThroughElement( self, "isActive", function ()
		local f8_local0 = self:GetDataSource()
		if f8_local0.isActive:GetValue( f1_local1 ) ~= nil then
			f8_local0 = self:GetDataSource()
			if f8_local0.isActive:GetValue( f1_local1 ) == true then
				ACTIONS.AnimateSequence( self, "Visible" )
			end
		end
		f8_local0 = self:GetDataSource()
		if f8_local0.isActive:GetValue( f1_local1 ) ~= nil then
			f8_local0 = self:GetDataSource()
			if f8_local0.isActive:GetValue( f1_local1 ) == false then
				ACTIONS.AnimateSequence( self, "Hidden" )
			end
		end
	end )
	return self
end

MenuBuilder.registerType( "GimmeStreak", GimmeStreak )
LockTable( _M )
