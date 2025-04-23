local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function PostLoadFunc( f1_arg0, f1_arg1 )
	f1_arg0:SetupInWorldElement( {} )
	f1_arg0:SetInWorldScale( 0.25 )
	f1_arg0:SetWorldSpacePosition( 2239.5, -1058, 228.25 )
	f1_arg0:SetWorldSpacePitch( 0 )
	f1_arg0:SetWorldSpaceYaw( 45 )
	f1_arg0:SetWorldSpaceRoll( 0 )
	f1_arg0:SubscribeToModel( DataSources.inGame.CP.zombies.skeeballArcadePower:GetModel( f1_arg1 ), function ( f2_arg0 )
		if DataModel.GetModelValue( f2_arg0 ) == 1 then
			ACTIONS.AnimateSequence( f1_arg0, "show" )
		else
			ACTIONS.AnimateSequence( f1_arg0, "onCreate" )
		end
	end )
end

function bballThreeScoreboard( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 491 * _1080p, 0, 81 * _1080p )
	self.id = "bballThreeScoreboard"
	self._animationSets = {}
	self._sequences = {}
	local f3_local1 = controller and controller.controllerIndex
	if not f3_local1 and not Engine.InFrontend() then
		f3_local1 = self:getRootController()
	end
	assert( f3_local1 )
	local f3_local2 = self
	local CurSpawned = nil
	
	CurSpawned = LUI.UIText.new()
	CurSpawned.id = "CurSpawned"
	CurSpawned:SetRGBFromTable( SWATCHES.HUD.inactive, 0 )
	CurSpawned:SetFontSize( 28 * _1080p )
	CurSpawned:SetFont( FONTS.GetFont( FONTS.Digital.File ) )
	CurSpawned:SetAlignment( LUI.Alignment.Center )
	CurSpawned:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 316.38, _1080p * 434.78, _1080p * 24.5, _1080p * 52.5 )
	CurSpawned:SubscribeToModel( DataSources.inGame.CP.zombies.bball3Score:GetModel( f3_local1 ), function ()
		local f4_local0 = DataSources.inGame.CP.zombies.bball3Score:GetValue( f3_local1 )
		if f4_local0 ~= nil then
			CurSpawned:setText( f4_local0, 0 )
		end
	end )
	self:addElement( CurSpawned )
	self.CurSpawned = CurSpawned
	
	local CurDead = nil
	
	CurDead = LUI.UIText.new()
	CurDead.id = "CurDead"
	CurDead:SetRGBFromTable( SWATCHES.HUD.inactive, 0 )
	CurDead:SetFontSize( 28 * _1080p )
	CurDead:SetFont( FONTS.GetFont( FONTS.Digital.File ) )
	CurDead:SetAlignment( LUI.Alignment.Center )
	CurDead:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 155.5, _1080p * 273.5, _1080p * 24.5, _1080p * 52.5 )
	CurDead:SubscribeToModel( DataSources.inGame.CP.zombies.bball3Time:GetModel( f3_local1 ), function ()
		local f5_local0 = DataSources.inGame.CP.zombies.bball3Time:GetValue( f3_local1 )
		if f5_local0 ~= nil then
			CurDead:setText( f5_local0, 0 )
		end
	end )
	self:addElement( CurDead )
	self.CurDead = CurDead
	
	local CurDeadCopy0 = nil
	
	CurDeadCopy0 = LUI.UIText.new()
	CurDeadCopy0.id = "CurDeadCopy0"
	CurDeadCopy0:SetRGBFromTable( SWATCHES.HUD.inactive, 0 )
	CurDeadCopy0:SetFontSize( 28 * _1080p )
	CurDeadCopy0:SetFont( FONTS.GetFont( FONTS.Digital.File ) )
	CurDeadCopy0:SetAlignment( LUI.Alignment.Center )
	CurDeadCopy0:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -13.5, _1080p * 105.5, _1080p * 24.5, _1080p * 52.5 )
	CurDeadCopy0:SubscribeToModel( DataSources.inGame.CP.zombies.bball3HiScore:GetModel( f3_local1 ), function ()
		local f6_local0 = DataSources.inGame.CP.zombies.bball3HiScore:GetValue( f3_local1 )
		if f6_local0 ~= nil then
			CurDeadCopy0:setText( f6_local0, 0 )
		end
	end )
	self:addElement( CurDeadCopy0 )
	self.CurDeadCopy0 = CurDeadCopy0
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		CurSpawned:RegisterAnimationSequence( "onCreate", {
			{
				function ()
					return self.CurSpawned:SetAlpha( 0, 0 )
				end
			}
		} )
		CurDead:RegisterAnimationSequence( "onCreate", {
			{
				function ()
					return self.CurDead:SetAlpha( 0, 0 )
				end
			}
		} )
		CurDeadCopy0:RegisterAnimationSequence( "onCreate", {
			{
				function ()
					return self.CurDeadCopy0:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.onCreate = function ()
			CurSpawned:AnimateSequence( "onCreate" )
			CurDead:AnimateSequence( "onCreate" )
			CurDeadCopy0:AnimateSequence( "onCreate" )
		end
		
		CurSpawned:RegisterAnimationSequence( "show", {
			{
				function ()
					return self.CurSpawned:SetAlpha( 1, 0 )
				end
			}
		} )
		CurDead:RegisterAnimationSequence( "show", {
			{
				function ()
					return self.CurDead:SetAlpha( 1, 0 )
				end
			}
		} )
		CurDeadCopy0:RegisterAnimationSequence( "show", {
			{
				function ()
					return self.CurDeadCopy0:SetAlpha( 1, 0 )
				end
			}
		} )
		self._sequences.show = function ()
			CurSpawned:AnimateSequence( "show" )
			CurDead:AnimateSequence( "show" )
			CurDeadCopy0:AnimateSequence( "show" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	PostLoadFunc( self, f3_local1, controller )
	return self
end

MenuBuilder.registerType( "bballThreeScoreboard", bballThreeScoreboard )
LockTable( _M )
