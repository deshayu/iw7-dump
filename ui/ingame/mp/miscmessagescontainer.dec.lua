local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function ShowMessageHelper( f1_arg0, f1_arg1 )
	return function ()
		local f2_local0 = Engine.TableLookupByRow( CSV.mpMiscMessages.file, Game.GetOmnvar( "ui_misc_message_id" ), CSV.mpMiscMessages.cols.displayTime )
		if not f2_local0 or f2_local0 == "" then
			f2_local0 = 1000
		else
			f2_local0 = tonumber( f2_local0 ) * 1000
		end
		if f1_arg0.hideTimer then
			f1_arg0.hideTimer:close()
		end
		local self = LUI.UITimer.new( nil, {
			interval = f2_local0,
			event = "hide_misc_message",
			broadcastToRoot = false,
			disposable = true
		} )
		f1_arg0.hideTimer = self
		f1_arg0:addElement( self )
		f1_arg0.MiscMessages:AnimateSequence( "Show" )
	end
	
end

function PostLoadFunc( f3_arg0, f3_arg1 )
	f3_arg0.MiscMessages:AnimateSequence( "Hide" )
	f3_arg0:SubscribeToModel( DataSources.inGame.MP.splashes.miscMessages.showMessage:GetModel( f3_arg1 ), ShowMessageHelper( f3_arg0, f3_arg1 ), true )
	f3_arg0:registerEventHandler( "hide_misc_message", function ( element, event )
		element.MiscMessages:AnimateSequence( "Hide" )
	end )
end

function MiscMessagesContainer( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 400 * _1080p, 0, 42 * _1080p )
	self.id = "MiscMessagesContainer"
	self._animationSets = {}
	self._sequences = {}
	local f5_local1 = controller and controller.controllerIndex
	if not f5_local1 and not Engine.InFrontend() then
		f5_local1 = self:getRootController()
	end
	assert( f5_local1 )
	local f5_local2 = self
	local MiscMessages = nil
	
	MiscMessages = MenuBuilder.BuildRegisteredType( "MiscMessages", {
		controllerIndex = f5_local1
	} )
	MiscMessages.id = "MiscMessages"
	MiscMessages:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 400, 0, _1080p * 42 )
	self:addElement( MiscMessages )
	self.MiscMessages = MiscMessages
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		MiscMessages:RegisterAnimationSequence( "Show", {
			{
				function ()
					return self.MiscMessages:SetScale( -0.7, 0 )
				end,
				function ()
					return self.MiscMessages:SetScale( 0, 150, LUI.EASING.outBack )
				end
			},
			{
				function ()
					return self.MiscMessages:SetAlpha( 0.5, 0 )
				end,
				function ()
					return self.MiscMessages:SetAlpha( 1, 150, LUI.EASING.outBack )
				end
			},
			{
				function ()
					return self.MiscMessages:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -483, _1080p * -83, _1080p * -38.3, _1080p * 3.7, 0 )
				end,
				function ()
					return self.MiscMessages:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 400, 0, _1080p * 42, 150, LUI.EASING.outBack )
				end
			}
		} )
		self._sequences.Show = function ()
			MiscMessages:AnimateSequence( "Show" )
		end
		
		MiscMessages:RegisterAnimationSequence( "Hide", {
			{
				function ()
					return self.MiscMessages:SetAlpha( 1, 0 )
				end,
				function ()
					return self.MiscMessages:SetAlpha( 0, 100 )
				end
			}
		} )
		self._sequences.Hide = function ()
			MiscMessages:AnimateSequence( "Hide" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	PostLoadFunc( self, f5_local1, controller )
	return self
end

MenuBuilder.registerType( "MiscMessagesContainer", MiscMessagesContainer )
LockTable( _M )
