local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function PostLoadFunc( f1_arg0, f1_arg1 )
	local f1_local0 = function ()
		local f2_local0 = DataSources.inGame.CP.zombies.dlc3.bombCodeDisplay:GetValue( f1_arg1 )
		if f2_local0 < 0 then
			f1_arg0.NuclearCode:SetAlpha( 0, 0 )
		elseif f2_local0 >= 0 and f2_local0 < 10 then
			f1_arg0.NuclearCode:SetAlpha( 1, 0 )
		elseif f2_local0 >= 10 and f2_local0 < 100 then
			f1_arg0.NuclearCode:SetAlpha( 1, 0 )
		elseif f2_local0 >= 100 and f2_local0 < 1000 then
			f1_arg0.NuclearCode:SetAlpha( 1, 0 )
		elseif f2_local0 >= 1000 and f2_local0 < 10000 then
			f1_arg0.NuclearCode:SetAlpha( 1, 0 )
		elseif f2_local0 >= 10000 and f2_local0 < 100000 then
			
		else
			
		end
	end
	
	f1_arg0:SubscribeToModel( DataSources.inGame.CP.zombies.dlc3.bombCounterFailedAttempt:GetModel( f1_arg1 ), function ()
		local f3_local0 = DataSources.inGame.CP.zombies.dlc3.bombCounterFailedAttempt:GetValue( f1_arg1 )
		if f3_local0 == 1 then
			f1_arg0.X1image:SetAlpha( 1, 0 )
		elseif f3_local0 == 2 then
			f1_arg0.X1image:SetAlpha( 1, 0 )
			f1_arg0.X2image:SetAlpha( 1, 0 )
		elseif f3_local0 == 3 then
			f1_arg0.X1image:SetAlpha( 1, 0 )
			f1_arg0.X2image:SetAlpha( 1, 0 )
			f1_arg0.X3image:SetAlpha( 1, 0 )
		end
	end )
	f1_arg0:SubscribeToModel( DataSources.inGame.CP.zombies.dlc3.bombCodeDisplay:GetModel( f1_arg1 ), f1_local0 )
end

function liferayCounter( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 493 * _1080p, 0, 191 * _1080p )
	self.id = "liferayCounter"
	self._animationSets = {}
	self._sequences = {}
	local f4_local1 = controller and controller.controllerIndex
	if not f4_local1 and not Engine.InFrontend() then
		f4_local1 = self:getRootController()
	end
	assert( f4_local1 )
	local f4_local2 = self
	local background = nil
	
	background = LUI.UIImage.new()
	background.id = "background"
	background:SetAlpha( 0, 0 )
	background:SetScale( -0.5, 0 )
	background:setImage( RegisterMaterial( "cp_town_bomb_bg" ), 0 )
	background:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -264.82, _1080p * 759.18, _1080p * -127.5, _1080p * 384.5 )
	self:addElement( background )
	self.background = background
	
	local Button0Copy0 = nil
	
	Button0Copy0 = LUI.UIImage.new()
	Button0Copy0.id = "Button0Copy0"
	Button0Copy0:SetRGBFromInt( 8617084, 0 )
	Button0Copy0:SetAlpha( 0.1, 0 )
	Button0Copy0:SetScale( -0.77, 0 )
	Button0Copy0:setImage( RegisterMaterial( "cp_town_bomb_light_on" ), 0 )
	Button0Copy0:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 61.12, _1080p * 189.12, _1080p * 78.9, _1080p * 206.9 )
	self:addElement( Button0Copy0 )
	self.Button0Copy0 = Button0Copy0
	
	local Button0 = nil
	
	Button0 = LUI.UIImage.new()
	Button0.id = "Button0"
	Button0:SetAlpha( 0, 0 )
	Button0:SetScale( -0.77, 0 )
	Button0:setImage( RegisterMaterial( "cp_town_bomb_light_on" ), 0 )
	Button0:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 61.12, _1080p * 189.12, _1080p * 78.9, _1080p * 206.9 )
	self:addElement( Button0 )
	self.Button0 = Button0
	
	local Button1Copy0 = nil
	
	Button1Copy0 = LUI.UIImage.new()
	Button1Copy0.id = "Button1Copy0"
	Button1Copy0:SetRGBFromInt( 8617084, 0 )
	Button1Copy0:SetAlpha( 0.1, 0 )
	Button1Copy0:SetScale( -0.77, 0 )
	Button1Copy0:setImage( RegisterMaterial( "cp_town_bomb_light_on" ), 0 )
	Button1Copy0:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 88.32, _1080p * 216.32, _1080p * 78.9, _1080p * 206.9 )
	self:addElement( Button1Copy0 )
	self.Button1Copy0 = Button1Copy0
	
	local Button1 = nil
	
	Button1 = LUI.UIImage.new()
	Button1.id = "Button1"
	Button1:SetAlpha( 0, 0 )
	Button1:SetScale( -0.77, 0 )
	Button1:setImage( RegisterMaterial( "cp_town_bomb_light_on" ), 0 )
	Button1:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 88.32, _1080p * 216.32, _1080p * 78.9, _1080p * 206.9 )
	self:addElement( Button1 )
	self.Button1 = Button1
	
	local Button2Copy0 = nil
	
	Button2Copy0 = LUI.UIImage.new()
	Button2Copy0.id = "Button2Copy0"
	Button2Copy0:SetRGBFromInt( 8617084, 0 )
	Button2Copy0:SetAlpha( 0.1, 0 )
	Button2Copy0:SetScale( -0.77, 0 )
	Button2Copy0:setImage( RegisterMaterial( "cp_town_bomb_light_on" ), 0 )
	Button2Copy0:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 116.28, _1080p * 244.28, _1080p * 78.9, _1080p * 206.9 )
	self:addElement( Button2Copy0 )
	self.Button2Copy0 = Button2Copy0
	
	local Button2 = nil
	
	Button2 = LUI.UIImage.new()
	Button2.id = "Button2"
	Button2:SetAlpha( 0, 0 )
	Button2:SetScale( -0.77, 0 )
	Button2:setImage( RegisterMaterial( "cp_town_bomb_light_on" ), 0 )
	Button2:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 116.28, _1080p * 244.28, _1080p * 78.9, _1080p * 206.9 )
	self:addElement( Button2 )
	self.Button2 = Button2
	
	local Button3Copy0 = nil
	
	Button3Copy0 = LUI.UIImage.new()
	Button3Copy0.id = "Button3Copy0"
	Button3Copy0:SetRGBFromInt( 8617084, 0 )
	Button3Copy0:SetAlpha( 0.1, 0 )
	Button3Copy0:SetScale( -0.77, 0 )
	Button3Copy0:setImage( RegisterMaterial( "cp_town_bomb_light_on" ), 0 )
	Button3Copy0:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 143.87, _1080p * 271.87, _1080p * 78.9, _1080p * 206.9 )
	self:addElement( Button3Copy0 )
	self.Button3Copy0 = Button3Copy0
	
	local Button3 = nil
	
	Button3 = LUI.UIImage.new()
	Button3.id = "Button3"
	Button3:SetAlpha( 0, 0 )
	Button3:SetScale( -0.77, 0 )
	Button3:setImage( RegisterMaterial( "cp_town_bomb_light_on" ), 0 )
	Button3:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 143.87, _1080p * 271.87, _1080p * 78.9, _1080p * 206.9 )
	self:addElement( Button3 )
	self.Button3 = Button3
	
	local Button4Copy0 = nil
	
	Button4Copy0 = LUI.UIImage.new()
	Button4Copy0.id = "Button4Copy0"
	Button4Copy0:SetRGBFromInt( 8617084, 0 )
	Button4Copy0:SetAlpha( 0.1, 0 )
	Button4Copy0:SetScale( -0.77, 0 )
	Button4Copy0:setImage( RegisterMaterial( "cp_town_bomb_light_on" ), 0 )
	Button4Copy0:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 170.91, _1080p * 298.91, _1080p * 78.9, _1080p * 206.9 )
	self:addElement( Button4Copy0 )
	self.Button4Copy0 = Button4Copy0
	
	local Button4 = nil
	
	Button4 = LUI.UIImage.new()
	Button4.id = "Button4"
	Button4:SetAlpha( 0, 0 )
	Button4:SetScale( -0.77, 0 )
	Button4:setImage( RegisterMaterial( "cp_town_bomb_light_on" ), 0 )
	Button4:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 170.91, _1080p * 298.91, _1080p * 78.9, _1080p * 206.9 )
	self:addElement( Button4 )
	self.Button4 = Button4
	
	local Button5Copy0 = nil
	
	Button5Copy0 = LUI.UIImage.new()
	Button5Copy0.id = "Button5Copy0"
	Button5Copy0:SetRGBFromInt( 8617084, 0 )
	Button5Copy0:SetAlpha( 0.1, 0 )
	Button5Copy0:SetScale( -0.77, 0 )
	Button5Copy0:setImage( RegisterMaterial( "cp_town_bomb_light_on" ), 0 )
	Button5Copy0:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 197.54, _1080p * 325.54, _1080p * 78.9, _1080p * 206.9 )
	self:addElement( Button5Copy0 )
	self.Button5Copy0 = Button5Copy0
	
	local Button5 = nil
	
	Button5 = LUI.UIImage.new()
	Button5.id = "Button5"
	Button5:SetAlpha( 0, 0 )
	Button5:SetScale( -0.77, 0 )
	Button5:setImage( RegisterMaterial( "cp_town_bomb_light_on" ), 0 )
	Button5:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 197.54, _1080p * 325.54, _1080p * 78.9, _1080p * 206.9 )
	self:addElement( Button5 )
	self.Button5 = Button5
	
	local Button6Copy0 = nil
	
	Button6Copy0 = LUI.UIImage.new()
	Button6Copy0.id = "Button6Copy0"
	Button6Copy0:SetRGBFromInt( 8617084, 0 )
	Button6Copy0:SetAlpha( 0.1, 0 )
	Button6Copy0:SetScale( -0.77, 0 )
	Button6Copy0:setImage( RegisterMaterial( "cp_town_bomb_light_on" ), 0 )
	Button6Copy0:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 224.4, _1080p * 352.4, _1080p * 78.9, _1080p * 206.9 )
	self:addElement( Button6Copy0 )
	self.Button6Copy0 = Button6Copy0
	
	local Button6 = nil
	
	Button6 = LUI.UIImage.new()
	Button6.id = "Button6"
	Button6:SetAlpha( 0, 0 )
	Button6:SetScale( -0.77, 0 )
	Button6:setImage( RegisterMaterial( "cp_town_bomb_light_on" ), 0 )
	Button6:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 224.4, _1080p * 352.4, _1080p * 78.9, _1080p * 206.9 )
	self:addElement( Button6 )
	self.Button6 = Button6
	
	local Button7Copy0 = nil
	
	Button7Copy0 = LUI.UIImage.new()
	Button7Copy0.id = "Button7Copy0"
	Button7Copy0:SetRGBFromInt( 8617084, 0 )
	Button7Copy0:SetAlpha( 0.1, 0 )
	Button7Copy0:SetScale( -0.77, 0 )
	Button7Copy0:setImage( RegisterMaterial( "cp_town_bomb_light_on" ), 0 )
	Button7Copy0:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 251.39, _1080p * 379.39, _1080p * 78.9, _1080p * 206.9 )
	self:addElement( Button7Copy0 )
	self.Button7Copy0 = Button7Copy0
	
	local Button7 = nil
	
	Button7 = LUI.UIImage.new()
	Button7.id = "Button7"
	Button7:SetAlpha( 0, 0 )
	Button7:SetScale( -0.77, 0 )
	Button7:setImage( RegisterMaterial( "cp_town_bomb_light_on" ), 0 )
	Button7:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 251.39, _1080p * 379.39, _1080p * 78.9, _1080p * 206.9 )
	self:addElement( Button7 )
	self.Button7 = Button7
	
	local Button8Copy0 = nil
	
	Button8Copy0 = LUI.UIImage.new()
	Button8Copy0.id = "Button8Copy0"
	Button8Copy0:SetRGBFromInt( 8617084, 0 )
	Button8Copy0:SetAlpha( 0.1, 0 )
	Button8Copy0:SetScale( -0.77, 0 )
	Button8Copy0:setImage( RegisterMaterial( "cp_town_bomb_light_on" ), 0 )
	Button8Copy0:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 277.18, _1080p * 405.18, _1080p * 78.9, _1080p * 206.9 )
	self:addElement( Button8Copy0 )
	self.Button8Copy0 = Button8Copy0
	
	local Button8 = nil
	
	Button8 = LUI.UIImage.new()
	Button8.id = "Button8"
	Button8:SetAlpha( 0, 0 )
	Button8:SetScale( -0.77, 0 )
	Button8:setImage( RegisterMaterial( "cp_town_bomb_light_on" ), 0 )
	Button8:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 277.18, _1080p * 405.18, _1080p * 78.9, _1080p * 206.9 )
	self:addElement( Button8 )
	self.Button8 = Button8
	
	local Button9Copy0 = nil
	
	Button9Copy0 = LUI.UIImage.new()
	Button9Copy0.id = "Button9Copy0"
	Button9Copy0:SetRGBFromInt( 8617084, 0 )
	Button9Copy0:SetAlpha( 0.1, 0 )
	Button9Copy0:SetScale( -0.77, 0 )
	Button9Copy0:setImage( RegisterMaterial( "cp_town_bomb_light_on" ), 0 )
	Button9Copy0:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 304.01, _1080p * 432.01, _1080p * 78.9, _1080p * 206.9 )
	self:addElement( Button9Copy0 )
	self.Button9Copy0 = Button9Copy0
	
	local Button9 = nil
	
	Button9 = LUI.UIImage.new()
	Button9.id = "Button9"
	Button9:SetAlpha( 0, 0 )
	Button9:SetScale( -0.77, 0 )
	Button9:setImage( RegisterMaterial( "cp_town_bomb_light_on" ), 0 )
	Button9:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 304.01, _1080p * 432.01, _1080p * 78.9, _1080p * 206.9 )
	self:addElement( Button9 )
	self.Button9 = Button9
	
	local Label0 = nil
	
	Label0 = LUI.UIImage.new()
	Label0.id = "Label0"
	Label0:SetAlpha( 0, 0 )
	Label0:SetScale( -0.75, 0 )
	Label0:setImage( RegisterMaterial( "cp_town_bomb_number_0" ), 0 )
	Label0:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 61.6, _1080p * 189.6, _1080p * 29.94, _1080p * 285.94 )
	self:addElement( Label0 )
	self.Label0 = Label0
	
	local Label1 = nil
	
	Label1 = LUI.UIImage.new()
	Label1.id = "Label1"
	Label1:SetAlpha( 0, 0 )
	Label1:SetScale( -0.75, 0 )
	Label1:setImage( RegisterMaterial( "cp_town_bomb_number_1" ), 0 )
	Label1:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 88.32, _1080p * 216.32, _1080p * 29.94, _1080p * 285.94 )
	self:addElement( Label1 )
	self.Label1 = Label1
	
	local Label2 = nil
	
	Label2 = LUI.UIImage.new()
	Label2.id = "Label2"
	Label2:SetAlpha( 0, 0 )
	Label2:SetScale( -0.75, 0 )
	Label2:setImage( RegisterMaterial( "cp_town_bomb_number_2" ), 0 )
	Label2:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 116.28, _1080p * 244.28, _1080p * 29.94, _1080p * 285.94 )
	self:addElement( Label2 )
	self.Label2 = Label2
	
	local Label3 = nil
	
	Label3 = LUI.UIImage.new()
	Label3.id = "Label3"
	Label3:SetAlpha( 0, 0 )
	Label3:SetScale( -0.75, 0 )
	Label3:setImage( RegisterMaterial( "cp_town_bomb_number_3" ), 0 )
	Label3:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 143.87, _1080p * 271.87, _1080p * 29.94, _1080p * 285.94 )
	self:addElement( Label3 )
	self.Label3 = Label3
	
	local Label4 = nil
	
	Label4 = LUI.UIImage.new()
	Label4.id = "Label4"
	Label4:SetAlpha( 0, 0 )
	Label4:SetScale( -0.75, 0 )
	Label4:setImage( RegisterMaterial( "cp_town_bomb_number_4" ), 0 )
	Label4:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 169.67, _1080p * 297.67, _1080p * 29.94, _1080p * 285.94 )
	self:addElement( Label4 )
	self.Label4 = Label4
	
	local Label5 = nil
	
	Label5 = LUI.UIImage.new()
	Label5.id = "Label5"
	Label5:SetAlpha( 0, 0 )
	Label5:SetScale( -0.75, 0 )
	Label5:setImage( RegisterMaterial( "cp_town_bomb_number_5" ), 0 )
	Label5:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 197.5, _1080p * 325.5, _1080p * 29.94, _1080p * 285.94 )
	self:addElement( Label5 )
	self.Label5 = Label5
	
	local Label6 = nil
	
	Label6 = LUI.UIImage.new()
	Label6.id = "Label6"
	Label6:SetAlpha( 0, 0 )
	Label6:SetScale( -0.75, 0 )
	Label6:setImage( RegisterMaterial( "cp_town_bomb_number_6" ), 0 )
	Label6:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 223.4, _1080p * 351.4, _1080p * 29.94, _1080p * 285.94 )
	self:addElement( Label6 )
	self.Label6 = Label6
	
	local Label7 = nil
	
	Label7 = LUI.UIImage.new()
	Label7.id = "Label7"
	Label7:SetAlpha( 0, 0 )
	Label7:SetScale( -0.75, 0 )
	Label7:setImage( RegisterMaterial( "cp_town_bomb_number_7" ), 0 )
	Label7:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 249.67, _1080p * 377.67, _1080p * 29.94, _1080p * 285.94 )
	self:addElement( Label7 )
	self.Label7 = Label7
	
	local Label8 = nil
	
	Label8 = LUI.UIImage.new()
	Label8.id = "Label8"
	Label8:SetAlpha( 0, 0 )
	Label8:SetScale( -0.75, 0 )
	Label8:setImage( RegisterMaterial( "cp_town_bomb_number_8" ), 0 )
	Label8:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 276.91, _1080p * 404.91, _1080p * 29.94, _1080p * 285.94 )
	self:addElement( Label8 )
	self.Label8 = Label8
	
	local Label9 = nil
	
	Label9 = LUI.UIImage.new()
	Label9.id = "Label9"
	Label9:SetAlpha( 0, 0 )
	Label9:SetScale( -0.75, 0 )
	Label9:setImage( RegisterMaterial( "cp_town_bomb_number_9" ), 0 )
	Label9:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 305.01, _1080p * 433.01, _1080p * 29.94, _1080p * 285.94 )
	self:addElement( Label9 )
	self.Label9 = Label9
	
	local NuclearCode = nil
	
	NuclearCode = LUI.UIText.new()
	NuclearCode.id = "NuclearCode"
	NuclearCode:SetRGBFromInt( 16236070, 0 )
	NuclearCode:SetAlpha( 0.67, 0 )
	NuclearCode:SetFontSize( 105 * _1080p )
	NuclearCode:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	NuclearCode:SetAlignment( LUI.Alignment.Left )
	NuclearCode:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 116.28, _1080p * 436.38, _1080p * 34.5, _1080p * 137.5 )
	NuclearCode:SubscribeToModel( DataSources.inGame.CP.zombies.dlc3.bombCodeDisplay:GetModel( f4_local1 ), function ()
		local f5_local0 = DataSources.inGame.CP.zombies.dlc3.bombCodeDisplay:GetValue( f4_local1 )
		if f5_local0 ~= nil then
			NuclearCode:setText( f5_local0, 0 )
		end
	end )
	self:addElement( NuclearCode )
	self.NuclearCode = NuclearCode
	
	local dash0 = nil
	
	dash0 = LUI.UIImage.new()
	dash0.id = "dash0"
	dash0:SetRGBFromInt( 16711680, 0 )
	dash0:SetAlpha( 0, 0 )
	dash0:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 125.3, _1080p * 153.28, _1080p * 75, _1080p * 80 )
	self:addElement( dash0 )
	self.dash0 = dash0
	
	local dash10 = nil
	
	dash10 = LUI.UIImage.new()
	dash10.id = "dash10"
	dash10:SetRGBFromInt( 16711680, 0 )
	dash10:SetAlpha( 0, 0 )
	dash10:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 177.96, _1080p * 205.95, _1080p * 75, _1080p * 80 )
	self:addElement( dash10 )
	self.dash10 = dash10
	
	local dash100 = nil
	
	dash100 = LUI.UIImage.new()
	dash100.id = "dash100"
	dash100:SetRGBFromInt( 16711680, 0 )
	dash100:SetAlpha( 0, 0 )
	dash100:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 230.91, _1080p * 258.9, _1080p * 75, _1080p * 80 )
	self:addElement( dash100 )
	self.dash100 = dash100
	
	local dash1000 = nil
	
	dash1000 = LUI.UIImage.new()
	dash1000.id = "dash1000"
	dash1000:SetRGBFromInt( 16711680, 0 )
	dash1000:SetAlpha( 0, 0 )
	dash1000:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 284.4, _1080p * 312.39, _1080p * 74, _1080p * 79 )
	self:addElement( dash1000 )
	self.dash1000 = dash1000
	
	local dash10000 = nil
	
	dash10000 = LUI.UIImage.new()
	dash10000.id = "dash10000"
	dash10000:SetRGBFromInt( 16711680, 0 )
	dash10000:SetAlpha( 0, 0 )
	dash10000:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 337.91, _1080p * 365.9, _1080p * 74, _1080p * 79 )
	self:addElement( dash10000 )
	self.dash10000 = dash10000
	
	local X3image = nil
	
	X3image = LUI.UIImage.new()
	X3image.id = "X3image"
	X3image:SetAlpha( 0, 0 )
	X3image:SetScale( -0.76, 0 )
	X3image:setImage( RegisterMaterial( "cp_town_bomb_x" ), 0 )
	X3image:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 187.39, _1080p * 443.39, _1080p * 73, _1080p * 329 )
	self:addElement( X3image )
	self.X3image = X3image
	
	local X2image = nil
	
	X2image = LUI.UIImage.new()
	X2image.id = "X2image"
	X2image:SetAlpha( 0, 0 )
	X2image:SetScale( -0.76, 0 )
	X2image:setImage( RegisterMaterial( "cp_town_bomb_x" ), 0 )
	X2image:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 120.39, _1080p * 376.39, _1080p * 73, _1080p * 329 )
	self:addElement( X2image )
	self.X2image = X2image
	
	local X1image = nil
	
	X1image = LUI.UIImage.new()
	X1image.id = "X1image"
	X1image:SetAlpha( 0, 0 )
	X1image:SetScale( -0.76, 0 )
	X1image:setImage( RegisterMaterial( "cp_town_bomb_x" ), 0 )
	X1image:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 52.39, _1080p * 308.39, _1080p * 73, _1080p * 329 )
	self:addElement( X1image )
	self.X1image = X1image
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		Button0:RegisterAnimationSequence( "digit0on", {
			{
				function ()
					return self.Button0:SetAlpha( 1, 0 )
				end
			}
		} )
		Button9:RegisterAnimationSequence( "digit0on", {
			{
				function ()
					return self.Button9:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.digit0on = function ()
			Button0:AnimateSequence( "digit0on" )
			Button9:AnimateSequence( "digit0on" )
		end
		
		Button0:RegisterAnimationSequence( "digit1on", {
			{
				function ()
					return self.Button0:SetAlpha( 0, 0 )
				end
			}
		} )
		Button1:RegisterAnimationSequence( "digit1on", {
			{
				function ()
					return self.Button1:SetAlpha( 1, 0 )
				end
			}
		} )
		self._sequences.digit1on = function ()
			Button0:AnimateSequence( "digit1on" )
			Button1:AnimateSequence( "digit1on" )
		end
		
		Button1:RegisterAnimationSequence( "digit2on", {
			{
				function ()
					return self.Button1:SetAlpha( 0, 0 )
				end
			}
		} )
		Button2:RegisterAnimationSequence( "digit2on", {
			{
				function ()
					return self.Button2:SetAlpha( 1, 0 )
				end
			}
		} )
		self._sequences.digit2on = function ()
			Button1:AnimateSequence( "digit2on" )
			Button2:AnimateSequence( "digit2on" )
		end
		
		Button2:RegisterAnimationSequence( "digit3on", {
			{
				function ()
					return self.Button2:SetAlpha( 0, 0 )
				end
			}
		} )
		Button3:RegisterAnimationSequence( "digit3on", {
			{
				function ()
					return self.Button3:SetAlpha( 1, 0 )
				end
			}
		} )
		self._sequences.digit3on = function ()
			Button2:AnimateSequence( "digit3on" )
			Button3:AnimateSequence( "digit3on" )
		end
		
		Button3:RegisterAnimationSequence( "digit4on", {
			{
				function ()
					return self.Button3:SetAlpha( 0, 0 )
				end
			}
		} )
		Button4:RegisterAnimationSequence( "digit4on", {
			{
				function ()
					return self.Button4:SetAlpha( 1, 0 )
				end
			}
		} )
		self._sequences.digit4on = function ()
			Button3:AnimateSequence( "digit4on" )
			Button4:AnimateSequence( "digit4on" )
		end
		
		Button4:RegisterAnimationSequence( "digit5on", {
			{
				function ()
					return self.Button4:SetAlpha( 0, 0 )
				end
			}
		} )
		Button5:RegisterAnimationSequence( "digit5on", {
			{
				function ()
					return self.Button5:SetAlpha( 1, 0 )
				end
			}
		} )
		self._sequences.digit5on = function ()
			Button4:AnimateSequence( "digit5on" )
			Button5:AnimateSequence( "digit5on" )
		end
		
		Button5:RegisterAnimationSequence( "digit6on", {
			{
				function ()
					return self.Button5:SetAlpha( 0, 0 )
				end
			}
		} )
		Button6:RegisterAnimationSequence( "digit6on", {
			{
				function ()
					return self.Button6:SetAlpha( 1, 10 )
				end
			}
		} )
		self._sequences.digit6on = function ()
			Button5:AnimateSequence( "digit6on" )
			Button6:AnimateSequence( "digit6on" )
		end
		
		Button6:RegisterAnimationSequence( "digit7on", {
			{
				function ()
					return self.Button6:SetAlpha( 0, 0 )
				end
			}
		} )
		Button7:RegisterAnimationSequence( "digit7on", {
			{
				function ()
					return self.Button7:SetAlpha( 1, 0 )
				end
			}
		} )
		self._sequences.digit7on = function ()
			Button6:AnimateSequence( "digit7on" )
			Button7:AnimateSequence( "digit7on" )
		end
		
		Button7:RegisterAnimationSequence( "digit8on", {
			{
				function ()
					return self.Button7:SetAlpha( 0, 0 )
				end
			}
		} )
		Button8:RegisterAnimationSequence( "digit8on", {
			{
				function ()
					return self.Button8:SetAlpha( 1, 0 )
				end
			}
		} )
		self._sequences.digit8on = function ()
			Button7:AnimateSequence( "digit8on" )
			Button8:AnimateSequence( "digit8on" )
		end
		
		Button8:RegisterAnimationSequence( "digit9on", {
			{
				function ()
					return self.Button8:SetAlpha( 0, 0 )
				end
			}
		} )
		Button9:RegisterAnimationSequence( "digit9on", {
			{
				function ()
					return self.Button9:SetAlpha( 1, 0 )
				end
			}
		} )
		self._sequences.digit9on = function ()
			Button8:AnimateSequence( "digit9on" )
			Button9:AnimateSequence( "digit9on" )
		end
		
		Label0:RegisterAnimationSequence( "digit0selected", {
			{
				function ()
					return self.Label0:SetAlpha( 1, 0 )
				end,
				function ()
					return self.Label0:SetAlpha( 1, 90 )
				end,
				function ()
					return self.Label0:SetAlpha( 0, 10 )
				end
			}
		} )
		self._sequences.digit0selected = function ()
			Label0:AnimateSequence( "digit0selected" )
		end
		
		Label1:RegisterAnimationSequence( "digit1selected", {
			{
				function ()
					return self.Label1:SetAlpha( 1, 0 )
				end,
				function ()
					return self.Label1:SetAlpha( 1, 90 )
				end,
				function ()
					return self.Label1:SetAlpha( 0, 10 )
				end
			}
		} )
		self._sequences.digit1selected = function ()
			Label1:AnimateSequence( "digit1selected" )
		end
		
		Label2:RegisterAnimationSequence( "digit2selected", {
			{
				function ()
					return self.Label2:SetAlpha( 1, 0 )
				end,
				function ()
					return self.Label2:SetAlpha( 1, 90 )
				end,
				function ()
					return self.Label2:SetAlpha( 0, 10 )
				end
			}
		} )
		self._sequences.digit2selected = function ()
			Label2:AnimateSequence( "digit2selected" )
		end
		
		Label3:RegisterAnimationSequence( "digit3selected", {
			{
				function ()
					return self.Label3:SetAlpha( 1, 0 )
				end,
				function ()
					return self.Label3:SetAlpha( 1, 90 )
				end,
				function ()
					return self.Label3:SetAlpha( 0, 10 )
				end
			}
		} )
		self._sequences.digit3selected = function ()
			Label3:AnimateSequence( "digit3selected" )
		end
		
		Label4:RegisterAnimationSequence( "digit4selected", {
			{
				function ()
					return self.Label4:SetAlpha( 1, 0 )
				end,
				function ()
					return self.Label4:SetAlpha( 1, 90 )
				end,
				function ()
					return self.Label4:SetAlpha( 0, 10 )
				end
			}
		} )
		self._sequences.digit4selected = function ()
			Label4:AnimateSequence( "digit4selected" )
		end
		
		Label5:RegisterAnimationSequence( "digit5selected", {
			{
				function ()
					return self.Label5:SetAlpha( 1, 0 )
				end,
				function ()
					return self.Label5:SetAlpha( 1, 90 )
				end,
				function ()
					return self.Label5:SetAlpha( 0, 10 )
				end
			}
		} )
		self._sequences.digit5selected = function ()
			Label5:AnimateSequence( "digit5selected" )
		end
		
		Label6:RegisterAnimationSequence( "digit6selected", {
			{
				function ()
					return self.Label6:SetAlpha( 1, 0 )
				end,
				function ()
					return self.Label6:SetAlpha( 1, 90 )
				end,
				function ()
					return self.Label6:SetAlpha( 0, 10 )
				end
			}
		} )
		self._sequences.digit6selected = function ()
			Label6:AnimateSequence( "digit6selected" )
		end
		
		Label7:RegisterAnimationSequence( "digit7selected", {
			{
				function ()
					return self.Label7:SetAlpha( 1, 0 )
				end,
				function ()
					return self.Label7:SetAlpha( 1, 90 )
				end,
				function ()
					return self.Label7:SetAlpha( 0, 10 )
				end
			}
		} )
		self._sequences.digit7selected = function ()
			Label7:AnimateSequence( "digit7selected" )
		end
		
		Label8:RegisterAnimationSequence( "digit8selected", {
			{
				function ()
					return self.Label8:SetAlpha( 1, 0 )
				end,
				function ()
					return self.Label8:SetAlpha( 1, 90 )
				end,
				function ()
					return self.Label8:SetAlpha( 0, 10 )
				end
			}
		} )
		self._sequences.digit8selected = function ()
			Label8:AnimateSequence( "digit8selected" )
		end
		
		Label9:RegisterAnimationSequence( "digit9selected", {
			{
				function ()
					return self.Label9:SetAlpha( 1, 0 )
				end,
				function ()
					return self.Label9:SetAlpha( 1, 90 )
				end,
				function ()
					return self.Label9:SetAlpha( 0, 10 )
				end
			}
		} )
		self._sequences.digit9selected = function ()
			Label9:AnimateSequence( "digit9selected" )
		end
		
		NuclearCode:RegisterAnimationSequence( "Success", {
			{
				function ()
					return self.NuclearCode:SetRGBFromInt( 780061, 0 )
				end,
				function ()
					return self.NuclearCode:SetRGBFromInt( 780061, 1000 )
				end
			},
			{
				function ()
					return self.NuclearCode:SetAlpha( 1, 0 )
				end,
				function ()
					return self.NuclearCode:SetAlpha( 0, 250 )
				end,
				function ()
					return self.NuclearCode:SetAlpha( 1, 250 )
				end,
				function ()
					return self.NuclearCode:SetAlpha( 0, 250 )
				end,
				function ()
					return self.NuclearCode:SetAlpha( 1, 250 )
				end
			}
		} )
		self._sequences.Success = function ()
			NuclearCode:AnimateLoop( "Success" )
		end
		
		X3image:RegisterAnimationSequence( "Fail", {
			{
				function ()
					return self.X3image:SetAlpha( 1, 0 )
				end,
				function ()
					return self.X3image:SetAlpha( 0, 250 )
				end,
				function ()
					return self.X3image:SetAlpha( 1, 250 )
				end,
				function ()
					return self.X3image:SetAlpha( 0, 250 )
				end,
				function ()
					return self.X3image:SetAlpha( 1, 250 )
				end
			}
		} )
		X2image:RegisterAnimationSequence( "Fail", {
			{
				function ()
					return self.X2image:SetAlpha( 1, 0 )
				end,
				function ()
					return self.X2image:SetAlpha( 0, 250 )
				end,
				function ()
					return self.X2image:SetAlpha( 1, 250 )
				end,
				function ()
					return self.X2image:SetAlpha( 0, 250 )
				end,
				function ()
					return self.X2image:SetAlpha( 1, 250 )
				end
			}
		} )
		X1image:RegisterAnimationSequence( "Fail", {
			{
				function ()
					return self.X1image:SetAlpha( 1, 0 )
				end,
				function ()
					return self.X1image:SetAlpha( 0, 250 )
				end,
				function ()
					return self.X1image:SetAlpha( 1, 250 )
				end,
				function ()
					return self.X1image:SetAlpha( 0, 250 )
				end,
				function ()
					return self.X1image:SetAlpha( 1, 250 )
				end
			}
		} )
		self._sequences.Fail = function ()
			X3image:AnimateSequence( "Fail" )
			X2image:AnimateSequence( "Fail" )
			X1image:AnimateSequence( "Fail" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	self:SubscribeToModel( DataSources.inGame.CP.zombies.dlc3.bombCounterDigits:GetModel( f4_local1 ), function ()
		if DataSources.inGame.CP.zombies.dlc3.bombCounterDigits:GetValue( f4_local1 ) ~= nil and DataSources.inGame.CP.zombies.dlc3.bombCounterDigits:GetValue( f4_local1 ) == 1 then
			ACTIONS.AnimateSequence( self, "digit0on" )
		end
		if DataSources.inGame.CP.zombies.dlc3.bombCounterDigits:GetValue( f4_local1 ) ~= nil and DataSources.inGame.CP.zombies.dlc3.bombCounterDigits:GetValue( f4_local1 ) == 2 then
			ACTIONS.AnimateSequence( self, "digit1on" )
		end
		if DataSources.inGame.CP.zombies.dlc3.bombCounterDigits:GetValue( f4_local1 ) ~= nil and DataSources.inGame.CP.zombies.dlc3.bombCounterDigits:GetValue( f4_local1 ) == 3 then
			ACTIONS.AnimateSequence( self, "digit2on" )
		end
		if DataSources.inGame.CP.zombies.dlc3.bombCounterDigits:GetValue( f4_local1 ) ~= nil and DataSources.inGame.CP.zombies.dlc3.bombCounterDigits:GetValue( f4_local1 ) == 4 then
			ACTIONS.AnimateSequence( self, "digit3on" )
		end
		if DataSources.inGame.CP.zombies.dlc3.bombCounterDigits:GetValue( f4_local1 ) ~= nil and DataSources.inGame.CP.zombies.dlc3.bombCounterDigits:GetValue( f4_local1 ) == 5 then
			ACTIONS.AnimateSequence( self, "digit4on" )
		end
		if DataSources.inGame.CP.zombies.dlc3.bombCounterDigits:GetValue( f4_local1 ) ~= nil and DataSources.inGame.CP.zombies.dlc3.bombCounterDigits:GetValue( f4_local1 ) == 6 then
			ACTIONS.AnimateSequence( self, "digit5on" )
		end
		if DataSources.inGame.CP.zombies.dlc3.bombCounterDigits:GetValue( f4_local1 ) ~= nil and DataSources.inGame.CP.zombies.dlc3.bombCounterDigits:GetValue( f4_local1 ) == 7 then
			ACTIONS.AnimateSequence( self, "digit6on" )
		end
		if DataSources.inGame.CP.zombies.dlc3.bombCounterDigits:GetValue( f4_local1 ) ~= nil and DataSources.inGame.CP.zombies.dlc3.bombCounterDigits:GetValue( f4_local1 ) == 8 then
			ACTIONS.AnimateSequence( self, "digit7on" )
		end
		if DataSources.inGame.CP.zombies.dlc3.bombCounterDigits:GetValue( f4_local1 ) ~= nil and DataSources.inGame.CP.zombies.dlc3.bombCounterDigits:GetValue( f4_local1 ) == 9 then
			ACTIONS.AnimateSequence( self, "digit8on" )
		end
		if DataSources.inGame.CP.zombies.dlc3.bombCounterDigits:GetValue( f4_local1 ) ~= nil and DataSources.inGame.CP.zombies.dlc3.bombCounterDigits:GetValue( f4_local1 ) == 10 then
			ACTIONS.AnimateSequence( self, "digit9on" )
		end
	end )
	self:SubscribeToModel( DataSources.inGame.CP.zombies.dlc3.bombCounterFailedAttempt:GetModel( f4_local1 ), function ()
		if DataSources.inGame.CP.zombies.dlc3.bombCounterFailedAttempt:GetValue( f4_local1 ) ~= nil and DataSources.inGame.CP.zombies.dlc3.bombCounterFailedAttempt:GetValue( f4_local1 ) == 4 then
			ACTIONS.AnimateSequence( self, "Success" )
		end
		if DataSources.inGame.CP.zombies.dlc3.bombCounterFailedAttempt:GetValue( f4_local1 ) ~= nil and DataSources.inGame.CP.zombies.dlc3.bombCounterFailedAttempt:GetValue( f4_local1 ) == 5 then
			ACTIONS.AnimateSequence( self, "Fail" )
		end
	end )
	PostLoadFunc( self, f4_local1, controller )
	return self
end

MenuBuilder.registerType( "liferayCounter", liferayCounter )
LockTable( _M )
