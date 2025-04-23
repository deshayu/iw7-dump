local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function CloakChargeProgressMeter( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 220 * _1080p, 0, 20 * _1080p )
	self.id = "CloakChargeProgressMeter"
	self._animationSets = {}
	self._sequences = {}
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local VisualHorizontalLine = nil
	
	VisualHorizontalLine = LUI.UIImage.new()
	VisualHorizontalLine.id = "VisualHorizontalLine"
	VisualHorizontalLine:SetRGBFromTable( SWATCHES.HUD.stable, 0 )
	VisualHorizontalLine:SetAlpha( 0.4, 0 )
	VisualHorizontalLine:SetAnchorsAndPosition( 0, 0, 0.5, 0.5, _1080p * 1, _1080p * -1, _1080p * -1.25, _1080p * 1.25 )
	self:addElement( VisualHorizontalLine )
	self.VisualHorizontalLine = VisualHorizontalLine
	
	local VisualVerticalLineRight = nil
	
	VisualVerticalLineRight = LUI.UIImage.new()
	VisualVerticalLineRight.id = "VisualVerticalLineRight"
	VisualVerticalLineRight:SetRGBFromTable( SWATCHES.HUD.stable, 0 )
	VisualVerticalLineRight:SetAnchorsAndPosition( 1, 0, 0, 0, _1080p * -1, 0, 0, 0 )
	self:addElement( VisualVerticalLineRight )
	self.VisualVerticalLineRight = VisualVerticalLineRight
	
	local Fill = nil
	
	Fill = LUI.UIImage.new()
	Fill.id = "Fill"
	Fill:SetAnchors( 0, 1, 0, 0, 0 )
	Fill:SetLeft( _1080p * 0, 0 )
	Fill:SetTop( _1080p * 0, 0 )
	Fill:SetBottom( _1080p * 0, 0 )
	Fill:SetRGBFromInt( 3559935, 0 )
	Fill:BindRightToModel( DataSources.inGame.player.suits.CloakChargeProgressMeter:GetModel( f1_local1 ) )
	self:addElement( Fill )
	self.Fill = Fill
	
	local EndNodeRight = nil
	
	EndNodeRight = LUI.UIImage.new()
	EndNodeRight.id = "EndNodeRight"
	EndNodeRight:SetAnchors( 0, 1, 0, 0, 0 )
	EndNodeRight:SetTop( _1080p * 0, 0 )
	EndNodeRight:SetBottom( _1080p * 0, 0 )
	EndNodeRight:BindLeftToModel( DataSources.inGame.player.suits.CloakChargeProgressMeter:GetModel( f1_local1 ) )
	EndNodeRight:BindRightToModel( DataSources.inGame.player.suits.CloakChargeProgressMeter:GetModel( f1_local1 ) )
	self:addElement( EndNodeRight )
	self.EndNodeRight = EndNodeRight
	
	local Label0 = nil
	
	Label0 = LUI.UIText.new()
	Label0.id = "Label0"
	Label0:SetRGBFromInt( 16316927, 0 )
	Label0:setText( "CLOAK ACTIVATING", 0 )
	Label0:SetFontSize( 16 * _1080p )
	Label0:SetFont( FONTS.GetFont( FONTS.Dev.File ) )
	Label0:SetAlignment( LUI.Alignment.Center )
	Label0:SetAnchorsAndPosition( 0, 0, 0.5, 0.5, 0, 0, _1080p * 10, _1080p * 26 )
	self:addElement( Label0 )
	self.Label0 = Label0
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		VisualHorizontalLine:RegisterAnimationSequence( "HideMovementMeter", {
			{
				function ()
					return self.VisualHorizontalLine:SetAlpha( 0, 0 )
				end
			}
		} )
		VisualVerticalLineRight:RegisterAnimationSequence( "HideMovementMeter", {
			{
				function ()
					return self.VisualVerticalLineRight:SetAlpha( 0, 0 )
				end
			}
		} )
		Fill:RegisterAnimationSequence( "HideMovementMeter", {
			{
				function ()
					return self.Fill:SetAlpha( 0, 0 )
				end
			}
		} )
		EndNodeRight:RegisterAnimationSequence( "HideMovementMeter", {
			{
				function ()
					return self.EndNodeRight:SetAlpha( 0, 0 )
				end
			}
		} )
		Label0:RegisterAnimationSequence( "HideMovementMeter", {
			{
				function ()
					return self.Label0:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.HideMovementMeter = function ()
			VisualHorizontalLine:AnimateSequence( "HideMovementMeter" )
			VisualVerticalLineRight:AnimateSequence( "HideMovementMeter" )
			Fill:AnimateSequence( "HideMovementMeter" )
			EndNodeRight:AnimateSequence( "HideMovementMeter" )
			Label0:AnimateSequence( "HideMovementMeter" )
		end
		
		VisualHorizontalLine:RegisterAnimationSequence( "ShowMovementMeter", {
			{
				function ()
					return self.VisualHorizontalLine:SetAlpha( 0.4, 0 )
				end
			}
		} )
		VisualVerticalLineRight:RegisterAnimationSequence( "ShowMovementMeter", {
			{
				function ()
					return self.VisualVerticalLineRight:SetAlpha( 1, 0 )
				end
			}
		} )
		Fill:RegisterAnimationSequence( "ShowMovementMeter", {
			{
				function ()
					return self.Fill:SetAlpha( 1, 0 )
				end
			}
		} )
		EndNodeRight:RegisterAnimationSequence( "ShowMovementMeter", {
			{
				function ()
					return self.EndNodeRight:SetAlpha( 1, 0 )
				end
			}
		} )
		Label0:RegisterAnimationSequence( "ShowMovementMeter", {
			{
				function ()
					return self.Label0:SetAlpha( 1, 0 )
				end
			}
		} )
		self._sequences.ShowMovementMeter = function ()
			VisualHorizontalLine:AnimateSequence( "ShowMovementMeter" )
			VisualVerticalLineRight:AnimateSequence( "ShowMovementMeter" )
			Fill:AnimateSequence( "ShowMovementMeter" )
			EndNodeRight:AnimateSequence( "ShowMovementMeter" )
			Label0:AnimateSequence( "ShowMovementMeter" )
		end
		
		VisualHorizontalLine:RegisterAnimationSequence( "HideMovementMeterAnime", {
			{
				function ()
					return self.VisualHorizontalLine:SetAlpha( 0.4, 750 )
				end,
				function ()
					return self.VisualHorizontalLine:SetAlpha( 0, 250 )
				end
			}
		} )
		VisualVerticalLineRight:RegisterAnimationSequence( "HideMovementMeterAnime", {
			{
				function ()
					return self.VisualVerticalLineRight:SetAlpha( 1, 750 )
				end,
				function ()
					return self.VisualVerticalLineRight:SetAlpha( 0, 250 )
				end
			}
		} )
		Fill:RegisterAnimationSequence( "HideMovementMeterAnime", {
			{
				function ()
					return self.Fill:SetAlpha( 1, 750 )
				end,
				function ()
					return self.Fill:SetAlpha( 0, 250 )
				end
			}
		} )
		EndNodeRight:RegisterAnimationSequence( "HideMovementMeterAnime", {
			{
				function ()
					return self.EndNodeRight:SetAlpha( 1, 750 )
				end,
				function ()
					return self.EndNodeRight:SetAlpha( 0, 250 )
				end
			}
		} )
		Label0:RegisterAnimationSequence( "HideMovementMeterAnime", {
			{
				function ()
					return self.Label0:SetAlpha( 1, 750 )
				end,
				function ()
					return self.Label0:SetAlpha( 0, 250 )
				end
			}
		} )
		self._sequences.HideMovementMeterAnime = function ()
			VisualHorizontalLine:AnimateSequence( "HideMovementMeterAnime" )
			VisualVerticalLineRight:AnimateSequence( "HideMovementMeterAnime" )
			Fill:AnimateSequence( "HideMovementMeterAnime" )
			EndNodeRight:AnimateSequence( "HideMovementMeterAnime" )
			Label0:AnimateSequence( "HideMovementMeterAnime" )
		end
		
		Fill:RegisterAnimationSequence( "SpecialBoost", {
			{
				function ()
					return self.Fill:SetRGBFromInt( 10078693, 0 )
				end
			},
			{
				function ()
					return self.Fill:SetAnchors( 0, 1, 0, 0, 0 )
				end
			},
			{
				function ()
					return self.Fill:SetLeft( _1080p * 0, 0 )
				end
			},
			{
				function ()
					return self.Fill:SetTop( _1080p * 5, 0 )
				end
			},
			{
				function ()
					return self.Fill:SetBottom( _1080p * -5, 0 )
				end
			},
			{
				function ()
					return self.Fill:SetAlpha( 1, 0 )
				end,
				function ()
					return self.Fill:SetAlpha( 0.5, 500 )
				end,
				function ()
					return self.Fill:SetAlpha( 1, 500 )
				end
			}
		} )
		Label0:RegisterAnimationSequence( "SpecialBoost", {
			{
				function ()
					return self.Label0:setText( "CLOAK ENGAGED", 0 )
				end
			}
		} )
		self._sequences.SpecialBoost = function ()
			Fill:AnimateSequence( "SpecialBoost" )
			Label0:AnimateSequence( "SpecialBoost" )
		end
		
		Fill:RegisterAnimationSequence( "DefaultBoost", {
			{
				function ()
					return self.Fill:SetRGBFromInt( 3158756, 0 )
				end
			},
			{
				function ()
					return self.Fill:SetAnchors( 0, 1, 0, 0, 0 )
				end
			},
			{
				function ()
					return self.Fill:SetLeft( _1080p * 0, 0 )
				end
			},
			{
				function ()
					return self.Fill:SetTop( _1080p * 0, 0 )
				end
			},
			{
				function ()
					return self.Fill:SetBottom( _1080p * 0, 0 )
				end
			}
		} )
		Label0:RegisterAnimationSequence( "DefaultBoost", {
			{
				function ()
					return self.Label0:setText( "CLOAK ACTIVATING", 0 )
				end
			}
		} )
		self._sequences.DefaultBoost = function ()
			Fill:AnimateSequence( "DefaultBoost" )
			Label0:AnimateSequence( "DefaultBoost" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	self:SubscribeToModel( DataSources.inGame.player.suits.CloakChargeProgressMeter:GetModel( f1_local1 ), function ()
		if DataSources.inGame.player.suits.CloakChargeProgressMeter:GetValue( f1_local1 ) ~= nil and DataSources.inGame.player.suits.CloakChargeProgressMeter:GetValue( f1_local1 ) > 0 then
			ACTIONS.AnimateSequence( self, "ShowMovementMeter" )
		end
		if DataSources.inGame.player.suits.CloakChargeProgressMeter:GetValue( f1_local1 ) ~= nil and DataSources.inGame.player.suits.CloakChargeProgressMeter:GetValue( f1_local1 ) == false then
			ACTIONS.AnimateSequence( self, "HideMovementMeterAnime" )
		end
		if DataSources.inGame.player.suits.CloakChargeProgressMeter:GetValue( f1_local1 ) ~= nil and DataSources.inGame.player.suits.CloakChargeProgressMeter:GetValue( f1_local1 ) == 0 then
			ACTIONS.AnimateSequence( self, "HideMovementMeterAnime" )
		end
		if DataSources.inGame.player.suits.CloakChargeProgressMeter:GetValue( f1_local1 ) ~= nil and DataSources.inGame.player.suits.CloakChargeProgressMeter:GetValue( f1_local1 ) == 1024 then
			ACTIONS.AnimateSequence( self, "SpecialBoost" )
		end
	end )
	self:addEventHandler( "menu_create", function ( f45_arg0, f45_arg1 )
		local f45_local0 = f45_arg1.controller or f1_local1
		ACTIONS.AnimateSequence( self, "HideMovementMeter" )
	end )
	self:SubscribeToModel( DataSources.inGame.player.suits.CloakChargeProgressState:GetModel( f1_local1 ), function ()
		if DataSources.inGame.player.suits.CloakChargeProgressState:GetValue( f1_local1 ) ~= nil and DataSources.inGame.player.suits.CloakChargeProgressState:GetValue( f1_local1 ) == 1 then
			ACTIONS.AnimateSequence( self, "SpecialBoost" )
		end
		if DataSources.inGame.player.suits.CloakChargeProgressState:GetValue( f1_local1 ) ~= nil and DataSources.inGame.player.suits.CloakChargeProgressState:GetValue( f1_local1 ) == 0 then
			ACTIONS.AnimateSequence( self, "DefaultBoost" )
		end
	end )
	return self
end

MenuBuilder.registerType( "CloakChargeProgressMeter", CloakChargeProgressMeter )
LockTable( _M )
