local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ( f1_arg0, f1_arg1, f1_arg2 )
	local f1_local0 = Game.GetPlayerClientnum()
	local f1_local1 = DataSources.inGame.CP.players:GetDataSourceAtIndex( f1_local0, f1_arg0 )
	f1_local1 = f1_local1.image
	local f1_local2 = DataSources.inGame.CP.players:GetDataSourceAtIndex( f1_local0, f1_arg0 )
	f1_local2 = f1_local2.bigImage
	assert( f1_local1 )
	f1_arg1:SubscribeToModel( f1_local1:GetModel( f1_arg0 ), function ( f2_arg0 )
		local f2_local0 = DataModel.GetModelValue( f2_arg0 )
		if f2_local0 then
			f1_arg1:setImage( RegisterMaterial( string.gsub( f2_local0, "team", "main" ) ) )
		end
	end )
end

f0_local1 = function ( f3_arg0, f3_arg1, f3_arg2 )
	assert( f3_arg0.PlayerIcon )
	f0_local0( f3_arg1, f3_arg0.PlayerIcon, f3_arg0 )
end

function MainPlayerInfoDLC1( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 282 * _1080p, 0, 219 * _1080p )
	self.id = "MainPlayerInfoDLC1"
	self._animationSets = {}
	self._sequences = {}
	local f4_local1 = controller and controller.controllerIndex
	if not f4_local1 and not Engine.InFrontend() then
		f4_local1 = self:getRootController()
	end
	assert( f4_local1 )
	local f4_local2 = self
	local box = nil
	
	box = LUI.UIImage.new()
	box.id = "box"
	box:SetAlpha( 0.5, 0 )
	box:setImage( RegisterMaterial( "zm_pc_score_bg" ), 0 )
	box:SetUseAA( true )
	box:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 140.5, _1080p * 271, _1080p * 178.63, _1080p * 216 )
	self:addElement( box )
	self.box = box
	
	local PlayerCash = nil
	
	PlayerCash = LUI.UIText.new()
	PlayerCash.id = "PlayerCash"
	PlayerCash:SetFontSize( 38 * _1080p )
	PlayerCash:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	PlayerCash:SetAlignment( LUI.Alignment.Left )
	PlayerCash:SetOptOutRightToLeftAlignmentFlip( true )
	PlayerCash:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 167.5, _1080p * 298, _1080p * 179.63, _1080p * 217.63 )
	PlayerCash:SubscribeToModel( DataSources.inGame.CP.currentPlayerCash:GetModel( f4_local1 ), function ()
		local f5_local0 = DataSources.inGame.CP.currentPlayerCash:GetValue( f4_local1 )
		if f5_local0 ~= nil then
			PlayerCash:setText( f5_local0, 0 )
		end
	end )
	self:addElement( PlayerCash )
	self.PlayerCash = PlayerCash
	
	local raveGlow = nil
	
	raveGlow = LUI.UIImage.new()
	raveGlow.id = "raveGlow"
	raveGlow:SetScale( -0.3, 0 )
	raveGlow:setImage( RegisterMaterial( "zm_player_rave_glow" ), 0 )
	raveGlow:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -56.53, _1080p * 199.48, _1080p * -76, _1080p * 295 )
	self:addElement( raveGlow )
	self.raveGlow = raveGlow
	
	local backing = nil
	
	backing = LUI.UIImage.new()
	backing.id = "backing"
	backing:SetRGBFromInt( 16045624, 0 )
	backing:SetScale( -0.42, 0 )
	backing:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -54.18, _1080p * 195.1, _1080p * -72.1, _1080p * 292.23 )
	self:addElement( backing )
	self.backing = backing
	
	local backingCopy = nil
	
	backingCopy = LUI.UIImage.new()
	backingCopy.id = "backingCopy"
	backingCopy:SetRGBFromInt( 0, 0 )
	backingCopy:SetScale( -0.42, 0 )
	backingCopy:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -54.8, _1080p * 195.1, _1080p * -72.1, _1080p * 292.23 )
	self:addElement( backingCopy )
	self.backingCopy = backingCopy
	
	local RaveFill = nil
	
	RaveFill = LUI.UIImage.new()
	RaveFill.id = "RaveFill"
	RaveFill:SetAnchors( 0, 1, 0, 1, 0 )
	RaveFill:SetLeft( _1080p * -1.8, 0 )
	RaveFill:SetRight( _1080p * 142.75, 0 )
	RaveFill:SetTop( _1080p * 4.4, 0 )
	RaveFill:SetRGBFromInt( 0, 0 )
	RaveFill:SubscribeToModel( DataSources.inGame.CP.zombies.dlc1.raveFill:GetModel( f4_local1 ), function ()
		local f6_local0 = DataSources.inGame.CP.zombies.dlc1.raveFill:GetValue( f4_local1 )
		if f6_local0 ~= nil then
			RaveFill:SetBottom( _1080p * Add( Multiply( f6_local0, 220.13 ), 4.4 ), 0 )
		end
	end )
	self:addElement( RaveFill )
	self.RaveFill = RaveFill
	
	local PlayerIcon = nil
	
	PlayerIcon = LUI.UIImage.new()
	PlayerIcon.id = "PlayerIcon"
	PlayerIcon:SetScale( -0.42, 0 )
	PlayerIcon:setImage( RegisterMaterial( "zm_main_plyr_2_dlc1" ), 0 )
	PlayerIcon:SetUseAA( true )
	PlayerIcon:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -57.59, _1080p * 198.41, _1080p * -75.46, _1080p * 295.54 )
	self:addElement( PlayerIcon )
	self.PlayerIcon = PlayerIcon
	
	local dollarSign = nil
	
	dollarSign = LUI.UIText.new()
	dollarSign.id = "dollarSign"
	dollarSign:setText( "$", 0 )
	dollarSign:SetFontSize( 38 * _1080p )
	dollarSign:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	dollarSign:SetAlignment( LUI.Alignment.Left )
	dollarSign:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 144.5, _1080p * 165.5, _1080p * 179.63, _1080p * 217.63 )
	self:addElement( dollarSign )
	self.dollarSign = dollarSign
	
	local souvenir = nil
	
	souvenir = MenuBuilder.BuildRegisteredType( "souvenir", {
		controllerIndex = f4_local1
	} )
	souvenir.id = "souvenir"
	souvenir:SetScale( -0.3, 0 )
	souvenir:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 249.75, _1080p * 359.75, _1080p * 143.63, _1080p * 253.63 )
	self:addElement( souvenir )
	self.souvenir = souvenir
	
	local Fuses = nil
	
	Fuses = LUI.UIImage.new()
	Fuses.id = "Fuses"
	Fuses:SetScale( -0.63, 0 )
	Fuses:setImage( RegisterMaterial( "cp_zmb_sticker_fuse" ), 0 )
	Fuses:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 109.32, _1080p * 237.32, _1080p * -30.79, _1080p * 97.21 )
	Fuses:BindAlphaToModel( DataSources.inGame.CP.zombies.quests.questFuseAlphaFilter:GetModel( f4_local1 ) )
	self:addElement( Fuses )
	self.Fuses = Fuses
	
	local DeliriumPower = nil
	
	DeliriumPower = LUI.UIImage.new()
	DeliriumPower.id = "DeliriumPower"
	DeliriumPower:SetZRotation( 39, 0 )
	DeliriumPower:SetScale( -0.69, 0 )
	DeliriumPower:setImage( RegisterMaterial( "zm_powder_bag" ), 0 )
	DeliriumPower:SetUseAA( true )
	DeliriumPower:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 103.5, _1080p * 231.5, _1080p * 90.98, _1080p * 218.98 )
	DeliriumPower:BindAlphaToModel( DataSources.inGame.CP.zombies.HUDInventoryDLC1.hudInventory2Alpha:GetModel( f4_local1 ) )
	self:addElement( DeliriumPower )
	self.DeliriumPower = DeliriumPower
	
	local InventorySlot1 = nil
	
	InventorySlot1 = LUI.UIImage.new()
	InventorySlot1.id = "InventorySlot1"
	InventorySlot1:SetScale( -0.61, 0 )
	InventorySlot1:SetUseAA( true )
	InventorySlot1:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 106.04, _1080p * 234.04, _1080p * 29.94, _1080p * 157.94 )
	InventorySlot1:BindAlphaToModel( DataSources.inGame.CP.zombies.HUDInventoryDLC1.hudInventory1Alpha:GetModel( f4_local1 ) )
	InventorySlot1:SubscribeToModel( DataSources.inGame.CP.zombies.HUDInventoryDLC1.hudInventory1Icon:GetModel( f4_local1 ), function ()
		local f7_local0 = DataSources.inGame.CP.zombies.HUDInventoryDLC1.hudInventory1Icon:GetValue( f4_local1 )
		if f7_local0 ~= nil then
			InventorySlot1:setImage( RegisterMaterial( f7_local0 ), 0 )
		end
	end )
	self:addElement( InventorySlot1 )
	self.InventorySlot1 = InventorySlot1
	
	local Skull = nil
	
	Skull = LUI.UIImage.new()
	Skull.id = "Skull"
	Skull:SetScale( -0.82, 0 )
	Skull:setImage( RegisterMaterial( "zm_hud_pixel_skull" ), 0 )
	Skull:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 94.52, _1080p * 350.52, _1080p * 29.94, _1080p * 285.94 )
	Skull:BindAlphaToModel( DataSources.inGame.CP.zombies.ghost.ghostAfterLifeIconAlpha:GetModel( f4_local1 ) )
	self:addElement( Skull )
	self.Skull = Skull
	
	local f4_local16 = nil
	if CONDITIONS.IsDirectorsCutOn( f4_local1 ) then
		f4_local16 = LUI.UIImage.new()
		f4_local16.id = "star"
		f4_local16:SetScale( -0.57, 0 )
		f4_local16:setImage( RegisterMaterial( "zm_directors_cut_star" ), 0 )
		f4_local16:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -47.95, _1080p * 80.05, _1080p * -46, _1080p * 82 )
		self:addElement( f4_local16 )
		self.star = f4_local16
	end
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		raveGlow:RegisterAnimationSequence( "initial", {
			{
				function ()
					return self.raveGlow:SetAlpha( 0, 0 )
				end
			},
			{
				function ()
					return self.raveGlow:SetRGBFromInt( 16777215, 0 )
				end
			}
		} )
		backing:RegisterAnimationSequence( "initial", {
			{
				function ()
					return self.backing:SetAlpha( 0, 0 )
				end
			},
			{
				function ()
					return self.backing:SetRGBFromInt( 16045624, 0 )
				end
			}
		} )
		backingCopy:RegisterAnimationSequence( "initial", {
			{
				function ()
					return self.backingCopy:SetAlpha( 1, 0 )
				end
			}
		} )
		RaveFill:RegisterAnimationSequence( "initial", {
			{
				function ()
					return self.RaveFill:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.initial = function ()
			raveGlow:AnimateSequence( "initial" )
			backing:AnimateSequence( "initial" )
			backingCopy:AnimateSequence( "initial" )
			RaveFill:AnimateSequence( "initial" )
		end
		
		raveGlow:RegisterAnimationSequence( "raveOn", {
			{
				function ()
					return self.raveGlow:SetAlpha( 0, 0 )
				end,
				function ()
					return self.raveGlow:SetAlpha( 1, 940 )
				end
			}
		} )
		backing:RegisterAnimationSequence( "raveOn", {
			{
				function ()
					return self.backing:SetAlpha( 0, 0 )
				end,
				function ()
					return self.backing:SetAlpha( 1, 940 )
				end
			}
		} )
		backingCopy:RegisterAnimationSequence( "raveOn", {
			{
				function ()
					return self.backingCopy:SetAlpha( 1, 0 )
				end,
				function ()
					return self.backingCopy:SetAlpha( 0, 940 )
				end
			}
		} )
		RaveFill:RegisterAnimationSequence( "raveOn", {
			{
				function ()
					return self.RaveFill:SetAlpha( 0, 0 )
				end,
				function ()
					return self.RaveFill:SetAlpha( 1, 940 )
				end
			}
		} )
		self._sequences.raveOn = function ()
			raveGlow:AnimateSequence( "raveOn" )
			backing:AnimateSequence( "raveOn" )
			backingCopy:AnimateSequence( "raveOn" )
			RaveFill:AnimateSequence( "raveOn" )
		end
		
		raveGlow:RegisterAnimationSequence( "raveGlowPulse", {
			{
				function ()
					return self.raveGlow:SetAlpha( 0.85, 0 )
				end,
				function ()
					return self.raveGlow:SetAlpha( 0.35, 1000 )
				end,
				function ()
					return self.raveGlow:SetAlpha( 0.85, 1000 )
				end
			}
		} )
		self._sequences.raveGlowPulse = function ()
			raveGlow:AnimateLoop( "raveGlowPulse" )
		end
		
		raveGlow:RegisterAnimationSequence( "raveGlowColor", {
			{
				function ()
					return self.raveGlow:SetRGBFromInt( 16777215, 0 )
				end,
				function ()
					return self.raveGlow:SetRGBFromInt( 15732495, 90 )
				end,
				function ()
					return self.raveGlow:SetRGBFromInt( 15732495, 120 )
				end,
				function ()
					return self.raveGlow:SetRGBFromInt( 16777215, 110 )
				end
			}
		} )
		backing:RegisterAnimationSequence( "raveGlowColor", {
			{
				function ()
					return self.backing:SetRGBFromInt( 16045624, 0 )
				end,
				function ()
					return self.backing:SetRGBFromInt( 15732495, 90 )
				end,
				function ()
					return self.backing:SetRGBFromInt( 15732495, 120 )
				end,
				function ()
					return self.backing:SetRGBFromInt( 16045624, 110 )
				end
			}
		} )
		self._sequences.raveGlowColor = function ()
			raveGlow:AnimateSequence( "raveGlowColor" )
			backing:AnimateSequence( "raveGlowColor" )
		end
		
		raveGlow:RegisterAnimationSequence( "unlimitedRave", {
			{
				function ()
					return self.raveGlow:SetRGBFromInt( 3013632, 0 )
				end
			}
		} )
		backing:RegisterAnimationSequence( "unlimitedRave", {
			{
				function ()
					return self.backing:SetRGBFromInt( 3013632, 0 )
				end
			}
		} )
		self._sequences.unlimitedRave = function ()
			raveGlow:AnimateSequence( "unlimitedRave" )
			backing:AnimateSequence( "unlimitedRave" )
		end
		
		raveGlow:RegisterAnimationSequence( "unlimitedRaveOff", {
			{
				function ()
					return self.raveGlow:SetRGBFromInt( 16777215, 0 )
				end
			}
		} )
		backing:RegisterAnimationSequence( "unlimitedRaveOff", {
			{
				function ()
					return self.backing:SetRGBFromInt( 16045624, 0 )
				end
			}
		} )
		self._sequences.unlimitedRaveOff = function ()
			raveGlow:AnimateSequence( "unlimitedRaveOff" )
			backing:AnimateSequence( "unlimitedRaveOff" )
		end
		
		raveGlow:RegisterAnimationSequence( "raveOnLoop", {
			{
				function ()
					return self.raveGlow:SetAlpha( 1, 0 )
				end
			}
		} )
		backing:RegisterAnimationSequence( "raveOnLoop", {
			{
				function ()
					return self.backing:SetAlpha( 1, 0 )
				end
			}
		} )
		backingCopy:RegisterAnimationSequence( "raveOnLoop", {
			{
				function ()
					return self.backingCopy:SetAlpha( 0, 0 )
				end
			}
		} )
		RaveFill:RegisterAnimationSequence( "raveOnLoop", {
			{
				function ()
					return self.RaveFill:SetAlpha( 1, 0 )
				end
			}
		} )
		self._sequences.raveOnLoop = function ()
			raveGlow:AnimateSequence( "raveOnLoop" )
			backing:AnimateSequence( "raveOnLoop" )
			backingCopy:AnimateSequence( "raveOnLoop" )
			RaveFill:AnimateSequence( "raveOnLoop" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	self:SubscribeToModel( DataSources.inGame.CP.zombies.dlc1.raveMode:GetModel( f4_local1 ), function ()
		if DataSources.inGame.CP.zombies.dlc1.raveMode:GetValue( f4_local1 ) ~= nil and DataSources.inGame.CP.zombies.dlc1.raveMode:GetValue( f4_local1 ) == 1 then
			ACTIONS.AnimateSequence( self, "raveOn" )
			ACTIONS.AnimateSequence( self, "raveGlowPulse" )
		end
		if DataSources.inGame.CP.zombies.dlc1.raveMode:GetValue( f4_local1 ) ~= nil and DataSources.inGame.CP.zombies.dlc1.raveMode:GetValue( f4_local1 ) < 1 then
			ACTIONS.AnimateSequence( self, "initial" )
		end
		if DataSources.inGame.CP.zombies.dlc1.raveMode:GetValue( f4_local1 ) ~= nil and DataSources.inGame.CP.zombies.dlc1.raveMode:GetValue( f4_local1 ) == 2 then
			ACTIONS.AnimateSequence( self, "raveGlowColor" )
		end
		if DataSources.inGame.CP.zombies.dlc1.raveMode:GetValue( f4_local1 ) ~= nil and DataSources.inGame.CP.zombies.dlc1.raveMode:GetValue( f4_local1 ) == 4 then
			ACTIONS.AnimateSequence( self, "raveOnLoop" )
			ACTIONS.AnimateSequence( self, "raveGlowPulse" )
		end
	end )
	self:SubscribeToModel( DataSources.inGame.CP.zombies.dlc1.raveODMode:GetModel( f4_local1 ), function ()
		if DataSources.inGame.CP.zombies.dlc1.raveODMode:GetValue( f4_local1 ) ~= nil and DataSources.inGame.CP.zombies.dlc1.raveODMode:GetValue( f4_local1 ) == 1 then
			ACTIONS.AnimateSequence( self, "unlimitedRave" )
		end
		if DataSources.inGame.CP.zombies.dlc1.raveODMode:GetValue( f4_local1 ) ~= nil and DataSources.inGame.CP.zombies.dlc1.raveODMode:GetValue( f4_local1 ) < 1 then
			ACTIONS.AnimateSequence( self, "unlimitedRaveOff" )
		end
	end )
	f0_local1( self, f4_local1, controller )
	ACTIONS.AnimateSequence( self, "initial" )
	return self
end

MenuBuilder.registerType( "MainPlayerInfoDLC1", MainPlayerInfoDLC1 )
LockTable( _M )
