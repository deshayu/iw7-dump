local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function ConsumableGranted( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 588 * _1080p, 0, 346 * _1080p )
	self.id = "ConsumableGranted"
	self._animationSets = {}
	self._sequences = {}
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local JaroslavGrants = nil
	
	JaroslavGrants = LUI.UIText.new()
	JaroslavGrants.id = "JaroslavGrants"
	JaroslavGrants:SetAlpha( 0, 0 )
	JaroslavGrants:SetZRotation( 5, 0 )
	JaroslavGrants:setText( Engine.Localize( "ZM_CONSUMABLES_JAROSLAV_GRANTS" ), 0 )
	JaroslavGrants:SetFontSize( 48 * _1080p )
	JaroslavGrants:SetFont( FONTS.GetFont( FONTS.MainExtended.File ) )
	JaroslavGrants:SetAlignment( LUI.Alignment.Center )
	JaroslavGrants:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -17, _1080p * 573, _1080p * 42, _1080p * 90 )
	self:addElement( JaroslavGrants )
	self.JaroslavGrants = JaroslavGrants
	
	local ZomConsumablesWidget = nil
	
	ZomConsumablesWidget = MenuBuilder.BuildRegisteredType( "ZomConsumablesWidget", {
		controllerIndex = f1_local1
	} )
	ZomConsumablesWidget.id = "ZomConsumablesWidget"
	ZomConsumablesWidget:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 1471, _1080p * 169.5, _1080p * 342.5 )
	self:addElement( ZomConsumablesWidget )
	self.ZomConsumablesWidget = ZomConsumablesWidget
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		JaroslavGrants:RegisterAnimationSequence( "initial", {
			{
				function ()
					return self.JaroslavGrants:SetAlpha( 0, 0 )
				end
			}
		} )
		ZomConsumablesWidget:RegisterAnimationSequence( "initial", {
			{
				function ()
					return self.ZomConsumablesWidget:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.initial = function ()
			JaroslavGrants:AnimateSequence( "initial" )
			ZomConsumablesWidget:AnimateSequence( "initial" )
		end
		
		JaroslavGrants:RegisterAnimationSequence( "GrantedDeck", {
			{
				function ()
					return self.JaroslavGrants:SetAlpha( 0, 0 )
				end,
				function ()
					return self.JaroslavGrants:SetAlpha( 1, 290 )
				end,
				function ()
					return self.JaroslavGrants:SetAlpha( 1, 2030 )
				end,
				function ()
					return self.JaroslavGrants:SetAlpha( 0, 130 )
				end
			}
		} )
		ZomConsumablesWidget:RegisterAnimationSequence( "GrantedDeck", {
			{
				function ()
					return self.ZomConsumablesWidget:SetAlpha( 0, 0 )
				end,
				function ()
					return self.ZomConsumablesWidget:SetAlpha( 0, 390 )
				end,
				function ()
					return self.ZomConsumablesWidget:SetAlpha( 1, 300 )
				end,
				function ()
					return self.ZomConsumablesWidget:SetAlpha( 1, 1630 )
				end,
				function ()
					return self.ZomConsumablesWidget:SetAlpha( 0, 130 )
				end
			}
		} )
		self._sequences.GrantedDeck = function ()
			JaroslavGrants:AnimateSequence( "GrantedDeck" )
			ZomConsumablesWidget:AnimateSequence( "GrantedDeck" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	self:SubscribeToModel( DataSources.inGame.CP.zombies.dpadUpActivated:GetModel( f1_local1 ), function ()
		if DataSources.inGame.CP.zombies.dpadUpActivated:GetValue( f1_local1 ) ~= nil and DataSources.inGame.CP.zombies.dpadUpActivated:GetValue( f1_local1 ) == 4 then
			ACTIONS.AnimateSequence( self, "GrantedDeck" )
		end
	end )
	ACTIONS.AnimateSequence( self, "initial" )
	return self
end

MenuBuilder.registerType( "ConsumableGranted", ConsumableGranted )
LockTable( _M )
