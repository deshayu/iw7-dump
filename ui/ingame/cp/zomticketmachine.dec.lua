local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ( f1_arg0, f1_arg1 )
	f1_arg0.zomTicketStrip:SetMask( f1_arg0.Mask )
end

function ZomTicketMachine( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 290 * _1080p, 0, 403 * _1080p )
	self.id = "ZomTicketMachine"
	self._animationSets = {}
	self._sequences = {}
	local f2_local1 = controller and controller.controllerIndex
	if not f2_local1 and not Engine.InFrontend() then
		f2_local1 = self:getRootController()
	end
	assert( f2_local1 )
	local f2_local2 = self
	local ArcaneBacking = nil
	
	ArcaneBacking = LUI.UIImage.new()
	ArcaneBacking.id = "ArcaneBacking"
	ArcaneBacking:SetScale( 1.29, 0 )
	ArcaneBacking:setImage( RegisterMaterial( "zm_tix_arcane_spinner" ), 0 )
	ArcaneBacking:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 81, _1080p * 209, _1080p * 82.56, _1080p * 210.56 )
	self:addElement( ArcaneBacking )
	self.ArcaneBacking = ArcaneBacking
	
	local devilJaw = nil
	
	devilJaw = LUI.UIImage.new()
	devilJaw.id = "devilJaw"
	devilJaw:SetScale( 1.1, 0 )
	devilJaw:setImage( RegisterMaterial( "zm_wc_devil_head_bottom" ), 0 )
	devilJaw:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 81, _1080p * 209, _1080p * 175.12, _1080p * 303.12 )
	self:addElement( devilJaw )
	self.devilJaw = devilJaw
	
	local zomTicketStrip = nil
	
	zomTicketStrip = MenuBuilder.BuildRegisteredType( "zomTicketStrip", {
		controllerIndex = f2_local1
	} )
	zomTicketStrip.id = "zomTicketStrip"
	zomTicketStrip:SetScale( -0.34, 0 )
	zomTicketStrip:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 114.04, _1080p * 163.96, _1080p * -259.87, _1080p * 87.63 )
	self:addElement( zomTicketStrip )
	self.zomTicketStrip = zomTicketStrip
	
	local Mask = nil
	
	Mask = LUI.UIImage.new()
	Mask.id = "Mask"
	Mask:setImage( RegisterMaterial( "devil_stencil_mask" ), 0 )
	Mask:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 84, _1080p * 206, _1080p * 229.12, _1080p * 917.72 )
	self:addElement( Mask )
	self.Mask = Mask
	
	local devilHead = nil
	
	devilHead = LUI.UIImage.new()
	devilHead.id = "devilHead"
	devilHead:SetScale( 1.1, 0 )
	devilHead:setImage( RegisterMaterial( "zm_wc_devil_head_top" ), 0 )
	devilHead:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 75, _1080p * 203, _1080p * 58.72, _1080p * 186.72 )
	self:addElement( devilHead )
	self.devilHead = devilHead
	
	local numtickets = nil
	
	numtickets = LUI.UIText.new()
	numtickets.id = "numtickets"
	numtickets:SetRGBFromTable( SWATCHES.CAC.ButtonUp, 0 )
	numtickets:SetFontSize( 30 * _1080p )
	numtickets:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	numtickets:setTextStyle( CoD.TextStyle.Outlined )
	numtickets:SetAlignment( LUI.Alignment.Center )
	numtickets:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 114.5, _1080p * 175.5, _1080p * 58.72, _1080p * 94.72 )
	numtickets:SubscribeToModel( DataSources.inGame.CP.zombies.ticketsDispersed:GetModel( f2_local1 ), function ()
		local f3_local0 = DataSources.inGame.CP.zombies.ticketsDispersed:GetValue( f2_local1 )
		if f3_local0 ~= nil then
			numtickets:setText( f3_local0, 0 )
		end
	end )
	self:addElement( numtickets )
	self.numtickets = numtickets
	
	local ticketTypeTrap = nil
	
	ticketTypeTrap = LUI.UIStyledText.new()
	ticketTypeTrap.id = "ticketTypeTrap"
	ticketTypeTrap:SetAlpha( 0, 0 )
	ticketTypeTrap:setText( Engine.Localize( "CP_ZMB_TRAP_KILLS" ), 0 )
	ticketTypeTrap:SetFontSize( 32 * _1080p )
	ticketTypeTrap:SetFont( FONTS.GetFont( FONTS.MainExtended.File ) )
	ticketTypeTrap:SetAlignment( LUI.Alignment.Center )
	ticketTypeTrap:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -105, _1080p * 395, _1080p * -32.4, _1080p * -0.4 )
	self:addElement( ticketTypeTrap )
	self.ticketTypeTrap = ticketTypeTrap
	
	local ticketTypePillage = nil
	
	ticketTypePillage = LUI.UIStyledText.new()
	ticketTypePillage.id = "ticketTypePillage"
	ticketTypePillage:SetAlpha( 0, 0 )
	ticketTypePillage:setText( Engine.Localize( "CP_ZMB_TICKETS_FOUND" ), 0 )
	ticketTypePillage:SetFontSize( 32 * _1080p )
	ticketTypePillage:SetFont( FONTS.GetFont( FONTS.MainExtended.File ) )
	ticketTypePillage:SetAlignment( LUI.Alignment.Center )
	ticketTypePillage:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -105, _1080p * 395, _1080p * -32.4, _1080p * -0.4 )
	self:addElement( ticketTypePillage )
	self.ticketTypePillage = ticketTypePillage
	
	local ticketTypeGames = nil
	
	ticketTypeGames = LUI.UIStyledText.new()
	ticketTypeGames.id = "ticketTypeGames"
	ticketTypeGames:setText( Engine.Localize( "CP_ZMB_TICKETS_WON" ), 0 )
	ticketTypeGames:SetFontSize( 24 * _1080p )
	ticketTypeGames:SetFont( FONTS.GetFont( FONTS.MainExtended.File ) )
	ticketTypeGames:SetAlignment( LUI.Alignment.Center )
	ticketTypeGames:SetShadowMinDistance( -1, 0 )
	ticketTypeGames:SetShadowRGBFromInt( 16711680, 0 )
	ticketTypeGames:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -105, _1080p * 395, _1080p * 19.6, _1080p * 43.6 )
	self:addElement( ticketTypeGames )
	self.ticketTypeGames = ticketTypeGames
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		numtickets:RegisterAnimationSequence( "ticketReset", {
			{
				function ()
					return self.numtickets:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.ticketReset = function ()
			numtickets:AnimateSequence( "ticketReset" )
		end
		
		ArcaneBacking:RegisterAnimationSequence( "initial", {
			{
				function ()
					return self.ArcaneBacking:SetAlpha( 0, 0 )
				end
			}
		} )
		devilJaw:RegisterAnimationSequence( "initial", {
			{
				function ()
					return self.devilJaw:SetAlpha( 0, 0 )
				end
			}
		} )
		zomTicketStrip:RegisterAnimationSequence( "initial", {
			{
				function ()
					return self.zomTicketStrip:SetAlpha( 0, 0 )
				end
			}
		} )
		devilHead:RegisterAnimationSequence( "initial", {
			{
				function ()
					return self.devilHead:SetAlpha( 0, 0 )
				end
			}
		} )
		numtickets:RegisterAnimationSequence( "initial", {
			{
				function ()
					return self.numtickets:SetAlpha( 0, 0 )
				end
			}
		} )
		ticketTypeGames:RegisterAnimationSequence( "initial", {
			{
				function ()
					return self.ticketTypeGames:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.initial = function ()
			ArcaneBacking:AnimateSequence( "initial" )
			devilJaw:AnimateSequence( "initial" )
			zomTicketStrip:AnimateSequence( "initial" )
			devilHead:AnimateSequence( "initial" )
			numtickets:AnimateSequence( "initial" )
			ticketTypeGames:AnimateSequence( "initial" )
		end
		
		ArcaneBacking:RegisterAnimationSequence( "show", {
			{
				function ()
					return self.ArcaneBacking:SetAlpha( 0, 0 )
				end,
				function ()
					return self.ArcaneBacking:SetAlpha( 1, 380 )
				end,
				function ()
					return self.ArcaneBacking:SetAlpha( 1, 2140 )
				end
			},
			{
				function ()
					return self.ArcaneBacking:SetZRotation( 0, 0 )
				end
			}
		} )
		devilJaw:RegisterAnimationSequence( "show", {
			{
				function ()
					return self.devilJaw:SetAlpha( 0, 0 )
				end,
				function ()
					return self.devilJaw:SetAlpha( 1, 380 )
				end
			},
			{
				function ()
					return self.devilJaw:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 81.6, _1080p * 209.6, _1080p * 175.12, _1080p * 303.12, 0 )
				end,
				function ()
					return self.devilJaw:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 81.6, _1080p * 209.6, _1080p * 175.12, _1080p * 303.12, 379 )
				end,
				function ()
					return self.devilJaw:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 81.6, _1080p * 209.6, _1080p * 195, _1080p * 323, 379 )
				end,
				function ()
					return self.devilJaw:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 81.6, _1080p * 209.6, _1080p * 195, _1080p * 323, 1220 )
				end,
				function ()
					return self.devilJaw:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 81.6, _1080p * 209.6, _1080p * 175.12, _1080p * 303.12, 200 )
				end,
				function ()
					return self.devilJaw:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 81.6, _1080p * 209.6, _1080p * 175.12, _1080p * 303.12, 339 )
				end
			}
		} )
		zomTicketStrip:RegisterAnimationSequence( "show", {
			{
				function ()
					return self.zomTicketStrip:SetAlpha( 0, 0 )
				end,
				function ()
					return self.zomTicketStrip:SetAlpha( 0, 560 )
				end,
				function ()
					return self.zomTicketStrip:SetAlpha( 1, 10 )
				end,
				function ()
					return self.zomTicketStrip:SetAlpha( 1, 1950 )
				end
			},
			{
				function ()
					return self.zomTicketStrip:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 114.04, _1080p * 163.96, _1080p * -224.75, _1080p * 122.75, 0 )
				end,
				function ()
					return self.zomTicketStrip:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 114.04, _1080p * 163.96, _1080p * -224.75, _1080p * 122.75, 560 )
				end,
				function ()
					return self.zomTicketStrip:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 114.04, _1080p * 163.96, _1080p * -367.62, _1080p * -20.12, 9 )
				end,
				function ()
					return self.zomTicketStrip:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 114.04, _1080p * 163.96, _1080p * -82.87, _1080p * 264.63, 1410 )
				end
			}
		} )
		devilHead:RegisterAnimationSequence( "show", {
			{
				function ()
					return self.devilHead:SetAlpha( 0, 0 )
				end,
				function ()
					return self.devilHead:SetAlpha( 1, 380 )
				end,
				function ()
					return self.devilHead:SetAlpha( 1, 2140 )
				end
			}
		} )
		numtickets:RegisterAnimationSequence( "show", {
			{
				function ()
					return self.numtickets:SetAlpha( 1, 380 )
				end,
				function ()
					return self.numtickets:SetAlpha( 1, 2140 )
				end
			}
		} )
		ticketTypeGames:RegisterAnimationSequence( "show", {
			{
				function ()
					return self.ticketTypeGames:SetAlpha( 1, 380 )
				end,
				function ()
					return self.ticketTypeGames:SetAlpha( 1, 2140 )
				end
			}
		} )
		self._sequences.show = function ()
			ArcaneBacking:AnimateSequence( "show" )
			devilJaw:AnimateSequence( "show" )
			zomTicketStrip:AnimateSequence( "show" )
			devilHead:AnimateSequence( "show" )
			numtickets:AnimateSequence( "show" )
			ticketTypeGames:AnimateSequence( "show" )
		end
		
		ArcaneBacking:RegisterAnimationSequence( "hide", {
			{
				function ()
					return self.ArcaneBacking:SetAlpha( 1, 0 )
				end,
				function ()
					return self.ArcaneBacking:SetAlpha( 0, 190 )
				end
			}
		} )
		devilJaw:RegisterAnimationSequence( "hide", {
			{
				function ()
					return self.devilJaw:SetAlpha( 1, 0 )
				end,
				function ()
					return self.devilJaw:SetAlpha( 0, 190 )
				end
			}
		} )
		zomTicketStrip:RegisterAnimationSequence( "hide", {
			{
				function ()
					return self.zomTicketStrip:SetAlpha( 1, 0 )
				end,
				function ()
					return self.zomTicketStrip:SetAlpha( 0, 190 )
				end
			}
		} )
		devilHead:RegisterAnimationSequence( "hide", {
			{
				function ()
					return self.devilHead:SetAlpha( 1, 0 )
				end,
				function ()
					return self.devilHead:SetAlpha( 0, 190 )
				end
			}
		} )
		numtickets:RegisterAnimationSequence( "hide", {
			{
				function ()
					return self.numtickets:SetAlpha( 1, 0 )
				end,
				function ()
					return self.numtickets:SetAlpha( 0, 190 )
				end
			}
		} )
		ticketTypeGames:RegisterAnimationSequence( "hide", {
			{
				function ()
					return self.ticketTypeGames:SetAlpha( 1, 0 )
				end,
				function ()
					return self.ticketTypeGames:SetAlpha( 0, 190 )
				end
			}
		} )
		self._sequences.hide = function ()
			ArcaneBacking:AnimateSequence( "hide" )
			devilJaw:AnimateSequence( "hide" )
			zomTicketStrip:AnimateSequence( "hide" )
			devilHead:AnimateSequence( "hide" )
			numtickets:AnimateSequence( "hide" )
			ticketTypeGames:AnimateSequence( "hide" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	self:addEventHandler( "message_queue_show", function ( f56_arg0, f56_arg1 )
		local f56_local0 = f56_arg1.controller or f2_local1
		ACTIONS.AnimateSequence( self, "show" )
	end )
	self:addEventHandler( "message_queue_hide", function ( f57_arg0, f57_arg1 )
		local f57_local0 = f57_arg1.controller or f2_local1
		ACTIONS.AnimateSequence( self, "hide" )
	end )
	f0_local0( self, f2_local1, controller )
	ACTIONS.AnimateSequence( self, "initial" )
	return self
end

MenuBuilder.registerType( "ZomTicketMachine", ZomTicketMachine )
LockTable( _M )
