local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function PostLoadFunc( f1_arg0, f1_arg1 )
	f1_arg0:SetupInWorldElement( {} )
	f1_arg0:SetInWorldScale( 0.25 )
	if Engine.GetDvarString( "ui_mapname" ) == "cp_final" then
		f1_arg0:SetWorldSpacePosition( 2194, -4153, 448 )
	else
		f1_arg0:SetWorldSpacePosition( -9757, 311.15, -1681 )
	end
	f1_arg0:SetWorldSpacePitch( 0 )
	f1_arg0:SetWorldSpaceYaw( 0 )
	f1_arg0:SetWorldSpaceRoll( 0 )
	f1_arg0.CurSpawned:SubscribeToModel( DataSources.inGame.CP.zombies.bball2Score:GetModel( f1_arg1 ), function ( f2_arg0 )
		local f2_local0 = DataModel.GetModelValue( f2_arg0 )
		if f2_local0 ~= nil then
			f1_arg0.CurSpawned:setText( f2_local0, 0 )
		end
	end, true )
	f1_arg0.CurDead:SubscribeToModel( DataSources.inGame.CP.zombies.bball2Time:GetModel( f1_arg1 ), function ( f3_arg0 )
		local f3_local0 = DataModel.GetModelValue( f3_arg0 )
		if f3_local0 ~= nil then
			f1_arg0.CurDead:setText( f3_local0, 0 )
		end
	end, true )
	f1_arg0.CurDeadCopy0:SubscribeToModel( DataSources.inGame.CP.zombies.bball2HiScore:GetModel( f1_arg1 ), function ( f4_arg0 )
		local f4_local0 = DataModel.GetModelValue( f4_arg0 )
		if f4_local0 ~= nil then
			f1_arg0.CurDeadCopy0:setText( f4_local0, 0 )
		end
	end, true )
end

function bballTwoScoreboard( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 491 * _1080p, 0, 81 * _1080p )
	self.id = "bballTwoScoreboard"
	self._animationSets = {}
	self._sequences = {}
	local f5_local1 = controller and controller.controllerIndex
	if not f5_local1 and not Engine.InFrontend() then
		f5_local1 = self:getRootController()
	end
	assert( f5_local1 )
	local f5_local2 = self
	local CurSpawned = nil
	
	CurSpawned = LUI.UIText.new()
	CurSpawned.id = "CurSpawned"
	CurSpawned:SetRGBFromTable( SWATCHES.HUD.inactive, 0 )
	CurSpawned:setText( "", 0 )
	CurSpawned:SetFontSize( 28 * _1080p )
	CurSpawned:SetFont( FONTS.GetFont( FONTS.Digital.File ) )
	CurSpawned:SetAlignment( LUI.Alignment.Center )
	CurSpawned:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 333.38, _1080p * 451.78, _1080p * 22.5, _1080p * 50.5 )
	self:addElement( CurSpawned )
	self.CurSpawned = CurSpawned
	
	local CurDead = nil
	
	CurDead = LUI.UIText.new()
	CurDead.id = "CurDead"
	CurDead:SetRGBFromTable( SWATCHES.HUD.inactive, 0 )
	CurDead:setText( "", 0 )
	CurDead:SetFontSize( 28 * _1080p )
	CurDead:SetFont( FONTS.GetFont( FONTS.Digital.File ) )
	CurDead:SetAlignment( LUI.Alignment.Center )
	CurDead:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 170.5, _1080p * 288.5, _1080p * 22.5, _1080p * 50.5 )
	self:addElement( CurDead )
	self.CurDead = CurDead
	
	local CurDeadCopy0 = nil
	
	CurDeadCopy0 = LUI.UIText.new()
	CurDeadCopy0.id = "CurDeadCopy0"
	CurDeadCopy0:SetRGBFromTable( SWATCHES.HUD.inactive, 0 )
	CurDeadCopy0:setText( "", 0 )
	CurDeadCopy0:SetFontSize( 28 * _1080p )
	CurDeadCopy0:SetFont( FONTS.GetFont( FONTS.Digital.File ) )
	CurDeadCopy0:SetAlignment( LUI.Alignment.Center )
	CurDeadCopy0:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 8.5, _1080p * 127.5, _1080p * 22.5, _1080p * 50.5 )
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
	PostLoadFunc( self, f5_local1, controller )
	ACTIONS.AnimateSequence( self, "show" )
	return self
end

MenuBuilder.registerType( "bballTwoScoreboard", bballTwoScoreboard )
LockTable( _M )
