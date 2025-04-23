local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function PostLoadFunc( f1_arg0, f1_arg1, f1_arg2 )
	f1_arg0:SetBlendMode( BLEND_MODE.addWithAlpha )
	assert( f1_arg0.MissilesReadyText )
	local f1_local0 = LUI.AggregateDataSource.new( DataSources.inGame.SP.titan.c12Base, {
		DataSources.inGame.player.currentWeapon.clipAmmoRight,
		DataSources.inGame.player.currentWeapon.name
	}, "currentCount", function ( f2_arg0 )
		local f2_local0 = DataSources.inGame.player.currentWeapon.clipAmmoRight:GetValue( f2_arg0 )
		if DataSources.inGame.player.currentWeapon.name:GetValue( f2_arg0 ) == "apc_target_designator" and f2_local0 ~= nil then
			return f2_local0
		else
			return nil
		end
	end )
	f1_arg0.MissilesReadyText:SubscribeToModel( f1_local0:GetModel( f1_arg1 ), function ()
		if DataSources.inGame.player.currentWeapon.name:GetValue( f1_arg1 ) == "apc_target_designator" then
			local f3_local0 = f1_local0:GetValue( f1_arg1 )
			if f3_local0 ~= nil then
				f1_arg0.MissilesReadyText:setText( ToUpperCase( LocalizeIntoString( f3_local0, "HUD_C12_MISSILE_COUNT" ) ), 0 )
			end
		end
	end )
end

function C12Missiles( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 420 * _1080p, 0, 83 * _1080p )
	self.id = "C12Missiles"
	self._animationSets = {}
	self._sequences = {}
	local f4_local1 = controller and controller.controllerIndex
	if not f4_local1 and not Engine.InFrontend() then
		f4_local1 = self:getRootController()
	end
	assert( f4_local1 )
	local f4_local2 = self
	local Missiles = nil
	
	Missiles = LUI.UIDataSourceGrid.new( nil, {
		maxVisibleColumns = 6,
		maxVisibleRows = 1,
		controllerIndex = f4_local1,
		buildChild = function ()
			return MenuBuilder.BuildRegisteredType( "C12Missile", {
				controllerIndex = f4_local1
			} )
		end,
		wrapX = true,
		wrapY = true,
		spacingX = _1080p * 0,
		spacingY = _1080p * 0,
		columnWidth = _1080p * 70,
		rowHeight = _1080p * 90,
		scrollingThresholdX = 1,
		scrollingThresholdY = 1,
		adjustSizeToContent = false,
		horizontalAlignment = LUI.Alignment.Left,
		verticalAlignment = LUI.Alignment.Top,
		springCoefficient = 400,
		maxVelocity = 5000
	} )
	Missiles.id = "Missiles"
	Missiles:setUseStencil( false )
	Missiles:SetGridDataSource( DataSources.inGame.SP.titan.c12, f4_local1 )
	Missiles:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 420, 0, _1080p * 90 )
	self:addElement( Missiles )
	self.Missiles = Missiles
	
	local MissilesLockedFrame = nil
	
	MissilesLockedFrame = LUI.UIImage.new()
	MissilesLockedFrame.id = "MissilesLockedFrame"
	MissilesLockedFrame:setImage( RegisterMaterial( "hud_c12_missile_text_frame" ), 0 )
	MissilesLockedFrame:SetUseAA( true )
	MissilesLockedFrame:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -475, _1080p * -219, _1080p * 33, _1080p * 64 )
	self:addElement( MissilesLockedFrame )
	self.MissilesLockedFrame = MissilesLockedFrame
	
	local MissilesReadyFrame = nil
	
	MissilesReadyFrame = LUI.UIImage.new()
	MissilesReadyFrame.id = "MissilesReadyFrame"
	MissilesReadyFrame:setImage( RegisterMaterial( "hud_c12_missile_text_frame" ), 0 )
	MissilesReadyFrame:SetUseAA( true )
	MissilesReadyFrame:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -475, _1080p * -219, 0, _1080p * 31 )
	self:addElement( MissilesReadyFrame )
	self.MissilesReadyFrame = MissilesReadyFrame
	
	local MissilesReadyText = nil
	
	MissilesReadyText = LUI.UIText.new()
	MissilesReadyText.id = "MissilesReadyText"
	MissilesReadyText:SetRGBFromTable( SWATCHES.HUD.normal, 0 )
	MissilesReadyText:setText( ToUpperCase( LocalizeIntoString( "", "HUD_C12_MISSILE_COUNT" ) ), 0 )
	MissilesReadyText:SetFontSize( 18 * _1080p )
	MissilesReadyText:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	MissilesReadyText:SetAlignment( LUI.Alignment.Left )
	MissilesReadyText:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -256, _1080p * -18, _1080p * 6.5, _1080p * 24.5 )
	self:addElement( MissilesReadyText )
	self.MissilesReadyText = MissilesReadyText
	
	local MissilesLockedText = nil
	
	MissilesLockedText = LUI.UIText.new()
	MissilesLockedText.id = "MissilesLockedText"
	MissilesLockedText:SetRGBFromTable( SWATCHES.HUD.warning, 0 )
	MissilesLockedText:SetFontSize( 18 * _1080p )
	MissilesLockedText:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	MissilesLockedText:SetAlignment( LUI.Alignment.Left )
	MissilesLockedText:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -256, _1080p * -18, _1080p * 39.5, _1080p * 57.5 )
	MissilesLockedText:SubscribeToModel( DataSources.inGame.HUD.overlay.lockedTargets:GetModel( f4_local1 ), function ()
		local f6_local0 = DataSources.inGame.HUD.overlay.lockedTargets:GetValue( f4_local1 )
		if f6_local0 ~= nil then
			MissilesLockedText:setText( ToUpperCase( LocalizeIntoString( f6_local0, "HUD_C12_TARGET_COUNT" ) ), 0 )
		end
	end )
	self:addElement( MissilesLockedText )
	self.MissilesLockedText = MissilesLockedText
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		Missiles:RegisterAnimationSequence( "Bootup", {
			{
				function ()
					return self.Missiles:SetAlpha( 0, 0 )
				end,
				function ()
					return self.Missiles:SetAlpha( 0, 400 )
				end,
				function ()
					return self.Missiles:SetAlpha( 1, 200, LUI.EASING.outBack )
				end
			},
			{
				function ()
					return self.Missiles:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -30, _1080p * 355, 0, _1080p * 83, 0 )
				end,
				function ()
					return self.Missiles:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -30, _1080p * 355, 0, _1080p * 83, 400 )
				end,
				function ()
					return self.Missiles:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 385, 0, _1080p * 83, 200, LUI.EASING.outBack )
				end
			}
		} )
		MissilesLockedFrame:RegisterAnimationSequence( "Bootup", {
			{
				function ()
					return self.MissilesLockedFrame:SetAlpha( 0, 0 )
				end,
				function ()
					return self.MissilesLockedFrame:SetAlpha( 0, 400 )
				end,
				function ()
					return self.MissilesLockedFrame:SetAlpha( 1, 200, LUI.EASING.outBack )
				end
			},
			{
				function ()
					return self.MissilesLockedFrame:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -429, _1080p * -173, _1080p * 33, _1080p * 64, 0 )
				end,
				function ()
					return self.MissilesLockedFrame:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -449, _1080p * -193, _1080p * 33, _1080p * 64, 400 )
				end,
				function ()
					return self.MissilesLockedFrame:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -475, _1080p * -219, _1080p * 33, _1080p * 64, 200, LUI.EASING.outBack )
				end
			}
		} )
		MissilesReadyFrame:RegisterAnimationSequence( "Bootup", {
			{
				function ()
					return self.MissilesReadyFrame:SetAlpha( 0, 0 )
				end,
				function ()
					return self.MissilesReadyFrame:SetAlpha( 0, 400 )
				end,
				function ()
					return self.MissilesReadyFrame:SetAlpha( 1, 200, LUI.EASING.outBack )
				end
			},
			{
				function ()
					return self.MissilesReadyFrame:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -429, _1080p * -173, 0, _1080p * 31, 0 )
				end,
				function ()
					return self.MissilesReadyFrame:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -449, _1080p * -193, 0, _1080p * 31, 400 )
				end,
				function ()
					return self.MissilesReadyFrame:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -475, _1080p * -219, 0, _1080p * 31, 200, LUI.EASING.outBack )
				end
			}
		} )
		MissilesReadyText:RegisterAnimationSequence( "Bootup", {
			{
				function ()
					return self.MissilesReadyText:SetAlpha( 0, 0 )
				end,
				function ()
					return self.MissilesReadyText:SetAlpha( 0, 400 )
				end,
				function ()
					return self.MissilesReadyText:SetAlpha( 1, 200, LUI.EASING.outBack )
				end
			},
			{
				function ()
					return self.MissilesReadyText:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -230, _1080p * 15, _1080p * 8, _1080p * 26, 0 )
				end,
				function ()
					return self.MissilesReadyText:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -233.5, _1080p * 11.5, _1080p * 7.5, _1080p * 25.5, 400 )
				end,
				function ()
					return self.MissilesReadyText:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -258, _1080p * -18, _1080p * 6.5, _1080p * 24.5, 200, LUI.EASING.outBack )
				end
			}
		} )
		MissilesLockedText:RegisterAnimationSequence( "Bootup", {
			{
				function ()
					return self.MissilesLockedText:SetAlpha( 0, 0 )
				end,
				function ()
					return self.MissilesLockedText:SetAlpha( 0, 400 )
				end,
				function ()
					return self.MissilesLockedText:SetAlpha( 1, 200, LUI.EASING.outBack )
				end
			},
			{
				function ()
					return self.MissilesLockedText:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -230, _1080p * 15, _1080p * 40, _1080p * 58, 0 )
				end,
				function ()
					return self.MissilesLockedText:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -233.5, _1080p * 11.5, _1080p * 39.5, _1080p * 57.5, 400 )
				end,
				function ()
					return self.MissilesLockedText:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -258, _1080p * -18, _1080p * 39.5, _1080p * 57.5, 200, LUI.EASING.outBack )
				end
			}
		} )
		self._sequences.Bootup = function ()
			Missiles:AnimateSequence( "Bootup" )
			MissilesLockedFrame:AnimateSequence( "Bootup" )
			MissilesReadyFrame:AnimateSequence( "Bootup" )
			MissilesReadyText:AnimateSequence( "Bootup" )
			MissilesLockedText:AnimateSequence( "Bootup" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	self:SubscribeToModel( DataSources.inGame.HUD.overlay.isC12Active:GetModel( f4_local1 ), function ()
		if DataSources.inGame.HUD.overlay.isC12Active:GetValue( f4_local1 ) ~= nil and DataSources.inGame.HUD.overlay.isC12Active:GetValue( f4_local1 ) == 1 then
			ACTIONS.AnimateSequence( self, "Bootup" )
		end
	end )
	PostLoadFunc( self, f4_local1, controller )
	return self
end

MenuBuilder.registerType( "C12Missiles", C12Missiles )
LockTable( _M )
