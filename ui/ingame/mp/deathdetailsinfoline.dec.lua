local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ( f1_arg0, f1_arg1, f1_arg2 )
	local self = LUI.UIRepeatedImage.new()
	self:SetAnchorsAndPosition( 1, 0, 0.5, 0.5, _1080p * -169, _1080p * -153, _1080p * -8, _1080p * 8 )
	self:SetRepeatedOffsetXY( _1080p * 17, _1080p * 0 )
	self:SetCount( 10 )
	self:SetRGBFromTable( SWATCHES.killcam.hitDiamond, 0 )
	self:setImage( RegisterMaterial( "hud_killcam_diamond" ), 0 )
	f1_arg0.DeathIconRow = self
	f1_arg0:addElement( self )
	local f1_local1 = function ()
		local f2_local0 = f1_arg0:GetDataSource()
		f2_local0 = f2_local0.attackerHitCount:GetValue( f1_arg1 )
		if f2_local0 ~= nil then
			self:SetCount( f2_local0 )
		end
	end
	
	local f1_local2 = function ()
		local f3_local0 = f1_arg0:GetDataSource()
		f3_local0 = f3_local0.attackerName:GetValue( f1_arg1 )
		if f3_local0 ~= nil then
			if Engine.IsPC() then
				f3_local0 = Engine.TruncateToGlyphCount( f3_local0, 16 )
			end
			f1_arg0.AttackerName:setText( f3_local0, 0 )
		end
	end
	
	self:SubscribeToModelThroughElement( f1_arg0, "attackerHitCount", f1_local1 )
	f1_arg0:SubscribeToModelThroughElement( f1_arg0, "attackerName", f1_local2 )
end

function DeathDetailsInfoLine( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 532 * _1080p, 0, 40 * _1080p )
	self.id = "DeathDetailsInfoLine"
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
	Background:SetRGBFromInt( 0, 0 )
	Background:SetAlpha( 0.25, 0 )
	self:addElement( Background )
	self.Background = Background
	
	local AttackerName = nil
	
	AttackerName = LUI.UIText.new()
	AttackerName.id = "AttackerName"
	AttackerName:setText( "", 0 )
	AttackerName:SetFontSize( 22 * _1080p )
	AttackerName:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	AttackerName:setTextStyle( CoD.TextStyle.Shadowed )
	AttackerName:SetAlignment( LUI.Alignment.Left )
	AttackerName:SetAnchorsAndPosition( 0, 1, 0.5, 0.5, _1080p * 28, _1080p * 348, _1080p * -11, _1080p * 11 )
	self:addElement( AttackerName )
	self.AttackerName = AttackerName
	
	local Line = nil
	
	Line = LUI.UIImage.new()
	Line.id = "Line"
	Line:SetRGBFromTable( SWATCHES.killcam.headerText, 0 )
	Line:SetAlpha( 0.5, 0 )
	Line:SetAnchorsAndPosition( 0, 0, 1, 0, 0, 0, _1080p * -1, 0 )
	self:addElement( Line )
	self.Line = Line
	
	local NameIcon = nil
	
	NameIcon = LUI.UIImage.new()
	NameIcon.id = "NameIcon"
	NameIcon:setImage( RegisterMaterial( "hud_killcam_diamond" ), 0 )
	NameIcon:SetAnchorsAndPosition( 0, 1, 0.5, 0.5, _1080p * 3, _1080p * 24, _1080p * -11, _1080p * 11 )
	self:addElement( NameIcon )
	self.NameIcon = NameIcon
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		Background:RegisterAnimationSequence( "AnimateRow", {
			{
				function ()
					return self.Background:SetAlpha( 0.25, 0 )
				end,
				function ()
					return self.Background:SetAlpha( 0.25, 1000 )
				end,
				function ()
					return self.Background:SetAlpha( 1, 20 )
				end,
				function ()
					return self.Background:SetAlpha( 0.25, 230 )
				end,
				function ()
					return self.Background:SetAlpha( 1, 20 )
				end,
				function ()
					return self.Background:SetAlpha( 0.25, 230 )
				end,
				function ()
					return self.Background:SetAlpha( 1, 20 )
				end,
				function ()
					return self.Background:SetAlpha( 0.25, 480 )
				end
			},
			{
				function ()
					return self.Background:SetRGBFromInt( 0, 0 )
				end,
				function ()
					return self.Background:SetRGBFromInt( 0, 1000 )
				end,
				function ()
					return self.Background:SetRGBFromTable( SWATCHES.killcam.hitDiamond, 20 )
				end,
				function ()
					return self.Background:SetRGBFromInt( 0, 230 )
				end,
				function ()
					return self.Background:SetRGBFromTable( SWATCHES.killcam.hitDiamond, 20 )
				end,
				function ()
					return self.Background:SetRGBFromInt( 0, 230 )
				end,
				function ()
					return self.Background:SetRGBFromTable( SWATCHES.killcam.hitDiamond, 20 )
				end,
				function ()
					return self.Background:SetRGBFromInt( 0, 480 )
				end
			}
		} )
		self._sequences.AnimateRow = function ()
			Background:AnimateSequence( "AnimateRow" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	f0_local0( self, f4_local1, controller )
	return self
end

MenuBuilder.registerType( "DeathDetailsInfoLine", DeathDetailsInfoLine )
LockTable( _M )
