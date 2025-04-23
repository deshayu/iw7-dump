local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function TransponderOutOfRange( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 500 * _1080p, 0, 36 * _1080p )
	self.id = "TransponderOutOfRange"
	self._animationSets = {}
	self._sequences = {}
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local OutOfRange = nil
	
	OutOfRange = LUI.UIText.new()
	OutOfRange.id = "OutOfRange"
	OutOfRange:SetRGBFromInt( 12845065, 0 )
	OutOfRange:setText( Engine.Localize( "LUA_MENU_MP_TRANSPONDER_OUTOFRANGE" ), 0 )
	OutOfRange:SetFontSize( 36 * _1080p )
	OutOfRange:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	OutOfRange:SetAlignment( LUI.Alignment.Center )
	OutOfRange:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 120.5, _1080p * 379.5, 0, _1080p * 36 )
	self:addElement( OutOfRange )
	self.OutOfRange = OutOfRange
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		OutOfRange:RegisterAnimationSequence( "Pulsate", {
			{
				function ()
					return self.OutOfRange:SetAlpha( 0, 0 )
				end,
				function ()
					return self.OutOfRange:SetAlpha( 1, 250 )
				end,
				function ()
					return self.OutOfRange:SetAlpha( 0, 250 )
				end,
				function ()
					return self.OutOfRange:SetAlpha( 1, 250 )
				end,
				function ()
					return self.OutOfRange:SetAlpha( 0, 250 )
				end,
				function ()
					return self.OutOfRange:SetAlpha( 1, 250 )
				end,
				function ()
					return self.OutOfRange:SetAlpha( 0, 250 )
				end
			}
		} )
		self._sequences.Pulsate = function ()
			OutOfRange:AnimateSequence( "Pulsate" )
		end
		
		OutOfRange:RegisterAnimationSequence( "Hide", {
			{
				function ()
					return self.OutOfRange:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.Hide = function ()
			OutOfRange:AnimateSequence( "Hide" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	self:SubscribeToModel( DataSources.inGame.player.suits.TransponderOutOfRange:GetModel( f1_local1 ), function ()
		if DataSources.inGame.player.suits.TransponderOutOfRange:GetValue( f1_local1 ) ~= nil and DataSources.inGame.player.suits.TransponderOutOfRange:GetValue( f1_local1 ) == 1 then
			ACTIONS.AnimateSequence( self, "Pulsate" )
		end
	end )
	self:addEventHandler( "menu_create", function ( f15_arg0, f15_arg1 )
		local f15_local0 = f15_arg1.controller or f1_local1
		ACTIONS.AnimateSequence( self, "Hide" )
	end )
	return self
end

MenuBuilder.registerType( "TransponderOutOfRange", TransponderOutOfRange )
LockTable( _M )
