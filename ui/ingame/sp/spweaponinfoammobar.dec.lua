local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function PostLoadFunc( f1_arg0, f1_arg1 )
	local f1_local0 = DataSources.inGame.player.currentWeapon.clipAmmoMax
	local f1_local1 = function ()
		local f2_local0 = f1_arg0:GetDataSource()
		if not f2_local0 then
			return 
		else
			local f2_local1 = f2_local0:GetValue( f1_arg1 )
			local f2_local2 = f1_local0:GetValue( f1_arg1 )
			if not f2_local1 or not f2_local2 or f2_local2 == 0 then
				return 
			else
				f1_arg0.AmmoBarFill:SetLeftAnchor( 1 - (f2_local1 - f2_local2) / f2_local2 )
			end
		end
	end
	
	f1_arg0:SubscribeToModelThroughElement( f1_arg0, nil, f1_local1 )
	f1_arg0:SubscribeToModel( DataSources.inGame.player.currentWeapon.isDualWielding:GetModel( f1_arg1 ), f1_local1 )
end

function SPWeaponInfoAmmoBar( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 100 * _1080p, 0, 8 * _1080p )
	self.id = "SPWeaponInfoAmmoBar"
	self._animationSets = {}
	self._sequences = {}
	local f3_local1 = controller and controller.controllerIndex
	if not f3_local1 and not Engine.InFrontend() then
		f3_local1 = self:getRootController()
	end
	assert( f3_local1 )
	local f3_local2 = self
	local Background = nil
	
	Background = LUI.UIImage.new()
	Background.id = "Background"
	Background:SetRGBFromInt( 0, 0 )
	Background:SetAlpha( 0.6, 0 )
	Background:SetUseAA( true )
	self:addElement( Background )
	self.Background = Background
	
	local AmmoBarFill = nil
	
	AmmoBarFill = LUI.UIImage.new()
	AmmoBarFill.id = "AmmoBarFill"
	AmmoBarFill:SetRGBFromTable( SWATCHES.HUD.ammoFill, 0 )
	AmmoBarFill:setImage( RegisterMaterial( "widg_gradient_left_to_right_opaque" ), 0 )
	AmmoBarFill:SetUseAA( true )
	AmmoBarFill:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * 1, _1080p * -1, 0, _1080p * -1 )
	self:addElement( AmmoBarFill )
	self.AmmoBarFill = AmmoBarFill
	
	local Frame = nil
	
	Frame = LUI.UIBorder.new( {
		borderThicknessLeft = _1080p * 1,
		borderThicknessRight = _1080p * 1,
		borderThicknessTop = _1080p * 0,
		borderThicknessBottom = _1080p * 1
	} )
	Frame.id = "Frame"
	Frame:SetBorderThicknessTop( _1080p * 0, 0 )
	self:addElement( Frame )
	self.Frame = Frame
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		AmmoBarFill:RegisterAnimationSequence( "Update", {
			{
				function ()
					return self.AmmoBarFill:SetRGBFromInt( 16777215, 0 )
				end,
				function ()
					return self.AmmoBarFill:SetRGBFromTable( SWATCHES.HUD.ammoFill, 200 )
				end
			}
		} )
		self._sequences.Update = function ()
			AmmoBarFill:AnimateSequence( "Update" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	PostLoadFunc( self, f3_local1, controller )
	return self
end

MenuBuilder.registerType( "SPWeaponInfoAmmoBar", SPWeaponInfoAmmoBar )
LockTable( _M )
