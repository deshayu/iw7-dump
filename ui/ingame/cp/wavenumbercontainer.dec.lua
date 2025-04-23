local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function WaveNumberContainer( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 1920 * _1080p, 0, 1080 * _1080p )
	self.id = "WaveNumberContainer"
	self._animationSets = {}
	self._sequences = {}
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local f1_local3 = nil
	if not CONDITIONS.JustPlayedBossBattle( self ) then
		f1_local3 = MenuBuilder.BuildRegisteredType( "WaveNumber", {
			controllerIndex = f1_local1
		} )
		f1_local3.id = "WaveNumber"
		f1_local3:SetYRotation( 16, 0 )
		f1_local3:SetZRotation( 13, 0 )
		f1_local3:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -219, _1080p * -5, _1080p * 21.5, _1080p * 116.5 )
		self:addElement( f1_local3 )
		self.WaveNumber = f1_local3
	end
	local f1_local4 = nil
	if CONDITIONS.IsDLC2( self ) then
		f1_local4 = LUI.UIImage.new()
		f1_local4.id = "cueMark"
		f1_local4:SetAlpha( 0, 0 )
		f1_local4:setImage( RegisterMaterial( "cp_disco_cue_mark" ), 0 )
		f1_local4:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1573, _1080p * 1701, _1080p * 170, _1080p * 234 )
		self:addElement( f1_local4 )
		self.cueMark = f1_local4
	end
	self._animationSets.DefaultAnimationSet = function ()
		if CONDITIONS.IsDLC2( self ) then
			f1_local4:RegisterAnimationSequence( "DefaultSequence", {
				{
					function ()
						return self.cueMark:SetAlpha( 0, 0 )
					end
				}
			} )
		end
		self._sequences.DefaultSequence = function ()
			if CONDITIONS.IsDLC2( self ) then
				f1_local4:AnimateSequence( "DefaultSequence" )
			end
		end
		
		if CONDITIONS.IsDLC2( self ) then
			f1_local4:RegisterAnimationSequence( "Long", {
				{
					function ()
						return self.cueMark:SetAlpha( 1, 0 )
					end,
					function ()
						return self.cueMark:SetAlpha( 1, 1000 )
					end,
					function ()
						return self.cueMark:SetAlpha( 0, 10 )
					end,
					function ()
						return self.cueMark:SetAlpha( 0, 1000 )
					end,
					function ()
						return self.cueMark:SetAlpha( 1, 10 )
					end,
					function ()
						return self.cueMark:SetAlpha( 1, 1010 )
					end,
					function ()
						return self.cueMark:SetAlpha( 0, 10 )
					end,
					function ()
						return self.cueMark:SetAlpha( 0, 1000 )
					end,
					function ()
						return self.cueMark:SetAlpha( 1, 10 )
					end,
					function ()
						return self.cueMark:SetAlpha( 1, 1000 )
					end,
					function ()
						return self.cueMark:SetAlpha( 0, 10 )
					end,
					function ()
						return self.cueMark:SetAlpha( 0, 1000 )
					end,
					function ()
						return self.cueMark:SetAlpha( 1, 10 )
					end,
					function ()
						return self.cueMark:SetAlpha( 1, 1000 )
					end,
					function ()
						return self.cueMark:SetAlpha( 0, 10 )
					end
				}
			} )
		end
		self._sequences.Long = function ()
			if CONDITIONS.IsDLC2( self ) then
				f1_local4:AnimateSequence( "Long" )
			end
		end
		
		if CONDITIONS.IsDLC2( self ) then
			f1_local4:RegisterAnimationSequence( "First", {
				{
					function ()
						return self.cueMark:SetAlpha( 1, 0 )
					end,
					function ()
						return self.cueMark:SetAlpha( 1, 480 )
					end,
					function ()
						return self.cueMark:SetAlpha( 0, 10 )
					end,
					function ()
						return self.cueMark:SetAlpha( 0, 510 )
					end,
					function ()
						return self.cueMark:SetAlpha( 1, 10 )
					end,
					function ()
						return self.cueMark:SetAlpha( 1, 500 )
					end,
					function ()
						return self.cueMark:SetAlpha( 0, 10 )
					end,
					function ()
						return self.cueMark:SetAlpha( 0, 510 )
					end,
					function ()
						return self.cueMark:SetAlpha( 1, 10 )
					end,
					function ()
						return self.cueMark:SetAlpha( 1, 470 )
					end,
					function ()
						return self.cueMark:SetAlpha( 0, 10 )
					end,
					function ()
						return self.cueMark:SetAlpha( 0, 470 )
					end,
					function ()
						return self.cueMark:SetAlpha( 1, 10 )
					end,
					function ()
						return self.cueMark:SetAlpha( 1, 510 )
					end,
					function ()
						return self.cueMark:SetAlpha( 0, 10 )
					end
				}
			} )
		end
		self._sequences.First = function ()
			if CONDITIONS.IsDLC2( self ) then
				f1_local4:AnimateSequence( "First" )
			end
		end
		
		if CONDITIONS.IsDLC2( self ) then
			f1_local4:RegisterAnimationSequence( "Second", {
				{
					function ()
						return self.cueMark:SetAlpha( 1, 0 )
					end,
					function ()
						return self.cueMark:SetAlpha( 1, 480 )
					end,
					function ()
						return self.cueMark:SetAlpha( 0, 10 )
					end,
					function ()
						return self.cueMark:SetAlpha( 0, 510 )
					end,
					function ()
						return self.cueMark:SetAlpha( 1, 10 )
					end,
					function ()
						return self.cueMark:SetAlpha( 1, 500 )
					end,
					function ()
						return self.cueMark:SetAlpha( 0, 10 )
					end,
					function ()
						return self.cueMark:SetAlpha( 0, 510 )
					end,
					function ()
						return self.cueMark:SetAlpha( 1, 10 )
					end,
					function ()
						return self.cueMark:SetAlpha( 1, 470 )
					end,
					function ()
						return self.cueMark:SetAlpha( 0, 10 )
					end
				}
			} )
		end
		self._sequences.Second = function ()
			if CONDITIONS.IsDLC2( self ) then
				f1_local4:AnimateSequence( "Second" )
			end
		end
		
		if CONDITIONS.IsDLC2( self ) then
			f1_local4:RegisterAnimationSequence( "Third", {
				{
					function ()
						return self.cueMark:SetAlpha( 1, 0 )
					end,
					function ()
						return self.cueMark:SetAlpha( 1, 480 )
					end,
					function ()
						return self.cueMark:SetAlpha( 0, 10 )
					end,
					function ()
						return self.cueMark:SetAlpha( 0, 510 )
					end,
					function ()
						return self.cueMark:SetAlpha( 1, 10 )
					end,
					function ()
						return self.cueMark:SetAlpha( 1, 500 )
					end,
					function ()
						return self.cueMark:SetAlpha( 0, 10 )
					end
				}
			} )
		end
		self._sequences.Third = function ()
			if CONDITIONS.IsDLC2( self ) then
				f1_local4:AnimateSequence( "Third" )
			end
		end
		
		if CONDITIONS.IsDLC2( self ) then
			f1_local4:RegisterAnimationSequence( "Fourth", {
				{
					function ()
						return self.cueMark:SetAlpha( 1, 0 )
					end,
					function ()
						return self.cueMark:SetAlpha( 1, 480 )
					end,
					function ()
						return self.cueMark:SetAlpha( 0, 10 )
					end
				}
			} )
		end
		self._sequences.Fourth = function ()
			if CONDITIONS.IsDLC2( self ) then
				f1_local4:AnimateSequence( "Fourth" )
			end
		end
		
		if not CONDITIONS.JustPlayedBossBattle( self ) then
			f1_local3:RegisterAnimationSequence( "bosshide", {
				{
					function ()
						return self.WaveNumber:SetAlpha( 0, 0 )
					end
				}
			} )
		end
		if CONDITIONS.IsDLC2( self ) then
			f1_local4:RegisterAnimationSequence( "bosshide", {
				{
					function ()
						return self.cueMark:SetAlpha( 0, 10 )
					end
				}
			} )
		end
		self._sequences.bosshide = function ()
			if not CONDITIONS.JustPlayedBossBattle( self ) then
				f1_local3:AnimateSequence( "bosshide" )
			end
			if CONDITIONS.IsDLC2( self ) then
				f1_local4:AnimateSequence( "bosshide" )
			end
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	self:SubscribeToModel( DataSources.inGame.CP.zombies.escape.gateScore:GetModel( f1_local1 ), function ()
		if DataSources.inGame.CP.zombies.escape.gateScore:GetValue( f1_local1 ) ~= nil and DataSources.inGame.CP.zombies.escape.gateScore:GetValue( f1_local1 ) == 4 and CONDITIONS.IsDLC2( self ) then
			ACTIONS.AnimateSequence( self, "First" )
		end
		if DataSources.inGame.CP.zombies.escape.gateScore:GetValue( f1_local1 ) ~= nil and DataSources.inGame.CP.zombies.escape.gateScore:GetValue( f1_local1 ) == 3 and CONDITIONS.IsDLC2( self ) then
			ACTIONS.AnimateSequence( self, "Second" )
		end
		if DataSources.inGame.CP.zombies.escape.gateScore:GetValue( f1_local1 ) ~= nil and DataSources.inGame.CP.zombies.escape.gateScore:GetValue( f1_local1 ) == 2 and CONDITIONS.IsDLC2( self ) then
			ACTIONS.AnimateSequence( self, "Third" )
		end
		if DataSources.inGame.CP.zombies.escape.gateScore:GetValue( f1_local1 ) ~= nil and DataSources.inGame.CP.zombies.escape.gateScore:GetValue( f1_local1 ) == 1 and CONDITIONS.IsDLC2( self ) then
			ACTIONS.AnimateSequence( self, "Fourth" )
		end
	end )
	self:SubscribeToModel( DataSources.inGame.CP.zombies.bossSplash:GetModel( f1_local1 ), function ()
		if DataSources.inGame.CP.zombies.bossSplash:GetValue( f1_local1 ) ~= nil and DataSources.inGame.CP.zombies.bossSplash:GetValue( f1_local1 ) >= 1 then
			ACTIONS.AnimateSequence( self, "bosshide" )
		end
	end )
	ACTIONS.AnimateSequence( self, "DefaultSequence" )
	return self
end

MenuBuilder.registerType( "WaveNumberContainer", WaveNumberContainer )
LockTable( _M )
