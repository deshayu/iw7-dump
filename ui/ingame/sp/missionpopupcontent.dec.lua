local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function PostLoadFunc( f1_arg0 )
	f1_arg0:SetAlignment( LUI.Alignment.Middle )
	f1_arg0:SetAdjustSizeToContent( true )
	f1_arg0:SetIgnoreStretchingChildren( true )
end

function MissionPopupContent( menu, controller )
	local self = LUI.UIVerticalStackedLayout.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 450 * _1080p, 0, 618 * _1080p )
	self.id = "MissionPopupContent"
	local f2_local1 = controller and controller.controllerIndex
	if not f2_local1 and not Engine.InFrontend() then
		f2_local1 = self:getRootController()
	end
	assert( f2_local1 )
	local f2_local2 = self
	self:SetSpacing( 4 * _1080p )
	local Type = nil
	
	Type = MenuBuilder.BuildRegisteredType( "MissionPopupTitle", {
		controllerIndex = f2_local1
	} )
	Type.id = "Type"
	Type.MissionName:setText( "", 0 )
	Type:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, 0, _1080p * 54 )
	self:addElement( Type )
	self.Type = Type
	
	local Banner = nil
	
	Banner = LUI.UIImage.new()
	Banner.id = "Banner"
	Banner:setImage( RegisterMaterial( "hud_opsmap_jackalarena" ), 0 )
	Banner:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, _1080p * 58, _1080p * 234 )
	self:addElement( Banner )
	self.Banner = Banner
	
	local DescriptionTopSpacer = nil
	
	DescriptionTopSpacer = LUI.UIImage.new()
	DescriptionTopSpacer.id = "DescriptionTopSpacer"
	DescriptionTopSpacer:SetAlpha( 0, 0 )
	DescriptionTopSpacer:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, _1080p * 238, _1080p * 243 )
	self:addElement( DescriptionTopSpacer )
	self.DescriptionTopSpacer = DescriptionTopSpacer
	
	local Description = nil
	
	Description = LUI.UIText.new()
	Description.id = "Description"
	Description:setText( "", 0 )
	Description:SetFontSize( 22 * _1080p )
	Description:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	Description:SetAlignment( LUI.Alignment.Left )
	Description:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 10, _1080p * -10, _1080p * 247, _1080p * 269 )
	self:addElement( Description )
	self.Description = Description
	
	local DescriptionBottomSpacer = nil
	
	DescriptionBottomSpacer = LUI.UIImage.new()
	DescriptionBottomSpacer.id = "DescriptionBottomSpacer"
	DescriptionBottomSpacer:SetAlpha( 0, 0 )
	DescriptionBottomSpacer:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, _1080p * 273, _1080p * 283 )
	self:addElement( DescriptionBottomSpacer )
	self.DescriptionBottomSpacer = DescriptionBottomSpacer
	
	local Target = nil
	
	Target = MenuBuilder.BuildRegisteredType( "MissionPopupSubtitle", {
		controllerIndex = f2_local1
	} )
	Target.id = "Target"
	Target.Title:setText( Engine.Localize( "OPS_MAP_TARGET" ), 0 )
	Target:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 10, _1080p * -10, _1080p * 287, _1080p * 323 )
	self:addElement( Target )
	self.Target = Target
	
	local RewardsTopSpacer = nil
	
	RewardsTopSpacer = LUI.UIImage.new()
	RewardsTopSpacer.id = "RewardsTopSpacer"
	RewardsTopSpacer:SetAlpha( 0, 0 )
	RewardsTopSpacer:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, _1080p * 327, _1080p * 329 )
	self:addElement( RewardsTopSpacer )
	self.RewardsTopSpacer = RewardsTopSpacer
	
	local RewardsWrapper = nil
	
	RewardsWrapper = MenuBuilder.BuildRegisteredType( "MissionPopupRewardsWrapper", {
		controllerIndex = f2_local1
	} )
	RewardsWrapper.id = "RewardsWrapper"
	RewardsWrapper:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 10, _1080p * 440, _1080p * 333, _1080p * 489 )
	self:addElement( RewardsWrapper )
	self.RewardsWrapper = RewardsWrapper
	
	local RewardsBottomSpacer = nil
	
	RewardsBottomSpacer = LUI.UIImage.new()
	RewardsBottomSpacer.id = "RewardsBottomSpacer"
	RewardsBottomSpacer:SetAlpha( 0, 0 )
	RewardsBottomSpacer:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, _1080p * 493, _1080p * 495 )
	self:addElement( RewardsBottomSpacer )
	self.RewardsBottomSpacer = RewardsBottomSpacer
	
	local Success = nil
	
	Success = MenuBuilder.BuildRegisteredType( "MissionPopupSubtitle", {
		controllerIndex = f2_local1
	} )
	Success.id = "Success"
	Success.Title:setText( Engine.Localize( "OPS_MAP_SUCCESS_PROBABILITY_TITLE" ), 0 )
	Success:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 10, _1080p * -10, _1080p * 499, _1080p * 535 )
	self:addElement( Success )
	self.Success = Success
	
	local SpacerTarget = nil
	
	SpacerTarget = LUI.UIImage.new()
	SpacerTarget.id = "SpacerTarget"
	SpacerTarget:SetAlpha( 0, 0 )
	SpacerTarget:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, _1080p * 539, _1080p * 555 )
	self:addElement( SpacerTarget )
	self.SpacerTarget = SpacerTarget
	
	local Authorize = nil
	
	Authorize = MenuBuilder.BuildRegisteredType( "MissionPopupAuthorize", {
		controllerIndex = f2_local1
	} )
	Authorize.id = "Authorize"
	Authorize:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 10, _1080p * -10, _1080p * 559, _1080p * 604 )
	self:addElement( Authorize )
	self.Authorize = Authorize
	
	local SpacerAuthorize = nil
	
	SpacerAuthorize = LUI.UIImage.new()
	SpacerAuthorize.id = "SpacerAuthorize"
	SpacerAuthorize:SetAlpha( 0, 0 )
	SpacerAuthorize:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, _1080p * 608, _1080p * 612 )
	self:addElement( SpacerAuthorize )
	self.SpacerAuthorize = SpacerAuthorize
	
	PostLoadFunc( self, f2_local1, controller )
	return self
end

MenuBuilder.registerType( "MissionPopupContent", MissionPopupContent )
LockTable( _M )
