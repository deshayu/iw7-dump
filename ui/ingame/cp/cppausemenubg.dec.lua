local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function CPPauseMenuBG( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 1920 * _1080p, 0, 1080 * _1080p )
	self.id = "CPPauseMenuBG"
	self._animationSets = {}
	self._sequences = {}
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	self:setUseStencil( true )
	local CenterDiagSlice = nil
	
	CenterDiagSlice = LUI.UIImage.new()
	CenterDiagSlice.id = "CenterDiagSlice"
	CenterDiagSlice:SetAlpha( 0.1, 0 )
	CenterDiagSlice:SetZRotation( -168, 0 )
	CenterDiagSlice:SetAnchorsAndPosition( 0, 0, 0.5, 0.5, _1080p * -146, _1080p * 140, _1080p * -440, _1080p * 335 )
	self:addElement( CenterDiagSlice )
	self.CenterDiagSlice = CenterDiagSlice
	
	local OuterMaskBottom = nil
	
	OuterMaskBottom = MenuBuilder.BuildRegisteredType( "CPMenuOuterMask", {
		controllerIndex = f1_local1
	} )
	OuterMaskBottom.id = "OuterMaskBottom"
	OuterMaskBottom:SetAlpha( 0.6, 0 )
	OuterMaskBottom:SetZRotation( -168, 0 )
	OuterMaskBottom:SetAnchorsAndPosition( 0, 0, 1, 0, _1080p * -83, _1080p * 183, _1080p * -205, _1080p * 215 )
	self:addElement( OuterMaskBottom )
	self.OuterMaskBottom = OuterMaskBottom
	
	local OuterMaskTop = nil
	
	OuterMaskTop = MenuBuilder.BuildRegisteredType( "CPMenuOuterMask", {
		controllerIndex = f1_local1
	} )
	OuterMaskTop.id = "OuterMaskTop"
	OuterMaskTop:SetAlpha( 0.6, 0 )
	OuterMaskTop:SetZRotation( -168, 0 )
	OuterMaskTop:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * -190, _1080p * 76, _1080p * -320, _1080p * 100 )
	self:addElement( OuterMaskTop )
	self.OuterMaskTop = OuterMaskTop
	
	local BloodSplat = nil
	
	BloodSplat = LUI.UIImage.new()
	BloodSplat.id = "BloodSplat"
	BloodSplat:SetAlpha( 0.5, 0 )
	BloodSplat:setImage( RegisterMaterial( "cp_menu_zombies_blood_splats_large" ), 0 )
	BloodSplat:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 88, _1080p * 718, _1080p * -71, _1080p * 441 )
	self:addElement( BloodSplat )
	self.BloodSplat = BloodSplat
	
	self._animationSets.DefaultAnimationSet = function ()
		BloodSplat:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.BloodSplat:SetAlpha( 0, 0 )
				end,
				function ()
					return self.BloodSplat:SetAlpha( 0, 240 )
				end,
				function ()
					return self.BloodSplat:SetAlpha( 0.5, 10 )
				end
			},
			{
				function ()
					return self.BloodSplat:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 340.25, _1080p * 465.75, _1080p * 134, _1080p * 236, 250 )
				end,
				function ()
					return self.BloodSplat:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 88, _1080p * 718, _1080p * -71, _1080p * 441, 150 )
				end
			}
		} )
		self._sequences.DefaultSequence = function ()
			BloodSplat:AnimateSequence( "DefaultSequence" )
		end
		
		CenterDiagSlice:RegisterAnimationSequence( "Splitscreen", {
			{
				function ()
					return self.CenterDiagSlice:SetAnchorsAndPosition( 0, 0, 0.5, 0.5, _1080p * -146, _1080p * 140, _1080p * -486, _1080p * 380, 0 )
				end
			}
		} )
		OuterMaskBottom:RegisterAnimationSequence( "Splitscreen", {
			{
				function ()
					return self.OuterMaskBottom:SetAnchorsAndPosition( 0, 0, 1, 0, _1080p * -83, _1080p * 183, _1080p * -155, _1080p * 265, 0 )
				end
			}
		} )
		OuterMaskTop:RegisterAnimationSequence( "Splitscreen", {
			{
				function ()
					return self.OuterMaskTop:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * -190, _1080p * 76, _1080p * -370, _1080p * 50, 0 )
				end
			}
		} )
		self._sequences.Splitscreen = function ()
			CenterDiagSlice:AnimateSequence( "Splitscreen" )
			OuterMaskBottom:AnimateSequence( "Splitscreen" )
			OuterMaskTop:AnimateSequence( "Splitscreen" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	ACTIONS.AnimateSequence( self, "DefaultSequence" )
	return self
end

MenuBuilder.registerType( "CPPauseMenuBG", CPPauseMenuBG )
LockTable( _M )
