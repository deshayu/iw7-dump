local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function fateCardUsedContainer( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 1920 * _1080p, 0, 1080 * _1080p )
	self.id = "fateCardUsedContainer"
	self._animationSets = {}
	self._sequences = {}
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local RedGlow = nil
	
	RedGlow = LUI.UIImage.new()
	RedGlow.id = "RedGlow"
	RedGlow:SetAlpha( 0.8, 0 )
	RedGlow:SetScale( -0.6, 0 )
	RedGlow:setImage( RegisterMaterial( "cp_menu_pause_red_glow" ), 0 )
	RedGlow:SetBlendMode( BLEND_MODE.addWithAlpha )
	RedGlow:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 570, _1080p * 1350, _1080p * 92, _1080p * 872 )
	self:addElement( RedGlow )
	self.RedGlow = RedGlow
	
	local Spinner = nil
	
	Spinner = LUI.UIImage.new()
	Spinner.id = "Spinner"
	Spinner:SetAlpha( 0.3, 0 )
	Spinner:SetScale( -0.6, 0 )
	Spinner:setImage( RegisterMaterial( "zm_tix_arcane_spinner" ), 0 )
	Spinner:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 508, _1080p * 1412, _1080p * 28.5, _1080p * 932.5 )
	self:addElement( Spinner )
	self.Spinner = Spinner
	
	local ConsumableUsed = nil
	
	ConsumableUsed = MenuBuilder.BuildRegisteredType( "ConsumableUsed", {
		controllerIndex = f1_local1
	} )
	ConsumableUsed.id = "ConsumableUsed"
	ConsumableUsed:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 712, _1080p * 1208, _1080p * 361.5, _1080p * 602.5 )
	self:addElement( ConsumableUsed )
	self.ConsumableUsed = ConsumableUsed
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		RedGlow:RegisterAnimationSequence( "initial", {
			{
				function ()
					return self.RedGlow:SetAlpha( 0, 0 )
				end
			}
		} )
		Spinner:RegisterAnimationSequence( "initial", {
			{
				function ()
					return self.Spinner:SetAlpha( 0, 0 )
				end
			}
		} )
		ConsumableUsed:RegisterAnimationSequence( "initial", {
			{
				function ()
					return self.ConsumableUsed:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.initial = function ()
			RedGlow:AnimateSequence( "initial" )
			Spinner:AnimateSequence( "initial" )
			ConsumableUsed:AnimateSequence( "initial" )
		end
		
		RedGlow:RegisterAnimationSequence( "display", {
			{
				function ()
					return self.RedGlow:SetAlpha( 0, 0 )
				end,
				function ()
					return self.RedGlow:SetAlpha( 0, 1290 )
				end,
				function ()
					return self.RedGlow:SetAlpha( 0.35, 170 )
				end,
				function ()
					return self.RedGlow:SetAlpha( 0.35, 1660 )
				end,
				function ()
					return self.RedGlow:SetAlpha( 0, 50 )
				end
			}
		} )
		Spinner:RegisterAnimationSequence( "display", {
			{
				function ()
					return self.Spinner:SetAlpha( 0, 0 )
				end,
				function ()
					return self.Spinner:SetAlpha( 0, 1290 )
				end,
				function ()
					return self.Spinner:SetAlpha( 0.8, 170 )
				end,
				function ()
					return self.Spinner:SetAlpha( 0.8, 1660 )
				end,
				function ()
					return self.Spinner:SetAlpha( 0, 50 )
				end
			},
			{
				function ()
					return self.Spinner:SetZRotation( 0, 1290 )
				end,
				function ()
					return self.Spinner:SetZRotation( 179, 2460 )
				end
			}
		} )
		ConsumableUsed:RegisterAnimationSequence( "display", {
			{
				function ()
					return self.ConsumableUsed:SetAlpha( 0, 0 )
				end,
				function ()
					return self.ConsumableUsed:SetAlpha( 0, 1000 )
				end,
				function ()
					return self.ConsumableUsed:SetAlpha( 1, 10 )
				end,
				function ()
					return self.ConsumableUsed:SetAlpha( 1, 2280 )
				end,
				function ()
					return self.ConsumableUsed:SetAlpha( 0, 240 )
				end
			},
			{
				function ()
					return self.ConsumableUsed:SetZRotation( 0, 0 )
				end,
				function ()
					return self.ConsumableUsed:SetZRotation( 0, 2970 )
				end,
				function ()
					return self.ConsumableUsed:SetZRotation( -11, 90 )
				end,
				function ()
					return self.ConsumableUsed:SetZRotation( 0, 90 )
				end,
				function ()
					return self.ConsumableUsed:SetZRotation( 100, 460 )
				end
			},
			{
				function ()
					return self.ConsumableUsed:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 752, _1080p * 1248, _1080p * -318.88, _1080p * -77.88, 0 )
				end,
				function ()
					return self.ConsumableUsed:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 752, _1080p * 1248, _1080p * -245.88, _1080p * -4.88, 1009 )
				end,
				function ()
					return self.ConsumableUsed:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 752, _1080p * 1248, _1080p * 365.13, _1080p * 606.13, 200 )
				end,
				function ()
					return self.ConsumableUsed:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 752, _1080p * 1248, _1080p * 359.13, _1080p * 600.13, 69 )
				end,
				function ()
					return self.ConsumableUsed:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 752, _1080p * 1248, _1080p * 365.13, _1080p * 606.13, 50 )
				end,
				function ()
					return self.ConsumableUsed:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 752, _1080p * 1248, _1080p * 359.13, _1080p * 600.13, 79 )
				end,
				function ()
					return self.ConsumableUsed:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 752, _1080p * 1248, _1080p * 365.13, _1080p * 606.13, 60 )
				end,
				function ()
					return self.ConsumableUsed:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 752, _1080p * 1248, _1080p * 365.13, _1080p * 606.13, 1500 )
				end,
				function ()
					return self.ConsumableUsed:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 752, _1080p * 1248, _1080p * 360.13, _1080p * 601.13, 89 )
				end,
				function ()
					return self.ConsumableUsed:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 752, _1080p * 1248, _1080p * 365.13, _1080p * 606.13, 90 )
				end,
				function ()
					return self.ConsumableUsed:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -451, _1080p * 45, _1080p * -25.88, _1080p * 215.13, 329 )
				end
			}
		} )
		self._sequences.display = function ()
			RedGlow:AnimateSequence( "display" )
			Spinner:AnimateSequence( "display" )
			ConsumableUsed:AnimateSequence( "display" )
		end
		
		RedGlow:RegisterAnimationSequence( "displayBackup", {
			{
				function ()
					return self.RedGlow:SetAlpha( 0, 0 )
				end,
				function ()
					return self.RedGlow:SetAlpha( 0, 2260 )
				end,
				function ()
					return self.RedGlow:SetAlpha( 0.35, 170 )
				end,
				function ()
					return self.RedGlow:SetAlpha( 0.35, 1540 )
				end,
				function ()
					return self.RedGlow:SetAlpha( 0, 50 )
				end
			}
		} )
		Spinner:RegisterAnimationSequence( "displayBackup", {
			{
				function ()
					return self.Spinner:SetAlpha( 0, 0 )
				end,
				function ()
					return self.Spinner:SetAlpha( 0, 2260 )
				end,
				function ()
					return self.Spinner:SetAlpha( 0.8, 170 )
				end,
				function ()
					return self.Spinner:SetAlpha( 0.8, 1540 )
				end,
				function ()
					return self.Spinner:SetAlpha( 0, 50 )
				end
			},
			{
				function ()
					return self.Spinner:SetZRotation( 0, 2260 )
				end,
				function ()
					return self.Spinner:SetZRotation( 180, 1990 )
				end
			}
		} )
		ConsumableUsed:RegisterAnimationSequence( "displayBackup", {
			{
				function ()
					return self.ConsumableUsed:SetAlpha( 0, 0 )
				end,
				function ()
					return self.ConsumableUsed:SetAlpha( 0, 1970 )
				end,
				function ()
					return self.ConsumableUsed:SetAlpha( 1, 10 )
				end
			},
			{
				function ()
					return self.ConsumableUsed:SetZRotation( 0, 0 )
				end,
				function ()
					return self.ConsumableUsed:SetZRotation( 0, 4000 )
				end,
				function ()
					return self.ConsumableUsed:SetZRotation( 100, 250 )
				end
			},
			{
				function ()
					return self.ConsumableUsed:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 712, _1080p * 1208, _1080p * -318.88, _1080p * -77.88, 0 )
				end,
				function ()
					return self.ConsumableUsed:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 712, _1080p * 1208, _1080p * -245.88, _1080p * -4.88, 1980 )
				end,
				function ()
					return self.ConsumableUsed:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 712, _1080p * 1208, _1080p * 365.13, _1080p * 606.13, 200 )
				end,
				function ()
					return self.ConsumableUsed:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 712, _1080p * 1208, _1080p * 365.13, _1080p * 606.13, 1819 )
				end,
				function ()
					return self.ConsumableUsed:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -451, _1080p * 45, _1080p * -25.88, _1080p * 215.13, 250 )
				end
			}
		} )
		self._sequences.displayBackup = function ()
			RedGlow:AnimateSequence( "displayBackup" )
			Spinner:AnimateSequence( "displayBackup" )
			ConsumableUsed:AnimateSequence( "displayBackup" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	self:SubscribeToModel( DataSources.inGame.CP.zombies.dpadUpActivated:GetModel( f1_local1 ), function ()
		if DataSources.inGame.CP.zombies.dpadUpActivated:GetValue( f1_local1 ) ~= nil and DataSources.inGame.CP.zombies.dpadUpActivated:GetValue( f1_local1 ) == 5 then
			ACTIONS.AnimateSequence( self, "display" )
		end
	end )
	ACTIONS.AnimateSequence( self, "initial" )
	return self
end

MenuBuilder.registerType( "fateCardUsedContainer", fateCardUsedContainer )
LockTable( _M )
