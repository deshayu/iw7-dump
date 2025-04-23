local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function DodgeCharges( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 88 * _1080p, 0, 30 * _1080p )
	self.id = "DodgeCharges"
	self._animationSets = {}
	self._sequences = {}
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local DodgeBG = nil
	
	DodgeBG = LUI.UIImage.new()
	DodgeBG.id = "DodgeBG"
	DodgeBG:SetRGBFromInt( 0, 0 )
	DodgeBG:setImage( RegisterMaterial( "hud_ability_base_circle" ), 0 )
	DodgeBG:SetAnchorsAndPosition( 0.5, 0.5, 0, 0, _1080p * -22, _1080p * 22, _1080p * -5, _1080p * 9 )
	DodgeBG:SubscribeToModel( DataSources.inGame.player.suits.dodgeCharge1Alpha:GetModel( f1_local1 ), function ()
		local f2_local0 = DataSources.inGame.player.suits.dodgeCharge1Alpha:GetValue( f1_local1 )
		if f2_local0 ~= nil then
			DodgeBG:SetAlpha( Multiply( f2_local0, 0.25 ), 0 )
		end
	end )
	self:addElement( DodgeBG )
	self.DodgeBG = DodgeBG
	
	local TrophyBG = nil
	
	TrophyBG = LUI.UIImage.new()
	TrophyBG.id = "TrophyBG"
	TrophyBG:SetRGBFromInt( 0, 0 )
	TrophyBG:setImage( RegisterMaterial( "hud_ability_base_circle" ), 0 )
	TrophyBG:SetAnchorsAndPosition( 0.5, 0.5, 0, 0, _1080p * -22, _1080p * 22, _1080p * -5, _1080p * 9 )
	TrophyBG:SubscribeToModel( DataSources.inGame.player.suits.playerTrophyAlpha:GetModel( f1_local1 ), function ()
		local f3_local0 = DataSources.inGame.player.suits.playerTrophyAlpha:GetValue( f1_local1 )
		if f3_local0 ~= nil then
			TrophyBG:SetAlpha( Multiply( f3_local0, 0.25 ), 0 )
		end
	end )
	self:addElement( TrophyBG )
	self.TrophyBG = TrophyBG
	
	local RearguardBG = nil
	
	RearguardBG = LUI.UIImage.new()
	RearguardBG.id = "RearguardBG"
	RearguardBG:SetRGBFromInt( 0, 0 )
	RearguardBG:setImage( RegisterMaterial( "hud_ability_base_circle" ), 0 )
	RearguardBG:SetAnchorsAndPosition( 0.5, 0.5, 0, 0, _1080p * -22, _1080p * 22, _1080p * -5, _1080p * 9 )
	RearguardBG:SubscribeToModel( DataSources.inGame.player.suits.playerRearguardAlpha:GetModel( f1_local1 ), function ()
		local f4_local0 = DataSources.inGame.player.suits.playerRearguardAlpha:GetValue( f1_local1 )
		if f4_local0 ~= nil then
			RearguardBG:SetAlpha( Multiply( f4_local0, 0.25 ), 0 )
		end
	end )
	self:addElement( RearguardBG )
	self.RearguardBG = RearguardBG
	
	local Dodge1 = nil
	
	Dodge1 = LUI.UIImage.new()
	Dodge1.id = "Dodge1"
	Dodge1:setImage( RegisterMaterial( "icon_trait_indicator_dodge" ), 0 )
	Dodge1:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -14, _1080p * 14, _1080p * 2, _1080p * 30 )
	Dodge1:BindAlphaToModel( DataSources.inGame.player.suits.dodgeCharge1Alpha:GetModel( f1_local1 ) )
	self:addElement( Dodge1 )
	self.Dodge1 = Dodge1
	
	local PlayerTrophy = nil
	
	PlayerTrophy = LUI.UIImage.new()
	PlayerTrophy.id = "PlayerTrophy"
	PlayerTrophy:setImage( RegisterMaterial( "icon_trait_indicator_personal_trophy" ), 0 )
	PlayerTrophy:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -14, _1080p * 14, _1080p * 2, _1080p * 30 )
	PlayerTrophy:BindAlphaToModel( DataSources.inGame.player.suits.playerTrophyAlpha:GetModel( f1_local1 ) )
	self:addElement( PlayerTrophy )
	self.PlayerTrophy = PlayerTrophy
	
	local Rearguard = nil
	
	Rearguard = LUI.UIImage.new()
	Rearguard.id = "Rearguard"
	Rearguard:setImage( RegisterMaterial( "icon_trait_indicator_ruggedly_built" ), 0 )
	Rearguard:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -14, _1080p * 14, _1080p * 2, _1080p * 30 )
	Rearguard:BindAlphaToModel( DataSources.inGame.player.suits.playerRearguardAlpha:GetModel( f1_local1 ) )
	self:addElement( Rearguard )
	self.Rearguard = Rearguard
	
	local DodgeText = nil
	
	DodgeText = LUI.UIText.new()
	DodgeText.id = "DodgeText"
	DodgeText:SetAlpha( 0, 0 )
	DodgeText:setText( ToUpperCase( Engine.Localize( "PERKS_DODGE" ) ), 0 )
	DodgeText:SetFontSize( 24 * _1080p )
	DodgeText:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	DodgeText:setTextStyle( CoD.TextStyle.Shadowed )
	DodgeText:SetAlignment( LUI.Alignment.Center )
	DodgeText:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -120, _1080p * 120, _1080p * 28, _1080p * 52 )
	self:addElement( DodgeText )
	self.DodgeText = DodgeText
	
	local TrophyText = nil
	
	TrophyText = LUI.UIText.new()
	TrophyText.id = "TrophyText"
	TrophyText:SetAlpha( 0, 0 )
	TrophyText:setText( ToUpperCase( Engine.Localize( "LUA_MENU_MP_RETICLE_METAL" ) ), 0 )
	TrophyText:SetFontSize( 24 * _1080p )
	TrophyText:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	TrophyText:setTextStyle( CoD.TextStyle.Shadowed )
	TrophyText:SetAlignment( LUI.Alignment.Center )
	TrophyText:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -120, _1080p * 120, _1080p * 28, _1080p * 52 )
	self:addElement( TrophyText )
	self.TrophyText = TrophyText
	
	local RearguardText = nil
	
	RearguardText = LUI.UIText.new()
	RearguardText.id = "RearguardText"
	RearguardText:SetAlpha( 0, 0 )
	RearguardText:setText( ToUpperCase( Engine.Localize( "PERKS_REARGUARD" ) ), 0 )
	RearguardText:SetFontSize( 24 * _1080p )
	RearguardText:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	RearguardText:setTextStyle( CoD.TextStyle.Shadowed )
	RearguardText:SetAlignment( LUI.Alignment.Center )
	RearguardText:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -120, _1080p * 120, _1080p * 28, _1080p * 52 )
	self:addElement( RearguardText )
	self.RearguardText = RearguardText
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		TrophyText:RegisterAnimationSequence( "ShowTrophyText", {
			{
				function ()
					return self.TrophyText:SetAlpha( 0, 0 )
				end,
				function ()
					return self.TrophyText:SetAlpha( 1, 200 )
				end,
				function ()
					return self.TrophyText:SetAlpha( 1, 1300 )
				end,
				function ()
					return self.TrophyText:SetAlpha( 0, 250 )
				end
			}
		} )
		self._sequences.ShowTrophyText = function ()
			TrophyText:AnimateSequence( "ShowTrophyText" )
		end
		
		DodgeText:RegisterAnimationSequence( "ShowDodgeText", {
			{
				function ()
					return self.DodgeText:SetAlpha( 0, 0 )
				end,
				function ()
					return self.DodgeText:SetAlpha( 1, 200, LUI.EASING.outQuadratic )
				end,
				function ()
					return self.DodgeText:SetAlpha( 1, 180 )
				end,
				function ()
					return self.DodgeText:SetAlpha( 0, 250 )
				end
			}
		} )
		self._sequences.ShowDodgeText = function ()
			DodgeText:AnimateSequence( "ShowDodgeText" )
		end
		
		RearguardText:RegisterAnimationSequence( "ShowRearguardText", {
			{
				function ()
					return self.RearguardText:SetAlpha( 0, 0 )
				end,
				function ()
					return self.RearguardText:SetAlpha( 1, 200 )
				end,
				function ()
					return self.RearguardText:SetAlpha( 1, 1300 )
				end,
				function ()
					return self.RearguardText:SetAlpha( 0, 250 )
				end
			}
		} )
		self._sequences.ShowRearguardText = function ()
			RearguardText:AnimateSequence( "ShowRearguardText" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	self:SubscribeToModel( DataSources.inGame.player.suits.dodgeCharge1Alpha:GetModel( f1_local1 ), function ()
		if DataSources.inGame.player.suits.dodgeCharge1Alpha:GetValue( f1_local1 ) ~= nil and DataSources.inGame.player.suits.dodgeCharge1Alpha:GetValue( f1_local1 ) == 1 then
			ACTIONS.AnimateSequence( self, "ShowDodgeText" )
		end
	end )
	self:SubscribeToModel( DataSources.inGame.player.suits.playerTrophyAlpha:GetModel( f1_local1 ), function ()
		if DataSources.inGame.player.suits.playerTrophyAlpha:GetValue( f1_local1 ) ~= nil and DataSources.inGame.player.suits.playerTrophyAlpha:GetValue( f1_local1 ) == 1 then
			ACTIONS.AnimateSequence( self, "ShowTrophyText" )
		end
	end )
	self:SubscribeToModel( DataSources.inGame.player.suits.playerRearguardAlpha:GetModel( f1_local1 ), function ()
		if DataSources.inGame.player.suits.playerRearguardAlpha:GetValue( f1_local1 ) ~= nil and DataSources.inGame.player.suits.playerRearguardAlpha:GetValue( f1_local1 ) == 1 then
			ACTIONS.AnimateSequence( self, "ShowRearguardText" )
		end
	end )
	return self
end

MenuBuilder.registerType( "DodgeCharges", DodgeCharges )
LockTable( _M )
