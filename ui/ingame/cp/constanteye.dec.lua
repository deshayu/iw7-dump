local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function PostLoadFunc( f1_arg0, f1_arg1 )
	f1_arg0:SetupInWorldElement( {} )
	f1_arg0:SetInWorldScale( 0.05 )
	local f1_local0 = function ( f2_arg0, f2_arg1 )
		f2_arg0:SetEntityNum( Game.GetOmnvar( "zm_ui_color_eye_ent" ) )
		f2_arg0:SetEntityTag( "tag_origin" )
		f2_arg0:SetFollowTagAngles( true )
		f2_arg0:SetTagSpacePosition( 0, 0, 0 )
		f2_arg0:SetTagSpaceYaw( -180 )
		f2_arg0:SetTagSpaceRoll( -90 )
	end
	
	f1_arg0:registerOmnvarHandler( "zm_ui_color_eye_ent", f1_local0 )
	f1_local0( f1_arg0, {} )
	local f1_local1 = DataSources.inGame.CP.zombies.dlc3.colorKeySlot
	f1_arg0:SubscribeToModel( f1_local1:GetModel( f1_arg1 ), function ()
		local f3_local0 = f1_local1:GetValue( f1_arg1 )
		local f3_local1 = Game.GetOmnvar( "zm_chem_correct_color" )
		local f3_local2 = Game.GetOmnvar( "zm_chem_color_key_value" )
		local f3_local3 = Game.GetOmnvar( "zm_chem_color_key_slot" )
		local f3_local4 = Game.GetOmnvar( "zm_chem_color_key_rnd" )
		local f3_local5 = 0
		local f3_local6 = 0
		local f3_local7 = 0
		local f3_local8 = 0
		if f3_local3 == 1 then
			f3_local5 = f3_local2 + 1
			f3_local6 = f3_local2 + 1
			f3_local7 = f3_local2 + 3
			f3_local8 = f3_local2 + 3
		elseif f3_local3 == 2 then
			f3_local5 = f3_local2 - 1
			f3_local6 = f3_local2 - 1
			f3_local7 = f3_local2 + 1
			f3_local8 = f3_local2 + 1
		elseif f3_local3 == 3 then
			f3_local5 = f3_local2 - 3
			f3_local6 = f3_local2 - 3
			f3_local7 = f3_local2 - 1
			f3_local8 = f3_local2 - 1
		end
		f1_arg0.slot1Num:setText( tostring( f3_local5 ) )
		f1_arg0.slot2LowNum:setText( tostring( f3_local6 ) )
		f1_arg0.slot2HighNum:setText( tostring( f3_local7 ) )
		f1_arg0.slot3Num:setText( tostring( f3_local8 ) )
		f1_arg0.slot3Num:SetGlitchEnabled( true )
		f1_arg0.slot2HighNum:SetGlitchEnabled( true )
		f1_arg0.dash:SetGlitchEnabled( true )
		f1_arg0.slot2LowNum:SetGlitchEnabled( true )
		f1_arg0.slot1Num:SetGlitchEnabled( true )
		f1_arg0.greaterThan:SetGlitchEnabled( true )
		f1_arg0.lessThan:SetGlitchEnabled( true )
		f1_arg0.slot3Num:SetGlitchEnabled( false )
		f1_arg0.slot2HighNum:SetGlitchEnabled( false )
		f1_arg0.dash:SetGlitchEnabled( false )
		f1_arg0.slot2LowNum:SetGlitchEnabled( false )
		f1_arg0.slot1Num:SetGlitchEnabled( false )
		f1_arg0.greaterThan:SetGlitchEnabled( false )
		f1_arg0.lessThan:SetGlitchEnabled( false )
	end )
end

function constantEye( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 400 * _1080p, 0, 400 * _1080p )
	self.id = "constantEye"
	self._animationSets = {}
	self._sequences = {}
	local f4_local1 = controller and controller.controllerIndex
	if not f4_local1 and not Engine.InFrontend() then
		f4_local1 = self:getRootController()
	end
	assert( f4_local1 )
	local f4_local2 = self
	local elviraStill = nil
	
	elviraStill = LUI.UIImage.new()
	elviraStill.id = "elviraStill"
	elviraStill:SetAlpha( 0.7, 0 )
	elviraStill:setImage( RegisterMaterial( "cp_town_elvira_tv" ), 0 )
	elviraStill:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 400, _1080p * 24, _1080p * 378 )
	self:addElement( elviraStill )
	self.elviraStill = elviraStill
	
	local eye = nil
	
	eye = LUI.UIImage.new()
	eye.id = "eye"
	eye:SetAlpha( 0.4, 0 )
	eye:SetScale( -0.43, 0 )
	eye:setImage( RegisterMaterial( "cp_town_chem_eye_symbol" ), 0 )
	eye:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -12.36, _1080p * 387.64, _1080p * -124.64, _1080p * 274 )
	self:addElement( eye )
	self.eye = eye
	
	local lessThan = nil
	
	lessThan = LUI.UIText.new()
	lessThan.id = "lessThan"
	lessThan:setText( "<", 0 )
	lessThan:SetFontSize( 45 * _1080p )
	lessThan:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	lessThan:SetAlignment( LUI.Alignment.Center )
	lessThan:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 93.61, _1080p * 128.61, _1080p * 129.36, _1080p * 174.36 )
	self:addElement( lessThan )
	self.lessThan = lessThan
	
	local greaterThan = nil
	
	greaterThan = LUI.UIText.new()
	greaterThan.id = "greaterThan"
	greaterThan:setText( ">", 0 )
	greaterThan:SetFontSize( 45 * _1080p )
	greaterThan:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	greaterThan:SetAlignment( LUI.Alignment.Left )
	greaterThan:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 90.61, _1080p * 125.61, _1080p * 279.36, _1080p * 324.36 )
	self:addElement( greaterThan )
	self.greaterThan = greaterThan
	
	local slot1Num = nil
	
	slot1Num = LUI.UIText.new()
	slot1Num.id = "slot1Num"
	slot1Num:SetFontSize( 45 * _1080p )
	slot1Num:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	slot1Num:SetAlignment( LUI.Alignment.Left )
	slot1Num:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 129.57, _1080p * 215.75, _1080p * 129.36, _1080p * 174.36 )
	slot1Num:SubscribeToModel( DataSources.inGame.CP.zombies.dlc3.colorKeyValue:GetModel( f4_local1 ), function ()
		local f5_local0 = DataSources.inGame.CP.zombies.dlc3.colorKeyValue:GetValue( f4_local1 )
		if f5_local0 ~= nil then
			slot1Num:setText( f5_local0, 0 )
		end
	end )
	self:addElement( slot1Num )
	self.slot1Num = slot1Num
	
	local slot2LowNum = nil
	
	slot2LowNum = LUI.UIText.new()
	slot2LowNum.id = "slot2LowNum"
	slot2LowNum:setText( "4", 0 )
	slot2LowNum:SetFontSize( 45 * _1080p )
	slot2LowNum:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	slot2LowNum:SetAlignment( LUI.Alignment.Right )
	slot2LowNum:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 83, _1080p * 206.36, _1080p * 251.36 )
	self:addElement( slot2LowNum )
	self.slot2LowNum = slot2LowNum
	
	local dash = nil
	
	dash = LUI.UIText.new()
	dash.id = "dash"
	dash:setText( "-", 0 )
	dash:SetFontSize( 45 * _1080p )
	dash:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	dash:SetAlignment( LUI.Alignment.Center )
	dash:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 93.61, _1080p * 121.61, _1080p * 206.5, _1080p * 251.5 )
	self:addElement( dash )
	self.dash = dash
	
	local slot2HighNum = nil
	
	slot2HighNum = LUI.UIText.new()
	slot2HighNum.id = "slot2HighNum"
	slot2HighNum:setText( "6", 0 )
	slot2HighNum:SetFontSize( 45 * _1080p )
	slot2HighNum:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	slot2HighNum:SetAlignment( LUI.Alignment.Left )
	slot2HighNum:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 131.57, _1080p * 215.75, _1080p * 206.36, _1080p * 251.36 )
	self:addElement( slot2HighNum )
	self.slot2HighNum = slot2HighNum
	
	local slot3Num = nil
	
	slot3Num = LUI.UIText.new()
	slot3Num.id = "slot3Num"
	slot3Num:setText( "3", 0 )
	slot3Num:SetFontSize( 45 * _1080p )
	slot3Num:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	slot3Num:SetAlignment( LUI.Alignment.Left )
	slot3Num:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 129.57, _1080p * 215.75, _1080p * 279.36, _1080p * 324.36 )
	self:addElement( slot3Num )
	self.slot3Num = slot3Num
	
	local tvColorGreen1 = nil
	
	tvColorGreen1 = MenuBuilder.BuildRegisteredType( "tvColor", {
		controllerIndex = f4_local1
	} )
	tvColorGreen1.id = "tvColorGreen1"
	tvColorGreen1:SetScale( -0.1, 0 )
	tvColorGreen1.blue:SetRGBFromInt( 44808, 0 )
	tvColorGreen1.Text:setText( ToUpperCase( Engine.Localize( "CP_TOWN_TV_GREEN" ) ), 0 )
	tvColorGreen1:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 201.64, _1080p * 401.64, _1080p * 128.86, _1080p * 186.86 )
	self:addElement( tvColorGreen1 )
	self.tvColorGreen1 = tvColorGreen1
	
	local tvColorBlue1 = nil
	
	tvColorBlue1 = MenuBuilder.BuildRegisteredType( "tvColor", {
		controllerIndex = f4_local1
	} )
	tvColorBlue1.id = "tvColorBlue1"
	tvColorBlue1:SetScale( -0.1, 0 )
	tvColorBlue1.Text:setText( ToUpperCase( Engine.Localize( "CP_TOWN_TV_BLUE" ) ), 0 )
	tvColorBlue1:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 201.64, _1080p * 401.64, _1080p * 128.86, _1080p * 186.86 )
	self:addElement( tvColorBlue1 )
	self.tvColorBlue1 = tvColorBlue1
	
	local tvColorRed1 = nil
	
	tvColorRed1 = MenuBuilder.BuildRegisteredType( "tvColor", {
		controllerIndex = f4_local1
	} )
	tvColorRed1.id = "tvColorRed1"
	tvColorRed1:SetScale( -0.1, 0 )
	tvColorRed1.blue:SetRGBFromInt( 16711680, 0 )
	tvColorRed1.Text:setText( ToUpperCase( Engine.Localize( "CP_TOWN_TV_RED" ) ), 0 )
	tvColorRed1:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 201.64, _1080p * 401.64, _1080p * 128.86, _1080p * 186.86 )
	self:addElement( tvColorRed1 )
	self.tvColorRed1 = tvColorRed1
	
	local tvColorRed2 = nil
	
	tvColorRed2 = MenuBuilder.BuildRegisteredType( "tvColor", {
		controllerIndex = f4_local1
	} )
	tvColorRed2.id = "tvColorRed2"
	tvColorRed2:SetScale( -0.1, 0 )
	tvColorRed2.blue:SetRGBFromInt( 16711680, 0 )
	tvColorRed2.Text:setText( ToUpperCase( Engine.Localize( "CP_TOWN_TV_RED" ) ), 0 )
	tvColorRed2:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 200, _1080p * 400, _1080p * 199.86, _1080p * 257.86 )
	self:addElement( tvColorRed2 )
	self.tvColorRed2 = tvColorRed2
	
	local tvColorBlue2 = nil
	
	tvColorBlue2 = MenuBuilder.BuildRegisteredType( "tvColor", {
		controllerIndex = f4_local1
	} )
	tvColorBlue2.id = "tvColorBlue2"
	tvColorBlue2:SetScale( -0.1, 0 )
	tvColorBlue2.blue:SetRGBFromInt( 2176511, 0 )
	tvColorBlue2.Text:setText( ToUpperCase( Engine.Localize( "CP_TOWN_TV_BLUE" ) ), 0 )
	tvColorBlue2:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 200, _1080p * 400, _1080p * 199.86, _1080p * 257.86 )
	self:addElement( tvColorBlue2 )
	self.tvColorBlue2 = tvColorBlue2
	
	local tvColorGreen2 = nil
	
	tvColorGreen2 = MenuBuilder.BuildRegisteredType( "tvColor", {
		controllerIndex = f4_local1
	} )
	tvColorGreen2.id = "tvColorGreen2"
	tvColorGreen2:SetScale( -0.1, 0 )
	tvColorGreen2.blue:SetRGBFromInt( 44808, 0 )
	tvColorGreen2.Text:setText( ToUpperCase( Engine.Localize( "CP_TOWN_TV_GREEN" ) ), 0 )
	tvColorGreen2:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 200, _1080p * 400, _1080p * 199.86, _1080p * 257.86 )
	self:addElement( tvColorGreen2 )
	self.tvColorGreen2 = tvColorGreen2
	
	local tvColorGreen3 = nil
	
	tvColorGreen3 = MenuBuilder.BuildRegisteredType( "tvColor", {
		controllerIndex = f4_local1
	} )
	tvColorGreen3.id = "tvColorGreen3"
	tvColorGreen3:SetScale( -0.1, 0 )
	tvColorGreen3.blue:SetRGBFromInt( 44808, 0 )
	tvColorGreen3.Text:setText( ToUpperCase( Engine.Localize( "CP_TOWN_TV_GREEN" ) ), 0 )
	tvColorGreen3:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 201, _1080p * 401, _1080p * 270.67, _1080p * 328.67 )
	self:addElement( tvColorGreen3 )
	self.tvColorGreen3 = tvColorGreen3
	
	local tvColorRed3 = nil
	
	tvColorRed3 = MenuBuilder.BuildRegisteredType( "tvColor", {
		controllerIndex = f4_local1
	} )
	tvColorRed3.id = "tvColorRed3"
	tvColorRed3:SetScale( -0.1, 0 )
	tvColorRed3.blue:SetRGBFromInt( 16711680, 0 )
	tvColorRed3.Text:setText( ToUpperCase( Engine.Localize( "CP_TOWN_TV_RED" ) ), 0 )
	tvColorRed3:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 201, _1080p * 401, _1080p * 270.67, _1080p * 328.67 )
	self:addElement( tvColorRed3 )
	self.tvColorRed3 = tvColorRed3
	
	local tvColorBlue3 = nil
	
	tvColorBlue3 = MenuBuilder.BuildRegisteredType( "tvColor", {
		controllerIndex = f4_local1
	} )
	tvColorBlue3.id = "tvColorBlue3"
	tvColorBlue3:SetScale( -0.1, 0 )
	tvColorBlue3.blue:SetRGBFromInt( 2176511, 0 )
	tvColorBlue3.Text:setText( ToUpperCase( Engine.Localize( "CP_TOWN_TV_BLUE" ) ), 0 )
	tvColorBlue3:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 201, _1080p * 401, _1080p * 270.67, _1080p * 328.67 )
	self:addElement( tvColorBlue3 )
	self.tvColorBlue3 = tvColorBlue3
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		tvColorGreen1:RegisterAnimationSequence( "redSlot1", {
			{
				function ()
					return self.tvColorGreen1:SetAlpha( 0, 0 )
				end
			}
		} )
		tvColorBlue1:RegisterAnimationSequence( "redSlot1", {
			{
				function ()
					return self.tvColorBlue1:SetAlpha( 0, 0 )
				end
			}
		} )
		tvColorRed1:RegisterAnimationSequence( "redSlot1", {
			{
				function ()
					return self.tvColorRed1:SetAlpha( 1, 0 )
				end
			}
		} )
		tvColorRed2:RegisterAnimationSequence( "redSlot1", {
			{
				function ()
					return self.tvColorRed2:SetAlpha( 0, 0 )
				end
			}
		} )
		tvColorBlue2:RegisterAnimationSequence( "redSlot1", {
			{
				function ()
					return self.tvColorBlue2:SetAlpha( 1, 0 )
				end
			}
		} )
		tvColorGreen2:RegisterAnimationSequence( "redSlot1", {
			{
				function ()
					return self.tvColorGreen2:SetAlpha( 0, 0 )
				end
			}
		} )
		tvColorGreen3:RegisterAnimationSequence( "redSlot1", {
			{
				function ()
					return self.tvColorGreen3:SetAlpha( 1, 0 )
				end
			}
		} )
		tvColorRed3:RegisterAnimationSequence( "redSlot1", {
			{
				function ()
					return self.tvColorRed3:SetAlpha( 0, 0 )
				end
			}
		} )
		tvColorBlue3:RegisterAnimationSequence( "redSlot1", {
			{
				function ()
					return self.tvColorBlue3:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.redSlot1 = function ()
			tvColorGreen1:AnimateSequence( "redSlot1" )
			tvColorBlue1:AnimateSequence( "redSlot1" )
			tvColorRed1:AnimateSequence( "redSlot1" )
			tvColorRed2:AnimateSequence( "redSlot1" )
			tvColorBlue2:AnimateSequence( "redSlot1" )
			tvColorGreen2:AnimateSequence( "redSlot1" )
			tvColorGreen3:AnimateSequence( "redSlot1" )
			tvColorRed3:AnimateSequence( "redSlot1" )
			tvColorBlue3:AnimateSequence( "redSlot1" )
		end
		
		tvColorGreen1:RegisterAnimationSequence( "blueSlot1", {
			{
				function ()
					return self.tvColorGreen1:SetAlpha( 0, 0 )
				end
			}
		} )
		tvColorBlue1:RegisterAnimationSequence( "blueSlot1", {
			{
				function ()
					return self.tvColorBlue1:SetAlpha( 1, 0 )
				end
			}
		} )
		tvColorRed1:RegisterAnimationSequence( "blueSlot1", {
			{
				function ()
					return self.tvColorRed1:SetAlpha( 0, 0 )
				end
			}
		} )
		tvColorRed2:RegisterAnimationSequence( "blueSlot1", {
			{
				function ()
					return self.tvColorRed2:SetAlpha( 1, 0 )
				end
			}
		} )
		tvColorBlue2:RegisterAnimationSequence( "blueSlot1", {
			{
				function ()
					return self.tvColorBlue2:SetAlpha( 0, 0 )
				end
			}
		} )
		tvColorGreen2:RegisterAnimationSequence( "blueSlot1", {
			{
				function ()
					return self.tvColorGreen2:SetAlpha( 0, 0 )
				end
			}
		} )
		tvColorGreen3:RegisterAnimationSequence( "blueSlot1", {
			{
				function ()
					return self.tvColorGreen3:SetAlpha( 1, 0 )
				end
			}
		} )
		tvColorRed3:RegisterAnimationSequence( "blueSlot1", {
			{
				function ()
					return self.tvColorRed3:SetAlpha( 0, 0 )
				end
			}
		} )
		tvColorBlue3:RegisterAnimationSequence( "blueSlot1", {
			{
				function ()
					return self.tvColorBlue3:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.blueSlot1 = function ()
			tvColorGreen1:AnimateSequence( "blueSlot1" )
			tvColorBlue1:AnimateSequence( "blueSlot1" )
			tvColorRed1:AnimateSequence( "blueSlot1" )
			tvColorRed2:AnimateSequence( "blueSlot1" )
			tvColorBlue2:AnimateSequence( "blueSlot1" )
			tvColorGreen2:AnimateSequence( "blueSlot1" )
			tvColorGreen3:AnimateSequence( "blueSlot1" )
			tvColorRed3:AnimateSequence( "blueSlot1" )
			tvColorBlue3:AnimateSequence( "blueSlot1" )
		end
		
		tvColorGreen1:RegisterAnimationSequence( "greenSlot1", {
			{
				function ()
					return self.tvColorGreen1:SetAlpha( 1, 0 )
				end
			}
		} )
		tvColorBlue1:RegisterAnimationSequence( "greenSlot1", {
			{
				function ()
					return self.tvColorBlue1:SetAlpha( 0, 0 )
				end
			}
		} )
		tvColorRed1:RegisterAnimationSequence( "greenSlot1", {
			{
				function ()
					return self.tvColorRed1:SetAlpha( 0, 0 )
				end
			}
		} )
		tvColorRed2:RegisterAnimationSequence( "greenSlot1", {
			{
				function ()
					return self.tvColorRed2:SetAlpha( 0, 0 )
				end
			}
		} )
		tvColorBlue2:RegisterAnimationSequence( "greenSlot1", {
			{
				function ()
					return self.tvColorBlue2:SetAlpha( 1, 0 )
				end
			}
		} )
		tvColorGreen2:RegisterAnimationSequence( "greenSlot1", {
			{
				function ()
					return self.tvColorGreen2:SetAlpha( 0, 0 )
				end
			}
		} )
		tvColorGreen3:RegisterAnimationSequence( "greenSlot1", {
			{
				function ()
					return self.tvColorGreen3:SetAlpha( 0, 0 )
				end
			}
		} )
		tvColorRed3:RegisterAnimationSequence( "greenSlot1", {
			{
				function ()
					return self.tvColorRed3:SetAlpha( 1, 0 )
				end
			}
		} )
		tvColorBlue3:RegisterAnimationSequence( "greenSlot1", {
			{
				function ()
					return self.tvColorBlue3:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.greenSlot1 = function ()
			tvColorGreen1:AnimateSequence( "greenSlot1" )
			tvColorBlue1:AnimateSequence( "greenSlot1" )
			tvColorRed1:AnimateSequence( "greenSlot1" )
			tvColorRed2:AnimateSequence( "greenSlot1" )
			tvColorBlue2:AnimateSequence( "greenSlot1" )
			tvColorGreen2:AnimateSequence( "greenSlot1" )
			tvColorGreen3:AnimateSequence( "greenSlot1" )
			tvColorRed3:AnimateSequence( "greenSlot1" )
			tvColorBlue3:AnimateSequence( "greenSlot1" )
		end
		
		tvColorGreen1:RegisterAnimationSequence( "redSlot2", {
			{
				function ()
					return self.tvColorGreen1:SetAlpha( 0, 0 )
				end
			}
		} )
		tvColorBlue1:RegisterAnimationSequence( "redSlot2", {
			{
				function ()
					return self.tvColorBlue1:SetAlpha( 1, 0 )
				end
			}
		} )
		tvColorRed1:RegisterAnimationSequence( "redSlot2", {
			{
				function ()
					return self.tvColorRed1:SetAlpha( 0, 0 )
				end
			}
		} )
		tvColorRed2:RegisterAnimationSequence( "redSlot2", {
			{
				function ()
					return self.tvColorRed2:SetAlpha( 1, 0 )
				end
			}
		} )
		tvColorBlue2:RegisterAnimationSequence( "redSlot2", {
			{
				function ()
					return self.tvColorBlue2:SetAlpha( 0, 0 )
				end
			}
		} )
		tvColorGreen2:RegisterAnimationSequence( "redSlot2", {
			{
				function ()
					return self.tvColorGreen2:SetAlpha( 0, 0 )
				end
			}
		} )
		tvColorGreen3:RegisterAnimationSequence( "redSlot2", {
			{
				function ()
					return self.tvColorGreen3:SetAlpha( 1, 0 )
				end
			}
		} )
		tvColorRed3:RegisterAnimationSequence( "redSlot2", {
			{
				function ()
					return self.tvColorRed3:SetAlpha( 0, 0 )
				end
			}
		} )
		tvColorBlue3:RegisterAnimationSequence( "redSlot2", {
			{
				function ()
					return self.tvColorBlue3:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.redSlot2 = function ()
			tvColorGreen1:AnimateSequence( "redSlot2" )
			tvColorBlue1:AnimateSequence( "redSlot2" )
			tvColorRed1:AnimateSequence( "redSlot2" )
			tvColorRed2:AnimateSequence( "redSlot2" )
			tvColorBlue2:AnimateSequence( "redSlot2" )
			tvColorGreen2:AnimateSequence( "redSlot2" )
			tvColorGreen3:AnimateSequence( "redSlot2" )
			tvColorRed3:AnimateSequence( "redSlot2" )
			tvColorBlue3:AnimateSequence( "redSlot2" )
		end
		
		tvColorBlue1:RegisterAnimationSequence( "blueSlot2", {
			{
				function ()
					return self.tvColorBlue1:SetAlpha( 0, 0 )
				end
			}
		} )
		tvColorRed1:RegisterAnimationSequence( "blueSlot2", {
			{
				function ()
					return self.tvColorRed1:SetAlpha( 1, 0 )
				end
			}
		} )
		tvColorRed2:RegisterAnimationSequence( "blueSlot2", {
			{
				function ()
					return self.tvColorRed2:SetAlpha( 0, 0 )
				end
			}
		} )
		tvColorBlue2:RegisterAnimationSequence( "blueSlot2", {
			{
				function ()
					return self.tvColorBlue2:SetAlpha( 1, 0 )
				end
			}
		} )
		tvColorGreen2:RegisterAnimationSequence( "blueSlot2", {
			{
				function ()
					return self.tvColorGreen2:SetAlpha( 0, 0 )
				end
			}
		} )
		tvColorGreen3:RegisterAnimationSequence( "blueSlot2", {
			{
				function ()
					return self.tvColorGreen3:SetAlpha( 1, 0 )
				end
			}
		} )
		tvColorRed3:RegisterAnimationSequence( "blueSlot2", {
			{
				function ()
					return self.tvColorRed3:SetAlpha( 0, 0 )
				end
			}
		} )
		tvColorBlue3:RegisterAnimationSequence( "blueSlot2", {
			{
				function ()
					return self.tvColorBlue3:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.blueSlot2 = function ()
			tvColorBlue1:AnimateSequence( "blueSlot2" )
			tvColorRed1:AnimateSequence( "blueSlot2" )
			tvColorRed2:AnimateSequence( "blueSlot2" )
			tvColorBlue2:AnimateSequence( "blueSlot2" )
			tvColorGreen2:AnimateSequence( "blueSlot2" )
			tvColorGreen3:AnimateSequence( "blueSlot2" )
			tvColorRed3:AnimateSequence( "blueSlot2" )
			tvColorBlue3:AnimateSequence( "blueSlot2" )
		end
		
		tvColorGreen1:RegisterAnimationSequence( "greenSlot2", {
			{
				function ()
					return self.tvColorGreen1:SetAlpha( 0, 0 )
				end
			}
		} )
		tvColorBlue1:RegisterAnimationSequence( "greenSlot2", {
			{
				function ()
					return self.tvColorBlue1:SetAlpha( 0, 0 )
				end
			}
		} )
		tvColorRed1:RegisterAnimationSequence( "greenSlot2", {
			{
				function ()
					return self.tvColorRed1:SetAlpha( 1, 0 )
				end
			}
		} )
		tvColorRed2:RegisterAnimationSequence( "greenSlot2", {
			{
				function ()
					return self.tvColorRed2:SetAlpha( 0, 0 )
				end
			}
		} )
		tvColorBlue2:RegisterAnimationSequence( "greenSlot2", {
			{
				function ()
					return self.tvColorBlue2:SetAlpha( 0, 0 )
				end
			}
		} )
		tvColorGreen2:RegisterAnimationSequence( "greenSlot2", {
			{
				function ()
					return self.tvColorGreen2:SetAlpha( 1, 0 )
				end
			}
		} )
		tvColorGreen3:RegisterAnimationSequence( "greenSlot2", {
			{
				function ()
					return self.tvColorGreen3:SetAlpha( 0, 0 )
				end
			}
		} )
		tvColorRed3:RegisterAnimationSequence( "greenSlot2", {
			{
				function ()
					return self.tvColorRed3:SetAlpha( 0, 0 )
				end
			}
		} )
		tvColorBlue3:RegisterAnimationSequence( "greenSlot2", {
			{
				function ()
					return self.tvColorBlue3:SetAlpha( 1, 0 )
				end
			}
		} )
		self._sequences.greenSlot2 = function ()
			tvColorGreen1:AnimateSequence( "greenSlot2" )
			tvColorBlue1:AnimateSequence( "greenSlot2" )
			tvColorRed1:AnimateSequence( "greenSlot2" )
			tvColorRed2:AnimateSequence( "greenSlot2" )
			tvColorBlue2:AnimateSequence( "greenSlot2" )
			tvColorGreen2:AnimateSequence( "greenSlot2" )
			tvColorGreen3:AnimateSequence( "greenSlot2" )
			tvColorRed3:AnimateSequence( "greenSlot2" )
			tvColorBlue3:AnimateSequence( "greenSlot2" )
		end
		
		tvColorGreen1:RegisterAnimationSequence( "redSlot3", {
			{
				function ()
					return self.tvColorGreen1:SetAlpha( 1, 0 )
				end
			}
		} )
		tvColorBlue1:RegisterAnimationSequence( "redSlot3", {
			{
				function ()
					return self.tvColorBlue1:SetAlpha( 0, 0 )
				end
			}
		} )
		tvColorRed1:RegisterAnimationSequence( "redSlot3", {
			{
				function ()
					return self.tvColorRed1:SetAlpha( 0, 0 )
				end
			}
		} )
		tvColorRed2:RegisterAnimationSequence( "redSlot3", {
			{
				function ()
					return self.tvColorRed2:SetAlpha( 0, 0 )
				end
			}
		} )
		tvColorBlue2:RegisterAnimationSequence( "redSlot3", {
			{
				function ()
					return self.tvColorBlue2:SetAlpha( 1, 0 )
				end
			}
		} )
		tvColorGreen2:RegisterAnimationSequence( "redSlot3", {
			{
				function ()
					return self.tvColorGreen2:SetAlpha( 0, 0 )
				end
			}
		} )
		tvColorGreen3:RegisterAnimationSequence( "redSlot3", {
			{
				function ()
					return self.tvColorGreen3:SetAlpha( 0, 0 )
				end
			}
		} )
		tvColorRed3:RegisterAnimationSequence( "redSlot3", {
			{
				function ()
					return self.tvColorRed3:SetAlpha( 1, 0 )
				end
			}
		} )
		tvColorBlue3:RegisterAnimationSequence( "redSlot3", {
			{
				function ()
					return self.tvColorBlue3:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.redSlot3 = function ()
			tvColorGreen1:AnimateSequence( "redSlot3" )
			tvColorBlue1:AnimateSequence( "redSlot3" )
			tvColorRed1:AnimateSequence( "redSlot3" )
			tvColorRed2:AnimateSequence( "redSlot3" )
			tvColorBlue2:AnimateSequence( "redSlot3" )
			tvColorGreen2:AnimateSequence( "redSlot3" )
			tvColorGreen3:AnimateSequence( "redSlot3" )
			tvColorRed3:AnimateSequence( "redSlot3" )
			tvColorBlue3:AnimateSequence( "redSlot3" )
		end
		
		tvColorGreen1:RegisterAnimationSequence( "blueSlot3", {
			{
				function ()
					return self.tvColorGreen1:SetAlpha( 1, 0 )
				end
			}
		} )
		tvColorBlue1:RegisterAnimationSequence( "blueSlot3", {
			{
				function ()
					return self.tvColorBlue1:SetAlpha( 0, 0 )
				end
			}
		} )
		tvColorRed1:RegisterAnimationSequence( "blueSlot3", {
			{
				function ()
					return self.tvColorRed1:SetAlpha( 0, 0 )
				end
			}
		} )
		tvColorRed2:RegisterAnimationSequence( "blueSlot3", {
			{
				function ()
					return self.tvColorRed2:SetAlpha( 1, 0 )
				end
			}
		} )
		tvColorBlue2:RegisterAnimationSequence( "blueSlot3", {
			{
				function ()
					return self.tvColorBlue2:SetAlpha( 0, 0 )
				end
			}
		} )
		tvColorGreen2:RegisterAnimationSequence( "blueSlot3", {
			{
				function ()
					return self.tvColorGreen2:SetAlpha( 0, 0 )
				end
			}
		} )
		tvColorGreen3:RegisterAnimationSequence( "blueSlot3", {
			{
				function ()
					return self.tvColorGreen3:SetAlpha( 0, 0 )
				end
			}
		} )
		tvColorRed3:RegisterAnimationSequence( "blueSlot3", {
			{
				function ()
					return self.tvColorRed3:SetAlpha( 0, 0 )
				end
			}
		} )
		tvColorBlue3:RegisterAnimationSequence( "blueSlot3", {
			{
				function ()
					return self.tvColorBlue3:SetAlpha( 1, 0 )
				end
			}
		} )
		self._sequences.blueSlot3 = function ()
			tvColorGreen1:AnimateSequence( "blueSlot3" )
			tvColorBlue1:AnimateSequence( "blueSlot3" )
			tvColorRed1:AnimateSequence( "blueSlot3" )
			tvColorRed2:AnimateSequence( "blueSlot3" )
			tvColorBlue2:AnimateSequence( "blueSlot3" )
			tvColorGreen2:AnimateSequence( "blueSlot3" )
			tvColorGreen3:AnimateSequence( "blueSlot3" )
			tvColorRed3:AnimateSequence( "blueSlot3" )
			tvColorBlue3:AnimateSequence( "blueSlot3" )
		end
		
		tvColorGreen1:RegisterAnimationSequence( "greenSlot3", {
			{
				function ()
					return self.tvColorGreen1:SetAlpha( 0, 0 )
				end
			}
		} )
		tvColorBlue1:RegisterAnimationSequence( "greenSlot3", {
			{
				function ()
					return self.tvColorBlue1:SetAlpha( 1, 0 )
				end
			}
		} )
		tvColorRed1:RegisterAnimationSequence( "greenSlot3", {
			{
				function ()
					return self.tvColorRed1:SetAlpha( 0, 0 )
				end
			}
		} )
		tvColorRed2:RegisterAnimationSequence( "greenSlot3", {
			{
				function ()
					return self.tvColorRed2:SetAlpha( 1, 0 )
				end
			}
		} )
		tvColorBlue2:RegisterAnimationSequence( "greenSlot3", {
			{
				function ()
					return self.tvColorBlue2:SetAlpha( 0, 0 )
				end
			}
		} )
		tvColorGreen2:RegisterAnimationSequence( "greenSlot3", {
			{
				function ()
					return self.tvColorGreen2:SetAlpha( 0, 0 )
				end
			}
		} )
		tvColorGreen3:RegisterAnimationSequence( "greenSlot3", {
			{
				function ()
					return self.tvColorGreen3:SetAlpha( 1, 0 )
				end
			}
		} )
		tvColorRed3:RegisterAnimationSequence( "greenSlot3", {
			{
				function ()
					return self.tvColorRed3:SetAlpha( 0, 0 )
				end
			}
		} )
		tvColorBlue3:RegisterAnimationSequence( "greenSlot3", {
			{
				function ()
					return self.tvColorBlue3:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.greenSlot3 = function ()
			tvColorGreen1:AnimateSequence( "greenSlot3" )
			tvColorBlue1:AnimateSequence( "greenSlot3" )
			tvColorRed1:AnimateSequence( "greenSlot3" )
			tvColorRed2:AnimateSequence( "greenSlot3" )
			tvColorBlue2:AnimateSequence( "greenSlot3" )
			tvColorGreen2:AnimateSequence( "greenSlot3" )
			tvColorGreen3:AnimateSequence( "greenSlot3" )
			tvColorRed3:AnimateSequence( "greenSlot3" )
			tvColorBlue3:AnimateSequence( "greenSlot3" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	local f4_local21 = function ()
		if DataSources.inGame.CP.zombies.dlc3.colorKeySlot:GetValue( f4_local1 ) ~= nil and DataSources.inGame.CP.zombies.dlc3.colorKeySlot:GetValue( f4_local1 ) == 1 and DataSources.inGame.CP.zombies.dlc3.colorCorrect:GetValue( f4_local1 ) ~= nil and DataSources.inGame.CP.zombies.dlc3.colorCorrect:GetValue( f4_local1 ) == 1 then
			ACTIONS.AnimateSequence( self, "redSlot1" )
		end
		if DataSources.inGame.CP.zombies.dlc3.colorKeySlot:GetValue( f4_local1 ) ~= nil and DataSources.inGame.CP.zombies.dlc3.colorKeySlot:GetValue( f4_local1 ) == 1 and DataSources.inGame.CP.zombies.dlc3.colorCorrect:GetValue( f4_local1 ) ~= nil and DataSources.inGame.CP.zombies.dlc3.colorCorrect:GetValue( f4_local1 ) == 2 then
			ACTIONS.AnimateSequence( self, "greenSlot1" )
		end
		if DataSources.inGame.CP.zombies.dlc3.colorKeySlot:GetValue( f4_local1 ) ~= nil and DataSources.inGame.CP.zombies.dlc3.colorKeySlot:GetValue( f4_local1 ) == 1 and DataSources.inGame.CP.zombies.dlc3.colorCorrect:GetValue( f4_local1 ) ~= nil and DataSources.inGame.CP.zombies.dlc3.colorCorrect:GetValue( f4_local1 ) == 3 then
			ACTIONS.AnimateSequence( self, "blueSlot1" )
		end
		if DataSources.inGame.CP.zombies.dlc3.colorKeySlot:GetValue( f4_local1 ) ~= nil and DataSources.inGame.CP.zombies.dlc3.colorKeySlot:GetValue( f4_local1 ) == 2 and DataSources.inGame.CP.zombies.dlc3.colorCorrect:GetValue( f4_local1 ) ~= nil and DataSources.inGame.CP.zombies.dlc3.colorCorrect:GetValue( f4_local1 ) == 1 then
			ACTIONS.AnimateSequence( self, "redSlot2" )
		end
		if DataSources.inGame.CP.zombies.dlc3.colorKeySlot:GetValue( f4_local1 ) ~= nil and DataSources.inGame.CP.zombies.dlc3.colorKeySlot:GetValue( f4_local1 ) == 2 and DataSources.inGame.CP.zombies.dlc3.colorCorrect:GetValue( f4_local1 ) ~= nil and DataSources.inGame.CP.zombies.dlc3.colorCorrect:GetValue( f4_local1 ) == 2 then
			ACTIONS.AnimateSequence( self, "greenSlot2" )
		end
		if DataSources.inGame.CP.zombies.dlc3.colorKeySlot:GetValue( f4_local1 ) ~= nil and DataSources.inGame.CP.zombies.dlc3.colorKeySlot:GetValue( f4_local1 ) == 2 and DataSources.inGame.CP.zombies.dlc3.colorCorrect:GetValue( f4_local1 ) ~= nil and DataSources.inGame.CP.zombies.dlc3.colorCorrect:GetValue( f4_local1 ) == 3 then
			ACTIONS.AnimateSequence( self, "blueSlot2" )
		end
		if DataSources.inGame.CP.zombies.dlc3.colorKeySlot:GetValue( f4_local1 ) ~= nil and DataSources.inGame.CP.zombies.dlc3.colorKeySlot:GetValue( f4_local1 ) == 3 and DataSources.inGame.CP.zombies.dlc3.colorCorrect:GetValue( f4_local1 ) ~= nil and DataSources.inGame.CP.zombies.dlc3.colorCorrect:GetValue( f4_local1 ) == 1 then
			ACTIONS.AnimateSequence( self, "redSlot3" )
		end
		if DataSources.inGame.CP.zombies.dlc3.colorKeySlot:GetValue( f4_local1 ) ~= nil and DataSources.inGame.CP.zombies.dlc3.colorKeySlot:GetValue( f4_local1 ) == 3 and DataSources.inGame.CP.zombies.dlc3.colorCorrect:GetValue( f4_local1 ) ~= nil and DataSources.inGame.CP.zombies.dlc3.colorCorrect:GetValue( f4_local1 ) == 2 then
			ACTIONS.AnimateSequence( self, "greenSlot3" )
		end
		if DataSources.inGame.CP.zombies.dlc3.colorKeySlot:GetValue( f4_local1 ) ~= nil and DataSources.inGame.CP.zombies.dlc3.colorKeySlot:GetValue( f4_local1 ) == 3 and DataSources.inGame.CP.zombies.dlc3.colorCorrect:GetValue( f4_local1 ) ~= nil and DataSources.inGame.CP.zombies.dlc3.colorCorrect:GetValue( f4_local1 ) == 3 then
			ACTIONS.AnimateSequence( self, "blueSlot3" )
		end
	end
	
	self:SubscribeToModel( DataSources.inGame.CP.zombies.dlc3.colorKeySlot:GetModel( f4_local1 ), f4_local21 )
	self:SubscribeToModel( DataSources.inGame.CP.zombies.dlc3.colorCorrect:GetModel( f4_local1 ), f4_local21 )
	PostLoadFunc( self, f4_local1, controller )
	return self
end

MenuBuilder.registerType( "constantEye", constantEye )
LockTable( _M )
