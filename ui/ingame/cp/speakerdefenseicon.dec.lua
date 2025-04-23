local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function PostLoadFunc( f1_arg0, f1_arg1 )
	f1_arg0:SetupAnchoredElement( {
		minScale = 0.4,
		maxScale = 0.6,
		naturalDistance = 150,
		worldOffsetZ = 50,
		snapToScreenEdges = true
	} )
	local f1_local0 = DataSources.inGame.CP.zombies.speakerDefenseTarget
	f1_arg0:SubscribeToModel( f1_local0:GetModel( f1_arg1 ), function ()
		f1_arg0:SetEntityNum( f1_local0:GetValue( f1_arg1 ) )
	end )
end

function speakerDefenseIcon( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 512 * _1080p, 0, 256 * _1080p )
	self.id = "speakerDefenseIcon"
	self._animationSets = {}
	self._sequences = {}
	local f3_local1 = controller and controller.controllerIndex
	if not f3_local1 and not Engine.InFrontend() then
		f3_local1 = self:getRootController()
	end
	assert( f3_local1 )
	local f3_local2 = self
	local healthBacking = nil
	
	healthBacking = LUI.UIImage.new()
	healthBacking.id = "healthBacking"
	healthBacking:SetScale( -0.45, 0 )
	healthBacking:setImage( RegisterMaterial( "cp_zmb_speaker_health_backing" ), 0 )
	healthBacking:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -58, _1080p * 163, _1080p * 2, _1080p * 34 )
	healthBacking:BindAlphaToModel( DataSources.inGame.CP.zombies.speakerDefenseTimerAlpha:GetModel( f3_local1 ) )
	self:addElement( healthBacking )
	self.healthBacking = healthBacking
	
	local health = nil
	
	health = LUI.UIImage.new()
	health.id = "health"
	health:SetRGBFromInt( 16535313, 0 )
	health:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -8, _1080p * 113, _1080p * 9, _1080p * 27 )
	health:SubscribeToModel( DataSources.inGame.CP.zombies.speakerDefenseHealth:GetModel( f3_local1 ), function ()
		health:SetRight( _1080p * Multiply( Add( -8, 121 ), DataSources.inGame.CP.zombies.speakerDefenseHealth:GetValue( f3_local1 ) ), 0 )
	end )
	self:addElement( health )
	self.health = health
	
	local lostAndFoundIcon = nil
	
	lostAndFoundIcon = LUI.UIImage.new()
	lostAndFoundIcon.id = "lostAndFoundIcon"
	lostAndFoundIcon:setImage( RegisterMaterial( "cp_zmb_speaker" ), 0 )
	lostAndFoundIcon:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 512, 0, _1080p * 256 )
	lostAndFoundIcon:BindAlphaToModel( DataSources.inGame.CP.zombies.speakerDefenseTimerAlpha:GetModel( f3_local1 ) )
	self:addElement( lostAndFoundIcon )
	self.lostAndFoundIcon = lostAndFoundIcon
	
	local Timer = nil
	
	Timer = LUI.UIText.new()
	Timer.id = "Timer"
	Timer:SetScale( -0.1, 0 )
	Timer:SetFontSize( 32 * _1080p )
	Timer:SetFont( FONTS.GetFont( FONTS.Digital.File ) )
	Timer:SetAlignment( LUI.Alignment.Left )
	Timer:SetOptOutRightToLeftAlignmentFlip( true )
	Timer:SetAnchorsAndPosition( 0, 1, 1, 0, _1080p * 375.57, _1080p * 551, _1080p * -125.7, _1080p * -93.7 )
	Timer:SubscribeToModel( DataSources.inGame.CP.zombies.speakerDefenseTimer:GetModel( f3_local1 ), function ()
		local f5_local0 = DataSources.inGame.CP.zombies.speakerDefenseTimer:GetValue( f3_local1 )
		if f5_local0 ~= nil then
			Timer:setText( f5_local0, 0 )
		end
	end )
	self:addElement( Timer )
	self.Timer = Timer
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		lostAndFoundIcon:RegisterAnimationSequence( "ChangeHealth3", {
			{
				function ()
					return self.lostAndFoundIcon:setImage( RegisterMaterial( "cp_zmb_speaker_3" ), 0 )
				end
			},
			{
				function ()
					return self.lostAndFoundIcon:SetScale( -0.35, 100 )
				end,
				function ()
					return self.lostAndFoundIcon:SetScale( -0.45, 50 )
				end
			}
		} )
		self._sequences.ChangeHealth3 = function ()
			lostAndFoundIcon:AnimateSequence( "ChangeHealth3" )
		end
		
		lostAndFoundIcon:RegisterAnimationSequence( "ChangeHealth2", {
			{
				function ()
					return self.lostAndFoundIcon:setImage( RegisterMaterial( "cp_zmb_speaker_2" ), 0 )
				end
			},
			{
				function ()
					return self.lostAndFoundIcon:SetScale( -0.35, 100 )
				end,
				function ()
					return self.lostAndFoundIcon:SetScale( -0.45, 50 )
				end
			},
			{
				function ()
					return self.lostAndFoundIcon:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 150, 0, _1080p * 150, 0 )
				end
			}
		} )
		self._sequences.ChangeHealth2 = function ()
			lostAndFoundIcon:AnimateSequence( "ChangeHealth2" )
		end
		
		lostAndFoundIcon:RegisterAnimationSequence( "ChangeHealth1", {
			{
				function ()
					return self.lostAndFoundIcon:setImage( RegisterMaterial( "cp_zmb_speaker_1" ), 0 )
				end
			},
			{
				function ()
					return self.lostAndFoundIcon:SetScale( -0.35, 100 )
				end,
				function ()
					return self.lostAndFoundIcon:SetScale( -0.45, 50 )
				end
			},
			{
				function ()
					return self.lostAndFoundIcon:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 150, 0, _1080p * 150, 0 )
				end
			}
		} )
		self._sequences.ChangeHealth1 = function ()
			lostAndFoundIcon:AnimateSequence( "ChangeHealth1" )
		end
		
		lostAndFoundIcon:RegisterAnimationSequence( "ChangeHealth4", {
			{
				function ()
					return self.lostAndFoundIcon:setImage( RegisterMaterial( "cp_zmb_speaker_4" ), 0 )
				end
			},
			{
				function ()
					return self.lostAndFoundIcon:SetScale( -0.35, 100 )
				end,
				function ()
					return self.lostAndFoundIcon:SetScale( -0.45, 50 )
				end
			},
			{
				function ()
					return self.lostAndFoundIcon:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 150, 0, _1080p * 150, 0 )
				end
			}
		} )
		self._sequences.ChangeHealth4 = function ()
			lostAndFoundIcon:AnimateSequence( "ChangeHealth4" )
		end
		
		Timer:RegisterAnimationSequence( "PulseTimer", {
			{
				function ()
					return self.Timer:SetScale( 0.1, 100 )
				end,
				function ()
					return self.Timer:SetScale( -0.1, 150 )
				end
			},
			{
				function ()
					return self.Timer:SetRGBFromInt( 16711680, 100 )
				end,
				function ()
					return self.Timer:SetRGBFromInt( 16777215, 150 )
				end
			}
		} )
		self._sequences.PulseTimer = function ()
			Timer:AnimateSequence( "PulseTimer" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	Timer:SubscribeToModel( DataSources.inGame.CP.zombies.speakerDefenseHealth:GetModel( f3_local1 ), function ()
		if DataSources.inGame.CP.zombies.speakerDefenseHealth:GetValue( f3_local1 ) ~= nil and DataSources.inGame.CP.zombies.speakerDefenseHealth:GetValue( f3_local1 ) < 1 then
			ACTIONS.AnimateSequence( self, "PulseTimer" )
		end
	end )
	PostLoadFunc( self, f3_local1, controller )
	return self
end

MenuBuilder.registerType( "speakerDefenseIcon", speakerDefenseIcon )
LockTable( _M )
