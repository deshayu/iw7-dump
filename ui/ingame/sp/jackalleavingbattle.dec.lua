local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function PostLoadFunc( f1_arg0, f1_arg1 )
	assert( f1_arg0.LeavingBattleText, "WARNING: Jackal Leaving Battle Items Are Missing..." )
	f1_arg0:SetBlendMode( BLEND_MODE.addWithAlpha )
	local f1_local0 = f1_arg0.LeavingBattleText
	f1_local0:SetShadowMinDistance( -0.2, 0 )
	f1_local0:SetShadowMaxDistance( 0.2, 0 )
	f1_local0:SetShadowRGBFromInt( 0, 0 )
	f1_local0:SetShadowUOffset( -0 )
	f1_local0:SetShadowVOffset( -0 )
	f1_arg0:SubscribeToModel( DataSources.inGame.jackal.mapboundarywarning:GetModel( f1_arg1 ), function ()
		local f2_local0 = function ( f3_arg0, f3_arg1 )
			local f3_local0 = f3_arg1.controller or controller
			if DataSources.inGame.jackal.mapboundarywarning:GetValue( f1_arg1 ) ~= nil and DataSources.inGame.jackal.mapboundarywarning:GetValue( f1_arg1 ) == true then
				ACTIONS.AnimateSequence( f1_arg0, "on" )
			end
			if DataSources.inGame.jackal.mapboundarywarning:GetValue( f1_arg1 ) ~= nil and DataSources.inGame.jackal.mapboundarywarning:GetValue( f1_arg1 ) == false then
				ACTIONS.AnimateSequence( f1_arg0, "off" )
			end
		end
		
		f2_local0( f1_arg0, {
			name = "datasource_event"
		} )
	end, true )
end

function JackalLeavingBattle( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 600 * _1080p, 0, 100 * _1080p )
	self.id = "JackalLeavingBattle"
	self._animationSets = {}
	self._sequences = {}
	local f4_local1 = controller and controller.controllerIndex
	if not f4_local1 and not Engine.InFrontend() then
		f4_local1 = self:getRootController()
	end
	assert( f4_local1 )
	local f4_local2 = self
	local Frame = nil
	
	Frame = LUI.UIImage.new()
	Frame.id = "Frame"
	Frame:SetRGBFromTable( SWATCHES.jackal.warning, 0 )
	Frame:setImage( RegisterMaterial( "hud_jackal_warning_frame" ), 0 )
	Frame:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -256, _1080p * 256, _1080p * -7, _1080p * 121 )
	self:addElement( Frame )
	self.Frame = Frame
	
	local LeavingBattleText = nil
	
	LeavingBattleText = LUI.UIStyledText.new()
	LeavingBattleText.id = "LeavingBattleText"
	LeavingBattleText:SetRGBFromTable( SWATCHES.jackal.warning, 0 )
	LeavingBattleText:setText( ToUpperCase( Engine.Localize( "JACKAL_LEAVING_BATTLE" ) ), 0 )
	LeavingBattleText:SetFontSize( 36 * _1080p )
	LeavingBattleText:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	LeavingBattleText:SetAlignment( LUI.Alignment.Center )
	LeavingBattleText:SetAnchorsAndPosition( 0, 0, 0.5, 0.5, 0, 0, _1080p * -1, _1080p * 35 )
	self:addElement( LeavingBattleText )
	self.LeavingBattleText = LeavingBattleText
	
	self._animationSets.DefaultAnimationSet = function ()
		Frame:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.Frame:SetAlpha( 0, 0 )
				end
			}
		} )
		LeavingBattleText:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.LeavingBattleText:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.DefaultSequence = function ()
			Frame:AnimateSequence( "DefaultSequence" )
			LeavingBattleText:AnimateSequence( "DefaultSequence" )
		end
		
		Frame:RegisterAnimationSequence( "off", {
			{
				function ()
					return self.Frame:SetAlpha( 0, 100 )
				end
			}
		} )
		LeavingBattleText:RegisterAnimationSequence( "off", {
			{
				function ()
					return self.LeavingBattleText:SetAlpha( 0, 100 )
				end
			}
		} )
		self._sequences.off = function ()
			Frame:AnimateSequence( "off" )
			LeavingBattleText:AnimateSequence( "off" )
		end
		
		Frame:RegisterAnimationSequence( "on", {
			{
				function ()
					return self.Frame:SetAlpha( 1, 0 )
				end,
				function ()
					return self.Frame:SetAlpha( 0.5, 50 )
				end,
				function ()
					return self.Frame:SetAlpha( 1, 50 )
				end
			}
		} )
		LeavingBattleText:RegisterAnimationSequence( "on", {
			{
				function ()
					return self.LeavingBattleText:SetAlpha( 1, 0 )
				end,
				function ()
					return self.LeavingBattleText:SetAlpha( 0.5, 50 )
				end,
				function ()
					return self.LeavingBattleText:SetAlpha( 1, 50 )
				end
			}
		} )
		self._sequences.on = function ()
			Frame:AnimateLoop( "on" )
			LeavingBattleText:AnimateLoop( "on" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	self:SubscribeToModel( DataSources.inGame.jackal.mapboundarywarning:GetModel( f4_local1 ), function ()
		if DataSources.inGame.jackal.mapboundarywarning:GetValue( f4_local1 ) ~= nil and DataSources.inGame.jackal.mapboundarywarning:GetValue( f4_local1 ) == true then
			ACTIONS.AnimateSequence( self, "on" )
		end
		if DataSources.inGame.jackal.mapboundarywarning:GetValue( f4_local1 ) ~= nil and DataSources.inGame.jackal.mapboundarywarning:GetValue( f4_local1 ) == false then
			ACTIONS.AnimateSequence( self, "off" )
		end
	end )
	PostLoadFunc( self, f4_local1, controller )
	ACTIONS.AnimateSequence( self, "DefaultSequence" )
	return self
end

MenuBuilder.registerType( "JackalLeavingBattle", JackalLeavingBattle )
LockTable( _M )
