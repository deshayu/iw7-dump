local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function LockonTarget( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 90 * _1080p, 0, 90 * _1080p )
	self.id = "LockonTarget"
	self._animationSets = {}
	self._sequences = {}
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local f1_local3 = nil
	if not Engine.IsMultiplayer() and not Engine.InFrontend() then
		f1_local3 = LUI.UIImage.new()
		f1_local3.id = "TargetValid"
		f1_local3:SetAlpha( 0.5, 0 )
		f1_local3:setImage( RegisterMaterial( "iw7_reticle_lockon_valid" ), 0 )
		f1_local3:SetUseAA( true )
		f1_local3:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * 8, _1080p * -8, _1080p * 8, _1080p * -8 )
		self:addElement( f1_local3 )
		self.TargetValid = f1_local3
	end
	local f1_local4 = nil
	if not Engine.IsMultiplayer() and not Engine.InFrontend() then
		f1_local4 = LUI.UIImage.new()
		f1_local4.id = "TargetLocked"
		f1_local4:SetAlpha( 0, 0 )
		f1_local4:setImage( RegisterMaterial( "iw7_reticle_lockon_lock" ), 0 )
		f1_local4:SetUseAA( true )
		self:addElement( f1_local4 )
		self.TargetLocked = f1_local4
	end
	local TargetInfo = nil
	
	TargetInfo = MenuBuilder.BuildRegisteredType( "TargetInfo", {
		controllerIndex = f1_local1
	} )
	TargetInfo.id = "TargetInfo"
	TargetInfo:SetAlpha( 0, 0 )
	TargetInfo:SetDataSourceThroughElement( self, nil )
	TargetInfo:SetAnchorsAndPosition( 0, 1, 0, 0, _1080p * 86, _1080p * 350.23, 0, 0 )
	self:addElement( TargetInfo )
	self.TargetInfo = TargetInfo
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		if not Engine.IsMultiplayer() and not Engine.InFrontend() then
			f1_local4:RegisterAnimationSequence( "LockingOn", {
				{
					function ()
						return self.TargetLocked:SetAlpha( 0, 0 )
					end,
					function ()
						return self.TargetLocked:SetAlpha( 0.5, 500 )
					end
				},
				{
					function ()
						return self.TargetLocked:SetZRotation( 180, 0 )
					end,
					function ()
						return self.TargetLocked:SetZRotation( 0, 500 )
					end
				},
				{
					function ()
						return self.TargetLocked:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * -128, _1080p * 128, _1080p * -128, _1080p * 128, 0 )
					end,
					function ()
						return self.TargetLocked:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, 0, 0, 500 )
					end
				}
			} )
		end
		self._sequences.LockingOn = function ()
			if not Engine.IsMultiplayer() and not Engine.InFrontend() then
				f1_local4:AnimateSequence( "LockingOn" )
			end
		end
		
		if not Engine.IsMultiplayer() and not Engine.InFrontend() then
			f1_local3:RegisterAnimationSequence( "Locked", {
				{
					function ()
						return self.TargetValid:SetRGBFromInt( 16777215, 0 )
					end,
					function ()
						return self.TargetValid:SetRGBFromInt( 16711680, 100 )
					end
				},
				{
					function ()
						return self.TargetValid:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * 8, _1080p * -8, _1080p * 8, _1080p * -8, 0 )
					end,
					function ()
						return self.TargetValid:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, 0, 0, 50 )
					end,
					function ()
						return self.TargetValid:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * 8, _1080p * -8, _1080p * 8, _1080p * -8, 50 )
					end
				}
			} )
		end
		if not Engine.IsMultiplayer() and not Engine.InFrontend() then
			f1_local4:RegisterAnimationSequence( "Locked", {
				{
					function ()
						return self.TargetLocked:SetRGBFromInt( 16777215, 0 )
					end,
					function ()
						return self.TargetLocked:SetRGBFromInt( 16711680, 100 )
					end
				},
				{
					function ()
						return self.TargetLocked:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, 0, _1080p * 1, 0 )
					end,
					function ()
						return self.TargetLocked:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * 8, _1080p * -8, _1080p * 8, _1080p * -8, 50 )
					end,
					function ()
						return self.TargetLocked:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * -4, _1080p * 4, _1080p * -4, _1080p * 4, 50 )
					end
				}
			} )
		end
		self._sequences.Locked = function ()
			if not Engine.IsMultiplayer() and not Engine.InFrontend() then
				f1_local3:AnimateSequence( "Locked" )
			end
			if not Engine.IsMultiplayer() and not Engine.InFrontend() then
				f1_local4:AnimateSequence( "Locked" )
			end
		end
		
		TargetInfo:RegisterAnimationSequence( "LockedInfo", {
			{
				function ()
					return self.TargetInfo:SetAlpha( 0, 0 )
				end,
				function ()
					return self.TargetInfo:SetAlpha( 1, 250 )
				end
			}
		} )
		self._sequences.LockedInfo = function ()
			TargetInfo:AnimateSequence( "LockedInfo" )
		end
		
		if not Engine.IsMultiplayer() and not Engine.InFrontend() then
			f1_local3:RegisterAnimationSequence( "InfoOnly", {
				{
					function ()
						return self.TargetValid:SetAlpha( 0, 0 )
					end
				}
			} )
		end
		if not Engine.IsMultiplayer() and not Engine.InFrontend() then
			f1_local4:RegisterAnimationSequence( "InfoOnly", {
				{
					function ()
						return self.TargetLocked:SetAlpha( 0, 0 )
					end
				}
			} )
		end
		self._sequences.InfoOnly = function ()
			if not Engine.IsMultiplayer() and not Engine.InFrontend() then
				f1_local3:AnimateSequence( "InfoOnly" )
			end
			if not Engine.IsMultiplayer() and not Engine.InFrontend() then
				f1_local4:AnimateSequence( "InfoOnly" )
			end
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	TargetInfo:SetDataSourceThroughElement( self, nil )
	self:SubscribeToModelThroughElement( self, "lockState.state", function ()
		local f28_local0 = self:GetDataSource()
		if f28_local0.lockState.state:GetValue( f1_local1 ) ~= nil then
			f28_local0 = self:GetDataSource()
			if f28_local0.lockState.state:GetValue( f1_local1 ) == 1 then
				ACTIONS.AnimateSequence( self, "LockingOn" )
			end
		end
		f28_local0 = self:GetDataSource()
		if f28_local0.lockState.state:GetValue( f1_local1 ) ~= nil then
			f28_local0 = self:GetDataSource()
			if f28_local0.lockState.state:GetValue( f1_local1 ) == 2 then
				ACTIONS.AnimateSequence( self, "Locked" )
			end
		end
		f28_local0 = self:GetDataSource()
		if f28_local0.lockState.state:GetValue( f1_local1 ) ~= nil then
			f28_local0 = self:GetDataSource()
			if f28_local0.lockState.state:GetValue( f1_local1 ) == 1 then
				f28_local0 = self:GetDataSource()
				if f28_local0.lockState.name:GetValue( f1_local1 ) ~= nil then
					f28_local0 = self:GetDataSource()
					if f28_local0.lockState.name:GetValue( f1_local1 ) ~= "none" then
						ACTIONS.AnimateSequence( self, "LockedInfo" )
					end
				end
			end
		end
		f28_local0 = self:GetDataSource()
		if f28_local0.lockState.state:GetValue( f1_local1 ) ~= nil then
			f28_local0 = self:GetDataSource()
			if f28_local0.lockState.state:GetValue( f1_local1 ) == 3 then
				ACTIONS.AnimateSequence( self, "LockedInfo" )
				ACTIONS.AnimateSequence( self, "InfoOnly" )
			end
		end
	end )
	return self
end

MenuBuilder.registerType( "LockonTarget", LockonTarget )
LockTable( _M )
