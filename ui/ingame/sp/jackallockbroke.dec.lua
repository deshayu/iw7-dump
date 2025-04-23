local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ( f1_arg0, f1_arg1, f1_arg2 )
	f1_arg0:SubscribeToModel( DataSources.inGame.jackal.lockBroke:GetModel( f1_arg1 ), function ( f2_arg0 )
		ACTIONS.AnimateSequence( f1_arg0, "lockBroke" )
	end, true )
end

function JackalLockBroke( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 156 * _1080p, 0, 22 * _1080p )
	self.id = "JackalLockBroke"
	self._animationSets = {}
	self._sequences = {}
	local f3_local1 = controller and controller.controllerIndex
	if not f3_local1 and not Engine.InFrontend() then
		f3_local1 = self:getRootController()
	end
	assert( f3_local1 )
	local f3_local2 = self
	local ReadyBG = nil
	
	ReadyBG = LUI.UIImage.new()
	ReadyBG.id = "ReadyBG"
	ReadyBG:SetRGBFromTable( SWATCHES.jackal.FlareBG_NotReady, 0 )
	self:addElement( ReadyBG )
	self.ReadyBG = ReadyBG
	
	local ReadyText = nil
	
	ReadyText = LUI.UIText.new()
	ReadyText.id = "ReadyText"
	ReadyText:SetRGBFromInt( 2434341, 0 )
	ReadyText:setText( ToUpperCase( Engine.Localize( "JACKAL_LOCKBROKE" ) ), 0 )
	ReadyText:SetFontSize( 22 * _1080p )
	ReadyText:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	ReadyText:SetAlignment( LUI.Alignment.Center )
	ReadyText:SetAnchorsAndPosition( 0, 0, 0.5, 0.5, 0, 0, _1080p * -11, _1080p * 11 )
	self:addElement( ReadyText )
	self.ReadyText = ReadyText
	
	local CornerNodes = nil
	
	CornerNodes = MenuBuilder.BuildRegisteredType( "GenericFrameCornerNodes", {
		controllerIndex = f3_local1
	} )
	CornerNodes.id = "CornerNodes"
	CornerNodes:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * -4, _1080p * 4, _1080p * -4, _1080p * 4 )
	self:addElement( CornerNodes )
	self.CornerNodes = CornerNodes
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		ReadyBG:RegisterAnimationSequence( "lockBroke", {
			{
				function ()
					return self.ReadyBG:SetAlpha( 0.85, 0 )
				end,
				function ()
					return self.ReadyBG:SetAlpha( 0.25, 140 )
				end,
				function ()
					return self.ReadyBG:SetAlpha( 0.85, 140 )
				end,
				function ()
					return self.ReadyBG:SetAlpha( 0.25, 150 )
				end,
				function ()
					return self.ReadyBG:SetAlpha( 0.85, 150 )
				end,
				function ()
					return self.ReadyBG:SetAlpha( 0.25, 140 )
				end,
				function ()
					return self.ReadyBG:SetAlpha( 0.85, 140 )
				end,
				function ()
					return self.ReadyBG:SetAlpha( 0.25, 150 )
				end,
				function ()
					return self.ReadyBG:SetAlpha( 0, 10 )
				end
			}
		} )
		ReadyText:RegisterAnimationSequence( "lockBroke", {
			{
				function ()
					return self.ReadyText:SetAlpha( 1, 0 )
				end,
				function ()
					return self.ReadyText:SetAlpha( 1, 1010 )
				end,
				function ()
					return self.ReadyText:SetAlpha( 0, 10 )
				end
			}
		} )
		CornerNodes:RegisterAnimationSequence( "lockBroke", {
			{
				function ()
					return self.CornerNodes:SetAlpha( 1, 0 )
				end,
				function ()
					return self.CornerNodes:SetAlpha( 1, 1010 )
				end,
				function ()
					return self.CornerNodes:SetAlpha( 0, 10 )
				end
			}
		} )
		self._sequences.lockBroke = function ()
			ReadyBG:AnimateSequence( "lockBroke" )
			ReadyText:AnimateSequence( "lockBroke" )
			CornerNodes:AnimateSequence( "lockBroke" )
		end
		
		ReadyBG:RegisterAnimationSequence( "default", {
			{
				function ()
					return self.ReadyBG:SetAlpha( 0, 0 )
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
			}
		} )
		self._sequences.default = function ()
			ReadyBG:AnimateSequence( "default" )
			ReadyText:AnimateSequence( "default" )
			CornerNodes:AnimateSequence( "default" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	f0_local0( self, f3_local1, controller )
	ACTIONS.AnimateSequence( self, "default" )
	return self
end

MenuBuilder.registerType( "JackalLockBroke", JackalLockBroke )
LockTable( _M )
