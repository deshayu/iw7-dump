local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ( f1_arg0, f1_arg1, f1_arg2 )
	f1_arg0:registerEventHandler( "empty_menu_stack", function ( element, event )
		element.hint:setText( Engine.Localize( "COOP_INTERACTIONS_ZZ_HELPER" ), 0 )
	end )
end

function zzHelper( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 1920 * _1080p, 0, 1080 * _1080p )
	self.id = "zzHelper"
	self._animationSets = {}
	self._sequences = {}
	local f3_local1 = controller and controller.controllerIndex
	if not f3_local1 and not Engine.InFrontend() then
		f3_local1 = self:getRootController()
	end
	assert( f3_local1 )
	local f3_local2 = self
	local bg = nil
	
	bg = LUI.UIImage.new()
	bg.id = "bg"
	bg:SetRGBFromInt( 65447, 0 )
	bg:setImage( RegisterMaterial( "cp_zmb_zz_helper" ), 0 )
	bg:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1218.7, _1080p * 1730.7, _1080p * 739, _1080p * 995 )
	self:addElement( bg )
	self.bg = bg
	
	local hint = nil
	
	hint = LUI.UIText.new()
	hint.id = "hint"
	hint:SetRGBFromTable( SWATCHES.Reticles.White, 0 )
	hint:setText( Engine.Localize( "COOP_INTERACTIONS_ZZ_HELPER" ), 0 )
	hint:SetFontSize( 16 * _1080p )
	hint:SetFont( FONTS.GetFont( FONTS.ZmClean.File ) )
	hint:SetAlignment( LUI.Alignment.Center )
	hint:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1321.2, _1080p * 1630.2, _1080p * 890, _1080p * 906 )
	self:addElement( hint )
	self.hint = hint
	
	local topper = nil
	
	topper = LUI.UIImage.new()
	topper.id = "topper"
	topper:setImage( RegisterMaterial( "cp_zmb_zz_top" ), 0 )
	topper:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1218.7, _1080p * 1730.7, _1080p * 725, _1080p * 853 )
	self:addElement( topper )
	self.topper = topper
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		bg:RegisterAnimationSequence( "oncreate", {
			{
				function ()
					return self.bg:SetAlpha( 0, 0 )
				end
			}
		} )
		hint:RegisterAnimationSequence( "oncreate", {
			{
				function ()
					return self.hint:SetAlpha( 0, 0 )
				end
			}
		} )
		topper:RegisterAnimationSequence( "oncreate", {
			{
				function ()
					return self.topper:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.oncreate = function ()
			bg:AnimateSequence( "oncreate" )
			hint:AnimateSequence( "oncreate" )
			topper:AnimateSequence( "oncreate" )
		end
		
		bg:RegisterAnimationSequence( "hide", {
			{
				function ()
					return self.bg:SetAlpha( 0, 0 )
				end
			}
		} )
		hint:RegisterAnimationSequence( "hide", {
			{
				function ()
					return self.hint:SetAlpha( 0, 0 )
				end
			}
		} )
		topper:RegisterAnimationSequence( "hide", {
			{
				function ()
					return self.topper:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.hide = function ()
			bg:AnimateSequence( "hide" )
			hint:AnimateSequence( "hide" )
			topper:AnimateSequence( "hide" )
		end
		
		bg:RegisterAnimationSequence( "show", {
			{
				function ()
					return self.bg:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.bg:SetRGBFromInt( 65447, 0 )
				end
			}
		} )
		hint:RegisterAnimationSequence( "show", {
			{
				function ()
					return self.hint:SetAlpha( 1, 0 )
				end
			}
		} )
		topper:RegisterAnimationSequence( "show", {
			{
				function ()
					return self.topper:SetAlpha( 1, 0 )
				end
			}
		} )
		self._sequences.show = function ()
			bg:AnimateSequence( "show" )
			hint:AnimateSequence( "show" )
			topper:AnimateSequence( "show" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	self:SubscribeToModel( DataSources.inGame.CP.zombies.zzHelper:GetModel( f3_local1 ), function ()
		if DataSources.inGame.CP.zombies.zzHelper:GetValue( f3_local1 ) ~= nil and DataSources.inGame.CP.zombies.zzHelper:GetValue( f3_local1 ) == 1 then
			ACTIONS.AnimateSequence( self, "show" )
		end
		if DataSources.inGame.CP.zombies.zzHelper:GetValue( f3_local1 ) ~= nil and DataSources.inGame.CP.zombies.zzHelper:GetValue( f3_local1 ) == 0 then
			ACTIONS.AnimateSequence( self, "hide" )
		end
	end )
	f0_local0( self, f3_local1, controller )
	ACTIONS.AnimateSequence( self, "oncreate" )
	return self
end

MenuBuilder.registerType( "zzHelper", zzHelper )
LockTable( _M )
