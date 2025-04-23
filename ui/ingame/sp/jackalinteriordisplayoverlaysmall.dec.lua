local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function JackalInteriorDisplayOverlaySmall( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 200 * _1080p, 0, 75 * _1080p )
	self.id = "JackalInteriorDisplayOverlaySmall"
	self._animationSets = {}
	self._sequences = {}
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local Background = nil
	
	Background = LUI.UIImage.new()
	Background.id = "Background"
	Background:SetRGBFromInt( 0, 0 )
	self:addElement( Background )
	self.Background = Background
	
	local WarningImageBG = nil
	
	WarningImageBG = LUI.UIImage.new()
	WarningImageBG.id = "WarningImageBG"
	WarningImageBG:setImage( RegisterMaterial( "hud_jackal_interior_warning_ui" ), 0 )
	self:addElement( WarningImageBG )
	self.WarningImageBG = WarningImageBG
	
	local CautionImageBG = nil
	
	CautionImageBG = LUI.UIImage.new()
	CautionImageBG.id = "CautionImageBG"
	CautionImageBG:setImage( RegisterMaterial( "hud_jackal_interior_caution_tiny" ), 0 )
	self:addElement( CautionImageBG )
	self.CautionImageBG = CautionImageBG
	
	local CautionImage = nil
	
	CautionImage = LUI.UIImage.new()
	CautionImage.id = "CautionImage"
	CautionImage:setImage( RegisterMaterial( "hud_jackal_interior_caution_tiny" ), 0 )
	CautionImage:SetBlendMode( BLEND_MODE.addWithAlpha )
	self:addElement( CautionImage )
	self.CautionImage = CautionImage
	
	local WarningImage = nil
	
	WarningImage = LUI.UIImage.new()
	WarningImage.id = "WarningImage"
	WarningImage:setImage( RegisterMaterial( "hud_jackal_interior_warning_ui" ), 0 )
	WarningImage:SetBlendMode( BLEND_MODE.addWithAlpha )
	self:addElement( WarningImage )
	self.WarningImage = WarningImage
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		Background:RegisterAnimationSequence( "Warning", {
			{
				function ()
					return self.Background:SetAlpha( 1, 0 )
				end
			}
		} )
		WarningImageBG:RegisterAnimationSequence( "Warning", {
			{
				function ()
					return self.WarningImageBG:SetAlpha( 0.25, 0 )
				end
			}
		} )
		CautionImageBG:RegisterAnimationSequence( "Warning", {
			{
				function ()
					return self.CautionImageBG:SetAlpha( 0, 0 )
				end
			}
		} )
		CautionImage:RegisterAnimationSequence( "Warning", {
			{
				function ()
					return self.CautionImage:SetAlpha( 0, 0 )
				end
			}
		} )
		WarningImage:RegisterAnimationSequence( "Warning", {
			{
				function ()
					return self.WarningImage:SetAlpha( 1, 0 )
				end,
				function ()
					return self.WarningImage:SetAlpha( 0, 120 )
				end,
				function ()
					return self.WarningImage:SetAlpha( 1, 120 )
				end
			}
		} )
		self._sequences.Warning = function ()
			Background:AnimateLoop( "Warning" )
			WarningImageBG:AnimateLoop( "Warning" )
			CautionImageBG:AnimateLoop( "Warning" )
			CautionImage:AnimateLoop( "Warning" )
			WarningImage:AnimateLoop( "Warning" )
		end
		
		Background:RegisterAnimationSequence( "Default", {
			{
				function ()
					return self.Background:SetAlpha( 0, 0 )
				end
			}
		} )
		WarningImageBG:RegisterAnimationSequence( "Default", {
			{
				function ()
					return self.WarningImageBG:SetAlpha( 0, 0 )
				end
			}
		} )
		CautionImageBG:RegisterAnimationSequence( "Default", {
			{
				function ()
					return self.CautionImageBG:SetAlpha( 0, 0 )
				end
			}
		} )
		CautionImage:RegisterAnimationSequence( "Default", {
			{
				function ()
					return self.CautionImage:SetAlpha( 0, 0 )
				end
			}
		} )
		WarningImage:RegisterAnimationSequence( "Default", {
			{
				function ()
					return self.WarningImage:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.Default = function ()
			Background:AnimateSequence( "Default" )
			WarningImageBG:AnimateSequence( "Default" )
			CautionImageBG:AnimateSequence( "Default" )
			CautionImage:AnimateSequence( "Default" )
			WarningImage:AnimateSequence( "Default" )
		end
		
		Background:RegisterAnimationSequence( "Incoming", {
			{
				function ()
					return self.Background:SetAlpha( 1, 0 )
				end
			}
		} )
		WarningImageBG:RegisterAnimationSequence( "Incoming", {
			{
				function ()
					return self.WarningImageBG:SetAlpha( 0, 0 )
				end
			}
		} )
		CautionImageBG:RegisterAnimationSequence( "Incoming", {
			{
				function ()
					return self.CautionImageBG:SetAlpha( 0.25, 0 )
				end
			}
		} )
		CautionImage:RegisterAnimationSequence( "Incoming", {
			{
				function ()
					return self.CautionImage:SetAlpha( 1, 0 )
				end,
				function ()
					return self.CautionImage:SetAlpha( 0, 120 )
				end,
				function ()
					return self.CautionImage:SetAlpha( 1, 120 )
				end
			}
		} )
		WarningImage:RegisterAnimationSequence( "Incoming", {
			{
				function ()
					return self.WarningImage:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.Incoming = function ()
			Background:AnimateLoop( "Incoming" )
			WarningImageBG:AnimateLoop( "Incoming" )
			CautionImageBG:AnimateLoop( "Incoming" )
			CautionImage:AnimateLoop( "Incoming" )
			WarningImage:AnimateLoop( "Incoming" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	ACTIONS.AnimateSequence( self, "Default" )
	return self
end

MenuBuilder.registerType( "JackalInteriorDisplayOverlaySmall", JackalInteriorDisplayOverlaySmall )
LockTable( _M )
