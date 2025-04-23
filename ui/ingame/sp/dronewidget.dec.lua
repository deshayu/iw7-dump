local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function DroneWidget( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 270 * _1080p, 0, 96 * _1080p )
	self.id = "DroneWidget"
	self._animationSets = {}
	self._sequences = {}
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local BackgroundGlow = nil
	
	BackgroundGlow = LUI.UIImage.new()
	BackgroundGlow.id = "BackgroundGlow"
	BackgroundGlow:SetRGBFromInt( 12641249, 0 )
	BackgroundGlow:SetAlpha( 0, 0 )
	BackgroundGlow:setImage( RegisterMaterial( "hud_bkgd_glow" ), 0 )
	BackgroundGlow:SetAnchorsAndPosition( 0, 1, 0.5, 0.5, 0, _1080p * 177, _1080p * -40, _1080p * 48 )
	self:addElement( BackgroundGlow )
	self.BackgroundGlow = BackgroundGlow
	
	local DroneWidgetBackground0 = nil
	
	DroneWidgetBackground0 = MenuBuilder.BuildRegisteredType( "DroneWidgetBackground", {
		controllerIndex = f1_local1
	} )
	DroneWidgetBackground0.id = "DroneWidgetBackground0"
	DroneWidgetBackground0:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 270, _1080p * 4, _1080p * 92 )
	self:addElement( DroneWidgetBackground0 )
	self.DroneWidgetBackground0 = DroneWidgetBackground0
	
	local YellowTape = nil
	
	YellowTape = LUI.UIImage.new()
	YellowTape.id = "YellowTape"
	YellowTape:SetAlpha( 0, 0 )
	YellowTape:setImage( RegisterMaterial( "hud_bkgd_caution" ), 0 )
	YellowTape:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -130, _1080p * 130, _1080p * -28, _1080p * 28 )
	self:addElement( YellowTape )
	self.YellowTape = YellowTape
	
	local RedTape = nil
	
	RedTape = LUI.UIImage.new()
	RedTape.id = "RedTape"
	RedTape:SetAlpha( 0, 0 )
	RedTape:setImage( RegisterMaterial( "hud_bkgd_warning" ), 0 )
	RedTape:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -130, _1080p * 130, _1080p * -28, _1080p * 28 )
	self:addElement( RedTape )
	self.RedTape = RedTape
	
	local DroneWidgetInfo0 = nil
	
	DroneWidgetInfo0 = MenuBuilder.BuildRegisteredType( "DroneWidgetInfo", {
		controllerIndex = f1_local1
	} )
	DroneWidgetInfo0.id = "DroneWidgetInfo0"
	DroneWidgetInfo0.DroneWidgetAmmoBar0:SetDataSourceThroughElement( self, nil )
	DroneWidgetInfo0:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 181.73, _1080p * 12, _1080p * 84 )
	DroneWidgetInfo0:SubscribeToModelThroughElement( self, "ammoCount", function ()
		local f2_local0 = self:GetDataSource()
		f2_local0 = f2_local0.ammoCount:GetValue( f1_local1 )
		if f2_local0 ~= nil then
			DroneWidgetInfo0.AmmoCount:setText( f2_local0, 0 )
		end
	end )
	DroneWidgetInfo0:SubscribeToModel( DataSources.inGame.SP.droneInfo.trophyActive:GetModel( f1_local1 ), function ()
		local f3_local0 = DataSources.inGame.SP.droneInfo.trophyActive:GetValue( f1_local1 )
		if f3_local0 ~= nil then
			DroneWidgetInfo0.TrophyLabel:SetAlpha( Multiply( f3_local0, 0.8 ), 0 )
		end
	end )
	DroneWidgetInfo0.TrophyStatus:BindAlphaToModel( DataSources.inGame.SP.droneInfo.trophyActive:GetModel( f1_local1 ) )
	self:addElement( DroneWidgetInfo0 )
	self.DroneWidgetInfo0 = DroneWidgetInfo0
	
	local WarningText = nil
	
	WarningText = LUI.UIText.new()
	WarningText.id = "WarningText"
	WarningText:SetRGBFromInt( 0, 0 )
	WarningText:SetAlpha( 0, 0 )
	WarningText:setText( Engine.Localize( "EQUIPMENT_DRONE_OUT_OF_AMMO" ), 0 )
	WarningText:SetFontSize( 24 * _1080p )
	WarningText:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	WarningText:SetAlignment( LUI.Alignment.Center )
	WarningText:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 5, _1080p * 186.27, _1080p * 36, _1080p * 60 )
	self:addElement( WarningText )
	self.WarningText = WarningText
	
	local DroneIcon = nil
	
	DroneIcon = LUI.UIImage.new()
	DroneIcon.id = "DroneIcon"
	DroneIcon:setImage( RegisterMaterial( "icon_ability_drone" ), 0 )
	DroneIcon:SetAnchorsAndPosition( 1, 0, 0.5, 0.5, _1080p * -83.73, _1080p * -5.73, _1080p * -39, _1080p * 39 )
	self:addElement( DroneIcon )
	self.DroneIcon = DroneIcon
	
	local IntroSweepBar = nil
	
	IntroSweepBar = LUI.UIImage.new()
	IntroSweepBar.id = "IntroSweepBar"
	IntroSweepBar:SetRGBFromInt( 6277069, 0 )
	IntroSweepBar:SetAlpha( 0, 0 )
	IntroSweepBar:SetAnchorsAndPosition( 0, 1, 0.5, 0.5, _1080p * 248, _1080p * 256, _1080p * -38, _1080p * 38 )
	self:addElement( IntroSweepBar )
	self.IntroSweepBar = IntroSweepBar
	
	local PanelDots = nil
	
	PanelDots = LUI.UIImage.new()
	PanelDots.id = "PanelDots"
	PanelDots:SetRGBFromTable( SWATCHES.HUD.stable, 0 )
	PanelDots:setImage( RegisterMaterial( "hud_drone_panel_dots" ), 0 )
	PanelDots:SetAnchorsAndPosition( 0, 1, 1, 0, _1080p * 6.52, _1080p * 175.27, _1080p * -39, _1080p * -9 )
	PanelDots:SubscribeToModel( DataSources.inGame.SP.droneInfo.trophyActive:GetModel( f1_local1 ), function ()
		local f4_local0 = DataSources.inGame.SP.droneInfo.trophyActive:GetValue( f1_local1 )
		if f4_local0 ~= nil then
			PanelDots:SetAlpha( Multiply( Subtract( f4_local0, 1 ), -0.3 ), 0 )
		end
	end )
	self:addElement( PanelDots )
	self.PanelDots = PanelDots
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		BackgroundGlow:RegisterAnimationSequence( "Intro", {
			{
				function ()
					return self.BackgroundGlow:SetAlpha( 0, 0 )
				end,
				function ()
					return self.BackgroundGlow:SetAlpha( 0.25, 80 )
				end,
				function ()
					return self.BackgroundGlow:SetAlpha( 0, 80 )
				end,
				function ()
					return self.BackgroundGlow:SetAlpha( 0.25, 80 )
				end,
				function ()
					return self.BackgroundGlow:SetAlpha( 0, 80 )
				end,
				function ()
					return self.BackgroundGlow:SetAlpha( 0.25, 80 )
				end,
				function ()
					return self.BackgroundGlow:SetAlpha( 0, 80 )
				end,
				function ()
					return self.BackgroundGlow:SetAlpha( 0.25, 80 )
				end,
				function ()
					return self.BackgroundGlow:SetAlpha( 0, 80 )
				end
			}
		} )
		DroneWidgetBackground0:RegisterAnimationSequence( "Intro", {
			{
				function ()
					return self.DroneWidgetBackground0:SetAlpha( 0, 0 )
				end,
				function ()
					return self.DroneWidgetBackground0:SetAlpha( 0, 100 )
				end,
				function ()
					return self.DroneWidgetBackground0:SetAlpha( 1, 700 )
				end
			}
		} )
		DroneWidgetInfo0:RegisterAnimationSequence( "Intro", {
			{
				function ()
					return self.DroneWidgetInfo0:SetAlpha( 0, 0 )
				end,
				function ()
					return self.DroneWidgetInfo0:SetAlpha( 0, 100 )
				end,
				function ()
					return self.DroneWidgetInfo0:SetAlpha( 1, 700 )
				end
			}
		} )
		DroneIcon:RegisterAnimationSequence( "Intro", {
			{
				function ()
					return self.DroneIcon:SetAlpha( 0, 0 )
				end,
				function ()
					return self.DroneIcon:SetAlpha( 0, 100 )
				end,
				function ()
					return self.DroneIcon:SetAlpha( 1, 700 )
				end
			},
			{
				function ()
					return self.DroneIcon:SetRGBFromInt( 16777215, 0 )
				end
			}
		} )
		IntroSweepBar:RegisterAnimationSequence( "Intro", {
			{
				function ()
					return self.IntroSweepBar:SetAlpha( 0.8, 0 )
				end,
				function ()
					return self.IntroSweepBar:SetAlpha( 0, 600 )
				end
			},
			{
				function ()
					return self.IntroSweepBar:SetAnchorsAndPosition( 0, 1, 0.5, 0.5, _1080p * 248, _1080p * 256, _1080p * -38, _1080p * 38, 0 )
				end,
				function ()
					return self.IntroSweepBar:SetAnchorsAndPosition( 0, 1, 0.5, 0.5, _1080p * 5, _1080p * 13, _1080p * -38, _1080p * 38, 600 )
				end
			}
		} )
		PanelDots:RegisterAnimationSequence( "Intro", {
			{
				function ()
					return self.PanelDots:SetAnchorsAndPosition( 0, 1, 1, 0, _1080p * 6.52, _1080p * 175.27, _1080p * -39, _1080p * -9, 0 )
				end
			}
		} )
		self._sequences.Intro = function ()
			BackgroundGlow:AnimateSequence( "Intro" )
			DroneWidgetBackground0:AnimateSequence( "Intro" )
			DroneWidgetInfo0:AnimateSequence( "Intro" )
			DroneIcon:AnimateSequence( "Intro" )
			IntroSweepBar:AnimateSequence( "Intro" )
			PanelDots:AnimateSequence( "Intro" )
		end
		
		DroneWidgetBackground0:RegisterAnimationSequence( "OutOfAmmo", {
			{
				function ()
					return self.DroneWidgetBackground0:SetAlpha( 0, 0 )
				end
			}
		} )
		YellowTape:RegisterAnimationSequence( "OutOfAmmo", {
			{
				function ()
					return self.YellowTape:SetAlpha( 0, 0 )
				end,
				function ()
					return self.YellowTape:SetAlpha( 0.8, 80 )
				end,
				function ()
					return self.YellowTape:SetAlpha( 0, 80 )
				end,
				function ()
					return self.YellowTape:SetAlpha( 0.8, 80 )
				end,
				function ()
					return self.YellowTape:SetAlpha( 0, 80 )
				end,
				function ()
					return self.YellowTape:SetAlpha( 0.8, 80 )
				end,
				function ()
					return self.YellowTape:SetAlpha( 0.8, 1000 )
				end,
				function ()
					return self.YellowTape:SetAlpha( 0, 100 )
				end
			}
		} )
		DroneWidgetInfo0:RegisterAnimationSequence( "OutOfAmmo", {
			{
				function ()
					return self.DroneWidgetInfo0:SetAlpha( 0, 0 )
				end
			}
		} )
		WarningText:RegisterAnimationSequence( "OutOfAmmo", {
			{
				function ()
					return self.WarningText:SetAlpha( 0, 0 )
				end,
				function ()
					return self.WarningText:SetAlpha( 1, 80 )
				end,
				function ()
					return self.WarningText:SetAlpha( 0, 80 )
				end,
				function ()
					return self.WarningText:SetAlpha( 1, 80 )
				end,
				function ()
					return self.WarningText:SetAlpha( 0, 80 )
				end,
				function ()
					return self.WarningText:SetAlpha( 1, 80 )
				end,
				function ()
					return self.WarningText:SetAlpha( 1, 1000 )
				end,
				function ()
					return self.WarningText:SetAlpha( 0, 100 )
				end
			},
			{
				function ()
					return self.WarningText:setText( Engine.Localize( "EQUIPMENT_DRONE_OUT_OF_AMMO" ), 0 )
				end
			}
		} )
		DroneIcon:RegisterAnimationSequence( "OutOfAmmo", {
			{
				function ()
					return self.DroneIcon:SetAlpha( 1, 0 )
				end,
				function ()
					return self.DroneIcon:SetAlpha( 1, 1400 )
				end,
				function ()
					return self.DroneIcon:SetAlpha( 0, 100 )
				end
			},
			{
				function ()
					return self.DroneIcon:SetRGBFromInt( 16777215, 0 )
				end
			}
		} )
		PanelDots:RegisterAnimationSequence( "OutOfAmmo", {
			{
				function ()
					return self.PanelDots:SetAnchorsAndPosition( 0, 1, 1, 0, 0, 0, 0, 0, 0 )
				end
			}
		} )
		self._sequences.OutOfAmmo = function ()
			DroneWidgetBackground0:AnimateSequence( "OutOfAmmo" )
			YellowTape:AnimateSequence( "OutOfAmmo" )
			DroneWidgetInfo0:AnimateSequence( "OutOfAmmo" )
			WarningText:AnimateSequence( "OutOfAmmo" )
			DroneIcon:AnimateSequence( "OutOfAmmo" )
			PanelDots:AnimateSequence( "OutOfAmmo" )
		end
		
		DroneWidgetBackground0:RegisterAnimationSequence( "Destroyed", {
			{
				function ()
					return self.DroneWidgetBackground0:SetAlpha( 0, 0 )
				end
			}
		} )
		RedTape:RegisterAnimationSequence( "Destroyed", {
			{
				function ()
					return self.RedTape:SetAlpha( 0, 0 )
				end,
				function ()
					return self.RedTape:SetAlpha( 0.8, 80 )
				end,
				function ()
					return self.RedTape:SetAlpha( 0, 80 )
				end,
				function ()
					return self.RedTape:SetAlpha( 0.8, 80 )
				end,
				function ()
					return self.RedTape:SetAlpha( 0, 80 )
				end,
				function ()
					return self.RedTape:SetAlpha( 0.8, 80 )
				end,
				function ()
					return self.RedTape:SetAlpha( 0.8, 1000 )
				end,
				function ()
					return self.RedTape:SetAlpha( 0, 100 )
				end
			}
		} )
		DroneWidgetInfo0:RegisterAnimationSequence( "Destroyed", {
			{
				function ()
					return self.DroneWidgetInfo0:SetAlpha( 0, 0 )
				end
			}
		} )
		WarningText:RegisterAnimationSequence( "Destroyed", {
			{
				function ()
					return self.WarningText:SetAlpha( 0, 0 )
				end,
				function ()
					return self.WarningText:SetAlpha( 1, 80 )
				end,
				function ()
					return self.WarningText:SetAlpha( 0, 80 )
				end,
				function ()
					return self.WarningText:SetAlpha( 1, 80 )
				end,
				function ()
					return self.WarningText:SetAlpha( 0, 80 )
				end,
				function ()
					return self.WarningText:SetAlpha( 1, 80 )
				end,
				function ()
					return self.WarningText:SetAlpha( 1, 1000 )
				end,
				function ()
					return self.WarningText:SetAlpha( 0, 100 )
				end
			},
			{
				function ()
					return self.WarningText:setText( Engine.Localize( "EQUIPMENT_DRONE_DESTROYED" ), 0 )
				end
			}
		} )
		DroneIcon:RegisterAnimationSequence( "Destroyed", {
			{
				function ()
					return self.DroneIcon:SetAlpha( 1, 0 )
				end,
				function ()
					return self.DroneIcon:SetAlpha( 1, 1400 )
				end,
				function ()
					return self.DroneIcon:SetAlpha( 0, 100 )
				end
			},
			{
				function ()
					return self.DroneIcon:SetRGBFromInt( 16777215, 0 )
				end
			}
		} )
		PanelDots:RegisterAnimationSequence( "Destroyed", {
			{
				function ()
					return self.PanelDots:SetAnchorsAndPosition( 0, 1, 1, 0, 0, 0, 0, 0, 0 )
				end
			}
		} )
		self._sequences.Destroyed = function ()
			DroneWidgetBackground0:AnimateSequence( "Destroyed" )
			RedTape:AnimateSequence( "Destroyed" )
			DroneWidgetInfo0:AnimateSequence( "Destroyed" )
			WarningText:AnimateSequence( "Destroyed" )
			DroneIcon:AnimateSequence( "Destroyed" )
			PanelDots:AnimateSequence( "Destroyed" )
		end
		
		DroneIcon:RegisterAnimationSequence( "AmmoNormal", {
			{
				function ()
					return self.DroneIcon:SetRGBFromInt( 16777215, 0 )
				end
			}
		} )
		self._sequences.AmmoNormal = function ()
			DroneIcon:AnimateSequence( "AmmoNormal" )
		end
		
		DroneIcon:RegisterAnimationSequence( "AmmoLow", {
			{
				function ()
					return self.DroneIcon:SetRGBFromInt( 16777215, 0 )
				end,
				function ()
					return self.DroneIcon:SetRGBFromInt( 12557109, 200 )
				end,
				function ()
					return self.DroneIcon:SetRGBFromInt( 16777215, 200 )
				end
			}
		} )
		self._sequences.AmmoLow = function ()
			DroneIcon:AnimateLoop( "AmmoLow" )
		end
		
		DroneWidgetBackground0:RegisterAnimationSequence( "LostConnection", {
			{
				function ()
					return self.DroneWidgetBackground0:SetAlpha( 0, 0 )
				end
			}
		} )
		YellowTape:RegisterAnimationSequence( "LostConnection", {
			{
				function ()
					return self.YellowTape:SetAlpha( 0, 0 )
				end,
				function ()
					return self.YellowTape:SetAlpha( 0.8, 80 )
				end,
				function ()
					return self.YellowTape:SetAlpha( 0, 80 )
				end,
				function ()
					return self.YellowTape:SetAlpha( 0.8, 80 )
				end,
				function ()
					return self.YellowTape:SetAlpha( 0, 80 )
				end,
				function ()
					return self.YellowTape:SetAlpha( 0.8, 80 )
				end,
				function ()
					return self.YellowTape:SetAlpha( 0.8, 1000 )
				end,
				function ()
					return self.YellowTape:SetAlpha( 0, 100 )
				end
			}
		} )
		DroneWidgetInfo0:RegisterAnimationSequence( "LostConnection", {
			{
				function ()
					return self.DroneWidgetInfo0:SetAlpha( 0, 0 )
				end
			}
		} )
		WarningText:RegisterAnimationSequence( "LostConnection", {
			{
				function ()
					return self.WarningText:SetAlpha( 0, 0 )
				end,
				function ()
					return self.WarningText:SetAlpha( 1, 80 )
				end,
				function ()
					return self.WarningText:SetAlpha( 0, 80 )
				end,
				function ()
					return self.WarningText:SetAlpha( 1, 80 )
				end,
				function ()
					return self.WarningText:SetAlpha( 0, 80 )
				end,
				function ()
					return self.WarningText:SetAlpha( 1, 80 )
				end,
				function ()
					return self.WarningText:SetAlpha( 1, 1000 )
				end,
				function ()
					return self.WarningText:SetAlpha( 0, 100 )
				end
			},
			{
				function ()
					return self.WarningText:setText( Engine.Localize( "EQUIPMENT_DRONE_SIGNAL_LOST" ), 0 )
				end
			}
		} )
		DroneIcon:RegisterAnimationSequence( "LostConnection", {
			{
				function ()
					return self.DroneIcon:SetAlpha( 1, 0 )
				end,
				function ()
					return self.DroneIcon:SetAlpha( 1, 1400 )
				end,
				function ()
					return self.DroneIcon:SetAlpha( 0, 100 )
				end
			},
			{
				function ()
					return self.DroneIcon:SetRGBFromInt( 16777215, 0 )
				end
			}
		} )
		PanelDots:RegisterAnimationSequence( "LostConnection", {
			{
				function ()
					return self.PanelDots:SetAnchorsAndPosition( 0, 1, 1, 0, 0, 0, 0, 0, 0 )
				end
			}
		} )
		self._sequences.LostConnection = function ()
			DroneWidgetBackground0:AnimateSequence( "LostConnection" )
			YellowTape:AnimateSequence( "LostConnection" )
			DroneWidgetInfo0:AnimateSequence( "LostConnection" )
			WarningText:AnimateSequence( "LostConnection" )
			DroneIcon:AnimateSequence( "LostConnection" )
			PanelDots:AnimateSequence( "LostConnection" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	self:SubscribeToModelThroughElement( self, "state", function ()
		local f113_local0 = self:GetDataSource()
		if f113_local0.state:GetValue( f1_local1 ) ~= nil then
			f113_local0 = self:GetDataSource()
			if f113_local0.state:GetValue( f1_local1 ) == 1 then
				ACTIONS.AnimateSequence( self, "Intro" )
			end
		end
		f113_local0 = self:GetDataSource()
		if f113_local0.state:GetValue( f1_local1 ) ~= nil then
			f113_local0 = self:GetDataSource()
			if f113_local0.state:GetValue( f1_local1 ) == 2 then
				ACTIONS.AnimateSequence( self, "Destroyed" )
			end
		end
		f113_local0 = self:GetDataSource()
		if f113_local0.state:GetValue( f1_local1 ) ~= nil then
			f113_local0 = self:GetDataSource()
			if f113_local0.state:GetValue( f1_local1 ) == 3 then
				ACTIONS.AnimateSequence( self, "OutOfAmmo" )
			end
		end
		f113_local0 = self:GetDataSource()
		if f113_local0.state:GetValue( f1_local1 ) ~= nil then
			f113_local0 = self:GetDataSource()
			if f113_local0.state:GetValue( f1_local1 ) == 4 then
				ACTIONS.AnimateSequence( self, "LostConnection" )
			end
		end
	end )
	self:SubscribeToModelThroughElement( self, "ammoCount", function ()
		ACTIONS.AnimateSequenceByElement( self, {
			elementName = "DroneWidgetInfo0",
			sequenceName = "AmmoChange",
			elementPath = "DroneWidgetInfo0"
		} )
		local f114_local0 = self:GetDataSource()
		if f114_local0.ammoCount:GetValue( f1_local1 ) ~= nil then
			f114_local0 = self:GetDataSource()
			if f114_local0.ammoCount:GetValue( f1_local1 ) > 4 then
				ACTIONS.AnimateSequenceByElement( self, {
					elementName = "DroneWidgetInfo0",
					sequenceName = "AmmoNormal",
					elementPath = "DroneWidgetInfo0"
				} )
				ACTIONS.AnimateSequence( self, "AmmoNormal" )
			end
		end
		f114_local0 = self:GetDataSource()
		if f114_local0.ammoCount:GetValue( f1_local1 ) ~= nil then
			f114_local0 = self:GetDataSource()
			if f114_local0.ammoCount:GetValue( f1_local1 ) <= 4 then
				ACTIONS.AnimateSequenceByElement( self, {
					elementName = "DroneWidgetInfo0",
					sequenceName = "AmmoLow",
					elementPath = "DroneWidgetInfo0"
				} )
				ACTIONS.AnimateSequence( self, "AmmoLow" )
			end
		end
	end )
	return self
end

MenuBuilder.registerType( "DroneWidget", DroneWidget )
LockTable( _M )
