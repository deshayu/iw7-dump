local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function CPClapboardBase( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 1 * _1080p, 0, 1 * _1080p )
	self.id = "CPClapboardBase"
	self._animationSets = {}
	self._sequences = {}
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local Base = nil
	
	Base = LUI.UIImage.new()
	Base.id = "Base"
	Base:setImage( RegisterMaterial( "clapboard_base" ), 0 )
	Base:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -5, _1080p * 251, _1080p * -50, _1080p * 206 )
	self:addElement( Base )
	self.Base = Base
	
	local Waves = nil
	
	Waves = LUI.UIText.new()
	Waves.id = "Waves"
	Waves:SetRGBFromInt( 16777215, 0 )
	Waves:SetFontSize( 64 * _1080p )
	Waves:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	Waves:SetAlignment( LUI.Alignment.Left )
	Waves:SetOptOutRightToLeftAlignmentFlip( true )
	Waves:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 128, _1080p * 242, _1080p * 30.5, _1080p * 108.5 )
	Waves:SubscribeToModel( DataSources.inGame.CP.zombies.waveNumberSplash:GetModel( f1_local1 ), function ()
		local f2_local0 = DataSources.inGame.CP.zombies.waveNumberSplash:GetValue( f1_local1 )
		if f2_local0 ~= nil then
			Waves:setText( f2_local0, 0 )
		end
	end )
	self:addElement( Waves )
	self.Waves = Waves
	
	local Scene = nil
	
	Scene = LUI.UIText.new()
	Scene.id = "Scene"
	Scene:SetRGBFromInt( 16777215, 0 )
	Scene:setText( ToUpperCase( Engine.Localize( "ZM_CONSUMABLES_SCENE" ) ), 0 )
	Scene:SetFontSize( 32 * _1080p )
	Scene:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	Scene:SetAlignment( LUI.Alignment.Center )
	Scene:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 9, _1080p * 128, _1080p * 53.5, _1080p * 85.5 )
	self:addElement( Scene )
	self.Scene = Scene
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		Base:RegisterAnimationSequence( "cpRaveLogo", {
			{
				function ()
					return self.Base:setImage( RegisterMaterial( "clapboard_base_dlc1" ), 0 )
				end
			}
		} )
		self._sequences.cpRaveLogo = function ()
			Base:AnimateSequence( "cpRaveLogo" )
		end
		
		Base:RegisterAnimationSequence( "cpDiscoLogo", {
			{
				function ()
					return self.Base:setImage( RegisterMaterial( "clapboard_base_dlc2" ), 0 )
				end
			}
		} )
		self._sequences.cpDiscoLogo = function ()
			Base:AnimateSequence( "cpDiscoLogo" )
		end
		
		Base:RegisterAnimationSequence( "cpTownLogo", {
			{
				function ()
					return self.Base:setImage( RegisterMaterial( "cp_town_wave_clapper" ), 0 )
				end
			}
		} )
		self._sequences.cpTownLogo = function ()
			Base:AnimateSequence( "cpTownLogo" )
		end
		
		Base:RegisterAnimationSequence( "cpFinalLogo", {
			{
				function ()
					return self.Base:setImage( RegisterMaterial( "cp_final_wave_clapper" ), 0 )
				end
			}
		} )
		self._sequences.cpFinalLogo = function ()
			Base:AnimateSequence( "cpFinalLogo" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	if CONDITIONS.IsRave( self ) then
		ACTIONS.AnimateSequence( self, "cpRaveLogo" )
	end
	if CONDITIONS.IsDLC2( self ) then
		ACTIONS.AnimateSequence( self, "cpDiscoLogo" )
	end
	if CONDITIONS.IsDLC3( self ) then
		ACTIONS.AnimateSequence( self, "cpTownLogo" )
	end
	if CONDITIONS.IsDLC4( self ) then
		ACTIONS.AnimateSequence( self, "cpFinalLogo" )
	end
	return self
end

MenuBuilder.registerType( "CPClapboardBase", CPClapboardBase )
LockTable( _M )
