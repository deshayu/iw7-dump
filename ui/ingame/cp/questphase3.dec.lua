local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function questPhase3( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 1920 * _1080p, 0, 315 * _1080p )
	self.id = "questPhase3"
	self._animationSets = {}
	self._sequences = {}
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local InventoryBar = nil
	
	InventoryBar = LUI.UIImage.new()
	InventoryBar.id = "InventoryBar"
	InventoryBar:setImage( RegisterMaterial( "cp_town_inventory_bar" ), 0 )
	InventoryBar:SetUseAA( true )
	InventoryBar:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -63, _1080p * 1985, _1080p * -182.68, _1080p * 329.32 )
	self:addElement( InventoryBar )
	self.InventoryBar = InventoryBar
	
	local elvira = nil
	
	elvira = LUI.UIImage.new()
	elvira.id = "elvira"
	elvira:setImage( RegisterMaterial( "cp_town_inv_elvira" ), 0 )
	elvira:SetUseAA( true )
	elvira:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1014.02, _1080p * 1497.73, _1080p * 63.32, _1080p * 310.32 )
	elvira:BindAlphaToModel( DataSources.inGame.CP.zombies.questsDLC1.harpoonQuestCompleteAlphaFilter:GetModel( f1_local1 ) )
	self:addElement( elvira )
	self.elvira = elvira
	
	local bomb1 = nil
	
	bomb1 = LUI.UIImage.new()
	bomb1.id = "bomb1"
	bomb1:SetScale( -0.48, 0 )
	bomb1:setImage( RegisterMaterial( "cp_town_inv_bomb_3" ), 0 )
	bomb1:SetUseAA( true )
	bomb1:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 976.75, _1080p * 1104.75, _1080p * -12.68, _1080p * 115.32 )
	bomb1:BindAlphaToModel( DataSources.inGame.CP.zombies.quests.questWOR3Part1Alpha:GetModel( f1_local1 ) )
	self:addElement( bomb1 )
	self.bomb1 = bomb1
	
	local bomb2 = nil
	
	bomb2 = LUI.UIImage.new()
	bomb2.id = "bomb2"
	bomb2:SetZRotation( -23, 0 )
	bomb2:SetScale( -0.43, 0 )
	bomb2:setImage( RegisterMaterial( "cp_town_inv_bomb_1" ), 0 )
	bomb2:SetUseAA( true )
	bomb2:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1053.75, _1080p * 1181.75, _1080p * -14.68, _1080p * 113.32 )
	bomb2:BindAlphaToModel( DataSources.inGame.CP.zombies.quests.questWOR3Part2Alpha:GetModel( f1_local1 ) )
	self:addElement( bomb2 )
	self.bomb2 = bomb2
	
	local bomb3 = nil
	
	bomb3 = LUI.UIImage.new()
	bomb3.id = "bomb3"
	bomb3:SetScale( -0.47, 0 )
	bomb3:setImage( RegisterMaterial( "cp_town_inv_bomb_2" ), 0 )
	bomb3:SetUseAA( true )
	bomb3:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1127.35, _1080p * 1255.35, _1080p * -16.68, _1080p * 111.32 )
	bomb3:BindAlphaToModel( DataSources.inGame.CP.zombies.quests.questWOR3Part3Alpha:GetModel( f1_local1 ) )
	self:addElement( bomb3 )
	self.bomb3 = bomb3
	
	local nuclearLabel = nil
	
	nuclearLabel = LUI.UIImage.new()
	nuclearLabel.id = "nuclearLabel"
	nuclearLabel:setImage( RegisterMaterial( "cp_town_inv_code" ), 0 )
	nuclearLabel:SetUseAA( true )
	nuclearLabel:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1238.73, _1080p * 1494.73, _1080p * 11.82, _1080p * 75.82 )
	self:addElement( nuclearLabel )
	self.nuclearLabel = nuclearLabel
	
	local NuclearCode = nil
	
	NuclearCode = LUI.UIText.new()
	NuclearCode.id = "NuclearCode"
	NuclearCode:SetRGBFromInt( 0, 0 )
	NuclearCode:SetZRotation( 3, 0 )
	NuclearCode:SetFontSize( 55 * _1080p )
	NuclearCode:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	NuclearCode:setTextStyle( CoD.TextStyle.Shadowed )
	NuclearCode:SetAlignment( LUI.Alignment.Center )
	NuclearCode:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1285.18, _1080p * 1448.28, _1080p * 14.32, _1080p * 69.32 )
	NuclearCode:BindAlphaToModel( DataSources.inGame.CP.zombies.quests.questWOR4Part1Alpha:GetModel( f1_local1 ) )
	NuclearCode:SubscribeToModel( DataSources.inGame.CP.zombies.dlc3.bombFullNuclearCode:GetModel( f1_local1 ), function ()
		local f2_local0 = DataSources.inGame.CP.zombies.dlc3.bombFullNuclearCode:GetValue( f1_local1 )
		if f2_local0 ~= nil then
			NuclearCode:setText( f2_local0, 0 )
		end
	end )
	self:addElement( NuclearCode )
	self.NuclearCode = NuclearCode
	
	local page1 = nil
	
	page1 = LUI.UIImage.new()
	page1.id = "page1"
	page1:setImage( RegisterMaterial( "cp_town_inv_elvira_page1" ), 0 )
	page1:SetUseAA( true )
	page1:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1186.72, _1080p * 1314.72, _1080p * 87.32, _1080p * 215.32 )
	page1:BindAlphaToModel( DataSources.inGame.CP.zombies.quests.questRecorderPart2Alpha:GetModel( f1_local1 ) )
	self:addElement( page1 )
	self.page1 = page1
	
	local page2 = nil
	
	page2 = LUI.UIImage.new()
	page2.id = "page2"
	page2:setImage( RegisterMaterial( "cp_town_inv_elvira_page2" ), 0 )
	page2:SetUseAA( true )
	page2:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1350.73, _1080p * 1469.73, _1080p * 120, _1080p * 248 )
	page2:BindAlphaToModel( DataSources.inGame.CP.zombies.quests.questWOR4Part3Alpha:GetModel( f1_local1 ) )
	self:addElement( page2 )
	self.page2 = page2
	
	local book = nil
	
	book = LUI.UIImage.new()
	book.id = "book"
	book:setImage( RegisterMaterial( "cp_town_inv_elvira_book" ), 0 )
	book:SetUseAA( true )
	book:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1282.18, _1080p * 1385.18, _1080p * 102.07, _1080p * 230.07 )
	book:BindAlphaToModel( DataSources.inGame.CP.zombies.quests.questWOR4Part2Alpha:GetModel( f1_local1 ) )
	self:addElement( book )
	self.book = book
	
	local kaboom = nil
	
	kaboom = LUI.UIImage.new()
	kaboom.id = "kaboom"
	kaboom:setImage( RegisterMaterial( "cp_town_inv_kaboom" ), 0 )
	kaboom:SetUseAA( true )
	kaboom:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1494.73, _1080p * 2006.73, _1080p * -98.68, _1080p * 413.32 )
	kaboom:BindAlphaToModel( DataSources.inGame.CP.zombies.questsDLC1.jayQuestCompleteAlphaFilter:GetModel( f1_local1 ) )
	self:addElement( kaboom )
	self.kaboom = kaboom
	
	local crogVial = nil
	
	crogVial = LUI.UIImage.new()
	crogVial.id = "crogVial"
	crogVial:setImage( RegisterMaterial( "cp_town_inv_testtube" ), 0 )
	crogVial:SetUseAA( true )
	crogVial:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1437.73, _1080p * 1693.73, _1080p * -98.5, _1080p * 413.5 )
	crogVial:BindAlphaToModel( DataSources.inGame.CP.zombies.quests.questRecorderPart1Alpha:GetModel( f1_local1 ) )
	self:addElement( crogVial )
	self.crogVial = crogVial
	
	local crogVialFill = nil
	
	crogVialFill = LUI.UIImage.new()
	crogVialFill.id = "crogVialFill"
	crogVialFill:SetAnchors( 0, 1, 1, 0, 0 )
	crogVialFill:SetLeft( _1080p * 1528.3, 0 )
	crogVialFill:SetRight( _1080p * 1562.73, 0 )
	crogVialFill:SetBottom( _1080p * -65, 0 )
	crogVialFill:SetRGBFromInt( 2301728, 0 )
	crogVialFill:SetUseAA( true )
	crogVialFill:SubscribeToModel( DataSources.inGame.CP.zombies.dlc3.vialFill:GetModel( f1_local1 ), function ()
		local f3_local0 = DataSources.inGame.CP.zombies.dlc3.vialFill:GetValue( f1_local1 )
		if f3_local0 ~= nil then
			crogVialFill:SetTop( _1080p * Add( Multiply( f3_local0, -137 ), -65 ), 0 )
		end
	end )
	crogVialFill:BindAlphaToModel( DataSources.inGame.CP.zombies.quests.questRecorderPart1Alpha:GetModel( f1_local1 ) )
	self:addElement( crogVialFill )
	self.crogVialFill = crogVialFill
	
	local rectangle = nil
	
	rectangle = LUI.UIImage.new()
	rectangle.id = "rectangle"
	rectangle:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1532.58, _1080p * 1538.58, _1080p * 114.32, _1080p * 244.32 )
	rectangle:BindAlphaToModel( DataSources.inGame.CP.zombies.quests.questRecorderPart1Alpha:GetModel( f1_local1 ) )
	self:addElement( rectangle )
	self.rectangle = rectangle
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		bomb1:RegisterAnimationSequence( "bomb1Found", {
			{
				function ()
					return self.bomb1:SetScale( -0.48, 0 )
				end,
				function ()
					return self.bomb1:SetScale( -0.15, 250 )
				end,
				function ()
					return self.bomb1:SetScale( -0.48, 250 )
				end,
				function ()
					return self.bomb1:SetScale( -0.3, 250 )
				end,
				function ()
					return self.bomb1:SetScale( -0.48, 250 )
				end,
				function ()
					return self.bomb1:SetScale( -0.4, 250 )
				end,
				function ()
					return self.bomb1:SetScale( -0.48, 250 )
				end
			}
		} )
		self._sequences.bomb1Found = function ()
			bomb1:AnimateSequence( "bomb1Found" )
		end
		
		bomb2:RegisterAnimationSequence( "bomb2Found", {
			{
				function ()
					return self.bomb2:SetScale( -0.43, 0 )
				end,
				function ()
					return self.bomb2:SetScale( -0.15, 250 )
				end,
				function ()
					return self.bomb2:SetScale( -0.43, 250 )
				end,
				function ()
					return self.bomb2:SetScale( -0.25, 250 )
				end,
				function ()
					return self.bomb2:SetScale( -0.43, 250 )
				end,
				function ()
					return self.bomb2:SetScale( -0.35, 250 )
				end,
				function ()
					return self.bomb2:SetScale( -0.43, 250 )
				end
			}
		} )
		self._sequences.bomb2Found = function ()
			bomb2:AnimateSequence( "bomb2Found" )
		end
		
		bomb3:RegisterAnimationSequence( "bomb3Found", {
			{
				function ()
					return self.bomb3:SetScale( -0.47, 0 )
				end,
				function ()
					return self.bomb3:SetScale( -0.2, 250 )
				end,
				function ()
					return self.bomb3:SetScale( -0.47, 250 )
				end,
				function ()
					return self.bomb3:SetScale( -0.3, 250 )
				end,
				function ()
					return self.bomb3:SetScale( -0.47, 250 )
				end,
				function ()
					return self.bomb3:SetScale( -0.4, 250 )
				end,
				function ()
					return self.bomb3:SetScale( -0.47, 250 )
				end
			}
		} )
		self._sequences.bomb3Found = function ()
			bomb3:AnimateSequence( "bomb3Found" )
		end
		
		NuclearCode:RegisterAnimationSequence( "nuclearCodeFound", {
			{
				function ()
					return self.NuclearCode:SetScale( 0, 0 )
				end,
				function ()
					return self.NuclearCode:SetScale( 0.5, 250 )
				end,
				function ()
					return self.NuclearCode:SetScale( 0, 250 )
				end,
				function ()
					return self.NuclearCode:SetScale( 0.25, 250 )
				end,
				function ()
					return self.NuclearCode:SetScale( 0, 250 )
				end,
				function ()
					return self.NuclearCode:SetScale( 0.13, 240 )
				end,
				function ()
					return self.NuclearCode:SetScale( 0, 260 )
				end
			}
		} )
		self._sequences.nuclearCodeFound = function ()
			NuclearCode:AnimateSequence( "nuclearCodeFound" )
		end
		
		page1:RegisterAnimationSequence( "mirrorFound", {
			{
				function ()
					return self.page1:SetScale( 0, 0 )
				end,
				function ()
					return self.page1:SetScale( 0.5, 250 )
				end,
				function ()
					return self.page1:SetScale( 0, 250 )
				end,
				function ()
					return self.page1:SetScale( 0.25, 250 )
				end,
				function ()
					return self.page1:SetScale( 0, 250 )
				end,
				function ()
					return self.page1:SetScale( 0.13, 250 )
				end,
				function ()
					return self.page1:SetScale( 0, 250 )
				end
			}
		} )
		self._sequences.mirrorFound = function ()
			page1:AnimateSequence( "mirrorFound" )
		end
		
		page2:RegisterAnimationSequence( "daggerFound", {
			{
				function ()
					return self.page2:SetScale( 0, 0 )
				end,
				function ()
					return self.page2:SetScale( 0.5, 250 )
				end,
				function ()
					return self.page2:SetScale( 0, 260 )
				end,
				function ()
					return self.page2:SetScale( 0.25, 240 )
				end,
				function ()
					return self.page2:SetScale( 0, 250 )
				end,
				function ()
					return self.page2:SetScale( 0.13, 250 )
				end,
				function ()
					return self.page2:SetScale( 0, 250 )
				end
			}
		} )
		self._sequences.daggerFound = function ()
			page2:AnimateSequence( "daggerFound" )
		end
		
		page2:RegisterAnimationSequence( "bookFound", {
			{
				function ()
					return self.page2:SetScale( 0, 0 )
				end,
				function ()
					return self.page2:SetScale( 0.5, 250 )
				end,
				function ()
					return self.page2:SetScale( 0, 250 )
				end,
				function ()
					return self.page2:SetScale( 0.25, 250 )
				end,
				function ()
					return self.page2:SetScale( 0, 250 )
				end,
				function ()
					return self.page2:SetScale( 0.13, 250 )
				end,
				function ()
					return self.page2:SetScale( 0, 250 )
				end
			}
		} )
		self._sequences.bookFound = function ()
			page2:AnimateSequence( "bookFound" )
		end
		
		elvira:RegisterAnimationSequence( "elviraFound", {
			{
				function ()
					return self.elvira:SetScale( 0, 0 )
				end,
				function ()
					return self.elvira:SetScale( 0.5, 250 )
				end,
				function ()
					return self.elvira:SetScale( 0, 250 )
				end,
				function ()
					return self.elvira:SetScale( 0.25, 250 )
				end,
				function ()
					return self.elvira:SetScale( 0, 250 )
				end,
				function ()
					return self.elvira:SetScale( 0.13, 250 )
				end,
				function ()
					return self.elvira:SetScale( 0, 250 )
				end
			}
		} )
		self._sequences.elviraFound = function ()
			elvira:AnimateSequence( "elviraFound" )
		end
		
		kaboom:RegisterAnimationSequence( "kaboomFound", {
			{
				function ()
					return self.kaboom:SetScale( 0, 0 )
				end,
				function ()
					return self.kaboom:SetScale( 0.5, 250 )
				end,
				function ()
					return self.kaboom:SetScale( 0, 250 )
				end,
				function ()
					return self.kaboom:SetScale( 0.25, 250 )
				end,
				function ()
					return self.kaboom:SetScale( 0, 250 )
				end,
				function ()
					return self.kaboom:SetScale( 0.13, 250 )
				end,
				function ()
					return self.kaboom:SetScale( 0, 250 )
				end
			}
		} )
		self._sequences.kaboomFound = function ()
			kaboom:AnimateSequence( "kaboomFound" )
		end
		
		crogVial:RegisterAnimationSequence( "crogVialFound", {
			{
				function ()
					return self.crogVial:SetScale( 0, 0 )
				end,
				function ()
					return self.crogVial:SetScale( 0.5, 250 )
				end,
				function ()
					return self.crogVial:SetScale( 0, 250 )
				end,
				function ()
					return self.crogVial:SetScale( 0.25, 250 )
				end,
				function ()
					return self.crogVial:SetScale( 0, 250 )
				end,
				function ()
					return self.crogVial:SetScale( 0.13, 250 )
				end,
				function ()
					return self.crogVial:SetScale( 0, 250 )
				end
			}
		} )
		rectangle:RegisterAnimationSequence( "crogVialFound", {
			{
				function ()
					return self.rectangle:SetScale( 0, 0 )
				end,
				function ()
					return self.rectangle:SetScale( 0.5, 250 )
				end,
				function ()
					return self.rectangle:SetScale( 0, 250 )
				end,
				function ()
					return self.rectangle:SetScale( 0.25, 250 )
				end,
				function ()
					return self.rectangle:SetScale( 0, 250 )
				end,
				function ()
					return self.rectangle:SetScale( 0.12, 240 )
				end,
				function ()
					return self.rectangle:SetScale( 0, 260 )
				end
			},
			{
				function ()
					return self.rectangle:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1532.58, _1080p * 1538.58, _1080p * 114.32, _1080p * 244.32, 0 )
				end,
				function ()
					return self.rectangle:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1518.58, _1080p * 1524.58, _1080p * 126.32, _1080p * 256.32, 250 )
				end,
				function ()
					return self.rectangle:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1532.58, _1080p * 1538.58, _1080p * 114.32, _1080p * 244.32, 250 )
				end,
				function ()
					return self.rectangle:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1524.58, _1080p * 1530.58, _1080p * 120, _1080p * 250, 250 )
				end,
				function ()
					return self.rectangle:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1532.58, _1080p * 1538.58, _1080p * 114.32, _1080p * 244.32, 250 )
				end,
				function ()
					return self.rectangle:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1529.58, _1080p * 1535.58, _1080p * 117, _1080p * 247, 240 )
				end,
				function ()
					return self.rectangle:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1532.58, _1080p * 1538.58, _1080p * 115, _1080p * 245, 259 )
				end
			}
		} )
		self._sequences.crogVialFound = function ()
			crogVial:AnimateSequence( "crogVialFound" )
			rectangle:AnimateSequence( "crogVialFound" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	self:SubscribeToModel( DataSources.inGame.CP.zombies.quests.questWOR3Part1Alpha:GetModel( f1_local1 ), function ()
		if DataSources.inGame.CP.zombies.quests.questWOR3Part1Alpha:GetValue( f1_local1 ) ~= nil and DataSources.inGame.CP.zombies.quests.questWOR3Part1Alpha:GetValue( f1_local1 ) == 1 then
			ACTIONS.AnimateSequence( self, "bomb1Found" )
		end
	end )
	self:SubscribeToModel( DataSources.inGame.CP.zombies.quests.questWOR3Part2Alpha:GetModel( f1_local1 ), function ()
		if DataSources.inGame.CP.zombies.quests.questWOR3Part2Alpha:GetValue( f1_local1 ) ~= nil and DataSources.inGame.CP.zombies.quests.questWOR3Part2Alpha:GetValue( f1_local1 ) == 1 then
			ACTIONS.AnimateSequence( self, "bomb2Found" )
		end
	end )
	self:SubscribeToModel( DataSources.inGame.CP.zombies.quests.questWOR3Part3Alpha:GetModel( f1_local1 ), function ()
		if DataSources.inGame.CP.zombies.quests.questWOR3Part3Alpha:GetValue( f1_local1 ) ~= nil and DataSources.inGame.CP.zombies.quests.questWOR3Part3Alpha:GetValue( f1_local1 ) == 1 then
			ACTIONS.AnimateSequence( self, "bomb3Found" )
		end
	end )
	self:SubscribeToModel( DataSources.inGame.CP.zombies.quests.questWOR4Part1Alpha:GetModel( f1_local1 ), function ()
		if DataSources.inGame.CP.zombies.quests.questWOR4Part1Alpha:GetValue( f1_local1 ) ~= nil and DataSources.inGame.CP.zombies.quests.questWOR4Part1Alpha:GetValue( f1_local1 ) == 1 then
			ACTIONS.AnimateSequence( self, "nuclearCodeFound" )
		end
	end )
	self:SubscribeToModel( DataSources.inGame.CP.zombies.quests.questWOR4Part2Alpha:GetModel( f1_local1 ), function ()
		if DataSources.inGame.CP.zombies.quests.questWOR4Part2Alpha:GetValue( f1_local1 ) ~= nil and DataSources.inGame.CP.zombies.quests.questWOR4Part2Alpha:GetValue( f1_local1 ) == 1 then
			ACTIONS.AnimateSequence( self, "bookFound" )
		end
	end )
	self:SubscribeToModel( DataSources.inGame.CP.zombies.quests.questWOR4Part3Alpha:GetModel( f1_local1 ), function ()
		if DataSources.inGame.CP.zombies.quests.questWOR4Part3Alpha:GetValue( f1_local1 ) ~= nil and DataSources.inGame.CP.zombies.quests.questWOR4Part3Alpha:GetValue( f1_local1 ) == 1 then
			ACTIONS.AnimateSequence( self, "daggerFound" )
		end
	end )
	self:SubscribeToModel( DataSources.inGame.CP.zombies.quests.questRecorderPart2Alpha:GetModel( f1_local1 ), function ()
		if DataSources.inGame.CP.zombies.quests.questRecorderPart2Alpha:GetValue( f1_local1 ) ~= nil and DataSources.inGame.CP.zombies.quests.questRecorderPart2Alpha:GetValue( f1_local1 ) == 1 then
			ACTIONS.AnimateSequence( self, "mirrorFound" )
		end
	end )
	self:SubscribeToModel( DataSources.inGame.CP.zombies.questsDLC1.harpoonQuestCompleteAlphaFilter:GetModel( f1_local1 ), function ()
		if DataSources.inGame.CP.zombies.questsDLC1.harpoonQuestCompleteAlphaFilter:GetValue( f1_local1 ) ~= nil and DataSources.inGame.CP.zombies.questsDLC1.harpoonQuestCompleteAlphaFilter:GetValue( f1_local1 ) == 1 then
			ACTIONS.AnimateSequence( self, "elviraFound" )
		end
	end )
	self:SubscribeToModel( DataSources.inGame.CP.zombies.questsDLC1.jayQuestCompleteAlphaFilter:GetModel( f1_local1 ), function ()
		if DataSources.inGame.CP.zombies.questsDLC1.jayQuestCompleteAlphaFilter:GetValue( f1_local1 ) ~= nil and DataSources.inGame.CP.zombies.questsDLC1.jayQuestCompleteAlphaFilter:GetValue( f1_local1 ) == 1 then
			ACTIONS.AnimateSequence( self, "kaboomFound" )
		end
	end )
	self:SubscribeToModel( DataSources.inGame.CP.zombies.quests.questRecorderPart1Alpha:GetModel( f1_local1 ), function ()
		if DataSources.inGame.CP.zombies.quests.questRecorderPart1Alpha:GetValue( f1_local1 ) ~= nil and DataSources.inGame.CP.zombies.quests.questRecorderPart1Alpha:GetValue( f1_local1 ) == 1 then
			ACTIONS.AnimateSequence( self, "crogVialFound" )
		end
	end )
	return self
end

MenuBuilder.registerType( "questPhase3", questPhase3 )
LockTable( _M )
