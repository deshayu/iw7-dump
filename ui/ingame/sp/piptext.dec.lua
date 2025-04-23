local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function PipText( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 235 * _1080p, 0, 22 * _1080p )
	self.id = "PipText"
	self._animationSets = {}
	self._sequences = {}
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local PipText = nil
	
	PipText = LUI.UIStyledText.new()
	PipText.id = "PipText"
	PipText:SetAlpha( 0, 0 )
	PipText:SetFontSize( 22 * _1080p )
	PipText:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	PipText:SetAlignment( LUI.Alignment.Left )
	PipText:SetDecodeUseSystemTime( false )
	PipText:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 235, 0, _1080p * 22 )
	PipText:BindColorToModel( DataSources.inGame.SP.pipMessageColor:GetModel( f1_local1 ) )
	PipText:SubscribeToModel( DataSources.inGame.SP.pipMessageTextTop:GetModel( f1_local1 ), function ()
		local f2_local0 = DataSources.inGame.SP.pipMessageTextTop:GetValue( f1_local1 )
		if f2_local0 ~= nil then
			PipText:setText( ToUpperCase( LocalizeString( f2_local0 ) ), 0 )
		end
	end )
	self:addElement( PipText )
	self.PipText = PipText
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		PipText:RegisterAnimationSequence( "TextBlink", {
			{
				function ()
					return self.PipText:SetAlpha( 1, 0 )
				end,
				function ()
					return self.PipText:SetAlpha( 1, 90 )
				end,
				function ()
					return self.PipText:SetAlpha( 0, 10 )
				end,
				function ()
					return self.PipText:SetAlpha( 0, 90 )
				end,
				function ()
					return self.PipText:SetAlpha( 1, 10 )
				end,
				function ()
					return self.PipText:SetAlpha( 1, 90 )
				end,
				function ()
					return self.PipText:SetAlpha( 0, 10 )
				end,
				function ()
					return self.PipText:SetAlpha( 0, 90 )
				end,
				function ()
					return self.PipText:SetAlpha( 1, 10 )
				end,
				function ()
					return self.PipText:SetAlpha( 1, 90 )
				end,
				function ()
					return self.PipText:SetAlpha( 0, 10 )
				end,
				function ()
					return self.PipText:SetAlpha( 0, 90 )
				end,
				function ()
					return self.PipText:SetAlpha( 1, 10 )
				end,
				function ()
					return self.PipText:SetAlpha( 1, 90 )
				end,
				function ()
					return self.PipText:SetAlpha( 0, 10 )
				end,
				function ()
					return self.PipText:SetAlpha( 0, 90 )
				end,
				function ()
					return self.PipText:SetAlpha( 1, 10 )
				end
			}
		} )
		self._sequences.TextBlink = function ()
			PipText:AnimateSequence( "TextBlink" )
		end
		
		PipText:RegisterAnimationSequence( "TextHidden", {
			{
				function ()
					return self.PipText:SetAlpha( 1, 0 )
				end,
				function ()
					return self.PipText:SetAlpha( 0, 200 )
				end
			}
		} )
		self._sequences.TextHidden = function ()
			PipText:AnimateSequence( "TextHidden" )
		end
		
		PipText:RegisterAnimationSequence( "TextShown", {
			{
				function ()
					return self.PipText:SetAlpha( 0, 200 )
				end,
				function ()
					return self.PipText:SetAlpha( 1, 200 )
				end
			}
		} )
		self._sequences.TextShown = function ()
			PipText:AnimateSequence( "TextShown" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	self:SubscribeToModel( DataSources.inGame.SP.pipMessageType:GetModel( f1_local1 ), function ()
		if DataSources.inGame.SP.pipMessageType:GetValue( f1_local1 ) ~= nil and DataSources.inGame.SP.pipMessageType:GetValue( f1_local1 ) == 3 then
			ACTIONS.AnimateSequence( self, "TextBlink" )
		end
	end )
	return self
end

MenuBuilder.registerType( "PipText", PipText )
LockTable( _M )
