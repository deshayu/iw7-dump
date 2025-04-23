local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function PostLoadFunc( f1_arg0, f1_arg1 )
	local f1_local0 = DataSources.inGame.SP.showBink
	f1_arg0._visible = false
	f1_arg0.soundSet = "bink"
	f1_arg0:SubscribeToModel( f1_local0:GetModel( f1_arg1 ), function ( f2_arg0 )
		local f2_local0 = DataModel.GetModelValue( f2_arg0 )
		if not f2_local0 and f1_arg0._visible then
			ACTIONS.AnimateSequence( f1_arg0, "BinkOff" )
			f1_arg0:playSound( "binkOff" )
			f1_arg0._visible = false
		elseif f2_local0 and not f1_arg0._visible then
			ACTIONS.AnimateSequence( f1_arg0, "BinkOn" )
			f1_arg0:playSound( "binkOn" )
			f1_arg0._visible = true
		end
	end )
end

function BinkWindow( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 1920 * _1080p, 0, 1080 * _1080p )
	self.id = "BinkWindow"
	self._animationSets = {}
	self._sequences = {}
	local f3_local1 = controller and controller.controllerIndex
	if not f3_local1 and not Engine.InFrontend() then
		f3_local1 = self:getRootController()
	end
	assert( f3_local1 )
	local f3_local2 = self
	local FrameCornerAnchor = nil
	
	FrameCornerAnchor = MenuBuilder.BuildRegisteredType( "FrameCorner", {
		controllerIndex = f3_local1
	} )
	FrameCornerAnchor.id = "FrameCornerAnchor"
	FrameCornerAnchor:SetRGBFromTable( SWATCHES.HUD.stable, 0 )
	FrameCornerAnchor:SetAlpha( 0, 0 )
	FrameCornerAnchor:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 864, _1080p * 844, _1080p * -460, _1080p * -87.84 )
	self:addElement( FrameCornerAnchor )
	self.FrameCornerAnchor = FrameCornerAnchor
	
	local AnchorDetail1 = nil
	
	AnchorDetail1 = LUI.UIImage.new()
	AnchorDetail1.id = "AnchorDetail1"
	AnchorDetail1:SetRGBFromTable( SWATCHES.HUD.stable, 0 )
	AnchorDetail1:SetAlpha( 0, 0 )
	AnchorDetail1:setImage( RegisterMaterial( "hud_pip_rt_fluff2" ), 0 )
	AnchorDetail1:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 847, _1080p * 861, _1080p * -408, _1080p * -342 )
	self:addElement( AnchorDetail1 )
	self.AnchorDetail1 = AnchorDetail1
	
	local AnchorDetail2 = nil
	
	AnchorDetail2 = LUI.UIImage.new()
	AnchorDetail2.id = "AnchorDetail2"
	AnchorDetail2:SetRGBFromTable( SWATCHES.HUD.stable, 0 )
	AnchorDetail2:SetAlpha( 0, 0 )
	AnchorDetail2:setImage( RegisterMaterial( "hud_pip_rt_fluff1" ), 0 )
	AnchorDetail2:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 847.94, _1080p * 860.06, _1080p * -452.69, _1080p * -406.57 )
	self:addElement( AnchorDetail2 )
	self.AnchorDetail2 = AnchorDetail2
	
	local usnaBG = nil
	
	usnaBG = LUI.UIImage.new()
	usnaBG.id = "usnaBG"
	usnaBG:SetRGBFromInt( 0, 0 )
	usnaBG:SetAlpha( 0, 0 )
	usnaBG:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -711.31, _1080p * -111, _1080p * 80, _1080p * 439.16 )
	self:addElement( usnaBG )
	self.usnaBG = usnaBG
	
	local usnaLogo = nil
	
	usnaLogo = LUI.UIImage.new()
	usnaLogo.id = "usnaLogo"
	usnaLogo:SetAlpha( 0, 0 )
	usnaLogo:setImage( RegisterMaterial( "icon_usna_symbol" ), 0 )
	usnaLogo:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 448.85, _1080p * 648.85, _1080p * -380.42, _1080p * -180.42 )
	self:addElement( usnaLogo )
	self.usnaLogo = usnaLogo
	
	local bink = nil
	
	bink = LUI.UIImage.new()
	bink.id = "bink"
	bink:SetAlpha( 0, 0 )
	bink:setImage( RegisterMaterial( "cinematic" ), 0 )
	bink:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -711.31, _1080p * -111, _1080p * 80, _1080p * 439.16 )
	self:addElement( bink )
	self.bink = bink
	
	local BinkWindowFrame = nil
	
	BinkWindowFrame = MenuBuilder.BuildRegisteredType( "BinkWindowFrame", {
		controllerIndex = f3_local1
	} )
	BinkWindowFrame.id = "BinkWindowFrame"
	BinkWindowFrame:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -1636, _1080p * -281, _1080p * 128, _1080p * 955 )
	self:addElement( BinkWindowFrame )
	self.BinkWindowFrame = BinkWindowFrame
	
	self._animationSets.DefaultAnimationSet = function ()
		BinkWindowFrame:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.BinkWindowFrame:SetAlpha( 0, 0 )
				end
			},
			{
				function ()
					return self.BinkWindowFrame:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -1636, _1080p * -281, _1080p * 128, _1080p * 955, 0 )
				end
			}
		} )
		self._sequences.DefaultSequence = function ()
			BinkWindowFrame:AnimateSequence( "DefaultSequence" )
		end
		
		FrameCornerAnchor:RegisterAnimationSequence( "BinkOn", {
			{
				function ()
					return self.FrameCornerAnchor:SetAlpha( 0.6, 0 )
				end
			},
			{
				function ()
					return self.FrameCornerAnchor:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 864, _1080p * 844, _1080p * -460, _1080p * -87.84, 0 )
				end,
				function ()
					return self.FrameCornerAnchor:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 889, _1080p * 869, _1080p * -460, _1080p * -87.84, 140, LUI.EASING.outBack )
				end
			}
		} )
		AnchorDetail1:RegisterAnimationSequence( "BinkOn", {
			{
				function ()
					return self.AnchorDetail1:SetAlpha( 0.4, 0 )
				end
			},
			{
				function ()
					return self.AnchorDetail1:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 847, _1080p * 861, _1080p * -408, _1080p * -342, 0 )
				end,
				function ()
					return self.AnchorDetail1:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 872, _1080p * 886, _1080p * -408, _1080p * -342, 140, LUI.EASING.outBack )
				end
			}
		} )
		AnchorDetail2:RegisterAnimationSequence( "BinkOn", {
			{
				function ()
					return self.AnchorDetail2:SetAlpha( 0.6, 0 )
				end
			},
			{
				function ()
					return self.AnchorDetail2:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 847.94, _1080p * 860.06, _1080p * -453.69, _1080p * -407.57, 0 )
				end,
				function ()
					return self.AnchorDetail2:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 872.94, _1080p * 885.06, _1080p * -453.69, _1080p * -407.57, 140, LUI.EASING.outBack )
				end
			}
		} )
		usnaBG:RegisterAnimationSequence( "BinkOn", {
			{
				function ()
					return self.usnaBG:SetScale( -0.5, 0 )
				end,
				function ()
					return self.usnaBG:SetScale( 0, 220 )
				end
			},
			{
				function ()
					return self.usnaBG:SetAlpha( 0, 140, LUI.EASING.outBack )
				end,
				function ()
					return self.usnaBG:SetAlpha( 0.6, 10 )
				end,
				function ()
					return self.usnaBG:SetAlpha( 0.6, 850, LUI.EASING.inOutBack )
				end,
				function ()
					return self.usnaBG:SetAlpha( 0, 10 )
				end
			},
			{
				function ()
					return self.usnaBG:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -695, _1080p * -126, _1080p * 95, _1080p * 427, 349 )
				end,
				function ()
					return self.usnaBG:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -695, _1080p * -126, _1080p * 95, _1080p * 427, 150 )
				end,
				function ()
					return self.usnaBG:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -1585, _1080p * -337, _1080p * 190, _1080p * 890, 500, LUI.EASING.inOutBack )
				end
			}
		} )
		usnaLogo:RegisterAnimationSequence( "BinkOn", {
			{
				function ()
					return self.usnaLogo:SetScale( -0.5, 0 )
				end,
				function ()
					return self.usnaLogo:SetScale( 0, 350 )
				end
			},
			{
				function ()
					return self.usnaLogo:SetAlpha( 0, 140, LUI.EASING.outBack )
				end,
				function ()
					return self.usnaLogo:SetAlpha( 0.6, 10 )
				end,
				function ()
					return self.usnaLogo:SetAlpha( 0.6, 350 )
				end,
				function ()
					return self.usnaLogo:SetAlpha( 0, 500, LUI.EASING.inOutBack )
				end
			},
			{
				function ()
					return self.usnaLogo:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 447.85, _1080p * 647.85, _1080p * -380.42, _1080p * -180.42, 0 )
				end,
				function ()
					return self.usnaLogo:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 447.85, _1080p * 647.85, _1080p * -380.42, _1080p * -180.42, 500 )
				end,
				function ()
					return self.usnaLogo:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -100, _1080p * 100, _1080p * -100, _1080p * 100, 500, LUI.EASING.inOutBack )
				end
			}
		} )
		bink:RegisterAnimationSequence( "BinkOn", {
			{
				function ()
					return self.bink:SetAlpha( 0, 0 )
				end,
				function ()
					return self.bink:SetAlpha( 0, 140 )
				end,
				function ()
					return self.bink:SetAlpha( 0.2, 10 )
				end,
				function ()
					return self.bink:SetAlpha( 0, 70, LUI.EASING.outBack )
				end,
				function ()
					return self.bink:SetAlpha( 0.2, 60 )
				end,
				function ()
					return self.bink:SetAlpha( 0, 20 )
				end,
				function ()
					return self.bink:SetAlpha( 0.3, 60 )
				end,
				function ()
					return self.bink:SetAlpha( 0.2, 20 )
				end,
				function ()
					return self.bink:SetAlpha( 0.1, 60 )
				end,
				function ()
					return self.bink:SetAlpha( 0.9, 60 )
				end
			},
			{
				function ()
					return self.bink:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -696, _1080p * -126, _1080p * 96, _1080p * 426, 0 )
				end,
				function ()
					return self.bink:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -696, _1080p * -126, _1080p * 96, _1080p * 426, 349 )
				end,
				function ()
					return self.bink:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -696, _1080p * -126, _1080p * 96, _1080p * 426, 150 )
				end,
				function ()
					return self.bink:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -1585, _1080p * -337, _1080p * 190, _1080p * 890, 500, LUI.EASING.inOutBack )
				end
			}
		} )
		BinkWindowFrame:RegisterAnimationSequence( "BinkOn", {
			{
				function ()
					return self.BinkWindowFrame.DigiText1:SetAlpha( 0, 0 )
				end,
				function ()
					return self.BinkWindowFrame.DigiText1:SetAlpha( 0, 140 )
				end,
				function ()
					return self.BinkWindowFrame.DigiText1:SetAlpha( 0.8, 210 )
				end
			},
			{
				function ()
					return self.BinkWindowFrame.DigiText2:SetAlpha( 0, 0 )
				end,
				function ()
					return self.BinkWindowFrame.DigiText2:SetAlpha( 0, 140 )
				end,
				function ()
					return self.BinkWindowFrame.DigiText2:SetAlpha( 1, 210 )
				end
			},
			{
				function ()
					return self.BinkWindowFrame.ContentLabel:SetAlpha( 0, 0 )
				end,
				function ()
					return self.BinkWindowFrame.ContentLabel:SetAlpha( 0, 140 )
				end,
				function ()
					return self.BinkWindowFrame.ContentLabel:SetAlpha( 1, 210 )
				end
			},
			{
				function ()
					return self.BinkWindowFrame.IncomingTransmissionText:SetAlpha( 0, 0 )
				end,
				function ()
					return self.BinkWindowFrame.IncomingTransmissionText:SetAlpha( 0, 140 )
				end,
				function ()
					return self.BinkWindowFrame.IncomingTransmissionText:SetAlpha( 1, 210 )
				end
			},
			{
				function ()
					return self.BinkWindowFrame.Border:SetAlpha( 0, 0 )
				end,
				function ()
					return self.BinkWindowFrame.Border:SetAlpha( 1, 350 )
				end,
				function ()
					return self.BinkWindowFrame.Border:SetAlpha( 1, 650, LUI.EASING.inOutBack )
				end
			},
			{
				function ()
					return self.BinkWindowFrame:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -140, _1080p * -96, _1080p * 55, _1080p * 467, 0 )
				end,
				function ()
					return self.BinkWindowFrame:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -727, _1080p * -96, _1080p * 55, _1080p * 467, 140 )
				end,
				function ()
					return self.BinkWindowFrame:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -726, _1080p * -96, _1080p * 55, _1080p * 467, 359 )
				end,
				function ()
					return self.BinkWindowFrame:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -1636, _1080p * -281, _1080p * 128, _1080p * 955, 500, LUI.EASING.inOutBack )
				end
			}
		} )
		self._sequences.BinkOn = function ()
			FrameCornerAnchor:AnimateSequence( "BinkOn" )
			AnchorDetail1:AnimateSequence( "BinkOn" )
			AnchorDetail2:AnimateSequence( "BinkOn" )
			usnaBG:AnimateSequence( "BinkOn" )
			usnaLogo:AnimateSequence( "BinkOn" )
			bink:AnimateSequence( "BinkOn" )
			BinkWindowFrame:AnimateSequence( "BinkOn" )
		end
		
		FrameCornerAnchor:RegisterAnimationSequence( "BinkOff", {
			{
				function ()
					return self.FrameCornerAnchor:SetAlpha( 0.6, 0 )
				end,
				function ()
					return self.FrameCornerAnchor:SetAlpha( 0.6, 290 )
				end,
				function ()
					return self.FrameCornerAnchor:SetAlpha( 0, 10 )
				end
			},
			{
				function ()
					return self.FrameCornerAnchor:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 889, _1080p * 869, _1080p * -460, _1080p * -87.84, 250 )
				end,
				function ()
					return self.FrameCornerAnchor:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 864, _1080p * 844, _1080p * -460, _1080p * -87.84, 50 )
				end
			}
		} )
		AnchorDetail1:RegisterAnimationSequence( "BinkOff", {
			{
				function ()
					return self.AnchorDetail1:SetAlpha( 0.4, 290 )
				end,
				function ()
					return self.AnchorDetail1:SetAlpha( 0, 10 )
				end
			},
			{
				function ()
					return self.AnchorDetail1:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 872, _1080p * 886, _1080p * -408, _1080p * -342, 250 )
				end,
				function ()
					return self.AnchorDetail1:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 847, _1080p * 861, _1080p * -408, _1080p * -342, 39 )
				end
			}
		} )
		AnchorDetail2:RegisterAnimationSequence( "BinkOff", {
			{
				function ()
					return self.AnchorDetail2:SetAlpha( 0.6, 290 )
				end,
				function ()
					return self.AnchorDetail2:SetAlpha( 0, 10 )
				end
			},
			{
				function ()
					return self.AnchorDetail2:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 872.94, _1080p * 885.06, _1080p * -453.69, _1080p * -407.57, 250 )
				end,
				function ()
					return self.AnchorDetail2:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 847.94, _1080p * 860.06, _1080p * -453.69, _1080p * -407.57, 39 )
				end
			}
		} )
		usnaBG:RegisterAnimationSequence( "BinkOff", {
			{
				function ()
					return self.usnaBG:SetScale( 0, 0 )
				end
			},
			{
				function ()
					return self.usnaBG:SetAlpha( 0.6, 100 )
				end,
				function ()
					return self.usnaBG:SetAlpha( 0.6, 140 )
				end,
				function ()
					return self.usnaBG:SetAlpha( 0, 10 )
				end
			},
			{
				function ()
					return self.usnaBG:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -1585, _1080p * -337, _1080p * 190, _1080p * 890, 0 )
				end,
				function ()
					return self.usnaBG:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -696, _1080p * -126, _1080p * 96, _1080p * 426, 100 )
				end
			}
		} )
		usnaLogo:RegisterAnimationSequence( "BinkOff", {
			{
				function ()
					return self.usnaLogo:SetAlpha( 0, 0 )
				end,
				function ()
					return self.usnaLogo:SetAlpha( 0.6, 100 )
				end,
				function ()
					return self.usnaLogo:SetAlpha( 0.6, 140 )
				end,
				function ()
					return self.usnaLogo:SetAlpha( 0, 10 )
				end
			},
			{
				function ()
					return self.usnaLogo:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -100, _1080p * 100, _1080p * -100, _1080p * 100, 0 )
				end,
				function ()
					return self.usnaLogo:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 448.85, _1080p * 648.85, _1080p * -380.42, _1080p * -180.42, 100 )
				end
			}
		} )
		bink:RegisterAnimationSequence( "BinkOff", {
			{
				function ()
					return self.bink:SetAlpha( 0.9, 0 )
				end,
				function ()
					return self.bink:SetAlpha( 0.6, 100 )
				end,
				function ()
					return self.bink:SetAlpha( 0.4, 20 )
				end,
				function ()
					return self.bink:SetAlpha( 0.6, 40 )
				end,
				function ()
					return self.bink:SetAlpha( 0.4, 20 )
				end,
				function ()
					return self.bink:SetAlpha( 0.6, 40 )
				end,
				function ()
					return self.bink:SetAlpha( 0, 30 )
				end
			},
			{
				function ()
					return self.bink:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -1585, _1080p * -337, _1080p * 190, _1080p * 890, 0 )
				end,
				function ()
					return self.bink:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -696, _1080p * -126, _1080p * 96, _1080p * 426, 100 )
				end
			}
		} )
		BinkWindowFrame:RegisterAnimationSequence( "BinkOff", {
			{
				function ()
					return self.BinkWindowFrame.DigiText1:SetAlpha( 0.8, 0 )
				end,
				function ()
					return self.BinkWindowFrame.DigiText1:SetAlpha( 0.8, 220 )
				end,
				function ()
					return self.BinkWindowFrame.DigiText1:SetAlpha( 0, 30 )
				end
			},
			{
				function ()
					return self.BinkWindowFrame.DigiText2:SetAlpha( 1, 0 )
				end,
				function ()
					return self.BinkWindowFrame.DigiText2:SetAlpha( 1, 220 )
				end,
				function ()
					return self.BinkWindowFrame.DigiText2:SetAlpha( 0, 30 )
				end
			},
			{
				function ()
					return self.BinkWindowFrame.ContentLabel:SetAlpha( 1, 0 )
				end,
				function ()
					return self.BinkWindowFrame.ContentLabel:SetAlpha( 1, 220 )
				end,
				function ()
					return self.BinkWindowFrame.ContentLabel:SetAlpha( 0, 30 )
				end
			},
			{
				function ()
					return self.BinkWindowFrame.IncomingTransmissionText:SetAlpha( 1, 0 )
				end,
				function ()
					return self.BinkWindowFrame.IncomingTransmissionText:SetAlpha( 1, 220 )
				end,
				function ()
					return self.BinkWindowFrame.IncomingTransmissionText:SetAlpha( 0, 30 )
				end
			},
			{
				function ()
					return self.BinkWindowFrame.Border:SetAlpha( 1, 0 )
				end,
				function ()
					return self.BinkWindowFrame.Border:SetAlpha( 1, 220 )
				end,
				function ()
					return self.BinkWindowFrame.Border:SetAlpha( 0, 30 )
				end
			},
			{
				function ()
					return self.BinkWindowFrame:SetAlpha( 1, 290 )
				end,
				function ()
					return self.BinkWindowFrame:SetAlpha( 0, 10 )
				end
			},
			{
				function ()
					return self.BinkWindowFrame:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -1636, _1080p * -281, _1080p * 128, _1080p * 955, 0 )
				end,
				function ()
					return self.BinkWindowFrame:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -727, _1080p * -96, _1080p * 55, _1080p * 467, 100 )
				end,
				function ()
					return self.BinkWindowFrame:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -727, _1080p * -96, _1080p * 55, _1080p * 467, 149 )
				end,
				function ()
					return self.BinkWindowFrame:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -140, _1080p * -96, _1080p * 55, _1080p * 467, 39 )
				end
			}
		} )
		self._sequences.BinkOff = function ()
			FrameCornerAnchor:AnimateSequence( "BinkOff" )
			AnchorDetail1:AnimateSequence( "BinkOff" )
			AnchorDetail2:AnimateSequence( "BinkOff" )
			usnaBG:AnimateSequence( "BinkOff" )
			usnaLogo:AnimateSequence( "BinkOff" )
			bink:AnimateSequence( "BinkOff" )
			BinkWindowFrame:AnimateSequence( "BinkOff" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	PostLoadFunc( self, f3_local1, controller )
	ACTIONS.AnimateSequence( self, "DefaultSequence" )
	return self
end

MenuBuilder.registerType( "BinkWindow", BinkWindow )
LockTable( _M )
