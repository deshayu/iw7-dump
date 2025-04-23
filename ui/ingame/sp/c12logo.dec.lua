local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ( f1_arg0, f1_arg1, f1_arg2 )
	f1_arg0:SetBlendMode( BLEND_MODE.addWithAlpha )
end

function C12Logo( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 1920 * _1080p, 0, 175 * _1080p )
	self.id = "C12Logo"
	self._animationSets = {}
	self._sequences = {}
	local f2_local1 = controller and controller.controllerIndex
	if not f2_local1 and not Engine.InFrontend() then
		f2_local1 = self:getRootController()
	end
	assert( f2_local1 )
	local f2_local2 = self
	local BottomLineL = nil
	
	BottomLineL = LUI.UIImage.new()
	BottomLineL.id = "BottomLineL"
	BottomLineL:SetAlpha( 0.2, 0 )
	BottomLineL:SetUseAA( true )
	BottomLineL:SetAnchorsAndPosition( 0, 1, 1, 0, _1080p * 65, _1080p * 540, _1080p * -62, _1080p * -60 )
	self:addElement( BottomLineL )
	self.BottomLineL = BottomLineL
	
	local BottomLineR = nil
	
	BottomLineR = LUI.UIImage.new()
	BottomLineR.id = "BottomLineR"
	BottomLineR:SetAlpha( 0.2, 0 )
	BottomLineR:SetUseAA( true )
	BottomLineR:SetAnchorsAndPosition( 1, 0, 1, 0, _1080p * -540, _1080p * -65, _1080p * -62, _1080p * -60 )
	self:addElement( BottomLineR )
	self.BottomLineR = BottomLineR
	
	local IOISLogo = nil
	
	IOISLogo = LUI.UIImage.new()
	IOISLogo.id = "IOISLogo"
	IOISLogo:setImage( RegisterMaterial( "hud_c12_iois_logo" ), 0 )
	IOISLogo:SetAnchorsAndPosition( 1, 0, 1, 0, _1080p * -237, _1080p * -65, _1080p * -147.66, _1080p * -63 )
	self:addElement( IOISLogo )
	self.IOISLogo = IOISLogo
	
	local IPAddress = nil
	
	IPAddress = LUI.UIText.new()
	IPAddress.id = "IPAddress"
	IPAddress:setText( "UNN-001-0030-0006", 0 )
	IPAddress:SetFontSize( 18 * _1080p )
	IPAddress:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	IPAddress:SetAlignment( LUI.Alignment.Left )
	IPAddress:SetAnchorsAndPosition( 0, 1, 1, 0, _1080p * 65, _1080p * 325, _1080p * -87, _1080p * -69 )
	self:addElement( IPAddress )
	self.IPAddress = IPAddress
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		BottomLineL:RegisterAnimationSequence( "Bootup", {
			{
				function ()
					return self.BottomLineL:SetAlpha( 0, 0 )
				end,
				function ()
					return self.BottomLineL:SetAlpha( 0, 100 )
				end,
				function ()
					return self.BottomLineL:SetAlpha( 0.2, 200, LUI.EASING.outBack )
				end
			},
			{
				function ()
					return self.BottomLineL:SetAnchorsAndPosition( 0, 1, 1, 0, _1080p * -80, _1080p * 395, _1080p * -62, _1080p * -60, 0 )
				end,
				function ()
					return self.BottomLineL:SetAnchorsAndPosition( 0, 1, 1, 0, _1080p * -80, _1080p * 395, _1080p * -62, _1080p * -60, 100 )
				end,
				function ()
					return self.BottomLineL:SetAnchorsAndPosition( 0, 1, 1, 0, _1080p * 65, _1080p * 540, _1080p * -62, _1080p * -60, 200, LUI.EASING.outBack )
				end
			}
		} )
		BottomLineR:RegisterAnimationSequence( "Bootup", {
			{
				function ()
					return self.BottomLineR:SetAlpha( 0, 0 )
				end,
				function ()
					return self.BottomLineR:SetAlpha( 0, 100 )
				end,
				function ()
					return self.BottomLineR:SetAlpha( 0.2, 200, LUI.EASING.outBack )
				end
			},
			{
				function ()
					return self.BottomLineR:SetAnchorsAndPosition( 1, 0, 1, 0, _1080p * -395, _1080p * 80, _1080p * -62, _1080p * -60, 0 )
				end,
				function ()
					return self.BottomLineR:SetAnchorsAndPosition( 1, 0, 1, 0, _1080p * -395, _1080p * 80, _1080p * -62, _1080p * -60, 100 )
				end,
				function ()
					return self.BottomLineR:SetAnchorsAndPosition( 1, 0, 1, 0, _1080p * -540, _1080p * -65, _1080p * -62, _1080p * -60, 200, LUI.EASING.outBack )
				end
			}
		} )
		IOISLogo:RegisterAnimationSequence( "Bootup", {
			{
				function ()
					return self.IOISLogo:SetAlpha( 0, 0 )
				end,
				function ()
					return self.IOISLogo:SetAlpha( 0, 200 )
				end,
				function ()
					return self.IOISLogo:SetAlpha( 1, 200, LUI.EASING.outBack )
				end
			},
			{
				function ()
					return self.IOISLogo:SetAnchorsAndPosition( 1, 0, 1, 0, _1080p * -142, _1080p * 30, _1080p * -147.66, _1080p * -63, 0 )
				end,
				function ()
					return self.IOISLogo:SetAnchorsAndPosition( 1, 0, 1, 0, _1080p * -142, _1080p * 30, _1080p * -147.66, _1080p * -63, 200 )
				end,
				function ()
					return self.IOISLogo:SetAnchorsAndPosition( 1, 0, 1, 0, _1080p * -237, _1080p * -65, _1080p * -147.66, _1080p * -63, 200, LUI.EASING.outBack )
				end
			}
		} )
		IPAddress:RegisterAnimationSequence( "Bootup", {
			{
				function ()
					return self.IPAddress:SetAlpha( 0, 0 )
				end,
				function ()
					return self.IPAddress:SetAlpha( 0, 200 )
				end,
				function ()
					return self.IPAddress:SetAlpha( 1, 200, LUI.EASING.outBack )
				end
			},
			{
				function ()
					return self.IPAddress:SetAnchorsAndPosition( 0, 1, 1, 0, _1080p * -30, _1080p * 230, _1080p * -87, _1080p * -69, 0 )
				end,
				function ()
					return self.IPAddress:SetAnchorsAndPosition( 0, 1, 1, 0, _1080p * -30, _1080p * 230, _1080p * -88, _1080p * -69, 200 )
				end,
				function ()
					return self.IPAddress:SetAnchorsAndPosition( 0, 1, 1, 0, _1080p * 65, _1080p * 325, _1080p * -88, _1080p * -69, 200, LUI.EASING.outBack )
				end
			}
		} )
		self._sequences.Bootup = function ()
			BottomLineL:AnimateSequence( "Bootup" )
			BottomLineR:AnimateSequence( "Bootup" )
			IOISLogo:AnimateSequence( "Bootup" )
			IPAddress:AnimateSequence( "Bootup" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	self:SubscribeToModel( DataSources.inGame.HUD.overlay.isC12Active:GetModel( f2_local1 ), function ()
		if DataSources.inGame.HUD.overlay.isC12Active:GetValue( f2_local1 ) ~= nil and DataSources.inGame.HUD.overlay.isC12Active:GetValue( f2_local1 ) == 1 then
			ACTIONS.AnimateSequence( self, "Bootup" )
		end
	end )
	f0_local0( self, f2_local1, controller )
	return self
end

MenuBuilder.registerType( "C12Logo", C12Logo )
LockTable( _M )
