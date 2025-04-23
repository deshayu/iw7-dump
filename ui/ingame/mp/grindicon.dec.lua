local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function PostLoadFunc( f1_arg0, f1_arg1, f1_arg2 )
	f1_arg0.Value:SetShadowUOffset( -0 )
	f1_arg0.Value:SetShadowVOffset( -0 )
	f1_arg0:SetYRotation( -25 )
	f1_arg0:SetXRotation( -15 )
end

function GrindIcon( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 64 * _1080p, 0, 64 * _1080p )
	self.id = "GrindIcon"
	self._animationSets = {}
	self._sequences = {}
	local f2_local1 = controller and controller.controllerIndex
	if not f2_local1 and not Engine.InFrontend() then
		f2_local1 = self:getRootController()
	end
	assert( f2_local1 )
	local f2_local2 = self
	local Image1 = nil
	
	Image1 = LUI.UIImage.new()
	Image1.id = "Image1"
	Image1:SetRGBFromInt( 14277081, 0 )
	Image1:setImage( RegisterMaterial( "icon_grind_pickup_dogtag" ), 0 )
	Image1:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * -65.25, _1080p * -8.25, _1080p * -50.5, _1080p * 2.5 )
	self:addElement( Image1 )
	self.Image1 = Image1
	
	local Glow = nil
	
	Glow = LUI.UIImage.new()
	Glow.id = "Glow"
	Glow:SetRGBFromInt( 65535, 0 )
	Glow:SetAlpha( 0, 0 )
	Glow:setImage( RegisterMaterial( "icon_grind_pickup_dogtag" ), 0 )
	Glow:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * -65.25, _1080p * -8.25, _1080p * -54.5, _1080p * 6 )
	self:addElement( Glow )
	self.Glow = Glow
	
	local Value = nil
	
	Value = LUI.UIStyledText.new()
	Value.id = "Value"
	Value:SetRGBFromInt( 15921906, 0 )
	Value:SetFontSize( 38 * _1080p )
	Value:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	Value:SetAlignment( LUI.Alignment.Center )
	Value:SetShadowMinDistance( -0.03, 0 )
	Value:SetShadowMaxDistance( 0.03, 0 )
	Value:SetOutlineRGBFromInt( 0, 0 )
	Value:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * -39.75, _1080p * -24.25, _1080p * -11, _1080p * -37 )
	Value:SubscribeToModel( DataSources.inGame.HUD.grindTagsCarried:GetModel( f2_local1 ), function ()
		local f3_local0 = DataSources.inGame.HUD.grindTagsCarried:GetValue( f2_local1 )
		if f3_local0 ~= nil then
			Value:setText( f3_local0, 0 )
		end
	end )
	self:addElement( Value )
	self.Value = Value
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		Image1:RegisterAnimationSequence( "ShowBall", {
			{
				function ()
					return self.Image1:SetAlpha( 1, 300 )
				end
			}
		} )
		Glow:RegisterAnimationSequence( "ShowBall", {
			{
				function ()
					return self.Glow:SetAlpha( 0, 300 )
				end,
				function ()
					return self.Glow:SetAlpha( 0.5, 550, LUI.EASING.inBack )
				end,
				function ()
					return self.Glow:SetAlpha( 0.5, 150 )
				end,
				function ()
					return self.Glow:SetAlpha( 0, 500, LUI.EASING.outBack )
				end,
				function ()
					return self.Glow:SetAlpha( 0, 1000 )
				end
			}
		} )
		self._sequences.ShowBall = function ()
			Image1:AnimateLoop( "ShowBall" )
			Glow:AnimateLoop( "ShowBall" )
		end
		
		self._sequences.HideBall = function ()
			
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	self:SubscribeToModel( DataSources.inGame.HUD.uplinkHUDEnabled:GetModel( f2_local1 ), function ()
		if DataSources.inGame.HUD.uplinkHUDEnabled:GetValue( f2_local1 ) ~= nil and DataSources.inGame.HUD.uplinkHUDEnabled:GetValue( f2_local1 ) == true then
			ACTIONS.AnimateSequence( self, "ShowBall" )
		end
		if DataSources.inGame.HUD.uplinkHUDEnabled:GetValue( f2_local1 ) ~= nil and DataSources.inGame.HUD.uplinkHUDEnabled:GetValue( f2_local1 ) == false then
			ACTIONS.AnimateSequence( self, "HideBall" )
		end
	end )
	PostLoadFunc( self, f2_local1, controller )
	return self
end

MenuBuilder.registerType( "GrindIcon", GrindIcon )
LockTable( _M )
