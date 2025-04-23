local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function PostLoadFunc( f1_arg0, f1_arg1, f1_arg2 )
	f1_arg0.soundSet = "jackal"
	f1_arg0.Fill:RegisterAnimationSequence( "Low", {
		{
			function ()
				return f1_arg0.Fill:SetAlpha( 0, 100 )
			end,
			function ()
				return f1_arg0.Fill:SetAlpha( 1, 100 )
			end
		}
	} )
	f1_arg0._sequences.Low = function ()
		f1_arg0.Fill:AnimateLoop( "Low" )
	end
	
	f1_arg0:SubscribeToModel( DataSources.inGame.jackal.thrustersBelowThreshold:GetModel( f1_arg1 ), function ()
		local f5_local0 = function ( f6_arg0, f6_arg1 )
			local f6_local0 = f6_arg1.controller or controller
			if DataSources.inGame.jackal.thrustersBelowThreshold:GetValue( f1_arg1 ) ~= nil and DataSources.inGame.jackal.thrustersBelowThreshold:GetValue( f1_arg1 ) == true then
				ACTIONS.AnimateSequence( f1_arg0, "Low" )
			end
			if DataSources.inGame.jackal.thrustersBelowThreshold:GetValue( f1_arg1 ) ~= nil and DataSources.inGame.jackal.thrustersBelowThreshold:GetValue( f1_arg1 ) == false then
				ACTIONS.AnimateSequence( f1_arg0, "thrustersStable" )
			end
		end
		
		f5_local0( f1_arg0, {
			name = "datasource_event"
		} )
	end )
end

function JackalThruster( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 376 * _1080p, 0, 10 * _1080p )
	self.id = "JackalThruster"
	self._animationSets = {}
	self._sequences = {}
	local f7_local1 = controller and controller.controllerIndex
	if not f7_local1 and not Engine.InFrontend() then
		f7_local1 = self:getRootController()
	end
	assert( f7_local1 )
	local f7_local2 = self
	local Line = nil
	
	Line = LUI.UIImage.new()
	Line.id = "Line"
	Line:SetRGBFromTable( SWATCHES.jackal.stable, 0 )
	Line:SetAlpha( 0.5, 0 )
	Line:setImage( RegisterMaterial( "hud_jackal_thruster_line" ), 0 )
	Line:SetUseAA( true )
	Line:SetAnchorsAndPosition( 0, 0, 0.5, 0.5, 0, 0, _1080p * -8, _1080p * 8 )
	self:addElement( Line )
	self.Line = Line
	
	local Fill = nil
	
	Fill = LUI.UIImage.new()
	Fill.id = "Fill"
	Fill:SetUseAA( true )
	Fill:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, _1080p * 2, _1080p * -2 )
	Fill:BindColorToModel( DataSources.inGame.jackal.thrustFillColor:GetModel( f7_local1 ) )
	self:addElement( Fill )
	self.Fill = Fill
	
	local FillIndicator = nil
	
	FillIndicator = MenuBuilder.BuildRegisteredType( "FillIndicator", {
		controllerIndex = f7_local1
	} )
	FillIndicator.id = "FillIndicator"
	FillIndicator.ammoBarNode:SetLeft( _1080p * 6, 0 )
	FillIndicator.ammoBarNode:SetRight( _1080p * 10, 0 )
	FillIndicator.ammoBarNode:SetTop( _1080p * -6, 0 )
	FillIndicator:SetAnchorsAndPosition( 0, 1, 0, 0, _1080p * -5, _1080p * 11, _1080p * -14, _1080p * -2 )
	self:addElement( FillIndicator )
	self.FillIndicator = FillIndicator
	
	local RightSquare = nil
	
	RightSquare = LUI.UIImage.new()
	RightSquare.id = "RightSquare"
	RightSquare:SetRGBFromTable( SWATCHES.jackal.stable, 0 )
	RightSquare:setImage( RegisterMaterial( "hud_jackal_strike_reticule_piece_center_square_sm" ), 0 )
	RightSquare:SetUseAA( true )
	RightSquare:SetAnchorsAndPosition( 1, 0, 0.5, 0.5, _1080p * 10, _1080p * 20, _1080p * -5, _1080p * 5 )
	self:addElement( RightSquare )
	self.RightSquare = RightSquare
	
	local LeftSquare = nil
	
	LeftSquare = LUI.UIImage.new()
	LeftSquare.id = "LeftSquare"
	LeftSquare:SetRGBFromTable( SWATCHES.jackal.stable, 0 )
	LeftSquare:setImage( RegisterMaterial( "hud_jackal_strike_reticule_piece_center_square_sm" ), 0 )
	LeftSquare:SetAnchorsAndPosition( 0, 1, 0.5, 0.5, _1080p * -20, _1080p * -10, _1080p * -5, _1080p * 5 )
	self:addElement( LeftSquare )
	self.LeftSquare = LeftSquare
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		Fill:RegisterAnimationSequence( "thrustersStable", {
			{
				function ()
					return self.Fill:SetAlpha( 1, 0 )
				end
			}
		} )
		self._sequences.thrustersStable = function ()
			Fill:AnimateSequence( "thrustersStable" )
		end
		
		Fill:RegisterAnimationSequence( "thrustersLow", {
			{
				function ()
					return self.Fill:SetAlpha( 1, 0 )
				end,
				function ()
					return self.Fill:SetAlpha( 0, 50 )
				end,
				function ()
					return self.Fill:SetAlpha( 1, 50 )
				end
			}
		} )
		self._sequences.thrustersLow = function ()
			Fill:AnimateLoop( "thrustersLow" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	PostLoadFunc( self, f7_local1, controller )
	return self
end

MenuBuilder.registerType( "JackalThruster", JackalThruster )
LockTable( _M )
