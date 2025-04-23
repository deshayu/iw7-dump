local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ( f1_arg0, f1_arg1, f1_arg2 )
	f1_arg0:SetYRotation( -25 * MP.SplitScreenRotModifier )
	f1_arg0:SetXRotation( -15 * MP.SplitScreenRotModifier )
end

function FlagCarrierIcon( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 64 * _1080p, 0, 64 * _1080p )
	self.id = "FlagCarrierIcon"
	self._animationSets = {}
	self._sequences = {}
	local f2_local1 = controller and controller.controllerIndex
	if not f2_local1 and not Engine.InFrontend() then
		f2_local1 = self:getRootController()
	end
	assert( f2_local1 )
	local f2_local2 = self
	local Flag = nil
	
	Flag = LUI.UIImage.new()
	Flag.id = "Flag"
	Flag:setImage( RegisterMaterial( "icon_ctf_pickup_flag_01" ), 0 )
	Flag:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -32, _1080p * 32, _1080p * -32, _1080p * 32 )
	self:addElement( Flag )
	self.Flag = Flag
	
	local Glow = nil
	
	Glow = LUI.UIImage.new()
	Glow.id = "Glow"
	Glow:SetRGBFromInt( 65535, 0 )
	Glow:setImage( RegisterMaterial( "icon_ctf_pickup_flag_01" ), 0 )
	Glow:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -32, _1080p * 32, _1080p * -32, _1080p * 32 )
	self:addElement( Glow )
	self.Glow = Glow
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		Flag:RegisterAnimationSequence( "ShowBall", {
			{
				function ()
					return self.Flag:SetRGBFromInt( 16777215, 250 )
				end
			},
			{
				function ()
					return self.Flag:SetAlpha( 1, 250 )
				end
			}
		} )
		Glow:RegisterAnimationSequence( "ShowBall", {
			{
				function ()
					return self.Glow:SetAlpha( 0, 250 )
				end,
				function ()
					return self.Glow:SetAlpha( 0.22, 630, LUI.EASING.inBack )
				end,
				function ()
					return self.Glow:SetAlpha( 0.22, 120 )
				end,
				function ()
					return self.Glow:SetAlpha( 0, 510 )
				end,
				function ()
					return self.Glow:SetAlpha( 0, 990 )
				end
			}
		} )
		self._sequences.ShowBall = function ()
			Flag:AnimateLoop( "ShowBall" )
			Glow:AnimateLoop( "ShowBall" )
		end
		
		Flag:RegisterAnimationSequence( "HideBall", {
			{
				function ()
					return self.Flag:SetAlpha( 0, 150 )
				end
			}
		} )
		Glow:RegisterAnimationSequence( "HideBall", {
			{
				function ()
					return self.Glow:SetAlpha( 0, 150 )
				end
			}
		} )
		self._sequences.HideBall = function ()
			Flag:AnimateSequence( "HideBall" )
			Glow:AnimateSequence( "HideBall" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	self:SubscribeToModel( DataSources.inGame.HUD.ctfFlagIcon:GetModel( f2_local1 ), function ()
		if DataSources.inGame.HUD.ctfFlagIcon:GetValue( f2_local1 ) ~= nil and DataSources.inGame.HUD.ctfFlagIcon:GetValue( f2_local1 ) == true then
			ACTIONS.AnimateSequence( self, "ShowBall" )
		end
		if DataSources.inGame.HUD.ctfFlagIcon:GetValue( f2_local1 ) ~= nil and DataSources.inGame.HUD.ctfFlagIcon:GetValue( f2_local1 ) == false then
			ACTIONS.AnimateSequence( self, "HideBall" )
		end
	end )
	f0_local0( self, f2_local1, controller )
	return self
end

MenuBuilder.registerType( "FlagCarrierIcon", FlagCarrierIcon )
LockTable( _M )
