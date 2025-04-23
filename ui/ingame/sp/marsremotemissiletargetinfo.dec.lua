local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function MarsRemoteMissileTargetInfo( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 720 * _1080p, 0, 50 * _1080p )
	self.id = "MarsRemoteMissileTargetInfo"
	self._animationSets = {}
	self._sequences = {}
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local Target2Box = nil
	
	Target2Box = MenuBuilder.BuildRegisteredType( "GenericBoxFillAndStroke", {
		controllerIndex = f1_local1
	} )
	Target2Box.id = "Target2Box"
	Target2Box.Fill:SetAlpha( 0.2, 0 )
	Target2Box.Stroke:SetAlpha( 0, 0 )
	Target2Box:SetAnchorsAndPosition( 1, 0, 1, 0, _1080p * -348, _1080p * -88, _1080p * -50, 0 )
	self:addElement( Target2Box )
	self.Target2Box = Target2Box
	
	local Target2Label = nil
	
	Target2Label = LUI.UIText.new()
	Target2Label.id = "Target2Label"
	Target2Label:SetAlpha( 0.4, 0 )
	Target2Label:setText( Engine.Localize( "HUD_RMS_END" ), 0 )
	Target2Label:SetFontSize( 32 * _1080p )
	Target2Label:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	Target2Label:SetAlignment( LUI.Alignment.Center )
	Target2Label:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 28.08, _1080p * 255.92, _1080p * -16, _1080p * 16 )
	self:addElement( Target2Label )
	self.Target2Label = Target2Label
	
	local Target1Box = nil
	
	Target1Box = MenuBuilder.BuildRegisteredType( "GenericBoxFillAndStroke", {
		controllerIndex = f1_local1
	} )
	Target1Box.id = "Target1Box"
	Target1Box.Fill:SetAlpha( 0.6, 0 )
	Target1Box:SetAnchorsAndPosition( 0, 1, 1, 0, _1080p * 88, _1080p * 348, _1080p * -50, 0 )
	self:addElement( Target1Box )
	self.Target1Box = Target1Box
	
	local Target1Label = nil
	
	Target1Label = LUI.UIText.new()
	Target1Label.id = "Target1Label"
	Target1Label:setText( Engine.Localize( "HUD_RMS_START" ), 0 )
	Target1Label:SetFontSize( 32 * _1080p )
	Target1Label:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	Target1Label:SetAlignment( LUI.Alignment.Center )
	Target1Label:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -255.92, _1080p * -28.08, _1080p * -16, _1080p * 16 )
	self:addElement( Target1Label )
	self.Target1Label = Target1Label
	
	local Triangle = nil
	
	Triangle = LUI.UIImage.new()
	Triangle.id = "Triangle"
	Triangle:SetAlpha( 0, 0 )
	Triangle:SetZRotation( -135, 0 )
	Triangle:setImage( RegisterMaterial( "widg_triangle" ), 0 )
	Triangle:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 71, _1080p * 107, _1080p * 7.78, _1080p * 42.22 )
	self:addElement( Triangle )
	self.Triangle = Triangle
	
	local TargetDesc = nil
	
	TargetDesc = MenuBuilder.BuildRegisteredType( "GenericTextBoxAnchoredLabel", {
		controllerIndex = f1_local1
	} )
	TargetDesc.id = "TargetDesc"
	TargetDesc.Box.Fill:SetAlpha( 0.1, 0 )
	TargetDesc.Box.Stroke:SetAlpha( 0, 0 )
	TargetDesc.Text:setText( ToUpperCase( Engine.Localize( "HUD_RMS_DESC" ) ), 0 )
	TargetDesc.Text:SetFontSize( 22 * _1080p )
	TargetDesc.Text:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	TargetDesc.Text:SetAlignment( LUI.Alignment.Center )
	TargetDesc:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -271, _1080p * 272, _1080p * -66.41, _1080p * -40.41 )
	self:addElement( TargetDesc )
	self.TargetDesc = TargetDesc
	
	self._animationSets.DefaultAnimationSet = function ()
		TargetDesc:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.TargetDesc:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -271, _1080p * 272, _1080p * -62.41, _1080p * -36.41, 0 )
				end
			}
		} )
		self._sequences.DefaultSequence = function ()
			TargetDesc:AnimateSequence( "DefaultSequence" )
		end
		
		Target2Box:RegisterAnimationSequence( "bootup", {
			{
				function ()
					return self.Target2Box.Fill:SetAlpha( 0.2, 0 )
				end
			},
			{
				function ()
					return self.Target2Box.Fill:SetRGBFromInt( 16777215, 0 )
				end
			},
			{
				function ()
					return self.Target2Box.Stroke:SetAlpha( 0, 0 )
				end
			},
			{
				function ()
					return self.Target2Box:SetAlpha( 1, 0 )
				end
			}
		} )
		Target2Label:RegisterAnimationSequence( "bootup", {
			{
				function ()
					return self.Target2Label:SetAlpha( 0.5, 0 )
				end
			},
			{
				function ()
					return self.Target2Label:SetRGBFromInt( 16777215, 0 )
				end
			}
		} )
		Target1Box:RegisterAnimationSequence( "bootup", {
			{
				function ()
					return self.Target1Box.Fill:SetAlpha( 0.6, 0 )
				end,
				function ()
					return self.Target1Box.Fill:SetAlpha( 0.2, 500 )
				end,
				function ()
					return self.Target1Box.Fill:SetAlpha( 0.6, 500 )
				end
			},
			{
				function ()
					return self.Target1Box.Fill:SetRGBFromInt( 16777215, 0 )
				end
			}
		} )
		Target1Label:RegisterAnimationSequence( "bootup", {
			{
				function ()
					return self.Target1Label:SetRGBFromInt( 16777215, 0 )
				end
			},
			{
				function ()
					return self.Target1Label:SetAlpha( 1, 0 )
				end
			}
		} )
		Triangle:RegisterAnimationSequence( "bootup", {
			{
				function ()
					return self.Triangle:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.Triangle:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 71, _1080p * 107, _1080p * 7.78, _1080p * 42.22, 0 )
				end
			}
		} )
		self._sequences.bootup = function ()
			Target2Box:AnimateLoop( "bootup" )
			Target2Label:AnimateLoop( "bootup" )
			Target1Box:AnimateLoop( "bootup" )
			Target1Label:AnimateLoop( "bootup" )
			Triangle:AnimateLoop( "bootup" )
		end
		
		Target2Box:RegisterAnimationSequence( "target2", {
			{
				function ()
					return self.Target2Box.Stroke:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.Target2Box.Fill:SetAlpha( 0.6, 0 )
				end,
				function ()
					return self.Target2Box.Fill:SetAlpha( 0.2, 500 )
				end,
				function ()
					return self.Target2Box.Fill:SetAlpha( 0.6, 500 )
				end
			}
		} )
		Target2Label:RegisterAnimationSequence( "target2", {
			{
				function ()
					return self.Target2Label:SetAlpha( 1, 0 )
				end
			}
		} )
		Target1Box:RegisterAnimationSequence( "target2", {
			{
				function ()
					return self.Target1Box.Fill:SetRGBFromTable( SWATCHES.HUD.warning, 0 )
				end
			},
			{
				function ()
					return self.Target1Box.Fill:SetAlpha( 0.6, 0 )
				end
			}
		} )
		Target1Label:RegisterAnimationSequence( "target2", {
			{
				function ()
					return self.Target1Label:SetAlpha( 0.8, 0 )
				end
			}
		} )
		Triangle:RegisterAnimationSequence( "target2", {
			{
				function ()
					return self.Triangle:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.Triangle:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 354, _1080p * 390, _1080p * 7.78, _1080p * 42.22, 0 )
				end
			}
		} )
		self._sequences.target2 = function ()
			Target2Box:AnimateLoop( "target2" )
			Target2Label:AnimateLoop( "target2" )
			Target1Box:AnimateLoop( "target2" )
			Target1Label:AnimateLoop( "target2" )
			Triangle:AnimateLoop( "target2" )
		end
		
		Target2Box:RegisterAnimationSequence( "shutdown", {
			{
				function ()
					return self.Target2Box.Stroke:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.Target2Box.Fill:SetAlpha( 0.6, 0 )
				end
			},
			{
				function ()
					return self.Target2Box.Fill:SetRGBFromTable( SWATCHES.HUD.warning, 0 )
				end
			}
		} )
		Target2Label:RegisterAnimationSequence( "shutdown", {
			{
				function ()
					return self.Target2Label:SetAlpha( 0.8, 0 )
				end
			}
		} )
		Target1Box:RegisterAnimationSequence( "shutdown", {
			{
				function ()
					return self.Target1Box.Fill:SetRGBFromTable( SWATCHES.HUD.warning, 0 )
				end
			},
			{
				function ()
					return self.Target1Box.Fill:SetAlpha( 0.6, 0 )
				end
			},
			{
				function ()
					return self.Target1Box.Stroke:SetAlpha( 1, 0 )
				end
			}
		} )
		Target1Label:RegisterAnimationSequence( "shutdown", {
			{
				function ()
					return self.Target1Label:SetAlpha( 0.8, 0 )
				end
			}
		} )
		Triangle:RegisterAnimationSequence( "shutdown", {
			{
				function ()
					return self.Triangle:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.shutdown = function ()
			Target2Box:AnimateSequence( "shutdown" )
			Target2Label:AnimateSequence( "shutdown" )
			Target1Box:AnimateSequence( "shutdown" )
			Target1Label:AnimateSequence( "shutdown" )
			Triangle:AnimateSequence( "shutdown" )
		end
		
		Target2Label:RegisterAnimationSequence( "off", {
			{
				function ()
					return self.Target2Label:SetRGBFromInt( 16777215, 0 )
				end
			},
			{
				function ()
					return self.Target2Label:SetAlpha( 0.5, 0 )
				end
			}
		} )
		Target1Label:RegisterAnimationSequence( "off", {
			{
				function ()
					return self.Target1Label:SetRGBFromInt( 16777215, 0 )
				end
			},
			{
				function ()
					return self.Target1Label:SetAlpha( 0.5, 0 )
				end
			}
		} )
		self._sequences.off = function ()
			Target2Label:AnimateSequence( "off" )
			Target1Label:AnimateSequence( "off" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	self:SubscribeToModel( DataSources.inGame.SP.mars.marsRemoteMissileState:GetModel( f1_local1 ), function ()
		if DataSources.inGame.SP.mars.marsRemoteMissileState:GetValue( f1_local1 ) ~= nil and DataSources.inGame.SP.mars.marsRemoteMissileState:GetValue( f1_local1 ) == 1 then
			ACTIONS.AnimateSequence( self, "bootup" )
		end
		if DataSources.inGame.SP.mars.marsRemoteMissileState:GetValue( f1_local1 ) ~= nil and DataSources.inGame.SP.mars.marsRemoteMissileState:GetValue( f1_local1 ) == 2 then
			ACTIONS.AnimateSequence( self, "target2" )
		end
		if DataSources.inGame.SP.mars.marsRemoteMissileState:GetValue( f1_local1 ) ~= nil and DataSources.inGame.SP.mars.marsRemoteMissileState:GetValue( f1_local1 ) == 3 then
			ACTIONS.AnimateSequence( self, "shutdown" )
		end
		if DataSources.inGame.SP.mars.marsRemoteMissileState:GetValue( f1_local1 ) ~= nil and DataSources.inGame.SP.mars.marsRemoteMissileState:GetValue( f1_local1 ) == 4 then
			ACTIONS.AnimateSequence( self, "bootup" )
		end
		if DataSources.inGame.SP.mars.marsRemoteMissileState:GetValue( f1_local1 ) ~= nil and DataSources.inGame.SP.mars.marsRemoteMissileState:GetValue( f1_local1 ) == 5 then
			ACTIONS.AnimateSequence( self, "off" )
		end
	end )
	ACTIONS.AnimateSequence( self, "DefaultSequence" )
	return self
end

MenuBuilder.registerType( "MarsRemoteMissileTargetInfo", MarsRemoteMissileTargetInfo )
LockTable( _M )
