local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function PostLoadFunc( f1_arg0, f1_arg1 )
	
end

function HackTerminal( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 960 * _1080p, 0, 540 * _1080p )
	self.id = "HackTerminal"
	self._animationSets = {}
	self._sequences = {}
	local f2_local1 = controller and controller.controllerIndex
	if not f2_local1 and not Engine.InFrontend() then
		f2_local1 = self:getRootController()
	end
	assert( f2_local1 )
	local f2_local2 = self
	local BaseScreen = nil
	
	BaseScreen = LUI.UIImage.new()
	BaseScreen.id = "BaseScreen"
	BaseScreen:setImage( RegisterMaterial( "ui_terminal_screen_on" ), 0 )
	self:addElement( BaseScreen )
	self.BaseScreen = BaseScreen
	
	local TouchPoint1 = nil
	
	TouchPoint1 = LUI.UIImage.new()
	TouchPoint1.id = "TouchPoint1"
	TouchPoint1:SetAlpha( 0, 0 )
	TouchPoint1:setImage( RegisterMaterial( "ops_map_icon_triangle_outline" ), 0 )
	TouchPoint1:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 166, _1080p * 294, _1080p * -158, _1080p * -30 )
	self:addElement( TouchPoint1 )
	self.TouchPoint1 = TouchPoint1
	
	local TouchPoint2 = nil
	
	TouchPoint2 = LUI.UIImage.new()
	TouchPoint2.id = "TouchPoint2"
	TouchPoint2:SetAlpha( 0, 0 )
	TouchPoint2:setImage( RegisterMaterial( "ops_map_icon_triangle" ), 0 )
	TouchPoint2:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 166, _1080p * 294, _1080p * -144, _1080p * -16 )
	self:addElement( TouchPoint2 )
	self.TouchPoint2 = TouchPoint2
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		BaseScreen:RegisterAnimationSequence( "HackSequence", {
			{
				function ()
					return self.BaseScreen:SetAlpha( 1, 1500 )
				end
			},
			{
				function ()
					return self.BaseScreen:setImage( RegisterMaterial( "ui_terminal_screen_on" ), 1500 )
				end,
				function ()
					return self.BaseScreen:setImage( RegisterMaterial( "ui_terminal_screen_hack" ), 10 )
				end,
				function ()
					return self.BaseScreen:setImage( RegisterMaterial( "ui_terminal_screen_hack" ), 1390 )
				end,
				function ()
					return self.BaseScreen:setImage( RegisterMaterial( "ui_terminal_screen_success" ), 10 )
				end,
				function ()
					return self.BaseScreen:setImage( RegisterMaterial( "ui_terminal_screen_success" ), 2090 )
				end,
				function ()
					return self.BaseScreen:setImage( RegisterMaterial( "ui_terminal_screen_off" ), 10 )
				end
			}
		} )
		TouchPoint1:RegisterAnimationSequence( "HackSequence", {
			{
				function ()
					return self.TouchPoint1:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.TouchPoint1:SetScale( -1, 700 )
				end,
				function ()
					return self.TouchPoint1:SetScale( 0.45, 100 )
				end,
				function ()
					return self.TouchPoint1:SetScale( 0, 100 )
				end,
				function ()
					return self.TouchPoint1:SetScale( 0, 1930 )
				end,
				function ()
					return self.TouchPoint1:SetScale( -1, 170 )
				end
			}
		} )
		TouchPoint2:RegisterAnimationSequence( "HackSequence", {
			{
				function ()
					return self.TouchPoint2:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.TouchPoint2:SetScale( -1, 700 )
				end,
				function ()
					return self.TouchPoint2:SetScale( 0.17, 100 )
				end,
				function ()
					return self.TouchPoint2:SetScale( -0.43, 100 )
				end,
				function ()
					return self.TouchPoint2:SetScale( -0.43, 1930 )
				end,
				function ()
					return self.TouchPoint2:SetScale( -1, 170 )
				end
			},
			{
				function ()
					return self.TouchPoint2:SetZRotation( 0, 900 )
				end,
				function ()
					return self.TouchPoint2:SetZRotation( 720, 4110 )
				end
			}
		} )
		self._sequences.HackSequence = function ()
			BaseScreen:AnimateSequence( "HackSequence" )
			TouchPoint1:AnimateSequence( "HackSequence" )
			TouchPoint2:AnimateSequence( "HackSequence" )
		end
		
		BaseScreen:RegisterAnimationSequence( "Create", {
			{
				function ()
					return self.BaseScreen:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.BaseScreen:setImage( RegisterMaterial( "ui_terminal_screen_on" ), 0 )
				end
			}
		} )
		self._sequences.Create = function ()
			BaseScreen:AnimateSequence( "Create" )
		end
		
		BaseScreen:RegisterAnimationSequence( "Off", {
			{
				function ()
					return self.BaseScreen:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.Off = function ()
			BaseScreen:AnimateSequence( "Off" )
		end
		
		BaseScreen:RegisterAnimationSequence( "Hacked", {
			{
				function ()
					return self.BaseScreen:setImage( RegisterMaterial( "ui_terminal_screen_off" ), 0 )
				end
			},
			{
				function ()
					return self.BaseScreen:SetRGBFromInt( 16777215, 0 )
				end,
				function ()
					return self.BaseScreen:SetRGBFromInt( 8421504, 1000 )
				end,
				function ()
					return self.BaseScreen:SetRGBFromInt( 16777215, 1000 )
				end
			}
		} )
		self._sequences.Hacked = function ()
			BaseScreen:AnimateLoop( "Hacked" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	self:SubscribeToModel( DataSources.inGame.SP.showHackingTerminal:GetModel( f2_local1 ), function ()
		if DataSources.inGame.SP.showHackingTerminal:GetValue( f2_local1 ) ~= nil and DataSources.inGame.SP.showHackingTerminal:GetValue( f2_local1 ) == true then
			ACTIONS.AnimateSequence( self, "Create" )
		end
		if DataSources.inGame.SP.showHackingTerminal:GetValue( f2_local1 ) ~= nil and DataSources.inGame.SP.showHackingTerminal:GetValue( f2_local1 ) == false then
			ACTIONS.AnimateSequence( self, "Off" )
		end
	end )
	self:SubscribeToModelThroughElement( self, "animIndex1", function ()
		local f38_local0 = self:GetDataSource()
		if f38_local0.animIndex1:GetValue( f2_local1 ) ~= nil then
			f38_local0 = self:GetDataSource()
			if f38_local0.animIndex1:GetValue( f2_local1 ) == 1 then
				ACTIONS.AnimateSequence( self, "HackSequence" )
			end
		end
		f38_local0 = self:GetDataSource()
		if f38_local0.animIndex1:GetValue( f2_local1 ) ~= nil then
			f38_local0 = self:GetDataSource()
			if f38_local0.animIndex1:GetValue( f2_local1 ) == 2 then
				ACTIONS.AnimateSequence( self, "Hacked" )
			end
		end
	end )
	PostLoadFunc( self, f2_local1, controller )
	ACTIONS.AnimateSequence( self, "Create" )
	return self
end

MenuBuilder.registerType( "HackTerminal", HackTerminal )
LockTable( _M )
