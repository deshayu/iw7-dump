local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function PostLoadFunc( f1_arg0, f1_arg1, f1_arg2 )
	f1_arg0:SetBlendMode( BLEND_MODE.addWithAlpha )
	f1_arg0:SetupAnchoredElement( {
		snapToScreenEdges = false,
		scaleUsingLayout = true,
		naturalDistance = 850,
		minScale = 1,
		maxScale = 3,
		screenOffsetY = 12,
		entityTag = "j_spine4"
	} )
	local f1_local0 = DataSources.inGame.SP.hackTargetEntity
	f1_arg0:SubscribeToModel( f1_local0:GetModel( f1_arg1 ), function ( f2_arg0 )
		local f2_local0 = f1_local0:GetValue( f1_arg1 )
		if f2_local0 ~= nil then
			f1_arg0:SetEntityNum( f2_local0 )
		end
	end )
end

function HackTargetingMarker( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 100 * _1080p, 0, 100 * _1080p )
	self.id = "HackTargetingMarker"
	self._animationSets = {}
	self._sequences = {}
	local f3_local1 = controller and controller.controllerIndex
	if not f3_local1 and not Engine.InFrontend() then
		f3_local1 = self:getRootController()
	end
	assert( f3_local1 )
	local f3_local2 = self
	local FrameAnim = nil
	
	FrameAnim = MenuBuilder.BuildRegisteredType( "HackTargetingMarkerFrame", {
		controllerIndex = f3_local1
	} )
	FrameAnim.id = "FrameAnim"
	FrameAnim:SetRGBFromInt( 15613731, 0 )
	FrameAnim:SetAlpha( 0, 0 )
	FrameAnim:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, 0, 0 )
	self:addElement( FrameAnim )
	self.FrameAnim = FrameAnim
	
	local Frame = nil
	
	Frame = MenuBuilder.BuildRegisteredType( "HackTargetingMarkerFrame", {
		controllerIndex = f3_local1
	} )
	Frame.id = "Frame"
	Frame:SetRGBFromTable( SWATCHES.robotHacking.normal, 0 )
	Frame:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, 0, 0 )
	self:addElement( Frame )
	self.Frame = Frame
	
	local Diamond = nil
	
	Diamond = LUI.UIBorder.new( {
		borderThicknessLeft = _1080p * 2,
		borderThicknessRight = _1080p * 2,
		borderThicknessTop = _1080p * 2,
		borderThicknessBottom = _1080p * 2
	} )
	Diamond.id = "Diamond"
	Diamond:SetRGBFromTable( SWATCHES.robotHacking.normal, 0 )
	Diamond:SetAlpha( 0, 0 )
	Diamond:SetZRotation( 45, 0 )
	Diamond:SetBorderThicknessLeft( _1080p * 2, 0 )
	Diamond:SetBorderThicknessRight( _1080p * 2, 0 )
	Diamond:SetBorderThicknessTop( _1080p * 2, 0 )
	Diamond:SetBorderThicknessBottom( _1080p * 2, 0 )
	Diamond:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * 10, _1080p * -10, _1080p * 10, _1080p * -10 )
	self:addElement( Diamond )
	self.Diamond = Diamond
	
	local TopLeftSquare = nil
	
	TopLeftSquare = LUI.UIBorder.new( {
		borderThicknessLeft = _1080p * 2,
		borderThicknessRight = _1080p * 2,
		borderThicknessTop = _1080p * 2,
		borderThicknessBottom = _1080p * 2
	} )
	TopLeftSquare.id = "TopLeftSquare"
	TopLeftSquare:SetBorderThicknessLeft( _1080p * 2, 0 )
	TopLeftSquare:SetBorderThicknessRight( _1080p * 2, 0 )
	TopLeftSquare:SetBorderThicknessTop( _1080p * 2, 0 )
	TopLeftSquare:SetBorderThicknessBottom( _1080p * 2, 0 )
	TopLeftSquare:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -10, _1080p * -2, _1080p * -10, _1080p * -2 )
	self:addElement( TopLeftSquare )
	self.TopLeftSquare = TopLeftSquare
	
	local TopRightSquare = nil
	
	TopRightSquare = LUI.UIBorder.new( {
		borderThicknessLeft = _1080p * 2,
		borderThicknessRight = _1080p * 2,
		borderThicknessTop = _1080p * 2,
		borderThicknessBottom = _1080p * 2
	} )
	TopRightSquare.id = "TopRightSquare"
	TopRightSquare:SetBorderThicknessLeft( _1080p * 2, 0 )
	TopRightSquare:SetBorderThicknessRight( _1080p * 2, 0 )
	TopRightSquare:SetBorderThicknessTop( _1080p * 2, 0 )
	TopRightSquare:SetBorderThicknessBottom( _1080p * 2, 0 )
	TopRightSquare:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * 2, _1080p * 10, _1080p * -10, _1080p * -2 )
	self:addElement( TopRightSquare )
	self.TopRightSquare = TopRightSquare
	
	local BottomLeftSquare = nil
	
	BottomLeftSquare = LUI.UIBorder.new( {
		borderThicknessLeft = _1080p * 2,
		borderThicknessRight = _1080p * 2,
		borderThicknessTop = _1080p * 2,
		borderThicknessBottom = _1080p * 2
	} )
	BottomLeftSquare.id = "BottomLeftSquare"
	BottomLeftSquare:SetBorderThicknessLeft( _1080p * 2, 0 )
	BottomLeftSquare:SetBorderThicknessRight( _1080p * 2, 0 )
	BottomLeftSquare:SetBorderThicknessTop( _1080p * 2, 0 )
	BottomLeftSquare:SetBorderThicknessBottom( _1080p * 2, 0 )
	BottomLeftSquare:SetAnchorsAndPosition( 0, 1, 1, 0, _1080p * -10, _1080p * -2, _1080p * 2, _1080p * 10 )
	self:addElement( BottomLeftSquare )
	self.BottomLeftSquare = BottomLeftSquare
	
	local BottomRightSquare = nil
	
	BottomRightSquare = LUI.UIBorder.new( {
		borderThicknessLeft = _1080p * 2,
		borderThicknessRight = _1080p * 2,
		borderThicknessTop = _1080p * 2,
		borderThicknessBottom = _1080p * 2
	} )
	BottomRightSquare.id = "BottomRightSquare"
	BottomRightSquare:SetBorderThicknessLeft( _1080p * 2, 0 )
	BottomRightSquare:SetBorderThicknessRight( _1080p * 2, 0 )
	BottomRightSquare:SetBorderThicknessTop( _1080p * 2, 0 )
	BottomRightSquare:SetBorderThicknessBottom( _1080p * 2, 0 )
	BottomRightSquare:SetAnchorsAndPosition( 1, 0, 1, 0, _1080p * 2, _1080p * 10, _1080p * 2, _1080p * 10 )
	self:addElement( BottomRightSquare )
	self.BottomRightSquare = BottomRightSquare
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		Frame:RegisterAnimationSequence( "Searching", {
			{
				function ()
					return self.Frame:SetRGBFromTable( SWATCHES.robotHacking.normal, 0 )
				end
			},
			{
				function ()
					return self.Frame:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.Frame:SetScale( 0, 0 )
				end
			}
		} )
		Diamond:RegisterAnimationSequence( "Searching", {
			{
				function ()
					return self.Diamond:SetRGBFromTable( SWATCHES.robotHacking.normal, 0 )
				end
			},
			{
				function ()
					return self.Diamond:SetAlpha( 0, 0 )
				end
			}
		} )
		TopLeftSquare:RegisterAnimationSequence( "Searching", {
			{
				function ()
					return self.TopLeftSquare:SetRGBFromInt( 16777215, 0 )
				end
			},
			{
				function ()
					return self.TopLeftSquare:SetAlpha( 1, 0 )
				end
			}
		} )
		TopRightSquare:RegisterAnimationSequence( "Searching", {
			{
				function ()
					return self.TopRightSquare:SetRGBFromInt( 16777215, 0 )
				end
			},
			{
				function ()
					return self.TopRightSquare:SetAlpha( 1, 0 )
				end
			}
		} )
		BottomLeftSquare:RegisterAnimationSequence( "Searching", {
			{
				function ()
					return self.BottomLeftSquare:SetRGBFromInt( 16777215, 0 )
				end
			},
			{
				function ()
					return self.BottomLeftSquare:SetAlpha( 1, 0 )
				end
			}
		} )
		BottomRightSquare:RegisterAnimationSequence( "Searching", {
			{
				function ()
					return self.BottomRightSquare:SetRGBFromInt( 16777215, 0 )
				end
			},
			{
				function ()
					return self.BottomRightSquare:SetAlpha( 1, 0 )
				end
			}
		} )
		self._sequences.Searching = function ()
			Frame:AnimateSequence( "Searching" )
			Diamond:AnimateSequence( "Searching" )
			TopLeftSquare:AnimateSequence( "Searching" )
			TopRightSquare:AnimateSequence( "Searching" )
			BottomLeftSquare:AnimateSequence( "Searching" )
			BottomRightSquare:AnimateSequence( "Searching" )
		end
		
		Frame:RegisterAnimationSequence( "Connecting", {
			{
				function ()
					return self.Frame:SetRGBFromInt( 16777215, 0 )
				end,
				function ()
					return self.Frame:SetRGBFromInt( 15613731, 100 )
				end,
				function ()
					return self.Frame:SetRGBFromInt( 16777215, 100 )
				end
			},
			{
				function ()
					return self.Frame:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.Frame:SetScale( 0, 0 )
				end
			}
		} )
		Diamond:RegisterAnimationSequence( "Connecting", {
			{
				function ()
					return self.Diamond:SetRGBFromTable( SWATCHES.robotHacking.warning, 0 )
				end
			},
			{
				function ()
					return self.Diamond:SetAlpha( 0, 0 )
				end
			}
		} )
		TopLeftSquare:RegisterAnimationSequence( "Connecting", {
			{
				function ()
					return self.TopLeftSquare:SetRGBFromInt( 16777215, 0 )
				end,
				function ()
					return self.TopLeftSquare:SetRGBFromInt( 15613731, 100 )
				end,
				function ()
					return self.TopLeftSquare:SetRGBFromInt( 16777215, 100 )
				end
			}
		} )
		TopRightSquare:RegisterAnimationSequence( "Connecting", {
			{
				function ()
					return self.TopRightSquare:SetRGBFromInt( 16777215, 0 )
				end,
				function ()
					return self.TopRightSquare:SetRGBFromInt( 15613731, 100 )
				end,
				function ()
					return self.TopRightSquare:SetRGBFromInt( 16777215, 100 )
				end
			}
		} )
		BottomLeftSquare:RegisterAnimationSequence( "Connecting", {
			{
				function ()
					return self.BottomLeftSquare:SetRGBFromInt( 16777215, 0 )
				end,
				function ()
					return self.BottomLeftSquare:SetRGBFromInt( 15613731, 100 )
				end,
				function ()
					return self.BottomLeftSquare:SetRGBFromInt( 16777215, 100 )
				end
			}
		} )
		BottomRightSquare:RegisterAnimationSequence( "Connecting", {
			{
				function ()
					return self.BottomRightSquare:SetRGBFromInt( 16777215, 0 )
				end,
				function ()
					return self.BottomRightSquare:SetRGBFromInt( 15613731, 100 )
				end,
				function ()
					return self.BottomRightSquare:SetRGBFromInt( 16777215, 100 )
				end
			}
		} )
		self._sequences.Connecting = function ()
			Frame:AnimateLoop( "Connecting" )
			Diamond:AnimateLoop( "Connecting" )
			TopLeftSquare:AnimateLoop( "Connecting" )
			TopRightSquare:AnimateLoop( "Connecting" )
			BottomLeftSquare:AnimateLoop( "Connecting" )
			BottomRightSquare:AnimateLoop( "Connecting" )
		end
		
		Frame:RegisterAnimationSequence( "Locked", {
			{
				function ()
					return self.Frame:SetAlpha( 0, 100 )
				end,
				function ()
					return self.Frame:SetAlpha( 1, 200, LUI.EASING.outBack )
				end
			},
			{
				function ()
					return self.Frame:SetRGBFromTable( SWATCHES.robotHacking.warning, 100 )
				end
			},
			{
				function ()
					return self.Frame:SetScale( -0.25, 100 )
				end,
				function ()
					return self.Frame:SetScale( 0, 200, LUI.EASING.outBack )
				end
			}
		} )
		Diamond:RegisterAnimationSequence( "Locked", {
			{
				function ()
					return self.Diamond:SetAlpha( 0, 0 )
				end,
				function ()
					return self.Diamond:SetAlpha( 1, 200, LUI.EASING.outBack )
				end
			},
			{
				function ()
					return self.Diamond:SetRGBFromTable( SWATCHES.robotHacking.warning, 0 )
				end
			},
			{
				function ()
					return self.Diamond:SetScale( -0.25, 0 )
				end,
				function ()
					return self.Diamond:SetScale( 0, 200, LUI.EASING.outBack )
				end
			}
		} )
		TopLeftSquare:RegisterAnimationSequence( "Locked", {
			{
				function ()
					return self.TopLeftSquare:SetRGBFromInt( 15613731, 0 )
				end
			}
		} )
		TopRightSquare:RegisterAnimationSequence( "Locked", {
			{
				function ()
					return self.TopRightSquare:SetRGBFromInt( 15613731, 0 )
				end
			}
		} )
		BottomLeftSquare:RegisterAnimationSequence( "Locked", {
			{
				function ()
					return self.BottomLeftSquare:SetRGBFromInt( 15613731, 0 )
				end
			}
		} )
		BottomRightSquare:RegisterAnimationSequence( "Locked", {
			{
				function ()
					return self.BottomRightSquare:SetRGBFromInt( 15613731, 0 )
				end
			}
		} )
		self._sequences.Locked = function ()
			Frame:AnimateSequence( "Locked" )
			Diamond:AnimateSequence( "Locked" )
			TopLeftSquare:AnimateSequence( "Locked" )
			TopRightSquare:AnimateSequence( "Locked" )
			BottomLeftSquare:AnimateSequence( "Locked" )
			BottomRightSquare:AnimateSequence( "Locked" )
		end
		
		FrameAnim:RegisterAnimationSequence( "ConnectingPing", {
			{
				function ()
					return self.FrameAnim:SetAlpha( 1, 0 )
				end,
				function ()
					return self.FrameAnim:SetAlpha( 1, 150 )
				end,
				function ()
					return self.FrameAnim:SetAlpha( 0, 10 )
				end
			},
			{
				function ()
					return self.FrameAnim:SetScale( 0, 0 )
				end,
				function ()
					return self.FrameAnim:SetScale( -0.35, 150 )
				end,
				function ()
					return self.FrameAnim:SetScale( 0, 10 )
				end
			}
		} )
		self._sequences.ConnectingPing = function ()
			FrameAnim:AnimateSequence( "ConnectingPing" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	PostLoadFunc( self, f3_local1, controller )
	return self
end

MenuBuilder.registerType( "HackTargetingMarker", HackTargetingMarker )
LockTable( _M )
