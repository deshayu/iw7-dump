local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function PostLoadFunc( f1_arg0, f1_arg1 )
	f1_arg0:SetupInWorldElement( {} )
	f1_arg0:SetInWorldScale( 0.3 )
	f1_arg0:SetWorldSpacePosition( -733, -2656, 661 )
	f1_arg0:SetWorldSpacePitch( 0 )
	f1_arg0:SetWorldSpaceYaw( 180 )
	f1_arg0:SetWorldSpaceRoll( 0 )
	ACTIONS.AnimateSequence( f1_arg0, "onCreate" )
	local f1_local0 = function ( f2_arg0 )
		local f2_local0 = DataModel.GetModelValue( f2_arg0 )
		if f2_local0 == 1 then
			ACTIONS.AnimateSequence( f1_arg0, "show_char_1" )
		elseif f2_local0 == 2 then
			ACTIONS.AnimateSequence( f1_arg0, "show_char_2" )
		elseif f2_local0 == 3 then
			ACTIONS.AnimateSequence( f1_arg0, "show_char_3" )
		elseif f2_local0 == 4 then
			ACTIONS.AnimateSequence( f1_arg0, "show_char4" )
		elseif f2_local0 == 5 then
			ACTIONS.AnimateSequence( f1_arg0, "show_hoff" )
		end
	end
	
	local f1_local1 = DataSources.inGame.CP.zombies.coasterPicP2:GetModel( f1_arg1 )
	f1_arg0:SubscribeToModel( f1_local1, f1_local0 )
	f1_arg0:SubscribeToModel( DataSources.inGame.CP.zombies.coasterHighScoreP2:GetModel( f1_arg1 ), function ()
		local f3_local0 = DataModel.GetModelValue( f1_local1 )
		if f3_local0 and f3_local0 >= 0 then
			ACTIONS.AnimateSequence( f1_arg0, "show_score" )
		end
	end )
end

function ZomCoasterHighScore2( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 128 * _1080p, 0, 128 * _1080p )
	self.id = "ZomCoasterHighScore2"
	self._animationSets = {}
	self._sequences = {}
	local f4_local1 = controller and controller.controllerIndex
	if not f4_local1 and not Engine.InFrontend() then
		f4_local1 = self:getRootController()
	end
	assert( f4_local1 )
	local f4_local2 = self
	local char4 = nil
	
	char4 = LUI.UIImage.new()
	char4.id = "char4"
	char4:setImage( RegisterMaterial( "zm_pc_score_team_plyr_4" ), 0 )
	char4:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 17, _1080p * 111, _1080p * -12, _1080p * 82 )
	self:addElement( char4 )
	self.char4 = char4
	
	local char5 = nil
	
	char5 = LUI.UIImage.new()
	char5.id = "char5"
	char5:setImage( RegisterMaterial( "zm_pc_score_team_plyr_5" ), 0 )
	char5:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 17, _1080p * 111, _1080p * -12, _1080p * 82 )
	self:addElement( char5 )
	self.char5 = char5
	
	local score4 = nil
	
	score4 = LUI.UIText.new()
	score4.id = "score4"
	score4:SetFontSize( 45 * _1080p )
	score4:SetFont( FONTS.GetFont( FONTS.Digital.File ) )
	score4:SetAlignment( LUI.Alignment.Center )
	score4:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, _1080p * 94, _1080p * 11 )
	score4:SubscribeToModel( DataSources.inGame.CP.zombies.coasterHighScoreP2:GetModel( f4_local1 ), function ()
		local f5_local0 = DataSources.inGame.CP.zombies.coasterHighScoreP2:GetValue( f4_local1 )
		if f5_local0 ~= nil then
			score4:setText( f5_local0, 0 )
		end
	end )
	self:addElement( score4 )
	self.score4 = score4
	
	local char3 = nil
	
	char3 = LUI.UIImage.new()
	char3.id = "char3"
	char3:SetAlpha( 0, 0 )
	char3:setImage( RegisterMaterial( "zm_pc_score_team_plyr_3" ), 0 )
	char3:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 17, _1080p * 111, _1080p * -12, _1080p * 82 )
	self:addElement( char3 )
	self.char3 = char3
	
	local char2 = nil
	
	char2 = LUI.UIImage.new()
	char2.id = "char2"
	char2:SetAlpha( 0, 0 )
	char2:setImage( RegisterMaterial( "zm_pc_score_team_plyr_2" ), 0 )
	char2:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 17, _1080p * 111, _1080p * -12, _1080p * 82 )
	self:addElement( char2 )
	self.char2 = char2
	
	local char1 = nil
	
	char1 = LUI.UIImage.new()
	char1.id = "char1"
	char1:setImage( RegisterMaterial( "zm_pc_score_team_plyr_1" ), 0 )
	char1:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 17, _1080p * 111, _1080p * -12, _1080p * 82 )
	self:addElement( char1 )
	self.char1 = char1
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		char4:RegisterAnimationSequence( "onCreate", {
			{
				function ()
					return self.char4:SetAlpha( 0, 0 )
				end
			}
		} )
		char5:RegisterAnimationSequence( "onCreate", {
			{
				function ()
					return self.char5:SetAlpha( 0, 0 )
				end
			}
		} )
		score4:RegisterAnimationSequence( "onCreate", {
			{
				function ()
					return self.score4:SetAlpha( 0, 0 )
				end
			}
		} )
		char3:RegisterAnimationSequence( "onCreate", {
			{
				function ()
					return self.char3:SetAlpha( 0, 0 )
				end
			}
		} )
		char2:RegisterAnimationSequence( "onCreate", {
			{
				function ()
					return self.char2:SetAlpha( 0, 0 )
				end
			}
		} )
		char1:RegisterAnimationSequence( "onCreate", {
			{
				function ()
					return self.char1:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.onCreate = function ()
			char4:AnimateSequence( "onCreate" )
			char5:AnimateSequence( "onCreate" )
			score4:AnimateSequence( "onCreate" )
			char3:AnimateSequence( "onCreate" )
			char2:AnimateSequence( "onCreate" )
			char1:AnimateSequence( "onCreate" )
		end
		
		char4:RegisterAnimationSequence( "show_hoff", {
			{
				function ()
					return self.char4:SetAlpha( 0, 0 )
				end
			}
		} )
		char5:RegisterAnimationSequence( "show_hoff", {
			{
				function ()
					return self.char5:SetAlpha( 1, 0 )
				end
			}
		} )
		self._sequences.show_hoff = function ()
			char4:AnimateSequence( "show_hoff" )
			char5:AnimateSequence( "show_hoff" )
		end
		
		char4:RegisterAnimationSequence( "show_char4", {
			{
				function ()
					return self.char4:SetAlpha( 1, 0 )
				end
			}
		} )
		char5:RegisterAnimationSequence( "show_char4", {
			{
				function ()
					return self.char5:SetAlpha( 0, 0 )
				end
			}
		} )
		char3:RegisterAnimationSequence( "show_char4", {
			{
				function ()
					return self.char3:SetAlpha( 0, 0 )
				end
			}
		} )
		char2:RegisterAnimationSequence( "show_char4", {
			{
				function ()
					return self.char2:SetAlpha( 0, 0 )
				end
			}
		} )
		char1:RegisterAnimationSequence( "show_char4", {
			{
				function ()
					return self.char1:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.show_char4 = function ()
			char4:AnimateSequence( "show_char4" )
			char5:AnimateSequence( "show_char4" )
			char3:AnimateSequence( "show_char4" )
			char2:AnimateSequence( "show_char4" )
			char1:AnimateSequence( "show_char4" )
		end
		
		score4:RegisterAnimationSequence( "show_score", {
			{
				function ()
					return self.score4:SetAlpha( 1, 0 )
				end
			}
		} )
		self._sequences.show_score = function ()
			score4:AnimateSequence( "show_score" )
		end
		
		char4:RegisterAnimationSequence( "show_char_1", {
			{
				function ()
					return self.char4:SetAlpha( 0, 0 )
				end
			}
		} )
		char5:RegisterAnimationSequence( "show_char_1", {
			{
				function ()
					return self.char5:SetAlpha( 0, 0 )
				end
			}
		} )
		char3:RegisterAnimationSequence( "show_char_1", {
			{
				function ()
					return self.char3:SetAlpha( 0, 0 )
				end
			}
		} )
		char2:RegisterAnimationSequence( "show_char_1", {
			{
				function ()
					return self.char2:SetAlpha( 0, 0 )
				end
			}
		} )
		char1:RegisterAnimationSequence( "show_char_1", {
			{
				function ()
					return self.char1:SetAlpha( 1, 0 )
				end
			}
		} )
		self._sequences.show_char_1 = function ()
			char4:AnimateSequence( "show_char_1" )
			char5:AnimateSequence( "show_char_1" )
			char3:AnimateSequence( "show_char_1" )
			char2:AnimateSequence( "show_char_1" )
			char1:AnimateSequence( "show_char_1" )
		end
		
		char4:RegisterAnimationSequence( "show_char_2", {
			{
				function ()
					return self.char4:SetAlpha( 0, 0 )
				end
			}
		} )
		char5:RegisterAnimationSequence( "show_char_2", {
			{
				function ()
					return self.char5:SetAlpha( 0, 0 )
				end
			}
		} )
		char3:RegisterAnimationSequence( "show_char_2", {
			{
				function ()
					return self.char3:SetAlpha( 0, 0 )
				end
			}
		} )
		char2:RegisterAnimationSequence( "show_char_2", {
			{
				function ()
					return self.char2:SetAlpha( 1, 0 )
				end
			}
		} )
		char1:RegisterAnimationSequence( "show_char_2", {
			{
				function ()
					return self.char1:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.show_char_2 = function ()
			char4:AnimateSequence( "show_char_2" )
			char5:AnimateSequence( "show_char_2" )
			char3:AnimateSequence( "show_char_2" )
			char2:AnimateSequence( "show_char_2" )
			char1:AnimateSequence( "show_char_2" )
		end
		
		char4:RegisterAnimationSequence( "show_char_3", {
			{
				function ()
					return self.char4:SetAlpha( 0, 0 )
				end
			}
		} )
		char5:RegisterAnimationSequence( "show_char_3", {
			{
				function ()
					return self.char5:SetAlpha( 0, 0 )
				end
			}
		} )
		char3:RegisterAnimationSequence( "show_char_3", {
			{
				function ()
					return self.char3:SetAlpha( 1, 0 )
				end
			}
		} )
		char2:RegisterAnimationSequence( "show_char_3", {
			{
				function ()
					return self.char2:SetAlpha( 0, 0 )
				end
			}
		} )
		char1:RegisterAnimationSequence( "show_char_3", {
			{
				function ()
					return self.char1:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.show_char_3 = function ()
			char4:AnimateSequence( "show_char_3" )
			char5:AnimateSequence( "show_char_3" )
			char3:AnimateSequence( "show_char_3" )
			char2:AnimateSequence( "show_char_3" )
			char1:AnimateSequence( "show_char_3" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	PostLoadFunc( self, f4_local1, controller )
	return self
end

MenuBuilder.registerType( "ZomCoasterHighScore2", ZomCoasterHighScore2 )
LockTable( _M )
