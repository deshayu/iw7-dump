local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ( f1_arg0, f1_arg1, f1_arg2 )
	local f1_local0 = assert
	local f1_local1 = f1_arg0.FlaresBG
	if f1_local1 then
		f1_local1 = f1_arg0.ReadyBG and f1_arg0.CornerNodes
	end
	f1_local0( f1_local1, "WARNING: Jackal flare items are missing..." )
	f1_arg0.FlaresBG:SetBlendMode( BLEND_MODE.addWithAlpha )
	f1_arg0.ReadyBG:SetBlendMode( BLEND_MODE.addWithAlpha )
	f1_arg0.CornerNodes:SetBlendMode( BLEND_MODE.addWithAlpha )
end

function JackalFlares( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 200 * _1080p, 0, 20 * _1080p )
	self.id = "JackalFlares"
	self._animationSets = {}
	self._sequences = {}
	local f2_local1 = controller and controller.controllerIndex
	if not f2_local1 and not Engine.InFrontend() then
		f2_local1 = self:getRootController()
	end
	assert( f2_local1 )
	local f2_local2 = self
	local FlaresBG = nil
	
	FlaresBG = LUI.UIImage.new()
	FlaresBG.id = "FlaresBG"
	FlaresBG:SetRGBFromTable( SWATCHES.jackal.FlareBG_Ready, 0 )
	FlaresBG:SetAlpha( 0.5, 0 )
	FlaresBG:SetAnchorsAndPosition( 0, 1, 0, 0, 0, _1080p * 98, 0, 0 )
	self:addElement( FlaresBG )
	self.FlaresBG = FlaresBG
	
	local ReadyBG = nil
	
	ReadyBG = LUI.UIImage.new()
	ReadyBG.id = "ReadyBG"
	ReadyBG:SetRGBFromTable( SWATCHES.jackal.FlareBG_Ready, 0 )
	ReadyBG:SetAlpha( 0.5, 0 )
	ReadyBG:SetAnchorsAndPosition( 1, 0, 0, 0, _1080p * -98, 0, 0, 0 )
	self:addElement( ReadyBG )
	self.ReadyBG = ReadyBG
	
	local FlaresText = nil
	
	FlaresText = LUI.UIText.new()
	FlaresText.id = "FlaresText"
	FlaresText:SetRGBFromTable( SWATCHES.jackal.FlareText_Ready, 0 )
	FlaresText:setText( ToUpperCase( Engine.Localize( "JACKAL_FLARES" ) ), 0 )
	FlaresText:SetFontSize( 20 * _1080p )
	FlaresText:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	FlaresText:SetAlignment( LUI.Alignment.Center )
	FlaresText:SetAnchorsAndPosition( 0, 1, 0.5, 0.5, 0, _1080p * 98, _1080p * -10, _1080p * 10 )
	self:addElement( FlaresText )
	self.FlaresText = FlaresText
	
	local ReadyText = nil
	
	ReadyText = LUI.UIText.new()
	ReadyText.id = "ReadyText"
	ReadyText:SetRGBFromTable( SWATCHES.jackal.FlareText_Ready, 0 )
	ReadyText:setText( ToUpperCase( Engine.Localize( "JACKAL_READY" ) ), 0 )
	ReadyText:SetFontSize( 20 * _1080p )
	ReadyText:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	ReadyText:SetAlignment( LUI.Alignment.Center )
	ReadyText:SetAnchorsAndPosition( 1, 0, 0.5, 0.5, _1080p * -98, 0, _1080p * -10, _1080p * 10 )
	self:addElement( ReadyText )
	self.ReadyText = ReadyText
	
	local CornerNodes = nil
	
	CornerNodes = MenuBuilder.BuildRegisteredType( "GenericFrameCornerNodes", {
		controllerIndex = f2_local1
	} )
	CornerNodes.id = "CornerNodes"
	CornerNodes:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * -4, _1080p * 4, _1080p * -4, _1080p * 4 )
	self:addElement( CornerNodes )
	self.CornerNodes = CornerNodes
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		FlaresBG:RegisterAnimationSequence( "recharging", {
			{
				function ()
					return self.FlaresBG:SetAlpha( 0.5, 0 )
				end
			}
		} )
		ReadyBG:RegisterAnimationSequence( "recharging", {
			{
				function ()
					return self.ReadyBG:SetRGBFromTable( SWATCHES.jackal.FlareBG_NotReady, 0 )
				end
			},
			{
				function ()
					return self.ReadyBG:SetAlpha( 0.5, 0 )
				end,
				function ()
					return self.ReadyBG:SetAlpha( 0.75, 50 )
				end,
				function ()
					return self.ReadyBG:SetAlpha( 0.5, 50 )
				end
			}
		} )
		FlaresText:RegisterAnimationSequence( "recharging", {
			{
				function ()
					return self.FlaresText:SetAlpha( 1, 0 )
				end
			}
		} )
		ReadyText:RegisterAnimationSequence( "recharging", {
			{
				function ()
					return self.ReadyText:SetRGBFromTable( SWATCHES.jackal.FlareText_NotReady, 0 )
				end
			},
			{
				function ()
					return self.ReadyText:SetAlpha( 1, 0 )
				end
			}
		} )
		CornerNodes:RegisterAnimationSequence( "recharging", {
			{
				function ()
					return self.CornerNodes:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.CornerNodes:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * -4, _1080p * 4, _1080p * -4, _1080p * 4, 0 )
				end
			}
		} )
		self._sequences.recharging = function ()
			FlaresBG:AnimateLoop( "recharging" )
			ReadyBG:AnimateLoop( "recharging" )
			FlaresText:AnimateLoop( "recharging" )
			ReadyText:AnimateLoop( "recharging" )
			CornerNodes:AnimateLoop( "recharging" )
		end
		
		FlaresBG:RegisterAnimationSequence( "ready", {
			{
				function ()
					return self.FlaresBG:SetAlpha( 0.5, 0 )
				end,
				function ()
					return self.FlaresBG:SetAlpha( 0.5, 1000 )
				end,
				function ()
					return self.FlaresBG:SetAlpha( 0, 100 )
				end
			}
		} )
		ReadyBG:RegisterAnimationSequence( "ready", {
			{
				function ()
					return self.ReadyBG:SetAlpha( 1, 0 )
				end,
				function ()
					return self.ReadyBG:SetAlpha( 0.5, 50 )
				end,
				function ()
					return self.ReadyBG:SetAlpha( 1, 50 )
				end,
				function ()
					return self.ReadyBG:SetAlpha( 0.5, 50 )
				end,
				function ()
					return self.ReadyBG:SetAlpha( 1, 50 )
				end,
				function ()
					return self.ReadyBG:SetAlpha( 0.5, 50 )
				end,
				function ()
					return self.ReadyBG:SetAlpha( 1, 50 )
				end,
				function ()
					return self.ReadyBG:SetAlpha( 0.5, 50 )
				end,
				function ()
					return self.ReadyBG:SetAlpha( 1, 50 )
				end,
				function ()
					return self.ReadyBG:SetAlpha( 0.5, 50 )
				end,
				function ()
					return self.ReadyBG:SetAlpha( 0.5, 550 )
				end,
				function ()
					return self.ReadyBG:SetAlpha( 0, 100 )
				end
			},
			{
				function ()
					return self.ReadyBG:SetRGBFromTable( SWATCHES.jackal.FlareBG_Ready, 0 )
				end
			}
		} )
		FlaresText:RegisterAnimationSequence( "ready", {
			{
				function ()
					return self.FlaresText:SetAlpha( 1, 0 )
				end,
				function ()
					return self.FlaresText:SetAlpha( 1, 1000 )
				end,
				function ()
					return self.FlaresText:SetAlpha( 0, 100 )
				end
			}
		} )
		ReadyText:RegisterAnimationSequence( "ready", {
			{
				function ()
					return self.ReadyText:SetRGBFromTable( SWATCHES.jackal.FlareText_Ready, 0 )
				end
			},
			{
				function ()
					return self.ReadyText:SetAlpha( 1, 0 )
				end,
				function ()
					return self.ReadyText:SetAlpha( 1, 1000 )
				end,
				function ()
					return self.ReadyText:SetAlpha( 0, 100 )
				end
			}
		} )
		CornerNodes:RegisterAnimationSequence( "ready", {
			{
				function ()
					return self.CornerNodes:SetAlpha( 1, 0 )
				end,
				function ()
					return self.CornerNodes:SetAlpha( 1, 1000 )
				end,
				function ()
					return self.CornerNodes:SetAlpha( 0, 300, LUI.EASING.inBack )
				end
			},
			{
				function ()
					return self.CornerNodes:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * -4, _1080p * 4, _1080p * -4, _1080p * 4, 0 )
				end,
				function ()
					return self.CornerNodes:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * -4, _1080p * 4, _1080p * -4, _1080p * 4, 1000 )
				end,
				function ()
					return self.CornerNodes:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * 98, _1080p * -98, _1080p * 8, _1080p * -8, 299, LUI.EASING.inBack )
				end
			}
		} )
		self._sequences.ready = function ()
			FlaresBG:AnimateSequence( "ready" )
			ReadyBG:AnimateSequence( "ready" )
			FlaresText:AnimateSequence( "ready" )
			ReadyText:AnimateSequence( "ready" )
			CornerNodes:AnimateSequence( "ready" )
		end
		
		FlaresBG:RegisterAnimationSequence( "default", {
			{
				function ()
					return self.FlaresBG:SetAlpha( 0, 0 )
				end
			}
		} )
		ReadyBG:RegisterAnimationSequence( "default", {
			{
				function ()
					return self.ReadyBG:SetAlpha( 0, 0 )
				end
			}
		} )
		FlaresText:RegisterAnimationSequence( "default", {
			{
				function ()
					return self.FlaresText:SetAlpha( 0, 0 )
				end
			}
		} )
		ReadyText:RegisterAnimationSequence( "default", {
			{
				function ()
					return self.ReadyText:SetAlpha( 0, 0 )
				end
			}
		} )
		CornerNodes:RegisterAnimationSequence( "default", {
			{
				function ()
					return self.CornerNodes:SetAlpha( 0, 0 )
				end
			},
			{
				function ()
					return self.CornerNodes:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * -4, _1080p * 4, _1080p * -4, _1080p * 4, 0 )
				end
			}
		} )
		self._sequences.default = function ()
			FlaresBG:AnimateSequence( "default" )
			ReadyBG:AnimateSequence( "default" )
			FlaresText:AnimateSequence( "default" )
			ReadyText:AnimateSequence( "default" )
			CornerNodes:AnimateSequence( "default" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	self:SubscribeToModel( DataSources.inGame.jackal.flaresRecharging:GetModel( f2_local1 ), function ()
		if DataSources.inGame.jackal.flaresRecharging:GetValue( f2_local1 ) ~= nil and DataSources.inGame.jackal.flaresRecharging:GetValue( f2_local1 ) == true then
			ACTIONS.AnimateSequence( self, "recharging" )
		end
	end )
	self:SubscribeToModel( DataSources.inGame.jackal.flaresReady:GetModel( f2_local1 ), function ()
		if DataSources.inGame.jackal.flaresReady:GetValue( f2_local1 ) ~= nil and DataSources.inGame.jackal.flaresReady:GetValue( f2_local1 ) == true then
			ACTIONS.AnimateSequence( self, "ready" )
		end
	end )
	f0_local0( self, f2_local1, controller )
	ACTIONS.AnimateSequence( self, "default" )
	return self
end

MenuBuilder.registerType( "JackalFlares", JackalFlares )
LockTable( _M )
