local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function PostLoadFunc( f1_arg0, f1_arg1 )
	f1_arg0:SetupInWorldElement( {} )
	f1_arg0:SetInWorldScale( 0.25 )
	f1_arg0:SetDelayedRender( true )
	local f1_local0 = function ( f2_arg0, f2_arg1 )
		f2_arg0:SetEntityNum( Game.GetOmnvar( "zm_coaster1_ent" ) )
		f2_arg0:SetEntityTag( "tag_counter" )
		f2_arg0:SetFollowTagAngles( true )
		f2_arg0:SetTagSpacePosition( 54.5, 0, 48 )
		f2_arg0:SetTagSpaceYaw( -90 )
		f2_arg0:SetTagSpaceRoll( -46 )
	end
	
	f1_arg0:registerOmnvarHandler( "zm_coaster1_ent", f1_local0 )
	f1_local0( f1_arg0, {} )
end

function coasterScoreboardPlayer1( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 375 * _1080p, 0, 60 * _1080p )
	self.id = "coasterScoreboardPlayer1"
	local f3_local1 = controller and controller.controllerIndex
	if not f3_local1 and not Engine.InFrontend() then
		f3_local1 = self:getRootController()
	end
	assert( f3_local1 )
	local f3_local2 = self
	local rider1score = nil
	
	rider1score = LUI.UIText.new()
	rider1score.id = "rider1score"
	rider1score:SetRGBFromTable( SWATCHES.HUD.highlight, 0 )
	rider1score:SetFontSize( 22 * _1080p )
	rider1score:SetFont( FONTS.GetFont( FONTS.Digital.File ) )
	rider1score:SetAlignment( LUI.Alignment.Center )
	rider1score:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 103, _1080p * 24.5, _1080p * 44.5 )
	rider1score:SubscribeToModel( DataSources.inGame.CP.zombies.coasterScoreP1C1:GetModel( f3_local1 ), function ()
		local f4_local0 = DataSources.inGame.CP.zombies.coasterScoreP1C1:GetValue( f3_local1 )
		if f4_local0 ~= nil then
			rider1score:setText( f4_local0, 0 )
		end
	end )
	self:addElement( rider1score )
	self.rider1score = rider1score
	
	local rider2score = nil
	
	rider2score = LUI.UIText.new()
	rider2score.id = "rider2score"
	rider2score:SetRGBFromTable( SWATCHES.HUD.highlight, 0 )
	rider2score:SetFontSize( 22 * _1080p )
	rider2score:SetFont( FONTS.GetFont( FONTS.Digital.File ) )
	rider2score:SetAlignment( LUI.Alignment.Center )
	rider2score:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -100, 0, _1080p * 24.5, _1080p * 44.5 )
	rider2score:SubscribeToModel( DataSources.inGame.CP.zombies.coasterScoreP2C1:GetModel( f3_local1 ), function ()
		local f5_local0 = DataSources.inGame.CP.zombies.coasterScoreP2C1:GetValue( f3_local1 )
		if f5_local0 ~= nil then
			rider2score:setText( f5_local0, 0 )
		end
	end )
	self:addElement( rider2score )
	self.rider2score = rider2score
	
	PostLoadFunc( self, f3_local1, controller )
	return self
end

MenuBuilder.registerType( "coasterScoreboardPlayer1", coasterScoreboardPlayer1 )
LockTable( _M )
