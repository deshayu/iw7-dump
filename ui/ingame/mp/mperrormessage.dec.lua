local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ( f1_arg0, f1_arg1, f1_arg2 )
	assert( f1_arg0.ErrorMessage, "WARNING: Error Message Items Are Missing..." )
	local f1_local0 = f1_arg0.ErrorMessage
	f1_local0:SetShadowMinDistance( -0.2, 0 )
	f1_local0:SetShadowMaxDistance( 0.2, 0 )
	f1_local0:SetShadowRGBFromInt( 0, 0 )
	f1_local0:SetShadowUOffset( -0 )
	f1_local0:SetShadowVOffset( -0 )
	local f1_local1 = 0
	local f1_local2 = false
	local f1_local3 = function ()
		if DataSources.inGame.HUD.hints.messageShow:GetValue( f1_arg1 ) then
			DataSources.inGame.MP.match.timeOfLastServerError:SetValue( f1_arg1, 0 )
		end
		if f1_local1 == 1 then
			ACTIONS.AnimateSequence( f1_arg0, "Hide" )
			DebugPrint( "HIDE" )
		end
		f1_local1 = math.max( f1_local1 - 1, 0 )
	end
	
	local f1_local4 = 1900
	local f1_local5 = function ()
		if DataSources.inGame.MP.match.errorMessage:GetValue( f1_arg1 ) ~= nil and DataSources.inGame.MP.match.errorMessage:GetValue( f1_arg1 ) ~= "" then
			ACTIONS.AnimateSequence( f1_arg0, "Show" )
			DebugPrint( "SHOW" )
			f1_local1 = f1_local1 + 1
			if DataSources.inGame.HUD.hints.messageShow:GetValue( f1_arg1 ) then
				if f1_local2 then
					local f3_local0 = f1_arg0:Wait( f1_local4 )
					f3_local0.onComplete = f1_local3
				end
				f1_local2 = true
			else
				local f3_local0 = f1_arg0:Wait( f1_local4 )
				f3_local0.onComplete = f1_local3
			end
		elseif f1_local2 then
			f1_local2 = false
			f1_local3()
		end
	end
	
	f1_arg0:SubscribeToModel( DataSources.inGame.MP.match.errorTrigger:GetModel( f1_arg1 ), f1_local5 )
	f1_arg0:SubscribeToModel( DataSources.inGame.MP.match.errorMessage:GetModel( f1_arg1 ), f1_local5 )
	f1_arg0:SubscribeToModel( DataSources.inGame.HUD.hints.messageShow:GetModel( f1_arg1 ), function ()
		if DataSources.inGame.HUD.hints.messageShow:GetValue( f1_arg1 ) == false then
			f1_local2 = false
			f1_local3()
		end
	end )
end

function MPErrorMessage( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 600 * _1080p, 0, 50 * _1080p )
	self.id = "MPErrorMessage"
	self._animationSets = {}
	self._sequences = {}
	local f5_local1 = controller and controller.controllerIndex
	if not f5_local1 and not Engine.InFrontend() then
		f5_local1 = self:getRootController()
	end
	assert( f5_local1 )
	local f5_local2 = self
	local ErrorMessage = nil
	
	ErrorMessage = LUI.UIStyledText.new()
	ErrorMessage.id = "ErrorMessage"
	ErrorMessage:SetFontSize( 32 * _1080p )
	ErrorMessage:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	ErrorMessage:SetAlignment( LUI.Alignment.Center )
	ErrorMessage:SetAnchorsAndPosition( 0, 0, 0.5, 0.5, 0, 0, _1080p * -16, _1080p * 16 )
	ErrorMessage:SubscribeToModel( DataSources.inGame.MP.match.errorMessage:GetModel( f5_local1 ), function ()
		local f6_local0 = DataSources.inGame.MP.match.errorMessage:GetValue( f5_local1 )
		if f6_local0 ~= nil then
			ErrorMessage:setText( f6_local0, 0 )
		end
	end )
	self:addElement( ErrorMessage )
	self.ErrorMessage = ErrorMessage
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		ErrorMessage:RegisterAnimationSequence( "Show", {
			{
				function ()
					return self.ErrorMessage:SetAlpha( 0, 0 )
				end,
				function ()
					return self.ErrorMessage:SetAlpha( 1, 100 )
				end,
				function ()
					return self.ErrorMessage:SetAlpha( 1, 100 )
				end
			}
		} )
		self._sequences.Show = function ()
			ErrorMessage:AnimateSequence( "Show" )
		end
		
		ErrorMessage:RegisterAnimationSequence( "Hide", {
			{
				function ()
					return self.ErrorMessage:SetAlpha( 1, 0 )
				end,
				function ()
					return self.ErrorMessage:SetAlpha( 0, 100 )
				end
			}
		} )
		self._sequences.Hide = function ()
			ErrorMessage:AnimateSequence( "Hide" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	f0_local0( self, f5_local1, controller )
	return self
end

MenuBuilder.registerType( "MPErrorMessage", MPErrorMessage )
LockTable( _M )
