local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function PostLoadFunc( f1_arg0, f1_arg1 )
	f1_arg0:addEventHandler( "lose_focus", function ( f2_arg0, f2_arg1 )
		local f2_local0 = f1_arg0:GetDataSource()
		assert( f2_local0 )
		f2_local0.stateDataSource:SetValue( f1_arg1, ShipCribUtils.CapCompStates.READ )
	end )
	f1_arg0:addEventHandler( "button_action", function ( f3_arg0, f3_arg1 )
		local f3_local0 = f1_arg0:GetDataSource()
		assert( f3_local0 )
		if f3_local0.contentType then
			if f3_local0.contentType == "audio" then
				Engine.PlaySound( f3_local0.contentName )
			elseif f3_local0.index ~= nil then
				Engine.NotifyServer( f3_local0.contentName, f3_local0.indexValue )
			else
				Engine.NotifyServer( f3_local0.contentName, 0 )
			end
		end
	end )
end

function CapOpsReportButton( menu, controller )
	local self = LUI.UIButton.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 900 * _1080p, 0, 100 * _1080p )
	self.id = "CapOpsReportButton"
	self._animationSets = {}
	self._sequences = {}
	local f4_local1 = controller and controller.controllerIndex
	if not f4_local1 and not Engine.InFrontend() then
		f4_local1 = self:getRootController()
	end
	assert( f4_local1 )
	local f4_local2 = self
	local CornersCopy1 = nil
	
	CornersCopy1 = LUI.UIImage.new()
	CornersCopy1.id = "CornersCopy1"
	CornersCopy1:SetRGBFromInt( 2368549, 0 )
	CornersCopy1:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 17, _1080p * 608, 0, _1080p * 73 )
	self:addElement( CornersCopy1 )
	self.CornersCopy1 = CornersCopy1
	
	local CornersCopy0 = nil
	
	CornersCopy0 = LUI.UIImage.new()
	CornersCopy0.id = "CornersCopy0"
	CornersCopy0:SetRGBFromInt( 2697514, 0 )
	CornersCopy0:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 17, _1080p * 608, _1080p * 61, _1080p * 73 )
	self:addElement( CornersCopy0 )
	self.CornersCopy0 = CornersCopy0
	
	local Corners = nil
	
	Corners = LUI.UIImage.new()
	Corners.id = "Corners"
	Corners:setImage( RegisterMaterial( "hud_captain_computer_corners" ), 0 )
	Corners:SetUMin( -0.01, 0 )
	Corners:SetUMax( 0.87, 0 )
	Corners:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 16, _1080p * 29, 0, _1080p * 73 )
	self:addElement( Corners )
	self.Corners = Corners
	
	local DescriptionLabel = nil
	
	DescriptionLabel = LUI.UIText.new()
	DescriptionLabel.id = "DescriptionLabel"
	DescriptionLabel:SetRGBFromInt( 6710886, 0 )
	DescriptionLabel:SetFontSize( 22 * _1080p )
	DescriptionLabel:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	DescriptionLabel:SetAlignment( LUI.Alignment.Left )
	DescriptionLabel:SetAnchorsAndPosition( 0, 1, 1, 0, _1080p * 35, _1080p * 442, _1080p * -64, _1080p * -42 )
	DescriptionLabel:SubscribeToModelThroughElement( self, "subtitle", function ()
		local f5_local0 = self:GetDataSource()
		f5_local0 = f5_local0.subtitle:GetValue( f4_local1 )
		if f5_local0 ~= nil then
			DescriptionLabel:setText( f5_local0, 0 )
		end
	end )
	self:addElement( DescriptionLabel )
	self.DescriptionLabel = DescriptionLabel
	
	local MissionTypeLabel = nil
	
	MissionTypeLabel = LUI.UIText.new()
	MissionTypeLabel.id = "MissionTypeLabel"
	MissionTypeLabel:SetRGBFromInt( 8421504, 0 )
	MissionTypeLabel:SetFontSize( 24 * _1080p )
	MissionTypeLabel:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	MissionTypeLabel:SetAlignment( LUI.Alignment.Left )
	MissionTypeLabel:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 35, _1080p * 545, _1080p * 7, _1080p * 31 )
	MissionTypeLabel:SubscribeToModelThroughElement( self, "title", function ()
		local f6_local0 = self:GetDataSource()
		f6_local0 = f6_local0.title:GetValue( f4_local1 )
		if f6_local0 ~= nil then
			MissionTypeLabel:setText( ToUpperCase( f6_local0 ), 0 )
		end
	end )
	self:addElement( MissionTypeLabel )
	self.MissionTypeLabel = MissionTypeLabel
	
	local IsNewIndicator = nil
	
	IsNewIndicator = LUI.UIImage.new()
	IsNewIndicator.id = "IsNewIndicator"
	IsNewIndicator:SetRGBFromInt( 16773916, 0 )
	IsNewIndicator:setImage( RegisterMaterial( "hud_icon_jackal_alert" ), 0 )
	IsNewIndicator:SetUseAA( true )
	IsNewIndicator:SetAnchorsAndPosition( 1, 0, 1, 0, _1080p * -293, _1080p * -249, _1080p * -100.5, _1080p * -56.5 )
	IsNewIndicator:SubscribeToModelThroughElement( self, "isNewAlpha", function ()
		local f7_local0 = self:GetDataSource()
		f7_local0 = f7_local0.isNewAlpha:GetValue( f4_local1 )
		if f7_local0 ~= nil then
			IsNewIndicator:SetAlpha( f7_local0, 0 )
		end
	end )
	self:addElement( IsNewIndicator )
	self.IsNewIndicator = IsNewIndicator
	
	local LogLabel = nil
	
	LogLabel = LUI.UIText.new()
	LogLabel.id = "LogLabel"
	LogLabel:setText( Engine.Localize( "CAPCOMP_LOG_LABEL" ), 0 )
	LogLabel:SetFontSize( 18 * _1080p )
	LogLabel:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	LogLabel:SetAlignment( LUI.Alignment.Right )
	LogLabel:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 442, _1080p * 592.5, _1080p * 37, _1080p * 55 )
	self:addElement( LogLabel )
	self.LogLabel = LogLabel
	
	local LogLabelCopy0 = nil
	
	LogLabelCopy0 = LUI.UIText.new()
	LogLabelCopy0.id = "LogLabelCopy0"
	LogLabelCopy0:SetFontSize( 32 * _1080p )
	LogLabelCopy0:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	LogLabelCopy0:SetAlignment( LUI.Alignment.Right )
	LogLabelCopy0:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 532.5, _1080p * 592.5, _1080p * 4, _1080p * 39 )
	LogLabelCopy0:SubscribeToModelThroughElement( self, "index", function ()
		local f8_local0 = self:GetDataSource()
		f8_local0 = f8_local0.index:GetValue( f4_local1 )
		if f8_local0 ~= nil then
			LogLabelCopy0:setText( f8_local0, 0 )
		end
	end )
	self:addElement( LogLabelCopy0 )
	self.LogLabelCopy0 = LogLabelCopy0
	
	local CornersCopy2 = nil
	
	CornersCopy2 = LUI.UIImage.new()
	CornersCopy2.id = "CornersCopy2"
	CornersCopy2:SetRGBFromInt( 5132112, 0 )
	CornersCopy2:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 545, _1080p * 608, _1080p * 61, _1080p * 73 )
	self:addElement( CornersCopy2 )
	self.CornersCopy2 = CornersCopy2
	
	local CornersCopy3 = nil
	
	CornersCopy3 = LUI.UIImage.new()
	CornersCopy3.id = "CornersCopy3"
	CornersCopy3:SetZRotation( 180, 0 )
	CornersCopy3:setImage( RegisterMaterial( "hud_captain_computer_corners" ), 0 )
	CornersCopy3:SetUMin( -0.01, 0 )
	CornersCopy3:SetUMax( 0.87, 0 )
	CornersCopy3:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 595, _1080p * 608, 0, _1080p * 73 )
	self:addElement( CornersCopy3 )
	self.CornersCopy3 = CornersCopy3
	
	local ArrowUp = nil
	
	ArrowUp = MenuBuilder.BuildRegisteredType( "ArrowUp", {
		controllerIndex = f4_local1
	} )
	ArrowUp.id = "ArrowUp"
	ArrowUp:SetRGBFromInt( 16773916, 0 )
	ArrowUp:SetAlpha( 0, 0 )
	ArrowUp:SetZRotation( 90, 0 )
	ArrowUp:SetDotPitchEnabled( true )
	ArrowUp:SetDotPitchX( 0, 0 )
	ArrowUp:SetDotPitchY( 0, 0 )
	ArrowUp:SetDotPitchContrast( 0, 0 )
	ArrowUp:SetDotPitchMode( 0 )
	ArrowUp:SetAnchorsAndPosition( 0, 1, 1, 0, _1080p * 698, _1080p * 718, _1080p * -81, _1080p * -41 )
	self:addElement( ArrowUp )
	self.ArrowUp = ArrowUp
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		CornersCopy1:RegisterAnimationSequence( "ButtonOver", {
			{
				function ()
					return self.CornersCopy1:SetRGBFromInt( 2368549, 0 )
				end,
				function ()
					return self.CornersCopy1:SetRGBFromInt( 3750203, 100 )
				end
			},
			{
				function ()
					return self.CornersCopy1:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 17, _1080p * 608, 0, _1080p * 73, 0 )
				end,
				function ()
					return self.CornersCopy1:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 51.78, _1080p * 642.78, 0, _1080p * 73, 100 )
				end
			}
		} )
		CornersCopy0:RegisterAnimationSequence( "ButtonOver", {
			{
				function ()
					return self.CornersCopy0:SetRGBFromInt( 2697514, 0 )
				end,
				function ()
					return self.CornersCopy0:SetRGBFromInt( 5263442, 100 )
				end
			},
			{
				function ()
					return self.CornersCopy0:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 17, _1080p * 608, _1080p * 61, _1080p * 73, 0 )
				end,
				function ()
					return self.CornersCopy0:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 51.78, _1080p * 642.78, _1080p * 61, _1080p * 73, 100 )
				end
			}
		} )
		Corners:RegisterAnimationSequence( "ButtonOver", {
			{
				function ()
					return self.Corners:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 16, _1080p * 29, 0, _1080p * 73, 0 )
				end,
				function ()
					return self.Corners:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 50.78, _1080p * 63.78, 0, _1080p * 73, 100 )
				end
			}
		} )
		DescriptionLabel:RegisterAnimationSequence( "ButtonOver", {
			{
				function ()
					return self.DescriptionLabel:SetRGBFromInt( 6710886, 0 )
				end,
				function ()
					return self.DescriptionLabel:SetRGBFromInt( 10066329, 100 )
				end
			},
			{
				function ()
					return self.DescriptionLabel:SetAnchorsAndPosition( 0, 1, 1, 0, _1080p * 35, _1080p * 450, _1080p * -64, _1080p * -42, 0 )
				end,
				function ()
					return self.DescriptionLabel:SetAnchorsAndPosition( 0, 1, 1, 0, _1080p * 69.78, _1080p * 476.78, _1080p * -64, _1080p * -42, 100 )
				end
			}
		} )
		MissionTypeLabel:RegisterAnimationSequence( "ButtonOver", {
			{
				function ()
					return self.MissionTypeLabel:SetRGBFromInt( 8421504, 0 )
				end,
				function ()
					return self.MissionTypeLabel:SetRGBFromInt( 16773916, 100 )
				end
			},
			{
				function ()
					return self.MissionTypeLabel:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 35, _1080p * 545, _1080p * 7, _1080p * 36, 0 )
				end,
				function ()
					return self.MissionTypeLabel:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 69.78, _1080p * 579.78, _1080p * 7, _1080p * 36, 100 )
				end
			}
		} )
		IsNewIndicator:RegisterAnimationSequence( "ButtonOver", {
			{
				function ()
					return self.IsNewIndicator:SetAnchorsAndPosition( 1, 0, 1, 0, _1080p * -293, _1080p * -249, _1080p * -100.5, _1080p * -56.5, 0 )
				end,
				function ()
					return self.IsNewIndicator:SetAnchorsAndPosition( 1, 0, 1, 0, _1080p * -258.22, _1080p * -214.22, _1080p * -100.5, _1080p * -56.5, 100 )
				end
			}
		} )
		LogLabel:RegisterAnimationSequence( "ButtonOver", {
			{
				function ()
					return self.LogLabel:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 442, _1080p * 592.5, _1080p * 36, _1080p * 55.5, 0 )
				end,
				function ()
					return self.LogLabel:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 476.78, _1080p * 627.28, _1080p * 36, _1080p * 55.5, 100 )
				end
			}
		} )
		LogLabelCopy0:RegisterAnimationSequence( "ButtonOver", {
			{
				function ()
					return self.LogLabelCopy0:SetRGBFromInt( 16777215, 0 )
				end,
				function ()
					return self.LogLabelCopy0:SetRGBFromInt( 16773916, 100 )
				end
			},
			{
				function ()
					return self.LogLabelCopy0:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 532.5, _1080p * 592.5, _1080p * 4, _1080p * 39, 0 )
				end,
				function ()
					return self.LogLabelCopy0:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 567.28, _1080p * 627.28, _1080p * 4, _1080p * 39, 100 )
				end
			}
		} )
		CornersCopy2:RegisterAnimationSequence( "ButtonOver", {
			{
				function ()
					return self.CornersCopy2:SetRGBFromInt( 5132112, 0 )
				end,
				function ()
					return self.CornersCopy2:SetRGBFromInt( 16773916, 100 )
				end
			},
			{
				function ()
					return self.CornersCopy2:SetBlendMode( BLEND_MODE.disabled )
				end,
				function ()
					return self.CornersCopy2:SetBlendMode( BLEND_MODE.add )
				end
			},
			{
				function ()
					return self.CornersCopy2:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 545, _1080p * 608, _1080p * 61, _1080p * 73, 0 )
				end,
				function ()
					return self.CornersCopy2:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 579.78, _1080p * 642.78, _1080p * 61, _1080p * 73, 100 )
				end
			}
		} )
		CornersCopy3:RegisterAnimationSequence( "ButtonOver", {
			{
				function ()
					return self.CornersCopy3:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 595, _1080p * 608, 0, _1080p * 73, 0 )
				end,
				function ()
					return self.CornersCopy3:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 629.78, _1080p * 642.78, 0, _1080p * 73, 100 )
				end
			}
		} )
		ArrowUp:RegisterAnimationSequence( "ButtonOver", {
			{
				function ()
					return self.ArrowUp:SetAlpha( 0, 0 )
				end,
				function ()
					return self.ArrowUp:SetAlpha( 1, 100 )
				end
			},
			{
				function ()
					return self.ArrowUp:SetRGBFromInt( 16773916, 0 )
				end
			},
			{
				function ()
					return self.ArrowUp:SetAnchorsAndPosition( 0, 1, 1, 0, _1080p * 698, _1080p * 718, _1080p * -81, _1080p * -41, 0 )
				end,
				function ()
					return self.ArrowUp:SetAnchorsAndPosition( 0, 1, 1, 0, _1080p * 685.78, _1080p * 705.78, _1080p * -81, _1080p * -41, 100 )
				end
			}
		} )
		self._sequences.ButtonOver = function ()
			CornersCopy1:AnimateSequence( "ButtonOver" )
			CornersCopy0:AnimateSequence( "ButtonOver" )
			Corners:AnimateSequence( "ButtonOver" )
			DescriptionLabel:AnimateSequence( "ButtonOver" )
			MissionTypeLabel:AnimateSequence( "ButtonOver" )
			IsNewIndicator:AnimateSequence( "ButtonOver" )
			LogLabel:AnimateSequence( "ButtonOver" )
			LogLabelCopy0:AnimateSequence( "ButtonOver" )
			CornersCopy2:AnimateSequence( "ButtonOver" )
			CornersCopy3:AnimateSequence( "ButtonOver" )
			ArrowUp:AnimateSequence( "ButtonOver" )
		end
		
		CornersCopy1:RegisterAnimationSequence( "ButtonUp", {
			{
				function ()
					return self.CornersCopy1:SetRGBFromInt( 2368549, 0 )
				end
			},
			{
				function ()
					return self.CornersCopy1:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 17, _1080p * 608, 0, _1080p * 73, 0 )
				end
			}
		} )
		CornersCopy0:RegisterAnimationSequence( "ButtonUp", {
			{
				function ()
					return self.CornersCopy0:SetRGBFromInt( 2697514, 0 )
				end
			},
			{
				function ()
					return self.CornersCopy0:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 17, _1080p * 608, _1080p * 61, _1080p * 73, 0 )
				end
			}
		} )
		Corners:RegisterAnimationSequence( "ButtonUp", {
			{
				function ()
					return self.Corners:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 16, _1080p * 29, 0, _1080p * 73, 0 )
				end
			}
		} )
		DescriptionLabel:RegisterAnimationSequence( "ButtonUp", {
			{
				function ()
					return self.DescriptionLabel:SetRGBFromInt( 6710886, 0 )
				end
			},
			{
				function ()
					return self.DescriptionLabel:SetAnchorsAndPosition( 0, 1, 1, 0, _1080p * 35, _1080p * 442, _1080p * -64, _1080p * -42, 0 )
				end
			}
		} )
		MissionTypeLabel:RegisterAnimationSequence( "ButtonUp", {
			{
				function ()
					return self.MissionTypeLabel:SetRGBFromInt( 8421504, 0 )
				end
			},
			{
				function ()
					return self.MissionTypeLabel:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 35, _1080p * 545, _1080p * 7, _1080p * 36, 0 )
				end
			}
		} )
		IsNewIndicator:RegisterAnimationSequence( "ButtonUp", {
			{
				function ()
					return self.IsNewIndicator:SetAnchorsAndPosition( 1, 0, 1, 0, _1080p * -293, _1080p * -249, _1080p * -100.5, _1080p * -56.5, 0 )
				end
			}
		} )
		LogLabel:RegisterAnimationSequence( "ButtonUp", {
			{
				function ()
					return self.LogLabel:SetRGBFromInt( 10066329, 0 )
				end
			},
			{
				function ()
					return self.LogLabel:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 442, _1080p * 592.5, _1080p * 36, _1080p * 55.5, 0 )
				end
			}
		} )
		LogLabelCopy0:RegisterAnimationSequence( "ButtonUp", {
			{
				function ()
					return self.LogLabelCopy0:SetRGBFromInt( 10066329, 0 )
				end
			},
			{
				function ()
					return self.LogLabelCopy0:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 532.5, _1080p * 592.5, _1080p * 4, _1080p * 39, 0 )
				end
			}
		} )
		CornersCopy2:RegisterAnimationSequence( "ButtonUp", {
			{
				function ()
					return self.CornersCopy2:SetRGBFromInt( 5132112, 0 )
				end
			},
			{
				function ()
					return self.CornersCopy2:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 545, _1080p * 608, _1080p * 61, _1080p * 73, 0 )
				end
			}
		} )
		CornersCopy3:RegisterAnimationSequence( "ButtonUp", {
			{
				function ()
					return self.CornersCopy3:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 595, _1080p * 608, 0, _1080p * 73, 0 )
				end
			}
		} )
		self._sequences.ButtonUp = function ()
			CornersCopy1:AnimateSequence( "ButtonUp" )
			CornersCopy0:AnimateSequence( "ButtonUp" )
			Corners:AnimateSequence( "ButtonUp" )
			DescriptionLabel:AnimateSequence( "ButtonUp" )
			MissionTypeLabel:AnimateSequence( "ButtonUp" )
			IsNewIndicator:AnimateSequence( "ButtonUp" )
			LogLabel:AnimateSequence( "ButtonUp" )
			LogLabelCopy0:AnimateSequence( "ButtonUp" )
			CornersCopy2:AnimateSequence( "ButtonUp" )
			CornersCopy3:AnimateSequence( "ButtonUp" )
		end
		
		CornersCopy1:RegisterAnimationSequence( "ButtonUp2", {
			{
				function ()
					return self.CornersCopy1:SetRGBFromInt( 3750203, 0 )
				end,
				function ()
					return self.CornersCopy1:SetRGBFromInt( 2368549, 100 )
				end
			},
			{
				function ()
					return self.CornersCopy1:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 51.78, _1080p * 642.78, 0, _1080p * 73, 0 )
				end,
				function ()
					return self.CornersCopy1:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 17, _1080p * 608, 0, _1080p * 73, 100 )
				end
			}
		} )
		CornersCopy0:RegisterAnimationSequence( "ButtonUp2", {
			{
				function ()
					return self.CornersCopy0:SetRGBFromInt( 5263442, 0 )
				end,
				function ()
					return self.CornersCopy0:SetRGBFromInt( 2697514, 100 )
				end
			},
			{
				function ()
					return self.CornersCopy0:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 51.78, _1080p * 642.78, _1080p * 61, _1080p * 73, 0 )
				end,
				function ()
					return self.CornersCopy0:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 17, _1080p * 608, _1080p * 61, _1080p * 73, 100 )
				end
			}
		} )
		Corners:RegisterAnimationSequence( "ButtonUp2", {
			{
				function ()
					return self.Corners:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 50.78, _1080p * 63.78, 0, _1080p * 73, 0 )
				end,
				function ()
					return self.Corners:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 16, _1080p * 29, 0, _1080p * 73, 100 )
				end
			}
		} )
		DescriptionLabel:RegisterAnimationSequence( "ButtonUp2", {
			{
				function ()
					return self.DescriptionLabel:SetRGBFromInt( 10066329, 0 )
				end,
				function ()
					return self.DescriptionLabel:SetRGBFromInt( 6710886, 100 )
				end
			},
			{
				function ()
					return self.DescriptionLabel:SetAnchorsAndPosition( 0, 1, 1, 0, _1080p * 69.78, _1080p * 476.78, _1080p * -64, _1080p * -42, 0 )
				end,
				function ()
					return self.DescriptionLabel:SetAnchorsAndPosition( 0, 1, 1, 0, _1080p * 35, _1080p * 440, _1080p * -64, _1080p * -42, 100 )
				end
			}
		} )
		MissionTypeLabel:RegisterAnimationSequence( "ButtonUp2", {
			{
				function ()
					return self.MissionTypeLabel:SetRGBFromInt( 16773916, 0 )
				end,
				function ()
					return self.MissionTypeLabel:SetRGBFromInt( 8421504, 100 )
				end
			},
			{
				function ()
					return self.MissionTypeLabel:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 69.78, _1080p * 579.78, _1080p * 7, _1080p * 36, 0 )
				end,
				function ()
					return self.MissionTypeLabel:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 35, _1080p * 545, _1080p * 7, _1080p * 36, 100 )
				end
			}
		} )
		IsNewIndicator:RegisterAnimationSequence( "ButtonUp2", {
			{
				function ()
					return self.IsNewIndicator:SetAnchorsAndPosition( 1, 0, 1, 0, _1080p * -258.22, _1080p * -214.22, _1080p * -100.5, _1080p * -56.5, 0 )
				end,
				function ()
					return self.IsNewIndicator:SetAnchorsAndPosition( 1, 0, 1, 0, _1080p * -293, _1080p * -249, _1080p * -100.5, _1080p * -56.5, 100 )
				end
			}
		} )
		LogLabel:RegisterAnimationSequence( "ButtonUp2", {
			{
				function ()
					return self.LogLabel:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 476.78, _1080p * 627.28, _1080p * 36, _1080p * 55.5, 0 )
				end,
				function ()
					return self.LogLabel:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 442, _1080p * 592.5, _1080p * 36, _1080p * 55.5, 100 )
				end
			}
		} )
		LogLabelCopy0:RegisterAnimationSequence( "ButtonUp2", {
			{
				function ()
					return self.LogLabelCopy0:SetRGBFromInt( 16773916, 0 )
				end,
				function ()
					return self.LogLabelCopy0:SetRGBFromInt( 16777215, 100 )
				end
			},
			{
				function ()
					return self.LogLabelCopy0:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 567.28, _1080p * 627.28, _1080p * 4, _1080p * 39, 0 )
				end,
				function ()
					return self.LogLabelCopy0:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 532.5, _1080p * 592.5, _1080p * 4, _1080p * 39, 100 )
				end
			}
		} )
		CornersCopy2:RegisterAnimationSequence( "ButtonUp2", {
			{
				function ()
					return self.CornersCopy2:SetRGBFromInt( 16773916, 0 )
				end,
				function ()
					return self.CornersCopy2:SetRGBFromInt( 5132112, 100 )
				end
			},
			{
				function ()
					return self.CornersCopy2:SetBlendMode( BLEND_MODE.add )
				end,
				function ()
					return self.CornersCopy2:SetBlendMode( BLEND_MODE.disabled )
				end
			},
			{
				function ()
					return self.CornersCopy2:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 579.78, _1080p * 642.78, _1080p * 61, _1080p * 73, 0 )
				end,
				function ()
					return self.CornersCopy2:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 545, _1080p * 608, _1080p * 61, _1080p * 73, 100 )
				end
			}
		} )
		CornersCopy3:RegisterAnimationSequence( "ButtonUp2", {
			{
				function ()
					return self.CornersCopy3:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 629.78, _1080p * 642.78, 0, _1080p * 73, 0 )
				end,
				function ()
					return self.CornersCopy3:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 595, _1080p * 608, 0, _1080p * 73, 100 )
				end
			}
		} )
		ArrowUp:RegisterAnimationSequence( "ButtonUp2", {
			{
				function ()
					return self.ArrowUp:SetAlpha( 1, 0 )
				end,
				function ()
					return self.ArrowUp:SetAlpha( 0, 100 )
				end
			},
			{
				function ()
					return self.ArrowUp:SetAnchorsAndPosition( 0, 1, 1, 0, _1080p * 685.78, _1080p * 705.78, _1080p * -81, _1080p * -41, 0 )
				end,
				function ()
					return self.ArrowUp:SetAnchorsAndPosition( 0, 1, 1, 0, _1080p * 713.78, _1080p * 733.78, _1080p * -81, _1080p * -41, 100 )
				end
			}
		} )
		self._sequences.ButtonUp2 = function ()
			CornersCopy1:AnimateSequence( "ButtonUp2" )
			CornersCopy0:AnimateSequence( "ButtonUp2" )
			Corners:AnimateSequence( "ButtonUp2" )
			DescriptionLabel:AnimateSequence( "ButtonUp2" )
			MissionTypeLabel:AnimateSequence( "ButtonUp2" )
			IsNewIndicator:AnimateSequence( "ButtonUp2" )
			LogLabel:AnimateSequence( "ButtonUp2" )
			LogLabelCopy0:AnimateSequence( "ButtonUp2" )
			CornersCopy2:AnimateSequence( "ButtonUp2" )
			CornersCopy3:AnimateSequence( "ButtonUp2" )
			ArrowUp:AnimateSequence( "ButtonUp2" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	self:addEventHandler( "button_over", function ( f108_arg0, f108_arg1 )
		local f108_local0 = f108_arg1.controller or f4_local1
		ACTIONS.AnimateSequence( self, "ButtonOver" )
	end )
	self:addEventHandler( "button_up", function ( f109_arg0, f109_arg1 )
		local f109_local0 = f109_arg1.controller or f4_local1
		ACTIONS.AnimateSequence( self, "ButtonUp2" )
	end )
	PostLoadFunc( self, f4_local1, controller )
	ACTIONS.AnimateSequence( self, "ButtonUp" )
	return self
end

MenuBuilder.registerType( "CapOpsReportButton", CapOpsReportButton )
LockTable( _M )
