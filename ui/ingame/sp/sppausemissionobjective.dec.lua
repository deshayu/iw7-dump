local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function SPPauseMissionObjective( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 512 * _1080p, 0, 28 * _1080p )
	self.id = "SPPauseMissionObjective"
	self._animationSets = {}
	self._sequences = {}
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local IconBG = nil
	
	IconBG = LUI.UIImage.new()
	IconBG.id = "IconBG"
	IconBG:SetRGBFromInt( 0, 0 )
	IconBG:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 50, _1080p * 3, _1080p * 23 )
	self:addElement( IconBG )
	self.IconBG = IconBG
	
	local IconBorder = nil
	
	IconBorder = LUI.UIBorder.new( {
		borderThicknessLeft = _1080p * 2,
		borderThicknessRight = _1080p * 2,
		borderThicknessTop = _1080p * 2,
		borderThicknessBottom = _1080p * 2
	} )
	IconBorder.id = "IconBorder"
	IconBorder:SetAlpha( 0.5, 0 )
	IconBorder:SetBorderThicknessLeft( _1080p * 2, 0 )
	IconBorder:SetBorderThicknessRight( _1080p * 2, 0 )
	IconBorder:SetBorderThicknessTop( _1080p * 2, 0 )
	IconBorder:SetBorderThicknessBottom( _1080p * 2, 0 )
	IconBorder:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 50, _1080p * 3, _1080p * 23 )
	self:addElement( IconBorder )
	self.IconBorder = IconBorder
	
	local CompletedIcon = nil
	
	CompletedIcon = LUI.UIImage.new()
	CompletedIcon.id = "CompletedIcon"
	CompletedIcon:SetRGBFromInt( 12566463, 0 )
	CompletedIcon:setImage( RegisterMaterial( "challenges_tier" ), 0 )
	CompletedIcon:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -7, _1080p * 57, _1080p * -2, _1080p * 30 )
	self:addElement( CompletedIcon )
	self.CompletedIcon = CompletedIcon
	
	local Objective = nil
	
	Objective = LUI.UIStyledText.new()
	Objective.id = "Objective"
	Objective:SetFontSize( 20 * _1080p )
	Objective:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	Objective:SetAlignment( LUI.Alignment.Left )
	Objective:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * 92, 0, _1080p * 4, _1080p * -4 )
	Objective:SubscribeToModelThroughElement( self, "description", function ()
		local f2_local0 = self:GetDataSource()
		f2_local0 = f2_local0.description:GetValue( f1_local1 )
		if f2_local0 ~= nil then
			Objective:setText( LocalizeString( f2_local0 ), 0 )
		end
	end )
	self:addElement( Objective )
	self.Objective = Objective
	
	self._animationSets.DefaultAnimationSet = function ()
		IconBG:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.IconBG:SetAlpha( 0.3, 0 )
				end
			}
		} )
		IconBorder:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.IconBorder:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.IconBorder:SetRGBFromTable( SWATCHES.genericButton.textDefault, 0 )
				end
			}
		} )
		CompletedIcon:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.CompletedIcon:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.DefaultSequence = function ()
			IconBG:AnimateSequence( "DefaultSequence" )
			IconBorder:AnimateSequence( "DefaultSequence" )
			CompletedIcon:AnimateSequence( "DefaultSequence" )
		end
		
		IconBG:RegisterAnimationSequence( "Completed", {
			{
				function ()
					return self.IconBG:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.IconBG:SetRGBFromInt( 0, 0 )
				end
			}
		} )
		IconBorder:RegisterAnimationSequence( "Completed", {
			{
				function ()
					return self.IconBorder:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.IconBorder:SetRGBFromTable( SWATCHES.genericButton.textDefault, 0 )
				end
			}
		} )
		CompletedIcon:RegisterAnimationSequence( "Completed", {
			{
				function ()
					return self.CompletedIcon:SetAlpha( 1, 0 )
				end
			}
		} )
		Objective:RegisterAnimationSequence( "Completed", {
			{
				function ()
					return self.Objective:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.Objective:SetRGBFromTable( SWATCHES.genericButton.textDefault, 0 )
				end
			}
		} )
		self._sequences.Completed = function ()
			IconBG:AnimateSequence( "Completed" )
			IconBorder:AnimateSequence( "Completed" )
			CompletedIcon:AnimateSequence( "Completed" )
			Objective:AnimateSequence( "Completed" )
		end
		
		IconBG:RegisterAnimationSequence( "Inprogress", {
			{
				function ()
					return self.IconBG:SetAlpha( 0.3, 0 )
				end
			}
		} )
		IconBorder:RegisterAnimationSequence( "Inprogress", {
			{
				function ()
					return self.IconBorder:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.IconBorder:SetRGBFromTable( SWATCHES.genericButton.textDefault, 0 )
				end
			}
		} )
		CompletedIcon:RegisterAnimationSequence( "Inprogress", {
			{
				function ()
					return self.CompletedIcon:SetAlpha( 0, 0 )
				end
			}
		} )
		Objective:RegisterAnimationSequence( "Inprogress", {
			{
				function ()
					return self.Objective:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.Objective:SetRGBFromInt( 16777215, 0 )
				end
			}
		} )
		self._sequences.Inprogress = function ()
			IconBG:AnimateSequence( "Inprogress" )
			IconBorder:AnimateSequence( "Inprogress" )
			CompletedIcon:AnimateSequence( "Inprogress" )
			Objective:AnimateSequence( "Inprogress" )
		end
		
		IconBG:RegisterAnimationSequence( "Hide", {
			{
				function ()
					return self.IconBG:SetAlpha( 0.3, 0 )
				end
			}
		} )
		IconBorder:RegisterAnimationSequence( "Hide", {
			{
				function ()
					return self.IconBorder:SetAlpha( 0.2, 0 )
				end
			}
		} )
		CompletedIcon:RegisterAnimationSequence( "Hide", {
			{
				function ()
					return self.CompletedIcon:SetAlpha( 0, 0 )
				end
			}
		} )
		Objective:RegisterAnimationSequence( "Hide", {
			{
				function ()
					return self.Objective:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.Hide = function ()
			IconBG:AnimateSequence( "Hide" )
			IconBorder:AnimateSequence( "Hide" )
			CompletedIcon:AnimateSequence( "Hide" )
			Objective:AnimateSequence( "Hide" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	CompletedIcon:SubscribeToModelThroughElement( self, "isCompleted", function ()
		local f29_local0 = self:GetDataSource()
		if f29_local0.isCompleted:GetValue( f1_local1 ) ~= nil then
			f29_local0 = self:GetDataSource()
			if f29_local0.isCompleted:GetValue( f1_local1 ) == true then
				ACTIONS.AnimateSequence( self, "Completed" )
			end
		end
		f29_local0 = self:GetDataSource()
		if f29_local0.isCompleted:GetValue( f1_local1 ) ~= nil then
			f29_local0 = self:GetDataSource()
			if f29_local0.isCompleted:GetValue( f1_local1 ) == false then
				ACTIONS.AnimateSequence( self, "Inprogress" )
			end
		end
	end )
	ACTIONS.AnimateSequence( self, "DefaultSequence" )
	return self
end

MenuBuilder.registerType( "SPPauseMissionObjective", SPPauseMissionObjective )
LockTable( _M )
