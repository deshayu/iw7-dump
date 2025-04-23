local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function JackalLockonWarning( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 250 * _1080p, 0, 32 * _1080p )
	self.id = "JackalLockonWarning"
	self._animationSets = {}
	self._sequences = {}
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local missileIncoming = nil
	
	missileIncoming = LUI.UIText.new()
	missileIncoming.id = "missileIncoming"
	missileIncoming:SetRGBFromInt( 16711680, 0 )
	missileIncoming:setText( ToUpperCase( Engine.Localize( "JACKAL_INCOMING_MISSILES" ) ), 0 )
	missileIncoming:SetFontSize( 24 * _1080p )
	missileIncoming:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	missileIncoming:SetAlignment( LUI.Alignment.Center )
	missileIncoming:SetAnchorsAndPosition( 0, 0, 0.5, 0.5, _1080p * 30, _1080p * -30, _1080p * -12, _1080p * 12 )
	self:addElement( missileIncoming )
	self.missileIncoming = missileIncoming
	
	local exclaimation1Incoming = nil
	
	exclaimation1Incoming = LUI.UIImage.new()
	exclaimation1Incoming.id = "exclaimation1Incoming"
	exclaimation1Incoming:SetRGBFromInt( 16711683, 0 )
	exclaimation1Incoming:setImage( RegisterMaterial( "hud_icon_warning" ), 0 )
	exclaimation1Incoming:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -32, 0, 0, _1080p * 32 )
	self:addElement( exclaimation1Incoming )
	self.exclaimation1Incoming = exclaimation1Incoming
	
	local exclaimation2Incoming = nil
	
	exclaimation2Incoming = LUI.UIImage.new()
	exclaimation2Incoming.id = "exclaimation2Incoming"
	exclaimation2Incoming:SetRGBFromInt( 16711692, 0 )
	exclaimation2Incoming:setImage( RegisterMaterial( "hud_icon_warning" ), 0 )
	exclaimation2Incoming:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 32, 0, _1080p * 32 )
	self:addElement( exclaimation2Incoming )
	self.exclaimation2Incoming = exclaimation2Incoming
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		missileIncoming:RegisterAnimationSequence( "incoming_on", {
			{
				function ()
					return self.missileIncoming:SetRGBFromInt( 16713984, 0 )
				end,
				function ()
					return self.missileIncoming:SetRGBFromInt( 16766163, 100 )
				end,
				function ()
					return self.missileIncoming:SetRGBFromInt( 16713984, 100 )
				end
			},
			{
				function ()
					return self.missileIncoming:SetAlpha( 1, 0 )
				end,
				function ()
					return self.missileIncoming:SetAlpha( 1, 200 )
				end
			}
		} )
		exclaimation1Incoming:RegisterAnimationSequence( "incoming_on", {
			{
				function ()
					return self.exclaimation1Incoming:SetRGBFromInt( 16713984, 0 )
				end,
				function ()
					return self.exclaimation1Incoming:SetRGBFromInt( 16770532, 100 )
				end,
				function ()
					return self.exclaimation1Incoming:SetRGBFromInt( 16713984, 100 )
				end
			},
			{
				function ()
					return self.exclaimation1Incoming:SetAlpha( 1, 0 )
				end,
				function ()
					return self.exclaimation1Incoming:SetAlpha( 1, 200 )
				end
			}
		} )
		exclaimation2Incoming:RegisterAnimationSequence( "incoming_on", {
			{
				function ()
					return self.exclaimation2Incoming:SetRGBFromInt( 16713984, 0 )
				end,
				function ()
					return self.exclaimation2Incoming:SetRGBFromInt( 16767704, 100 )
				end,
				function ()
					return self.exclaimation2Incoming:SetRGBFromInt( 16713984, 100 )
				end
			},
			{
				function ()
					return self.exclaimation2Incoming:SetAlpha( 1, 0 )
				end,
				function ()
					return self.exclaimation2Incoming:SetAlpha( 1, 200 )
				end
			}
		} )
		self._sequences.incoming_on = function ()
			missileIncoming:AnimateLoop( "incoming_on" )
			exclaimation1Incoming:AnimateLoop( "incoming_on" )
			exclaimation2Incoming:AnimateLoop( "incoming_on" )
		end
		
		missileIncoming:RegisterAnimationSequence( "incoming_off", {
			{
				function ()
					return self.missileIncoming:SetAlpha( 0, 0 )
				end
			}
		} )
		exclaimation1Incoming:RegisterAnimationSequence( "incoming_off", {
			{
				function ()
					return self.exclaimation1Incoming:SetAlpha( 0, 0 )
				end
			}
		} )
		exclaimation2Incoming:RegisterAnimationSequence( "incoming_off", {
			{
				function ()
					return self.exclaimation2Incoming:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.incoming_off = function ()
			missileIncoming:AnimateSequence( "incoming_off" )
			exclaimation1Incoming:AnimateSequence( "incoming_off" )
			exclaimation2Incoming:AnimateSequence( "incoming_off" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	self:SubscribeToModel( DataSources.inGame.jackal.missileIncoming:GetModel( f1_local1 ), function ()
		if DataSources.inGame.jackal.missileIncoming:GetValue( f1_local1 ) ~= nil and DataSources.inGame.jackal.missileIncoming:GetValue( f1_local1 ) == true then
			ACTIONS.AnimateSequence( self, "incoming_on" )
		end
		if DataSources.inGame.jackal.missileIncoming:GetValue( f1_local1 ) ~= nil and DataSources.inGame.jackal.missileIncoming:GetValue( f1_local1 ) == false then
			ACTIONS.AnimateSequence( self, "incoming_off" )
		end
	end )
	return self
end

MenuBuilder.registerType( "JackalLockonWarning", JackalLockonWarning )
LockTable( _M )
