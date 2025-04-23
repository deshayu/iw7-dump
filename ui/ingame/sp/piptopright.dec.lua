local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function PostLoadFunc( f1_arg0, f1_arg1 )
	local f1_local0 = DataSources.inGame.SP.showPIP
	f1_arg0._visible = false
	f1_arg0:SubscribeToModel( f1_local0:GetModel( f1_arg1 ), function ( f2_arg0 )
		local f2_local0 = DataModel.GetModelValue( f2_arg0 )
		if f2_local0 ~= nil and f2_local0 == false and f1_arg0._visible then
			ACTIONS.AnimateSequence( f1_arg0, "PipOff" )
			ACTIONS.AnimateSequenceByElement( f1_arg0, {
				elementName = "PipTextBottom",
				sequenceName = "TextHidden",
				elementPath = "PipTextBottom"
			} )
			ACTIONS.AnimateSequenceByElement( f1_arg0, {
				elementName = "PipTextTop",
				sequenceName = "TextHidden",
				elementPath = "PipTextTop"
			} )
			f1_arg0._visible = false
		end
		if f2_local0 ~= nil and f2_local0 == true and not f1_arg0._visible then
			ACTIONS.AnimateSequence( f1_arg0, "PipOn" )
			ACTIONS.AnimateSequenceByElement( f1_arg0, {
				elementName = "PipTextTop",
				sequenceName = "TextShown",
				elementPath = "PipTextTop"
			} )
			ACTIONS.AnimateSequenceByElement( f1_arg0, {
				elementName = "PipTextBottom",
				sequenceName = "TextShown",
				elementPath = "PipTextBottom"
			} )
			f1_arg0._visible = true
		end
	end )
end

function PipTopRight( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 300 * _1080p, 0, 300 * _1080p )
	self.id = "PipTopRight"
	self._animationSets = {}
	self._sequences = {}
	local f3_local1 = controller and controller.controllerIndex
	if not f3_local1 and not Engine.InFrontend() then
		f3_local1 = self:getRootController()
	end
	assert( f3_local1 )
	local f3_local2 = self
	local pip = nil
	
	pip = LUI.UIImage.new()
	pip.id = "pip"
	pip:setImage( RegisterMaterial( "cinematic" ), 0 )
	self:addElement( pip )
	self.pip = pip
	
	local PipTopRightFrame = nil
	
	PipTopRightFrame = MenuBuilder.BuildRegisteredType( "PipTopRightFrame", {
		controllerIndex = f3_local1
	} )
	PipTopRightFrame.id = "PipTopRightFrame"
	PipTopRightFrame.HackVideoFeedFrame.ContentLabel:SetAlpha( 0, 0 )
	PipTopRightFrame.HackVideoFeedFrame.IncomingTransmissionText:SetAlpha( 0, 0 )
	PipTopRightFrame:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * -20, _1080p * 20, _1080p * -33, _1080p * 32 )
	self:addElement( PipTopRightFrame )
	self.PipTopRightFrame = PipTopRightFrame
	
	local GenericBorderFrame = nil
	
	GenericBorderFrame = MenuBuilder.BuildRegisteredType( "GenericBorderFrame", {
		controllerIndex = f3_local1
	} )
	GenericBorderFrame.id = "GenericBorderFrame"
	GenericBorderFrame:SetRGBFromTable( SWATCHES.PIP.PIPOutline, 0 )
	GenericBorderFrame:SetAlpha( 0.5, 0 )
	GenericBorderFrame.Left:SetRight( _1080p * 2, 0 )
	GenericBorderFrame.Right:SetLeft( _1080p * -2, 0 )
	GenericBorderFrame.Top:SetBottom( _1080p * 2, 0 )
	GenericBorderFrame.Bottom:SetTop( _1080p * -2, 0 )
	GenericBorderFrame:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * -1, _1080p * 1, _1080p * -1, _1080p * 1 )
	self:addElement( GenericBorderFrame )
	self.GenericBorderFrame = GenericBorderFrame
	
	local PipStatic2 = nil
	
	PipStatic2 = MenuBuilder.BuildRegisteredType( "PipStatic", {
		controllerIndex = f3_local1
	} )
	PipStatic2.id = "PipStatic2"
	PipStatic2:SetZRotation( 90, 0 )
	PipStatic2:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, 0, 0 )
	self:addElement( PipStatic2 )
	self.PipStatic2 = PipStatic2
	
	local PipStatic = nil
	
	PipStatic = MenuBuilder.BuildRegisteredType( "PipStatic", {
		controllerIndex = f3_local1
	} )
	PipStatic.id = "PipStatic"
	PipStatic:SetAlpha( 0, 0 )
	PipStatic:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * 146, _1080p * -145, _1080p * 147, _1080p * -147 )
	self:addElement( PipStatic )
	self.PipStatic = PipStatic
	
	local PipScanlines = nil
	
	PipScanlines = MenuBuilder.BuildRegisteredType( "PipScanlines", {
		controllerIndex = f3_local1
	} )
	PipScanlines.id = "PipScanlines"
	PipScanlines:SetRGBFromInt( 4079166, 0 )
	PipScanlines:SetAlpha( 0.5, 0 )
	PipScanlines:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, 0, 0 )
	self:addElement( PipScanlines )
	self.PipScanlines = PipScanlines
	
	local PipTextTop = nil
	
	PipTextTop = MenuBuilder.BuildRegisteredType( "PipText", {
		controllerIndex = f3_local1
	} )
	PipTextTop.id = "PipTextTop"
	PipTextTop:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 9, _1080p * 244, _1080p * -24, _1080p * -6 )
	PipTextTop:SubscribeToModel( DataSources.inGame.SP.pipMessageTextTop:GetModel( f3_local1 ), function ()
		local f4_local0 = DataSources.inGame.SP.pipMessageTextTop:GetValue( f3_local1 )
		if f4_local0 ~= nil then
			PipTextTop.PipText:setText( ToUpperCase( LocalizeString( f4_local0 ) ), 0 )
		end
	end )
	self:addElement( PipTextTop )
	self.PipTextTop = PipTextTop
	
	local PipTextBottom = nil
	
	PipTextBottom = MenuBuilder.BuildRegisteredType( "PipText", {
		controllerIndex = f3_local1
	} )
	PipTextBottom.id = "PipTextBottom"
	PipTextBottom:SetAnchorsAndPosition( 0, 1, 1, 0, _1080p * 9, _1080p * 244, _1080p * 5, _1080p * 23 )
	PipTextBottom:SubscribeToModel( DataSources.inGame.SP.pipMessageTextBottom:GetModel( f3_local1 ), function ()
		local f5_local0 = DataSources.inGame.SP.pipMessageTextBottom:GetValue( f3_local1 )
		if f5_local0 ~= nil then
			PipTextBottom.PipText:setText( ToUpperCase( LocalizeString( f5_local0 ) ), 0 )
		end
	end )
	self:addElement( PipTextBottom )
	self.PipTextBottom = PipTextBottom
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		pip:RegisterAnimationSequence( "PipOff", {
			{
				function ()
					return self.pip:SetAlpha( 1, 0 )
				end,
				function ()
					return self.pip:SetAlpha( 0, 50, LUI.EASING.outQuadratic )
				end
			}
		} )
		PipTopRightFrame:RegisterAnimationSequence( "PipOff", {
			{
				function ()
					return self.PipTopRightFrame:SetAlpha( 1, 0 )
				end,
				function ()
					return self.PipTopRightFrame:SetAlpha( 0, 520, LUI.EASING.inQuadratic )
				end
			},
			{
				function ()
					return self.PipTopRightFrame.HackVideoFeedFrame.ContentLabel:SetAlpha( 0, 0 )
				end,
				function ()
					return self.PipTopRightFrame.HackVideoFeedFrame.ContentLabel:SetAlpha( 0, 280 )
				end
			},
			{
				function ()
					return self.PipTopRightFrame.HackVideoFeedFrame.IncomingTransmissionText:SetAlpha( 0, 0 )
				end,
				function ()
					return self.PipTopRightFrame.HackVideoFeedFrame.IncomingTransmissionText:SetAlpha( 0, 280 )
				end
			},
			{
				function ()
					return self.PipTopRightFrame:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * -20, _1080p * 20, _1080p * -33, _1080p * 32, 200 )
				end,
				function ()
					return self.PipTopRightFrame:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * 275, _1080p * 20, _1080p * -33, _1080p * 32, 319, LUI.EASING.inQuadratic )
				end
			}
		} )
		GenericBorderFrame:RegisterAnimationSequence( "PipOff", {
			{
				function ()
					return self.GenericBorderFrame:SetAlpha( 0.5, 0 )
				end,
				function ()
					return self.GenericBorderFrame:SetAlpha( 0, 200 )
				end
			}
		} )
		PipStatic2:RegisterAnimationSequence( "PipOff", {
			{
				function ()
					return self.PipStatic2:SetAlpha( 0.5, 100 )
				end,
				function ()
					return self.PipStatic2:SetAlpha( 0, 160 )
				end
			}
		} )
		PipStatic:RegisterAnimationSequence( "PipOff", {
			{
				function ()
					return self.PipStatic:SetAlpha( 0.5, 100 )
				end,
				function ()
					return self.PipStatic:SetAlpha( 0, 160 )
				end
			}
		} )
		PipScanlines:RegisterAnimationSequence( "PipOff", {
			{
				function ()
					return self.PipScanlines:SetAlpha( 0.1, 0 )
				end,
				function ()
					return self.PipScanlines:SetAlpha( 0, 200 )
				end
			}
		} )
		self._sequences.PipOff = function ()
			pip:AnimateSequence( "PipOff" )
			PipTopRightFrame:AnimateSequence( "PipOff" )
			GenericBorderFrame:AnimateSequence( "PipOff" )
			PipStatic2:AnimateSequence( "PipOff" )
			PipStatic:AnimateSequence( "PipOff" )
			PipScanlines:AnimateSequence( "PipOff" )
		end
		
		pip:RegisterAnimationSequence( "PipOn", {
			{
				function ()
					return self.pip:SetAlpha( 0, 0 )
				end,
				function ()
					return self.pip:SetAlpha( 0, 480 )
				end,
				function ()
					return self.pip:SetAlpha( 1, 10 )
				end
			}
		} )
		PipTopRightFrame:RegisterAnimationSequence( "PipOn", {
			{
				function ()
					return self.PipTopRightFrame:SetAlpha( 0, 0 )
				end,
				function ()
					return self.PipTopRightFrame:SetAlpha( 1, 450 )
				end
			},
			{
				function ()
					return self.PipTopRightFrame.HackVideoFeedFrame.ContentLabel:SetAlpha( 0, 0 )
				end,
				function ()
					return self.PipTopRightFrame.HackVideoFeedFrame.ContentLabel:SetAlpha( 0, 170, LUI.EASING.outBack )
				end,
				function ()
					return self.PipTopRightFrame.HackVideoFeedFrame.ContentLabel:SetAlpha( 0, 280 )
				end
			},
			{
				function ()
					return self.PipTopRightFrame.HackVideoFeedFrame.IncomingTransmissionText:SetAlpha( 0, 0 )
				end,
				function ()
					return self.PipTopRightFrame.HackVideoFeedFrame.IncomingTransmissionText:SetAlpha( 0, 170, LUI.EASING.outBack )
				end,
				function ()
					return self.PipTopRightFrame.HackVideoFeedFrame.IncomingTransmissionText:SetAlpha( 0, 280 )
				end
			},
			{
				function ()
					return self.PipTopRightFrame:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * 287, _1080p * 20, _1080p * -33, _1080p * 32, 0 )
				end,
				function ()
					return self.PipTopRightFrame:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * -20, _1080p * 20, _1080p * -33, _1080p * 32, 349, LUI.EASING.outBack )
				end
			}
		} )
		GenericBorderFrame:RegisterAnimationSequence( "PipOn", {
			{
				function ()
					return self.GenericBorderFrame:SetAlpha( 0, 0 )
				end,
				function ()
					return self.GenericBorderFrame:SetAlpha( 0, 350 )
				end,
				function ()
					return self.GenericBorderFrame:SetAlpha( 1, 200 )
				end
			}
		} )
		PipStatic2:RegisterAnimationSequence( "PipOn", {
			{
				function ()
					return self.PipStatic2:SetAlpha( 0, 0 )
				end
			}
		} )
		PipStatic:RegisterAnimationSequence( "PipOn", {
			{
				function ()
					return self.PipStatic:SetAlpha( 0, 0 )
				end,
				function ()
					return self.PipStatic:SetAlpha( 0, 290 )
				end,
				function ()
					return self.PipStatic:SetAlpha( 0.5, 90, LUI.EASING.outQuadratic )
				end,
				function ()
					return self.PipStatic:SetAlpha( 1, 80 )
				end,
				function ()
					return self.PipStatic:SetAlpha( 0, 180, LUI.EASING.outQuadratic )
				end
			},
			{
				function ()
					return self.PipStatic:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 146, _1080p * 155, _1080p * 147, _1080p * 153, 0 )
				end,
				function ()
					return self.PipStatic:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 146, _1080p * 155, _1080p * 147, _1080p * 153, 289 )
				end,
				function ()
					return self.PipStatic:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 17.11, _1080p * 283.89, _1080p * 149.5, _1080p * 153.56, 60 )
				end,
				function ()
					return self.PipStatic:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1, _1080p * 300, _1080p * 145, _1080p * 157, 30, LUI.EASING.outQuadratic )
				end,
				function ()
					return self.PipStatic:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1, _1080p * 300, 0, _1080p * 300, 80 )
				end
			}
		} )
		PipScanlines:RegisterAnimationSequence( "PipOn", {
			{
				function ()
					return self.PipScanlines:SetAlpha( 0, 0 )
				end,
				function ()
					return self.PipScanlines:SetAlpha( 0, 410 )
				end,
				function ()
					return self.PipScanlines:SetAlpha( 0.5, 140 )
				end,
				function ()
					return self.PipScanlines:SetAlpha( 0.1, 200, LUI.EASING.outQuadratic )
				end
			},
			{
				function ()
					return self.PipScanlines:SetRGBFromInt( 4079166, 0 )
				end
			}
		} )
		self._sequences.PipOn = function ()
			pip:AnimateSequence( "PipOn" )
			PipTopRightFrame:AnimateSequence( "PipOn" )
			GenericBorderFrame:AnimateSequence( "PipOn" )
			PipStatic2:AnimateSequence( "PipOn" )
			PipStatic:AnimateSequence( "PipOn" )
			PipScanlines:AnimateSequence( "PipOn" )
		end
		
		pip:RegisterAnimationSequence( "Hidden", {
			{
				function ()
					return self.pip:SetAlpha( 0, 0 )
				end
			}
		} )
		PipTopRightFrame:RegisterAnimationSequence( "Hidden", {
			{
				function ()
					return self.PipTopRightFrame:SetAlpha( 0, 0 )
				end
			}
		} )
		GenericBorderFrame:RegisterAnimationSequence( "Hidden", {
			{
				function ()
					return self.GenericBorderFrame:SetAlpha( 0, 0 )
				end
			}
		} )
		PipStatic2:RegisterAnimationSequence( "Hidden", {
			{
				function ()
					return self.PipStatic2:SetAlpha( 0, 0 )
				end
			}
		} )
		PipStatic:RegisterAnimationSequence( "Hidden", {
			{
				function ()
					return self.PipStatic:SetAlpha( 0, 0 )
				end
			}
		} )
		PipScanlines:RegisterAnimationSequence( "Hidden", {
			{
				function ()
					return self.PipScanlines:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.Hidden = function ()
			pip:AnimateSequence( "Hidden" )
			PipTopRightFrame:AnimateSequence( "Hidden" )
			GenericBorderFrame:AnimateSequence( "Hidden" )
			PipStatic2:AnimateSequence( "Hidden" )
			PipStatic:AnimateSequence( "Hidden" )
			PipScanlines:AnimateSequence( "Hidden" )
		end
		
		PipStatic2:RegisterAnimationSequence( "Static", {
			{
				function ()
					return self.PipStatic2:SetAlpha( 0, 0 )
				end,
				function ()
					return self.PipStatic2:SetAlpha( 1, 150, LUI.EASING.inQuadratic )
				end
			}
		} )
		PipStatic:RegisterAnimationSequence( "Static", {
			{
				function ()
					return self.PipStatic:SetAlpha( 1, 0 )
				end
			}
		} )
		PipScanlines:RegisterAnimationSequence( "Static", {
			{
				function ()
					return self.PipScanlines:SetAlpha( 1, 100 )
				end
			},
			{
				function ()
					return self.PipScanlines:SetRGBFromInt( 16777215, 100 )
				end
			}
		} )
		self._sequences.Static = function ()
			PipStatic2:AnimateSequence( "Static" )
			PipStatic:AnimateSequence( "Static" )
			PipScanlines:AnimateSequence( "Static" )
		end
		
		PipStatic2:RegisterAnimationSequence( "NoStatic", {
			{
				function ()
					return self.PipStatic2:SetAlpha( 0, 100 )
				end
			}
		} )
		PipStatic:RegisterAnimationSequence( "NoStatic", {
			{
				function ()
					return self.PipStatic:SetAlpha( 0, 500 )
				end
			}
		} )
		PipScanlines:RegisterAnimationSequence( "NoStatic", {
			{
				function ()
					return self.PipScanlines:SetAlpha( 0.1, 1200 )
				end
			},
			{
				function ()
					return self.PipScanlines:SetRGBFromTable( SWATCHES.PIP.PIPBackground, 1200 )
				end
			}
		} )
		self._sequences.NoStatic = function ()
			PipStatic2:AnimateSequence( "NoStatic" )
			PipStatic:AnimateSequence( "NoStatic" )
			PipScanlines:AnimateSequence( "NoStatic" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	self:registerOmnvarHandler( "ui_pip_static", function ( f78_arg0, f78_arg1 )
		local f78_local0 = f78_arg1.controller or f3_local1
		if CONDITIONS.IsSpecificOmnvarTrue( "ui_pip_static" ) then
			ACTIONS.AnimateSequence( self, "Static" )
		end
		if not CONDITIONS.IsSpecificOmnvarTrue( "ui_pip_static" ) then
			ACTIONS.AnimateSequence( self, "NoStatic" )
		end
	end )
	PostLoadFunc( self, f3_local1, controller )
	ACTIONS.AnimateSequence( self, "Hidden" )
	return self
end

MenuBuilder.registerType( "PipTopRight", PipTopRight )
LockTable( _M )
