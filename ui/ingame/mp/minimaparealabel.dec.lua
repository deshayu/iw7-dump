local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function PostLoadFunc( f1_arg0, f1_arg1 )
	assert( f1_arg0.AreaCallout )
	assert( f1_arg0.Background )
	assert( f1_arg0.Tab )
	f1_arg0.AreaCallout:SetShadowUOffset( -0 )
	f1_arg0.AreaCallout:SetShadowVOffset( -0 )
	f1_arg0.AreaCallout:SetWordWrap( false )
	f1_arg0:SubscribeToModel( DataSources.inGame.MP.calloutAreaString:GetModel( f1_arg1 ), function ( f2_arg0 )
		local f2_local0 = DataModel.GetModelValue( f2_arg0 )
		if f2_local0 ~= "" then
			f1_arg0.Background:SetAlpha( 0, 0 )
			f1_arg0.Background:SetAlpha( 0.2, 250, LUI.EASING.outQuadratic )
			f1_arg0.AreaCallout:SetAlpha( 0, 0 )
			f1_arg0.AreaCallout:SetAlpha( 1, 250, LUI.EASING.outQuadratic )
			f1_arg0.Tab:SetAlpha( 0, 0 )
			f1_arg0.Tab:SetAlpha( 1, 250, LUI.EASING.outQuadratic )
			f1_arg0.AreaCallout:setText( ToUpperCase( f2_local0 ), 0 )
		else
			f1_arg0.Background:SetAlpha( 0, 0 )
			f1_arg0.AreaCallout:SetAlpha( 0, 0 )
			f1_arg0.Tab:SetAlpha( 0, 0 )
		end
	end )
end

function MinimapAreaLabel( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 402 * _1080p, 0, 20 * _1080p )
	self.id = "MinimapAreaLabel"
	self._animationSets = {}
	self._sequences = {}
	local f3_local1 = controller and controller.controllerIndex
	if not f3_local1 and not Engine.InFrontend() then
		f3_local1 = self:getRootController()
	end
	assert( f3_local1 )
	local f3_local2 = self
	local Background = nil
	
	Background = LUI.UIImage.new()
	Background.id = "Background"
	Background:SetRGBFromInt( 0, 0 )
	Background:SetAlpha( 0.2, 0 )
	Background:setImage( RegisterMaterial( "widg_gradient_left_to_right" ), 0 )
	Background:SetUseAA( true )
	Background:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * 1, 0, 0, 0 )
	self:addElement( Background )
	self.Background = Background
	
	local AreaCallout = nil
	
	AreaCallout = LUI.UIStyledText.new()
	AreaCallout.id = "AreaCallout"
	AreaCallout:setText( Engine.Localize( "MENU_NEW" ), 0 )
	AreaCallout:SetFontSize( 18 * _1080p )
	AreaCallout:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	AreaCallout:SetAlignment( LUI.Alignment.Left )
	AreaCallout:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 13, 0, 0, _1080p * 18 )
	self:addElement( AreaCallout )
	self.AreaCallout = AreaCallout
	
	local Tab = nil
	
	Tab = LUI.UIImage.new()
	Tab.id = "Tab"
	Tab:SetUseAA( true )
	Tab:SetAnchorsAndPosition( 0, 1, 0, 0, 0, _1080p * 3, 0, 0 )
	self:addElement( Tab )
	self.Tab = Tab
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		Background:RegisterAnimationSequence( "ShowAreaLabel", {
			{
				function ()
					return self.Background:SetAlpha( 0, 0 )
				end,
				function ()
					return self.Background:SetAlpha( 0.2, 250, LUI.EASING.outQuadratic )
				end
			}
		} )
		AreaCallout:RegisterAnimationSequence( "ShowAreaLabel", {
			{
				function ()
					return self.AreaCallout:SetAlpha( 0, 0 )
				end,
				function ()
					return self.AreaCallout:SetAlpha( 1, 250, LUI.EASING.outQuadratic )
				end
			}
		} )
		Tab:RegisterAnimationSequence( "ShowAreaLabel", {
			{
				function ()
					return self.Tab:SetAlpha( 0, 0 )
				end,
				function ()
					return self.Tab:SetAlpha( 1, 250, LUI.EASING.outQuadratic )
				end
			}
		} )
		self._sequences.ShowAreaLabel = function ()
			Background:AnimateSequence( "ShowAreaLabel" )
			AreaCallout:AnimateSequence( "ShowAreaLabel" )
			Tab:AnimateSequence( "ShowAreaLabel" )
		end
		
		Background:RegisterAnimationSequence( "HideAreaLabel", {
			{
				function ()
					return self.Background:SetAlpha( 0, 0 )
				end
			}
		} )
		AreaCallout:RegisterAnimationSequence( "HideAreaLabel", {
			{
				function ()
					return self.AreaCallout:SetAlpha( 0, 0 )
				end
			}
		} )
		Tab:RegisterAnimationSequence( "HideAreaLabel", {
			{
				function ()
					return self.Tab:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.HideAreaLabel = function ()
			Background:AnimateSequence( "HideAreaLabel" )
			AreaCallout:AnimateSequence( "HideAreaLabel" )
			Tab:AnimateSequence( "HideAreaLabel" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	PostLoadFunc( self, f3_local1, controller )
	return self
end

MenuBuilder.registerType( "MinimapAreaLabel", MinimapAreaLabel )
LockTable( _M )
