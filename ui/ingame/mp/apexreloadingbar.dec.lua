local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ( f1_arg0, f1_arg1, f1_arg2 )
	local f1_local0 = f1_arg0.Label
	f1_local0:SetShadowMinDistance( -0.2, 0 )
	f1_local0:SetShadowMaxDistance( 0.2, 0 )
	f1_local0:SetShadowRGBFromInt( 0, 0 )
	f1_local0:SetShadowUOffset( -0 )
	f1_local0:SetShadowVOffset( -0 )
end

function ApexReloadingBar( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 160 * _1080p, 0, 5 * _1080p )
	self.id = "ApexReloadingBar"
	self._animationSets = {}
	self._sequences = {}
	local f2_local1 = controller and controller.controllerIndex
	if not f2_local1 and not Engine.InFrontend() then
		f2_local1 = self:getRootController()
	end
	assert( f2_local1 )
	local f2_local2 = self
	local BG = nil
	
	BG = LUI.UIImage.new()
	BG.id = "BG"
	self:addElement( BG )
	self.BG = BG
	
	local FillBar = nil
	
	FillBar = LUI.UIImage.new()
	FillBar.id = "FillBar"
	FillBar:SetRGBFromTable( SWATCHES.HUD.warning, 0 )
	FillBar:SetAnchorsAndPosition( 0, 1, 0, 0, 0, _1080p * 7.05, 0, 0 )
	self:addElement( FillBar )
	self.FillBar = FillBar
	
	local Label = nil
	
	Label = LUI.UIStyledText.new()
	Label.id = "Label"
	Label:setText( ToUpperCase( Engine.Localize( "KILLSTREAKS_RELOADING" ) ), 0 )
	Label:SetFontSize( 26 * _1080p )
	Label:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	Label:SetAlignment( LUI.Alignment.Center )
	Label:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -100, _1080p * 100, _1080p * 5, _1080p * 31 )
	self:addElement( Label )
	self.Label = Label
	
	self._animationSets.DefaultAnimationSet = function ()
		BG:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.BG:SetAlpha( 0, 0 )
				end
			}
		} )
		FillBar:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.FillBar:SetAlpha( 0, 0 )
				end
			}
		} )
		Label:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.Label:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.DefaultSequence = function ()
			BG:AnimateSequence( "DefaultSequence" )
			FillBar:AnimateSequence( "DefaultSequence" )
			Label:AnimateSequence( "DefaultSequence" )
		end
		
		BG:RegisterAnimationSequence( "Reload", {
			{
				function ()
					return self.BG:SetAlpha( 1, 0 )
				end,
				function ()
					return self.BG:SetAlpha( 1, 3950 )
				end,
				function ()
					return self.BG:SetAlpha( 0, 50 )
				end
			}
		} )
		FillBar:RegisterAnimationSequence( "Reload", {
			{
				function ()
					return self.FillBar:SetAlpha( 1, 0 )
				end,
				function ()
					return self.FillBar:SetAlpha( 1, 3950 )
				end,
				function ()
					return self.FillBar:SetAlpha( 0, 50 )
				end
			},
			{
				function ()
					return self.FillBar:SetAnchorsAndPosition( 0, 1, 0, 0, 0, 0, 0, 0, 0 )
				end,
				function ()
					return self.FillBar:SetAnchorsAndPosition( 0, 1, 0, 0, 0, _1080p * 160, 0, 0, 3950 )
				end
			}
		} )
		Label:RegisterAnimationSequence( "Reload", {
			{
				function ()
					return self.Label:SetAlpha( 1, 0 )
				end,
				function ()
					return self.Label:SetAlpha( 1, 3950 )
				end,
				function ()
					return self.Label:SetAlpha( 0, 50 )
				end
			}
		} )
		self._sequences.Reload = function ()
			BG:AnimateSequence( "Reload" )
			FillBar:AnimateSequence( "Reload" )
			Label:AnimateSequence( "Reload" )
		end
		
		BG:RegisterAnimationSequence( "Reload2", {
			{
				function ()
					return self.BG:SetAlpha( 1, 0 )
				end,
				function ()
					return self.BG:SetAlpha( 1, 4950 )
				end,
				function ()
					return self.BG:SetAlpha( 0, 50 )
				end
			}
		} )
		FillBar:RegisterAnimationSequence( "Reload2", {
			{
				function ()
					return self.FillBar:SetAlpha( 1, 0 )
				end,
				function ()
					return self.FillBar:SetAlpha( 1, 4950 )
				end,
				function ()
					return self.FillBar:SetAlpha( 0, 50 )
				end
			},
			{
				function ()
					return self.FillBar:SetAnchorsAndPosition( 0, 1, 0, 0, 0, 0, 0, 0, 0 )
				end,
				function ()
					return self.FillBar:SetAnchorsAndPosition( 0, 1, 0, 0, 0, _1080p * 160, 0, 0, 4949 )
				end
			}
		} )
		Label:RegisterAnimationSequence( "Reload2", {
			{
				function ()
					return self.Label:SetAlpha( 1, 0 )
				end,
				function ()
					return self.Label:SetAlpha( 1, 4950 )
				end,
				function ()
					return self.Label:SetAlpha( 0, 50 )
				end
			}
		} )
		self._sequences.Reload2 = function ()
			BG:AnimateSequence( "Reload2" )
			FillBar:AnimateSequence( "Reload2" )
			Label:AnimateSequence( "Reload2" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	self:SubscribeToModel( DataSources.inGame.MP.scorestreakHuds.miniJackalReload:GetModel( f2_local1 ), function ()
		if DataSources.inGame.MP.scorestreakHuds.miniJackalReload:GetValue( f2_local1 ) ~= nil and DataSources.inGame.MP.scorestreakHuds.miniJackalReload:GetValue( f2_local1 ) == true then
			ACTIONS.AnimateSequence( self, "Reload" )
		end
	end )
	self:SubscribeToModel( DataSources.inGame.MP.scorestreakHuds.miniJackalReloadLong:GetModel( f2_local1 ), function ()
		if DataSources.inGame.MP.scorestreakHuds.miniJackalReloadLong:GetValue( f2_local1 ) ~= nil and DataSources.inGame.MP.scorestreakHuds.miniJackalReloadLong:GetValue( f2_local1 ) == true then
			ACTIONS.AnimateSequence( self, "Reload2" )
		end
	end )
	f0_local0( self, f2_local1, controller )
	ACTIONS.AnimateSequence( self, "DefaultSequence" )
	return self
end

MenuBuilder.registerType( "ApexReloadingBar", ApexReloadingBar )
LockTable( _M )
