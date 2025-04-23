local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function JackalTargets( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 300 * _1080p, 0, 40 * _1080p )
	self.id = "JackalTargets"
	self._animationSets = {}
	self._sequences = {}
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local Background = nil
	
	Background = LUI.UIImage.new()
	Background.id = "Background"
	Background:setImage( RegisterMaterial( "jackal_hack_accent_targets" ), 0 )
	Background:SetUseAA( true )
	Background:SetAnchorsAndPosition( 0, 1, 0.5, 0.5, 0, _1080p * 300, _1080p * -20, _1080p * 20 )
	self:addElement( Background )
	self.Background = Background
	
	local TargetNumText = nil
	
	TargetNumText = LUI.UIStyledText.new()
	TargetNumText.id = "TargetNumText"
	TargetNumText:SetRGBFromTable( SWATCHES.HUD.warning, 0 )
	TargetNumText:SetFontSize( 22 * _1080p )
	TargetNumText:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	TargetNumText:SetAlignment( LUI.Alignment.Center )
	TargetNumText:SetAnchorsAndPosition( 0, 1, 0.5, 0.5, _1080p * 201, _1080p * 298, _1080p * -11, _1080p * 11 )
	TargetNumText:SubscribeToModel( DataSources.inGame.SP.pearlHarbor.jackalTargetsLocked:GetModel( f1_local1 ), function ()
		local f2_local0 = DataSources.inGame.SP.pearlHarbor.jackalTargetsLocked:GetValue( f1_local1 )
		if f2_local0 ~= nil then
			TargetNumText:setText( f2_local0, 0 )
		end
	end )
	self:addElement( TargetNumText )
	self.TargetNumText = TargetNumText
	
	local TargetText = nil
	
	TargetText = LUI.UIStyledText.new()
	TargetText.id = "TargetText"
	TargetText:SetRGBFromInt( 0, 0 )
	TargetText:setText( ToUpperCase( Engine.Localize( "HUD_JACKAL_TARGETS" ) ), 0 )
	TargetText:SetFontSize( 22 * _1080p )
	TargetText:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	TargetText:SetAlignment( LUI.Alignment.Center )
	TargetText:SetAnchorsAndPosition( 0, 1, 0.5, 0.5, 0, _1080p * 200, _1080p * -11, _1080p * 11 )
	self:addElement( TargetText )
	self.TargetText = TargetText
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		Background:RegisterAnimationSequence( "Bootup", {
			{
				function ()
					return self.Background:SetAlpha( 0, 0 )
				end,
				function ()
					return self.Background:SetAlpha( 1, 300, LUI.EASING.outBack )
				end
			},
			{
				function ()
					return self.Background:SetAnchorsAndPosition( 0, 1, 0.5, 0.5, _1080p * 300, _1080p * 600, _1080p * -20, _1080p * 20, 0 )
				end,
				function ()
					return self.Background:SetAnchorsAndPosition( 0, 1, 0.5, 0.5, _1080p * 300, _1080p * 600, _1080p * -20, _1080p * 20, 100 )
				end,
				function ()
					return self.Background:SetAnchorsAndPosition( 0, 1, 0.5, 0.5, 0, _1080p * 300, _1080p * -20, _1080p * 20, 200, LUI.EASING.outBack )
				end
			}
		} )
		TargetNumText:RegisterAnimationSequence( "Bootup", {
			{
				function ()
					return self.TargetNumText:SetAlpha( 0, 0 )
				end,
				function ()
					return self.TargetNumText:SetAlpha( 0, 100 )
				end,
				function ()
					return self.TargetNumText:SetAlpha( 1, 200, LUI.EASING.outBack )
				end
			},
			{
				function ()
					return self.TargetNumText:SetAnchorsAndPosition( 0, 1, 0.5, 0.5, _1080p * 501, _1080p * 598, _1080p * -10, _1080p * 10, 0 )
				end,
				function ()
					return self.TargetNumText:SetAnchorsAndPosition( 0, 1, 0.5, 0.5, _1080p * 501, _1080p * 598, _1080p * -10, _1080p * 10, 100 )
				end,
				function ()
					return self.TargetNumText:SetAnchorsAndPosition( 0, 1, 0.5, 0.5, _1080p * 201, _1080p * 298, _1080p * -10, _1080p * 10, 200, LUI.EASING.outBack )
				end
			}
		} )
		TargetText:RegisterAnimationSequence( "Bootup", {
			{
				function ()
					return self.TargetText:SetAlpha( 0, 0 )
				end,
				function ()
					return self.TargetText:SetAlpha( 0, 100 )
				end,
				function ()
					return self.TargetText:SetAlpha( 1, 200, LUI.EASING.outBack )
				end,
				function ()
					return self.TargetText:SetAlpha( 0, 10 )
				end,
				function ()
					return self.TargetText:SetAlpha( 0, 40 )
				end,
				function ()
					return self.TargetText:SetAlpha( 1, 10 )
				end,
				function ()
					return self.TargetText:SetAlpha( 1, 40 )
				end,
				function ()
					return self.TargetText:SetAlpha( 0, 10 )
				end,
				function ()
					return self.TargetText:SetAlpha( 0, 40 )
				end,
				function ()
					return self.TargetText:SetAlpha( 1, 10 )
				end
			},
			{
				function ()
					return self.TargetText:SetAnchorsAndPosition( 0, 1, 0.5, 0.5, _1080p * 300, _1080p * 500, _1080p * -10, _1080p * 10, 0 )
				end,
				function ()
					return self.TargetText:SetAnchorsAndPosition( 0, 1, 0.5, 0.5, _1080p * 300, _1080p * 500, _1080p * -10, _1080p * 10, 100 )
				end,
				function ()
					return self.TargetText:SetAnchorsAndPosition( 0, 1, 0.5, 0.5, 0, _1080p * 200, _1080p * -10, _1080p * 10, 200, LUI.EASING.outBack )
				end
			}
		} )
		self._sequences.Bootup = function ()
			Background:AnimateSequence( "Bootup" )
			TargetNumText:AnimateSequence( "Bootup" )
			TargetText:AnimateSequence( "Bootup" )
		end
		
		TargetNumText:RegisterAnimationSequence( "Target", {
			{
				function ()
					return self.TargetNumText:SetScale( 1, 100 )
				end,
				function ()
					return self.TargetNumText:SetScale( 0, 200, LUI.EASING.outBack )
				end
			},
			{
				function ()
					return self.TargetNumText:SetRGBFromInt( 16777215, 100 )
				end,
				function ()
					return self.TargetNumText:SetRGBFromTable( SWATCHES.HUD.warning, 200, LUI.EASING.outBack )
				end
			}
		} )
		self._sequences.Target = function ()
			TargetNumText:AnimateSequence( "Target" )
		end
		
		Background:RegisterAnimationSequence( "Shutdown", {
			{
				function ()
					return self.Background:SetAlpha( 1, 0 )
				end,
				function ()
					return self.Background:SetAlpha( 0, 200, LUI.EASING.inBack )
				end
			},
			{
				function ()
					return self.Background:SetAnchorsAndPosition( 0, 1, 0.5, 0.5, 0, _1080p * 300, _1080p * -20, _1080p * 20, 0 )
				end,
				function ()
					return self.Background:SetAnchorsAndPosition( 0, 1, 0.5, 0.5, _1080p * 300, _1080p * 600, _1080p * -20, _1080p * 20, 200, LUI.EASING.inBack )
				end
			}
		} )
		TargetNumText:RegisterAnimationSequence( "Shutdown", {
			{
				function ()
					return self.TargetNumText:SetAlpha( 1, 0 )
				end,
				function ()
					return self.TargetNumText:SetAlpha( 0, 200, LUI.EASING.inBack )
				end
			},
			{
				function ()
					return self.TargetNumText:SetAnchorsAndPosition( 0, 1, 0.5, 0.5, _1080p * 201, _1080p * 298, _1080p * -10, _1080p * 10, 0 )
				end,
				function ()
					return self.TargetNumText:SetAnchorsAndPosition( 0, 1, 0.5, 0.5, _1080p * 501, _1080p * 598, _1080p * -10, _1080p * 10, 200, LUI.EASING.inBack )
				end
			}
		} )
		TargetText:RegisterAnimationSequence( "Shutdown", {
			{
				function ()
					return self.TargetText:SetAlpha( 1, 0 )
				end,
				function ()
					return self.TargetText:SetAlpha( 0, 200, LUI.EASING.inBack )
				end
			},
			{
				function ()
					return self.TargetText:SetAnchorsAndPosition( 0, 1, 0.5, 0.5, 0, _1080p * 200, _1080p * -10, _1080p * 10, 0 )
				end,
				function ()
					return self.TargetText:SetAnchorsAndPosition( 0, 1, 0.5, 0.5, _1080p * 300, _1080p * 500, _1080p * -10, _1080p * 10, 200, LUI.EASING.inBack )
				end
			}
		} )
		self._sequences.Shutdown = function ()
			Background:AnimateSequence( "Shutdown" )
			TargetNumText:AnimateSequence( "Shutdown" )
			TargetText:AnimateSequence( "Shutdown" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	self:addEventHandler( "hud_anim_shutdown_off", function ( f48_arg0, f48_arg1 )
		local f48_local0 = f48_arg1.controller or f1_local1
		ACTIONS.AnimateSequence( self, "Shutdown" )
	end )
	self:SubscribeToModel( DataSources.inGame.SP.pearlHarbor.jackalTargetsLocked:GetModel( f1_local1 ), function ()
		ACTIONS.AnimateSequence( self, "Target" )
	end )
	ACTIONS.AnimateSequence( self, "Bootup" )
	return self
end

MenuBuilder.registerType( "JackalTargets", JackalTargets )
LockTable( _M )
