local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function PostLoadFunc( f1_arg0, f1_arg1 )
	f1_arg0:SetupAnchoredElement( {
		minScale = 1,
		entityTag = "tag_eye",
		worldOffsetZ = 10
	} )
	f1_arg0:SubscribeToModelThroughElement( f1_arg0, "clientNum", function ()
		local f2_local0 = f1_arg0:GetDataSource()
		f1_arg0:SetEntityNum( f2_local0.clientNum:GetValue( f1_arg1 ) )
	end )
end

function ReviveBar( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 150 * _1080p, 0, 33 * _1080p )
	self.id = "ReviveBar"
	self._animationSets = {}
	self._sequences = {}
	local f3_local1 = controller and controller.controllerIndex
	if not f3_local1 and not Engine.InFrontend() then
		f3_local1 = self:getRootController()
	end
	assert( f3_local1 )
	local f3_local2 = self
	local Title = nil
	
	Title = LUI.UIText.new()
	Title.id = "Title"
	Title:setText( "Reviving", 0 )
	Title:SetFontSize( 19 * _1080p )
	Title:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	Title:SetAlignment( LUI.Alignment.Left )
	Title:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, _1080p * 3, _1080p * 22 )
	self:addElement( Title )
	self.Title = Title
	
	local Background = nil
	
	Background = LUI.UIImage.new()
	Background.id = "Background"
	Background:SetRGBFromInt( 0, 0 )
	Background:SetAlpha( 0.2, 0 )
	Background:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 150, _1080p * 3, _1080p * 32.5 )
	self:addElement( Background )
	self.Background = Background
	
	local ProgressBar = nil
	
	ProgressBar = LUI.UIImage.new()
	ProgressBar.id = "ProgressBar"
	ProgressBar:SetAnchors( 0, 1, 0, 1, 0 )
	ProgressBar:SetLeft( _1080p * 0, 0 )
	ProgressBar:SetTop( _1080p * 27.5, 0 )
	ProgressBar:SetBottom( _1080p * 32.5, 0 )
	ProgressBar:SubscribeToModelThroughElement( self, "progress", function ()
		local f4_local0 = self:GetDataSource()
		f4_local0 = f4_local0.progress:GetValue( f3_local1 )
		if f4_local0 ~= nil then
			ProgressBar:SetRight( _1080p * Multiply( f4_local0, 150 ), 0 )
		end
	end )
	self:addElement( ProgressBar )
	self.ProgressBar = ProgressBar
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		Title:RegisterAnimationSequence( "Intro", {
			{
				function ()
					return self.Title:SetAlpha( 0, 0 )
				end,
				function ()
					return self.Title:SetAlpha( 1, 500 )
				end
			}
		} )
		Background:RegisterAnimationSequence( "Intro", {
			{
				function ()
					return self.Background:SetAlpha( 0, 0 )
				end,
				function ()
					return self.Background:SetAlpha( 0.2, 500 )
				end
			}
		} )
		ProgressBar:RegisterAnimationSequence( "Intro", {
			{
				function ()
					return self.ProgressBar:SetAlpha( 0, 0 )
				end,
				function ()
					return self.ProgressBar:SetAlpha( 1, 500 )
				end
			}
		} )
		self._sequences.Intro = function ()
			Title:AnimateSequence( "Intro" )
			Background:AnimateSequence( "Intro" )
			ProgressBar:AnimateSequence( "Intro" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	self:SubscribeToModelThroughElement( self, "clientNum", function ()
		ACTIONS.AnimateSequence( self, "Intro" )
	end )
	PostLoadFunc( self, f3_local1, controller )
	return self
end

MenuBuilder.registerType( "ReviveBar", ReviveBar )
LockTable( _M )
