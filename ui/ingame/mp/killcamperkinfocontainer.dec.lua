local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ( f1_arg0, f1_arg1, f1_arg2 )
	local f1_local0 = DataSources.inGame.player.super.superMeterImageLarge
	f1_arg0:SubscribeToModel( f1_local0:GetModel( f1_arg1 ), function ()
		local f2_local0 = f1_local0:GetValue( f1_arg1 )
		if f2_local0 == nil or f2_local0 == "" then
			f1_arg0.SmallSuperIcon:SetAlpha( 0, 0 )
		else
			f1_arg0.SmallSuperIcon:SetAlpha( 1, 0 )
		end
	end )
	f1_arg0:SubscribeToModel( DataSources.inGame.MP.killcam.killedby.perkListCount:GetModel( f1_arg1 ), function ()
		local f3_local0 = DataSources.inGame.MP.killcam.killedby.perkListCount:GetValue( f1_arg1 )
		if f3_local0 ~= nil then
			local f3_local1 = math.min( f3_local0, 3 )
			f1_arg0.SmallSuperIcon:SetLeft( (f3_local1 * 64 + 20) * _1080p, 0 )
			f1_arg0.SmallSuperIcon:SetRight( (f3_local1 * 64 + 100) * _1080p, 0 )
			f1_arg0.PerkBackground:SetRight( (f3_local1 * 64 + 10) * _1080p, 0 )
		end
	end )
end

function KillcamPerkInfoContainer( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 384 * _1080p, 0, 100 * _1080p )
	self.id = "KillcamPerkInfoContainer"
	self._animationSets = {}
	self._sequences = {}
	local f4_local1 = controller and controller.controllerIndex
	if not f4_local1 and not Engine.InFrontend() then
		f4_local1 = self:getRootController()
	end
	assert( f4_local1 )
	local f4_local2 = self
	local SmallTacticalIcon = nil
	
	SmallTacticalIcon = LUI.UIImage.new()
	SmallTacticalIcon.id = "SmallTacticalIcon"
	SmallTacticalIcon:SetAnchorsAndPosition( 0, 1, 0, 0, _1080p * 370, _1080p * 416, _1080p * 53, 0 )
	SmallTacticalIcon:SubscribeToModel( DataSources.inGame.player.secondaryPower.icon:GetModel( f4_local1 ), function ()
		local f5_local0 = DataSources.inGame.player.secondaryPower.icon:GetValue( f4_local1 )
		if f5_local0 ~= nil then
			SmallTacticalIcon:setImage( RegisterMaterial( f5_local0 ), 0 )
		end
	end )
	self:addElement( SmallTacticalIcon )
	self.SmallTacticalIcon = SmallTacticalIcon
	
	local SmallLethalIcon = nil
	
	SmallLethalIcon = LUI.UIImage.new()
	SmallLethalIcon.id = "SmallLethalIcon"
	SmallLethalIcon:SetAnchorsAndPosition( 0, 1, 0, 0, _1080p * 370, _1080p * 416, 0, _1080p * -53.5 )
	SmallLethalIcon:SubscribeToModel( DataSources.inGame.player.primaryPower.icon:GetModel( f4_local1 ), function ()
		local f6_local0 = DataSources.inGame.player.primaryPower.icon:GetValue( f4_local1 )
		if f6_local0 ~= nil then
			SmallLethalIcon:setImage( RegisterMaterial( f6_local0 ), 0 )
		end
	end )
	self:addElement( SmallLethalIcon )
	self.SmallLethalIcon = SmallLethalIcon
	
	local SmallTraitIcon = nil
	
	SmallTraitIcon = LUI.UIImage.new()
	SmallTraitIcon.id = "SmallTraitIcon"
	SmallTraitIcon:SetAnchorsAndPosition( 0, 1, 0, 0, _1080p * 299, _1080p * 370, _1080p * 15, _1080p * -15 )
	SmallTraitIcon:SubscribeToModel( DataSources.inGame.player.trait.traitImageSmall:GetModel( f4_local1 ), function ()
		local f7_local0 = DataSources.inGame.player.trait.traitImageSmall:GetValue( f4_local1 )
		if f7_local0 ~= nil then
			SmallTraitIcon:setImage( RegisterMaterial( f7_local0 ), 0 )
		end
	end )
	self:addElement( SmallTraitIcon )
	self.SmallTraitIcon = SmallTraitIcon
	
	local PerkBackground = nil
	
	PerkBackground = LUI.UIImage.new()
	PerkBackground.id = "PerkBackground"
	PerkBackground:SetRGBFromInt( 0, 0 )
	PerkBackground:SetAlpha( 0.5, 0 )
	PerkBackground:SetAnchorsAndPosition( 0, 1, 0, 0, _1080p * -10, _1080p * 205, 0, 0 )
	self:addElement( PerkBackground )
	self.PerkBackground = PerkBackground
	
	local SmallSuperIcon = nil
	
	SmallSuperIcon = LUI.UIImage.new()
	SmallSuperIcon.id = "SmallSuperIcon"
	SmallSuperIcon:SetAnchorsAndPosition( 0, 1, 0, 0, _1080p * 196, _1080p * 267, _1080p * 15, _1080p * -15 )
	SmallSuperIcon:SubscribeToModel( DataSources.inGame.player.super.superMeterImageLarge:GetModel( f4_local1 ), function ()
		local f8_local0 = DataSources.inGame.player.super.superMeterImageLarge:GetValue( f4_local1 )
		if f8_local0 ~= nil then
			SmallSuperIcon:setImage( RegisterMaterial( f8_local0 ), 0 )
		end
	end )
	self:addElement( SmallSuperIcon )
	self.SmallSuperIcon = SmallSuperIcon
	
	local PerkListGrid = nil
	
	PerkListGrid = LUI.UIDataSourceGrid.new( nil, {
		maxVisibleColumns = 3,
		maxVisibleRows = 2,
		controllerIndex = f4_local1,
		buildChild = function ()
			return MenuBuilder.BuildRegisteredType( "KillcamPerkInfo", {
				controllerIndex = f4_local1
			} )
		end,
		wrapX = true,
		wrapY = true,
		spacingX = _1080p * 0,
		spacingY = _1080p * 0,
		columnWidth = _1080p * 64,
		rowHeight = _1080p * 64,
		scrollingThresholdX = 1,
		scrollingThresholdY = 1,
		adjustSizeToContent = false,
		horizontalAlignment = LUI.Alignment.Left,
		verticalAlignment = LUI.Alignment.Middle,
		springCoefficient = 400,
		maxVelocity = 5000
	} )
	PerkListGrid.id = "PerkListGrid"
	PerkListGrid:setUseStencil( true )
	PerkListGrid:SetGridDataSourceThroughElement( self, nil )
	PerkListGrid:SetAnchorsAndPosition( 0, 1, 0.5, 0.5, 0, _1080p * 192, _1080p * -64, _1080p * 64 )
	self:addElement( PerkListGrid )
	self.PerkListGrid = PerkListGrid
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		SmallTraitIcon:RegisterAnimationSequence( "HideIcon", {
			{
				function ()
					return self.SmallTraitIcon:SetAlpha( 0, 10 )
				end
			}
		} )
		self._sequences.HideIcon = function ()
			SmallTraitIcon:AnimateSequence( "HideIcon" )
		end
		
		SmallTraitIcon:RegisterAnimationSequence( "ShowIcon", {
			{
				function ()
					return self.SmallTraitIcon:SetAlpha( 1, 100 )
				end
			}
		} )
		self._sequences.ShowIcon = function ()
			SmallTraitIcon:AnimateSequence( "ShowIcon" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	SmallTraitIcon:SubscribeToModel( DataSources.inGame.player.trait.traitRef:GetModel( f4_local1 ), function ()
		if DataSources.inGame.player.trait.traitRef:GetValue( f4_local1 ) ~= nil and DataSources.inGame.player.trait.traitRef:GetValue( f4_local1 ) == -1 then
			ACTIONS.AnimateSequence( self, "HideIcon" )
		end
		if DataSources.inGame.player.trait.traitRef:GetValue( f4_local1 ) ~= nil and DataSources.inGame.player.trait.traitRef:GetValue( f4_local1 ) > -1 then
			ACTIONS.AnimateSequence( self, "ShowIcon" )
		end
	end )
	f0_local0( self, f4_local1, controller )
	return self
end

MenuBuilder.registerType( "KillcamPerkInfoContainer", KillcamPerkInfoContainer )
LockTable( _M )
