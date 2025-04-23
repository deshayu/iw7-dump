local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function PostLoadFunc( f1_arg0, f1_arg1, f1_arg2 )
	
end

function OpsmapTutorial( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 1920 * _1080p, 0, 1080 * _1080p )
	self.id = "OpsmapTutorial"
	self._animationSets = {}
	self._sequences = {}
	local f2_local1 = controller and controller.controllerIndex
	if not f2_local1 and not Engine.InFrontend() then
		f2_local1 = self:getRootController()
	end
	assert( f2_local1 )
	local f2_local2 = self
	self:setUseStencil( true )
	local TutLabel1 = nil
	
	TutLabel1 = LUI.UIStyledText.new()
	TutLabel1.id = "TutLabel1"
	TutLabel1:SetAlpha( 0, 0 )
	TutLabel1:setText( Engine.Localize( "MENU_SP_OPSMAP_TUT_1_A" ), 0 )
	TutLabel1:SetFontSize( 24 * _1080p )
	TutLabel1:SetFont( FONTS.GetFont( FONTS.MainExtended.File ) )
	TutLabel1:SetAlignment( LUI.Alignment.Left )
	TutLabel1:SetOptOutRightToLeftAlignmentFlip( true )
	TutLabel1:SetDecodeLetterLength( 10 )
	TutLabel1:SetDecodeMaxRandChars( 10 )
	TutLabel1:SetDecodeUpdatesPerLetter( 10 )
	TutLabel1:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 241.02, _1080p * 741.02, _1080p * 243, _1080p * 264 )
	self:addElement( TutLabel1 )
	self.TutLabel1 = TutLabel1
	
	local TutLabel1Copy0 = nil
	
	TutLabel1Copy0 = LUI.UIStyledText.new()
	TutLabel1Copy0.id = "TutLabel1Copy0"
	TutLabel1Copy0:SetRGBFromInt( 8421504, 0 )
	TutLabel1Copy0:SetAlpha( 0, 0 )
	TutLabel1Copy0:setText( Engine.Localize( "MENU_SP_OPSMAP_TUT_1_B" ), 0 )
	TutLabel1Copy0:SetFontSize( 12 * _1080p )
	TutLabel1Copy0:SetFont( FONTS.GetFont( FONTS.MainExtended.File ) )
	TutLabel1Copy0:SetAlignment( LUI.Alignment.Left )
	TutLabel1Copy0:SetOptOutRightToLeftAlignmentFlip( true )
	TutLabel1Copy0:SetDecodeLetterLength( 1 )
	TutLabel1Copy0:SetDecodeMaxRandChars( 10 )
	TutLabel1Copy0:SetDecodeUpdatesPerLetter( 1 )
	TutLabel1Copy0:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 241.02, _1080p * 741.02, _1080p * 264, _1080p * 276 )
	self:addElement( TutLabel1Copy0 )
	self.TutLabel1Copy0 = TutLabel1Copy0
	
	local TutLabel1Copy1 = nil
	
	TutLabel1Copy1 = LUI.UIStyledText.new()
	TutLabel1Copy1.id = "TutLabel1Copy1"
	TutLabel1Copy1:SetRGBFromInt( 15819327, 0 )
	TutLabel1Copy1:SetAlpha( 0, 0 )
	TutLabel1Copy1:setText( Engine.Localize( "MENU_SP_OPSMAP_TUT_1_C" ), 0 )
	TutLabel1Copy1:SetFontSize( 16 * _1080p )
	TutLabel1Copy1:SetFont( FONTS.GetFont( FONTS.MainExtended.File ) )
	TutLabel1Copy1:SetAlignment( LUI.Alignment.Left )
	TutLabel1Copy1:SetOptOutRightToLeftAlignmentFlip( true )
	TutLabel1Copy1:SetDecodeLetterLength( 2 )
	TutLabel1Copy1:SetDecodeMaxRandChars( 10 )
	TutLabel1Copy1:SetDecodeUpdatesPerLetter( 1 )
	TutLabel1Copy1:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 241.02, _1080p * 741.02, _1080p * 298, _1080p * 314 )
	self:addElement( TutLabel1Copy1 )
	self.TutLabel1Copy1 = TutLabel1Copy1
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		TutLabel1:RegisterAnimationSequence( "Tut1", {
			{
				function ()
					return self.TutLabel1:SetAlpha( 0, 0 )
				end,
				function ()
					return self.TutLabel1:SetAlpha( 0, 300 )
				end,
				function ()
					return self.TutLabel1:SetAlpha( 1, 10 )
				end,
				function ()
					return self.TutLabel1:SetAlpha( 0, 10 )
				end,
				function ()
					return self.TutLabel1:SetAlpha( 1, 20 )
				end,
				function ()
					return self.TutLabel1:SetAlpha( 0, 10 )
				end,
				function ()
					return self.TutLabel1:SetAlpha( 1, 150 )
				end,
				function ()
					return self.TutLabel1:SetAlpha( 1, 3500 )
				end,
				function ()
					return self.TutLabel1:SetAlpha( 0, 10 )
				end,
				function ()
					return self.TutLabel1:SetAlpha( 1, 10 )
				end,
				function ()
					return self.TutLabel1:SetAlpha( 0, 20 )
				end,
				function ()
					return self.TutLabel1:SetAlpha( 1, 10 )
				end,
				function ()
					return self.TutLabel1:SetAlpha( 0, 150 )
				end
			},
			{
				function ()
					return self.TutLabel1:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 241.02, _1080p * 741.02, _1080p * 243, _1080p * 264, 4000 )
				end,
				function ()
					return self.TutLabel1:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 322.02, _1080p * 822.02, _1080p * 243, _1080p * 264, 1000 )
				end
			}
		} )
		TutLabel1Copy0:RegisterAnimationSequence( "Tut1", {
			{
				function ()
					return self.TutLabel1Copy0:SetAlpha( 0, 0 )
				end,
				function ()
					return self.TutLabel1Copy0:SetAlpha( 0, 350 )
				end,
				function ()
					return self.TutLabel1Copy0:SetAlpha( 1, 10 )
				end,
				function ()
					return self.TutLabel1Copy0:SetAlpha( 0, 10 )
				end,
				function ()
					return self.TutLabel1Copy0:SetAlpha( 1, 20 )
				end,
				function ()
					return self.TutLabel1Copy0:SetAlpha( 0, 10 )
				end,
				function ()
					return self.TutLabel1Copy0:SetAlpha( 1, 130 )
				end,
				function ()
					return self.TutLabel1Copy0:SetAlpha( 1, 3590 )
				end,
				function ()
					return self.TutLabel1Copy0:SetAlpha( 0, 10 )
				end,
				function ()
					return self.TutLabel1Copy0:SetAlpha( 1, 10 )
				end,
				function ()
					return self.TutLabel1Copy0:SetAlpha( 0, 20 )
				end,
				function ()
					return self.TutLabel1Copy0:SetAlpha( 1, 10 )
				end,
				function ()
					return self.TutLabel1Copy0:SetAlpha( 0, 130 )
				end
			},
			{
				function ()
					return self.TutLabel1Copy0:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 241.02, _1080p * 741.02, _1080p * 264, _1080p * 276, 4119 )
				end,
				function ()
					return self.TutLabel1Copy0:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 336.02, _1080p * 836.02, _1080p * 264, _1080p * 276, 380 )
				end
			}
		} )
		TutLabel1Copy1:RegisterAnimationSequence( "Tut1", {
			{
				function ()
					return self.TutLabel1Copy1:SetAlpha( 0, 0 )
				end,
				function ()
					return self.TutLabel1Copy1:SetAlpha( 0, 500 )
				end,
				function ()
					return self.TutLabel1Copy1:SetAlpha( 1, 10 )
				end,
				function ()
					return self.TutLabel1Copy1:SetAlpha( 0, 10 )
				end,
				function ()
					return self.TutLabel1Copy1:SetAlpha( 1, 20 )
				end,
				function ()
					return self.TutLabel1Copy1:SetAlpha( 0, 10 )
				end,
				function ()
					return self.TutLabel1Copy1:SetAlpha( 1, 130 )
				end,
				function ()
					return self.TutLabel1Copy1:SetAlpha( 1, 3520 )
				end,
				function ()
					return self.TutLabel1Copy1:SetAlpha( 0, 10 )
				end,
				function ()
					return self.TutLabel1Copy1:SetAlpha( 1, 10 )
				end,
				function ()
					return self.TutLabel1Copy1:SetAlpha( 0, 10 )
				end,
				function ()
					return self.TutLabel1Copy1:SetAlpha( 1, 20 )
				end,
				function ()
					return self.TutLabel1Copy1:SetAlpha( 0, 180 )
				end
			},
			{
				function ()
					return self.TutLabel1Copy1:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 241.02, _1080p * 741.02, _1080p * 298, _1080p * 314, 4199 )
				end,
				function ()
					return self.TutLabel1Copy1:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 340.02, _1080p * 840.02, _1080p * 298, _1080p * 314, 340 )
				end
			}
		} )
		self._sequences.Tut1 = function ()
			TutLabel1:AnimateSequence( "Tut1" )
			TutLabel1Copy0:AnimateSequence( "Tut1" )
			TutLabel1Copy1:AnimateSequence( "Tut1" )
		end
		
		TutLabel1:RegisterAnimationSequence( "Create", {
			{
				function ()
					return self.TutLabel1:SetAlpha( 0, 6190 )
				end
			}
		} )
		TutLabel1Copy0:RegisterAnimationSequence( "Create", {
			{
				function ()
					return self.TutLabel1Copy0:SetAlpha( 0, 6190 )
				end
			}
		} )
		TutLabel1Copy1:RegisterAnimationSequence( "Create", {
			{
				function ()
					return self.TutLabel1Copy1:SetAlpha( 0, 6190 )
				end
			}
		} )
		self._sequences.Create = function ()
			TutLabel1:AnimateSequence( "Create" )
			TutLabel1Copy0:AnimateSequence( "Create" )
			TutLabel1Copy1:AnimateSequence( "Create" )
		end
		
		TutLabel1:RegisterAnimationSequence( "Tut2", {
			{
				function ()
					return self.TutLabel1:SetAlpha( 0, 0 )
				end,
				function ()
					return self.TutLabel1:SetAlpha( 0, 300 )
				end,
				function ()
					return self.TutLabel1:SetAlpha( 1, 10 )
				end,
				function ()
					return self.TutLabel1:SetAlpha( 0, 10 )
				end,
				function ()
					return self.TutLabel1:SetAlpha( 1, 20 )
				end,
				function ()
					return self.TutLabel1:SetAlpha( 0, 10 )
				end,
				function ()
					return self.TutLabel1:SetAlpha( 1, 150 )
				end,
				function ()
					return self.TutLabel1:SetAlpha( 1, 3500 )
				end,
				function ()
					return self.TutLabel1:SetAlpha( 0, 10 )
				end,
				function ()
					return self.TutLabel1:SetAlpha( 1, 10 )
				end,
				function ()
					return self.TutLabel1:SetAlpha( 0, 20 )
				end,
				function ()
					return self.TutLabel1:SetAlpha( 1, 10 )
				end,
				function ()
					return self.TutLabel1:SetAlpha( 0, 150 )
				end,
				function ()
					return self.TutLabel1:SetAlpha( 0, 510 )
				end,
				function ()
					return self.TutLabel1:SetAlpha( 1, 10 )
				end,
				function ()
					return self.TutLabel1:SetAlpha( 0, 10 )
				end,
				function ()
					return self.TutLabel1:SetAlpha( 1, 10 )
				end,
				function ()
					return self.TutLabel1:SetAlpha( 0, 20 )
				end,
				function ()
					return self.TutLabel1:SetAlpha( 1, 120 )
				end,
				function ()
					return self.TutLabel1:SetAlpha( 1, 2170 )
				end,
				function ()
					return self.TutLabel1:SetAlpha( 0, 10 )
				end
			},
			{
				function ()
					return self.TutLabel1:setText( Engine.Localize( "MENU_SP_OPSMAP_TUT_2_A" ), 0 )
				end,
				function ()
					return self.TutLabel1:setText( Engine.Localize( "MENU_SP_OPSMAP_TUT_2_B" ), 4710 )
				end
			},
			{
				function ()
					return self.TutLabel1:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 241.02, _1080p * 741.02, _1080p * 243, _1080p * 264, 4000 )
				end,
				function ()
					return self.TutLabel1:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 297.72, _1080p * 797.72, _1080p * 243, _1080p * 264, 699 )
				end,
				function ()
					return self.TutLabel1:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 241.02, _1080p * 741.02, _1080p * 304, _1080p * 325, 10 )
				end
			}
		} )
		TutLabel1Copy0:RegisterAnimationSequence( "Tut2", {
			{
				function ()
					return self.TutLabel1Copy0:SetAlpha( 0, 0 )
				end,
				function ()
					return self.TutLabel1Copy0:SetAlpha( 0, 350 )
				end,
				function ()
					return self.TutLabel1Copy0:SetAlpha( 1, 10 )
				end,
				function ()
					return self.TutLabel1Copy0:SetAlpha( 0, 10 )
				end,
				function ()
					return self.TutLabel1Copy0:SetAlpha( 1, 20 )
				end,
				function ()
					return self.TutLabel1Copy0:SetAlpha( 0, 10 )
				end,
				function ()
					return self.TutLabel1Copy0:SetAlpha( 1, 130 )
				end,
				function ()
					return self.TutLabel1Copy0:SetAlpha( 1, 3590 )
				end,
				function ()
					return self.TutLabel1Copy0:SetAlpha( 0, 10 )
				end,
				function ()
					return self.TutLabel1Copy0:SetAlpha( 1, 10 )
				end,
				function ()
					return self.TutLabel1Copy0:SetAlpha( 0, 20 )
				end,
				function ()
					return self.TutLabel1Copy0:SetAlpha( 1, 10 )
				end,
				function ()
					return self.TutLabel1Copy0:SetAlpha( 0, 130 )
				end,
				function ()
					return self.TutLabel1Copy0:SetAlpha( 0, 580 )
				end,
				function ()
					return self.TutLabel1Copy0:SetAlpha( 1, 10 )
				end,
				function ()
					return self.TutLabel1Copy0:SetAlpha( 0, 10 )
				end,
				function ()
					return self.TutLabel1Copy0:SetAlpha( 1, 10 )
				end,
				function ()
					return self.TutLabel1Copy0:SetAlpha( 0, 20 )
				end,
				function ()
					return self.TutLabel1Copy0:SetAlpha( 1, 120 )
				end,
				function ()
					return self.TutLabel1Copy0:SetAlpha( 1, 2000 )
				end,
				function ()
					return self.TutLabel1Copy0:SetAlpha( 0, 10 )
				end
			},
			{
				function ()
					return self.TutLabel1Copy0:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 241.02, _1080p * 741.02, _1080p * 264, _1080p * 276, 4119 )
				end,
				function ()
					return self.TutLabel1Copy0:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 336.02, _1080p * 836.02, _1080p * 264, _1080p * 276, 380 )
				end,
				function ()
					return self.TutLabel1Copy0:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 336.02, _1080p * 836.02, _1080p * 264, _1080p * 276, 199 )
				end,
				function ()
					return self.TutLabel1Copy0:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 241.02, _1080p * 741.02, _1080p * 325, _1080p * 337, 10 )
				end
			}
		} )
		TutLabel1Copy1:RegisterAnimationSequence( "Tut2", {
			{
				function ()
					return self.TutLabel1Copy1:SetAlpha( 0, 0 )
				end,
				function ()
					return self.TutLabel1Copy1:SetAlpha( 0, 500 )
				end,
				function ()
					return self.TutLabel1Copy1:SetAlpha( 1, 10 )
				end,
				function ()
					return self.TutLabel1Copy1:SetAlpha( 0, 10 )
				end,
				function ()
					return self.TutLabel1Copy1:SetAlpha( 1, 20 )
				end,
				function ()
					return self.TutLabel1Copy1:SetAlpha( 0, 10 )
				end,
				function ()
					return self.TutLabel1Copy1:SetAlpha( 1, 130 )
				end,
				function ()
					return self.TutLabel1Copy1:SetAlpha( 1, 3320 )
				end,
				function ()
					return self.TutLabel1Copy1:SetAlpha( 1, 2050 )
				end,
				function ()
					return self.TutLabel1Copy1:SetAlpha( 0, 10 )
				end,
				function ()
					return self.TutLabel1Copy1:SetAlpha( 1, 10 )
				end,
				function ()
					return self.TutLabel1Copy1:SetAlpha( 0, 20 )
				end,
				function ()
					return self.TutLabel1Copy1:SetAlpha( 1, 10 )
				end,
				function ()
					return self.TutLabel1Copy1:SetAlpha( 0, 90 )
				end
			},
			{
				function ()
					return self.TutLabel1Copy1:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 241.02, _1080p * 741.02, _1080p * 298, _1080p * 314, 4000 )
				end,
				function ()
					return self.TutLabel1Copy1:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 241.02, _1080p * 741.02, _1080p * 352, _1080p * 368, 500 )
				end,
				function ()
					return self.TutLabel1Copy1:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 241.02, _1080p * 741.02, _1080p * 360, _1080p * 376, 199 )
				end,
				function ()
					return self.TutLabel1Copy1:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 241.02, _1080p * 741.02, _1080p * 360, _1080p * 376, 1350 )
				end,
				function ()
					return self.TutLabel1Copy1:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 345.02, _1080p * 845.02, _1080p * 360, _1080p * 376, 449 )
				end
			}
		} )
		self._sequences.Tut2 = function ()
			TutLabel1:AnimateSequence( "Tut2" )
			TutLabel1Copy0:AnimateSequence( "Tut2" )
			TutLabel1Copy1:AnimateSequence( "Tut2" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	self:SubscribeToModel( DataSources.inGame.SP.shipCrib.loadoutTutIndex:GetModel( f2_local1 ), function ()
		if DataSources.inGame.SP.shipCrib.loadoutTutIndex:GetValue( f2_local1 ) ~= nil and DataSources.inGame.SP.shipCrib.loadoutTutIndex:GetValue( f2_local1 ) == 7 then
			ACTIONS.AnimateSequence( self, "Tut1" )
		end
		if DataSources.inGame.SP.shipCrib.loadoutTutIndex:GetValue( f2_local1 ) ~= nil and DataSources.inGame.SP.shipCrib.loadoutTutIndex:GetValue( f2_local1 ) == 8 then
			ACTIONS.AnimateSequence( self, "Tut2" )
		end
		if DataSources.inGame.SP.shipCrib.loadoutTutIndex:GetValue( f2_local1 ) ~= nil and DataSources.inGame.SP.shipCrib.loadoutTutIndex:GetValue( f2_local1 ) == 0 then
			ACTIONS.AnimateSequence( self, "Create" )
		end
	end )
	PostLoadFunc( self, f2_local1, controller )
	ACTIONS.AnimateSequence( self, "Create" )
	return self
end

MenuBuilder.registerType( "OpsmapTutorial", OpsmapTutorial )
LockTable( _M )
