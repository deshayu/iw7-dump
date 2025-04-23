local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ( f1_arg0, f1_arg1, f1_arg2 )
	assert( f1_arg0.Health )
	f1_arg0:SubscribeToModelThroughElement( f1_arg0, "lockState.health", function ()
		local f2_local0 = f1_arg0:GetDataSource()
		f1_arg0.Health:setText( f2_local0.lockState.health:GetValue( f1_arg1 ) .. "%" )
	end )
	if IsLanguageOversizedFont() then
		f1_arg0.Name:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 10, _1080p * 400, _1080p * 0, _1080p * 20 )
		f1_arg0.NameShadow:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 11, _1080p * 400, _1080p * 1, _1080p * 21 )
	end
end

function TargetInfo( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 90 * _1080p, 0, 90 * _1080p )
	self.id = "TargetInfo"
	self._animationSets = {}
	self._sequences = {}
	local f3_local1 = controller and controller.controllerIndex
	if not f3_local1 and not Engine.InFrontend() then
		f3_local1 = self:getRootController()
	end
	assert( f3_local1 )
	local f3_local2 = self
	local StatusSideBar = nil
	
	StatusSideBar = LUI.UIImage.new()
	StatusSideBar.id = "StatusSideBar"
	StatusSideBar:SetAlpha( 0.6, 0 )
	StatusSideBar:SetAnchorsAndPosition( 0, 1, 0, 0, 0, _1080p * 4, _1080p * 8, _1080p * -8 )
	self:addElement( StatusSideBar )
	self.StatusSideBar = StatusSideBar
	
	local HealthBarBackground1 = nil
	
	HealthBarBackground1 = LUI.UIImage.new()
	HealthBarBackground1.id = "HealthBarBackground1"
	HealthBarBackground1:SetAlpha( 0.6, 0 )
	HealthBarBackground1:SetAnchorsAndPosition( 0, 1, 1, 0, _1080p * 10, _1080p * 114, _1080p * -18, _1080p * -12 )
	self:addElement( HealthBarBackground1 )
	self.HealthBarBackground1 = HealthBarBackground1
	
	local HealthBarBackground2 = nil
	
	HealthBarBackground2 = LUI.UIImage.new()
	HealthBarBackground2.id = "HealthBarBackground2"
	HealthBarBackground2:SetRGBFromInt( 3092271, 0 )
	HealthBarBackground2:SetAnchorsAndPosition( 0, 1, 1, 0, _1080p * 10, _1080p * 110, _1080p * -18, _1080p * -12 )
	self:addElement( HealthBarBackground2 )
	self.HealthBarBackground2 = HealthBarBackground2
	
	local HealthBar = nil
	
	HealthBar = LUI.UIImage.new()
	HealthBar.id = "HealthBar"
	HealthBar:SetAnchors( 0, 1, 1, 0, 0 )
	HealthBar:SetLeft( _1080p * 10, 0 )
	HealthBar:SetTop( _1080p * -18, 0 )
	HealthBar:SetBottom( _1080p * -12, 0 )
	HealthBar:SubscribeToModelThroughElement( self, "lockState.health", function ()
		local f4_local0 = self:GetDataSource()
		f4_local0 = f4_local0.lockState.health:GetValue( f3_local1 )
		if f4_local0 ~= nil then
			HealthBar:SetRight( _1080p * Add( f4_local0, 10 ), 0 )
		end
	end )
	self:addElement( HealthBar )
	self.HealthBar = HealthBar
	
	local NameShadow = nil
	
	NameShadow = LUI.UIText.new()
	NameShadow.id = "NameShadow"
	NameShadow:SetRGBFromInt( 0, 0 )
	NameShadow:SetFontSize( 22 * _1080p )
	NameShadow:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	NameShadow:SetAlignment( LUI.Alignment.Left )
	NameShadow:SetOptOutRightToLeftAlignmentFlip( true )
	NameShadow:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 11, _1080p * 400, _1080p * 9, _1080p * 31 )
	NameShadow:SubscribeToModelThroughElement( self, "lockState.name", function ()
		local f5_local0 = self:GetDataSource()
		f5_local0 = f5_local0.lockState.name:GetValue( f3_local1 )
		if f5_local0 ~= nil then
			NameShadow:setText( LocalizeString( f5_local0 ), 0 )
		end
	end )
	self:addElement( NameShadow )
	self.NameShadow = NameShadow
	
	local Name = nil
	
	Name = LUI.UIText.new()
	Name.id = "Name"
	Name:SetFontSize( 22 * _1080p )
	Name:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	Name:SetAlignment( LUI.Alignment.Left )
	Name:SetOptOutRightToLeftAlignmentFlip( true )
	Name:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 10, _1080p * 400, _1080p * 6, _1080p * 28 )
	Name:SubscribeToModelThroughElement( self, "lockState.name", function ()
		local f6_local0 = self:GetDataSource()
		f6_local0 = f6_local0.lockState.name:GetValue( f3_local1 )
		if f6_local0 ~= nil then
			Name:setText( LocalizeString( f6_local0 ), 0 )
		end
	end )
	self:addElement( Name )
	self.Name = Name
	
	local Health = nil
	
	Health = LUI.UIText.new()
	Health.id = "Health"
	Health:setText( MarkLocalized( "100%" ), 0 )
	Health:SetFontSize( 50 * _1080p )
	Health:SetFont( FONTS.GetFont( FONTS.MainExtended.File ) )
	Health:SetAlignment( LUI.Alignment.Left )
	Health:SetOptOutRightToLeftAlignmentFlip( true )
	Health:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 10, _1080p * 150, _1080p * 23, _1080p * 75 )
	self:addElement( Health )
	self.Health = Health
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		StatusSideBar:RegisterAnimationSequence( "Locked", {
			{
				function ()
					return self.StatusSideBar:SetAnchorsAndPosition( 0, 1, 0, 0, _1080p * 118, _1080p * 122, _1080p * 8, _1080p * -8, 0 )
				end,
				function ()
					return self.StatusSideBar:SetAnchorsAndPosition( 0, 1, 0, 0, 0, _1080p * 4, _1080p * 8, _1080p * -8, 250 )
				end
			}
		} )
		self._sequences.Locked = function ()
			StatusSideBar:AnimateSequence( "Locked" )
		end
		
		HealthBar:RegisterAnimationSequence( "HealthLow", {
			{
				function ()
					return self.HealthBar:SetRGBFromInt( 16756480, 0 )
				end
			}
		} )
		Health:RegisterAnimationSequence( "HealthLow", {
			{
				function ()
					return self.Health:SetRGBFromInt( 16756480, 0 )
				end
			}
		} )
		self._sequences.HealthLow = function ()
			HealthBar:AnimateSequence( "HealthLow" )
			Health:AnimateSequence( "HealthLow" )
		end
		
		HealthBar:RegisterAnimationSequence( "HealthCritical", {
			{
				function ()
					return self.HealthBar:SetRGBFromInt( 14745600, 0 )
				end
			}
		} )
		Health:RegisterAnimationSequence( "HealthCritical", {
			{
				function ()
					return self.Health:SetRGBFromInt( 14745600, 0 )
				end
			}
		} )
		self._sequences.HealthCritical = function ()
			HealthBar:AnimateSequence( "HealthCritical" )
			Health:AnimateSequence( "HealthCritical" )
		end
		
		HealthBar:RegisterAnimationSequence( "HealthNormal", {
			{
				function ()
					return self.HealthBar:SetRGBFromInt( 16777215, 0 )
				end
			}
		} )
		Health:RegisterAnimationSequence( "HealthNormal", {
			{
				function ()
					return self.Health:SetRGBFromInt( 16777215, 0 )
				end
			}
		} )
		self._sequences.HealthNormal = function ()
			HealthBar:AnimateSequence( "HealthNormal" )
			Health:AnimateSequence( "HealthNormal" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	self:SubscribeToModelThroughElement( self, "lockState.state", function ()
		local f21_local0 = self:GetDataSource()
		if f21_local0.lockState.state:GetValue( f3_local1 ) ~= nil then
			f21_local0 = self:GetDataSource()
			if f21_local0.lockState.state:GetValue( f3_local1 ) ~= 1 then
				f21_local0 = self:GetDataSource()
				if f21_local0.lockState.state:GetValue( f3_local1 ) ~= nil then
					f21_local0 = self:GetDataSource()
					if f21_local0.lockState.state:GetValue( f3_local1 ) == 3 then
						ACTIONS.AnimateSequence( self, "Locked" )
					end
				end
			else
				ACTIONS.AnimateSequence( self, "Locked" )
			end
		else
			f21_local0 = self:GetDataSource()
			if f21_local0.lockState.state:GetValue( f3_local1 ) ~= nil then
				f21_local0 = self:GetDataSource()
				if f21_local0.lockState.state:GetValue( f3_local1 ) == 3 then
					ACTIONS.AnimateSequence( self, "Locked" )
				end
			end
		end
	end )
	self:SubscribeToModelThroughElement( self, "lockState.health", function ()
		local f22_local0 = self:GetDataSource()
		if f22_local0.lockState.health:GetValue( f3_local1 ) ~= nil then
			f22_local0 = self:GetDataSource()
			if f22_local0.lockState.health:GetValue( f3_local1 ) <= 67 then
				f22_local0 = self:GetDataSource()
				if f22_local0.lockState.health:GetValue( f3_local1 ) ~= nil then
					f22_local0 = self:GetDataSource()
					if f22_local0.lockState.health:GetValue( f3_local1 ) > 34 then
						ACTIONS.AnimateSequence( self, "HealthLow" )
					end
				end
			end
		end
		f22_local0 = self:GetDataSource()
		if f22_local0.lockState.health:GetValue( f3_local1 ) ~= nil then
			f22_local0 = self:GetDataSource()
			if f22_local0.lockState.health:GetValue( f3_local1 ) <= 34 then
				ACTIONS.AnimateSequence( self, "HealthCritical" )
			end
		end
		f22_local0 = self:GetDataSource()
		if f22_local0.lockState.health:GetValue( f3_local1 ) ~= nil then
			f22_local0 = self:GetDataSource()
			if f22_local0.lockState.health:GetValue( f3_local1 ) > 67 then
				ACTIONS.AnimateSequence( self, "HealthNormal" )
			end
		end
	end )
	f0_local0( self, f3_local1, controller )
	return self
end

MenuBuilder.registerType( "TargetInfo", TargetInfo )
LockTable( _M )
