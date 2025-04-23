local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ( f1_arg0, f1_arg1, f1_arg2 )
	f1_arg0.MenuTitle.MPBackerImage:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -19, _1080p * 800, _1080p * -1.5, _1080p * 126.5 )
end

function CodCasterQuickSettingsInGame( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 600 * _1080p, 0, 1080 * _1080p )
	self.id = "CodCasterQuickSettingsInGame"
	self._animationSets = {}
	self._sequences = {}
	local f2_local1 = controller and controller.controllerIndex
	if not f2_local1 and not Engine.InFrontend() then
		f2_local1 = self:getRootController()
	end
	assert( f2_local1 )
	local f2_local2 = self
	local SlidingBackground = nil
	
	SlidingBackground = LUI.UIImage.new()
	SlidingBackground.id = "SlidingBackground"
	SlidingBackground:SetRGBFromInt( 0, 0 )
	SlidingBackground:SetAlpha( 0.75, 0 )
	SlidingBackground:SetAnchorsAndPosition( 0, 1, 0, 0, 0, _1080p * 847, 0, 0 )
	self:addElement( SlidingBackground )
	self.SlidingBackground = SlidingBackground
	
	local CodCasterQuickSettings = nil
	
	CodCasterQuickSettings = MenuBuilder.BuildRegisteredType( "CodCasterQuickSettings", {
		controllerIndex = f2_local1
	} )
	CodCasterQuickSettings.id = "CodCasterQuickSettings"
	CodCasterQuickSettings:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 100, _1080p * 600, _1080p * 233.85, _1080p * 713.85 )
	self:addElement( CodCasterQuickSettings )
	self.CodCasterQuickSettings = CodCasterQuickSettings
	
	local MenuTitle = nil
	
	MenuTitle = MenuBuilder.BuildRegisteredType( "MenuTitle", {
		controllerIndex = f2_local1
	} )
	MenuTitle.id = "MenuTitle"
	MenuTitle.MenuTitle:setText( ToUpperCase( Engine.Localize( "CODCASTER_QUICK_SETTINGS" ) ), 0 )
	MenuTitle.MenuBreadcrumbs:setText( ToUpperCase( "" ), 0 )
	MenuTitle.Icon:SetTop( _1080p * -28.5, 0 )
	MenuTitle.Icon:SetBottom( _1080p * 61.5, 0 )
	MenuTitle:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 96, 0, _1080p * 74.85, _1080p * 154.85 )
	self:addElement( MenuTitle )
	self.MenuTitle = MenuTitle
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		SlidingBackground:RegisterAnimationSequence( "Appear", {
			{
				function ()
					return self.SlidingBackground:SetAnchorsAndPosition( 0, 1, 0, 0, _1080p * -600, _1080p * 247, 0, 0, 0 )
				end,
				function ()
					return self.SlidingBackground:SetAnchorsAndPosition( 0, 1, 0, 0, 0, _1080p * 847, 0, 0, 150, LUI.EASING.outQuadratic )
				end
			}
		} )
		CodCasterQuickSettings:RegisterAnimationSequence( "Appear", {
			{
				function ()
					return self.CodCasterQuickSettings:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -500, 0, _1080p * 233, _1080p * 714, 0 )
				end,
				function ()
					return self.CodCasterQuickSettings:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 100, _1080p * 800, _1080p * 233, _1080p * 714, 150, LUI.EASING.outQuadratic )
				end
			}
		} )
		MenuTitle:RegisterAnimationSequence( "Appear", {
			{
				function ()
					return self.MenuTitle:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * -386, _1080p * -482, _1080p * 75, _1080p * 155, 0 )
				end,
				function ()
					return self.MenuTitle:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 96, 0, _1080p * 77, _1080p * 157, 150, LUI.EASING.outQuadratic )
				end
			}
		} )
		self._sequences.Appear = function ()
			SlidingBackground:AnimateSequence( "Appear" )
			CodCasterQuickSettings:AnimateSequence( "Appear" )
			MenuTitle:AnimateSequence( "Appear" )
		end
		
		SlidingBackground:RegisterAnimationSequence( "Disappear", {
			{
				function ()
					return self.SlidingBackground:SetAnchorsAndPosition( 0, 1, 0, 0, 0, _1080p * 847, 0, 0, 0 )
				end,
				function ()
					return self.SlidingBackground:SetAnchorsAndPosition( 0, 1, 0, 0, _1080p * -800, 0, 0, 0, 150, LUI.EASING.inQuadratic )
				end
			}
		} )
		CodCasterQuickSettings:RegisterAnimationSequence( "Disappear", {
			{
				function ()
					return self.CodCasterQuickSettings:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.CodCasterQuickSettings:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 100, _1080p * 800, _1080p * 233, _1080p * 714, 0 )
				end,
				function ()
					return self.CodCasterQuickSettings:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -800, 0, _1080p * 233, _1080p * 714, 150, LUI.EASING.inQuadratic )
				end
			}
		} )
		MenuTitle:RegisterAnimationSequence( "Disappear", {
			{
				function ()
					return self.MenuTitle:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 96, 0, _1080p * 77, _1080p * 157, 0 )
				end,
				function ()
					return self.MenuTitle:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * -800, _1080p * -896, _1080p * 92, _1080p * 172, 150, LUI.EASING.inQuadratic )
				end
			}
		} )
		self._sequences.Disappear = function ()
			SlidingBackground:AnimateSequence( "Disappear" )
			CodCasterQuickSettings:AnimateSequence( "Disappear" )
			MenuTitle:AnimateSequence( "Disappear" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	f0_local0( self, f2_local1, controller )
	return self
end

MenuBuilder.registerType( "CodCasterQuickSettingsInGame", CodCasterQuickSettingsInGame )
LockTable( _M )
