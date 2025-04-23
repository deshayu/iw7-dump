local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function gateOpened( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 557 * _1080p, 0, 46 * _1080p )
	self.id = "gateOpened"
	self._animationSets = {}
	self._sequences = {}
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local gateOpened = nil
	
	gateOpened = LUI.UIText.new()
	gateOpened.id = "gateOpened"
	gateOpened:setText( "Gate    Opened!", 0 )
	gateOpened:SetFontSize( 45 * _1080p )
	gateOpened:SetFont( FONTS.GetFont( FONTS.Dev.File ) )
	gateOpened:SetAlignment( LUI.Alignment.Center )
	gateOpened:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 28.5, _1080p * 528.5, 0, _1080p * 45 )
	self:addElement( gateOpened )
	self.gateOpened = gateOpened
	
	local gateNum = nil
	
	gateNum = LUI.UIText.new()
	gateNum.id = "gateNum"
	gateNum:SetFontSize( 45 * _1080p )
	gateNum:SetFont( FONTS.GetFont( FONTS.Dev.File ) )
	gateNum:SetAlignment( LUI.Alignment.Left )
	gateNum:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 222.5, _1080p * 292.5, 0, _1080p * 45 )
	gateNum:SubscribeToModel( DataSources.inGame.CP.zombies.waveNumber:GetModel( f1_local1 ), function ()
		local f2_local0 = DataSources.inGame.CP.zombies.waveNumber:GetValue( f1_local1 )
		if f2_local0 ~= nil then
			gateNum:setText( f2_local0, 0 )
		end
	end )
	self:addElement( gateNum )
	self.gateNum = gateNum
	
	self._animationSets.DefaultAnimationSet = function ()
		gateOpened:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.gateOpened:SetAlpha( 0, 0 )
				end
			}
		} )
		gateNum:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.gateNum:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.DefaultSequence = function ()
			gateOpened:AnimateSequence( "DefaultSequence" )
			gateNum:AnimateSequence( "DefaultSequence" )
		end
		
		gateOpened:RegisterAnimationSequence( "gateOpened", {
			{
				function ()
					return self.gateOpened:SetAlpha( 0, 0 )
				end,
				function ()
					return self.gateOpened:SetAlpha( 1, 500 )
				end,
				function ()
					return self.gateOpened:SetAlpha( 1, 1500 )
				end,
				function ()
					return self.gateOpened:SetAlpha( 0, 400 )
				end
			}
		} )
		gateNum:RegisterAnimationSequence( "gateOpened", {
			{
				function ()
					return self.gateNum:SetAlpha( 0, 0 )
				end,
				function ()
					return self.gateNum:SetAlpha( 1, 500 )
				end,
				function ()
					return self.gateNum:SetAlpha( 1, 1500 )
				end,
				function ()
					return self.gateNum:SetAlpha( 0, 400 )
				end
			}
		} )
		self._sequences.gateOpened = function ()
			gateOpened:AnimateSequence( "gateOpened" )
			gateNum:AnimateSequence( "gateOpened" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	self:SubscribeToModel( DataSources.inGame.CP.zombies.waveNumber:GetModel( f1_local1 ), function ()
		ACTIONS.AnimateSequence( self, "gateOpened" )
	end )
	ACTIONS.AnimateSequence( self, "DefaultSequence" )
	return self
end

MenuBuilder.registerType( "gateOpened", gateOpened )
LockTable( _M )
