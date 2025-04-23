local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function PostLoadFunc( f1_arg0, f1_arg1 )
	f1_arg0:SetupAnchoredElement( {
		snapToScreenEdges = false,
		naturalDistance = 1000,
		maxScale = 1,
		minScale = 1,
		screenOffsetX = 0,
		creenOffsetY = 0
	} )
	f1_arg0:SubscribeToModel( DataSources.inGame.SP.hackTargetEntity:GetModel( f1_arg1 ), function ( f2_arg0 )
		f1_arg0:SetEntityNum( Game.GetOmnvar( "ui_inworld_ar_ent" ) )
	end )
end

function SPARCallout( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 700 * _1080p, 0, 200 * _1080p )
	self.id = "SPARCallout"
	self._animationSets = {}
	self._sequences = {}
	local f3_local1 = controller and controller.controllerIndex
	if not f3_local1 and not Engine.InFrontend() then
		f3_local1 = self:getRootController()
	end
	assert( f3_local1 )
	local f3_local2 = self
	local CenterNode = nil
	
	CenterNode = LUI.UIBorder.new( {
		borderThicknessLeft = _1080p * 1,
		borderThicknessRight = _1080p * 1,
		borderThicknessTop = _1080p * 1,
		borderThicknessBottom = _1080p * 1
	} )
	CenterNode.id = "CenterNode"
	CenterNode:SetRGBFromTable( SWATCHES.callout.calloutFrame, 0 )
	CenterNode:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -5, _1080p * 5, _1080p * -5, _1080p * 5 )
	self:addElement( CenterNode )
	self.CenterNode = CenterNode
	
	local CalloutFrame = nil
	
	CalloutFrame = MenuBuilder.BuildRegisteredType( "SPARCalloutFrame", {
		controllerIndex = f3_local1
	} )
	CalloutFrame.id = "CalloutFrame"
	CalloutFrame.Background:SetAlpha( 0.5, 0 )
	CalloutFrame:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -230, _1080p * -5, _1080p * 10, _1080p * 40 )
	self:addElement( CalloutFrame )
	self.CalloutFrame = CalloutFrame
	
	local ObjectName = nil
	
	ObjectName = LUI.UIText.new()
	ObjectName.id = "ObjectName"
	ObjectName:SetRGBFromTable( SWATCHES.callout.calloutText, 0 )
	ObjectName:SetFontSize( 22 * _1080p )
	ObjectName:SetFont( FONTS.GetFont( FONTS.MainExtended.File ) )
	ObjectName:SetAlignment( LUI.Alignment.Center )
	ObjectName:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -229.5, _1080p * -4.5, _1080p * 14, _1080p * 36 )
	ObjectName:SubscribeToModel( DataSources.inGame.SP.textARElement:GetModel( f3_local1 ), function ()
		local f4_local0 = DataSources.inGame.SP.textARElement:GetValue( f3_local1 )
		if f4_local0 ~= nil then
			ObjectName:setText( ToUpperCase( LocalizeString( f4_local0 ) ), 0 )
		end
	end )
	self:addElement( ObjectName )
	self.ObjectName = ObjectName
	
	local HorzLineA = nil
	
	HorzLineA = LUI.UIImage.new()
	HorzLineA.id = "HorzLineA"
	HorzLineA:SetRGBFromTable( SWATCHES.callout.calloutFrame, 0 )
	HorzLineA:setImage( RegisterMaterial( "ui_default_white" ), 0 )
	HorzLineA:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 5, _1080p * 80, 0, _1080p * 1 )
	self:addElement( HorzLineA )
	self.HorzLineA = HorzLineA
	
	local VertLine = nil
	
	VertLine = LUI.UIImage.new()
	VertLine.id = "VertLine"
	VertLine:SetRGBFromTable( SWATCHES.callout.calloutFrame, 0 )
	VertLine:setImage( RegisterMaterial( "ui_default_white" ), 0 )
	VertLine:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 80, _1080p * 81, _1080p * -75, _1080p * 1 )
	self:addElement( VertLine )
	self.VertLine = VertLine
	
	local HorzLineB = nil
	
	HorzLineB = LUI.UIImage.new()
	HorzLineB.id = "HorzLineB"
	HorzLineB:SetRGBFromTable( SWATCHES.callout.calloutFrame, 0 )
	HorzLineB:setImage( RegisterMaterial( "ui_default_white" ), 0 )
	HorzLineB:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -270, _1080p * -229.5, _1080p * 24, _1080p * 25 )
	self:addElement( HorzLineB )
	self.HorzLineB = HorzLineB
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		CenterNode:RegisterAnimationSequence( "Hide", {
			{
				function ()
					return self.CenterNode:SetAlpha( 1, 0 )
				end,
				function ()
					return self.CenterNode:SetAlpha( 1, 500 )
				end,
				function ()
					return self.CenterNode:SetAlpha( 0, 100 )
				end
			},
			{
				function ()
					return self.CenterNode:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -5, _1080p * 5, _1080p * -5, _1080p * 5, 0 )
				end,
				function ()
					return self.CenterNode:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -5, _1080p * 5, _1080p * -5, _1080p * 5, 500 )
				end,
				function ()
					return self.CenterNode:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, 0, 0, 0, 0, 100 )
				end
			}
		} )
		CalloutFrame:RegisterAnimationSequence( "Hide", {
			{
				function ()
					return self.CalloutFrame:SetAlpha( 1, 0 )
				end,
				function ()
					return self.CalloutFrame:SetAlpha( 1, 200, LUI.EASING.inBack )
				end,
				function ()
					return self.CalloutFrame:SetAlpha( 1, 300 )
				end,
				function ()
					return self.CalloutFrame:SetAlpha( 0, 100 )
				end
			},
			{
				function ()
					return self.CalloutFrame:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -180, 0, _1080p * 10, _1080p * 40, 0 )
				end,
				function ()
					return self.CalloutFrame:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -180, _1080p * -180, _1080p * 10, _1080p * 40, 200, LUI.EASING.inBack )
				end,
				function ()
					return self.CalloutFrame:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -180, _1080p * -180, _1080p * 10, _1080p * 40, 299 )
				end,
				function ()
					return self.CalloutFrame:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -180, _1080p * -180, _1080p * 10, _1080p * 40, 100 )
				end
			}
		} )
		ObjectName:RegisterAnimationSequence( "Hide", {
			{
				function ()
					return self.ObjectName:SetAlpha( 1, 0 )
				end,
				function ()
					return self.ObjectName:SetAlpha( 0, 100 )
				end
			}
		} )
		HorzLineA:RegisterAnimationSequence( "Hide", {
			{
				function ()
					return self.HorzLineA:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 5, _1080p * 80, 0, _1080p * 1, 400 )
				end,
				function ()
					return self.HorzLineA:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 5, _1080p * 5, 0, _1080p * 1, 99 )
				end
			}
		} )
		VertLine:RegisterAnimationSequence( "Hide", {
			{
				function ()
					return self.VertLine:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 80, _1080p * 81, _1080p * -75, _1080p * 1, 0 )
				end,
				function ()
					return self.VertLine:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 80, _1080p * 81, _1080p * -75, _1080p * 1, 300 )
				end,
				function ()
					return self.VertLine:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 80, _1080p * 81, _1080p * 1, _1080p * 1, 99 )
				end
			}
		} )
		HorzLineB:RegisterAnimationSequence( "Hide", {
			{
				function ()
					return self.HorzLineB:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -220, _1080p * -180, _1080p * 24, _1080p * 25, 0 )
				end,
				function ()
					return self.HorzLineB:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -220, _1080p * -180, _1080p * 24, _1080p * 25, 200 )
				end,
				function ()
					return self.HorzLineB:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -220, _1080p * -220, _1080p * 24, _1080p * 25, 100 )
				end
			}
		} )
		self._sequences.Hide = function ()
			CenterNode:AnimateSequence( "Hide" )
			CalloutFrame:AnimateSequence( "Hide" )
			ObjectName:AnimateSequence( "Hide" )
			HorzLineA:AnimateSequence( "Hide" )
			VertLine:AnimateSequence( "Hide" )
			HorzLineB:AnimateSequence( "Hide" )
		end
		
		CenterNode:RegisterAnimationSequence( "Show", {
			{
				function ()
					return self.CenterNode:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.CenterNode:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, 0, 0, 0, 0, 0 )
				end,
				function ()
					return self.CenterNode:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -5, _1080p * 5, _1080p * -5, _1080p * 5, 200 )
				end
			}
		} )
		CalloutFrame:RegisterAnimationSequence( "Show", {
			{
				function ()
					return self.CalloutFrame:SetAlpha( 1, 0 )
				end,
				function ()
					return self.CalloutFrame:SetAlpha( 1, 500 )
				end,
				function ()
					return self.CalloutFrame:SetAlpha( 1, 200, LUI.EASING.outBack )
				end
			},
			{
				function ()
					return self.CalloutFrame:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -180, _1080p * -180, _1080p * 10, _1080p * 40, 0 )
				end,
				function ()
					return self.CalloutFrame:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -180, _1080p * -180, _1080p * 10, _1080p * 40, 500 )
				end,
				function ()
					return self.CalloutFrame:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -230, _1080p * -5, _1080p * 10, _1080p * 40, 199, LUI.EASING.outBack )
				end
			}
		} )
		ObjectName:RegisterAnimationSequence( "Show", {
			{
				function ()
					return self.ObjectName:SetAlpha( 0, 0 )
				end,
				function ()
					return self.ObjectName:SetAlpha( 0, 600 )
				end,
				function ()
					return self.ObjectName:SetAlpha( 1, 100 )
				end
			}
		} )
		HorzLineA:RegisterAnimationSequence( "Show", {
			{
				function ()
					return self.HorzLineA:SetAlpha( 1, 300 )
				end
			},
			{
				function ()
					return self.HorzLineA:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 5, _1080p * 5, 0, _1080p * 1, 0 )
				end,
				function ()
					return self.HorzLineA:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 5, _1080p * 5, 0, _1080p * 1, 200 )
				end,
				function ()
					return self.HorzLineA:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 5, _1080p * 80, 0, _1080p * 1, 100 )
				end
			}
		} )
		VertLine:RegisterAnimationSequence( "Show", {
			{
				function ()
					return self.VertLine:SetAlpha( 1, 400 )
				end
			},
			{
				function ()
					return self.VertLine:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 80, _1080p * 81, _1080p * 1, _1080p * 1, 0 )
				end,
				function ()
					return self.VertLine:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 80, _1080p * 81, _1080p * 1, _1080p * 1, 300 )
				end,
				function ()
					return self.VertLine:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 80, _1080p * 81, _1080p * -75, _1080p * 1, 99 )
				end
			}
		} )
		HorzLineB:RegisterAnimationSequence( "Show", {
			{
				function ()
					return self.HorzLineB:SetAlpha( 1, 500 )
				end
			},
			{
				function ()
					return self.HorzLineB:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -270, _1080p * -270, _1080p * 24, _1080p * 25, 0 )
				end,
				function ()
					return self.HorzLineB:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -270, _1080p * -270, _1080p * 24, _1080p * 25, 400 )
				end,
				function ()
					return self.HorzLineB:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -270, _1080p * -230, _1080p * 24, _1080p * 25, 99 )
				end,
				function ()
					return self.HorzLineB:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -270, _1080p * -230, _1080p * 24, _1080p * 25, 199 )
				end
			}
		} )
		self._sequences.Show = function ()
			CenterNode:AnimateSequence( "Show" )
			CalloutFrame:AnimateSequence( "Show" )
			ObjectName:AnimateSequence( "Show" )
			HorzLineA:AnimateSequence( "Show" )
			VertLine:AnimateSequence( "Show" )
			HorzLineB:AnimateSequence( "Show" )
		end
		
		CenterNode:RegisterAnimationSequence( "HideAlt", {
			{
				function ()
					return self.CenterNode:SetAlpha( 0, 100 )
				end
			}
		} )
		CalloutFrame:RegisterAnimationSequence( "HideAlt", {
			{
				function ()
					return self.CalloutFrame:SetAlpha( 0, 100 )
				end
			},
			{
				function ()
					return self.CalloutFrame:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -180, 0, _1080p * 10, _1080p * 40, 100 )
				end
			}
		} )
		ObjectName:RegisterAnimationSequence( "HideAlt", {
			{
				function ()
					return self.ObjectName:SetAlpha( 0, 100 )
				end
			}
		} )
		HorzLineA:RegisterAnimationSequence( "HideAlt", {
			{
				function ()
					return self.HorzLineA:SetAlpha( 0, 100 )
				end
			}
		} )
		VertLine:RegisterAnimationSequence( "HideAlt", {
			{
				function ()
					return self.VertLine:SetAlpha( 0, 100 )
				end
			}
		} )
		HorzLineB:RegisterAnimationSequence( "HideAlt", {
			{
				function ()
					return self.HorzLineB:SetAlpha( 0, 100 )
				end
			}
		} )
		self._sequences.HideAlt = function ()
			CenterNode:AnimateSequence( "HideAlt" )
			CalloutFrame:AnimateSequence( "HideAlt" )
			ObjectName:AnimateSequence( "HideAlt" )
			HorzLineA:AnimateSequence( "HideAlt" )
			VertLine:AnimateSequence( "HideAlt" )
			HorzLineB:AnimateSequence( "HideAlt" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	self:SubscribeToModel( DataSources.inGame.SP.showARElement:GetModel( f3_local1 ), function ()
		if DataSources.inGame.SP.showARElement:GetValue( f3_local1 ) ~= nil and DataSources.inGame.SP.showARElement:GetValue( f3_local1 ) == true then
			ACTIONS.AnimateSequence( self, "Show" )
		end
		if DataSources.inGame.SP.showARElement:GetValue( f3_local1 ) ~= nil and DataSources.inGame.SP.showARElement:GetValue( f3_local1 ) == false then
			ACTIONS.AnimateSequence( self, "Hide" )
		end
	end )
	PostLoadFunc( self, f3_local1, controller )
	return self
end

MenuBuilder.registerType( "SPARCallout", SPARCallout )
LockTable( _M )
