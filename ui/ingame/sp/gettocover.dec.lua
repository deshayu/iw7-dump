local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function GetToCover( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 600 * _1080p, 0, 60 * _1080p )
	self.id = "GetToCover"
	self._animationSets = {}
	self._sequences = {}
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local getToCover = nil
	
	getToCover = LUI.UIStyledText.new()
	getToCover.id = "getToCover"
	getToCover:SetAlpha( 0, 0 )
	getToCover:SetFontSize( 38 * _1080p )
	getToCover:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	getToCover:SetAlignment( LUI.Alignment.Center )
	getToCover:SetShadowMinDistance( -0.2, 0 )
	getToCover:SetShadowMaxDistance( 0.2, 0 )
	getToCover:SetShadowUOffset( 0, 0 )
	getToCover:SetShadowRGBFromInt( 11524607, 0 )
	getToCover:SetDecodeUseSystemTime( false )
	getToCover:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -300, _1080p * 300, _1080p * -19, _1080p * 19 )
	getToCover:SubscribeToModel( DataSources.inGame.SP.player.getToCoverText:GetModel( f1_local1 ), function ()
		local f2_local0 = DataSources.inGame.SP.player.getToCoverText:GetValue( f1_local1 )
		if f2_local0 ~= nil then
			getToCover:setText( LocalizeString( f2_local0 ), 0 )
		end
	end )
	self:addElement( getToCover )
	self.getToCover = getToCover
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		getToCover:RegisterAnimationSequence( "Severity10", {
			{
				function ()
					return self.getToCover:SetAlpha( 1, 0 )
				end,
				function ()
					return self.getToCover:SetAlpha( 1, 240 )
				end,
				function ()
					return self.getToCover:SetAlpha( 0.7, 460, LUI.EASING.inQuadratic )
				end,
				function ()
					return self.getToCover:SetAlpha( 1, 100 )
				end
			},
			{
				function ()
					return self.getToCover:SetShadowMinDistance( 0, 0 )
				end
			},
			{
				function ()
					return self.getToCover:SetShadowMaxDistance( 0, 0 )
				end
			},
			{
				function ()
					return self.getToCover:SetOutlineMinDistance( -0.5, 0 )
				end
			},
			{
				function ()
					return self.getToCover:SetOutlineMaxDistance( 0.5, 0 )
				end
			},
			{
				function ()
					return self.getToCover:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -300, _1080p * 300, _1080p * -24, _1080p * 24, 0 )
				end,
				function ()
					return self.getToCover:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -300, _1080p * 300, _1080p * -24, _1080p * 24, 239 )
				end,
				function ()
					return self.getToCover:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -300, _1080p * 300, _1080p * -22, _1080p * 22, 459, LUI.EASING.inQuadratic )
				end,
				function ()
					return self.getToCover:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -300, _1080p * 300, _1080p * -24, _1080p * 24, 100 )
				end
			}
		} )
		self._sequences.Severity10 = function ()
			getToCover:AnimateLoop( "Severity10" )
		end
		
		getToCover:RegisterAnimationSequence( "Severity09", {
			{
				function ()
					return self.getToCover:SetAlpha( 1, 0 )
				end,
				function ()
					return self.getToCover:SetAlpha( 1, 240 )
				end,
				function ()
					return self.getToCover:SetAlpha( 0.7, 460, LUI.EASING.inQuadratic )
				end,
				function ()
					return self.getToCover:SetAlpha( 1, 100 )
				end
			},
			{
				function ()
					return self.getToCover:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -300, _1080p * 300, _1080p * -24, _1080p * 24, 0 )
				end,
				function ()
					return self.getToCover:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -300, _1080p * 300, _1080p * -24, _1080p * 24, 239 )
				end,
				function ()
					return self.getToCover:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -300, _1080p * 300, _1080p * -22, _1080p * 22, 459, LUI.EASING.inQuadratic )
				end,
				function ()
					return self.getToCover:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -300, _1080p * 300, _1080p * -24, _1080p * 24, 100 )
				end
			}
		} )
		self._sequences.Severity09 = function ()
			getToCover:AnimateLoop( "Severity09" )
		end
		
		getToCover:RegisterAnimationSequence( "Severity65", {
			{
				function ()
					return self.getToCover:SetAlpha( 1, 0 )
				end,
				function ()
					return self.getToCover:SetAlpha( 1, 240 )
				end,
				function ()
					return self.getToCover:SetAlpha( 0.7, 460, LUI.EASING.inQuadratic )
				end,
				function ()
					return self.getToCover:SetAlpha( 1, 100 )
				end
			},
			{
				function ()
					return self.getToCover:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -300, _1080p * 300, _1080p * -24, _1080p * 24, 0 )
				end,
				function ()
					return self.getToCover:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -300, _1080p * 300, _1080p * -24, _1080p * 24, 239 )
				end,
				function ()
					return self.getToCover:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -300, _1080p * 300, _1080p * -22, _1080p * 22, 459, LUI.EASING.inQuadratic )
				end,
				function ()
					return self.getToCover:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -300, _1080p * 300, _1080p * -24, _1080p * 24, 100 )
				end
			}
		} )
		self._sequences.Severity65 = function ()
			getToCover:AnimateLoop( "Severity65" )
		end
		
		getToCover:RegisterAnimationSequence( "Severity0", {
			{
				function ()
					return self.getToCover:SetAlpha( 1, 0 )
				end,
				function ()
					return self.getToCover:SetAlpha( 0, 500 )
				end
			}
		} )
		self._sequences.Severity0 = function ()
			getToCover:AnimateSequence( "Severity0" )
		end
		
		getToCover:RegisterAnimationSequence( "off", {
			{
				function ()
					return self.getToCover:SetAlpha( 0, 250 )
				end
			}
		} )
		self._sequences.off = function ()
			getToCover:AnimateSequence( "off" )
		end
		
		getToCover:RegisterAnimationSequence( "offInstant", {
			{
				function ()
					return self.getToCover:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.offInstant = function ()
			getToCover:AnimateSequence( "offInstant" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	getToCover:SubscribeToModel( DataSources.inGame.SP.player.getToCoverState:GetModel( f1_local1 ), function ()
		if DataSources.inGame.SP.player.getToCoverState:GetValue( f1_local1 ) ~= nil and DataSources.inGame.SP.player.getToCoverState:GetValue( f1_local1 ) == 1 then
			ACTIONS.AnimateSequence( self, "Severity10" )
		end
		if DataSources.inGame.SP.player.getToCoverState:GetValue( f1_local1 ) ~= nil and DataSources.inGame.SP.player.getToCoverState:GetValue( f1_local1 ) == 2 then
			ACTIONS.AnimateSequence( self, "Severity09" )
		end
		if DataSources.inGame.SP.player.getToCoverState:GetValue( f1_local1 ) ~= nil and DataSources.inGame.SP.player.getToCoverState:GetValue( f1_local1 ) == 3 then
			ACTIONS.AnimateSequence( self, "Severity65" )
		end
		if DataSources.inGame.SP.player.getToCoverState:GetValue( f1_local1 ) ~= nil and DataSources.inGame.SP.player.getToCoverState:GetValue( f1_local1 ) == 4 then
			ACTIONS.AnimateSequence( self, "Severity0" )
		end
		if DataSources.inGame.SP.player.getToCoverState:GetValue( f1_local1 ) ~= nil and DataSources.inGame.SP.player.getToCoverState:GetValue( f1_local1 ) == 0 then
			ACTIONS.AnimateSequence( self, "off" )
		end
		if DataSources.inGame.SP.player.getToCoverState:GetValue( f1_local1 ) ~= nil and DataSources.inGame.SP.player.getToCoverState:GetValue( f1_local1 ) == 5 then
			ACTIONS.AnimateSequence( self, "offInstant" )
		end
	end )
	return self
end

MenuBuilder.registerType( "GetToCover", GetToCover )
LockTable( _M )
