local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ( f1_arg0, f1_arg1, f1_arg2 )
	assert( f1_arg2 )
	local f1_local0 = f1_arg2.isFinal
	local f1_local1 = f1_arg2.isRoundEnd
	local f1_local2 = f1_arg0.Header.Text
	local self = f1_local2
	f1_local2 = f1_local2.setText
	local ThermalVision
	if f1_local1 then
		ThermalVision = Engine.Localize( "MP_ROUND_END_KILLCAM" )
		if not ThermalVision then
			if f1_local0 then
				ThermalVision = Engine.Localize( "MP_ROUND_KILLCAM" )
				if not ThermalVision then
				
				else
					f1_local2( self, ThermalVision )
					f1_local2 = f1_local0 or f1_local1
					self = f1_arg0.RespawnMessage
					ThermalVision = self
					self = self.SetAlpha
					local HitMarker
					if f1_local2 then
						HitMarker = 0
						if not HitMarker then
						
						else
							self( ThermalVision, HitMarker )
							f1_arg0.Header.CountdownTimer:SetAlpha( showRespawnPromptand and 0 or 1 )
							if LUI.PostGameManager.IsPostGame() then
								self = LUI.MPOverlayHUD.new( f1_arg1 )
								self:setPriority( -1 )
								f1_arg0:addElement( self )
								ThermalVision = MenuBuilder.BuildRegisteredType( "ThermalVision", {
									controllerIndex = f1_arg1
								} )
								ThermalVision.id = "ThermalVision"
								ThermalVision:setPriority( -1 )
								f1_arg0:addElement( ThermalVision )
								f1_arg0.ThermalVision = ThermalVision
								
								HitMarker = MenuBuilder.BuildRegisteredType( "HitMarker", {
									controllerIndex = f1_arg1
								} )
								HitMarker.id = "HitMarker"
								HitMarker:SetAnchors( 0.5, 0.5, 0.5, 0.5, 0 )
								HitMarker:SetLeft( _1080p * -11, 0 )
								HitMarker:SetRight( _1080p * 11, 0 )
								HitMarker:SetTop( _1080p * -11, 0 )
								HitMarker:SetBottom( _1080p * 11, 0 )
								HitMarker:setPriority( -2 )
								f1_arg0:addElement( HitMarker )
								f1_arg0.HitMarker = HitMarker
								
								local HitMarkerIcon = MenuBuilder.BuildRegisteredType( "HitMarkerIcon", {
									controllerIndex = f1_arg1
								} )
								HitMarkerIcon.id = "HitMarkerIcon"
								HitMarkerIcon:SetAnchors( 0.5, 0.5, 0.5, 0.5, 0 )
								HitMarkerIcon:SetLeft( _1080p * 16, 0 )
								HitMarkerIcon:SetRight( _1080p * 64, 0 )
								HitMarkerIcon:SetTop( _1080p * 11, 0 )
								HitMarkerIcon:SetBottom( _1080p * 59, 0 )
								HitMarkerIcon:setPriority( -2 )
								f1_arg0:addElement( HitMarkerIcon )
								f1_arg0.HitMarkerIcon = HitMarkerIcon
								
								local NetStatsIcons = MenuBuilder.BuildRegisteredType( "NetStatsIcons", {
									controllerIndex = f1_arg1
								} )
								NetStatsIcons.id = "NetStatsIcons"
								NetStatsIcons:SetAnchorsAndPosition( 0, 1, 0.5, 0.5, _1080p * 10, _1080p * 42, _1080p * -64, _1080p * 64 )
								NetStatsIcons:setPriority( -2 )
								f1_arg0:addElement( NetStatsIcons )
								f1_arg0.NetStatsIcons = NetStatsIcons
								
								f1_arg0.WeaponInfo.VictimName:SetAlpha( 1, 0 )
							end
							self = LUI.UIElement.new( {
								topAnchor = true,
								bottomAnchor = false,
								leftAnchor = true,
								rightAnchor = false,
								top = 0,
								bottom = 0,
								left = 0,
								right = 0
							} )
							self.id = "youMarker"
							ThermalVision = Game.GetPlayerClientnum()
							self:SetupAnchoredElement( {
								minScale = 1,
								maxScale = 1,
								entityTag = "j_head",
								worldOffsetZ = 10,
								entityNum = ThermalVision
							} )
							f1_arg0:addElement( self )
							self:SubscribeToModel( DataSources.inGame.currentPlayerStateClientNum:GetModel( f1_arg1 ), function ( f2_arg0 )
								if DataModel.GetModelValue( f2_arg0 ) == ThermalVision then
									self:SetAlpha( 0 )
								else
									self:SetAlpha( 1 )
								end
							end )
							self:addElement( LUI.UIImage.new( {
								material = RegisterMaterial( "headiconyouinkillcam" ),
								topAnchor = false,
								bottomAnchor = true,
								leftAnchor = false,
								rightAnchor = false,
								top = -50,
								bottom = 0,
								left = -25,
								right = 25
							} ) )
						end
					end
					HitMarker = 1
				end
			end
			ThermalVision = Engine.Localize( "LUA_MENU_KILLCAM_CAPS" )
		end
	else
		if f1_local0 then
			ThermalVision = Engine.Localize( "MP_ROUND_KILLCAM" )
			if not ThermalVision then
			
			else
				f1_local2( self, ThermalVision )
				f1_local2 = f1_local0 or f1_local1
				self = f1_arg0.RespawnMessage
				ThermalVision = self
				self = self.SetAlpha
				local HitMarker
				if f1_local2 then
					HitMarker = 0
					if not HitMarker then
					
					else
						self( ThermalVision, HitMarker )
						f1_arg0.Header.CountdownTimer:SetAlpha( showRespawnPromptand and 0 or 1 )
						if LUI.PostGameManager.IsPostGame() then
							self = LUI.MPOverlayHUD.new( f1_arg1 )
							self:setPriority( -1 )
							f1_arg0:addElement( self )
							ThermalVision = MenuBuilder.BuildRegisteredType( "ThermalVision", {
								controllerIndex = f1_arg1
							} )
							ThermalVision.id = "ThermalVision"
							ThermalVision:setPriority( -1 )
							f1_arg0:addElement( ThermalVision )
							f1_arg0.ThermalVision = ThermalVision
							
							HitMarker = MenuBuilder.BuildRegisteredType( "HitMarker", {
								controllerIndex = f1_arg1
							} )
							HitMarker.id = "HitMarker"
							HitMarker:SetAnchors( 0.5, 0.5, 0.5, 0.5, 0 )
							HitMarker:SetLeft( _1080p * -11, 0 )
							HitMarker:SetRight( _1080p * 11, 0 )
							HitMarker:SetTop( _1080p * -11, 0 )
							HitMarker:SetBottom( _1080p * 11, 0 )
							HitMarker:setPriority( -2 )
							f1_arg0:addElement( HitMarker )
							f1_arg0.HitMarker = HitMarker
							
							local HitMarkerIcon = MenuBuilder.BuildRegisteredType( "HitMarkerIcon", {
								controllerIndex = f1_arg1
							} )
							HitMarkerIcon.id = "HitMarkerIcon"
							HitMarkerIcon:SetAnchors( 0.5, 0.5, 0.5, 0.5, 0 )
							HitMarkerIcon:SetLeft( _1080p * 16, 0 )
							HitMarkerIcon:SetRight( _1080p * 64, 0 )
							HitMarkerIcon:SetTop( _1080p * 11, 0 )
							HitMarkerIcon:SetBottom( _1080p * 59, 0 )
							HitMarkerIcon:setPriority( -2 )
							f1_arg0:addElement( HitMarkerIcon )
							f1_arg0.HitMarkerIcon = HitMarkerIcon
							
							local NetStatsIcons = MenuBuilder.BuildRegisteredType( "NetStatsIcons", {
								controllerIndex = f1_arg1
							} )
							NetStatsIcons.id = "NetStatsIcons"
							NetStatsIcons:SetAnchorsAndPosition( 0, 1, 0.5, 0.5, _1080p * 10, _1080p * 42, _1080p * -64, _1080p * 64 )
							NetStatsIcons:setPriority( -2 )
							f1_arg0:addElement( NetStatsIcons )
							f1_arg0.NetStatsIcons = NetStatsIcons
							
							f1_arg0.WeaponInfo.VictimName:SetAlpha( 1, 0 )
						end
						self = LUI.UIElement.new( {
							topAnchor = true,
							bottomAnchor = false,
							leftAnchor = true,
							rightAnchor = false,
							top = 0,
							bottom = 0,
							left = 0,
							right = 0
						} )
						self.id = "youMarker"
						ThermalVision = Game.GetPlayerClientnum()
						self:SetupAnchoredElement( {
							minScale = 1,
							maxScale = 1,
							entityTag = "j_head",
							worldOffsetZ = 10,
							entityNum = ThermalVision
						} )
						f1_arg0:addElement( self )
						self:SubscribeToModel( DataSources.inGame.currentPlayerStateClientNum:GetModel( f1_arg1 ), function ( f2_arg0 )
							if DataModel.GetModelValue( f2_arg0 ) == ThermalVision then
								self:SetAlpha( 0 )
							else
								self:SetAlpha( 1 )
							end
						end )
						self:addElement( LUI.UIImage.new( {
							material = RegisterMaterial( "headiconyouinkillcam" ),
							topAnchor = false,
							bottomAnchor = true,
							leftAnchor = false,
							rightAnchor = false,
							top = -50,
							bottom = 0,
							left = -25,
							right = 25
						} ) )
					end
				end
				HitMarker = 1
			end
		end
		ThermalVision = Engine.Localize( "LUA_MENU_KILLCAM_CAPS" )
	end
	f1_local2( self, ThermalVision )
	f1_local2 = f1_local0 or f1_local1
	self = f1_arg0.RespawnMessage
	ThermalVision = self
	self = self.SetAlpha
	local HitMarker
	if f1_local2 then
		HitMarker = 0
		if not HitMarker then
		
		else
			self( ThermalVision, HitMarker )
			f1_arg0.Header.CountdownTimer:SetAlpha( showRespawnPromptand and 0 or 1 )
			if LUI.PostGameManager.IsPostGame() then
				self = LUI.MPOverlayHUD.new( f1_arg1 )
				self:setPriority( -1 )
				f1_arg0:addElement( self )
				ThermalVision = MenuBuilder.BuildRegisteredType( "ThermalVision", {
					controllerIndex = f1_arg1
				} )
				ThermalVision.id = "ThermalVision"
				ThermalVision:setPriority( -1 )
				f1_arg0:addElement( ThermalVision )
				f1_arg0.ThermalVision = ThermalVision
				
				HitMarker = MenuBuilder.BuildRegisteredType( "HitMarker", {
					controllerIndex = f1_arg1
				} )
				HitMarker.id = "HitMarker"
				HitMarker:SetAnchors( 0.5, 0.5, 0.5, 0.5, 0 )
				HitMarker:SetLeft( _1080p * -11, 0 )
				HitMarker:SetRight( _1080p * 11, 0 )
				HitMarker:SetTop( _1080p * -11, 0 )
				HitMarker:SetBottom( _1080p * 11, 0 )
				HitMarker:setPriority( -2 )
				f1_arg0:addElement( HitMarker )
				f1_arg0.HitMarker = HitMarker
				
				local HitMarkerIcon = MenuBuilder.BuildRegisteredType( "HitMarkerIcon", {
					controllerIndex = f1_arg1
				} )
				HitMarkerIcon.id = "HitMarkerIcon"
				HitMarkerIcon:SetAnchors( 0.5, 0.5, 0.5, 0.5, 0 )
				HitMarkerIcon:SetLeft( _1080p * 16, 0 )
				HitMarkerIcon:SetRight( _1080p * 64, 0 )
				HitMarkerIcon:SetTop( _1080p * 11, 0 )
				HitMarkerIcon:SetBottom( _1080p * 59, 0 )
				HitMarkerIcon:setPriority( -2 )
				f1_arg0:addElement( HitMarkerIcon )
				f1_arg0.HitMarkerIcon = HitMarkerIcon
				
				local NetStatsIcons = MenuBuilder.BuildRegisteredType( "NetStatsIcons", {
					controllerIndex = f1_arg1
				} )
				NetStatsIcons.id = "NetStatsIcons"
				NetStatsIcons:SetAnchorsAndPosition( 0, 1, 0.5, 0.5, _1080p * 10, _1080p * 42, _1080p * -64, _1080p * 64 )
				NetStatsIcons:setPriority( -2 )
				f1_arg0:addElement( NetStatsIcons )
				f1_arg0.NetStatsIcons = NetStatsIcons
				
				f1_arg0.WeaponInfo.VictimName:SetAlpha( 1, 0 )
			end
			self = LUI.UIElement.new( {
				topAnchor = true,
				bottomAnchor = false,
				leftAnchor = true,
				rightAnchor = false,
				top = 0,
				bottom = 0,
				left = 0,
				right = 0
			} )
			self.id = "youMarker"
			ThermalVision = Game.GetPlayerClientnum()
			self:SetupAnchoredElement( {
				minScale = 1,
				maxScale = 1,
				entityTag = "j_head",
				worldOffsetZ = 10,
				entityNum = ThermalVision
			} )
			f1_arg0:addElement( self )
			self:SubscribeToModel( DataSources.inGame.currentPlayerStateClientNum:GetModel( f1_arg1 ), function ( f2_arg0 )
				if DataModel.GetModelValue( f2_arg0 ) == ThermalVision then
					self:SetAlpha( 0 )
				else
					self:SetAlpha( 1 )
				end
			end )
			self:addElement( LUI.UIImage.new( {
				material = RegisterMaterial( "headiconyouinkillcam" ),
				topAnchor = false,
				bottomAnchor = true,
				leftAnchor = false,
				rightAnchor = false,
				top = -50,
				bottom = 0,
				left = -25,
				right = 25
			} ) )
		end
	end
	HitMarker = 1
end

function Killcam( menu, controller )
	local self = LUI.UIElement.new()
	self.id = "Killcam"
	local f3_local1 = controller and controller.controllerIndex
	if not f3_local1 and not Engine.InFrontend() then
		f3_local1 = self:getRootController()
	end
	assert( f3_local1 )
	self:playSound( "menu_open" )
	local f3_local2 = self
	local WeaponInfo = nil
	
	WeaponInfo = MenuBuilder.BuildRegisteredType( "KillcamWeaponInfo", {
		controllerIndex = f3_local1
	} )
	WeaponInfo.id = "WeaponInfo"
	WeaponInfo:SetAnchorsAndPosition( 0, 0, 1, 0, 0, 0, _1080p * -150, _1080p * -50 )
	self:addElement( WeaponInfo )
	self.WeaponInfo = WeaponInfo
	
	local RespawnMessage = nil
	
	RespawnMessage = MenuBuilder.BuildRegisteredType( "KillcamRespawnMessage", {
		controllerIndex = f3_local1
	} )
	RespawnMessage.id = "RespawnMessage"
	RespawnMessage:SetAnchorsAndPosition( 0.5, 0.5, 1, 0, _1080p * -250, _1080p * 250, _1080p * -220, _1080p * -180 )
	self:addElement( RespawnMessage )
	self.RespawnMessage = RespawnMessage
	
	local Header = nil
	
	Header = MenuBuilder.BuildRegisteredType( "KillcamHeader", {
		controllerIndex = f3_local1
	} )
	Header.id = "Header"
	Header:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, 0, _1080p * 145 )
	self:addElement( Header )
	self.Header = Header
	
	local DeathDetails = nil
	
	DeathDetails = MenuBuilder.BuildRegisteredType( "DeathDetails", {
		controllerIndex = f3_local1
	} )
	DeathDetails.id = "DeathDetails"
	DeathDetails:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -628, _1080p * -96, _1080p * 216, _1080p * 336 )
	self:addElement( DeathDetails )
	self.DeathDetails = DeathDetails
	
	f0_local0( self, f3_local1, controller )
	return self
end

MenuBuilder.registerType( "Killcam", Killcam )
LockTable( _M )
