local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function QuestBarDLC4( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 1920 * _1080p, 0, 1080 * _1080p )
	self.id = "QuestBarDLC4"
	self._animationSets = {}
	self._sequences = {}
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local inventoryBacking = nil
	
	inventoryBacking = LUI.UIImage.new()
	inventoryBacking.id = "inventoryBacking"
	inventoryBacking:SetRGBFromInt( 3316021, 0 )
	inventoryBacking:SetAlpha( 0.8, 0 )
	inventoryBacking:setImage( RegisterMaterial( "cp_final_inventory_bg" ), 0 )
	inventoryBacking:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 1920, _1080p * 819.46, _1080p * 1075.46 )
	self:addElement( inventoryBacking )
	self.inventoryBacking = inventoryBacking
	
	local neilGood = nil
	
	neilGood = LUI.UIImage.new()
	neilGood.id = "neilGood"
	neilGood:SetRGBFromInt( 3316021, 0 )
	neilGood:SetAlpha( 0.8, 0 )
	neilGood:SetScale( 1.03, 0 )
	neilGood:setImage( RegisterMaterial( "cp_final_inv_neil_good" ), 0 )
	neilGood:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 78, _1080p * 206, _1080p * 901.46, _1080p * 999.46 )
	self:addElement( neilGood )
	self.neilGood = neilGood
	
	local crogVialFill = nil
	
	crogVialFill = LUI.UIImage.new()
	crogVialFill.id = "crogVialFill"
	crogVialFill:SetAnchors( 0, 1, 1, 0, 0 )
	crogVialFill:SetLeft( _1080p * 1516, 0 )
	crogVialFill:SetRight( _1080p * 1898, 0 )
	crogVialFill:SetBottom( _1080p * -22.51, 0 )
	crogVialFill:SetRGBFromInt( 11053224, 0 )
	crogVialFill:SetAlpha( 0.7, 0 )
	crogVialFill:setImage( RegisterMaterial( "cp_final_inv_venomx_fill" ), 0 )
	crogVialFill:SetUseAA( true )
	crogVialFill:SubscribeToModel( DataSources.inGame.CP.zombies.dlc3.vialFill:GetModel( f1_local1 ), function ()
		local f2_local0 = DataSources.inGame.CP.zombies.dlc3.vialFill:GetValue( f1_local1 )
		if f2_local0 ~= nil then
			crogVialFill:SetTop( _1080p * Add( Multiply( f2_local0, -175 ), -22.5 ), 0 )
		end
	end )
	self:addElement( crogVialFill )
	self.crogVialFill = crogVialFill
	
	local venomX1 = nil
	
	venomX1 = LUI.UIImage.new()
	venomX1.id = "venomX1"
	venomX1:setImage( RegisterMaterial( "cp_final_inv_venomx" ), 0 )
	venomX1:SetBlendMode( BLEND_MODE.addWithAlpha )
	venomX1:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1553, _1080p * 1809, _1080p * 822.46, _1080p * 1078.46 )
	venomX1:BindAlphaToModel( DataSources.inGame.CP.zombies.quests.questArkPinkAlpha:GetModel( f1_local1 ) )
	self:addElement( venomX1 )
	self.venomX1 = venomX1
	
	local film = nil
	
	film = LUI.UIImage.new()
	film.id = "film"
	film:SetScale( -0.3, 0 )
	film:setImage( RegisterMaterial( "cp_final_inv_film_reel" ), 0 )
	film:SetBlendMode( BLEND_MODE.addWithAlpha )
	film:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 679, _1080p * 935, _1080p * 819.46, _1080p * 1075.46 )
	film:BindAlphaToModel( DataSources.inGame.CP.zombies.quests.questArkYellowAlpha:GetModel( f1_local1 ) )
	self:addElement( film )
	self.film = film
	
	local brute = nil
	
	brute = LUI.UIImage.new()
	brute.id = "brute"
	brute:SetScale( -0.3, 0 )
	brute:setImage( RegisterMaterial( "cp_final_inv_brute_helmet" ), 0 )
	brute:SetBlendMode( BLEND_MODE.addWithAlpha )
	brute:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 307, _1080p * 563, _1080p * 815.46, _1080p * 1071.46 )
	brute:BindAlphaToModel( DataSources.inGame.CP.zombies.quests.questArkBlueAlpha:GetModel( f1_local1 ) )
	self:addElement( brute )
	self.brute = brute
	
	local entangler = nil
	
	entangler = LUI.UIImage.new()
	entangler.id = "entangler"
	entangler:SetScale( -0.25, 0 )
	entangler:setImage( RegisterMaterial( "cp_final_inv_entangler" ), 0 )
	entangler:SetBlendMode( BLEND_MODE.addWithAlpha )
	entangler:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 480, _1080p * 736, _1080p * 822.46, _1080p * 1078.46 )
	entangler:BindAlphaToModel( DataSources.inGame.CP.zombies.quests.questArkGreenAlpha:GetModel( f1_local1 ) )
	self:addElement( entangler )
	self.entangler = entangler
	
	local scrap = nil
	
	scrap = LUI.UIImage.new()
	scrap.id = "scrap"
	scrap:SetScale( -0.2, 0 )
	scrap:setImage( RegisterMaterial( "cp_final_inv_scrap_metal" ), 0 )
	scrap:SetBlendMode( BLEND_MODE.addWithAlpha )
	scrap:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 887, _1080p * 1143, _1080p * 819.46, _1080p * 1075.46 )
	scrap:BindAlphaToModel( DataSources.inGame.CP.zombies.quests.questRobotHeadAlpha:GetModel( f1_local1 ) )
	self:addElement( scrap )
	self.scrap = scrap
	
	local floppy = nil
	
	floppy = LUI.UIImage.new()
	floppy.id = "floppy"
	floppy:SetScale( -0.32, 0 )
	floppy:setImage( RegisterMaterial( "cp_final_inv_floppy_disk" ), 0 )
	floppy:SetBlendMode( BLEND_MODE.addWithAlpha )
	floppy:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1077, _1080p * 1333, _1080p * 822.46, _1080p * 1078.46 )
	floppy:BindAlphaToModel( DataSources.inGame.CP.zombies.quests.questWOR1Part1Alpha:GetModel( f1_local1 ) )
	self:addElement( floppy )
	self.floppy = floppy
	
	local neilHead = nil
	
	neilHead = LUI.UIImage.new()
	neilHead.id = "neilHead"
	neilHead:SetScale( -0.3, 0 )
	neilHead:setImage( RegisterMaterial( "cp_final_inv_neil_head" ), 0 )
	neilHead:SetBlendMode( BLEND_MODE.addWithAlpha )
	neilHead:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1280, _1080p * 1536, _1080p * 815.46, _1080p * 1071.46 )
	neilHead:BindAlphaToModel( DataSources.inGame.CP.zombies.quests.questToothAlpha:GetModel( f1_local1 ) )
	self:addElement( neilHead )
	self.neilHead = neilHead
	
	local floppyCount = nil
	
	floppyCount = MenuBuilder.BuildRegisteredType( "floppyCount", {
		controllerIndex = f1_local1
	} )
	floppyCount.id = "floppyCount"
	floppyCount:SetScale( -0.5, 0 )
	floppyCount:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1239.87, _1080p * 1334.13, _1080p * 1019.98, _1080p * 1064.98 )
	floppyCount:BindAlphaToModel( DataSources.inGame.CP.zombies.quests.questWOR1Part2Alpha:GetModel( f1_local1 ) )
	self:addElement( floppyCount )
	self.floppyCount = floppyCount
	
	local scrapCount = nil
	
	scrapCount = MenuBuilder.BuildRegisteredType( "scrapCount", {
		controllerIndex = f1_local1
	} )
	scrapCount.id = "scrapCount"
	scrapCount:SetScale( -0.5, 0 )
	scrapCount:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1034, _1080p * 1128, _1080p * 1019.48, _1080p * 1065.48 )
	scrapCount:BindAlphaToModel( DataSources.inGame.CP.zombies.quests.questRobotHeadAlpha:GetModel( f1_local1 ) )
	self:addElement( scrapCount )
	self.scrapCount = scrapCount
	
	local danger = nil
	
	danger = LUI.UIImage.new()
	danger.id = "danger"
	danger:setImage( RegisterMaterial( "cp_final_inv_neil_danger" ), 0 )
	danger:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 158, _1080p * 414, _1080p * 822.46, _1080p * 886.46 )
	self:addElement( danger )
	self.danger = danger
	
	local venomY = nil
	
	venomY = LUI.UIText.new()
	venomY.id = "venomY"
	venomY:setText( Engine.Localize( "CP_FINAL_VENOMY" ), 0 )
	venomY:SetFontSize( 22 * _1080p )
	venomY:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	venomY:SetAlignment( LUI.Alignment.Left )
	venomY:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1530, _1080p * 1684, _1080p * 858.46, _1080p * 880.46 )
	venomY:BindAlphaToModel( DataSources.inGame.CP.zombies.quests.questArkPinkAlpha:GetModel( f1_local1 ) )
	self:addElement( venomY )
	self.venomY = venomY
	
	local percent = nil
	
	percent = LUI.UIText.new()
	percent.id = "percent"
	percent:SetFontSize( 22 * _1080p )
	percent:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	percent:SetAlignment( LUI.Alignment.Left )
	percent:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1702, _1080p * 1785, _1080p * 858.46, _1080p * 880.46 )
	percent:BindAlphaToModel( DataSources.inGame.CP.zombies.quests.questArkPinkAlpha:GetModel( f1_local1 ) )
	percent:SubscribeToModel( DataSources.inGame.CP.zombies.dlc4.vialFillNumber:GetModel( f1_local1 ), function ()
		local f3_local0 = DataSources.inGame.CP.zombies.dlc4.vialFillNumber:GetValue( f1_local1 )
		if f3_local0 ~= nil then
			percent:setText( f3_local0, 0 )
		end
	end )
	self:addElement( percent )
	self.percent = percent
	
	local glitchLoop = nil
	
	glitchLoop = LUI.UIImage.new()
	glitchLoop.id = "glitchLoop"
	glitchLoop:SetAlpha( 0.8, 0 )
	glitchLoop:setImage( RegisterMaterial( "cp_final_inventory_glitch" ), 0 )
	glitchLoop:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 1920, _1080p * 841.46, _1080p * 1059.46 )
	self:addElement( glitchLoop )
	self.glitchLoop = glitchLoop
	
	self._animationSets.DefaultAnimationSet = function ()
		inventoryBacking:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.inventoryBacking:SetRGBFromInt( 10658466, 0 )
				end
			}
		} )
		neilGood:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.neilGood:SetRGBFromInt( 10658466, 0 )
				end
			},
			{
				function ()
					return self.neilGood:setImage( RegisterMaterial( "cp_final_inv_neil_good" ), 0 )
				end
			},
			{
				function ()
					return self.neilGood:SetAlpha( 0, 0 )
				end
			}
		} )
		crogVialFill:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.crogVialFill:SetRGBFromInt( 10658466, 0 )
				end
			}
		} )
		venomX1:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.venomX1:SetRGBFromInt( 10658466, 0 )
				end
			},
			{
				function ()
					return self.venomX1:SetYRotation( 0, 0 )
				end
			}
		} )
		film:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.film:SetRGBFromInt( 10658466, 0 )
				end
			}
		} )
		brute:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.brute:SetRGBFromInt( 10658466, 0 )
				end
			}
		} )
		entangler:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.entangler:SetRGBFromInt( 10658466, 0 )
				end
			}
		} )
		scrap:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.scrap:SetRGBFromInt( 10658466, 0 )
				end
			}
		} )
		floppy:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.floppy:SetRGBFromInt( 10658466, 0 )
				end
			}
		} )
		neilHead:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.neilHead:SetRGBFromInt( 10658466, 0 )
				end
			}
		} )
		floppyCount:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.floppyCount:SetRGBFromInt( 10658466, 0 )
				end
			}
		} )
		scrapCount:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.scrapCount:SetRGBFromInt( 10658466, 0 )
				end
			}
		} )
		danger:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.danger:SetAlpha( 0, 0 )
				end
			}
		} )
		venomY:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.venomY:SetRGBFromInt( 10658466, 0 )
				end
			}
		} )
		percent:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.percent:SetRGBFromInt( 10658466, 0 )
				end
			}
		} )
		glitchLoop:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.glitchLoop:SetRGBFromInt( 10658466, 0 )
				end
			}
		} )
		self._sequences.DefaultSequence = function ()
			inventoryBacking:AnimateSequence( "DefaultSequence" )
			neilGood:AnimateSequence( "DefaultSequence" )
			crogVialFill:AnimateSequence( "DefaultSequence" )
			venomX1:AnimateSequence( "DefaultSequence" )
			film:AnimateSequence( "DefaultSequence" )
			brute:AnimateSequence( "DefaultSequence" )
			entangler:AnimateSequence( "DefaultSequence" )
			scrap:AnimateSequence( "DefaultSequence" )
			floppy:AnimateSequence( "DefaultSequence" )
			neilHead:AnimateSequence( "DefaultSequence" )
			floppyCount:AnimateSequence( "DefaultSequence" )
			scrapCount:AnimateSequence( "DefaultSequence" )
			danger:AnimateSequence( "DefaultSequence" )
			venomY:AnimateSequence( "DefaultSequence" )
			percent:AnimateSequence( "DefaultSequence" )
			glitchLoop:AnimateSequence( "DefaultSequence" )
		end
		
		brute:RegisterAnimationSequence( "bruteFound", {
			{
				function ()
					return self.brute:SetScale( -0.3, 0 )
				end,
				function ()
					return self.brute:SetScale( 0, 250 )
				end,
				function ()
					return self.brute:SetScale( -0.3, 250 )
				end,
				function ()
					return self.brute:SetScale( -0.1, 250 )
				end,
				function ()
					return self.brute:SetScale( -0.3, 250 )
				end,
				function ()
					return self.brute:SetScale( -0.2, 250 )
				end,
				function ()
					return self.brute:SetScale( -0.3, 250 )
				end
			}
		} )
		self._sequences.bruteFound = function ()
			brute:AnimateSequence( "bruteFound" )
		end
		
		entangler:RegisterAnimationSequence( "entanglerFound", {
			{
				function ()
					return self.entangler:SetScale( -0.25, 0 )
				end,
				function ()
					return self.entangler:SetScale( 0.05, 250 )
				end,
				function ()
					return self.entangler:SetScale( -0.25, 250 )
				end,
				function ()
					return self.entangler:SetScale( -0.05, 250 )
				end,
				function ()
					return self.entangler:SetScale( -0.25, 250 )
				end,
				function ()
					return self.entangler:SetScale( -0.15, 250 )
				end,
				function ()
					return self.entangler:SetScale( -0.25, 250 )
				end
			}
		} )
		self._sequences.entanglerFound = function ()
			entangler:AnimateSequence( "entanglerFound" )
		end
		
		film:RegisterAnimationSequence( "filmFound", {
			{
				function ()
					return self.film:SetScale( -0.3, 0 )
				end,
				function ()
					return self.film:SetScale( 0, 250 )
				end,
				function ()
					return self.film:SetScale( -0.3, 250 )
				end,
				function ()
					return self.film:SetScale( -0.1, 250 )
				end,
				function ()
					return self.film:SetScale( -0.3, 250 )
				end,
				function ()
					return self.film:SetScale( -0.2, 250 )
				end,
				function ()
					return self.film:SetScale( -0.3, 250 )
				end
			}
		} )
		self._sequences.filmFound = function ()
			film:AnimateSequence( "filmFound" )
		end
		
		scrap:RegisterAnimationSequence( "scrapFound", {
			{
				function ()
					return self.scrap:SetScale( -0.2, 0 )
				end,
				function ()
					return self.scrap:SetScale( 0.1, 250 )
				end,
				function ()
					return self.scrap:SetScale( -0.2, 250 )
				end,
				function ()
					return self.scrap:SetScale( 0, 250 )
				end,
				function ()
					return self.scrap:SetScale( -0.2, 250 )
				end,
				function ()
					return self.scrap:SetScale( -0.1, 250 )
				end,
				function ()
					return self.scrap:SetScale( -0.2, 250 )
				end
			}
		} )
		self._sequences.scrapFound = function ()
			scrap:AnimateSequence( "scrapFound" )
		end
		
		floppy:RegisterAnimationSequence( "floppyFound", {
			{
				function ()
					return self.floppy:SetScale( -0.32, 0 )
				end,
				function ()
					return self.floppy:SetScale( -0.02, 250 )
				end,
				function ()
					return self.floppy:SetScale( -0.32, 250 )
				end,
				function ()
					return self.floppy:SetScale( -0.12, 250 )
				end,
				function ()
					return self.floppy:SetScale( -0.32, 250 )
				end,
				function ()
					return self.floppy:SetScale( -0.22, 250 )
				end,
				function ()
					return self.floppy:SetScale( -0.32, 250 )
				end
			}
		} )
		self._sequences.floppyFound = function ()
			floppy:AnimateSequence( "floppyFound" )
		end
		
		neilHead:RegisterAnimationSequence( "headFound", {
			{
				function ()
					return self.neilHead:SetScale( -0.3, 0 )
				end,
				function ()
					return self.neilHead:SetScale( 0, 250 )
				end,
				function ()
					return self.neilHead:SetScale( -0.3, 250 )
				end,
				function ()
					return self.neilHead:SetScale( -0.1, 250 )
				end,
				function ()
					return self.neilHead:SetScale( -0.3, 250 )
				end,
				function ()
					return self.neilHead:SetScale( -0.2, 250 )
				end,
				function ()
					return self.neilHead:SetScale( -0.3, 250 )
				end
			}
		} )
		self._sequences.headFound = function ()
			neilHead:AnimateSequence( "headFound" )
		end
		
		venomX1:RegisterAnimationSequence( "venomxFound", {
			{
				function ()
					return self.venomX1:SetScale( 0, 0 )
				end,
				function ()
					return self.venomX1:SetScale( 0.25, 250 )
				end,
				function ()
					return self.venomX1:SetScale( 0, 250 )
				end,
				function ()
					return self.venomX1:SetScale( 0.2, 250 )
				end,
				function ()
					return self.venomX1:SetScale( 0, 250 )
				end,
				function ()
					return self.venomX1:SetScale( 0.1, 250 )
				end,
				function ()
					return self.venomX1:SetScale( 0, 250 )
				end
			}
		} )
		self._sequences.venomxFound = function ()
			venomX1:AnimateSequence( "venomxFound" )
		end
		
		inventoryBacking:RegisterAnimationSequence( "neilGoodAnim", {
			{
				function ()
					return self.inventoryBacking:SetRGBFromInt( 2858283, 0 )
				end
			}
		} )
		neilGood:RegisterAnimationSequence( "neilGoodAnim", {
			{
				function ()
					return self.neilGood:SetRGBFromInt( 2858283, 0 )
				end
			},
			{
				function ()
					return self.neilGood:setImage( RegisterMaterial( "cp_final_inv_neil_good" ), 0 )
				end
			},
			{
				function ()
					return self.neilGood:SetAlpha( 0.8, 0 )
				end
			}
		} )
		crogVialFill:RegisterAnimationSequence( "neilGoodAnim", {
			{
				function ()
					return self.crogVialFill:SetRGBFromInt( 2858283, 0 )
				end
			}
		} )
		venomX1:RegisterAnimationSequence( "neilGoodAnim", {
			{
				function ()
					return self.venomX1:SetRGBFromInt( 2858283, 0 )
				end
			}
		} )
		film:RegisterAnimationSequence( "neilGoodAnim", {
			{
				function ()
					return self.film:SetRGBFromInt( 2858283, 0 )
				end
			}
		} )
		brute:RegisterAnimationSequence( "neilGoodAnim", {
			{
				function ()
					return self.brute:SetRGBFromInt( 2858283, 0 )
				end
			}
		} )
		entangler:RegisterAnimationSequence( "neilGoodAnim", {
			{
				function ()
					return self.entangler:SetRGBFromInt( 2858283, 0 )
				end
			}
		} )
		scrap:RegisterAnimationSequence( "neilGoodAnim", {
			{
				function ()
					return self.scrap:SetRGBFromInt( 2858283, 0 )
				end
			}
		} )
		floppy:RegisterAnimationSequence( "neilGoodAnim", {
			{
				function ()
					return self.floppy:SetRGBFromInt( 2858283, 0 )
				end
			}
		} )
		neilHead:RegisterAnimationSequence( "neilGoodAnim", {
			{
				function ()
					return self.neilHead:SetRGBFromInt( 2858283, 0 )
				end
			}
		} )
		floppyCount:RegisterAnimationSequence( "neilGoodAnim", {
			{
				function ()
					return self.floppyCount:SetRGBFromInt( 2858283, 0 )
				end
			}
		} )
		scrapCount:RegisterAnimationSequence( "neilGoodAnim", {
			{
				function ()
					return self.scrapCount:SetRGBFromInt( 2858283, 0 )
				end
			}
		} )
		danger:RegisterAnimationSequence( "neilGoodAnim", {
			{
				function ()
					return self.danger:SetAlpha( 0, 0 )
				end
			}
		} )
		venomY:RegisterAnimationSequence( "neilGoodAnim", {
			{
				function ()
					return self.venomY:SetRGBFromInt( 2858283, 0 )
				end
			}
		} )
		percent:RegisterAnimationSequence( "neilGoodAnim", {
			{
				function ()
					return self.percent:SetRGBFromInt( 2858283, 0 )
				end
			}
		} )
		glitchLoop:RegisterAnimationSequence( "neilGoodAnim", {
			{
				function ()
					return self.glitchLoop:SetRGBFromInt( 2858283, 0 )
				end
			}
		} )
		self._sequences.neilGoodAnim = function ()
			inventoryBacking:AnimateSequence( "neilGoodAnim" )
			neilGood:AnimateSequence( "neilGoodAnim" )
			crogVialFill:AnimateSequence( "neilGoodAnim" )
			venomX1:AnimateSequence( "neilGoodAnim" )
			film:AnimateSequence( "neilGoodAnim" )
			brute:AnimateSequence( "neilGoodAnim" )
			entangler:AnimateSequence( "neilGoodAnim" )
			scrap:AnimateSequence( "neilGoodAnim" )
			floppy:AnimateSequence( "neilGoodAnim" )
			neilHead:AnimateSequence( "neilGoodAnim" )
			floppyCount:AnimateSequence( "neilGoodAnim" )
			scrapCount:AnimateSequence( "neilGoodAnim" )
			danger:AnimateSequence( "neilGoodAnim" )
			venomY:AnimateSequence( "neilGoodAnim" )
			percent:AnimateSequence( "neilGoodAnim" )
			glitchLoop:AnimateSequence( "neilGoodAnim" )
		end
		
		inventoryBacking:RegisterAnimationSequence( "neilEvilAnim", {
			{
				function ()
					return self.inventoryBacking:SetRGBFromInt( 13905187, 0 )
				end
			}
		} )
		neilGood:RegisterAnimationSequence( "neilEvilAnim", {
			{
				function ()
					return self.neilGood:SetRGBFromInt( 13905187, 0 )
				end
			},
			{
				function ()
					return self.neilGood:setImage( RegisterMaterial( "cp_final_inv_neil_evil" ), 0 )
				end
			},
			{
				function ()
					return self.neilGood:SetAlpha( 0.8, 0 )
				end
			}
		} )
		crogVialFill:RegisterAnimationSequence( "neilEvilAnim", {
			{
				function ()
					return self.crogVialFill:SetRGBFromInt( 13905187, 0 )
				end
			}
		} )
		venomX1:RegisterAnimationSequence( "neilEvilAnim", {
			{
				function ()
					return self.venomX1:SetRGBFromInt( 13905187, 0 )
				end
			}
		} )
		film:RegisterAnimationSequence( "neilEvilAnim", {
			{
				function ()
					return self.film:SetRGBFromInt( 13905187, 0 )
				end
			}
		} )
		brute:RegisterAnimationSequence( "neilEvilAnim", {
			{
				function ()
					return self.brute:SetRGBFromInt( 13905187, 0 )
				end
			}
		} )
		entangler:RegisterAnimationSequence( "neilEvilAnim", {
			{
				function ()
					return self.entangler:SetRGBFromInt( 13905187, 0 )
				end
			}
		} )
		scrap:RegisterAnimationSequence( "neilEvilAnim", {
			{
				function ()
					return self.scrap:SetRGBFromInt( 13905187, 0 )
				end
			}
		} )
		floppy:RegisterAnimationSequence( "neilEvilAnim", {
			{
				function ()
					return self.floppy:SetRGBFromInt( 13905187, 0 )
				end
			}
		} )
		neilHead:RegisterAnimationSequence( "neilEvilAnim", {
			{
				function ()
					return self.neilHead:SetRGBFromInt( 13905187, 0 )
				end
			}
		} )
		floppyCount:RegisterAnimationSequence( "neilEvilAnim", {
			{
				function ()
					return self.floppyCount:SetRGBFromInt( 13905187, 0 )
				end
			}
		} )
		scrapCount:RegisterAnimationSequence( "neilEvilAnim", {
			{
				function ()
					return self.scrapCount:SetRGBFromInt( 13905187, 0 )
				end
			}
		} )
		danger:RegisterAnimationSequence( "neilEvilAnim", {
			{
				function ()
					return self.danger:SetRGBFromInt( 13905187, 0 )
				end
			}
		} )
		venomY:RegisterAnimationSequence( "neilEvilAnim", {
			{
				function ()
					return self.venomY:SetRGBFromInt( 13905187, 0 )
				end
			}
		} )
		percent:RegisterAnimationSequence( "neilEvilAnim", {
			{
				function ()
					return self.percent:SetRGBFromInt( 13905187, 0 )
				end
			}
		} )
		glitchLoop:RegisterAnimationSequence( "neilEvilAnim", {
			{
				function ()
					return self.glitchLoop:SetRGBFromInt( 13905187, 0 )
				end
			}
		} )
		self._sequences.neilEvilAnim = function ()
			inventoryBacking:AnimateSequence( "neilEvilAnim" )
			neilGood:AnimateSequence( "neilEvilAnim" )
			crogVialFill:AnimateSequence( "neilEvilAnim" )
			venomX1:AnimateSequence( "neilEvilAnim" )
			film:AnimateSequence( "neilEvilAnim" )
			brute:AnimateSequence( "neilEvilAnim" )
			entangler:AnimateSequence( "neilEvilAnim" )
			scrap:AnimateSequence( "neilEvilAnim" )
			floppy:AnimateSequence( "neilEvilAnim" )
			neilHead:AnimateSequence( "neilEvilAnim" )
			floppyCount:AnimateSequence( "neilEvilAnim" )
			scrapCount:AnimateSequence( "neilEvilAnim" )
			danger:AnimateSequence( "neilEvilAnim" )
			venomY:AnimateSequence( "neilEvilAnim" )
			percent:AnimateSequence( "neilEvilAnim" )
			glitchLoop:AnimateSequence( "neilEvilAnim" )
		end
		
		inventoryBacking:RegisterAnimationSequence( "neilNeutralAnim", {
			{
				function ()
					return self.inventoryBacking:SetRGBFromInt( 15979037, 0 )
				end
			}
		} )
		neilGood:RegisterAnimationSequence( "neilNeutralAnim", {
			{
				function ()
					return self.neilGood:SetRGBFromInt( 15979037, 0 )
				end
			},
			{
				function ()
					return self.neilGood:setImage( RegisterMaterial( "cp_final_inv_neil_o_face" ), 0 )
				end
			},
			{
				function ()
					return self.neilGood:SetAlpha( 0.8, 0 )
				end
			}
		} )
		crogVialFill:RegisterAnimationSequence( "neilNeutralAnim", {
			{
				function ()
					return self.crogVialFill:SetRGBFromInt( 15979037, 0 )
				end
			}
		} )
		venomX1:RegisterAnimationSequence( "neilNeutralAnim", {
			{
				function ()
					return self.venomX1:SetRGBFromInt( 15979037, 0 )
				end
			}
		} )
		film:RegisterAnimationSequence( "neilNeutralAnim", {
			{
				function ()
					return self.film:SetRGBFromInt( 15979037, 0 )
				end
			}
		} )
		brute:RegisterAnimationSequence( "neilNeutralAnim", {
			{
				function ()
					return self.brute:SetRGBFromInt( 15979037, 0 )
				end
			}
		} )
		entangler:RegisterAnimationSequence( "neilNeutralAnim", {
			{
				function ()
					return self.entangler:SetRGBFromInt( 15979037, 0 )
				end
			}
		} )
		scrap:RegisterAnimationSequence( "neilNeutralAnim", {
			{
				function ()
					return self.scrap:SetRGBFromInt( 15979037, 0 )
				end
			}
		} )
		floppy:RegisterAnimationSequence( "neilNeutralAnim", {
			{
				function ()
					return self.floppy:SetRGBFromInt( 15979037, 0 )
				end
			}
		} )
		neilHead:RegisterAnimationSequence( "neilNeutralAnim", {
			{
				function ()
					return self.neilHead:SetRGBFromInt( 15979037, 0 )
				end
			}
		} )
		floppyCount:RegisterAnimationSequence( "neilNeutralAnim", {
			{
				function ()
					return self.floppyCount:SetRGBFromInt( 15979037, 0 )
				end
			}
		} )
		scrapCount:RegisterAnimationSequence( "neilNeutralAnim", {
			{
				function ()
					return self.scrapCount:SetRGBFromInt( 15979037, 0 )
				end
			}
		} )
		danger:RegisterAnimationSequence( "neilNeutralAnim", {
			{
				function ()
					return self.danger:SetAlpha( 0, 0 )
				end
			}
		} )
		venomY:RegisterAnimationSequence( "neilNeutralAnim", {
			{
				function ()
					return self.venomY:SetRGBFromInt( 15979037, 0 )
				end
			}
		} )
		percent:RegisterAnimationSequence( "neilNeutralAnim", {
			{
				function ()
					return self.percent:SetRGBFromInt( 15979037, 0 )
				end
			}
		} )
		glitchLoop:RegisterAnimationSequence( "neilNeutralAnim", {
			{
				function ()
					return self.glitchLoop:SetRGBFromInt( 15979037, 0 )
				end
			}
		} )
		self._sequences.neilNeutralAnim = function ()
			inventoryBacking:AnimateSequence( "neilNeutralAnim" )
			neilGood:AnimateSequence( "neilNeutralAnim" )
			crogVialFill:AnimateSequence( "neilNeutralAnim" )
			venomX1:AnimateSequence( "neilNeutralAnim" )
			film:AnimateSequence( "neilNeutralAnim" )
			brute:AnimateSequence( "neilNeutralAnim" )
			entangler:AnimateSequence( "neilNeutralAnim" )
			scrap:AnimateSequence( "neilNeutralAnim" )
			floppy:AnimateSequence( "neilNeutralAnim" )
			neilHead:AnimateSequence( "neilNeutralAnim" )
			floppyCount:AnimateSequence( "neilNeutralAnim" )
			scrapCount:AnimateSequence( "neilNeutralAnim" )
			danger:AnimateSequence( "neilNeutralAnim" )
			venomY:AnimateSequence( "neilNeutralAnim" )
			percent:AnimateSequence( "neilNeutralAnim" )
			glitchLoop:AnimateSequence( "neilNeutralAnim" )
		end
		
		danger:RegisterAnimationSequence( "dangerFlash", {
			{
				function ()
					return self.danger:SetAlpha( 0, 0 )
				end,
				function ()
					return self.danger:SetAlpha( 1, 1000 )
				end,
				function ()
					return self.danger:SetAlpha( 0, 1000 )
				end
			},
			{
				function ()
					return self.danger:SetRGBFromInt( 13108485, 0 )
				end
			}
		} )
		self._sequences.dangerFlash = function ()
			danger:AnimateLoop( "dangerFlash" )
		end
		
		venomX1:RegisterAnimationSequence( "venomZState", {
			{
				function ()
					return self.venomX1:SetYRotation( -180, 0 )
				end
			}
		} )
		venomY:RegisterAnimationSequence( "venomZState", {
			{
				function ()
					return self.venomY:setText( Engine.Localize( "CP_FINAL_VENOMZ" ), 0 )
				end
			}
		} )
		self._sequences.venomZState = function ()
			venomX1:AnimateSequence( "venomZState" )
			venomY:AnimateSequence( "venomZState" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	self:SubscribeToModel( DataSources.inGame.CP.zombies.quests.questArkBlueAlpha:GetModel( f1_local1 ), function ()
		if DataSources.inGame.CP.zombies.quests.questArkBlueAlpha:GetValue( f1_local1 ) ~= nil and DataSources.inGame.CP.zombies.quests.questArkBlueAlpha:GetValue( f1_local1 ) == 1 then
			ACTIONS.AnimateSequence( self, "bruteFound" )
		end
	end )
	self:SubscribeToModel( DataSources.inGame.CP.zombies.quests.questArkGreenAlpha:GetModel( f1_local1 ), function ()
		if DataSources.inGame.CP.zombies.quests.questArkGreenAlpha:GetValue( f1_local1 ) ~= nil and DataSources.inGame.CP.zombies.quests.questArkGreenAlpha:GetValue( f1_local1 ) == 1 then
			ACTIONS.AnimateSequence( self, "entanglerFound" )
		end
	end )
	self:SubscribeToModel( DataSources.inGame.CP.zombies.quests.questArkYellowAlpha:GetModel( f1_local1 ), function ()
		if DataSources.inGame.CP.zombies.quests.questArkYellowAlpha:GetValue( f1_local1 ) ~= nil and DataSources.inGame.CP.zombies.quests.questArkYellowAlpha:GetValue( f1_local1 ) == 1 then
			ACTIONS.AnimateSequence( self, "filmFound" )
		end
	end )
	self:SubscribeToModel( DataSources.inGame.CP.zombies.quests.questArkPinkAlpha:GetModel( f1_local1 ), function ()
		if DataSources.inGame.CP.zombies.quests.questArkPinkAlpha:GetValue( f1_local1 ) ~= nil and DataSources.inGame.CP.zombies.quests.questArkPinkAlpha:GetValue( f1_local1 ) == 1 then
			ACTIONS.AnimateSequence( self, "venomxFound" )
		end
	end )
	self:SubscribeToModel( DataSources.inGame.CP.zombies.quests.questToothAlpha:GetModel( f1_local1 ), function ()
		if DataSources.inGame.CP.zombies.quests.questToothAlpha:GetValue( f1_local1 ) ~= nil and DataSources.inGame.CP.zombies.quests.questToothAlpha:GetValue( f1_local1 ) == 1 then
			ACTIONS.AnimateSequence( self, "headFound" )
		end
	end )
	self:SubscribeToModel( DataSources.inGame.CP.zombies.quests.questRobotHeadAlpha:GetModel( f1_local1 ), function ()
		if DataSources.inGame.CP.zombies.quests.questRobotHeadAlpha:GetValue( f1_local1 ) ~= nil and DataSources.inGame.CP.zombies.quests.questRobotHeadAlpha:GetValue( f1_local1 ) == 1 then
			ACTIONS.AnimateSequence( self, "scrapFound" )
		end
	end )
	self:SubscribeToModel( DataSources.inGame.CP.zombies.quests.questRobotBatteryAlpha:GetModel( f1_local1 ), function ()
		if DataSources.inGame.CP.zombies.quests.questRobotBatteryAlpha:GetValue( f1_local1 ) ~= nil and DataSources.inGame.CP.zombies.quests.questRobotBatteryAlpha:GetValue( f1_local1 ) == 1 then
			ACTIONS.AnimateSequence( self, "scrapFound" )
		end
	end )
	self:SubscribeToModel( DataSources.inGame.CP.zombies.quests.questRobotFloppyAlpha:GetModel( f1_local1 ), function ()
		if DataSources.inGame.CP.zombies.quests.questRobotFloppyAlpha:GetValue( f1_local1 ) ~= nil and DataSources.inGame.CP.zombies.quests.questRobotFloppyAlpha:GetValue( f1_local1 ) == 1 then
			ACTIONS.AnimateSequence( self, "scrapFound" )
		end
	end )
	self:SubscribeToModel( DataSources.inGame.CP.zombies.quests.questWOR1Part1Alpha:GetModel( f1_local1 ), function ()
		if DataSources.inGame.CP.zombies.quests.questWOR1Part1Alpha:GetValue( f1_local1 ) ~= nil and DataSources.inGame.CP.zombies.quests.questWOR1Part1Alpha:GetValue( f1_local1 ) == 1 then
			ACTIONS.AnimateSequence( self, "floppyFound" )
		end
	end )
	self:SubscribeToModel( DataSources.inGame.CP.zombies.dlc4.neilState:GetModel( f1_local1 ), function ()
		if DataSources.inGame.CP.zombies.dlc4.neilState:GetValue( f1_local1 ) ~= nil and DataSources.inGame.CP.zombies.dlc4.neilState:GetValue( f1_local1 ) == 3 then
			ACTIONS.AnimateSequence( self, "neilEvilAnim" )
			ACTIONS.AnimateSequence( self, "dangerFlash" )
		end
		if DataSources.inGame.CP.zombies.dlc4.neilState:GetValue( f1_local1 ) ~= nil and DataSources.inGame.CP.zombies.dlc4.neilState:GetValue( f1_local1 ) == 1 then
			ACTIONS.AnimateSequence( self, "neilGoodAnim" )
		end
		if DataSources.inGame.CP.zombies.dlc4.neilState:GetValue( f1_local1 ) ~= nil and DataSources.inGame.CP.zombies.dlc4.neilState:GetValue( f1_local1 ) == 2 then
			ACTIONS.AnimateSequence( self, "neilNeutralAnim" )
		end
		if DataSources.inGame.CP.zombies.dlc4.neilState:GetValue( f1_local1 ) ~= nil and DataSources.inGame.CP.zombies.dlc4.neilState:GetValue( f1_local1 ) == 0 then
			ACTIONS.AnimateSequence( self, "DefaultSequence" )
		end
	end )
	self:SubscribeToModel( DataSources.inGame.CP.zombies.dlc4.venomxState:GetModel( f1_local1 ), function ()
		if DataSources.inGame.CP.zombies.dlc4.venomxState:GetValue( f1_local1 ) ~= nil and DataSources.inGame.CP.zombies.dlc4.venomxState:GetValue( f1_local1 ) == 1 then
			ACTIONS.AnimateSequence( self, "venomZState" )
		end
	end )
	ACTIONS.AnimateSequence( self, "DefaultSequence" )
	return self
end

MenuBuilder.registerType( "QuestBarDLC4", QuestBarDLC4 )
LockTable( _M )
