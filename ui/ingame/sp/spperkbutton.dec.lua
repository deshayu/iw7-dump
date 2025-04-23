local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ( f1_arg0, f1_arg1, f1_arg2 )
	assert( f1_arg0.Description )
	f1_arg0.Description:SetAlpha( 0, 0 )
end

function SPPerkButton( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 514 * _1080p, 0, 60 * _1080p )
	self.id = "SPPerkButton"
	self._animationSets = {}
	self._sequences = {}
	local f2_local1 = controller and controller.controllerIndex
	if not f2_local1 and not Engine.InFrontend() then
		f2_local1 = self:getRootController()
	end
	assert( f2_local1 )
	local f2_local2 = self
	local Background = nil
	
	Background = LUI.UIImage.new()
	Background.id = "Background"
	Background:SetRGBFromInt( 0, 0 )
	Background:SetAlpha( 0.6, 0 )
	self:addElement( Background )
	self.Background = Background
	
	local Image = nil
	
	Image = LUI.UIImage.new()
	Image.id = "Image"
	Image:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 77, _1080p * -8.5, _1080p * 68.5 )
	Image:SubscribeToModelThroughElement( self, "icon", function ()
		local f3_local0 = self:GetDataSource()
		f3_local0 = f3_local0.icon:GetValue( f2_local1 )
		if f3_local0 ~= nil then
			Image:setImage( RegisterMaterial( f3_local0 ), 0 )
		end
	end )
	self:addElement( Image )
	self.Image = Image
	
	local Description = nil
	
	Description = LUI.UIText.new()
	Description.id = "Description"
	Description:SetFontSize( 19 * _1080p )
	Description:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	Description:SetAlignment( LUI.Alignment.Left )
	Description:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 100, _1080p * 480, _1080p * 23.5, _1080p * 44.5 )
	Description:SubscribeToModelThroughElement( self, "desc", function ()
		local f4_local0 = self:GetDataSource()
		f4_local0 = f4_local0.desc:GetValue( f2_local1 )
		if f4_local0 ~= nil then
			Description:setText( f4_local0, 0 )
		end
	end )
	self:addElement( Description )
	self.Description = Description
	
	local Name = nil
	
	Name = LUI.UIText.new()
	Name.id = "Name"
	Name:SetFontSize( 20 * _1080p )
	Name:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	Name:SetAlignment( LUI.Alignment.Left )
	Name:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 100, _1080p * 480, _1080p * 3.5, _1080p * 23.5 )
	Name:SubscribeToModelThroughElement( self, "name", function ()
		local f5_local0 = self:GetDataSource()
		f5_local0 = f5_local0.name:GetValue( f2_local1 )
		if f5_local0 ~= nil then
			Name:setText( f5_local0, 0 )
		end
	end )
	self:addElement( Name )
	self.Name = Name
	
	local Image0 = nil
	
	Image0 = LUI.UIImage.new()
	Image0.id = "Image0"
	Image0:SetAlpha( 0.05, 0 )
	Image0:SetAnchorsAndPosition( 0, 0, 1, 0, _1080p * 10, _1080p * -20, _1080p * 2, _1080p * 3 )
	self:addElement( Image0 )
	self.Image0 = Image0
	
	self._animationSets.DefaultAnimationSet = function ()
		Background:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.Background:SetAlpha( 0.6, 0 )
				end
			}
		} )
		Image:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.Image:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.Image:SetRGBFromInt( 16777215, 0 )
				end
			}
		} )
		Description:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.Description:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.Description:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 100, _1080p * 480, _1080p * 25.5, _1080p * 44.5, 0 )
				end
			}
		} )
		Name:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.Name:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.Name:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 100, _1080p * 480, _1080p * 3.5, _1080p * 23.5, 0 )
				end
			}
		} )
		Image0:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.Image0:SetAlpha( 0.05, 0 )
				end
			}
		} )
		self._sequences.DefaultSequence = function ()
			Background:AnimateSequence( "DefaultSequence" )
			Image:AnimateSequence( "DefaultSequence" )
			Description:AnimateSequence( "DefaultSequence" )
			Name:AnimateSequence( "DefaultSequence" )
			Image0:AnimateSequence( "DefaultSequence" )
		end
		
		Background:RegisterAnimationSequence( "Locked", {
			{
				function ()
					return self.Background:SetAlpha( 0, 0 )
				end
			}
		} )
		Image:RegisterAnimationSequence( "Locked", {
			{
				function ()
					return self.Image:SetAlpha( 0, 0 )
				end
			},
			{
				function ()
					return self.Image:SetRGBFromInt( 10066329, 0 )
				end
			}
		} )
		Description:RegisterAnimationSequence( "Locked", {
			{
				function ()
					return self.Description:SetAlpha( 0, 0 )
				end
			},
			{
				function ()
					return self.Description:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 109, _1080p * 548.5, _1080p * 24.5, _1080p * 43.5, 0 )
				end
			}
		} )
		Name:RegisterAnimationSequence( "Locked", {
			{
				function ()
					return self.Name:SetAlpha( 0, 0 )
				end
			}
		} )
		Image0:RegisterAnimationSequence( "Locked", {
			{
				function ()
					return self.Image0:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.Locked = function ()
			Background:AnimateSequence( "Locked" )
			Image:AnimateSequence( "Locked" )
			Description:AnimateSequence( "Locked" )
			Name:AnimateSequence( "Locked" )
			Image0:AnimateSequence( "Locked" )
		end
		
		self._sequences.IsNew = function ()
			
		end
		
		self._sequences.IsNotNew = function ()
			
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	self:SubscribeToModelThroughElement( self, "isUnlocked", function ()
		local f26_local0 = self:GetDataSource()
		if f26_local0.isUnlocked:GetValue( f2_local1 ) ~= nil then
			f26_local0 = self:GetDataSource()
			if f26_local0.isUnlocked:GetValue( f2_local1 ) == false then
				ACTIONS.AnimateSequence( self, "Locked" )
			end
		end
		f26_local0 = self:GetDataSource()
		if f26_local0.isUnlocked:GetValue( f2_local1 ) ~= nil then
			f26_local0 = self:GetDataSource()
			if f26_local0.isUnlocked:GetValue( f2_local1 ) == true then
				ACTIONS.AnimateSequence( self, "DefaultSequence" )
			end
		end
	end )
	f0_local0( self, f2_local1, controller )
	ACTIONS.AnimateSequence( self, "DefaultSequence" )
	return self
end

MenuBuilder.registerType( "SPPerkButton", SPPerkButton )
LockTable( _M )
