local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ( f1_arg0, f1_arg1 )
	f1_arg0:SubscribeToModel( DataSources.inGame.SP.savingCheckpoint:GetModel( f1_arg1 ), function ()
		if DataSources.inGame.SP.savingCheckpoint:GetValue( f1_arg1 ) ~= nil and DataSources.inGame.SP.savingCheckpoint:GetValue( f1_arg1 ) == false and DataSources.inGame.SP.savingCheckpointSucceeded:GetValue( f1_arg1 ) ~= nil and DataSources.inGame.SP.savingCheckpointSucceeded:GetValue( f1_arg1 ) == true then
			f1_arg0.TextCheckpointReached:setText( "", 0 )
			f1_arg0.TextCheckpointReached:setText( Engine.Localize( "EXE_CHECKPOINT_REACHED" ), 0 )
		end
	end )
end

function CheckpointReached( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 800 * _1080p, 0, 100 * _1080p )
	self.id = "CheckpointReached"
	self._animationSets = {}
	self._sequences = {}
	local f3_local1 = controller and controller.controllerIndex
	if not f3_local1 and not Engine.InFrontend() then
		f3_local1 = self:getRootController()
	end
	assert( f3_local1 )
	local f3_local2 = self
	local TextCheckpointReached = nil
	
	TextCheckpointReached = LUI.UIStyledText.new()
	TextCheckpointReached.id = "TextCheckpointReached"
	TextCheckpointReached:SetRGBFromTable( SWATCHES.HUD.spinnerText, 0 )
	TextCheckpointReached:SetAlpha( 0, 0 )
	TextCheckpointReached:setText( Engine.Localize( "EXE_CHECKPOINT_REACHED" ), 0 )
	TextCheckpointReached:SetFontSize( 38 * _1080p )
	TextCheckpointReached:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	TextCheckpointReached:SetAlignment( LUI.Alignment.Left )
	TextCheckpointReached:SetOptOutRightToLeftAlignmentFlip( true )
	TextCheckpointReached:SetShadowMinDistance( -0.2, 0 )
	TextCheckpointReached:SetShadowMaxDistance( 0.2, 0 )
	TextCheckpointReached:SetDecodeLetterLength( 40 )
	TextCheckpointReached:SetDecodeMaxRandChars( 1 )
	TextCheckpointReached:SetDecodeUpdatesPerLetter( 1 )
	TextCheckpointReached:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 50, _1080p * 765.39, _1080p * 2.5, _1080p * 40.5 )
	self:addElement( TextCheckpointReached )
	self.TextCheckpointReached = TextCheckpointReached
	
	local Spinner = nil
	
	Spinner = MenuBuilder.BuildRegisteredType( "Spinner", {
		controllerIndex = f3_local1
	} )
	Spinner.id = "Spinner"
	Spinner:SetRGBFromTable( SWATCHES.HUD.spinner, 0 )
	Spinner:SetAlpha( 0, 0 )
	Spinner:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 40, 0, _1080p * 40 )
	self:addElement( Spinner )
	self.Spinner = Spinner
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		Spinner:RegisterAnimationSequence( "StartSaving", {
			{
				function ()
					return self.Spinner:SetAlpha( 0, 0 )
				end,
				function ()
					return self.Spinner:SetAlpha( 1, 200 )
				end
			}
		} )
		self._sequences.StartSaving = function ()
			Spinner:AnimateSequence( "StartSaving" )
		end
		
		TextCheckpointReached:RegisterAnimationSequence( "DoneSavingSuccess", {
			{
				function ()
					return self.TextCheckpointReached:SetAlpha( 1, 0 )
				end,
				function ()
					return self.TextCheckpointReached:SetAlpha( 1, 500 )
				end,
				function ()
					return self.TextCheckpointReached:SetAlpha( 0, 2000 )
				end
			}
		} )
		Spinner:RegisterAnimationSequence( "DoneSavingSuccess", {
			{
				function ()
					return self.Spinner:SetAlpha( 1, 0 )
				end,
				function ()
					return self.Spinner:SetAlpha( 1, 500 )
				end,
				function ()
					return self.Spinner:SetAlpha( 0, 2000 )
				end
			}
		} )
		self._sequences.DoneSavingSuccess = function ()
			TextCheckpointReached:AnimateSequence( "DoneSavingSuccess" )
			Spinner:AnimateSequence( "DoneSavingSuccess" )
		end
		
		Spinner:RegisterAnimationSequence( "DoneSavingFailed", {
			{
				function ()
					return self.Spinner:SetAlpha( 1, 0 )
				end,
				function ()
					return self.Spinner:SetAlpha( 0, 1990 )
				end
			}
		} )
		self._sequences.DoneSavingFailed = function ()
			Spinner:AnimateSequence( "DoneSavingFailed" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	self:SubscribeToModel( DataSources.inGame.SP.savingCheckpoint:GetModel( f3_local1 ), function ()
		if DataSources.inGame.SP.savingCheckpoint:GetValue( f3_local1 ) ~= nil and DataSources.inGame.SP.savingCheckpoint:GetValue( f3_local1 ) == true then
			ACTIONS.AnimateSequence( self, "StartSaving" )
		end
		if DataSources.inGame.SP.savingCheckpoint:GetValue( f3_local1 ) ~= nil and DataSources.inGame.SP.savingCheckpoint:GetValue( f3_local1 ) == false and DataSources.inGame.SP.savingCheckpointSucceeded:GetValue( f3_local1 ) ~= nil and DataSources.inGame.SP.savingCheckpointSucceeded:GetValue( f3_local1 ) == true then
			ACTIONS.AnimateSequence( self, "DoneSavingSuccess" )
		end
		if DataSources.inGame.SP.savingCheckpoint:GetValue( f3_local1 ) ~= nil and DataSources.inGame.SP.savingCheckpoint:GetValue( f3_local1 ) == false and DataSources.inGame.SP.savingCheckpointSucceeded:GetValue( f3_local1 ) ~= nil and DataSources.inGame.SP.savingCheckpointSucceeded:GetValue( f3_local1 ) == false then
			ACTIONS.AnimateSequence( self, "DoneSavingFailed" )
		end
	end )
	f0_local0( self, f3_local1, controller )
	return self
end

MenuBuilder.registerType( "CheckpointReached", CheckpointReached )
LockTable( _M )
