local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function charmNecklace( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 1021 * _1080p, 0, 361 * _1080p )
	self.id = "charmNecklace"
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local necklace = nil
	
	necklace = LUI.UIImage.new()
	necklace.id = "necklace"
	necklace:setImage( RegisterMaterial( "zm_charms_string" ), 0 )
	necklace:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 1024, _1080p * 52, _1080p * 308 )
	self:addElement( necklace )
	self.necklace = necklace
	
	local bootsOff = nil
	
	bootsOff = LUI.UIImage.new()
	bootsOff.id = "bootsOff"
	bootsOff:setImage( RegisterMaterial( "zm_charms_boots_off" ), 0 )
	bootsOff:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 729.57, _1080p * 857.57, _1080p * 38.16, _1080p * 166.16 )
	self:addElement( bootsOff )
	self.bootsOff = bootsOff
	
	local boots = nil
	
	boots = LUI.UIImage.new()
	boots.id = "boots"
	boots:setImage( RegisterMaterial( "zm_charms_boots" ), 0 )
	boots:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 729.57, _1080p * 857.57, _1080p * 38.16, _1080p * 166.16 )
	boots:BindAlphaToModel( DataSources.inGame.CP.zombies.questsDLC1.charmBootsAlphaFilter:GetModel( f1_local1 ) )
	self:addElement( boots )
	self.boots = boots
	
	local pacifierOff = nil
	
	pacifierOff = LUI.UIImage.new()
	pacifierOff.id = "pacifierOff"
	pacifierOff:setImage( RegisterMaterial( "zm_charms_pacifier_off" ), 0 )
	pacifierOff:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 650.57, _1080p * 778.57, _1080p * 57.5, _1080p * 185.5 )
	self:addElement( pacifierOff )
	self.pacifierOff = pacifierOff
	
	local pacifier = nil
	
	pacifier = LUI.UIImage.new()
	pacifier.id = "pacifier"
	pacifier:setImage( RegisterMaterial( "zm_charms_pacifier" ), 0 )
	pacifier:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 650.57, _1080p * 778.57, _1080p * 57.5, _1080p * 185.5 )
	pacifier:BindAlphaToModel( DataSources.inGame.CP.zombies.questsDLC1.charmPacifierAlphaFilter:GetModel( f1_local1 ) )
	self:addElement( pacifier )
	self.pacifier = pacifier
	
	local frogOff = nil
	
	frogOff = LUI.UIImage.new()
	frogOff.id = "frogOff"
	frogOff:setImage( RegisterMaterial( "zm_charms_frog_off" ), 0 )
	frogOff:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 574.57, _1080p * 702.57, _1080p * 53.5, _1080p * 181.5 )
	self:addElement( frogOff )
	self.frogOff = frogOff
	
	local frog = nil
	
	frog = LUI.UIImage.new()
	frog.id = "frog"
	frog:setImage( RegisterMaterial( "zm_charms_frog" ), 0 )
	frog:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 574.57, _1080p * 702.57, _1080p * 53.5, _1080p * 181.5 )
	frog:BindAlphaToModel( DataSources.inGame.CP.zombies.questsDLC1.charmFrogAlphaFilter:GetModel( f1_local1 ) )
	self:addElement( frog )
	self.frog = frog
	
	local fishOff = nil
	
	fishOff = LUI.UIImage.new()
	fishOff.id = "fishOff"
	fishOff:setImage( RegisterMaterial( "zm_charms_fish_off" ), 0 )
	fishOff:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 513.57, _1080p * 641.57, _1080p * 60.16, _1080p * 188.16 )
	self:addElement( fishOff )
	self.fishOff = fishOff
	
	local fish = nil
	
	fish = LUI.UIImage.new()
	fish.id = "fish"
	fish:setImage( RegisterMaterial( "zm_charms_fish" ), 0 )
	fish:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 513.57, _1080p * 641.57, _1080p * 60.16, _1080p * 188.16 )
	fish:BindAlphaToModel( DataSources.inGame.CP.zombies.questsDLC1.charmFishAlphaFilter:GetModel( f1_local1 ) )
	self:addElement( fish )
	self.fish = fish
	
	local ballOff = nil
	
	ballOff = LUI.UIImage.new()
	ballOff.id = "ballOff"
	ballOff:setImage( RegisterMaterial( "zm_charms_ball_off" ), 0 )
	ballOff:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 441.57, _1080p * 569.57, _1080p * 60.16, _1080p * 188.16 )
	self:addElement( ballOff )
	self.ballOff = ballOff
	
	local ball = nil
	
	ball = LUI.UIImage.new()
	ball.id = "ball"
	ball:setImage( RegisterMaterial( "zm_charms_ball" ), 0 )
	ball:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 441.57, _1080p * 569.57, _1080p * 60.16, _1080p * 188.16 )
	ball:BindAlphaToModel( DataSources.inGame.CP.zombies.questsDLC1.charmBallAlphaFilter:GetModel( f1_local1 ) )
	self:addElement( ball )
	self.ball = ball
	
	local birdheadOff = nil
	
	birdheadOff = LUI.UIImage.new()
	birdheadOff.id = "birdheadOff"
	birdheadOff:setImage( RegisterMaterial( "zm_charms_birdhead_off" ), 0 )
	birdheadOff:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 367.57, _1080p * 495.57, _1080p * 55.5, _1080p * 183.5 )
	self:addElement( birdheadOff )
	self.birdheadOff = birdheadOff
	
	local birdhead = nil
	
	birdhead = LUI.UIImage.new()
	birdhead.id = "birdhead"
	birdhead:setImage( RegisterMaterial( "zm_charms_birdhead" ), 0 )
	birdhead:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 367.57, _1080p * 495.57, _1080p * 55.5, _1080p * 183.5 )
	birdhead:BindAlphaToModel( DataSources.inGame.CP.zombies.questsDLC1.charmBirdheadAlphaFilter:GetModel( f1_local1 ) )
	self:addElement( birdhead )
	self.birdhead = birdhead
	
	local ringsOff = nil
	
	ringsOff = LUI.UIImage.new()
	ringsOff.id = "ringsOff"
	ringsOff:setImage( RegisterMaterial( "zm_charms_rings_off" ), 0 )
	ringsOff:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 287.57, _1080p * 415.57, _1080p * 59.16, _1080p * 187.16 )
	self:addElement( ringsOff )
	self.ringsOff = ringsOff
	
	local rings = nil
	
	rings = LUI.UIImage.new()
	rings.id = "rings"
	rings:setImage( RegisterMaterial( "zm_charms_rings" ), 0 )
	rings:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 287.57, _1080p * 415.57, _1080p * 59.16, _1080p * 187.16 )
	rings:BindAlphaToModel( DataSources.inGame.CP.zombies.questsDLC1.charmRingAlphaFilter:GetModel( f1_local1 ) )
	self:addElement( rings )
	self.rings = rings
	
	local arrowheadOff = nil
	
	arrowheadOff = LUI.UIImage.new()
	arrowheadOff.id = "arrowheadOff"
	arrowheadOff:setImage( RegisterMaterial( "zm_charms_arrowhead_off" ), 0 )
	arrowheadOff:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 214.57, _1080p * 342.57, _1080p * 67.16, _1080p * 195.16 )
	self:addElement( arrowheadOff )
	self.arrowheadOff = arrowheadOff
	
	local arrowhead = nil
	
	arrowhead = LUI.UIImage.new()
	arrowhead.id = "arrowhead"
	arrowhead:setImage( RegisterMaterial( "zm_charms_arrowhead" ), 0 )
	arrowhead:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 214.57, _1080p * 342.57, _1080p * 67.16, _1080p * 195.16 )
	arrowhead:BindAlphaToModel( DataSources.inGame.CP.zombies.questsDLC1.charmArrowAlphaFilter:GetModel( f1_local1 ) )
	self:addElement( arrowhead )
	self.arrowhead = arrowhead
	
	local shovelOff = nil
	
	shovelOff = LUI.UIImage.new()
	shovelOff.id = "shovelOff"
	shovelOff:setImage( RegisterMaterial( "zm_charms_shovel_off" ), 0 )
	shovelOff:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 195.57, _1080p * 259.57, _1080p * 3.16, _1080p * 259.16 )
	self:addElement( shovelOff )
	self.shovelOff = shovelOff
	
	local shovel = nil
	
	shovel = LUI.UIImage.new()
	shovel.id = "shovel"
	shovel:setImage( RegisterMaterial( "zm_charms_shovel" ), 0 )
	shovel:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 195.57, _1080p * 259.57, _1080p * 3.16, _1080p * 259.16 )
	shovel:BindAlphaToModel( DataSources.inGame.CP.zombies.questsDLC1.charmShovelAlphaFilter:GetModel( f1_local1 ) )
	self:addElement( shovel )
	self.shovel = shovel
	
	local binocularsOff = nil
	
	binocularsOff = LUI.UIImage.new()
	binocularsOff.id = "binocularsOff"
	binocularsOff:setImage( RegisterMaterial( "zm_charms_binoculars_off" ), 0 )
	binocularsOff:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 97.57, _1080p * 225.57, _1080p * 99.16, _1080p * 227.16 )
	self:addElement( binocularsOff )
	self.binocularsOff = binocularsOff
	
	local binoculars = nil
	
	binoculars = LUI.UIImage.new()
	binoculars.id = "binoculars"
	binoculars:setImage( RegisterMaterial( "zm_charms_binoculars" ), 0 )
	binoculars:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 97.57, _1080p * 225.57, _1080p * 99.16, _1080p * 227.16 )
	binoculars:BindAlphaToModel( DataSources.inGame.CP.zombies.questsDLC1.charmBinocularsAlphaFilter:GetModel( f1_local1 ) )
	self:addElement( binoculars )
	self.binoculars = binoculars
	
	return self
end

MenuBuilder.registerType( "charmNecklace", charmNecklace )
LockTable( _M )
