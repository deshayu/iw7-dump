local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function TeamDoor( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 200 * _1080p, 0, 400 * _1080p )
	self.id = "TeamDoor"
	self._animationSets = {}
	self._sequences = {}
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local meterBack = nil
	
	meterBack = LUI.UIImage.new()
	meterBack.id = "meterBack"
	meterBack:setImage( RegisterMaterial( "door_buy_meter" ), 0 )
	meterBack:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 36, _1080p * 164, _1080p * 53, _1080p * 381 )
	self:addElement( meterBack )
	self.meterBack = meterBack
	
	local Label1Copy1 = nil
	
	Label1Copy1 = LUI.UIText.new()
	Label1Copy1.id = "Label1Copy1"
	Label1Copy1:SetRGBFromTable( SWATCHES.HUD.sixthSense, 0 )
	Label1Copy1:setText( "Help Open This Area!", 0 )
	Label1Copy1:SetFontSize( 20 * _1080p )
	Label1Copy1:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	Label1Copy1:SetAlignment( LUI.Alignment.Center )
	Label1Copy1:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 0.25, 0, _1080p * 373, _1080p * 393 )
	self:addElement( Label1Copy1 )
	self.Label1Copy1 = Label1Copy1
	
	local GenericBoxFillAndStroke0 = nil
	
	GenericBoxFillAndStroke0 = MenuBuilder.BuildRegisteredType( "GenericBoxFillAndStroke", {
		controllerIndex = f1_local1
	} )
	GenericBoxFillAndStroke0.id = "GenericBoxFillAndStroke0"
	GenericBoxFillAndStroke0:SetRGBFromInt( 16711680, 0 )
	GenericBoxFillAndStroke0.Stroke:SetRGBFromInt( 16711680, 0 )
	GenericBoxFillAndStroke0.Stroke:SetBorderThicknessLeft( _1080p * 0, 0 )
	GenericBoxFillAndStroke0.Stroke:SetBorderThicknessRight( _1080p * 0, 0 )
	GenericBoxFillAndStroke0.Stroke:SetBorderThicknessTop( _1080p * 0, 0 )
	GenericBoxFillAndStroke0.Stroke:SetBorderThicknessBottom( _1080p * 0, 0 )
	GenericBoxFillAndStroke0:SetAnchorsAndPosition( 0.5, 0.5, 1, 0, _1080p * -26, _1080p * 19, _1080p * -60, _1080p * -60 )
	self:addElement( GenericBoxFillAndStroke0 )
	self.GenericBoxFillAndStroke0 = GenericBoxFillAndStroke0
	
	self._animationSets.DefaultAnimationSet = function ()
		meterBack:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.meterBack:SetAlpha( 1, 0 )
				end
			}
		} )
		Label1Copy1:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.Label1Copy1:SetAlpha( 0.8, 0 )
				end
			}
		} )
		GenericBoxFillAndStroke0:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.GenericBoxFillAndStroke0:SetAnchors( 0.5, 0.5, 1, 0, 0 )
				end
			},
			{
				function ()
					return self.GenericBoxFillAndStroke0:SetLeft( _1080p * -26, 0 )
				end
			},
			{
				function ()
					return self.GenericBoxFillAndStroke0:SetRight( _1080p * 18.5, 0 )
				end
			},
			{
				function ()
					return self.GenericBoxFillAndStroke0:SetTop( _1080p * -60, 0 )
				end
			},
			{
				function ()
					return self.GenericBoxFillAndStroke0:SetBottom( _1080p * -60, 0 )
				end
			},
			{
				function ()
					return self.GenericBoxFillAndStroke0:SetAlpha( 0.99, 0 )
				end
			}
		} )
		self._sequences.DefaultSequence = function ()
			meterBack:AnimateSequence( "DefaultSequence" )
			Label1Copy1:AnimateSequence( "DefaultSequence" )
			GenericBoxFillAndStroke0:AnimateSequence( "DefaultSequence" )
		end
		
		GenericBoxFillAndStroke0:RegisterAnimationSequence( "first_buy", {
			{
				function ()
					return self.GenericBoxFillAndStroke0:SetAnchors( 0.5, 0.5, 1, 0, 0 )
				end,
				function ()
					return self.GenericBoxFillAndStroke0:SetAnchors( 0.5, 0.5, 1, 0, 250 )
				end
			},
			{
				function ()
					return self.GenericBoxFillAndStroke0:SetLeft( _1080p * -26, 0 )
				end,
				function ()
					return self.GenericBoxFillAndStroke0:SetLeft( _1080p * -26, 250 )
				end
			},
			{
				function ()
					return self.GenericBoxFillAndStroke0:SetRight( _1080p * 18.5, 0 )
				end,
				function ()
					return self.GenericBoxFillAndStroke0:SetRight( _1080p * 18.5, 250 )
				end
			},
			{
				function ()
					return self.GenericBoxFillAndStroke0:SetTop( _1080p * -60, 0 )
				end,
				function ()
					return self.GenericBoxFillAndStroke0:SetTop( _1080p * -94, 250 )
				end
			},
			{
				function ()
					return self.GenericBoxFillAndStroke0:SetBottom( _1080p * -60, 0 )
				end,
				function ()
					return self.GenericBoxFillAndStroke0:SetBottom( _1080p * -60, 250 )
				end
			}
		} )
		self._sequences.first_buy = function ()
			GenericBoxFillAndStroke0:AnimateSequence( "first_buy" )
		end
		
		GenericBoxFillAndStroke0:RegisterAnimationSequence( "second_buy", {
			{
				function ()
					return self.GenericBoxFillAndStroke0:SetAnchors( 0.5, 0.5, 1, 0, 0 )
				end,
				function ()
					return self.GenericBoxFillAndStroke0:SetAnchors( 0.5, 0.5, 1, 0, 250 )
				end
			},
			{
				function ()
					return self.GenericBoxFillAndStroke0:SetLeft( _1080p * -26, 0 )
				end,
				function ()
					return self.GenericBoxFillAndStroke0:SetLeft( _1080p * -26, 250 )
				end
			},
			{
				function ()
					return self.GenericBoxFillAndStroke0:SetRight( _1080p * 18.5, 0 )
				end,
				function ()
					return self.GenericBoxFillAndStroke0:SetRight( _1080p * 18.5, 250 )
				end
			},
			{
				function ()
					return self.GenericBoxFillAndStroke0:SetTop( _1080p * -96, 0 )
				end,
				function ()
					return self.GenericBoxFillAndStroke0:SetTop( _1080p * -128, 250 )
				end
			},
			{
				function ()
					return self.GenericBoxFillAndStroke0:SetBottom( _1080p * -60, 0 )
				end,
				function ()
					return self.GenericBoxFillAndStroke0:SetBottom( _1080p * -60, 250 )
				end
			}
		} )
		self._sequences.second_buy = function ()
			GenericBoxFillAndStroke0:AnimateSequence( "second_buy" )
		end
		
		GenericBoxFillAndStroke0:RegisterAnimationSequence( "third_buy", {
			{
				function ()
					return self.GenericBoxFillAndStroke0:SetAnchors( 0.5, 0.5, 1, 0, 0 )
				end,
				function ()
					return self.GenericBoxFillAndStroke0:SetAnchors( 0.5, 0.5, 1, 0, 500 )
				end
			},
			{
				function ()
					return self.GenericBoxFillAndStroke0:SetLeft( _1080p * -26, 0 )
				end,
				function ()
					return self.GenericBoxFillAndStroke0:SetLeft( _1080p * -26, 500 )
				end
			},
			{
				function ()
					return self.GenericBoxFillAndStroke0:SetRight( _1080p * 18.5, 0 )
				end,
				function ()
					return self.GenericBoxFillAndStroke0:SetRight( _1080p * 18.5, 500 )
				end
			},
			{
				function ()
					return self.GenericBoxFillAndStroke0:SetTop( _1080p * -128, 0 )
				end,
				function ()
					return self.GenericBoxFillAndStroke0:SetTop( _1080p * -162, 500 )
				end
			},
			{
				function ()
					return self.GenericBoxFillAndStroke0:SetBottom( _1080p * -60, 0 )
				end,
				function ()
					return self.GenericBoxFillAndStroke0:SetBottom( _1080p * -60, 500 )
				end
			}
		} )
		self._sequences.third_buy = function ()
			GenericBoxFillAndStroke0:AnimateSequence( "third_buy" )
		end
		
		GenericBoxFillAndStroke0:RegisterAnimationSequence( "fourth_buy", {
			{
				function ()
					return self.GenericBoxFillAndStroke0:SetAnchors( 0.5, 0.5, 1, 0, 0 )
				end,
				function ()
					return self.GenericBoxFillAndStroke0:SetAnchors( 0.5, 0.5, 1, 0, 500 )
				end
			},
			{
				function ()
					return self.GenericBoxFillAndStroke0:SetLeft( _1080p * -26, 0 )
				end,
				function ()
					return self.GenericBoxFillAndStroke0:SetLeft( _1080p * -26, 500 )
				end
			},
			{
				function ()
					return self.GenericBoxFillAndStroke0:SetRight( _1080p * 18.5, 0 )
				end,
				function ()
					return self.GenericBoxFillAndStroke0:SetRight( _1080p * 18.5, 500 )
				end
			},
			{
				function ()
					return self.GenericBoxFillAndStroke0:SetTop( _1080p * -162, 0 )
				end,
				function ()
					return self.GenericBoxFillAndStroke0:SetTop( _1080p * -196, 500 )
				end
			},
			{
				function ()
					return self.GenericBoxFillAndStroke0:SetBottom( _1080p * -60, 0 )
				end,
				function ()
					return self.GenericBoxFillAndStroke0:SetBottom( _1080p * -60, 500 )
				end
			}
		} )
		self._sequences.fourth_buy = function ()
			GenericBoxFillAndStroke0:AnimateSequence( "fourth_buy" )
		end
		
		meterBack:RegisterAnimationSequence( "hideAll", {
			{
				function ()
					return self.meterBack:SetAlpha( 1, 0 )
				end,
				function ()
					return self.meterBack:SetAlpha( 0, 50 )
				end
			}
		} )
		Label1Copy1:RegisterAnimationSequence( "hideAll", {
			{
				function ()
					return self.Label1Copy1:SetAlpha( 1, 0 )
				end,
				function ()
					return self.Label1Copy1:SetAlpha( 0, 50 )
				end
			},
			{
				function ()
					return self.Label1Copy1:SetRGBFromTable( SWATCHES.loot.legendary, 0 )
				end
			},
			{
				function ()
					return self.Label1Copy1:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 0.25, _1080p * -7.75, _1080p * 373, _1080p * 389, 0 )
				end
			}
		} )
		GenericBoxFillAndStroke0:RegisterAnimationSequence( "hideAll", {
			{
				function ()
					return self.GenericBoxFillAndStroke0:SetAlpha( 1, 0 )
				end,
				function ()
					return self.GenericBoxFillAndStroke0:SetAlpha( 0, 50 )
				end
			}
		} )
		self._sequences.hideAll = function ()
			meterBack:AnimateSequence( "hideAll" )
			Label1Copy1:AnimateSequence( "hideAll" )
			GenericBoxFillAndStroke0:AnimateSequence( "hideAll" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	self:SubscribeToModelThroughElement( self, "progress", function ()
		local f65_local0 = self:GetDataSource()
		if f65_local0.progress:GetValue( f1_local1 ) ~= nil then
			f65_local0 = self:GetDataSource()
			if f65_local0.progress:GetValue( f1_local1 ) == 1 then
				ACTIONS.AnimateSequence( self, "first_buy" )
			end
		end
		f65_local0 = self:GetDataSource()
		if f65_local0.progress:GetValue( f1_local1 ) ~= nil then
			f65_local0 = self:GetDataSource()
			if f65_local0.progress:GetValue( f1_local1 ) == 2 then
				ACTIONS.AnimateSequence( self, "second_buy" )
			end
		end
		f65_local0 = self:GetDataSource()
		if f65_local0.progress:GetValue( f1_local1 ) ~= nil then
			f65_local0 = self:GetDataSource()
			if f65_local0.progress:GetValue( f1_local1 ) == 3 then
				ACTIONS.AnimateSequence( self, "third_buy" )
			end
		end
		f65_local0 = self:GetDataSource()
		if f65_local0.progress:GetValue( f1_local1 ) ~= nil then
			f65_local0 = self:GetDataSource()
			if f65_local0.progress:GetValue( f1_local1 ) == 4 then
				ACTIONS.AnimateSequence( self, "fourth_buy" )
			end
		end
		f65_local0 = self:GetDataSource()
		if f65_local0.progress:GetValue( f1_local1 ) ~= nil then
			f65_local0 = self:GetDataSource()
			if f65_local0.progress:GetValue( f1_local1 ) == 5 then
				ACTIONS.AnimateSequence( self, "hideAll" )
			end
		end
	end )
	ACTIONS.AnimateSequence( self, "DefaultSequence" )
	return self
end

MenuBuilder.registerType( "TeamDoor", TeamDoor )
LockTable( _M )
