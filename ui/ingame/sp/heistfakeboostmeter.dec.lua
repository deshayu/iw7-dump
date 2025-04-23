local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function PostLoadFunc( f1_arg0, f1_arg1, f1_arg2 )
	f1_arg0:SubscribeToModel( DataSources.inGame.SP.heist.boostEnergy:GetModel( f1_arg1 ), function ()
		local f2_local0 = Game.GetOmnvar( "ui_hud_heist_boost_amount" )
		if f2_local0 ~= nil then
			f1_arg0.FillBar:SetRight( _1080p * Multiply( f2_local0, 220 ), 0 )
			f1_arg0.EndNodeRight:SetLeft( _1080p * Add( Multiply( f2_local0, 220 ), -5 ), 0 )
		end
	end )
end

function HeistFakeBoostMeter( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 220 * _1080p, 0, 5 * _1080p )
	self.id = "HeistFakeBoostMeter"
	self._animationSets = {}
	self._sequences = {}
	local f3_local1 = controller and controller.controllerIndex
	if not f3_local1 and not Engine.InFrontend() then
		f3_local1 = self:getRootController()
	end
	assert( f3_local1 )
	local f3_local2 = self
	local VisualHorizontalLine = nil
	
	VisualHorizontalLine = LUI.UIImage.new()
	VisualHorizontalLine.id = "VisualHorizontalLine"
	VisualHorizontalLine:SetRGBFromTable( SWATCHES.HUD.stable, 0 )
	VisualHorizontalLine:SetAlpha( 0, 0 )
	VisualHorizontalLine:SetAnchorsAndPosition( 0, 0, 0.5, 0.5, _1080p * 1, _1080p * -1, _1080p * -0.5, _1080p * 0.5 )
	self:addElement( VisualHorizontalLine )
	self.VisualHorizontalLine = VisualHorizontalLine
	
	local VisualVerticalLineRight = nil
	
	VisualVerticalLineRight = LUI.UIImage.new()
	VisualVerticalLineRight.id = "VisualVerticalLineRight"
	VisualVerticalLineRight:SetRGBFromTable( SWATCHES.HUD.stable, 0 )
	VisualVerticalLineRight:SetAlpha( 0, 0 )
	VisualVerticalLineRight:SetAnchorsAndPosition( 1, 0, 0, 0, _1080p * -1, 0, 0, 0 )
	self:addElement( VisualVerticalLineRight )
	self.VisualVerticalLineRight = VisualVerticalLineRight
	
	local FillBar = nil
	
	FillBar = LUI.UIImage.new()
	FillBar.id = "FillBar"
	FillBar:SetAnchors( 0, 1, 0, 0, 0 )
	FillBar:SetLeft( _1080p * 0, 0 )
	FillBar:SetTop( _1080p * 0, 0 )
	FillBar:SetBottom( _1080p * 0, 0 )
	FillBar:SetRGBFromTable( SWATCHES.movementMeter.defaultBoost_sp, 0 )
	FillBar:SetAlpha( 0, 0 )
	FillBar:SubscribeToModel( DataSources.inGame.SP.heist.boostEnergy:GetModel( f3_local1 ), function ()
		local f4_local0 = DataSources.inGame.SP.heist.boostEnergy:GetValue( f3_local1 )
		if f4_local0 ~= nil then
			FillBar:SetRight( _1080p * Multiply( f4_local0, 220 ), 0 )
		end
	end )
	self:addElement( FillBar )
	self.FillBar = FillBar
	
	local EndNodeRight = nil
	
	EndNodeRight = LUI.UIImage.new()
	EndNodeRight.id = "EndNodeRight"
	EndNodeRight:SetAnchors( 0, 1, 0, 0, 0 )
	EndNodeRight:SetTop( _1080p * 0, 0 )
	EndNodeRight:SetBottom( _1080p * 0, 0 )
	EndNodeRight:SetRGBFromTable( SWATCHES.HUD.normal, 0 )
	EndNodeRight:SetAlpha( 0, 0 )
	EndNodeRight:SubscribeToModel( DataSources.inGame.SP.heist.boostEnergy:GetModel( f3_local1 ), function ()
		local f5_local0 = DataSources.inGame.SP.heist.boostEnergy:GetValue( f3_local1 )
		if f5_local0 ~= nil then
			EndNodeRight:SetLeft( _1080p * Add( Multiply( f5_local0, 220 ), -5 ), 0 )
		end
	end )
	EndNodeRight:SubscribeToModel( DataSources.inGame.SP.heist.boostEnergy:GetModel( f3_local1 ), function ()
		local f6_local0 = DataSources.inGame.SP.heist.boostEnergy:GetValue( f3_local1 )
		if f6_local0 ~= nil then
			EndNodeRight:SetRight( _1080p * Multiply( f6_local0, 220 ), 0 )
		end
	end )
	self:addElement( EndNodeRight )
	self.EndNodeRight = EndNodeRight
	
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
		FillBar:RegisterAnimationSequence( "HideMovementMeter", {
			{
				function ()
					return self.FillBar:SetAlpha( 0, 0 )
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
		self._sequences.HideMovementMeter = function ()
			VisualHorizontalLine:AnimateSequence( "HideMovementMeter" )
			VisualVerticalLineRight:AnimateSequence( "HideMovementMeter" )
			FillBar:AnimateSequence( "HideMovementMeter" )
			EndNodeRight:AnimateSequence( "HideMovementMeter" )
		end
		
		VisualHorizontalLine:RegisterAnimationSequence( "ShowMovementMeter", {
			{
				function ()
					return self.VisualHorizontalLine:SetAlpha( 1, 0 )
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
		FillBar:RegisterAnimationSequence( "ShowMovementMeter", {
			{
				function ()
					return self.FillBar:SetAlpha( 1, 0 )
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
		self._sequences.ShowMovementMeter = function ()
			VisualHorizontalLine:AnimateSequence( "ShowMovementMeter" )
			VisualVerticalLineRight:AnimateSequence( "ShowMovementMeter" )
			FillBar:AnimateSequence( "ShowMovementMeter" )
			EndNodeRight:AnimateSequence( "ShowMovementMeter" )
		end
		
		VisualHorizontalLine:RegisterAnimationSequence( "HideMovementMeterAnime", {
			{
				function ()
					return self.VisualHorizontalLine:SetAlpha( 0, 1000 )
				end
			}
		} )
		VisualVerticalLineRight:RegisterAnimationSequence( "HideMovementMeterAnime", {
			{
				function ()
					return self.VisualVerticalLineRight:SetAlpha( 0, 1000 )
				end
			}
		} )
		FillBar:RegisterAnimationSequence( "HideMovementMeterAnime", {
			{
				function ()
					return self.FillBar:SetAlpha( 0, 1000 )
				end
			}
		} )
		EndNodeRight:RegisterAnimationSequence( "HideMovementMeterAnime", {
			{
				function ()
					return self.EndNodeRight:SetAlpha( 0, 1000 )
				end
			}
		} )
		self._sequences.HideMovementMeterAnime = function ()
			VisualHorizontalLine:AnimateSequence( "HideMovementMeterAnime" )
			VisualVerticalLineRight:AnimateSequence( "HideMovementMeterAnime" )
			FillBar:AnimateSequence( "HideMovementMeterAnime" )
			EndNodeRight:AnimateSequence( "HideMovementMeterAnime" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	self:SubscribeToModel( DataSources.inGame.SP.heist.showBoostMeter:GetModel( f3_local1 ), function ()
		if DataSources.inGame.SP.heist.showBoostMeter:GetValue( f3_local1 ) ~= nil and DataSources.inGame.SP.heist.showBoostMeter:GetValue( f3_local1 ) == true then
			ACTIONS.AnimateSequence( self, "ShowMovementMeter" )
		end
		if DataSources.inGame.SP.heist.showBoostMeter:GetValue( f3_local1 ) ~= nil and DataSources.inGame.SP.heist.showBoostMeter:GetValue( f3_local1 ) == false then
			ACTIONS.AnimateSequence( self, "HideMovementMeterAnime" )
		end
	end )
	PostLoadFunc( self, f3_local1, controller )
	return self
end

MenuBuilder.registerType( "HeistFakeBoostMeter", HeistFakeBoostMeter )
LockTable( _M )
