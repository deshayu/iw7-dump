local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ( f1_arg0, f1_arg1, f1_arg2 )
	if IsLanguageJapanese() or IsLanguageChinese() or IsLanguageArabic() then
		f1_arg0.name:SetTop( _1080p * 10.79 )
		f1_arg0.name:SetBottom( _1080p * 27.79 )
	end
end

function FateCardOnDeck( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 155 * _1080p, 0, 203 * _1080p )
	self.id = "FateCardOnDeck"
	self._animationSets = {}
	self._sequences = {}
	local f2_local1 = controller and controller.controllerIndex
	if not f2_local1 and not Engine.InFrontend() then
		f2_local1 = self:getRootController()
	end
	assert( f2_local1 )
	local f2_local2 = self
	local cardBack = nil
	
	cardBack = LUI.UIImage.new()
	cardBack.id = "cardBack"
	cardBack:SetScale( -0.41, 0 )
	cardBack:SetUseAA( true )
	cardBack:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -51.5, _1080p * 204.5, _1080p * -103.71, _1080p * 411.29 )
	cardBack:SubscribeToModel( DataSources.inGame.CP.zombies.consumableDeckSelectBacking:GetModel( f2_local1 ), function ()
		local f3_local0 = DataSources.inGame.CP.zombies.consumableDeckSelectBacking:GetValue( f2_local1 )
		if f3_local0 ~= nil then
			cardBack:setImage( RegisterMaterial( f3_local0 ), 0 )
		end
	end )
	self:addElement( cardBack )
	self.cardBack = cardBack
	
	local name = nil
	
	name = LUI.UIText.new()
	name.id = "name"
	name:SetFontSize( 20 * _1080p )
	name:SetFont( FONTS.GetFont( FONTS.ZmClean.File ) )
	name:SetAlignment( LUI.Alignment.Center )
	name:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 15.5, _1080p * 146.5, _1080p * 10.79, _1080p * 30.79 )
	name:SubscribeToModel( DataSources.inGame.CP.zombies.consumableDeckSelectName:GetModel( f2_local1 ), function ()
		local f4_local0 = DataSources.inGame.CP.zombies.consumableDeckSelectName:GetValue( f2_local1 )
		if f4_local0 ~= nil then
			name:setText( f4_local0, 0 )
		end
	end )
	self:addElement( name )
	self.name = name
	
	local icon = nil
	
	icon = LUI.UIImage.new()
	icon.id = "icon"
	icon:SetScale( -0.23, 0 )
	icon:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 13.5, _1080p * 141.5, _1080p * 32.5, _1080p * 160.5 )
	icon:SubscribeToModel( DataSources.inGame.CP.zombies.consumableDeckSelectIcon:GetModel( f2_local1 ), function ()
		local f5_local0 = DataSources.inGame.CP.zombies.consumableDeckSelectIcon:GetValue( f2_local1 )
		if f5_local0 ~= nil then
			icon:setImage( RegisterMaterial( f5_local0 ), 0 )
		end
	end )
	self:addElement( icon )
	self.icon = icon
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		self._sequences.Chomp = function ()
			
		end
		
		name:RegisterAnimationSequence( "meterFull", {
			{
				function ()
					return self.name:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 39.7, _1080p * 170.7, _1080p * -35.45, _1080p * -15.45, 0 )
				end
			}
		} )
		icon:RegisterAnimationSequence( "meterFull", {
			{
				function ()
					return self.icon:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 37.7, _1080p * 165.7, _1080p * -22.45, _1080p * 105.55, 0 )
				end
			}
		} )
		self._sequences.meterFull = function ()
			name:AnimateSequence( "meterFull" )
			icon:AnimateSequence( "meterFull" )
		end
		
		self._sequences.cardCycle = function ()
			
		end
		
		self._sequences.cardCycleHide = function ()
			
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	f0_local0( self, f2_local1, controller )
	return self
end

MenuBuilder.registerType( "FateCardOnDeck", FateCardOnDeck )
LockTable( _M )
