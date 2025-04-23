local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function BossTimerContainer( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 1920 * _1080p, 0, 1080 * _1080p )
	self.id = "BossTimerContainer"
	self._animationSets = {}
	self._sequences = {}
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local box = nil
	
	box = LUI.UIImage.new()
	box.id = "box"
	box:SetRGBFromInt( 0, 0 )
	box:SetAlpha( 0, 0 )
	box:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 714.47, _1080p * 1096.4, _1080p * 32.84, _1080p * 140.16 )
	self:addElement( box )
	self.box = box
	
	local beginsIn = nil
	
	beginsIn = LUI.UIText.new()
	beginsIn.id = "beginsIn"
	beginsIn:SetRGBFromTable( SWATCHES.Zombies.menuHeader, 0 )
	beginsIn:SetAlpha( 0, 0 )
	beginsIn:setText( Engine.Localize( "DIRECT_BOSS_FIGHT_BEGINS_IN" ), 0 )
	beginsIn:SetFontSize( 50 * _1080p )
	beginsIn:SetFont( FONTS.GetFont( FONTS.ZmClean.File ) )
	beginsIn:SetAlignment( LUI.Alignment.Center )
	beginsIn:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 630.5, _1080p * 1289.5, _1080p * 77, _1080p * 127 )
	self:addElement( beginsIn )
	self.beginsIn = beginsIn
	
	local BossTimer = nil
	
	BossTimer = MenuBuilder.BuildRegisteredType( "BossTimer", {
		controllerIndex = f1_local1
	} )
	BossTimer.id = "BossTimer"
	BossTimer:SetAlpha( 0, 0 )
	BossTimer:SetYRotation( 16, 0 )
	BossTimer:SetZRotation( -3, 0 )
	BossTimer:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 200, _1080p * 4, _1080p * 54 )
	self:addElement( BossTimer )
	self.BossTimer = BossTimer
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		box:RegisterAnimationSequence( "afterlife", {
			{
				function ()
					return self.box:SetAlpha( 0, 0 )
				end,
				function ()
					return self.box:SetAlpha( 0.5, 190 )
				end
			},
			{
				function ()
					return self.box:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 775.47, _1080p * 1157.47, _1080p * 48, _1080p * 140.16, 0 )
				end
			}
		} )
		beginsIn:RegisterAnimationSequence( "afterlife", {
			{
				function ()
					return self.beginsIn:SetAlpha( 0, 0 )
				end,
				function ()
					return self.beginsIn:SetAlpha( 1, 190 )
				end
			},
			{
				function ()
					return self.beginsIn:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 636.5, _1080p * 1295.5, _1080p * 52, _1080p * 102, 0 )
				end
			}
		} )
		BossTimer:RegisterAnimationSequence( "afterlife", {
			{
				function ()
					return self.BossTimer:SetAlpha( 0, 0 )
				end,
				function ()
					return self.BossTimer:SetAlpha( 1, 190 )
				end
			},
			{
				function ()
					return self.BossTimer:SetYRotation( 0, 0 )
				end
			},
			{
				function ()
					return self.BossTimer:SetZRotation( 0, 0 )
				end
			},
			{
				function ()
					return self.BossTimer.scoreBox:SetAlpha( 0, 190 )
				end
			},
			{
				function ()
					return self.BossTimer:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 866, _1080p * 1066, _1080p * 95, _1080p * 145, 0 )
				end
			}
		} )
		self._sequences.afterlife = function ()
			box:AnimateSequence( "afterlife" )
			beginsIn:AnimateSequence( "afterlife" )
			BossTimer:AnimateSequence( "afterlife" )
		end
		
		BossTimer:RegisterAnimationSequence( "bossBattle", {
			{
				function ()
					return self.BossTimer:SetYRotation( 16, 0 )
				end
			},
			{
				function ()
					return self.BossTimer:SetZRotation( -3, 0 )
				end
			},
			{
				function ()
					return self.BossTimer.scoreBox:SetAlpha( 0.5, 0 )
				end
			},
			{
				function ()
					return self.BossTimer:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.BossTimer:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 200, _1080p * 4, _1080p * 54, 0 )
				end
			}
		} )
		self._sequences.bossBattle = function ()
			BossTimer:AnimateSequence( "bossBattle" )
		end
		
		box:RegisterAnimationSequence( "hide", {
			{
				function ()
					return self.box:SetAlpha( 0, 0 )
				end
			}
		} )
		beginsIn:RegisterAnimationSequence( "hide", {
			{
				function ()
					return self.beginsIn:SetAlpha( 0, 0 )
				end
			}
		} )
		BossTimer:RegisterAnimationSequence( "hide", {
			{
				function ()
					return self.BossTimer:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.hide = function ()
			box:AnimateSequence( "hide" )
			beginsIn:AnimateSequence( "hide" )
			BossTimer:AnimateSequence( "hide" )
		end
		
		box:RegisterAnimationSequence( "splitscreenAfterlife", {
			{
				function ()
					return self.box:SetAlpha( 0, 0 )
				end,
				function ()
					return self.box:SetAlpha( 0.4, 190 )
				end
			},
			{
				function ()
					return self.box:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 918, _1080p * 1300, _1080p * 40, _1080p * 132, 0 )
				end
			}
		} )
		beginsIn:RegisterAnimationSequence( "splitscreenAfterlife", {
			{
				function ()
					return self.beginsIn:SetAlpha( 0, 0 )
				end,
				function ()
					return self.beginsIn:SetAlpha( 1, 190 )
				end
			},
			{
				function ()
					return self.beginsIn:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 780.5, _1080p * 1439.5, _1080p * 42.5, _1080p * 92.5, 0 )
				end
			}
		} )
		BossTimer:RegisterAnimationSequence( "splitscreenAfterlife", {
			{
				function ()
					return self.BossTimer:SetAlpha( 0, 0 )
				end,
				function ()
					return self.BossTimer:SetAlpha( 1, 190 )
				end
			},
			{
				function ()
					return self.BossTimer:SetYRotation( 0, 0 )
				end
			},
			{
				function ()
					return self.BossTimer:SetZRotation( 0, 0 )
				end
			},
			{
				function ()
					return self.BossTimer.scoreBox:SetAlpha( 0, 0 )
				end
			},
			{
				function ()
					return self.BossTimer:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1010, _1080p * 1210, _1080p * 85.5, _1080p * 135.5, 0 )
				end
			}
		} )
		self._sequences.splitscreenAfterlife = function ()
			box:AnimateSequence( "splitscreenAfterlife" )
			beginsIn:AnimateSequence( "splitscreenAfterlife" )
			BossTimer:AnimateSequence( "splitscreenAfterlife" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	self:SubscribeToModel( DataSources.inGame.CP.zombies.bossSplash:GetModel( f1_local1 ), function ()
		if DataSources.inGame.CP.zombies.bossSplash:GetValue( f1_local1 ) ~= nil and DataSources.inGame.CP.zombies.bossSplash:GetValue( f1_local1 ) == 2 then
			ACTIONS.AnimateSequence( self, "bossBattle" )
		end
		if DataSources.inGame.CP.zombies.bossSplash:GetValue( f1_local1 ) ~= nil and DataSources.inGame.CP.zombies.bossSplash:GetValue( f1_local1 ) == 4 then
			ACTIONS.AnimateSequence( self, "hide" )
		end
		if DataSources.inGame.CP.zombies.bossSplash:GetValue( f1_local1 ) ~= nil and DataSources.inGame.CP.zombies.bossSplash:GetValue( f1_local1 ) == 3 and not CONDITIONS.IsSplitscreen( self ) then
			ACTIONS.AnimateSequence( self, "afterlife" )
		end
		if DataSources.inGame.CP.zombies.bossSplash:GetValue( f1_local1 ) ~= nil and DataSources.inGame.CP.zombies.bossSplash:GetValue( f1_local1 ) == 3 and CONDITIONS.IsSplitscreen( self ) then
			ACTIONS.AnimateSequence( self, "afterlife" )
		end
	end )
	return self
end

MenuBuilder.registerType( "BossTimerContainer", BossTimerContainer )
LockTable( _M )
