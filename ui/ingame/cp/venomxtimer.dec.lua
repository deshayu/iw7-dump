local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function venomxTimer( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 491 * _1080p, 0, 189 * _1080p )
	self.id = "venomxTimer"
	self._animationSets = {}
	self._sequences = {}
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local timer = nil
	
	timer = LUI.UIText.new()
	timer.id = "timer"
	timer:SetRGBFromInt( 15144984, 0 )
	timer:SetScale( -0.1, 0 )
	timer:SetFontSize( 45 * _1080p )
	timer:SetFont( FONTS.GetFont( FONTS.Digital.File ) )
	timer:SetAlignment( LUI.Alignment.Center )
	timer:SetOptOutRightToLeftAlignmentFlip( true )
	timer:SetAnchorsAndPosition( 0, 1, 1, 0, _1080p * 170.03, _1080p * 268.64, _1080p * -173.5, _1080p * -133.5 )
	timer:SubscribeToModel( DataSources.inGame.CP.zombies.venomxTimer:GetModel( f1_local1 ), function ()
		local f2_local0 = DataSources.inGame.CP.zombies.venomxTimer:GetValue( f1_local1 )
		if f2_local0 ~= nil then
			timer:setText( f2_local0, 0 )
		end
	end )
	self:addElement( timer )
	self.timer = timer
	
	local glitch = nil
	
	glitch = LUI.UIText.new()
	glitch.id = "glitch"
	glitch:SetRGBFromInt( 15144984, 0 )
	glitch:setText( "%#&$^", 0 )
	glitch:SetFontSize( 20 * _1080p )
	glitch:SetFont( FONTS.GetFont( FONTS.MainExtended.File ) )
	glitch:SetAlignment( LUI.Alignment.Left )
	glitch:SetAnchorsAndPosition( 0, 1, 1, 0, _1080p * 194.39, _1080p * 284.61, _1080p * -167.5, _1080p * -147.5 )
	self:addElement( glitch )
	self.glitch = glitch
	
	local glitch1 = nil
	
	glitch1 = LUI.UIText.new()
	glitch1.id = "glitch1"
	glitch1:SetRGBFromInt( 15144984, 0 )
	glitch1:setText( "--#//--", 0 )
	glitch1:SetFontSize( 20 * _1080p )
	glitch1:SetFont( FONTS.GetFont( FONTS.MainExtended.File ) )
	glitch1:SetAlignment( LUI.Alignment.Left )
	glitch1:SetAnchorsAndPosition( 0, 1, 1, 0, _1080p * 194.39, _1080p * 284.61, _1080p * -167.5, _1080p * -147.5 )
	self:addElement( glitch1 )
	self.glitch1 = glitch1
	
	local glitch2 = nil
	
	glitch2 = LUI.UIText.new()
	glitch2.id = "glitch2"
	glitch2:SetRGBFromInt( 15144984, 0 )
	glitch2:setText( "---*-##%", 0 )
	glitch2:SetFontSize( 20 * _1080p )
	glitch2:SetFont( FONTS.GetFont( FONTS.MainExtended.File ) )
	glitch2:SetAlignment( LUI.Alignment.Left )
	glitch2:SetAnchorsAndPosition( 0, 1, 1, 0, _1080p * 194.39, _1080p * 284.61, _1080p * -167.5, _1080p * -147.5 )
	self:addElement( glitch2 )
	self.glitch2 = glitch2
	
	local glitch3 = nil
	
	glitch3 = LUI.UIText.new()
	glitch3.id = "glitch3"
	glitch3:SetRGBFromInt( 15144984, 0 )
	glitch3:setText( "NVSTROK", 0 )
	glitch3:SetFontSize( 20 * _1080p )
	glitch3:SetFont( FONTS.GetFont( FONTS.MainExtended.File ) )
	glitch3:SetAlignment( LUI.Alignment.Left )
	glitch3:SetAnchorsAndPosition( 0, 1, 1, 0, _1080p * 194.39, _1080p * 284.61, _1080p * -167.5, _1080p * -147.5 )
	self:addElement( glitch3 )
	self.glitch3 = glitch3
	
	self._animationSets.DefaultAnimationSet = function ()
		timer:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.timer:SetAlpha( 0, 0 )
				end
			}
		} )
		glitch:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.glitch:SetAlpha( 0, 0 )
				end
			}
		} )
		glitch1:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.glitch1:SetAlpha( 0, 0 )
				end
			}
		} )
		glitch2:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.glitch2:SetAlpha( 0, 0 )
				end
			}
		} )
		glitch3:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.glitch3:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.DefaultSequence = function ()
			timer:AnimateSequence( "DefaultSequence" )
			glitch:AnimateSequence( "DefaultSequence" )
			glitch1:AnimateSequence( "DefaultSequence" )
			glitch2:AnimateSequence( "DefaultSequence" )
			glitch3:AnimateSequence( "DefaultSequence" )
		end
		
		timer:RegisterAnimationSequence( "hideTimer", {
			{
				function ()
					return self.timer:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.hideTimer = function ()
			timer:AnimateSequence( "hideTimer" )
		end
		
		self._sequences.hideGlitch = function ()
			
		end
		
		timer:RegisterAnimationSequence( "showTimer", {
			{
				function ()
					return self.timer:SetAlpha( 1, 0 )
				end
			}
		} )
		glitch:RegisterAnimationSequence( "showTimer", {
			{
				function ()
					return self.glitch:SetAlpha( 0, 0 )
				end
			}
		} )
		glitch1:RegisterAnimationSequence( "showTimer", {
			{
				function ()
					return self.glitch1:SetAlpha( 0, 0 )
				end
			}
		} )
		glitch2:RegisterAnimationSequence( "showTimer", {
			{
				function ()
					return self.glitch2:SetAlpha( 0, 0 )
				end
			}
		} )
		glitch3:RegisterAnimationSequence( "showTimer", {
			{
				function ()
					return self.glitch3:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.showTimer = function ()
			timer:AnimateSequence( "showTimer" )
			glitch:AnimateSequence( "showTimer" )
			glitch1:AnimateSequence( "showTimer" )
			glitch2:AnimateSequence( "showTimer" )
			glitch3:AnimateSequence( "showTimer" )
		end
		
		timer:RegisterAnimationSequence( "showGlitch", {
			{
				function ()
					return self.timer:SetAlpha( 0, 0 )
				end
			}
		} )
		glitch:RegisterAnimationSequence( "showGlitch", {
			{
				function ()
					return self.glitch:SetAlpha( 0, 0 )
				end,
				function ()
					return self.glitch:SetAlpha( 0, 110 )
				end
			}
		} )
		glitch1:RegisterAnimationSequence( "showGlitch", {
			{
				function ()
					return self.glitch1:SetAlpha( 0, 0 )
				end,
				function ()
					return self.glitch1:SetAlpha( 0, 140 )
				end,
				function ()
					return self.glitch1:SetAlpha( 1, 30 )
				end,
				function ()
					return self.glitch1:SetAlpha( 1, 180 )
				end,
				function ()
					return self.glitch1:SetAlpha( 0, 10 )
				end
			}
		} )
		glitch2:RegisterAnimationSequence( "showGlitch", {
			{
				function ()
					return self.glitch2:SetAlpha( 0, 0 )
				end,
				function ()
					return self.glitch2:SetAlpha( 0, 390 )
				end,
				function ()
					return self.glitch2:SetAlpha( 1, 10 )
				end,
				function ()
					return self.glitch2:SetAlpha( 1, 340 )
				end,
				function ()
					return self.glitch2:SetAlpha( 0, 10 )
				end
			}
		} )
		glitch3:RegisterAnimationSequence( "showGlitch", {
			{
				function ()
					return self.glitch3:SetAlpha( 0, 0 )
				end,
				function ()
					return self.glitch3:SetAlpha( 0, 890 )
				end,
				function ()
					return self.glitch3:SetAlpha( 0, 20 )
				end,
				function ()
					return self.glitch3:SetAlpha( 1, 410 )
				end
			}
		} )
		self._sequences.showGlitch = function ()
			timer:AnimateLoop( "showGlitch" )
			glitch:AnimateLoop( "showGlitch" )
			glitch1:AnimateLoop( "showGlitch" )
			glitch2:AnimateLoop( "showGlitch" )
			glitch3:AnimateLoop( "showGlitch" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	self:SubscribeToModel( DataSources.inGame.CP.zombies.venomxTimer:GetModel( f1_local1 ), function ()
		if DataSources.inGame.CP.zombies.venomxTimer:GetValue( f1_local1 ) ~= nil and DataSources.inGame.CP.zombies.venomxTimer:GetValue( f1_local1 ) > 0 then
			ACTIONS.AnimateSequence( self, "showTimer" )
		end
		if DataSources.inGame.CP.zombies.venomxTimer:GetValue( f1_local1 ) ~= nil and DataSources.inGame.CP.zombies.venomxTimer:GetValue( f1_local1 ) == -1 then
			ACTIONS.AnimateSequence( self, "showGlitch" )
		end
		if DataSources.inGame.CP.zombies.venomxTimer:GetValue( f1_local1 ) ~= nil and DataSources.inGame.CP.zombies.venomxTimer:GetValue( f1_local1 ) == 0 then
			ACTIONS.AnimateSequence( self, "DefaultSequence" )
		end
	end )
	ACTIONS.AnimateSequence( self, "DefaultSequence" )
	return self
end

MenuBuilder.registerType( "venomxTimer", venomxTimer )
LockTable( _M )
