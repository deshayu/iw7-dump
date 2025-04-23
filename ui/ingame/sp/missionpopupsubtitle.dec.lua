local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function PostLoadFunc( f1_arg0, f1_arg1, f1_arg2 )
	if IsLanguageArabic() then
		f1_arg0.Value:SetAlignment( LUI.Alignment.Left )
		f1_arg0.Value:SetOptOutRightToLeftAlignmentFlip( true )
	end
end

function MissionPopupSubtitle( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 450 * _1080p, 0, 36 * _1080p )
	self.id = "MissionPopupSubtitle"
	self._animationSets = {}
	self._sequences = {}
	local f2_local1 = controller and controller.controllerIndex
	if not f2_local1 and not Engine.InFrontend() then
		f2_local1 = self:getRootController()
	end
	assert( f2_local1 )
	local f2_local2 = self
	local Background = nil
	
	Background = LUI.UIImage.new()
	Background.id = "Background"
	Background:SetRGBFromInt( 3355443, 0 )
	Background:setImage( RegisterMaterial( "ops_map_scr_gradient_1" ), 0 )
	self:addElement( Background )
	self.Background = Background
	
	local Title = nil
	
	Title = LUI.UIText.new()
	Title.id = "Title"
	Title:SetRGBFromTable( SWATCHES.OpsMap.subtitle, 0 )
	Title:setText( "", 0 )
	Title:SetFontSize( 22 * _1080p )
	Title:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	Title:SetAlignment( LUI.Alignment.Left )
	Title:SetAnchorsAndPosition( 0, 0, 0.5, 0.5, _1080p * 10, _1080p * -10, _1080p * -11, _1080p * 11 )
	self:addElement( Title )
	self.Title = Title
	
	local Value = nil
	
	Value = LUI.UIText.new()
	Value.id = "Value"
	Value:setText( "", 0 )
	Value:SetFontSize( 22 * _1080p )
	Value:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	Value:SetAlignment( LUI.Alignment.Right )
	Value:SetAnchorsAndPosition( 0, 0, 0.5, 0.5, _1080p * 10, _1080p * -10, _1080p * -11, _1080p * 11 )
	self:addElement( Value )
	self.Value = Value
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		Title:RegisterAnimationSequence( "SmallerText", {
			{
				function ()
					return self.Title:SetAnchorsAndPosition( 0, 0, 0.5, 0.5, _1080p * 10, _1080p * -10, _1080p * -8, _1080p * 8, 0 )
				end
			}
		} )
		Value:RegisterAnimationSequence( "SmallerText", {
			{
				function ()
					return self.Value:SetAnchorsAndPosition( 0, 0, 0.5, 0.5, _1080p * 10, _1080p * -10, _1080p * -8, _1080p * 8, 0 )
				end
			}
		} )
		self._sequences.SmallerText = function ()
			Title:AnimateSequence( "SmallerText" )
			Value:AnimateSequence( "SmallerText" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	if CONDITIONS.IsJapanese( self ) then
		ACTIONS.AnimateSequence( self, "SmallerText" )
	end
	PostLoadFunc( self, f2_local1, controller )
	return self
end

MenuBuilder.registerType( "MissionPopupSubtitle", MissionPopupSubtitle )
LockTable( _M )
