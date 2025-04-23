local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function ZomPerksWidget( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 637 * _1080p, 0, 64 * _1080p )
	self.id = "ZomPerksWidget"
	self._animationSets = {}
	self._sequences = {}
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local PerkList = nil
	
	PerkList = LUI.UIDataSourceToggleList.new( nil, {
		listDataSource = DataSources.inGame.CP.zombies.perks.activePerks,
		controlDataSource = DataSources.inGame.CP.zombies.perks.activePerkBits,
		buildChild = function ()
			return MenuBuilder.BuildRegisteredType( "CPPerkIcon", {
				controllerIndex = f1_local1
			} )
		end,
		controller = f1_local1,
		orderedIndices = false,
		direction = LUI.DIRECTION.horizontal,
		horizontalAlignment = LUI.Alignment.Center,
		verticalAlignment = LUI.Alignment.None,
		animateInDuration = 500,
		animateOutDuration = 500,
		animationVariance = 100
	} )
	PerkList.id = "PerkList"
	PerkList:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * 3, 0, 0, _1080p * -64 )
	self:addElement( PerkList )
	self.PerkList = PerkList
	
	local f1_local4 = nil
	if CONDITIONS.IsRave( self ) then
		f1_local4 = LUI.UIImage.new()
		f1_local4.id = "saw"
		f1_local4:SetAlpha( 0, 0 )
		f1_local4:SetScale( -0.71, 0 )
		f1_local4:setImage( RegisterMaterial( "zm_dlc1_perks_saw_small" ), 0 )
		f1_local4:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -307.72, _1080p * -179.72, _1080p * -224, _1080p * -96 )
		self:addElement( f1_local4 )
		self.saw = f1_local4
	end
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		if CONDITIONS.IsRave( self ) then
			f1_local4:RegisterAnimationSequence( "sawRight", {
				{
					function ()
						return self.saw:SetAlpha( 1, 0 )
					end,
					function ()
						return self.saw:SetAlpha( 1, 1010 )
					end,
					function ()
						return self.saw:SetAlpha( 0, 20 )
					end
				},
				{
					function ()
						return self.saw:SetZRotation( 0, 0 )
					end,
					function ()
						return self.saw:SetZRotation( -1080, 1030 )
					end
				},
				{
					function ()
						return self.saw:SetScale( -0.86, 0 )
					end
				},
				{
					function ()
						return self.saw:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -301.72, _1080p * 210.28, _1080p * -234, _1080p * 278, 0 )
					end,
					function ()
						return self.saw:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 432.28, _1080p * 944.28, _1080p * -234, _1080p * 278, 1029 )
					end
				}
			} )
		end
		self._sequences.sawRight = function ()
			if CONDITIONS.IsRave( self ) then
				f1_local4:AnimateSequence( "sawRight" )
			end
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	self:SubscribeToModel( DataSources.inGame.CP.zombies.coasterTickets:GetModel( f1_local1 ), function ()
		if DataSources.inGame.CP.zombies.coasterTickets:GetValue( f1_local1 ) ~= nil and DataSources.inGame.CP.zombies.coasterTickets:GetValue( f1_local1 ) == 1 and CONDITIONS.IsRave( self ) then
			ACTIONS.AnimateSequence( self, "sawRight" )
		end
	end )
	return self
end

MenuBuilder.registerType( "ZomPerksWidget", ZomPerksWidget )
LockTable( _M )
