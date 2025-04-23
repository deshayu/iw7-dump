local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = 17
f0_local1 = function ( f1_arg0, f1_arg1, f1_arg2 )
	if Engine.IsXB3() or Engine.IsPCApp() then
		local bindButton = LUI.UIBindButton.new()
		bindButton.id = "selfBindButton"
		f1_arg0:addElement( bindButton )
		f1_arg0.bindButton = bindButton
		
		f1_arg0.bindButton:addEventHandler( "button_start", function ( f2_arg0, f2_arg1 )
			if f1_arg0:isInFocus() then
				local f2_local0 = f1_arg0:GetDataSource()
				local f2_local1 = f2_local0.memberIndex:GetValue( f1_arg1 )
				if f2_local1 ~= nil then
					Game.ShowGamerCard( f2_local1 )
				end
			end
		end )
	end
	f1_arg0:addEventHandler( "button_action", function ( f3_arg0, f3_arg1 )
		local f3_local0 = f1_arg0:GetDataSource()
		local f3_local1 = f3_local0.memberIndex:GetValue( f1_arg1 )
		if f3_local1 ~= nil then
			Game.TogglePlayerMute( f3_local1 )
		end
	end )
	f1_arg0.Gamertag:SubscribeToModelThroughElement( f1_arg0, "gamertag", function ()
		local f4_local0 = f1_arg0:GetDataSource()
		f4_local0 = f4_local0.gamertag:GetValue( f1_arg1 )
		if f4_local0 ~= nil then
			if Engine.IsPC() then
				f1_arg0.Gamertag:setText( Engine.TruncateToGlyphCount( f4_local0, f0_local0 ), 0 )
			else
				f1_arg0.Gamertag:setText( f4_local0, 0 )
			end
		end
		local f4_local1 = f1_arg0:GetDataSource()
		if f4_local1.missingGamertag:GetValue( f1_arg1 ) or CONDITIONS.IsSystemLink() or not CONDITIONS.IsPublicMatch() then
			f1_arg0.RankIcon:SetAlpha( 0 )
			f1_arg0.Rank:SetAlpha( 0 )
		else
			f1_arg0.RankIcon:SetAlpha( 1 )
			f1_arg0.Rank:SetAlpha( 1 )
		end
		local f4_local2 = f1_arg0:GetDataSource()
		if f4_local2.isMyPlayer ~= nil then
			f4_local2 = f1_arg0:GetDataSource()
			if f4_local2.isMyPlayer:GetValue( f1_arg1 ) then
				f1_arg0.Gamertag:SetRGBFromTable( SWATCHES.genericButton.highlight, 0 )
			else
				f1_arg0.Gamertag:SetRGBFromInt( 15132390, 0 )
			end
		end
	end )
	f1_arg0.blackBG:SubscribeToModelThroughElement( f1_arg0, "backgroundColor", function ()
		local f5_local0 = f1_arg0:GetDataSource()
		f5_local0 = f5_local0.backgroundColor:GetValue( f1_arg1 )
		if f5_local0 ~= nil then
			f1_arg0.blackBG:SetRGBFromInt( f5_local0, 0 )
		end
	end )
	f1_arg0.Rank:SetWordWrap( false )
end

function VersusMember( menu, controller )
	local self = LUI.UIButton.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 690 * _1080p, 0, 32 * _1080p )
	self.id = "VersusMember"
	self._animationSets = {}
	self._sequences = {}
	local f6_local1 = controller and controller.controllerIndex
	if not f6_local1 and not Engine.InFrontend() then
		f6_local1 = self:getRootController()
	end
	assert( f6_local1 )
	local f6_local2 = self
	local blackBG = nil
	
	blackBG = LUI.UIImage.new()
	blackBG.id = "blackBG"
	blackBG:SetRGBFromInt( 2500134, 0 )
	blackBG:SetAlpha( 0.6, 0 )
	blackBG:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, 0, 0 )
	self:addElement( blackBG )
	self.blackBG = blackBG
	
	local Gamertag = nil
	
	Gamertag = LUI.UIText.new()
	Gamertag.id = "Gamertag"
	Gamertag:SetRGBFromInt( 15132390, 0 )
	Gamertag:setText( "WWWWWWWWWWWWWWWW", 0 )
	Gamertag:SetFontSize( 26 * _1080p )
	Gamertag:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	Gamertag:SetAlignment( LUI.Alignment.Left )
	Gamertag:SetOptOutRightToLeftAlignmentFlip( true )
	Gamertag:SetAnchorsAndPosition( 0, 0, 0.5, 0.5, _1080p * 176, _1080p * -181, _1080p * -13, _1080p * 13 )
	self:addElement( Gamertag )
	self.Gamertag = Gamertag
	
	local ClanTag = nil
	
	ClanTag = LUI.UIText.new()
	ClanTag.id = "ClanTag"
	ClanTag:SetRGBFromInt( 15132390, 0 )
	ClanTag:SetFontSize( 26 * _1080p )
	ClanTag:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	ClanTag:SetAlignment( LUI.Alignment.Left )
	ClanTag:SetOptOutRightToLeftAlignmentFlip( true )
	ClanTag:SetAnchorsAndPosition( 0, 1, 0.5, 0.5, _1080p * 80, _1080p * 176, _1080p * -13, _1080p * 13 )
	ClanTag:SubscribeToModelThroughElement( self, "clanTag", function ()
		local f7_local0 = self:GetDataSource()
		f7_local0 = f7_local0.clanTag:GetValue( f6_local1 )
		if f7_local0 ~= nil then
			ClanTag:setText( f7_local0, 0 )
		end
	end )
	self:addElement( ClanTag )
	self.ClanTag = ClanTag
	
	local RankIcon = nil
	
	RankIcon = LUI.UIImage.new()
	RankIcon.id = "RankIcon"
	RankIcon:SetAnchorsAndPosition( 0, 1, 0.5, 0.5, _1080p * 14, _1080p * 36, _1080p * -11, _1080p * 11 )
	RankIcon:SubscribeToModelThroughElement( self, "rankIcon", function ()
		local f8_local0 = self:GetDataSource()
		f8_local0 = f8_local0.rankIcon:GetValue( f6_local1 )
		if f8_local0 ~= nil then
			RankIcon:setImage( RegisterMaterial( f8_local0 ), 0 )
		end
	end )
	self:addElement( RankIcon )
	self.RankIcon = RankIcon
	
	local Rank = nil
	
	Rank = LUI.UIText.new()
	Rank.id = "Rank"
	Rank:SetRGBFromInt( 15132390, 0 )
	Rank:SetFontSize( 22 * _1080p )
	Rank:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	Rank:SetAlignment( LUI.Alignment.Left )
	Rank:SetOptOutRightToLeftAlignmentFlip( true )
	Rank:SetAnchorsAndPosition( 0, 1, 0.5, 0.5, _1080p * 42.88, _1080p * 69.13, _1080p * -11, _1080p * 11 )
	Rank:SubscribeToModelThroughElement( self, "displayRank", function ()
		local f9_local0 = self:GetDataSource()
		f9_local0 = f9_local0.displayRank:GetValue( f6_local1 )
		if f9_local0 ~= nil then
			Rank:setText( f9_local0, 0 )
		end
	end )
	self:addElement( Rank )
	self.Rank = Rank
	
	local MicIcon = nil
	
	MicIcon = LUI.UIImage.new()
	MicIcon.id = "MicIcon"
	MicIcon:SetAnchorsAndPosition( 0, 1, 0.5, 0.5, _1080p * -2, _1080p * -34, _1080p * -16, _1080p * 16 )
	MicIcon:SubscribeToModelThroughElement( self, "microphoneAlpha", function ()
		local f10_local0 = self:GetDataSource()
		f10_local0 = f10_local0.microphoneAlpha:GetValue( f6_local1 )
		if f10_local0 ~= nil then
			MicIcon:SetAlpha( f10_local0, 0 )
		end
	end )
	MicIcon:SubscribeToModelThroughElement( self, "microphoneIcon", function ()
		local f11_local0 = self:GetDataSource()
		f11_local0 = f11_local0.microphoneIcon:GetValue( f6_local1 )
		if f11_local0 ~= nil then
			MicIcon:setImage( RegisterMaterial( f11_local0 ), 0 )
		end
	end )
	self:addElement( MicIcon )
	self.MicIcon = MicIcon
	
	local RigType = nil
	
	RigType = LUI.UIStyledText.new()
	RigType.id = "RigType"
	RigType:SetRGBFromInt( 15132390, 0 )
	RigType:SetFontSize( 26 * _1080p )
	RigType:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	RigType:SetAlignment( LUI.Alignment.Left )
	RigType:SetOptOutRightToLeftAlignmentFlip( true )
	RigType:SetStartupDelay( 1000 )
	RigType:SetLineHoldTime( 400 )
	RigType:SetAnimMoveTime( 150 )
	RigType:SetEndDelay( 1000 )
	RigType:SetCrossfadeTime( 400 )
	RigType:SetAutoScrollStyle( LUI.UIStyledText.AutoScrollStyle.ScrollH )
	RigType:SetMaxVisibleLines( 1 )
	RigType:SetAnchorsAndPosition( 0, 0, 0.5, 0.5, _1080p * 509, 0, _1080p * -13, _1080p * 13 )
	RigType:SubscribeToModelThroughElement( self, "rigName", function ()
		local f12_local0 = self:GetDataSource()
		f12_local0 = f12_local0.rigName:GetValue( f6_local1 )
		if f12_local0 ~= nil then
			RigType:setText( ToUpperCase( f12_local0 ), 0 )
		end
	end )
	self:addElement( RigType )
	self.RigType = RigType
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		Gamertag:RegisterAnimationSequence( "ButtonUp", {
			{
				function ()
					return self.Gamertag:SetRGBFromInt( 14277081, 0 )
				end
			}
		} )
		ClanTag:RegisterAnimationSequence( "ButtonUp", {
			{
				function ()
					return self.ClanTag:SetRGBFromInt( 14277081, 0 )
				end
			}
		} )
		Rank:RegisterAnimationSequence( "ButtonUp", {
			{
				function ()
					return self.Rank:SetRGBFromInt( 14277081, 0 )
				end
			}
		} )
		RigType:RegisterAnimationSequence( "ButtonUp", {
			{
				function ()
					return self.RigType:SetRGBFromInt( 14277081, 0 )
				end
			}
		} )
		self._sequences.ButtonUp = function ()
			Gamertag:AnimateSequence( "ButtonUp" )
			ClanTag:AnimateSequence( "ButtonUp" )
			Rank:AnimateSequence( "ButtonUp" )
			RigType:AnimateSequence( "ButtonUp" )
		end
		
		Gamertag:RegisterAnimationSequence( "ButtonOver", {
			{
				function ()
					return self.Gamertag:SetRGBFromInt( 14277081, 0 )
				end
			}
		} )
		ClanTag:RegisterAnimationSequence( "ButtonOver", {
			{
				function ()
					return self.ClanTag:SetRGBFromInt( 14277081, 0 )
				end
			}
		} )
		RigType:RegisterAnimationSequence( "ButtonOver", {
			{
				function ()
					return self.RigType:SetRGBFromInt( 14277081, 0 )
				end
			}
		} )
		self._sequences.ButtonOver = function ()
			Gamertag:AnimateSequence( "ButtonOver" )
			ClanTag:AnimateSequence( "ButtonOver" )
			RigType:AnimateSequence( "ButtonOver" )
		end
		
		Gamertag:RegisterAnimationSequence( "HideRank", {
			{
				function ()
					return self.Gamertag:SetAnchorsAndPosition( 0, 0, 0.5, 0.5, _1080p * 106, _1080p * -240, _1080p * -13, _1080p * 13, 0 )
				end
			}
		} )
		ClanTag:RegisterAnimationSequence( "HideRank", {
			{
				function ()
					return self.ClanTag:SetAnchorsAndPosition( 0, 1, 0.5, 0.5, _1080p * 10, _1080p * 106, _1080p * -13, _1080p * 13, 0 )
				end
			}
		} )
		self._sequences.HideRank = function ()
			Gamertag:AnimateSequence( "HideRank" )
			ClanTag:AnimateSequence( "HideRank" )
		end
		
		Gamertag:RegisterAnimationSequence( "Japanese", {
			{
				function ()
					return self.Gamertag:SetAnchorsAndPosition( 0, 0, 0.5, 0.5, _1080p * 151, _1080p * -195, _1080p * -13, _1080p * 13, 0 )
				end
			}
		} )
		ClanTag:RegisterAnimationSequence( "Japanese", {
			{
				function ()
					return self.ClanTag:SetAnchorsAndPosition( 0, 1, 0.5, 0.5, _1080p * 70, _1080p * 166, _1080p * -9, _1080p * 11, 0 )
				end
			}
		} )
		RigType:RegisterAnimationSequence( "Japanese", {
			{
				function ()
					return self.RigType:SetAnchorsAndPosition( 0, 0, 0.5, 0.5, _1080p * 466, _1080p * 237, _1080p * -13, _1080p * 13, 0 )
				end
			}
		} )
		self._sequences.Japanese = function ()
			Gamertag:AnimateSequence( "Japanese" )
			ClanTag:AnimateSequence( "Japanese" )
			RigType:AnimateSequence( "Japanese" )
		end
		
		Rank:RegisterAnimationSequence( "MasterPrestige", {
			{
				function ()
					return self.Rank:SetRGBFromTable( SWATCHES.Scoreboard.masterPrestige, 0 )
				end
			}
		} )
		self._sequences.MasterPrestige = function ()
			Rank:AnimateSequence( "MasterPrestige" )
		end
		
		Rank:RegisterAnimationSequence( "NormalPrestige", {
			{
				function ()
					return self.Rank:SetRGBFromInt( 15132390, 0 )
				end
			}
		} )
		self._sequences.NormalPrestige = function ()
			Rank:AnimateSequence( "NormalPrestige" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	self:addEventHandler( "button_over", function ( f35_arg0, f35_arg1 )
		local f35_local0 = f35_arg1.controller or f6_local1
		ACTIONS.AnimateSequence( self, "ButtonOver" )
	end )
	self:addEventHandler( "button_up", function ( f36_arg0, f36_arg1 )
		local f36_local0 = f36_arg1.controller or f6_local1
		ACTIONS.AnimateSequence( self, "ButtonUp" )
	end )
	self:SubscribeToModelThroughElement( self, "isMasterPrestige", function ()
		local f37_local0 = self:GetDataSource()
		if f37_local0.isMasterPrestige:GetValue( f6_local1 ) ~= nil then
			f37_local0 = self:GetDataSource()
			if f37_local0.isMasterPrestige:GetValue( f6_local1 ) == true then
				ACTIONS.AnimateSequence( self, "MasterPrestige" )
			end
		end
		f37_local0 = self:GetDataSource()
		if f37_local0.isMasterPrestige:GetValue( f6_local1 ) ~= nil then
			f37_local0 = self:GetDataSource()
			if f37_local0.isMasterPrestige:GetValue( f6_local1 ) == false then
				ACTIONS.AnimateSequence( self, "NormalPrestige" )
			end
		end
	end )
	f0_local1( self, f6_local1, controller )
	if not CONDITIONS.IsPublicMatch( self ) then
		ACTIONS.AnimateSequence( self, "HideRank" )
	end
	if CONDITIONS.IsJapanese( self ) then
		ACTIONS.AnimateSequence( self, "Japanese" )
	end
	return self
end

MenuBuilder.registerType( "VersusMember", VersusMember )
LockTable( _M )
