local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function PostLoadFunc( f1_arg0, f1_arg1 )
	f1_arg0:SetBlendMode( BLEND_MODE.addWithAlpha )
	f1_arg0:SubscribeToModel( DataSources.inGame.jackal.missiles.count:GetModel( f1_arg1 ), function ()
		local f2_local0 = function ( f3_arg0, f3_arg1 )
			local f3_local0 = f3_arg1.controller or controller
			ACTIONS.AnimateSequence( f1_arg0, "update" )
			if DataSources.inGame.jackal.missiles.count:GetValue( f1_arg1 ) ~= nil and DataSources.inGame.jackal.missiles.count:GetValue( f1_arg1 ) <= 0 then
				ACTIONS.AnimateSequence( f1_arg0, "warning" )
			end
			if DataSources.inGame.jackal.missiles.count:GetValue( f1_arg1 ) ~= nil and DataSources.inGame.jackal.missiles.count:GetValue( f1_arg1 ) > 0 then
				ACTIONS.AnimateSequence( f1_arg0, "stable" )
			end
		end
		
		f2_local0( f1_arg0, {
			name = "datasource_event"
		} )
	end, true )
end

function JackalMissiles( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 80 * _1080p, 0, 40 * _1080p )
	self.id = "JackalMissiles"
	self._animationSets = {}
	self._sequences = {}
	local f4_local1 = controller and controller.controllerIndex
	if not f4_local1 and not Engine.InFrontend() then
		f4_local1 = self:getRootController()
	end
	assert( f4_local1 )
	local f4_local2 = self
	local MissileFrame = nil
	
	MissileFrame = LUI.UIBorder.new( {
		borderThicknessLeft = _1080p * 1,
		borderThicknessRight = _1080p * 1,
		borderThicknessTop = _1080p * 1,
		borderThicknessBottom = _1080p * 1
	} )
	MissileFrame.id = "MissileFrame"
	MissileFrame:SetRGBFromTable( SWATCHES.jackal.stable, 0 )
	MissileFrame:SetAnchorsAndPosition( 1, 0, 0.5, 0.5, _1080p * -40, 0, _1080p * -17, _1080p * 17 )
	self:addElement( MissileFrame )
	self.MissileFrame = MissileFrame
	
	local MissileQuanity = nil
	
	MissileQuanity = LUI.UIText.new()
	MissileQuanity.id = "MissileQuanity"
	MissileQuanity:SetRGBFromTable( SWATCHES.jackal.stable, 0 )
	MissileQuanity:SetFontSize( 24 * _1080p )
	MissileQuanity:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	MissileQuanity:SetAlignment( LUI.Alignment.Center )
	MissileQuanity:SetAnchorsAndPosition( 1, 0, 0.5, 0.5, _1080p * -37, _1080p * -3, _1080p * -12, _1080p * 12 )
	MissileQuanity:SubscribeToModel( DataSources.inGame.jackal.missiles.count:GetModel( f4_local1 ), function ()
		local f5_local0 = DataSources.inGame.jackal.missiles.count:GetValue( f4_local1 )
		if f5_local0 ~= nil then
			MissileQuanity:setText( f5_local0, 0 )
		end
	end )
	self:addElement( MissileQuanity )
	self.MissileQuanity = MissileQuanity
	
	local MissileIcon = nil
	
	MissileIcon = LUI.UIImage.new()
	MissileIcon.id = "MissileIcon"
	MissileIcon:SetRGBFromTable( SWATCHES.jackal.stable, 0 )
	MissileIcon:setImage( RegisterMaterial( "hud_jackal_missile" ), 0 )
	MissileIcon:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 12, _1080p * 28, _1080p * 4, _1080p * 36 )
	self:addElement( MissileIcon )
	self.MissileIcon = MissileIcon
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		MissileFrame:RegisterAnimationSequence( "stable", {
			{
				function ()
					return self.MissileFrame:SetRGBFromTable( SWATCHES.jackal.stable, 0 )
				end
			}
		} )
		MissileQuanity:RegisterAnimationSequence( "stable", {
			{
				function ()
					return self.MissileQuanity:SetRGBFromTable( SWATCHES.jackal.stable, 0 )
				end
			}
		} )
		MissileIcon:RegisterAnimationSequence( "stable", {
			{
				function ()
					return self.MissileIcon:SetRGBFromTable( SWATCHES.jackal.stable, 0 )
				end
			}
		} )
		self._sequences.stable = function ()
			MissileFrame:AnimateSequence( "stable" )
			MissileQuanity:AnimateSequence( "stable" )
			MissileIcon:AnimateSequence( "stable" )
		end
		
		MissileFrame:RegisterAnimationSequence( "warning", {
			{
				function ()
					return self.MissileFrame:SetRGBFromTable( SWATCHES.jackal.warning, 0 )
				end
			}
		} )
		MissileQuanity:RegisterAnimationSequence( "warning", {
			{
				function ()
					return self.MissileQuanity:SetRGBFromTable( SWATCHES.jackal.warning, 0 )
				end
			}
		} )
		MissileIcon:RegisterAnimationSequence( "warning", {
			{
				function ()
					return self.MissileIcon:SetRGBFromTable( SWATCHES.jackal.warning, 0 )
				end
			}
		} )
		self._sequences.warning = function ()
			MissileFrame:AnimateSequence( "warning" )
			MissileQuanity:AnimateSequence( "warning" )
			MissileIcon:AnimateSequence( "warning" )
		end
		
		MissileQuanity:RegisterAnimationSequence( "update", {
			{
				function ()
					return self.MissileQuanity:SetScale( 2, 0 )
				end,
				function ()
					return self.MissileQuanity:SetScale( 0, 200, LUI.EASING.outBack )
				end
			}
		} )
		MissileIcon:RegisterAnimationSequence( "update", {
			{
				function ()
					return self.MissileIcon:SetScale( 1, 0 )
				end,
				function ()
					return self.MissileIcon:SetScale( 0, 200, LUI.EASING.outBack )
				end
			}
		} )
		self._sequences.update = function ()
			MissileQuanity:AnimateSequence( "update" )
			MissileIcon:AnimateSequence( "update" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	PostLoadFunc( self, f4_local1, controller )
	return self
end

MenuBuilder.registerType( "JackalMissiles", JackalMissiles )
LockTable( _M )
