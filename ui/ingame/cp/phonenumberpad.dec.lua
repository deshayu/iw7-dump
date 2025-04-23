local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function PostLoadFunc( f1_arg0, f1_arg1 )
	f1_arg0.Label0:setText( "" )
	f1_arg0.Label1:setText( "" )
	f1_arg0.Label2:setText( "" )
	f1_arg0.Label3:setText( "" )
	f1_arg0.Label4:setText( "" )
	f1_arg0.Label5:setText( "" )
	f1_arg0.Label6:setText( "" )
	f1_arg0.Label7:setText( "" )
	f1_arg0.Label8:setText( "" )
	f1_arg0.Label9:setText( "" )
	f1_arg0:SetupInWorldElement( {} )
	f1_arg0:SetInWorldScale( 0.02 )
	f1_arg0:SetWorldSpaceYaw( 90 )
	f1_arg0:SetFollowTagAngles( true )
	f1_arg0:SetTagSpacePosition( 0.5, 0, 0.9 )
	f1_arg0:SetEntityTag( "tag_key_2" )
	local f1_local0 = LUI.DataSourceFromOmnvar.new( "zm_ui_dialpad_ent" )
	f1_arg0:SubscribeToModel( f1_local0:GetModel( f1_arg1 ), function ( f2_arg0 )
		local f2_local0 = DataModel.GetModelValue( f2_arg0 )
		DebugPrint( "entNum" .. f2_local0 )
		f1_arg0:SetEntityNum( f2_local0 )
	end )
	local f1_local1 = LUI.DataSourceFromOmnvar.new( "zm_ui_dialpad_0" )
	f1_arg0:SubscribeToModel( f1_local1:GetModel( f1_arg1 ), function ( f3_arg0 )
		local f3_local0 = DataModel.GetModelValue( f3_arg0 )
		if f3_local0 == 11 then
			f1_arg0.Label0:setText( "#" )
		elseif f3_local0 == 10 then
			f1_arg0.Label0:setText( "*" )
		elseif f3_local0 >= 0 and f3_local0 <= 9 then
			f1_arg0.Label0:setText( tostring( f3_local0 ) )
		else
			f1_arg0.Label0:setText( "" )
		end
	end )
	local f1_local2 = LUI.DataSourceFromOmnvar.new( "zm_ui_dialpad_1" )
	f1_arg0:SubscribeToModel( f1_local2:GetModel( f1_arg1 ), function ( f4_arg0 )
		local f4_local0 = DataModel.GetModelValue( f4_arg0 )
		if f4_local0 == 11 then
			f1_arg0.Label1:setText( "#" )
		elseif f4_local0 == 10 then
			f1_arg0.Label1:setText( "*" )
		elseif f4_local0 >= 0 and f4_local0 <= 9 then
			f1_arg0.Label1:setText( tostring( f4_local0 ) )
		else
			f1_arg0.Label1:setText( "" )
		end
	end )
	local f1_local3 = LUI.DataSourceFromOmnvar.new( "zm_ui_dialpad_2" )
	f1_arg0:SubscribeToModel( f1_local3:GetModel( f1_arg1 ), function ( f5_arg0 )
		local f5_local0 = DataModel.GetModelValue( f5_arg0 )
		if f5_local0 == 11 then
			f1_arg0.Label2:setText( "#" )
		elseif f5_local0 == 10 then
			f1_arg0.Label2:setText( "*" )
		elseif f5_local0 >= 0 and f5_local0 <= 9 then
			f1_arg0.Label2:setText( tostring( f5_local0 ) )
		else
			f1_arg0.Label2:setText( "" )
		end
	end )
	local f1_local4 = LUI.DataSourceFromOmnvar.new( "zm_ui_dialpad_3" )
	f1_arg0:SubscribeToModel( f1_local4:GetModel( f1_arg1 ), function ( f6_arg0 )
		local f6_local0 = DataModel.GetModelValue( f6_arg0 )
		if f6_local0 == 11 then
			f1_arg0.Label3:setText( "#" )
		elseif f6_local0 == 10 then
			f1_arg0.Label3:setText( "*" )
		elseif f6_local0 >= 0 and f6_local0 <= 9 then
			f1_arg0.Label3:setText( tostring( f6_local0 ) )
		else
			f1_arg0.Label3:setText( "" )
		end
	end )
	local f1_local5 = LUI.DataSourceFromOmnvar.new( "zm_ui_dialpad_4" )
	f1_arg0:SubscribeToModel( f1_local5:GetModel( f1_arg1 ), function ( f7_arg0 )
		local f7_local0 = DataModel.GetModelValue( f7_arg0 )
		if f7_local0 == 11 then
			f1_arg0.Label4:setText( "#" )
		elseif f7_local0 == 10 then
			f1_arg0.Label4:setText( "*" )
		elseif f7_local0 >= 0 and f7_local0 <= 9 then
			f1_arg0.Label4:setText( tostring( f7_local0 ) )
		else
			f1_arg0.Label4:setText( "" )
		end
	end )
	local f1_local6 = LUI.DataSourceFromOmnvar.new( "zm_ui_dialpad_5" )
	f1_arg0:SubscribeToModel( f1_local6:GetModel( f1_arg1 ), function ( f8_arg0 )
		local f8_local0 = DataModel.GetModelValue( f8_arg0 )
		if f8_local0 == 11 then
			f1_arg0.Label5:setText( "#" )
		elseif f8_local0 == 10 then
			f1_arg0.Label5:setText( "*" )
		elseif f8_local0 >= 0 and f8_local0 <= 9 then
			f1_arg0.Label5:setText( tostring( f8_local0 ) )
		else
			f1_arg0.Label5:setText( "" )
		end
	end )
	local f1_local7 = LUI.DataSourceFromOmnvar.new( "zm_ui_dialpad_6" )
	f1_arg0:SubscribeToModel( f1_local7:GetModel( f1_arg1 ), function ( f9_arg0 )
		local f9_local0 = DataModel.GetModelValue( f9_arg0 )
		if f9_local0 == 11 then
			f1_arg0.Label6:setText( "#" )
		elseif f9_local0 == 10 then
			f1_arg0.Label6:setText( "*" )
		elseif f9_local0 >= 0 and f9_local0 <= 9 then
			f1_arg0.Label6:setText( tostring( f9_local0 ) )
		else
			f1_arg0.Label6:setText( "" )
		end
	end )
	local f1_local8 = LUI.DataSourceFromOmnvar.new( "zm_ui_dialpad_7" )
	f1_arg0:SubscribeToModel( f1_local8:GetModel( f1_arg1 ), function ( f10_arg0 )
		local f10_local0 = DataModel.GetModelValue( f10_arg0 )
		if f10_local0 == 11 then
			f1_arg0.Label7:setText( "#" )
		elseif f10_local0 == 10 then
			f1_arg0.Label7:setText( "*" )
		elseif f10_local0 >= 0 and f10_local0 <= 9 then
			f1_arg0.Label7:setText( tostring( f10_local0 ) )
		else
			f1_arg0.Label7:setText( "" )
		end
	end )
	local f1_local9 = LUI.DataSourceFromOmnvar.new( "zm_ui_dialpad_8" )
	f1_arg0:SubscribeToModel( f1_local9:GetModel( f1_arg1 ), function ( f11_arg0 )
		local f11_local0 = DataModel.GetModelValue( f11_arg0 )
		if f11_local0 == 11 then
			f1_arg0.Label8:setText( "#" )
		elseif f11_local0 == 10 then
			f1_arg0.Label8:setText( "*" )
		elseif f11_local0 >= 0 and f11_local0 <= 9 then
			f1_arg0.Label8:setText( tostring( f11_local0 ) )
		else
			f1_arg0.Label8:setText( "" )
		end
	end )
	local f1_local10 = LUI.DataSourceFromOmnvar.new( "zm_ui_dialpad_9" )
	f1_arg0:SubscribeToModel( f1_local10:GetModel( f1_arg1 ), function ( f12_arg0 )
		local f12_local0 = DataModel.GetModelValue( f12_arg0 )
		if f12_local0 == 11 then
			f1_arg0.Label9:setText( "#" )
		elseif f12_local0 == 10 then
			f1_arg0.Label9:setText( "*" )
		elseif f12_local0 >= 0 and f12_local0 <= 9 then
			f1_arg0.Label9:setText( tostring( f12_local0 ) )
		else
			f1_arg0.Label9:setText( "" )
		end
	end )
end

function PhoneNumberPad( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 250 * _1080p, 0, 50 * _1080p )
	self.id = "PhoneNumberPad"
	local f13_local1 = controller and controller.controllerIndex
	if not f13_local1 and not Engine.InFrontend() then
		f13_local1 = self:getRootController()
	end
	assert( f13_local1 )
	local f13_local2 = self
	local Label0 = nil
	
	Label0 = LUI.UIText.new()
	Label0.id = "Label0"
	Label0:setText( "0", 0 )
	Label0:SetFontSize( 45 * _1080p )
	Label0:SetFont( FONTS.GetFont( FONTS.Dev.File ) )
	Label0:SetAlignment( LUI.Alignment.Left )
	Label0:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 6, _1080p * 30, _1080p * 2.5, _1080p * 47.5 )
	self:addElement( Label0 )
	self.Label0 = Label0
	
	local Label1 = nil
	
	Label1 = LUI.UIText.new()
	Label1.id = "Label1"
	Label1:setText( "0", 0 )
	Label1:SetFontSize( 45 * _1080p )
	Label1:SetFont( FONTS.GetFont( FONTS.Dev.File ) )
	Label1:SetAlignment( LUI.Alignment.Left )
	Label1:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 30, _1080p * 54, _1080p * 2.5, _1080p * 47.5 )
	self:addElement( Label1 )
	self.Label1 = Label1
	
	local Label2 = nil
	
	Label2 = LUI.UIText.new()
	Label2.id = "Label2"
	Label2:setText( "0", 0 )
	Label2:SetFontSize( 45 * _1080p )
	Label2:SetFont( FONTS.GetFont( FONTS.Dev.File ) )
	Label2:SetAlignment( LUI.Alignment.Left )
	Label2:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 54, _1080p * 78, _1080p * 2.5, _1080p * 47.5 )
	self:addElement( Label2 )
	self.Label2 = Label2
	
	local Label3 = nil
	
	Label3 = LUI.UIText.new()
	Label3.id = "Label3"
	Label3:setText( "0", 0 )
	Label3:SetFontSize( 45 * _1080p )
	Label3:SetFont( FONTS.GetFont( FONTS.Dev.File ) )
	Label3:SetAlignment( LUI.Alignment.Left )
	Label3:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 77, _1080p * 101, _1080p * 2.5, _1080p * 47.5 )
	self:addElement( Label3 )
	self.Label3 = Label3
	
	local Label4 = nil
	
	Label4 = LUI.UIText.new()
	Label4.id = "Label4"
	Label4:setText( "0", 0 )
	Label4:SetFontSize( 45 * _1080p )
	Label4:SetFont( FONTS.GetFont( FONTS.Dev.File ) )
	Label4:SetAlignment( LUI.Alignment.Left )
	Label4:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 101, _1080p * 125, _1080p * 2.5, _1080p * 47.5 )
	self:addElement( Label4 )
	self.Label4 = Label4
	
	local Label5 = nil
	
	Label5 = LUI.UIText.new()
	Label5.id = "Label5"
	Label5:setText( "0", 0 )
	Label5:SetFontSize( 45 * _1080p )
	Label5:SetFont( FONTS.GetFont( FONTS.Dev.File ) )
	Label5:SetAlignment( LUI.Alignment.Left )
	Label5:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 125, _1080p * 149, _1080p * 2.5, _1080p * 47.5 )
	self:addElement( Label5 )
	self.Label5 = Label5
	
	local Label6 = nil
	
	Label6 = LUI.UIText.new()
	Label6.id = "Label6"
	Label6:setText( "0", 0 )
	Label6:SetFontSize( 45 * _1080p )
	Label6:SetFont( FONTS.GetFont( FONTS.Dev.File ) )
	Label6:SetAlignment( LUI.Alignment.Left )
	Label6:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 149, _1080p * 173, _1080p * 2.5, _1080p * 47.5 )
	self:addElement( Label6 )
	self.Label6 = Label6
	
	local Label7 = nil
	
	Label7 = LUI.UIText.new()
	Label7.id = "Label7"
	Label7:setText( "0", 0 )
	Label7:SetFontSize( 45 * _1080p )
	Label7:SetFont( FONTS.GetFont( FONTS.Dev.File ) )
	Label7:SetAlignment( LUI.Alignment.Left )
	Label7:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 173, _1080p * 197, _1080p * 2.5, _1080p * 47.5 )
	self:addElement( Label7 )
	self.Label7 = Label7
	
	local Label8 = nil
	
	Label8 = LUI.UIText.new()
	Label8.id = "Label8"
	Label8:setText( "0", 0 )
	Label8:SetFontSize( 45 * _1080p )
	Label8:SetFont( FONTS.GetFont( FONTS.Dev.File ) )
	Label8:SetAlignment( LUI.Alignment.Left )
	Label8:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 197, _1080p * 221, _1080p * 2.5, _1080p * 47.5 )
	self:addElement( Label8 )
	self.Label8 = Label8
	
	local Label9 = nil
	
	Label9 = LUI.UIText.new()
	Label9.id = "Label9"
	Label9:setText( "0", 0 )
	Label9:SetFontSize( 45 * _1080p )
	Label9:SetFont( FONTS.GetFont( FONTS.Dev.File ) )
	Label9:SetAlignment( LUI.Alignment.Left )
	Label9:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 221, _1080p * 245, _1080p * 2.5, _1080p * 47.5 )
	self:addElement( Label9 )
	self.Label9 = Label9
	
	PostLoadFunc( self, f13_local1, controller )
	return self
end

MenuBuilder.registerType( "PhoneNumberPad", PhoneNumberPad )
LockTable( _M )
