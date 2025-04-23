local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function FramedJackalItem( menu, controller )
	local self = LUI.UIButton.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 165.33 * _1080p, 0, 99 * _1080p )
	self.id = "FramedJackalItem"
	self._animationSets = {}
	self._sequences = {}
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local GradientBackgroundInGameOnly = nil
	
	GradientBackgroundInGameOnly = LUI.UIImage.new()
	GradientBackgroundInGameOnly.id = "GradientBackgroundInGameOnly"
	GradientBackgroundInGameOnly:SetRGBFromInt( 0, 0 )
	GradientBackgroundInGameOnly:SetAlpha( 0.5, 0 )
	self:addElement( GradientBackgroundInGameOnly )
	self.GradientBackgroundInGameOnly = GradientBackgroundInGameOnly
	
	local Image = nil
	
	Image = LUI.UIImage.new()
	Image.id = "Image"
	Image:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * 33.16, _1080p * -33.17, 0, 0 )
	Image:SubscribeToModelThroughElement( self, "image", function ()
		local f2_local0 = self:GetDataSource()
		f2_local0 = f2_local0.image:GetValue( f1_local1 )
		if f2_local0 ~= nil then
			Image:setImage( RegisterMaterial( f2_local0 ), 0 )
		end
	end )
	self:addElement( Image )
	self.Image = Image
	
	local NameBacker = nil
	
	NameBacker = LUI.UIImage.new()
	NameBacker.id = "NameBacker"
	NameBacker:SetRGBFromInt( 0, 0 )
	NameBacker:SetAlpha( 0.4, 0 )
	NameBacker:SetAnchorsAndPosition( 0, 0, 1, 0, 0, 0, _1080p * -24, 0 )
	self:addElement( NameBacker )
	self.NameBacker = NameBacker
	
	local ItemName = nil
	
	ItemName = LUI.UIStyledText.new()
	ItemName.id = "ItemName"
	ItemName:SetRGBFromTable( SWATCHES.genericButton.textDefault, 0 )
	ItemName:SetFontSize( 19 * _1080p )
	ItemName:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	ItemName:SetAlignment( LUI.Alignment.Center )
	ItemName:SetStartupDelay( 1250 )
	ItemName:SetLineHoldTime( 400 )
	ItemName:SetAnimMoveTime( 300 )
	ItemName:SetEndDelay( 1000 )
	ItemName:SetCrossfadeTime( 500 )
	ItemName:SetAutoScrollStyle( LUI.UIStyledText.AutoScrollStyle.ScrollH )
	ItemName:SetMaxVisibleLines( 1 )
	ItemName:SetAnchorsAndPosition( 0, 0, 1, 0, 0, 0, _1080p * -21.5, _1080p * -2.5 )
	ItemName:SubscribeToModelThroughElement( self, "name", function ()
		local f3_local0 = self:GetDataSource()
		f3_local0 = f3_local0.name:GetValue( f1_local1 )
		if f3_local0 ~= nil then
			ItemName:setText( f3_local0, 0 )
		end
	end )
	self:addElement( ItemName )
	self.ItemName = ItemName
	
	local GenericButtonSelection = nil
	
	GenericButtonSelection = MenuBuilder.BuildRegisteredType( "GenericButtonSelection", {
		controllerIndex = f1_local1
	} )
	GenericButtonSelection.id = "GenericButtonSelection"
	GenericButtonSelection:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, 0, 0 )
	self:addElement( GenericButtonSelection )
	self.GenericButtonSelection = GenericButtonSelection
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		GradientBackgroundInGameOnly:RegisterAnimationSequence( "ButtonOver", {
			{
				function ()
					return self.GradientBackgroundInGameOnly:SetAlpha( 0.9, 0 )
				end
			}
		} )
		Image:RegisterAnimationSequence( "ButtonOver", {
			{
				function ()
					return self.Image:SetScale( 0.05, 100 )
				end
			}
		} )
		self._sequences.ButtonOver = function ()
			GradientBackgroundInGameOnly:AnimateSequence( "ButtonOver" )
			Image:AnimateSequence( "ButtonOver" )
		end
		
		GradientBackgroundInGameOnly:RegisterAnimationSequence( "ButtonUp", {
			{
				function ()
					return self.GradientBackgroundInGameOnly:SetAlpha( 0.5, 0 )
				end
			}
		} )
		Image:RegisterAnimationSequence( "ButtonUp", {
			{
				function ()
					return self.Image:SetScale( 0, 200 )
				end
			}
		} )
		self._sequences.ButtonUp = function ()
			GradientBackgroundInGameOnly:AnimateSequence( "ButtonUp" )
			Image:AnimateSequence( "ButtonUp" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	self:addEventHandler( "button_over", function ( f12_arg0, f12_arg1 )
		local f12_local0 = f12_arg1.controller or f1_local1
		ACTIONS.AnimateSequence( self, "ButtonOver" )
	end )
	self:addEventHandler( "button_up", function ( f13_arg0, f13_arg1 )
		local f13_local0 = f13_arg1.controller or f1_local1
		ACTIONS.AnimateSequence( self, "ButtonUp" )
	end )
	return self
end

MenuBuilder.registerType( "FramedJackalItem", FramedJackalItem )
LockTable( _M )
