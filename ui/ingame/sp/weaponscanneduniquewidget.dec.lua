local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function PostLoadFunc( f1_arg0, f1_arg1, f1_arg2 )
	assert( f1_arg0.WeaponImage )
	assert( f1_arg0.WeaponName )
	assert( f1_arg0.Message )
	local f1_local0 = DataSources.inGame.SP.weaponScannedUnique
	f1_arg0:SubscribeToModel( f1_local0:GetModel( f1_arg1 ), function ()
		local f2_local0 = f1_local0:GetValue( f1_arg1 )
		if f2_local0 ~= "none" and f2_local0 ~= nil then
			f2_local0 = f2_local0:gsub( "weapon", "iw7" )
			f1_arg0.WeaponImage:setImage( RegisterMaterial( Cac.GetWeaponImage( f2_local0 ) ), 0 )
			f1_arg0.WeaponName:setText( Engine.MarkLocalized( Cac.GetWeaponName( f2_local0 ) ), 0 )
			f1_arg0.Message:setText( Engine.MarkLocalized( Cac.GetWeaponDesc( f2_local0 ) ), 0 )
		end
	end )
end

function WeaponScannedUniqueWidget( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 517 * _1080p, 0, 125 * _1080p )
	self.id = "WeaponScannedUniqueWidget"
	self._animationSets = {}
	self._sequences = {}
	local f3_local1 = controller and controller.controllerIndex
	if not f3_local1 and not Engine.InFrontend() then
		f3_local1 = self:getRootController()
	end
	assert( f3_local1 )
	local f3_local2 = self
	local Message = nil
	
	Message = LUI.UIStyledText.new()
	Message.id = "Message"
	Message:SetRGBFromTable( SWATCHES.PIP.PIPMessageGeneral, 0 )
	Message:setText( "Message", 0 )
	Message:SetFontSize( 22 * _1080p )
	Message:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	Message:SetAlignment( LUI.Alignment.Left )
	Message:SetDecodeUseSystemTime( false )
	Message:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 254.5, _1080p * 510.5, _1080p * 42.53, _1080p * 64.53 )
	self:addElement( Message )
	self.Message = Message
	
	local WeaponName = nil
	
	WeaponName = LUI.UIStyledText.new()
	WeaponName.id = "WeaponName"
	WeaponName:setText( "Weapon Name", 0 )
	WeaponName:SetFontSize( 30 * _1080p )
	WeaponName:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	WeaponName:SetAlignment( LUI.Alignment.Left )
	WeaponName:SetDecodeLetterLength( 100 )
	WeaponName:SetDecodeMaxRandChars( 10 )
	WeaponName:SetDecodeUpdatesPerLetter( 6 )
	WeaponName:SetDecodeUseSystemTime( false )
	WeaponName:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 254.5, _1080p * 497.5, _1080p * 12.53, _1080p * 42.53 )
	self:addElement( WeaponName )
	self.WeaponName = WeaponName
	
	local WeaponImage = nil
	
	WeaponImage = LUI.UIImage.new()
	WeaponImage.id = "WeaponImage"
	WeaponImage:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 21.81, _1080p * 226.19, _1080p * 12.53, _1080p * 112.47 )
	self:addElement( WeaponImage )
	self.WeaponImage = WeaponImage
	
	local ResumeGameIcon = nil
	
	ResumeGameIcon = LUI.UIImage.new()
	ResumeGameIcon.id = "ResumeGameIcon"
	ResumeGameIcon:setImage( RegisterMaterial( "button_secondary" ), 0 )
	ResumeGameIcon:SetAnchorsAndPosition( 1, 0, 1, 0, _1080p * -178.5, _1080p * -160.5, _1080p * -21.79, _1080p * -3.79 )
	self:addElement( ResumeGameIcon )
	self.ResumeGameIcon = ResumeGameIcon
	
	local ResumeGameLabel = nil
	
	ResumeGameLabel = LUI.UIText.new()
	ResumeGameLabel.id = "ResumeGameLabel"
	ResumeGameLabel:setText( Engine.Localize( "MENU_RESUMEGAME_CAPS" ), 0 )
	ResumeGameLabel:SetFontSize( 18 * _1080p )
	ResumeGameLabel:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	ResumeGameLabel:SetAlignment( LUI.Alignment.Left )
	ResumeGameLabel:SetAnchorsAndPosition( 1, 0, 1, 0, _1080p * -160.5, 0, _1080p * -21.79, _1080p * -3.26 )
	self:addElement( ResumeGameLabel )
	self.ResumeGameLabel = ResumeGameLabel
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		Message:RegisterAnimationSequence( "TextOn", {
			{
				function ()
					return self.Message:SetAlpha( 0, 0 )
				end,
				function ()
					return self.Message:SetAlpha( 0, 350 )
				end,
				function ()
					return self.Message:SetAlpha( 1, 600 )
				end
			}
		} )
		WeaponName:RegisterAnimationSequence( "TextOn", {
			{
				function ()
					return self.WeaponName:SetAlpha( 0, 0 )
				end,
				function ()
					return self.WeaponName:SetAlpha( 0, 350 )
				end,
				function ()
					return self.WeaponName:SetAlpha( 1, 600 )
				end
			}
		} )
		WeaponImage:RegisterAnimationSequence( "TextOn", {
			{
				function ()
					return self.WeaponImage:SetAlpha( 0, 0 )
				end,
				function ()
					return self.WeaponImage:SetAlpha( 1, 250 )
				end
			}
		} )
		ResumeGameIcon:RegisterAnimationSequence( "TextOn", {
			{
				function ()
					return self.ResumeGameIcon:SetAlpha( 0, 1200 )
				end,
				function ()
					return self.ResumeGameIcon:SetAlpha( 1, 160 )
				end
			}
		} )
		ResumeGameLabel:RegisterAnimationSequence( "TextOn", {
			{
				function ()
					return self.ResumeGameLabel:SetAlpha( 0, 1200 )
				end,
				function ()
					return self.ResumeGameLabel:SetAlpha( 1, 160 )
				end
			}
		} )
		self._sequences.TextOn = function ()
			Message:AnimateSequence( "TextOn" )
			WeaponName:AnimateSequence( "TextOn" )
			WeaponImage:AnimateSequence( "TextOn" )
			ResumeGameIcon:AnimateSequence( "TextOn" )
			ResumeGameLabel:AnimateSequence( "TextOn" )
		end
		
		Message:RegisterAnimationSequence( "Hidden", {
			{
				function ()
					return self.Message:SetAlpha( 0, 0 )
				end
			}
		} )
		WeaponName:RegisterAnimationSequence( "Hidden", {
			{
				function ()
					return self.WeaponName:SetAlpha( 0, 0 )
				end
			}
		} )
		WeaponImage:RegisterAnimationSequence( "Hidden", {
			{
				function ()
					return self.WeaponImage:SetAlpha( 0, 0 )
				end
			}
		} )
		ResumeGameIcon:RegisterAnimationSequence( "Hidden", {
			{
				function ()
					return self.ResumeGameIcon:SetAlpha( 0, 0 )
				end
			}
		} )
		ResumeGameLabel:RegisterAnimationSequence( "Hidden", {
			{
				function ()
					return self.ResumeGameLabel:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.Hidden = function ()
			Message:AnimateSequence( "Hidden" )
			WeaponName:AnimateSequence( "Hidden" )
			WeaponImage:AnimateSequence( "Hidden" )
			ResumeGameIcon:AnimateSequence( "Hidden" )
			ResumeGameLabel:AnimateSequence( "Hidden" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	PostLoadFunc( self, f3_local1, controller )
	ACTIONS.AnimateSequence( self, "Hidden" )
	return self
end

MenuBuilder.registerType( "WeaponScannedUniqueWidget", WeaponScannedUniqueWidget )
LockTable( _M )
