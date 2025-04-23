local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ( f1_arg0, f1_arg1, f1_arg2 )
	f1_arg0.Image:SetMask( f1_arg0.Mask )
	assert( f1_arg0.Image )
	f1_arg0:SubscribeToDataSourceThroughElement( f1_arg0, nil, function ()
		local f2_local0 = f1_arg0:GetDataSource()
		assert( f2_local0 )
		local f2_local1 = f2_local0.ref:GetValue( f1_arg1 )
		assert( f2_local1 and #f2_local1 > 0 )
		local f2_local2 = Engine.TableLookup( CSV.jackalDecals.file, CSV.jackalDecals.cols.ref, f2_local1, CSV.jackalDecals.cols.image )
		assert( f2_local2 and #f2_local2 > 0 )
		f1_arg0.Image:setImage( RegisterMaterial( f2_local2 ), 0 )
	end )
end

function FramedJackalLoadoutLivery( menu, controller )
	local self = LUI.UIButton.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 500 * _1080p, 0, 99 * _1080p )
	self.id = "FramedJackalLoadoutLivery"
	self._animationSets = {}
	self._sequences = {}
	local f3_local1 = controller and controller.controllerIndex
	if not f3_local1 and not Engine.InFrontend() then
		f3_local1 = self:getRootController()
	end
	assert( f3_local1 )
	local f3_local2 = self
	self:setUseStencil( true )
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
	Image:SetRGBFromInt( 11776947, 0 )
	Image:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * -6, _1080p * 6, _1080p * -14.5, _1080p * 14.5 )
	Image:SubscribeToModelThroughElement( self, "image", function ()
		local f4_local0 = self:GetDataSource()
		f4_local0 = f4_local0.image:GetValue( f3_local1 )
		if f4_local0 ~= nil then
			Image:setImage( RegisterMaterial( f4_local0 ), 0 )
		end
	end )
	self:addElement( Image )
	self.Image = Image
	
	local GenericButtonSelection = nil
	
	GenericButtonSelection = MenuBuilder.BuildRegisteredType( "GenericButtonSelection", {
		controllerIndex = f3_local1
	} )
	GenericButtonSelection.id = "GenericButtonSelection"
	GenericButtonSelection:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, 0, 0 )
	self:addElement( GenericButtonSelection )
	self.GenericButtonSelection = GenericButtonSelection
	
	local Mask = nil
	
	Mask = LUI.UIImage.new()
	Mask.id = "Mask"
	Mask:setImage( RegisterMaterial( "ui_default_white" ), 0 )
	self:addElement( Mask )
	self.Mask = Mask
	
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
			},
			{
				function ()
					return self.Image:SetRGBFromInt( 16777215, 100 )
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
			},
			{
				function ()
					return self.Image:SetRGBFromInt( 6710886, 200 )
				end
			}
		} )
		self._sequences.ButtonUp = function ()
			GradientBackgroundInGameOnly:AnimateSequence( "ButtonUp" )
			Image:AnimateSequence( "ButtonUp" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	self:addEventHandler( "button_over", function ( f15_arg0, f15_arg1 )
		local f15_local0 = f15_arg1.controller or f3_local1
		ACTIONS.AnimateSequence( self, "ButtonOver" )
	end )
	self:addEventHandler( "button_up", function ( f16_arg0, f16_arg1 )
		local f16_local0 = f16_arg1.controller or f3_local1
		ACTIONS.AnimateSequence( self, "ButtonUp" )
	end )
	f0_local0( self, f3_local1, controller )
	return self
end

MenuBuilder.registerType( "FramedJackalLoadoutLivery", FramedJackalLoadoutLivery )
LockTable( _M )
