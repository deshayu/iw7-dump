local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ( f1_arg0, f1_arg1 )
	f1_arg0:SetAlpha( f1_arg1.alpha )
	f1_arg0.Minimap:ChangeMinimapOptions( f1_arg1.minimapOptions )
	f1_arg0.Compass:SetAlpha( f1_arg1.showExtras )
	f1_arg0.MinimapAreaLabel:SetAlpha( f1_arg1.showExtras )
	f1_arg0.Name.Field:setText( ToUpperCase( DataSources.inGame.mapName:GetValue( f1_arg0.controllerIndex ) ) )
	ACTIONS.AnimateSequence( f1_arg0, f1_arg1.mapType )
	if f1_arg1.minimapOptions.cropPartialMap then
		local f1_local0 = Engine.GetDvarString( "ui_mapname" )
		local f1_local1 = Engine.TableLookup( CSV.mpMapTable.file, CSV.mpMapTable.cols.ref, f1_local0, CSV.mpMapTable.cols.minimapHeightForCroppedMode )
		local f1_local2 = Engine.TableLookup( CSV.mpMapTable.file, CSV.mpMapTable.cols.ref, f1_local0, CSV.mpMapTable.cols.minimapWidthForCroppedMode )
		local f1_local3 = 54
		local f1_local4 = 105
		if f1_local1 ~= "" then
			f1_arg0.Minimap:SetTop( _1080p * f1_local4 )
			f1_arg0.Minimap:SetBottom( _1080p * (f1_local4 + f1_local1) )
		end
		if f1_local2 ~= "" then
			f1_arg0.Minimap:SetLeft( _1080p * f1_local3 )
			f1_arg0.Minimap:SetRight( _1080p * (f1_local3 + f1_local2) )
		end
	end
end

f0_local1 = function ( f2_arg0, f2_arg1, f2_arg2 )
	f2_arg0.controllerIndex = f2_arg1
	f2_arg0.UpdateSettings = f0_local0
end

function CodcasterMinimap( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 1920 * _1080p, 0, 1080 * _1080p )
	self.id = "CodcasterMinimap"
	self._animationSets = {}
	self._sequences = {}
	local f3_local1 = controller and controller.controllerIndex
	if not f3_local1 and not Engine.InFrontend() then
		f3_local1 = self:getRootController()
	end
	assert( f3_local1 )
	local f3_local2 = self
	local Blur = nil
	
	Blur = LUI.UIBlur.new()
	Blur.id = "Blur"
	Blur:SetAlpha( 0.8, 0 )
	Blur:SetUseAA( true )
	Blur:SetBlurStrength( 0.75, 0 )
	Blur:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 54, _1080p * 596, _1080p * 54, _1080p * 366.5 )
	self:addElement( Blur )
	self.Blur = Blur
	
	local Background = nil
	
	Background = LUI.UIImage.new()
	Background.id = "Background"
	Background:SetAlpha( 0.4, 0 )
	Background:SetDepth( 10, 0 )
	Background:setImage( RegisterMaterial( "hud_minimap_background" ), 0 )
	Background:SetUseAA( true )
	Background:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 652.5, _1080p * -5, _1080p * 427.19 )
	self:addElement( Background )
	self.Background = Background
	
	local f3_local5 = nil
	if Engine.IsMultiplayer() and not Engine.IsAliensMode() then
		f3_local5 = MenuBuilder.BuildRegisteredType( "MinimapContent", {
			mapAlpha = 0.8,
			compassType = CoD.CompassType.Full,
			controllerIndex = f3_local1
		} )
		f3_local5.id = "Minimap"
		f3_local5:SetAlpha( 0.6, 0 )
		f3_local5:SetUMin( 0.1, 0 )
		f3_local5:SetUMax( 0.9, 0 )
		f3_local5:SetVMin( 0.1, 0 )
		f3_local5:SetVMax( 0.9, 0 )
		f3_local5:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 54, _1080p * 596, _1080p * 86, _1080p * 366.5 )
		self:addElement( f3_local5 )
		self.Minimap = f3_local5
	end
	local MinimapAreaLabel = nil
	
	MinimapAreaLabel = MenuBuilder.BuildRegisteredType( "MinimapAreaLabel", {
		controllerIndex = f3_local1
	} )
	MinimapAreaLabel.id = "MinimapAreaLabel"
	MinimapAreaLabel:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 54, _1080p * 596, _1080p * 371.73, _1080p * 391.73 )
	self:addElement( MinimapAreaLabel )
	self.MinimapAreaLabel = MinimapAreaLabel
	
	local CompassBG = nil
	
	CompassBG = LUI.UIImage.new()
	CompassBG.id = "CompassBG"
	CompassBG:SetRGBFromInt( 0, 0 )
	CompassBG:SetAlpha( 0.5, 0 )
	CompassBG:setImage( RegisterMaterial( "widg_gradient_top_to_bottom" ), 0 )
	CompassBG:SetUseAA( true )
	CompassBG:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 54, _1080p * 596, _1080p * 86, _1080p * 118.79 )
	self:addElement( CompassBG )
	self.CompassBG = CompassBG
	
	local Compass = nil
	
	Compass = MenuBuilder.BuildRegisteredType( "Compass", {
		stretch = 0.85,
		controllerIndex = f3_local1
	} )
	Compass.id = "Compass"
	Compass:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 54, _1080p * 596, _1080p * 87.17, _1080p * 103.54 )
	self:addElement( Compass )
	self.Compass = Compass
	
	local Line = nil
	
	Line = LUI.UIImage.new()
	Line.id = "Line"
	Line:SetAlpha( 0.7, 0 )
	Line:SetUseAA( true )
	Line:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 54, _1080p * 596, _1080p * 104.29, _1080p * 105.29 )
	self:addElement( Line )
	self.Line = Line
	
	local Header = nil
	
	Header = LUI.UIImage.new()
	Header.id = "Header"
	Header:SetAlpha( 0.7, 0 )
	Header:setImage( RegisterMaterial( "codcaster_playerlist_header" ), 0 )
	Header:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 54, _1080p * 596, _1080p * 54, _1080p * 86 )
	self:addElement( Header )
	self.Header = Header
	
	local BorderLeft = nil
	
	BorderLeft = LUI.UIBorder.new( {
		borderThicknessLeft = _1080p * 1,
		borderThicknessRight = _1080p * 1,
		borderThicknessTop = _1080p * 1,
		borderThicknessBottom = _1080p * 1
	} )
	BorderLeft.id = "BorderLeft"
	BorderLeft:SetAlpha( 0.25, 0 )
	BorderLeft:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 54, _1080p * 596, _1080p * 54, _1080p * 86 )
	self:addElement( BorderLeft )
	self.BorderLeft = BorderLeft
	
	local Name = nil
	
	Name = MenuBuilder.BuildRegisteredType( "CodCasterTextField", {
		controllerIndex = f3_local1
	} )
	Name.id = "Name"
	Name.Field:SetTop( _1080p * -12, 0 )
	Name.Field:SetBottom( _1080p * 12, 0 )
	Name.Field:setText( ToUpperCase( "LEVEL NAME" ), 0 )
	Name.Field:SetAlignment( LUI.Alignment.Left )
	Name:SetAnchorsAndPosition( 0, 1, 0, 0, _1080p * 57, _1080p * 588.25, _1080p * 58.29, _1080p * -998.29 )
	self:addElement( Name )
	self.Name = Name
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		Blur:RegisterAnimationSequence( "FullScreen", {
			{
				function ()
					return self.Blur:SetAlpha( 0.8, 0 )
				end
			},
			{
				function ()
					return self.Blur:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 54, _1080p * 596, _1080p * 54, _1080p * 86, 0 )
				end
			}
		} )
		Background:RegisterAnimationSequence( "FullScreen", {
			{
				function ()
					return self.Background:SetAlpha( 0, 0 )
				end
			}
		} )
		if Engine.IsMultiplayer() and not Engine.IsAliensMode() then
			f3_local5:RegisterAnimationSequence( "FullScreen", {
				{
					function ()
						return self.Minimap:SetAlpha( 0.8, 0 )
					end
				},
				{
					function ()
						return self.Minimap:SetScale( 0, 0 )
					end
				},
				{
					function ()
						return self.Minimap:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 363.27, _1080p * 1556.73, _1080p * 54, _1080p * 1026, 0 )
					end
				}
			} )
		end
		MinimapAreaLabel:RegisterAnimationSequence( "FullScreen", {
			{
				function ()
					return self.MinimapAreaLabel:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.MinimapAreaLabel:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 54, _1080p * 596, _1080p * 86, _1080p * 106, 0 )
				end
			}
		} )
		CompassBG:RegisterAnimationSequence( "FullScreen", {
			{
				function ()
					return self.CompassBG:SetAlpha( 0, 0 )
				end
			},
			{
				function ()
					return self.CompassBG:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 96, _1080p * 596, _1080p * 86, _1080p * 102.37, 0 )
				end
			}
		} )
		Compass:RegisterAnimationSequence( "FullScreen", {
			{
				function ()
					return self.Compass:SetAlpha( 0, 0 )
				end
			},
			{
				function ()
					return self.Compass:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 96, _1080p * 596, _1080p * 86, _1080p * 102.37, 0 )
				end
			}
		} )
		Line:RegisterAnimationSequence( "FullScreen", {
			{
				function ()
					return self.Line:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.FullScreen = function ()
			Blur:AnimateSequence( "FullScreen" )
			Background:AnimateSequence( "FullScreen" )
			if Engine.IsMultiplayer() and not Engine.IsAliensMode() then
				f3_local5:AnimateSequence( "FullScreen" )
			end
			MinimapAreaLabel:AnimateSequence( "FullScreen" )
			CompassBG:AnimateSequence( "FullScreen" )
			Compass:AnimateSequence( "FullScreen" )
			Line:AnimateSequence( "FullScreen" )
		end
		
		Blur:RegisterAnimationSequence( "CornerStandard", {
			{
				function ()
					return self.Blur:SetAlpha( 0.8, 0 )
				end
			},
			{
				function ()
					return self.Blur:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 54, _1080p * 596, _1080p * 54, _1080p * 371, 0 )
				end
			}
		} )
		Background:RegisterAnimationSequence( "CornerStandard", {
			{
				function ()
					return self.Background:SetAlpha( 0.4, 0 )
				end
			}
		} )
		if Engine.IsMultiplayer() and not Engine.IsAliensMode() then
			f3_local5:RegisterAnimationSequence( "CornerStandard", {
				{
					function ()
						return self.Minimap:SetAlpha( 0.6, 0 )
					end
				},
				{
					function ()
						return self.Minimap:SetScale( 0, 0 )
					end
				},
				{
					function ()
						return self.Minimap:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 54, _1080p * 596, _1080p * 86, _1080p * 371, 0 )
					end
				}
			} )
		end
		MinimapAreaLabel:RegisterAnimationSequence( "CornerStandard", {
			{
				function ()
					return self.MinimapAreaLabel:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.MinimapAreaLabel:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 54, _1080p * 596, _1080p * 374.99, _1080p * 394.99, 0 )
				end
			}
		} )
		CompassBG:RegisterAnimationSequence( "CornerStandard", {
			{
				function ()
					return self.CompassBG:SetAlpha( 0.5, 0 )
				end
			}
		} )
		Compass:RegisterAnimationSequence( "CornerStandard", {
			{
				function ()
					return self.Compass:SetAlpha( 1, 0 )
				end
			}
		} )
		Line:RegisterAnimationSequence( "CornerStandard", {
			{
				function ()
					return self.Line:SetAlpha( 0.7, 0 )
				end
			}
		} )
		self._sequences.CornerStandard = function ()
			Blur:AnimateSequence( "CornerStandard" )
			Background:AnimateSequence( "CornerStandard" )
			if Engine.IsMultiplayer() and not Engine.IsAliensMode() then
				f3_local5:AnimateSequence( "CornerStandard" )
			end
			MinimapAreaLabel:AnimateSequence( "CornerStandard" )
			CompassBG:AnimateSequence( "CornerStandard" )
			Compass:AnimateSequence( "CornerStandard" )
			Line:AnimateSequence( "CornerStandard" )
		end
		
		Blur:RegisterAnimationSequence( "CornerFullsize", {
			{
				function ()
					return self.Blur:SetAlpha( 0, 0 )
				end
			},
			{
				function ()
					return self.Blur:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 54, _1080p * 596, _1080p * 54, _1080p * 390, 0 )
				end
			}
		} )
		Background:RegisterAnimationSequence( "CornerFullsize", {
			{
				function ()
					return self.Background:SetAlpha( 0, 0 )
				end
			},
			{
				function ()
					return self.Background:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 38.85, _1080p * 657.85, _1080p * -4, _1080p * 486, 0 )
				end
			}
		} )
		if Engine.IsMultiplayer() and not Engine.IsAliensMode() then
			f3_local5:RegisterAnimationSequence( "CornerFullsize", {
				{
					function ()
						return self.Minimap:SetAlpha( 0.7, 0 )
					end
				},
				{
					function ()
						return self.Minimap:SetScale( 0, 0 )
					end
				},
				{
					function ()
						return self.Minimap:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 54, _1080p * 596, _1080p * 105, _1080p * 560, 0 )
					end
				}
			} )
		end
		MinimapAreaLabel:RegisterAnimationSequence( "CornerFullsize", {
			{
				function ()
					return self.MinimapAreaLabel:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.MinimapAreaLabel:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 54, _1080p * 596, _1080p * 86, _1080p * 106, 0 )
				end
			}
		} )
		CompassBG:RegisterAnimationSequence( "CornerFullsize", {
			{
				function ()
					return self.CompassBG:SetAlpha( 0, 0 )
				end
			}
		} )
		Compass:RegisterAnimationSequence( "CornerFullsize", {
			{
				function ()
					return self.Compass:SetAlpha( 0, 0 )
				end
			}
		} )
		Line:RegisterAnimationSequence( "CornerFullsize", {
			{
				function ()
					return self.Line:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.CornerFullsize = function ()
			Blur:AnimateSequence( "CornerFullsize" )
			Background:AnimateSequence( "CornerFullsize" )
			if Engine.IsMultiplayer() and not Engine.IsAliensMode() then
				f3_local5:AnimateSequence( "CornerFullsize" )
			end
			MinimapAreaLabel:AnimateSequence( "CornerFullsize" )
			CompassBG:AnimateSequence( "CornerFullsize" )
			Compass:AnimateSequence( "CornerFullsize" )
			Line:AnimateSequence( "CornerFullsize" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	f0_local1( self, f3_local1, controller )
	return self
end

MenuBuilder.registerType( "CodcasterMinimap", CodcasterMinimap )
LockTable( _M )
