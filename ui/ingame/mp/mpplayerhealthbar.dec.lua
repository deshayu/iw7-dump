local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function MPPlayerHealthBar( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 720 * _1080p, 0, 40 * _1080p )
	self.id = "MPPlayerHealthBar"
	self._animationSets = {}
	self._sequences = {}
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local HealthLabel = nil
	
	HealthLabel = LUI.UIText.new()
	HealthLabel.id = "HealthLabel"
	HealthLabel:setText( Engine.Localize( "LUA_MENU_MP_HEALTH_BAR" ), 0 )
	HealthLabel:SetFontSize( 16 * _1080p )
	HealthLabel:SetFont( FONTS.GetFont( FONTS.Digital.File ) )
	HealthLabel:SetAlignment( LUI.Alignment.Center )
	HealthLabel:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -1, _1080p * 719, _1080p * 22.5, _1080p * 38.5 )
	self:addElement( HealthLabel )
	self.HealthLabel = HealthLabel
	
	local HealthBarBG = nil
	
	HealthBarBG = LUI.UIImage.new()
	HealthBarBG.id = "HealthBarBG"
	HealthBarBG:SetRGBFromTable( SWATCHES.healthBar.backgroundMP, 0 )
	HealthBarBG:SetAlpha( 0.3, 0 )
	HealthBarBG:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -1, _1080p * 719, _1080p * 5.5, _1080p * 19 )
	self:addElement( HealthBarBG )
	self.HealthBarBG = HealthBarBG
	
	local HealthBarForeground = nil
	
	HealthBarForeground = LUI.UIImage.new()
	HealthBarForeground.id = "HealthBarForeground"
	HealthBarForeground:SetAnchors( 0, 1, 0, 1, 0 )
	HealthBarForeground:SetLeft( _1080p * -1, 0 )
	HealthBarForeground:SetTop( _1080p * 5.5, 0 )
	HealthBarForeground:SetBottom( _1080p * 19, 0 )
	HealthBarForeground:SetRGBFromTable( SWATCHES.healthBar.foregroundMP, 0 )
	HealthBarForeground:SubscribeToModel( DataSources.inGame.player.health:GetModel( f1_local1 ), function ()
		local f2_local0 = DataSources.inGame.player.health:GetValue( f1_local1 )
		if f2_local0 ~= nil then
			HealthBarForeground:SetRight( _1080p * Multiply( Divide( f2_local0, DataSources.inGame.player.maxHealth:GetValue( f1_local1 ) ), 720 ), 0 )
		end
	end )
	HealthBarForeground:SubscribeToModel( DataSources.inGame.player.maxHealth:GetModel( f1_local1 ), function ()
		local f3_local0 = DataSources.inGame.player.health:GetValue( f1_local1 )
		if f3_local0 ~= nil then
			HealthBarForeground:SetRight( _1080p * Multiply( Divide( f3_local0, DataSources.inGame.player.maxHealth:GetValue( f1_local1 ) ), 720 ), 0 )
		end
	end )
	self:addElement( HealthBarForeground )
	self.HealthBarForeground = HealthBarForeground
	
	local LightArmorBarForeground = nil
	
	LightArmorBarForeground = LUI.UIImage.new()
	LightArmorBarForeground.id = "LightArmorBarForeground"
	LightArmorBarForeground:SetAnchors( 0, 1, 0, 1, 0 )
	LightArmorBarForeground:SetLeft( _1080p * -1, 0 )
	LightArmorBarForeground:SetTop( _1080p * 0, 0 )
	LightArmorBarForeground:SetBottom( _1080p * 5.5, 0 )
	LightArmorBarForeground:SetRGBFromTable( SWATCHES.healthBar.lightArmorForegroundMP, 0 )
	LightArmorBarForeground:SubscribeToModel( DataSources.inGame.player.lightArmorHP:GetModel( f1_local1 ), function ()
		local f4_local0 = DataSources.inGame.player.lightArmorHP:GetValue( f1_local1 )
		if f4_local0 ~= nil then
			LightArmorBarForeground:SetRight( _1080p * Multiply( Divide( f4_local0, 100 ), 720 ), 0 )
		end
	end )
	self:addElement( LightArmorBarForeground )
	self.LightArmorBarForeground = LightArmorBarForeground
	
	local HeavyArmorBarForeground = nil
	
	HeavyArmorBarForeground = LUI.UIImage.new()
	HeavyArmorBarForeground.id = "HeavyArmorBarForeground"
	HeavyArmorBarForeground:SetAnchors( 0, 1, 0, 1, 0 )
	HeavyArmorBarForeground:SetLeft( _1080p * -1, 0 )
	HeavyArmorBarForeground:SetTop( _1080p * 0, 0 )
	HeavyArmorBarForeground:SetBottom( _1080p * 5.5, 0 )
	HeavyArmorBarForeground:SetRGBFromInt( 606729, 0 )
	HeavyArmorBarForeground:SubscribeToModel( DataSources.inGame.player.heavyArmorHP:GetModel( f1_local1 ), function ()
		local f5_local0 = DataSources.inGame.player.heavyArmorHP:GetValue( f1_local1 )
		if f5_local0 ~= nil then
			HeavyArmorBarForeground:SetRight( _1080p * Multiply( Divide( f5_local0, 100 ), 720 ), 0 )
		end
	end )
	self:addElement( HeavyArmorBarForeground )
	self.HeavyArmorBarForeground = HeavyArmorBarForeground
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		HealthLabel:RegisterAnimationSequence( "LowVis", {
			{
				function ()
					return self.HealthLabel:SetAlpha( 0.3, 200 )
				end
			}
		} )
		HealthBarBG:RegisterAnimationSequence( "LowVis", {
			{
				function ()
					return self.HealthBarBG:SetAlpha( 0.1, 200 )
				end
			}
		} )
		HealthBarForeground:RegisterAnimationSequence( "LowVis", {
			{
				function ()
					return self.HealthBarForeground:SetAlpha( 0.3, 200 )
				end
			}
		} )
		self._sequences.LowVis = function ()
			HealthLabel:AnimateSequence( "LowVis" )
			HealthBarBG:AnimateSequence( "LowVis" )
			HealthBarForeground:AnimateSequence( "LowVis" )
		end
		
		HealthLabel:RegisterAnimationSequence( "Normal", {
			{
				function ()
					return self.HealthLabel:SetAlpha( 1, 0 )
				end
			}
		} )
		HealthBarBG:RegisterAnimationSequence( "Normal", {
			{
				function ()
					return self.HealthBarBG:SetAlpha( 0.3, 0 )
				end
			}
		} )
		HealthBarForeground:RegisterAnimationSequence( "Normal", {
			{
				function ()
					return self.HealthBarForeground:SetAlpha( 1, 0 )
				end
			}
		} )
		self._sequences.Normal = function ()
			HealthLabel:AnimateSequence( "Normal" )
			HealthBarBG:AnimateSequence( "Normal" )
			HealthBarForeground:AnimateSequence( "Normal" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	local f1_local8 = function ()
		if DataSources.inGame.player.health:GetValue( f1_local1 ) ~= nil and DataSources.inGame.player.maxHealth:GetValue( f1_local1 ) ~= nil and DataSources.inGame.player.maxHealth:GetValue( f1_local1 ) <= DataSources.inGame.player.health:GetValue( f1_local1 ) and DataSources.inGame.player.lightArmorHP:GetValue( f1_local1 ) ~= nil and DataSources.inGame.player.lightArmorHP:GetValue( f1_local1 ) == 0 and DataSources.inGame.player.heavyArmorHP:GetValue( f1_local1 ) ~= nil and DataSources.inGame.player.heavyArmorHP:GetValue( f1_local1 ) == 0 then
			ACTIONS.AnimateSequence( self, "LowVis" )
		end
		if DataSources.inGame.player.health:GetValue( f1_local1 ) ~= nil and DataSources.inGame.player.maxHealth:GetValue( f1_local1 ) ~= nil and DataSources.inGame.player.health:GetValue( f1_local1 ) < DataSources.inGame.player.maxHealth:GetValue( f1_local1 ) then
			ACTIONS.AnimateSequence( self, "Normal" )
		end
	end
	
	self:SubscribeToModel( DataSources.inGame.player.health:GetModel( f1_local1 ), f1_local8 )
	self:SubscribeToModel( DataSources.inGame.player.maxHealth:GetModel( f1_local1 ), f1_local8 )
	self:SubscribeToModel( DataSources.inGame.player.lightArmorHP:GetModel( f1_local1 ), f1_local8 )
	self:SubscribeToModel( DataSources.inGame.player.heavyArmorHP:GetModel( f1_local1 ), f1_local8 )
	local f1_local9 = function ()
		if DataSources.inGame.player.health:GetValue( f1_local1 ) ~= nil and DataSources.inGame.player.maxHealth:GetValue( f1_local1 ) ~= nil and DataSources.inGame.player.maxHealth:GetValue( f1_local1 ) <= DataSources.inGame.player.health:GetValue( f1_local1 ) and DataSources.inGame.player.lightArmorHP:GetValue( f1_local1 ) ~= nil and DataSources.inGame.player.lightArmorHP:GetValue( f1_local1 ) == 0 and DataSources.inGame.player.heavyArmorHP:GetValue( f1_local1 ) ~= nil and DataSources.inGame.player.heavyArmorHP:GetValue( f1_local1 ) == 0 then
			ACTIONS.AnimateSequence( self, "LowVis" )
		end
		if DataSources.inGame.player.lightArmorHP:GetValue( f1_local1 ) ~= nil and DataSources.inGame.player.lightArmorHP:GetValue( f1_local1 ) > 0 then
			ACTIONS.AnimateSequence( self, "Normal" )
		end
	end
	
	self:SubscribeToModel( DataSources.inGame.player.health:GetModel( f1_local1 ), f1_local9 )
	self:SubscribeToModel( DataSources.inGame.player.maxHealth:GetModel( f1_local1 ), f1_local9 )
	self:SubscribeToModel( DataSources.inGame.player.lightArmorHP:GetModel( f1_local1 ), f1_local9 )
	self:SubscribeToModel( DataSources.inGame.player.heavyArmorHP:GetModel( f1_local1 ), f1_local9 )
	self:SubscribeToModel( DataSources.inGame.player.heavyArmorHP:GetModel( f1_local1 ), function ()
		if DataSources.inGame.player.heavyArmorHP:GetValue( f1_local1 ) ~= nil and DataSources.inGame.player.heavyArmorHP:GetValue( f1_local1 ) > 0 then
			ACTIONS.AnimateSequence( self, "Normal" )
		end
		if DataSources.inGame.player.heavyArmorHP:GetValue( f1_local1 ) ~= nil and DataSources.inGame.player.heavyArmorHP:GetValue( f1_local1 ) == 0 and DataSources.inGame.player.lightArmorHP:GetValue( f1_local1 ) ~= nil and DataSources.inGame.player.lightArmorHP:GetValue( f1_local1 ) == 0 and DataSources.inGame.player.health:GetValue( f1_local1 ) ~= nil and DataSources.inGame.player.maxHealth:GetValue( f1_local1 ) ~= nil and DataSources.inGame.player.maxHealth:GetValue( f1_local1 ) <= DataSources.inGame.player.health:GetValue( f1_local1 ) then
			ACTIONS.AnimateSequence( self, "LowVis" )
		end
	end )
	return self
end

MenuBuilder.registerType( "MPPlayerHealthBar", MPPlayerHealthBar )
LockTable( _M )
