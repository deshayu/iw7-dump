local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function PostLoadFunc( f1_arg0, f1_arg1 )
	assert( f1_arg0.Background and f1_arg0.CornerNodes, "WARNING: Jackal weapon temp message items are missing..." )
	f1_arg0.Background:SetBlendMode( BLEND_MODE.addWithAlpha )
	f1_arg0.CornerNodes:SetBlendMode( BLEND_MODE.addWithAlpha )
	f1_arg0:SubscribeToModel( DataSources.inGame.jackal.weaponOverheat:GetModel( f1_arg1 ), function ()
		local f2_local0 = function ( f3_arg0, f3_arg1 )
			local f3_local0 = f3_arg1.controller or controller
			if DataSources.inGame.jackal.weaponOverheat:GetValue( f1_arg1 ) ~= nil and DataSources.inGame.jackal.weaponOverheat:GetValue( f1_arg1 ) == true then
				ACTIONS.AnimateSequence( f1_arg0, "overheatOn" )
			end
			if DataSources.inGame.jackal.weaponOverheat:GetValue( f1_arg1 ) ~= nil and DataSources.inGame.jackal.weaponOverheat:GetValue( f1_arg1 ) == false then
				ACTIONS.AnimateSequence( f1_arg0, "overheatOff" )
			end
		end
		
		f2_local0( f1_arg0, {
			name = "datasource_event"
		} )
	end, true )
end

function JackalWeaponTempMessage( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 250 * _1080p, 0, 26 * _1080p )
	self.id = "JackalWeaponTempMessage"
	self._animationSets = {}
	self._sequences = {}
	local f4_local1 = controller and controller.controllerIndex
	if not f4_local1 and not Engine.InFrontend() then
		f4_local1 = self:getRootController()
	end
	assert( f4_local1 )
	local f4_local2 = self
	local Background = nil
	
	Background = LUI.UIImage.new()
	Background.id = "Background"
	Background:SetRGBFromTable( SWATCHES.jackal.warning, 0 )
	Background:SetAlpha( 0.5, 0 )
	self:addElement( Background )
	self.Background = Background
	
	local CornerNodes = nil
	
	CornerNodes = MenuBuilder.BuildRegisteredType( "GenericFrameCornerNodes", {
		controllerIndex = f4_local1
	} )
	CornerNodes.id = "CornerNodes"
	CornerNodes:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * -4, _1080p * 4, _1080p * -4, _1080p * 5 )
	self:addElement( CornerNodes )
	self.CornerNodes = CornerNodes
	
	local MessageText = nil
	
	MessageText = LUI.UIText.new()
	MessageText.id = "MessageText"
	MessageText:SetRGBFromInt( 0, 0 )
	MessageText:setText( "WEAPON OVERHEAT", 0 )
	MessageText:SetFontSize( 20 * _1080p )
	MessageText:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	MessageText:SetAlignment( LUI.Alignment.Center )
	MessageText:SetAnchorsAndPosition( 0, 0, 0.5, 0.5, 0, 0, _1080p * -10, _1080p * 10 )
	self:addElement( MessageText )
	self.MessageText = MessageText
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		Background:RegisterAnimationSequence( "overheatOn", {
			{
				function ()
					return self.Background:SetAlpha( 0.5, 0 )
				end,
				function ()
					return self.Background:SetAlpha( 1, 50 )
				end,
				function ()
					return self.Background:SetAlpha( 0.5, 50 )
				end
			},
			{
				function ()
					return self.Background:SetRGBFromTable( SWATCHES.jackal.warning, 0 )
				end
			}
		} )
		CornerNodes:RegisterAnimationSequence( "overheatOn", {
			{
				function ()
					return self.CornerNodes:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.CornerNodes:SetScale( 0, 0 )
				end
			},
			{
				function ()
					return self.CornerNodes:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * -4, _1080p * 4, _1080p * -4, _1080p * 5, 0 )
				end
			}
		} )
		MessageText:RegisterAnimationSequence( "overheatOn", {
			{
				function ()
					return self.MessageText:SetAlpha( 1, 0 )
				end
			}
		} )
		self._sequences.overheatOn = function ()
			Background:AnimateLoop( "overheatOn" )
			CornerNodes:AnimateLoop( "overheatOn" )
			MessageText:AnimateLoop( "overheatOn" )
		end
		
		Background:RegisterAnimationSequence( "overheatOff", {
			{
				function ()
					return self.Background:SetAlpha( 0.5, 0 )
				end,
				function ()
					return self.Background:SetAlpha( 0.5, 200 )
				end,
				function ()
					return self.Background:SetAlpha( 0, 100 )
				end
			}
		} )
		CornerNodes:RegisterAnimationSequence( "overheatOff", {
			{
				function ()
					return self.CornerNodes:SetAlpha( 1, 0 )
				end,
				function ()
					return self.CornerNodes:SetAlpha( 1, 200 )
				end,
				function ()
					return self.CornerNodes:SetAlpha( 0, 300, LUI.EASING.inBack )
				end
			},
			{
				function ()
					return self.CornerNodes:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * -4, _1080p * 4, _1080p * -4, _1080p * 5, 0 )
				end,
				function ()
					return self.CornerNodes:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * -4, _1080p * 4, _1080p * -4, _1080p * 5, 200 )
				end,
				function ()
					return self.CornerNodes:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * 122, _1080p * -122, _1080p * 10, _1080p * -10, 299, LUI.EASING.inBack )
				end
			}
		} )
		MessageText:RegisterAnimationSequence( "overheatOff", {
			{
				function ()
					return self.MessageText:SetAlpha( 1, 0 )
				end,
				function ()
					return self.MessageText:SetAlpha( 1, 200 )
				end,
				function ()
					return self.MessageText:SetAlpha( 0, 100 )
				end
			}
		} )
		self._sequences.overheatOff = function ()
			Background:AnimateSequence( "overheatOff" )
			CornerNodes:AnimateSequence( "overheatOff" )
			MessageText:AnimateSequence( "overheatOff" )
		end
		
		Background:RegisterAnimationSequence( "default", {
			{
				function ()
					return self.Background:SetAlpha( 0, 0 )
				end
			}
		} )
		CornerNodes:RegisterAnimationSequence( "default", {
			{
				function ()
					return self.CornerNodes:SetAlpha( 0, 0 )
				end
			}
		} )
		MessageText:RegisterAnimationSequence( "default", {
			{
				function ()
					return self.MessageText:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.default = function ()
			Background:AnimateSequence( "default" )
			CornerNodes:AnimateSequence( "default" )
			MessageText:AnimateSequence( "default" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	self:SubscribeToModel( DataSources.inGame.jackal.weaponOverheat:GetModel( f4_local1 ), function ()
		if DataSources.inGame.jackal.weaponOverheat:GetValue( f4_local1 ) ~= nil and DataSources.inGame.jackal.weaponOverheat:GetValue( f4_local1 ) == true then
			ACTIONS.AnimateSequence( self, "overheatOn" )
		end
		if DataSources.inGame.jackal.weaponOverheat:GetValue( f4_local1 ) ~= nil and DataSources.inGame.jackal.weaponOverheat:GetValue( f4_local1 ) == false then
			ACTIONS.AnimateSequence( self, "overheatOff" )
		end
	end )
	PostLoadFunc( self, f4_local1, controller )
	ACTIONS.AnimateSequence( self, "default" )
	return self
end

MenuBuilder.registerType( "JackalWeaponTempMessage", JackalWeaponTempMessage )
LockTable( _M )
