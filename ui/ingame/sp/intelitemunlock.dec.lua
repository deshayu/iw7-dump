local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function IntelItemUnlock( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 275 * _1080p, 0, 80 * _1080p )
	self.id = "IntelItemUnlock"
	self._animationSets = {}
	self._sequences = {}
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local UnlockImage = nil
	
	UnlockImage = LUI.UIImage.new()
	UnlockImage.id = "UnlockImage"
	UnlockImage:SetAnchorsAndPosition( 0, 1, 0.5, 0.5, _1080p * 9, _1080p * 61, _1080p * -24, _1080p * 24 )
	self:addElement( UnlockImage )
	self.UnlockImage = UnlockImage
	
	local UnlockDesc = nil
	
	UnlockDesc = LUI.UIStyledText.new()
	UnlockDesc.id = "UnlockDesc"
	UnlockDesc:SetAlpha( 0.7, 0 )
	UnlockDesc:setText( "Item Unlocked", 0 )
	UnlockDesc:SetFontSize( 18 * _1080p )
	UnlockDesc:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	UnlockDesc:SetAlignment( LUI.Alignment.Left )
	UnlockDesc:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 73, _1080p * 270, _1080p * 22, _1080p * 40 )
	self:addElement( UnlockDesc )
	self.UnlockDesc = UnlockDesc
	
	local CapLeft = nil
	
	CapLeft = LUI.UIImage.new()
	CapLeft.id = "CapLeft"
	CapLeft:setImage( RegisterMaterial( "ui_default_white" ), 0 )
	CapLeft:SetAnchorsAndPosition( 0, 1, 0, 0, 0, _1080p * 3, 0, 0 )
	self:addElement( CapLeft )
	self.CapLeft = CapLeft
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		UnlockImage:RegisterAnimationSequence( "ItemUnlockRotate", {
			{
				function ()
					return self.UnlockImage:SetAlpha( 1, 0 )
				end,
				function ()
					return self.UnlockImage:SetAlpha( 0, 60 )
				end,
				function ()
					return self.UnlockImage:SetAlpha( 0, 410 )
				end,
				function ()
					return self.UnlockImage:SetAlpha( 1, 220 )
				end
			}
		} )
		UnlockDesc:RegisterAnimationSequence( "ItemUnlockRotate", {
			{
				function ()
					return self.UnlockDesc:SetAlpha( 0.7, 0 )
				end,
				function ()
					return self.UnlockDesc:SetAlpha( 0, 60 )
				end,
				function ()
					return self.UnlockDesc:SetAlpha( 0, 410 )
				end,
				function ()
					return self.UnlockDesc:SetAlpha( 0.7, 220 )
				end
			}
		} )
		self._sequences.ItemUnlockRotate = function ()
			UnlockImage:AnimateSequence( "ItemUnlockRotate" )
			UnlockDesc:AnimateSequence( "ItemUnlockRotate" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	return self
end

MenuBuilder.registerType( "IntelItemUnlock", IntelItemUnlock )
LockTable( _M )
