local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function challengeBadgeInventory( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 876 * _1080p, 0, 952 * _1080p )
	self.id = "challengeBadgeInventory"
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local sash = nil
	
	sash = LUI.UIImage.new()
	sash.id = "sash"
	sash:SetAlpha( 0.74, 0 )
	sash:SetZRotation( 41, 0 )
	sash:setImage( RegisterMaterial( "zm_challenge_sash" ), 0 )
	sash:SetUseAA( true )
	sash:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 188.1, _1080p * 1075.1, _1080p * 701.38, _1080p * 817.6 )
	self:addElement( sash )
	self.sash = sash
	
	local BearBacking = nil
	
	BearBacking = LUI.UIImage.new()
	BearBacking.id = "BearBacking"
	BearBacking:SetRGBFromInt( 3223857, 0 )
	BearBacking:SetScale( -0.35, 0 )
	BearBacking:setImage( RegisterMaterial( "zm_challenge_dlc1_bear" ), 0 )
	BearBacking:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 409.6, _1080p * 537.6, _1080p * 836.6, _1080p * 964.6 )
	self:addElement( BearBacking )
	self.BearBacking = BearBacking
	
	local Bear = nil
	
	Bear = LUI.UIImage.new()
	Bear.id = "Bear"
	Bear:SetScale( -0.35, 0 )
	Bear:setImage( RegisterMaterial( "zm_challenge_dlc1_bear" ), 0 )
	Bear:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 409.6, _1080p * 537.6, _1080p * 836.6, _1080p * 964.6 )
	Bear:BindAlphaToModel( DataSources.inGame.CP.zombies.challenges.bearBadgeAlphaFilter:GetModel( f1_local1 ) )
	self:addElement( Bear )
	self.Bear = Bear
	
	local WolfBacking = nil
	
	WolfBacking = LUI.UIImage.new()
	WolfBacking.id = "WolfBacking"
	WolfBacking:SetRGBFromInt( 3223857, 0 )
	WolfBacking:SetScale( -0.35, 0 )
	WolfBacking:setImage( RegisterMaterial( "zm_challenge_dlc1_wolf" ), 0 )
	WolfBacking:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 693, _1080p * 821, _1080p * 595.38, _1080p * 723.38 )
	self:addElement( WolfBacking )
	self.WolfBacking = WolfBacking
	
	local Wolf = nil
	
	Wolf = LUI.UIImage.new()
	Wolf.id = "Wolf"
	Wolf:SetScale( -0.35, 0 )
	Wolf:setImage( RegisterMaterial( "zm_challenge_dlc1_wolf" ), 0 )
	Wolf:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 693, _1080p * 821, _1080p * 595.38, _1080p * 723.38 )
	Wolf:BindAlphaToModel( DataSources.inGame.CP.zombies.challenges.wolfBadgeAlphaFilter:GetModel( f1_local1 ) )
	self:addElement( Wolf )
	self.Wolf = Wolf
	
	local DeerBacking = nil
	
	DeerBacking = LUI.UIImage.new()
	DeerBacking.id = "DeerBacking"
	DeerBacking:SetRGBFromInt( 3223857, 0 )
	DeerBacking:SetScale( -0.35, 0 )
	DeerBacking:setImage( RegisterMaterial( "zm_challenge_dlc1_deer" ), 0 )
	DeerBacking:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 557.6, _1080p * 685.6, _1080p * 711.6, _1080p * 839.6 )
	self:addElement( DeerBacking )
	self.DeerBacking = DeerBacking
	
	local Deer = nil
	
	Deer = LUI.UIImage.new()
	Deer.id = "Deer"
	Deer:SetScale( -0.35, 0 )
	Deer:setImage( RegisterMaterial( "zm_challenge_dlc1_deer" ), 0 )
	Deer:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 557.6, _1080p * 685.6, _1080p * 711.6, _1080p * 839.6 )
	Deer:BindAlphaToModel( DataSources.inGame.CP.zombies.challenges.deerBadgeAlphaFilter:GetModel( f1_local1 ) )
	self:addElement( Deer )
	self.Deer = Deer
	
	local OwlBacking = nil
	
	OwlBacking = LUI.UIImage.new()
	OwlBacking.id = "OwlBacking"
	OwlBacking:SetRGBFromInt( 1907997, 0 )
	OwlBacking:SetScale( -0.35, 0 )
	OwlBacking:setImage( RegisterMaterial( "zm_challenge_dlc1_owl" ), 0 )
	OwlBacking:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 482.1, _1080p * 610.1, _1080p * 773.6, _1080p * 901.6 )
	self:addElement( OwlBacking )
	self.OwlBacking = OwlBacking
	
	local Owl = nil
	
	Owl = LUI.UIImage.new()
	Owl.id = "Owl"
	Owl:SetScale( -0.35, 0 )
	Owl:setImage( RegisterMaterial( "zm_challenge_dlc1_owl" ), 0 )
	Owl:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 482.1, _1080p * 610.1, _1080p * 773.6, _1080p * 901.6 )
	Owl:BindAlphaToModel( DataSources.inGame.CP.zombies.challenges.owlBadgeAlphaFilter:GetModel( f1_local1 ) )
	self:addElement( Owl )
	self.Owl = Owl
	
	local EagleBacking = nil
	
	EagleBacking = LUI.UIImage.new()
	EagleBacking.id = "EagleBacking"
	EagleBacking:SetRGBFromInt( 3223857, 0 )
	EagleBacking:SetScale( -0.35, 0 )
	EagleBacking:setImage( RegisterMaterial( "zm_challenge_dlc1_eagle" ), 0 )
	EagleBacking:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 627.6, _1080p * 755.6, _1080p * 640.98, _1080p * 768.98 )
	self:addElement( EagleBacking )
	self.EagleBacking = EagleBacking
	
	local Eagle = nil
	
	Eagle = LUI.UIImage.new()
	Eagle.id = "Eagle"
	Eagle:SetScale( -0.35, 0 )
	Eagle:setImage( RegisterMaterial( "zm_challenge_dlc1_eagle" ), 0 )
	Eagle:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 627.6, _1080p * 755.6, _1080p * 640.98, _1080p * 768.98 )
	Eagle:BindAlphaToModel( DataSources.inGame.CP.zombies.challenges.eagleBadgeAlphaFilter:GetModel( f1_local1 ) )
	self:addElement( Eagle )
	self.Eagle = Eagle
	
	return self
end

MenuBuilder.registerType( "challengeBadgeInventory", challengeBadgeInventory )
LockTable( _M )
