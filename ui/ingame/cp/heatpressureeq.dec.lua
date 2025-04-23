local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function PostLoadFunc( f1_arg0, f1_arg1 )
	f1_arg0:SetupInWorldElement( {} )
	f1_arg0:SetInWorldScale( 0.1 )
	local f1_local0 = function ( f2_arg0, f2_arg1 )
		f2_arg0:SetEntityNum( Game.GetOmnvar( "zm_ui_reaction_equation_ent" ) )
		f2_arg0:SetEntityTag( "tag_origin" )
		f2_arg0:SetFollowTagAngles( true )
		f2_arg0:SetTagSpacePosition( -5, -13, 1 )
		f2_arg0:SetTagSpaceYaw( -90 )
		f2_arg0:SetTagSpaceRoll( -90 )
	end
	
	f1_arg0:registerOmnvarHandler( "zm_ui_reaction_equation_ent", f1_local0 )
	f1_local0( f1_arg0, {} )
end

function heatPressureEq( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 400 * _1080p, 0, 400 * _1080p )
	self.id = "heatPressureEq"
	self._animationSets = {}
	self._sequences = {}
	local f3_local1 = controller and controller.controllerIndex
	if not f3_local1 and not Engine.InFrontend() then
		f3_local1 = self:getRootController()
	end
	assert( f3_local1 )
	local f3_local2 = self
	local colorSquaresBaseBlue = nil
	
	colorSquaresBaseBlue = MenuBuilder.BuildRegisteredType( "colorSquaresBase", {
		controllerIndex = f3_local1
	} )
	colorSquaresBaseBlue.id = "colorSquaresBaseBlue"
	colorSquaresBaseBlue:SetAlpha( 0, 0 )
	colorSquaresBaseBlue:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 26, _1080p * 226, _1080p * 119.63, _1080p * 319.63 )
	self:addElement( colorSquaresBaseBlue )
	self.colorSquaresBaseBlue = colorSquaresBaseBlue
	
	local colorSquaresBaseRed = nil
	
	colorSquaresBaseRed = MenuBuilder.BuildRegisteredType( "colorSquaresBase", {
		controllerIndex = f3_local1
	} )
	colorSquaresBaseRed.id = "colorSquaresBaseRed"
	colorSquaresBaseRed:SetAlpha( 0, 0 )
	colorSquaresBaseRed:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -139, _1080p * 61, _1080p * 119.63, _1080p * 319.63 )
	self:addElement( colorSquaresBaseRed )
	self.colorSquaresBaseRed = colorSquaresBaseRed
	
	local icon = nil
	
	icon = LUI.UIImage.new()
	icon.id = "icon"
	icon:setImage( RegisterMaterial( "cp_town_chem_diamond_symbol" ), 0 )
	icon:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 213, _1080p * 341, _1080p * 156, _1080p * 284 )
	self:addElement( icon )
	self.icon = icon
	
	local sumA = nil
	
	sumA = LUI.UIImage.new()
	sumA.id = "sumA"
	sumA:setImage( RegisterMaterial( "cp_town_chem_sum_a" ), 0 )
	sumA:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -104, _1080p * 24, _1080p * 149.63, _1080p * 277.63 )
	self:addElement( sumA )
	self.sumA = sumA
	
	local sumB = nil
	
	sumB = LUI.UIImage.new()
	sumB.id = "sumB"
	sumB:setImage( RegisterMaterial( "cp_town_chem_sum_b" ), 0 )
	sumB:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 61, _1080p * 189, _1080p * 150, _1080p * 278 )
	self:addElement( sumB )
	self.sumB = sumB
	
	local results = nil
	
	results = LUI.UIImage.new()
	results.id = "results"
	results:setImage( RegisterMaterial( "cp_town_chem_sum_results" ), 0 )
	results:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 386, _1080p * 514, _1080p * 150, _1080p * 278 )
	self:addElement( results )
	self.results = results
	
	local equalTop = nil
	
	equalTop = LUI.UIImage.new()
	equalTop.id = "equalTop"
	equalTop:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 333.09, _1080p * 366, _1080p * 213.63, _1080p * 218.63 )
	self:addElement( equalTop )
	self.equalTop = equalTop
	
	local equalBottom = nil
	
	equalBottom = LUI.UIImage.new()
	equalBottom.id = "equalBottom"
	equalBottom:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 333.09, _1080p * 366, _1080p * 225.63, _1080p * 230.63 )
	self:addElement( equalBottom )
	self.equalBottom = equalBottom
	
	local minus = nil
	
	minus = LUI.UIImage.new()
	minus.id = "minus"
	minus:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 203.09, _1080p * 226, _1080p * 216.13, _1080p * 221.13 )
	self:addElement( minus )
	self.minus = minus
	
	local plus1 = nil
	
	plus1 = LUI.UIImage.new()
	plus1.id = "plus1"
	plus1:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 33.09, _1080p * 56, _1080p * 218.63, _1080p * 223.63 )
	self:addElement( plus1 )
	self.plus1 = plus1
	
	local plusVert = nil
	
	plusVert = LUI.UIImage.new()
	plusVert.id = "plusVert"
	plusVert:SetZRotation( 90, 0 )
	plusVert:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 33.09, _1080p * 56, _1080p * 218.63, _1080p * 223.63 )
	self:addElement( plusVert )
	self.plusVert = plusVert
	
	self._animationSets.DefaultAnimationSet = function ()
		colorSquaresBaseBlue:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.colorSquaresBaseBlue.blue:SetAlpha( 0, 0 )
				end
			},
			{
				function ()
					return self.colorSquaresBaseBlue.white:SetAlpha( 0, 0 )
				end
			},
			{
				function ()
					return self.colorSquaresBaseBlue.red:SetAlpha( 0, 0 )
				end
			},
			{
				function ()
					return self.colorSquaresBaseBlue.yellow:SetAlpha( 0, 0 )
				end
			},
			{
				function ()
					return self.colorSquaresBaseBlue.line:SetAlpha( 0, 0 )
				end
			},
			{
				function ()
					return self.colorSquaresBaseBlue.line2:SetAlpha( 0, 0 )
				end
			}
		} )
		colorSquaresBaseRed:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.colorSquaresBaseRed.blue:SetAlpha( 0, 0 )
				end
			},
			{
				function ()
					return self.colorSquaresBaseRed.white:SetAlpha( 0, 0 )
				end
			},
			{
				function ()
					return self.colorSquaresBaseRed.red:SetAlpha( 0, 0 )
				end
			},
			{
				function ()
					return self.colorSquaresBaseRed.yellow:SetAlpha( 0, 0 )
				end
			},
			{
				function ()
					return self.colorSquaresBaseRed.line:SetAlpha( 0, 0 )
				end
			},
			{
				function ()
					return self.colorSquaresBaseRed.line2:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.DefaultSequence = function ()
			colorSquaresBaseBlue:AnimateSequence( "DefaultSequence" )
			colorSquaresBaseRed:AnimateSequence( "DefaultSequence" )
		end
		
		colorSquaresBaseBlue:RegisterAnimationSequence( "redBoxOn", {
			{
				function ()
					return self.colorSquaresBaseBlue.blue:SetAlpha( 0, 0 )
				end
			},
			{
				function ()
					return self.colorSquaresBaseBlue.white:SetAlpha( 0, 0 )
				end
			},
			{
				function ()
					return self.colorSquaresBaseBlue.red:SetAlpha( 0, 0 )
				end
			},
			{
				function ()
					return self.colorSquaresBaseBlue.yellow:SetAlpha( 0, 0 )
				end
			},
			{
				function ()
					return self.colorSquaresBaseBlue.line:SetAlpha( 0, 0 )
				end
			},
			{
				function ()
					return self.colorSquaresBaseBlue.line2:SetAlpha( 0, 0 )
				end
			}
		} )
		colorSquaresBaseRed:RegisterAnimationSequence( "redBoxOn", {
			{
				function ()
					return self.colorSquaresBaseRed:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.colorSquaresBaseRed.red:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.colorSquaresBaseRed.yellow:SetAlpha( 0.01, 0 )
				end
			},
			{
				function ()
					return self.colorSquaresBaseRed.white:SetAlpha( 0.01, 0 )
				end
			},
			{
				function ()
					return self.colorSquaresBaseRed.blue:SetAlpha( 0.01, 0 )
				end
			},
			{
				function ()
					return self.colorSquaresBaseRed.line:SetAlpha( 0.99, 0 )
				end
			},
			{
				function ()
					return self.colorSquaresBaseRed.line2:SetAlpha( 0.99, 0 )
				end
			},
			{
				function ()
					return self.colorSquaresBaseRed.red:SetRGBFromInt( 16711683, 0 )
				end
			}
		} )
		self._sequences.redBoxOn = function ()
			colorSquaresBaseBlue:AnimateSequence( "redBoxOn" )
			colorSquaresBaseRed:AnimateSequence( "redBoxOn" )
		end
		
		colorSquaresBaseBlue:RegisterAnimationSequence( "blueBoxOn", {
			{
				function ()
					return self.colorSquaresBaseBlue.red:SetAlpha( 0.05, 0 )
				end
			},
			{
				function ()
					return self.colorSquaresBaseBlue.yellow:SetAlpha( 0.05, 0 )
				end
			},
			{
				function ()
					return self.colorSquaresBaseBlue.white:SetAlpha( 0.05, 0 )
				end
			},
			{
				function ()
					return self.colorSquaresBaseBlue:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.colorSquaresBaseBlue.blue:SetAlpha( 0.5, 0 )
				end
			},
			{
				function ()
					return self.colorSquaresBaseBlue.line:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.colorSquaresBaseBlue.line2:SetAlpha( 1, 0 )
				end
			}
		} )
		colorSquaresBaseRed:RegisterAnimationSequence( "blueBoxOn", {
			{
				function ()
					return self.colorSquaresBaseRed.blue:SetAlpha( 0, 0 )
				end
			},
			{
				function ()
					return self.colorSquaresBaseRed.white:SetAlpha( 0, 0 )
				end
			},
			{
				function ()
					return self.colorSquaresBaseRed.red:SetAlpha( 0, 0 )
				end
			},
			{
				function ()
					return self.colorSquaresBaseRed.yellow:SetAlpha( 0, 0 )
				end
			},
			{
				function ()
					return self.colorSquaresBaseRed.line:SetAlpha( 0, 0 )
				end
			},
			{
				function ()
					return self.colorSquaresBaseRed.line2:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.blueBoxOn = function ()
			colorSquaresBaseBlue:AnimateSequence( "blueBoxOn" )
			colorSquaresBaseRed:AnimateSequence( "blueBoxOn" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	self:SubscribeToModel( DataSources.inGame.CP.zombies.dlc3.currentColor:GetModel( f3_local1 ), function ()
		if DataSources.inGame.CP.zombies.dlc3.currentColor:GetValue( f3_local1 ) ~= nil and DataSources.inGame.CP.zombies.dlc3.currentColor:GetValue( f3_local1 ) == 0 then
			ACTIONS.AnimateSequence( self, "DefaultSequence" )
		end
		if DataSources.inGame.CP.zombies.dlc3.currentColor:GetValue( f3_local1 ) ~= nil and DataSources.inGame.CP.zombies.dlc3.currentColor:GetValue( f3_local1 ) == 1 then
			ACTIONS.AnimateSequence( self, "redBoxOn" )
		end
		if DataSources.inGame.CP.zombies.dlc3.currentColor:GetValue( f3_local1 ) ~= nil and DataSources.inGame.CP.zombies.dlc3.currentColor:GetValue( f3_local1 ) == 3 then
			ACTIONS.AnimateSequence( self, "blueBoxOn" )
		end
		if DataSources.inGame.CP.zombies.dlc3.currentColor:GetValue( f3_local1 ) ~= nil and DataSources.inGame.CP.zombies.dlc3.currentColor:GetValue( f3_local1 ) == 2 then
			ACTIONS.AnimateSequence( self, "DefaultSequence" )
		end
	end )
	PostLoadFunc( self, f3_local1, controller )
	ACTIONS.AnimateSequence( self, "DefaultSequence" )
	return self
end

MenuBuilder.registerType( "heatPressureEq", heatPressureEq )
LockTable( _M )
