local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function PostLoadFunc( f1_arg0, f1_arg1, f1_arg2 )
	assert( f1_arg0.Text )
	assert( f1_arg0.MiscMessageBG )
	local f1_local0 = Game.GetTime()
	local f1_local1 = f1_arg0.Text
	f1_local1:SetShadowUOffset( -0 )
	f1_local1:SetShadowVOffset( -0 )
	ACTIONS.AnimateSequence( f1_arg0, "Default" )
	ACTIONS.AnimateSequence( f1_arg0.MiscMessageBG, "Default" )
	local f1_local2 = LUI.AggregateDataSource.new( DataSources.inGame.SP.SPFluffMessage, {
		DataSources.inGame.SP.SPFluffMessageContext,
		DataSources.inGame.SP.SPFluffMessage
	}, "SPFluffMessageAggregate", function ()
		if Game.GetTime() - f1_local0 > 1000 then
			local f2_local0 = DataSources.inGame.SP.SPFluffMessage:GetValue( f1_arg1 )
			if f2_local0 == "none" then
				ACTIONS.AnimateSequence( f1_arg0, "Default" )
				ACTIONS.AnimateSequence( f1_arg0.MiscMessageBG, "Default" )
			elseif f2_local0 ~= nil then
				local f2_local1 = DataSources.inGame.SP.SPFluffMessageContext:GetValue( f1_arg1 )
				if f2_local1 ~= nil then
					if f2_local1 == true then
						ACTIONS.AnimateSequence( f1_arg0, "MessageOn" )
						ACTIONS.AnimateSequence( f1_arg0.MiscMessageBG, "MessageOn" )
					else
						ACTIONS.AnimateSequence( f1_arg0, "MessageOnNegative" )
						ACTIONS.AnimateSequence( f1_arg0.MiscMessageBG, "MessageOnNegative" )
					end
				end
				return f2_local0
			end
		end
		return nil
	end )
	f1_local1:SubscribeToModel( f1_local2:GetModel( f1_arg1 ), function ()
		local f3_local0 = f1_local2:GetValue( f1_arg1 )
		if f3_local0 ~= nil then
			local f3_local1 = ToUpperCase( Engine.Localize( f3_local0 ) )
			local f3_local2, f3_local3, f3_local4, f3_local5 = f1_arg0.Text:getLocalRect()
			local f3_local6, f3_local7, f3_local8, f3_local9 = GetTextDimensions( f3_local1, f1_local1:GetCurrentFont(), math.abs( f3_local5 - f3_local3 ), math.abs( f3_local4 - f3_local2 ) )
			f1_arg0.MiscMessageBG:SetBottom( f3_local7 - f3_local9 + 7 * _1080p, 0 )
			f1_local1:setText( f3_local1, 0 )
		end
	end )
end

function MiscMessage( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 300 * _1080p, 0, 25 * _1080p )
	self.id = "MiscMessage"
	self._animationSets = {}
	self._sequences = {}
	local f4_local1 = controller and controller.controllerIndex
	if not f4_local1 and not Engine.InFrontend() then
		f4_local1 = self:getRootController()
	end
	assert( f4_local1 )
	local f4_local2 = self
	local MiscMessageBG = nil
	
	MiscMessageBG = MenuBuilder.BuildRegisteredType( "MiscMessageBG", {
		controllerIndex = f4_local1
	} )
	MiscMessageBG.id = "MiscMessageBG"
	MiscMessageBG:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 300, 0, _1080p * 25 )
	self:addElement( MiscMessageBG )
	self.MiscMessageBG = MiscMessageBG
	
	local Text = nil
	
	Text = LUI.UIStyledText.new()
	Text.id = "Text"
	Text:setText( "MISCELLANEOUS MESSAGE", 0 )
	Text:SetFontSize( 18 * _1080p )
	Text:SetFont( FONTS.GetFont( FONTS.MainExtended.File ) )
	Text:SetAlignment( LUI.Alignment.Left )
	Text:SetShadowMinDistance( -0.2, 0 )
	Text:SetShadowMaxDistance( 0.2, 0 )
	Text:SetShadowRGBFromInt( 0, 0 )
	Text:SetDecodeLetterLength( 25 )
	Text:SetDecodeMaxRandChars( 3 )
	Text:SetDecodeUpdatesPerLetter( 4 )
	Text:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 17, _1080p * 300, _1080p * 3.5, _1080p * 21.5 )
	self:addElement( Text )
	self.Text = Text
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		Text:RegisterAnimationSequence( "MessageOn", {
			{
				function ()
					return self.Text:SetAlpha( 0, 0 )
				end,
				function ()
					return self.Text:SetAlpha( 0, 400 )
				end,
				function ()
					return self.Text:SetAlpha( 1, 200, LUI.EASING.outBack )
				end,
				function ()
					return self.Text:SetAlpha( 1, 3200 )
				end,
				function ()
					return self.Text:SetAlpha( 0, 100 )
				end
			},
			{
				function ()
					return self.Text:SetRGBFromInt( 16777215, 0 )
				end
			}
		} )
		self._sequences.MessageOn = function ()
			Text:AnimateSequence( "MessageOn" )
		end
		
		Text:RegisterAnimationSequence( "Default", {
			{
				function ()
					return self.Text:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.Default = function ()
			Text:AnimateSequence( "Default" )
		end
		
		Text:RegisterAnimationSequence( "MessageOnNegative", {
			{
				function ()
					return self.Text:SetAlpha( 0, 0 )
				end,
				function ()
					return self.Text:SetAlpha( 0, 400 )
				end,
				function ()
					return self.Text:SetAlpha( 1, 200, LUI.EASING.outBack )
				end,
				function ()
					return self.Text:SetAlpha( 1, 3200 )
				end,
				function ()
					return self.Text:SetAlpha( 0, 100 )
				end
			},
			{
				function ()
					return self.Text:SetRGBFromInt( 16730184, 0 )
				end
			}
		} )
		self._sequences.MessageOnNegative = function ()
			Text:AnimateSequence( "MessageOnNegative" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	PostLoadFunc( self, f4_local1, controller )
	return self
end

MenuBuilder.registerType( "MiscMessage", MiscMessage )
LockTable( _M )
