local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function BballScoreboards()
	local self = LUI.UIElement.new( {
		topAnchor = true,
		bottomAnchor = false,
		leftAnchor = true,
		rightAnchor = false,
		top = 0,
		bottom = 0,
		left = 0,
		right = 0
	} )
	self.id = "BballScoreboards"
	local f1_local1 = self:getRootController()
	self:SubscribeToModel( DataSources.inGame.CP.zombies.bball_1_widget_alpha:GetModel( f1_local1 ), function ( f2_arg0 )
		if DataModel.GetModelValue( f2_arg0 ) == 0 then
			if self.bball1 then
				self.bball1:closeTree()
				self.bball1 = nil
			end
		elseif not self.bball1 then
			self.bball1 = MenuBuilder.BuildRegisteredType( "bball_scoreboard" )
			self:addElement( self.bball1 )
		end
	end )
	self:SubscribeToModel( DataSources.inGame.CP.zombies.bball_2_widget_alpha:GetModel( f1_local1 ), function ( f3_arg0 )
		if DataModel.GetModelValue( f3_arg0 ) == 0 then
			if self.bball2 then
				self.bball2:closeTree()
				self.bball2 = nil
			end
		elseif not self.bball2 then
			self.bball2 = MenuBuilder.BuildRegisteredType( "bballTwoScoreboard" )
			self:addElement( self.bball2 )
		end
	end )
	self:SubscribeToModel( DataSources.inGame.CP.zombies.bball_3_widget_alpha:GetModel( f1_local1 ), function ( f4_arg0 )
		if DataModel.GetModelValue( f4_arg0 ) == 0 then
			if self.bball3 then
				self.bball3:closeTree()
				self.bball3 = nil
			end
		elseif not self.bball3 then
			self.bball3 = MenuBuilder.BuildRegisteredType( "bballThreeScoreboard" )
			self:addElement( self.bball3 )
		end
	end )
	return self
end

MenuBuilder.registerType( "BballScoreboards", BballScoreboards )
LockTable( _M )
