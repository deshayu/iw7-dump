local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ( f1_arg0, f1_arg1 )
	ACTIONS.AnimateSequence( f1_arg0, "initial" )
	f1_arg0:SubscribeToModel( DataSources.inGame.CP.zombies.dpadUpFillPercent:GetModel( f1_arg1 ), function ()
		ACTIONS.AnimateSequence( f1_arg0, "Chomp" )
	end )
	local f1_local0 = DataSources.inGame.CP.zombies.consumablesRemaining
	f1_arg0:SubscribeToModel( f1_local0:GetModel( f1_arg1 ), function ()
		local f3_local0 = f1_local0:GetValue( f1_arg1 )
		if f3_local0 then
			if f3_local0 == 0 then
				ACTIONS.AnimateSequence( f1_arg0, "noMoreCards" )
			elseif f3_local0 > 0 then
				ACTIONS.AnimateSequence( f1_arg0, "hasCards" )
			end
		end
	end )
	local f1_local1 = DataSources.inGame.CP.zombies.consumableDeckSelectReady
	f1_arg0:SubscribeToModel( f1_local1:GetModel( f1_arg1 ), function ()
		local f4_local0 = f1_local1:GetValue( f1_arg1 )
		if f4_local0 then
			if f4_local0 == 1 then
				ACTIONS.AnimateSequence( f1_arg0, "fullMeterPulse" )
			elseif f4_local0 == 0 then
				ACTIONS.AnimateSequence( f1_arg0, "meterPulseReset" )
			end
		end
	end )
	local f1_local2 = DataSources.inGame.CP.zombies.dpadUpActivated
	f1_arg0:SubscribeToModel( f1_local2:GetModel( f1_arg1 ), function ()
		local f5_local0 = f1_local2:GetValue( f1_arg1 )
		if f5_local0 then
			if f5_local0 == 4 then
				ACTIONS.AnimateSequence( f1_arg0, "justGotCards" )
			elseif f5_local0 == 6 then
				ACTIONS.AnimateSequence( f1_arg0, "hasCards" )
			end
		end
	end, false )
end

function FateCardDevilWidget( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 168 * _1080p, 0, 173 * _1080p )
	self.id = "FateCardDevilWidget"
	self._animationSets = {}
	self._sequences = {}
	local f6_local1 = controller and controller.controllerIndex
	if not f6_local1 and not Engine.InFrontend() then
		f6_local1 = self:getRootController()
	end
	assert( f6_local1 )
	local f6_local2 = self
	local Circle = nil
	
	Circle = LUI.UIImage.new()
	Circle.id = "Circle"
	Circle:SetRGBFromInt( 3684408, 0 )
	Circle:SetScale( -0.35, 0 )
	Circle:setImage( RegisterMaterial( "zm_wc_circle_bg" ), 0 )
	Circle:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -43.52, _1080p * 212.48, _1080p * -46.06, _1080p * 209.94 )
	self:addElement( Circle )
	self.Circle = Circle
	
	local blueGlow = nil
	
	blueGlow = LUI.UIImage.new()
	blueGlow.id = "blueGlow"
	blueGlow:SetAlpha( 0, 0 )
	blueGlow:setImage( RegisterMaterial( "zm_powerup_glow_element" ), 0 )
	blueGlow:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -171.5, _1080p * 340.5, _1080p * -185.11, _1080p * 326.9 )
	self:addElement( blueGlow )
	self.blueGlow = blueGlow
	
	local radialAlphaLarge = nil
	
	radialAlphaLarge = MenuBuilder.BuildRegisteredType( "radialAlphaLarge", {
		controllerIndex = f6_local1
	} )
	radialAlphaLarge.id = "radialAlphaLarge"
	radialAlphaLarge.circleFill:SetAlpha( 0, 0 )
	radialAlphaLarge:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -7, _1080p * 176, _1080p * -10, _1080p * 173 )
	radialAlphaLarge:SubscribeToModel( DataSources.inGame.CP.zombies.dpadUpFillPercent:GetModel( f6_local1 ), function ()
		local f7_local0 = DataSources.inGame.CP.zombies.dpadUpFillPercent:GetValue( f6_local1 )
		if f7_local0 ~= nil then
			radialAlphaLarge.circleFill:SetProgress( f7_local0 )
		end
	end )
	self:addElement( radialAlphaLarge )
	self.radialAlphaLarge = radialAlphaLarge
	
	local innerRing = nil
	
	innerRing = LUI.UIImage.new()
	innerRing.id = "innerRing"
	innerRing:SetScale( -0.49, 0 )
	innerRing:setImage( RegisterMaterial( "zm_wc_red_hoop" ), 0 )
	innerRing:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -43.5, _1080p * 212.5, _1080p * -46.1, _1080p * 209.9 )
	self:addElement( innerRing )
	self.innerRing = innerRing
	
	local outerRing = nil
	
	outerRing = LUI.UIImage.new()
	outerRing.id = "outerRing"
	outerRing:SetScale( -0.36, 0 )
	outerRing:setImage( RegisterMaterial( "zm_wc_red_hoop" ), 0 )
	outerRing:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -43.5, _1080p * 212.5, _1080p * -46.5, _1080p * 209.5 )
	self:addElement( outerRing )
	self.outerRing = outerRing
	
	local glowRing = nil
	
	glowRing = LUI.UIImage.new()
	glowRing.id = "glowRing"
	glowRing:SetAlpha( 0, 0 )
	glowRing:SetScale( 0.26, 0 )
	glowRing:setImage( RegisterMaterial( "zm_wc_card_glow_ring" ), 0 )
	glowRing:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 20.5, _1080p * 148.5, _1080p * 17.5, _1080p * 145.5 )
	self:addElement( glowRing )
	self.glowRing = glowRing
	
	local devilJaw = nil
	
	devilJaw = LUI.UIImage.new()
	devilJaw.id = "devilJaw"
	devilJaw:SetScale( 0.1, 0 )
	devilJaw:setImage( RegisterMaterial( "zm_wc_devil_head_bottom" ), 0 )
	devilJaw:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 20.48, _1080p * 148.48, _1080p * 66.5, _1080p * 194.5 )
	self:addElement( devilJaw )
	self.devilJaw = devilJaw
	
	local devilHead = nil
	
	devilHead = LUI.UIImage.new()
	devilHead.id = "devilHead"
	devilHead:SetScale( 0.1, 0 )
	devilHead:setImage( RegisterMaterial( "zm_wc_devil_head_top" ), 0 )
	devilHead:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 18.5, _1080p * 146.5, _1080p * 6.9, _1080p * 134.9 )
	self:addElement( devilHead )
	self.devilHead = devilHead
	
	local sadDevil = nil
	
	sadDevil = LUI.UIImage.new()
	sadDevil.id = "sadDevil"
	sadDevil:SetAlpha( 0, 0 )
	sadDevil:SetScale( -0.32, 0 )
	sadDevil:setImage( RegisterMaterial( "zm_wc_devil_head_sad" ), 0 )
	sadDevil:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -43.5, _1080p * 212.5, _1080p * -37.96, _1080p * 218.04 )
	self:addElement( sadDevil )
	self.sadDevil = sadDevil
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		devilJaw:RegisterAnimationSequence( "Chomp", {
			{
				function ()
					return self.devilJaw:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 20.48, _1080p * 148.48, _1080p * 66.5, _1080p * 194.5, 0 )
				end,
				function ()
					return self.devilJaw:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 20.48, _1080p * 148.48, _1080p * 77.5, _1080p * 205.5, 90 )
				end,
				function ()
					return self.devilJaw:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 20.48, _1080p * 148.48, _1080p * 66.5, _1080p * 194.5, 90 )
				end
			}
		} )
		self._sequences.Chomp = function ()
			devilJaw:AnimateSequence( "Chomp" )
		end
		
		Circle:RegisterAnimationSequence( "noMoreCards", {
			{
				function ()
					return self.Circle:SetAlpha( 1, 0 )
				end,
				function ()
					return self.Circle:SetAlpha( 0, 180 )
				end
			}
		} )
		blueGlow:RegisterAnimationSequence( "noMoreCards", {
			{
				function ()
					return self.blueGlow:SetAlpha( 0, 0 )
				end
			}
		} )
		radialAlphaLarge:RegisterAnimationSequence( "noMoreCards", {
			{
				function ()
					return self.radialAlphaLarge:SetAlpha( 1, 0 )
				end,
				function ()
					return self.radialAlphaLarge:SetAlpha( 0, 180 )
				end
			}
		} )
		innerRing:RegisterAnimationSequence( "noMoreCards", {
			{
				function ()
					return self.innerRing:SetAlpha( 1, 0 )
				end,
				function ()
					return self.innerRing:SetAlpha( 0, 180 )
				end
			}
		} )
		outerRing:RegisterAnimationSequence( "noMoreCards", {
			{
				function ()
					return self.outerRing:SetAlpha( 1, 0 )
				end,
				function ()
					return self.outerRing:SetAlpha( 0, 180 )
				end
			}
		} )
		devilJaw:RegisterAnimationSequence( "noMoreCards", {
			{
				function ()
					return self.devilJaw:SetAlpha( 0, 0 )
				end
			}
		} )
		devilHead:RegisterAnimationSequence( "noMoreCards", {
			{
				function ()
					return self.devilHead:SetAlpha( 0, 0 )
				end
			}
		} )
		sadDevil:RegisterAnimationSequence( "noMoreCards", {
			{
				function ()
					return self.sadDevil:SetAlpha( 1, 0 )
				end
			}
		} )
		self._sequences.noMoreCards = function ()
			Circle:AnimateSequence( "noMoreCards" )
			blueGlow:AnimateSequence( "noMoreCards" )
			radialAlphaLarge:AnimateSequence( "noMoreCards" )
			innerRing:AnimateSequence( "noMoreCards" )
			outerRing:AnimateSequence( "noMoreCards" )
			devilJaw:AnimateSequence( "noMoreCards" )
			devilHead:AnimateSequence( "noMoreCards" )
			sadDevil:AnimateSequence( "noMoreCards" )
		end
		
		Circle:RegisterAnimationSequence( "hasCards", {
			{
				function ()
					return self.Circle:SetAlpha( 1, 0 )
				end
			}
		} )
		blueGlow:RegisterAnimationSequence( "hasCards", {
			{
				function ()
					return self.blueGlow:SetAlpha( 0, 0 )
				end
			}
		} )
		radialAlphaLarge:RegisterAnimationSequence( "hasCards", {
			{
				function ()
					return self.radialAlphaLarge:SetAlpha( 1, 0 )
				end
			}
		} )
		innerRing:RegisterAnimationSequence( "hasCards", {
			{
				function ()
					return self.innerRing:SetAlpha( 1, 0 )
				end
			}
		} )
		outerRing:RegisterAnimationSequence( "hasCards", {
			{
				function ()
					return self.outerRing:SetAlpha( 1, 0 )
				end
			}
		} )
		devilJaw:RegisterAnimationSequence( "hasCards", {
			{
				function ()
					return self.devilJaw:SetAlpha( 1, 0 )
				end
			}
		} )
		devilHead:RegisterAnimationSequence( "hasCards", {
			{
				function ()
					return self.devilHead:SetAlpha( 1, 0 )
				end
			}
		} )
		sadDevil:RegisterAnimationSequence( "hasCards", {
			{
				function ()
					return self.sadDevil:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.hasCards = function ()
			Circle:AnimateSequence( "hasCards" )
			blueGlow:AnimateSequence( "hasCards" )
			radialAlphaLarge:AnimateSequence( "hasCards" )
			innerRing:AnimateSequence( "hasCards" )
			outerRing:AnimateSequence( "hasCards" )
			devilJaw:AnimateSequence( "hasCards" )
			devilHead:AnimateSequence( "hasCards" )
			sadDevil:AnimateSequence( "hasCards" )
		end
		
		glowRing:RegisterAnimationSequence( "fullMeterPulse", {
			{
				function ()
					return self.glowRing:SetAlpha( 0.4, 0 )
				end,
				function ()
					return self.glowRing:SetAlpha( 1, 750 )
				end,
				function ()
					return self.glowRing:SetAlpha( 0.4, 750 )
				end
			}
		} )
		self._sequences.fullMeterPulse = function ()
			glowRing:AnimateLoop( "fullMeterPulse" )
		end
		
		blueGlow:RegisterAnimationSequence( "meterPulseReset", {
			{
				function ()
					return self.blueGlow:SetAlpha( 0, 0 )
				end
			}
		} )
		glowRing:RegisterAnimationSequence( "meterPulseReset", {
			{
				function ()
					return self.glowRing:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.meterPulseReset = function ()
			blueGlow:AnimateSequence( "meterPulseReset" )
			glowRing:AnimateSequence( "meterPulseReset" )
		end
		
		Circle:RegisterAnimationSequence( "initial", {
			{
				function ()
					return self.Circle:SetAlpha( 0, 0 )
				end
			}
		} )
		blueGlow:RegisterAnimationSequence( "initial", {
			{
				function ()
					return self.blueGlow:SetAlpha( 0, 0 )
				end
			}
		} )
		radialAlphaLarge:RegisterAnimationSequence( "initial", {
			{
				function ()
					return self.radialAlphaLarge:SetAlpha( 0, 0 )
				end
			}
		} )
		innerRing:RegisterAnimationSequence( "initial", {
			{
				function ()
					return self.innerRing:SetAlpha( 0, 0 )
				end
			}
		} )
		outerRing:RegisterAnimationSequence( "initial", {
			{
				function ()
					return self.outerRing:SetAlpha( 0, 0 )
				end
			}
		} )
		devilJaw:RegisterAnimationSequence( "initial", {
			{
				function ()
					return self.devilJaw:SetAlpha( 0, 0 )
				end
			}
		} )
		devilHead:RegisterAnimationSequence( "initial", {
			{
				function ()
					return self.devilHead:SetAlpha( 0, 0 )
				end
			}
		} )
		sadDevil:RegisterAnimationSequence( "initial", {
			{
				function ()
					return self.sadDevil:SetAlpha( 1, 0 )
				end
			}
		} )
		self._sequences.initial = function ()
			Circle:AnimateSequence( "initial" )
			blueGlow:AnimateSequence( "initial" )
			radialAlphaLarge:AnimateSequence( "initial" )
			innerRing:AnimateSequence( "initial" )
			outerRing:AnimateSequence( "initial" )
			devilJaw:AnimateSequence( "initial" )
			devilHead:AnimateSequence( "initial" )
			sadDevil:AnimateSequence( "initial" )
		end
		
		Circle:RegisterAnimationSequence( "justGotCards", {
			{
				function ()
					return self.Circle:SetAlpha( 0, 0 )
				end,
				function ()
					return self.Circle:SetAlpha( 0, 1500 )
				end,
				function ()
					return self.Circle:SetAlpha( 1, 190 )
				end
			}
		} )
		blueGlow:RegisterAnimationSequence( "justGotCards", {
			{
				function ()
					return self.blueGlow:SetScale( -0.68, 0 )
				end,
				function ()
					return self.blueGlow:SetScale( -0.68, 1220 )
				end,
				function ()
					return self.blueGlow:SetScale( -0.42, 240 )
				end,
				function ()
					return self.blueGlow:SetScale( -0.42, 90 )
				end,
				function ()
					return self.blueGlow:SetScale( -0.9, 140 )
				end
			},
			{
				function ()
					return self.blueGlow:SetZRotation( 0, 0 )
				end,
				function ()
					return self.blueGlow:SetZRotation( 0, 1220 )
				end,
				function ()
					return self.blueGlow:SetZRotation( 137, 330 )
				end
			},
			{
				function ()
					return self.blueGlow:SetAlpha( 0, 0 )
				end,
				function ()
					return self.blueGlow:SetAlpha( 0, 1150 )
				end,
				function ()
					return self.blueGlow:SetAlpha( 1, 70 )
				end,
				function ()
					return self.blueGlow:SetAlpha( 1, 320 )
				end,
				function ()
					return self.blueGlow:SetAlpha( 0, 150 )
				end
			},
			{
				function ()
					return self.blueGlow:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -171.5, _1080p * 340.5, _1080p * -175.11, _1080p * 336.9, 0 )
				end,
				function ()
					return self.blueGlow:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -171.5, _1080p * 340.5, _1080p * -175.11, _1080p * 336.9, 1220 )
				end
			}
		} )
		radialAlphaLarge:RegisterAnimationSequence( "justGotCards", {
			{
				function ()
					return self.radialAlphaLarge:SetAlpha( 0, 0 )
				end,
				function ()
					return self.radialAlphaLarge:SetAlpha( 0, 1500 )
				end,
				function ()
					return self.radialAlphaLarge:SetAlpha( 1, 190 )
				end
			}
		} )
		innerRing:RegisterAnimationSequence( "justGotCards", {
			{
				function ()
					return self.innerRing:SetAlpha( 0, 0 )
				end,
				function ()
					return self.innerRing:SetAlpha( 0, 1500 )
				end,
				function ()
					return self.innerRing:SetAlpha( 1, 190 )
				end
			}
		} )
		outerRing:RegisterAnimationSequence( "justGotCards", {
			{
				function ()
					return self.outerRing:SetAlpha( 0, 0 )
				end,
				function ()
					return self.outerRing:SetAlpha( 0, 1500 )
				end,
				function ()
					return self.outerRing:SetAlpha( 1, 190 )
				end
			}
		} )
		devilJaw:RegisterAnimationSequence( "justGotCards", {
			{
				function ()
					return self.devilJaw:SetAlpha( 0, 0 )
				end,
				function ()
					return self.devilJaw:SetAlpha( 0, 1500 )
				end,
				function ()
					return self.devilJaw:SetAlpha( 1, 190 )
				end
			}
		} )
		devilHead:RegisterAnimationSequence( "justGotCards", {
			{
				function ()
					return self.devilHead:SetAlpha( 0, 0 )
				end,
				function ()
					return self.devilHead:SetAlpha( 0, 1500 )
				end,
				function ()
					return self.devilHead:SetAlpha( 1, 190 )
				end
			}
		} )
		sadDevil:RegisterAnimationSequence( "justGotCards", {
			{
				function ()
					return self.sadDevil:SetAlpha( 1, 0 )
				end,
				function ()
					return self.sadDevil:SetAlpha( 1, 1500 )
				end,
				function ()
					return self.sadDevil:SetAlpha( 0, 190 )
				end
			}
		} )
		self._sequences.justGotCards = function ()
			Circle:AnimateSequence( "justGotCards" )
			blueGlow:AnimateSequence( "justGotCards" )
			radialAlphaLarge:AnimateSequence( "justGotCards" )
			innerRing:AnimateSequence( "justGotCards" )
			outerRing:AnimateSequence( "justGotCards" )
			devilJaw:AnimateSequence( "justGotCards" )
			devilHead:AnimateSequence( "justGotCards" )
			sadDevil:AnimateSequence( "justGotCards" )
		end
		
		devilJaw:RegisterAnimationSequence( "mephBattle", {
			{
				function ()
					return self.devilJaw:SetScale( -0.9, 0 )
				end
			}
		} )
		devilHead:RegisterAnimationSequence( "mephBattle", {
			{
				function ()
					return self.devilHead:setImage( RegisterMaterial( "cp_final_meph_head_full" ), 0 )
				end
			},
			{
				function ()
					return self.devilHead:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 16.5, _1080p * 144.5, _1080p * 12.9, _1080p * 140.9, 0 )
				end
			}
		} )
		self._sequences.mephBattle = function ()
			devilJaw:AnimateSequence( "mephBattle" )
			devilHead:AnimateSequence( "mephBattle" )
		end
		
		devilJaw:RegisterAnimationSequence( "mephBattleOff", {
			{
				function ()
					return self.devilJaw:SetScale( 0.1, 0 )
				end
			}
		} )
		devilHead:RegisterAnimationSequence( "mephBattleOff", {
			{
				function ()
					return self.devilHead:setImage( RegisterMaterial( "zm_wc_devil_head_top" ), 0 )
				end
			},
			{
				function ()
					return self.devilHead:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 18.5, _1080p * 146.5, _1080p * 6.9, _1080p * 134.9, 0 )
				end
			}
		} )
		self._sequences.mephBattleOff = function ()
			devilJaw:AnimateSequence( "mephBattleOff" )
			devilHead:AnimateSequence( "mephBattleOff" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	self:SubscribeToModel( DataSources.inGame.CP.zombies.dlc4.mephBattle:GetModel( f6_local1 ), function ()
		if CONDITIONS.IsDLC4( self ) and DataSources.inGame.CP.zombies.dlc4.mephBattle:GetValue( f6_local1 ) ~= nil and DataSources.inGame.CP.zombies.dlc4.mephBattle:GetValue( f6_local1 ) == 1 then
			ACTIONS.AnimateSequence( self, "mephBattle" )
		end
		if CONDITIONS.IsDLC4( self ) and DataSources.inGame.CP.zombies.dlc4.mephBattle:GetValue( f6_local1 ) ~= nil and DataSources.inGame.CP.zombies.dlc4.mephBattle:GetValue( f6_local1 ) < 1 then
			ACTIONS.AnimateSequence( self, "mephBattleOff" )
		end
	end )
	f0_local0( self, f6_local1, controller )
	return self
end

MenuBuilder.registerType( "FateCardDevilWidget", FateCardDevilWidget )
LockTable( _M )
