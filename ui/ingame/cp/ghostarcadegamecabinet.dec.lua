local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function PostLoadFunc( f1_arg0, f1_arg1 )
	f1_arg0:SetupInWorldElement( {} )
	f1_arg0:SetInWorldScale( 0.05 )
	if CONDITIONS.IsRave( f1_arg0 ) then
		f1_arg0:SetWorldSpacePosition( -282.3, -1482.95, 435 )
		f1_arg0:SetWorldSpacePitch( 0 )
		f1_arg0:SetWorldSpaceYaw( 270 )
		f1_arg0:SetWorldSpaceRoll( -48 )
	elseif CONDITIONS.IsDLC2( f1_arg0 ) then
		f1_arg0:SetWorldSpacePosition( -714.4, 2610.1, 938.8 )
		f1_arg0:SetWorldSpacePitch( 0 )
		f1_arg0:SetWorldSpaceYaw( 270 )
		f1_arg0:SetWorldSpaceRoll( -48 )
	elseif CONDITIONS.IsDLC3( f1_arg0 ) then
		f1_arg0:SetWorldSpacePosition( 5458.1, -4767.3, 27.4 )
		f1_arg0:SetWorldSpacePitch( 0 )
		f1_arg0:SetWorldSpaceYaw( -45 )
		f1_arg0:SetWorldSpaceRoll( -48 )
	elseif CONDITIONS.IsDLC4( f1_arg0 ) then
		f1_arg0:SetWorldSpacePosition( 5638, -6260, 103 )
		f1_arg0:SetWorldSpacePitch( 0 )
		f1_arg0:SetWorldSpaceYaw( 180 )
		f1_arg0:SetWorldSpaceRoll( -48 )
	else
		f1_arg0:SetWorldSpacePosition( 2859, -556.5, 283 )
		f1_arg0:SetWorldSpacePitch( 0 )
		f1_arg0:SetWorldSpaceYaw( 180 )
		f1_arg0:SetWorldSpaceRoll( -48 )
	end
end

function ghostArcadeGameCabinet( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 1920 * _1080p, 0, 1080 * _1080p )
	self.id = "ghostArcadeGameCabinet"
	self._animationSets = {}
	self._sequences = {}
	local f2_local1 = controller and controller.controllerIndex
	if not f2_local1 and not Engine.InFrontend() then
		f2_local1 = self:getRootController()
	end
	assert( f2_local1 )
	local f2_local2 = self
	local credit0 = nil
	
	credit0 = LUI.UIImage.new()
	credit0.id = "credit0"
	credit0:setImage( RegisterMaterial( "ghosts_skulls_screen_00" ), 0 )
	credit0:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 747, _1080p * 1182, _1080p * 216, _1080p * 712 )
	credit0:BindAlphaToModel( DataSources.inGame.CP.zombies.ghostArcadeCoin0Alpha:GetModel( f2_local1 ) )
	self:addElement( credit0 )
	self.credit0 = credit0
	
	local credit1 = nil
	
	credit1 = LUI.UIImage.new()
	credit1.id = "credit1"
	credit1:setImage( RegisterMaterial( "ghosts_skulls_screen_01" ), 0 )
	credit1:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 747, _1080p * 1182, _1080p * 216, _1080p * 712 )
	credit1:BindAlphaToModel( DataSources.inGame.CP.zombies.ghostArcadeCoin1Alpha:GetModel( f2_local1 ) )
	self:addElement( credit1 )
	self.credit1 = credit1
	
	local credit2 = nil
	
	credit2 = LUI.UIImage.new()
	credit2.id = "credit2"
	credit2:setImage( RegisterMaterial( "ghosts_skulls_screen_02" ), 0 )
	credit2:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 747, _1080p * 1182, _1080p * 216, _1080p * 712 )
	credit2:BindAlphaToModel( DataSources.inGame.CP.zombies.ghostArcadeCoin2Alpha:GetModel( f2_local1 ) )
	self:addElement( credit2 )
	self.credit2 = credit2
	
	local credit3 = nil
	
	credit3 = LUI.UIImage.new()
	credit3.id = "credit3"
	credit3:setImage( RegisterMaterial( "ghosts_skulls_screen_03" ), 0 )
	credit3:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 747, _1080p * 1182, _1080p * 216, _1080p * 712 )
	credit3:BindAlphaToModel( DataSources.inGame.CP.zombies.ghostArcadeCoin3Alpha:GetModel( f2_local1 ) )
	self:addElement( credit3 )
	self.credit3 = credit3
	
	local credit4 = nil
	
	credit4 = LUI.UIImage.new()
	credit4.id = "credit4"
	credit4:setImage( RegisterMaterial( "ghosts_skulls_screen_04" ), 0 )
	credit4:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 747, _1080p * 1182, _1080p * 216, _1080p * 712 )
	credit4:BindAlphaToModel( DataSources.inGame.CP.zombies.ghostArcadeCoin4Alpha:GetModel( f2_local1 ) )
	self:addElement( credit4 )
	self.credit4 = credit4
	
	local credit5 = nil
	
	credit5 = LUI.UIImage.new()
	credit5.id = "credit5"
	credit5:setImage( RegisterMaterial( "ghosts_skulls_screen_05" ), 0 )
	credit5:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 747, _1080p * 1182, _1080p * 216, _1080p * 712 )
	credit5:BindAlphaToModel( DataSources.inGame.CP.zombies.ghostArcadeCoin5Alpha:GetModel( f2_local1 ) )
	self:addElement( credit5 )
	self.credit5 = credit5
	
	local credit6 = nil
	
	credit6 = LUI.UIImage.new()
	credit6.id = "credit6"
	credit6:setImage( RegisterMaterial( "ghosts_skulls_screen_06b" ), 0 )
	credit6:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 747, _1080p * 1182, _1080p * 216, _1080p * 712 )
	credit6:BindAlphaToModel( DataSources.inGame.CP.zombies.ghostArcadeCoin6Alpha:GetModel( f2_local1 ) )
	self:addElement( credit6 )
	self.credit6 = credit6
	
	local credit6Ready = nil
	
	credit6Ready = LUI.UIImage.new()
	credit6Ready.id = "credit6Ready"
	credit6Ready:SetAlpha( 0, 0 )
	credit6Ready:setImage( RegisterMaterial( "ghosts_skulls_screen_06a" ), 0 )
	credit6Ready:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 747, _1080p * 1182, _1080p * 216, _1080p * 712 )
	self:addElement( credit6Ready )
	self.credit6Ready = credit6Ready
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		credit6Ready:RegisterAnimationSequence( "Ready", {
			{
				function ()
					return self.credit6Ready:SetAlpha( 0, 0 )
				end,
				function ()
					return self.credit6Ready:SetAlpha( 1, 750 )
				end,
				function ()
					return self.credit6Ready:SetAlpha( 0, 750 )
				end
			}
		} )
		self._sequences.Ready = function ()
			credit6Ready:AnimateLoop( "Ready" )
		end
		
		credit6Ready:RegisterAnimationSequence( "ClearReady", {
			{
				function ()
					return self.credit6Ready:SetAlpha( 0, 0 )
				end,
				function ()
					return self.credit6Ready:SetAlpha( 0, 50 )
				end
			}
		} )
		self._sequences.ClearReady = function ()
			credit6Ready:AnimateSequence( "ClearReady" )
		end
		
		credit0:RegisterAnimationSequence( "versionRave", {
			{
				function ()
					return self.credit0:setImage( RegisterMaterial( "ghosts_skulls2_screen_00" ), 0 )
				end
			},
			{
				function ()
					return self.credit0:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 747, _1080p * 1182, _1080p * 216, _1080p * 712, 0 )
				end
			}
		} )
		credit1:RegisterAnimationSequence( "versionRave", {
			{
				function ()
					return self.credit1:setImage( RegisterMaterial( "ghosts_skulls2_screen_01" ), 0 )
				end
			},
			{
				function ()
					return self.credit1:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 747, _1080p * 1182, _1080p * 216, _1080p * 712, 0 )
				end
			}
		} )
		credit2:RegisterAnimationSequence( "versionRave", {
			{
				function ()
					return self.credit2:setImage( RegisterMaterial( "ghosts_skulls2_screen_02" ), 0 )
				end
			},
			{
				function ()
					return self.credit2:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 747, _1080p * 1182, _1080p * 216, _1080p * 712, 0 )
				end
			}
		} )
		credit3:RegisterAnimationSequence( "versionRave", {
			{
				function ()
					return self.credit3:setImage( RegisterMaterial( "ghosts_skulls2_screen_03" ), 0 )
				end
			},
			{
				function ()
					return self.credit3:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 747, _1080p * 1182, _1080p * 216, _1080p * 712, 0 )
				end
			}
		} )
		credit4:RegisterAnimationSequence( "versionRave", {
			{
				function ()
					return self.credit4:setImage( RegisterMaterial( "ghosts_skulls2_screen_04" ), 0 )
				end
			},
			{
				function ()
					return self.credit4:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 747, _1080p * 1182, _1080p * 216, _1080p * 712, 0 )
				end
			}
		} )
		credit5:RegisterAnimationSequence( "versionRave", {
			{
				function ()
					return self.credit5:setImage( RegisterMaterial( "ghosts_skulls2_screen_05" ), 0 )
				end
			},
			{
				function ()
					return self.credit5:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 747, _1080p * 1182, _1080p * 216, _1080p * 712, 0 )
				end
			}
		} )
		credit6:RegisterAnimationSequence( "versionRave", {
			{
				function ()
					return self.credit6:setImage( RegisterMaterial( "ghosts_skulls2_screen_06b" ), 0 )
				end
			},
			{
				function ()
					return self.credit6:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 747, _1080p * 1182, _1080p * 216, _1080p * 712, 0 )
				end
			}
		} )
		credit6Ready:RegisterAnimationSequence( "versionRave", {
			{
				function ()
					return self.credit6Ready:setImage( RegisterMaterial( "ghosts_skulls2_screen_06a" ), 0 )
				end
			},
			{
				function ()
					return self.credit6Ready:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 747, _1080p * 1182, _1080p * 216, _1080p * 712, 0 )
				end
			}
		} )
		self._sequences.versionRave = function ()
			credit0:AnimateSequence( "versionRave" )
			credit1:AnimateSequence( "versionRave" )
			credit2:AnimateSequence( "versionRave" )
			credit3:AnimateSequence( "versionRave" )
			credit4:AnimateSequence( "versionRave" )
			credit5:AnimateSequence( "versionRave" )
			credit6:AnimateSequence( "versionRave" )
			credit6Ready:AnimateSequence( "versionRave" )
		end
		
		credit0:RegisterAnimationSequence( "versionDisco", {
			{
				function ()
					return self.credit0:setImage( RegisterMaterial( "ghosts_skulls3_screen_00" ), 0 )
				end
			}
		} )
		credit1:RegisterAnimationSequence( "versionDisco", {
			{
				function ()
					return self.credit1:setImage( RegisterMaterial( "ghosts_skulls3_screen_01" ), 0 )
				end
			}
		} )
		credit2:RegisterAnimationSequence( "versionDisco", {
			{
				function ()
					return self.credit2:setImage( RegisterMaterial( "ghosts_skulls3_screen_02" ), 0 )
				end
			}
		} )
		credit3:RegisterAnimationSequence( "versionDisco", {
			{
				function ()
					return self.credit3:setImage( RegisterMaterial( "ghosts_skulls3_screen_03" ), 0 )
				end
			}
		} )
		credit4:RegisterAnimationSequence( "versionDisco", {
			{
				function ()
					return self.credit4:setImage( RegisterMaterial( "ghosts_skulls3_screen_04" ), 0 )
				end
			}
		} )
		credit5:RegisterAnimationSequence( "versionDisco", {
			{
				function ()
					return self.credit5:setImage( RegisterMaterial( "ghosts_skulls3_screen_05" ), 0 )
				end
			}
		} )
		credit6:RegisterAnimationSequence( "versionDisco", {
			{
				function ()
					return self.credit6:setImage( RegisterMaterial( "ghosts_skulls3_screen_06b" ), 0 )
				end
			}
		} )
		credit6Ready:RegisterAnimationSequence( "versionDisco", {
			{
				function ()
					return self.credit6Ready:setImage( RegisterMaterial( "ghosts_skulls3_screen_06a" ), 0 )
				end
			}
		} )
		self._sequences.versionDisco = function ()
			credit0:AnimateSequence( "versionDisco" )
			credit1:AnimateSequence( "versionDisco" )
			credit2:AnimateSequence( "versionDisco" )
			credit3:AnimateSequence( "versionDisco" )
			credit4:AnimateSequence( "versionDisco" )
			credit5:AnimateSequence( "versionDisco" )
			credit6:AnimateSequence( "versionDisco" )
			credit6Ready:AnimateSequence( "versionDisco" )
		end
		
		credit0:RegisterAnimationSequence( "versionTown", {
			{
				function ()
					return self.credit0:setImage( RegisterMaterial( "skullhop_screen_00" ), 0 )
				end
			}
		} )
		credit1:RegisterAnimationSequence( "versionTown", {
			{
				function ()
					return self.credit1:setImage( RegisterMaterial( "skullhop_screen_01" ), 0 )
				end
			}
		} )
		credit2:RegisterAnimationSequence( "versionTown", {
			{
				function ()
					return self.credit2:setImage( RegisterMaterial( "skullhop_screen_02" ), 0 )
				end
			}
		} )
		credit3:RegisterAnimationSequence( "versionTown", {
			{
				function ()
					return self.credit3:setImage( RegisterMaterial( "skullhop_screen_03" ), 0 )
				end
			}
		} )
		credit4:RegisterAnimationSequence( "versionTown", {
			{
				function ()
					return self.credit4:setImage( RegisterMaterial( "skullhop_screen_04" ), 0 )
				end
			}
		} )
		credit5:RegisterAnimationSequence( "versionTown", {
			{
				function ()
					return self.credit5:setImage( RegisterMaterial( "skullhop_screen_05" ), 0 )
				end
			}
		} )
		credit6:RegisterAnimationSequence( "versionTown", {
			{
				function ()
					return self.credit6:setImage( RegisterMaterial( "skullhop_screen_06a" ), 0 )
				end
			}
		} )
		credit6Ready:RegisterAnimationSequence( "versionTown", {
			{
				function ()
					return self.credit6Ready:setImage( RegisterMaterial( "skullhop_screen_06b" ), 0 )
				end
			}
		} )
		self._sequences.versionTown = function ()
			credit0:AnimateSequence( "versionTown" )
			credit1:AnimateSequence( "versionTown" )
			credit2:AnimateSequence( "versionTown" )
			credit3:AnimateSequence( "versionTown" )
			credit4:AnimateSequence( "versionTown" )
			credit5:AnimateSequence( "versionTown" )
			credit6:AnimateSequence( "versionTown" )
			credit6Ready:AnimateSequence( "versionTown" )
		end
		
		credit0:RegisterAnimationSequence( "versionFinal", {
			{
				function ()
					return self.credit0:setImage( RegisterMaterial( "skullbreaker_screen_00" ), 0 )
				end
			}
		} )
		credit1:RegisterAnimationSequence( "versionFinal", {
			{
				function ()
					return self.credit1:setImage( RegisterMaterial( "skullbreaker_screen_01" ), 0 )
				end
			}
		} )
		credit2:RegisterAnimationSequence( "versionFinal", {
			{
				function ()
					return self.credit2:setImage( RegisterMaterial( "skullbreaker_screen_02" ), 0 )
				end
			}
		} )
		credit3:RegisterAnimationSequence( "versionFinal", {
			{
				function ()
					return self.credit3:setImage( RegisterMaterial( "skullbreaker_screen_03" ), 0 )
				end
			}
		} )
		credit4:RegisterAnimationSequence( "versionFinal", {
			{
				function ()
					return self.credit4:setImage( RegisterMaterial( "skullbreaker_screen_04" ), 0 )
				end
			}
		} )
		credit5:RegisterAnimationSequence( "versionFinal", {
			{
				function ()
					return self.credit5:setImage( RegisterMaterial( "skullbreaker_screen_05" ), 0 )
				end
			}
		} )
		credit6:RegisterAnimationSequence( "versionFinal", {
			{
				function ()
					return self.credit6:setImage( RegisterMaterial( "skullbreaker_screen_06b" ), 0 )
				end
			}
		} )
		credit6Ready:RegisterAnimationSequence( "versionFinal", {
			{
				function ()
					return self.credit6Ready:setImage( RegisterMaterial( "skullbreaker_screen_06a" ), 0 )
				end
			}
		} )
		self._sequences.versionFinal = function ()
			credit0:AnimateSequence( "versionFinal" )
			credit1:AnimateSequence( "versionFinal" )
			credit2:AnimateSequence( "versionFinal" )
			credit3:AnimateSequence( "versionFinal" )
			credit4:AnimateSequence( "versionFinal" )
			credit5:AnimateSequence( "versionFinal" )
			credit6:AnimateSequence( "versionFinal" )
			credit6Ready:AnimateSequence( "versionFinal" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	credit6Ready:SubscribeToModel( DataSources.inGame.CP.zombies.ghostArcadeNumOfCoins:GetModel( f2_local1 ), function ()
		if DataSources.inGame.CP.zombies.ghostArcadeNumOfCoins:GetValue( f2_local1 ) ~= nil and DataSources.inGame.CP.zombies.ghostArcadeNumOfCoins:GetValue( f2_local1 ) == 6 then
			ACTIONS.AnimateSequence( self, "Ready" )
		end
		if DataSources.inGame.CP.zombies.ghostArcadeNumOfCoins:GetValue( f2_local1 ) ~= nil and DataSources.inGame.CP.zombies.ghostArcadeNumOfCoins:GetValue( f2_local1 ) < 6 then
			ACTIONS.AnimateSequence( self, "ClearReady" )
		end
	end )
	self:SubscribeToModel( DataSources.inGame.CP.zombies.ghostArcadeNumOfCoins:GetModel( f2_local1 ), function ()
		if DataSources.inGame.CP.zombies.ghostArcadeNumOfCoins:GetValue( f2_local1 ) ~= nil and DataSources.inGame.CP.zombies.ghostArcadeNumOfCoins:GetValue( f2_local1 ) == 6 then
			ACTIONS.AnimateSequence( self, "Ready" )
		end
	end )
	PostLoadFunc( self, f2_local1, controller )
	if CONDITIONS.IsRave( self ) then
		ACTIONS.AnimateSequence( self, "versionRave" )
	end
	if CONDITIONS.IsDLC2( self ) then
		ACTIONS.AnimateSequence( self, "versionDisco" )
	end
	if CONDITIONS.IsDLC3( self ) then
		ACTIONS.AnimateSequence( self, "versionTown" )
	end
	if CONDITIONS.IsDLC4( self ) then
		ACTIONS.AnimateSequence( self, "versionFinal" )
	end
	return self
end

MenuBuilder.registerType( "ghostArcadeGameCabinet", ghostArcadeGameCabinet )
LockTable( _M )
