local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function PostLoadFunc( f1_arg0, f1_arg1, f1_arg2 )
	if IsLanguageJapanese() or IsLanguageChinese() then
		ACTIONS.SetAnimationSet( f1_arg0, "TallClapboard" )
	end
end

function WaveNumber( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 178 * _1080p, 0, 95 * _1080p )
	self.id = "WaveNumber"
	self._animationSets = {}
	self._sequences = {}
	local f2_local1 = controller and controller.controllerIndex
	if not f2_local1 and not Engine.InFrontend() then
		f2_local1 = self:getRootController()
	end
	assert( f2_local1 )
	local f2_local2 = self
	local clapboard = nil
	
	clapboard = LUI.UIImage.new()
	clapboard.id = "clapboard"
	clapboard:SetScale( 0.44, 0 )
	clapboard:setImage( RegisterMaterial( "clapboard_condensed" ), 0 )
	clapboard:SetUseAA( true )
	clapboard:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -197, _1080p * 20, _1080p * -16.5, _1080p * 111.5 )
	self:addElement( clapboard )
	self.clapboard = clapboard
	
	local clapboardExtention = nil
	
	clapboardExtention = LUI.UIImage.new()
	clapboardExtention.id = "clapboardExtention"
	clapboardExtention:setImage( RegisterMaterial( "clapboard_condensed_extend" ), 0 )
	clapboardExtention:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -178, _1080p * 1, _1080p * 32, _1080p * 130 )
	self:addElement( clapboardExtention )
	self.clapboardExtention = clapboardExtention
	
	local waveNum = nil
	
	waveNum = LUI.UIText.new()
	waveNum.id = "waveNum"
	waveNum:SetRGBFromInt( 16777215, 0 )
	waveNum:SetFontSize( 60 * _1080p )
	waveNum:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	waveNum:SetAlignment( LUI.Alignment.Left )
	waveNum:SetOptOutRightToLeftAlignmentFlip( true )
	waveNum:SetAnchorsAndPosition( 1, 0, 0.5, 0.5, _1080p * -89, 0, _1080p * -14, _1080p * 42 )
	waveNum:SubscribeToModel( DataSources.inGame.CP.zombies.waveNumber:GetModel( f2_local1 ), function ()
		local f3_local0 = DataSources.inGame.CP.zombies.waveNumber:GetValue( f2_local1 )
		if f3_local0 ~= nil then
			waveNum:setText( f3_local0, 0 )
		end
	end )
	self:addElement( waveNum )
	self.waveNum = waveNum
	
	local Scene = nil
	
	Scene = LUI.UIText.new()
	Scene.id = "Scene"
	Scene:SetRGBFromInt( 16777215, 0 )
	Scene:setText( ToUpperCase( Engine.Localize( "ZM_CONSUMABLES_SCENE" ) ), 0 )
	Scene:SetFontSize( 24 * _1080p )
	Scene:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	Scene:SetAlignment( LUI.Alignment.Left )
	Scene:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -172, _1080p * -89, _1080p * 48, _1080p * 72 )
	self:addElement( Scene )
	self.Scene = Scene
	
	self._animationSets.DefaultAnimationSet = function ()
		clapboard:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.clapboard:SetAlpha( 0, 0 )
				end
			}
		} )
		clapboardExtention:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.clapboardExtention:SetAlpha( 0, 0 )
				end
			}
		} )
		waveNum:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.waveNum:SetAlpha( 0, 0 )
				end
			},
			{
				function ()
					return self.waveNum:SetAnchorsAndPosition( 1, 0, 0.5, 0.5, _1080p * -89, 0, _1080p * -14, _1080p * 42, 0 )
				end
			}
		} )
		Scene:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.Scene:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.DefaultSequence = function ()
			clapboard:AnimateSequence( "DefaultSequence" )
			clapboardExtention:AnimateSequence( "DefaultSequence" )
			waveNum:AnimateSequence( "DefaultSequence" )
			Scene:AnimateSequence( "DefaultSequence" )
		end
		
		clapboard:RegisterAnimationSequence( "clapAnim", {
			{
				function ()
					return self.clapboard:SetAlpha( 0, 0 )
				end,
				function ()
					return self.clapboard:SetAlpha( 0, 2210 )
				end,
				function ()
					return self.clapboard:SetAlpha( 1, 150 )
				end
			}
		} )
		clapboardExtention:RegisterAnimationSequence( "clapAnim", {
			{
				function ()
					return self.clapboardExtention:SetAlpha( 0, 0 )
				end
			}
		} )
		waveNum:RegisterAnimationSequence( "clapAnim", {
			{
				function ()
					return self.waveNum:SetAlpha( 0, 0 )
				end,
				function ()
					return self.waveNum:SetAlpha( 0, 2210 )
				end,
				function ()
					return self.waveNum:SetAlpha( 1, 150 )
				end
			}
		} )
		Scene:RegisterAnimationSequence( "clapAnim", {
			{
				function ()
					return self.Scene:SetAlpha( 0, 0 )
				end,
				function ()
					return self.Scene:SetAlpha( 0, 2210 )
				end,
				function ()
					return self.Scene:SetAlpha( 1, 150 )
				end
			}
		} )
		self._sequences.clapAnim = function ()
			clapboard:AnimateSequence( "clapAnim" )
			clapboardExtention:AnimateSequence( "clapAnim" )
			waveNum:AnimateSequence( "clapAnim" )
			Scene:AnimateSequence( "clapAnim" )
		end
		
	end
	
	self._animationSets.TallClapboard = function ()
		clapboard:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.clapboard:SetAlpha( 0, 0 )
				end
			}
		} )
		clapboardExtention:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.clapboardExtention:SetAlpha( 0, 0 )
				end
			}
		} )
		waveNum:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.waveNum:SetAlpha( 0, 0 )
				end
			},
			{
				function ()
					return self.waveNum:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -90.5, 0, _1080p * 45, _1080p * 105, 0 )
				end
			}
		} )
		Scene:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.Scene:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.DefaultSequence = function ()
			clapboard:AnimateSequence( "DefaultSequence" )
			clapboardExtention:AnimateSequence( "DefaultSequence" )
			waveNum:AnimateSequence( "DefaultSequence" )
			Scene:AnimateSequence( "DefaultSequence" )
		end
		
		clapboard:RegisterAnimationSequence( "clapAnim", {
			{
				function ()
					return self.clapboard:SetAlpha( 0, 0 )
				end,
				function ()
					return self.clapboard:SetAlpha( 0, 2200 )
				end,
				function ()
					return self.clapboard:SetAlpha( 1, 150 )
				end
			}
		} )
		clapboardExtention:RegisterAnimationSequence( "clapAnim", {
			{
				function ()
					return self.clapboardExtention:SetAlpha( 0, 0 )
				end,
				function ()
					return self.clapboardExtention:SetAlpha( 0, 2200 )
				end,
				function ()
					return self.clapboardExtention:SetAlpha( 1, 150 )
				end
			}
		} )
		waveNum:RegisterAnimationSequence( "clapAnim", {
			{
				function ()
					return self.waveNum:SetAlpha( 0, 0 )
				end,
				function ()
					return self.waveNum:SetAlpha( 0, 2200 )
				end,
				function ()
					return self.waveNum:SetAlpha( 1, 150 )
				end
			},
			{
				function ()
					return self.waveNum:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -90.5, 0, _1080p * 45, _1080p * 105, 0 )
				end
			}
		} )
		Scene:RegisterAnimationSequence( "clapAnim", {
			{
				function ()
					return self.Scene:SetAlpha( 0, 0 )
				end,
				function ()
					return self.Scene:SetAlpha( 0, 2200 )
				end,
				function ()
					return self.Scene:SetAlpha( 1, 150 )
				end
			}
		} )
		self._sequences.clapAnim = function ()
			clapboard:AnimateSequence( "clapAnim" )
			clapboardExtention:AnimateSequence( "clapAnim" )
			waveNum:AnimateSequence( "clapAnim" )
			Scene:AnimateSequence( "clapAnim" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	waveNum:SubscribeToModel( DataSources.inGame.CP.zombies.waveNumber:GetModel( f2_local1 ), function ()
		if DataSources.inGame.CP.zombies.waveNumber:GetValue( f2_local1 ) ~= nil and DataSources.inGame.CP.zombies.waveNumber:GetValue( f2_local1 ) > 0 then
			ACTIONS.AnimateSequence( self, "clapAnim" )
		end
	end )
	PostLoadFunc( self, f2_local1, controller )
	ACTIONS.AnimateSequence( self, "DefaultSequence" )
	return self
end

MenuBuilder.registerType( "WaveNumber", WaveNumber )
LockTable( _M )
