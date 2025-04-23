local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function PostLoadFunc( f1_arg0, f1_arg1, f1_arg2 )
	f1_arg0:SetBlendMode( BLEND_MODE.addWithAlpha )
	local f1_local0 = DataSources.inGame.jackal
	local f1_local1 = function ()
		local f2_local0 = f1_local0.isThrusting:GetValue( f1_arg1 )
		local f2_local1 = f1_local0.isThrustRecharging:GetValue( f1_arg1 )
		local f2_local2 = f1_local0.boosterCharge:GetValue( f1_arg1 ) > 0
		local f2_local3 = f1_local0.atmoLaunch
		if f2_local3 then
			f2_local3 = f1_local0.atmoLaunch:GetValue( f1_arg1 )
		end
		if (f2_local0 or f2_local1) and not f2_local3 and not f2_local2 then
			ACTIONS.AnimateSequence( f1_arg0, "fadeOn" )
		else
			ACTIONS.AnimateSequence( f1_arg0, "fadeOff" )
		end
	end
	
	f1_local1()
	f1_arg0:SubscribeToModel( f1_local0.isThrusting:GetModel( f1_arg1 ), f1_local1, true )
	f1_arg0:SubscribeToModel( f1_local0.isThrustRecharging:GetModel( f1_arg1 ), f1_local1, true )
	f1_arg0.JackalThrusterRight:SubscribeToModel( DataSources.inGame.jackal.thrustPercent:GetModel( f1_arg1 ), function ()
		local f3_local0 = DataSources.inGame.jackal.thrustPercent:GetValue( f1_arg1 )
		if f3_local0 ~= nil then
			f1_arg0.JackalThrusterRight.Fill:SetLeft( _1080p * Add( Multiply( f3_local0, -300 ), 1 ), 0 )
			f1_arg0.JackalThrusterRight.FillIndicator:SetLeft( _1080p * Add( Multiply( f3_local0, -297 ), -8 ), 0 )
			f1_arg0.JackalThrusterRight.FillIndicator:SetRight( _1080p * Add( Multiply( f3_local0, -297 ), 8 ), 0 )
			f1_arg0.JackalThrusterLeft.Fill:SetRight( _1080p * Subtract( Multiply( f3_local0, 300 ), 1 ), 0 )
			f1_arg0.JackalThrusterLeft.FillIndicator:SetLeft( _1080p * Subtract( Multiply( f3_local0, 297 ), 8 ), 0 )
			f1_arg0.JackalThrusterLeft.FillIndicator:SetRight( _1080p * Add( Multiply( f3_local0, 297 ), 8 ), 0 )
		end
	end )
end

function JackalThrusters( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 1920 * _1080p, 0, 1080 * _1080p )
	self.id = "JackalThrusters"
	self._animationSets = {}
	self._sequences = {}
	local f4_local1 = controller and controller.controllerIndex
	if not f4_local1 and not Engine.InFrontend() then
		f4_local1 = self:getRootController()
	end
	assert( f4_local1 )
	local f4_local2 = self
	local JackalThrusterRight = nil
	
	JackalThrusterRight = MenuBuilder.BuildRegisteredType( "JackalThruster", {
		controllerIndex = f4_local1
	} )
	JackalThrusterRight.id = "JackalThrusterRight"
	JackalThrusterRight:SetYRotation( -50, 0 )
	JackalThrusterRight.Fill:SetAnchors( 1, 0, 0, 0, 0 )
	JackalThrusterRight.Fill:SetLeft( _1080p * Add( Multiply( 0, -300 ), 1 ), 0 )
	JackalThrusterRight.Fill:SetRight( _1080p * -1, 0 )
	JackalThrusterRight.FillIndicator:SetAnchors( 1, 0, 0, 0, 0 )
	JackalThrusterRight.FillIndicator:SetLeft( _1080p * Add( Multiply( -8, -297 ), -8 ), 0 )
	JackalThrusterRight.FillIndicator:SetRight( _1080p * Add( Multiply( 10, -297 ), 8 ), 0 )
	JackalThrusterRight.LeftSquare:SetAlpha( 0, 0 )
	JackalThrusterRight:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -450, _1080p * -150, _1080p * 250, _1080p * 260 )
	self:addElement( JackalThrusterRight )
	self.JackalThrusterRight = JackalThrusterRight
	
	local JackalThrusterLeft = nil
	
	JackalThrusterLeft = MenuBuilder.BuildRegisteredType( "JackalThruster", {
		controllerIndex = f4_local1
	} )
	JackalThrusterLeft.id = "JackalThrusterLeft"
	JackalThrusterLeft:SetYRotation( 50, 0 )
	JackalThrusterLeft.Fill:SetAnchors( 0, 1, 0, 0, 0 )
	JackalThrusterLeft.Fill:SetLeft( _1080p * 1, 0 )
	JackalThrusterLeft.Fill:SetRight( _1080p * Subtract( Multiply( 0, 300 ), 1 ), 0 )
	JackalThrusterLeft.FillIndicator:SetAnchors( 0, 1, 0, 0, 0 )
	JackalThrusterLeft.FillIndicator:SetLeft( _1080p * Subtract( Multiply( -8, 297 ), 8 ), 0 )
	JackalThrusterLeft.FillIndicator:SetRight( _1080p * Add( Multiply( 10, 297 ), 8 ), 0 )
	JackalThrusterLeft.RightSquare:SetAlpha( 0, 0 )
	JackalThrusterLeft:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 150, _1080p * 450, _1080p * 250, _1080p * 260 )
	self:addElement( JackalThrusterLeft )
	self.JackalThrusterLeft = JackalThrusterLeft
	
	local JackalThrusterLabelRight = nil
	
	JackalThrusterLabelRight = LUI.UIText.new()
	JackalThrusterLabelRight.id = "JackalThrusterLabelRight"
	JackalThrusterLabelRight:SetYRotation( -50, 0 )
	JackalThrusterLabelRight:SetFontSize( 16 * _1080p )
	JackalThrusterLabelRight:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	JackalThrusterLabelRight:SetAlignment( LUI.Alignment.Right )
	JackalThrusterLabelRight:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -600, _1080p * -150, _1080p * 275, _1080p * 291 )
	JackalThrusterLabelRight:BindColorToModel( DataSources.inGame.jackal.thrustLabelColor:GetModel( f4_local1 ) )
	JackalThrusterLabelRight:SubscribeToModel( DataSources.inGame.jackal.thrustLabelText:GetModel( f4_local1 ), function ()
		local f5_local0 = DataSources.inGame.jackal.thrustLabelText:GetValue( f4_local1 )
		if f5_local0 ~= nil then
			JackalThrusterLabelRight:setText( ToUpperCase( f5_local0 ), 0 )
		end
	end )
	self:addElement( JackalThrusterLabelRight )
	self.JackalThrusterLabelRight = JackalThrusterLabelRight
	
	local JackalThrusterLabelLeft = nil
	
	JackalThrusterLabelLeft = LUI.UIText.new()
	JackalThrusterLabelLeft.id = "JackalThrusterLabelLeft"
	JackalThrusterLabelLeft:SetYRotation( 50, 0 )
	JackalThrusterLabelLeft:SetFontSize( 16 * _1080p )
	JackalThrusterLabelLeft:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	JackalThrusterLabelLeft:SetAlignment( LUI.Alignment.Left )
	JackalThrusterLabelLeft:SetOptOutRightToLeftAlignmentFlip( true )
	JackalThrusterLabelLeft:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 150, _1080p * 600, _1080p * 275, _1080p * 291 )
	JackalThrusterLabelLeft:BindColorToModel( DataSources.inGame.jackal.thrustLabelColor:GetModel( f4_local1 ) )
	JackalThrusterLabelLeft:SubscribeToModel( DataSources.inGame.jackal.thrustLabelText:GetModel( f4_local1 ), function ()
		local f6_local0 = DataSources.inGame.jackal.thrustLabelText:GetValue( f4_local1 )
		if f6_local0 ~= nil then
			JackalThrusterLabelLeft:setText( ToUpperCase( f6_local0 ), 0 )
		end
	end )
	self:addElement( JackalThrusterLabelLeft )
	self.JackalThrusterLabelLeft = JackalThrusterLabelLeft
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		JackalThrusterRight:RegisterAnimationSequence( "fadeOff", {
			{
				function ()
					return self.JackalThrusterRight:SetAlpha( 0, 150 )
				end
			},
			{
				function ()
					return self.JackalThrusterRight:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -350, _1080p * -50, _1080p * 250, _1080p * 260, 150 )
				end
			}
		} )
		JackalThrusterLeft:RegisterAnimationSequence( "fadeOff", {
			{
				function ()
					return self.JackalThrusterLeft:SetAlpha( 0, 150 )
				end
			},
			{
				function ()
					return self.JackalThrusterLeft:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 50, _1080p * 350, _1080p * 250, _1080p * 260, 150 )
				end
			}
		} )
		JackalThrusterLabelRight:RegisterAnimationSequence( "fadeOff", {
			{
				function ()
					return self.JackalThrusterLabelRight:SetAlpha( 0, 150 )
				end
			},
			{
				function ()
					return self.JackalThrusterLabelRight:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -500, _1080p * -50, _1080p * 275, _1080p * 291, 150 )
				end
			}
		} )
		JackalThrusterLabelLeft:RegisterAnimationSequence( "fadeOff", {
			{
				function ()
					return self.JackalThrusterLabelLeft:SetAlpha( 0, 150 )
				end
			},
			{
				function ()
					return self.JackalThrusterLabelLeft:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 50, _1080p * 500, _1080p * 275, _1080p * 291, 150 )
				end
			}
		} )
		self._sequences.fadeOff = function ()
			JackalThrusterRight:AnimateSequence( "fadeOff" )
			JackalThrusterLeft:AnimateSequence( "fadeOff" )
			JackalThrusterLabelRight:AnimateSequence( "fadeOff" )
			JackalThrusterLabelLeft:AnimateSequence( "fadeOff" )
		end
		
		JackalThrusterRight:RegisterAnimationSequence( "fadeOn", {
			{
				function ()
					return self.JackalThrusterRight:SetAlpha( 1, 150 )
				end
			},
			{
				function ()
					return self.JackalThrusterRight:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -450, _1080p * -150, _1080p * 250, _1080p * 260, 150 )
				end
			}
		} )
		JackalThrusterLeft:RegisterAnimationSequence( "fadeOn", {
			{
				function ()
					return self.JackalThrusterLeft:SetAlpha( 1, 150 )
				end
			},
			{
				function ()
					return self.JackalThrusterLeft:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 150, _1080p * 450, _1080p * 250, _1080p * 260, 150 )
				end
			}
		} )
		JackalThrusterLabelRight:RegisterAnimationSequence( "fadeOn", {
			{
				function ()
					return self.JackalThrusterLabelRight:SetAlpha( 1, 150 )
				end
			},
			{
				function ()
					return self.JackalThrusterLabelRight:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -600, _1080p * -150, _1080p * 275, _1080p * 291, 150 )
				end
			}
		} )
		JackalThrusterLabelLeft:RegisterAnimationSequence( "fadeOn", {
			{
				function ()
					return self.JackalThrusterLabelLeft:SetAlpha( 1, 150 )
				end
			},
			{
				function ()
					return self.JackalThrusterLabelLeft:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 150, _1080p * 600, _1080p * 275, _1080p * 291, 150 )
				end
			}
		} )
		self._sequences.fadeOn = function ()
			JackalThrusterRight:AnimateSequence( "fadeOn" )
			JackalThrusterLeft:AnimateSequence( "fadeOn" )
			JackalThrusterLabelRight:AnimateSequence( "fadeOn" )
			JackalThrusterLabelLeft:AnimateSequence( "fadeOn" )
		end
		
		JackalThrusterRight:RegisterAnimationSequence( "hide", {
			{
				function ()
					return self.JackalThrusterRight:SetAlpha( 0, 0 )
				end
			}
		} )
		JackalThrusterLeft:RegisterAnimationSequence( "hide", {
			{
				function ()
					return self.JackalThrusterLeft:SetAlpha( 0, 0 )
				end
			}
		} )
		JackalThrusterLabelRight:RegisterAnimationSequence( "hide", {
			{
				function ()
					return self.JackalThrusterLabelRight:SetAlpha( 0, 0 )
				end
			}
		} )
		JackalThrusterLabelLeft:RegisterAnimationSequence( "hide", {
			{
				function ()
					return self.JackalThrusterLabelLeft:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.hide = function ()
			JackalThrusterRight:AnimateSequence( "hide" )
			JackalThrusterLeft:AnimateSequence( "hide" )
			JackalThrusterLabelRight:AnimateSequence( "hide" )
			JackalThrusterLabelLeft:AnimateSequence( "hide" )
		end
		
		JackalThrusterRight:RegisterAnimationSequence( "show", {
			{
				function ()
					return self.JackalThrusterRight:SetAlpha( 1, 0 )
				end
			}
		} )
		JackalThrusterLeft:RegisterAnimationSequence( "show", {
			{
				function ()
					return self.JackalThrusterLeft:SetAlpha( 1, 0 )
				end
			}
		} )
		JackalThrusterLabelRight:RegisterAnimationSequence( "show", {
			{
				function ()
					return self.JackalThrusterLabelRight:SetAlpha( 1, 0 )
				end
			}
		} )
		JackalThrusterLabelLeft:RegisterAnimationSequence( "show", {
			{
				function ()
					return self.JackalThrusterLabelLeft:SetAlpha( 1, 0 )
				end
			}
		} )
		self._sequences.show = function ()
			JackalThrusterRight:AnimateSequence( "show" )
			JackalThrusterLeft:AnimateSequence( "show" )
			JackalThrusterLabelRight:AnimateSequence( "show" )
			JackalThrusterLabelLeft:AnimateSequence( "show" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	JackalThrusterLabelLeft:SubscribeToModel( DataSources.inGame.jackal.isThrusting:GetModel( f4_local1 ), function ()
		ACTIONS.SetText( self.JackalThrusterLabelLeft, "" )
	end )
	self:addEventHandler( "menu_create", function ( f38_arg0, f38_arg1 )
		local f38_local0 = f38_arg1.controller or f4_local1
		ACTIONS.AnimateSequence( self, "hide" )
	end )
	PostLoadFunc( self, f4_local1, controller )
	return self
end

MenuBuilder.registerType( "JackalThrusters", JackalThrusters )
LockTable( _M )
