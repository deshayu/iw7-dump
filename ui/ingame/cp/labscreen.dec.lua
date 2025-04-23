local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function PostLoadFunc( f1_arg0, f1_arg1 )
	f1_arg0.Label1:setText( "" )
	f1_arg0:SetupInWorldElement( {} )
	f1_arg0:SetInWorldScale( 0.05 )
	local f1_local0 = function ( f2_arg0, f2_arg1 )
		f2_arg0:SetEntityNum( Game.GetOmnvar( "zm_ui_lab_screen_ent" ) )
		f2_arg0:SetEntityTag( "tag_origin" )
		f2_arg0:SetFollowTagAngles( true )
		f2_arg0:SetTagSpacePosition( 0, 0, 0.5 )
		f2_arg0:SetTagSpaceYaw( 180 )
		f2_arg0:SetTagSpaceRoll( -90 )
	end
	
	f1_arg0:registerOmnvarHandler( "zm_ui_lab_screen_ent", f1_local0 )
	f1_local0( f1_arg0, {} )
	local f1_local1 = nil
	local f1_local2 = LUI.DataSourceFromOmnvar.new( "zm_chem_number_entry_1" )
	f1_arg0:SubscribeToModel( f1_local2:GetModel( f1_arg1 ), function ( f3_arg0 )
		local f3_local0 = DataModel.GetModelValue( f3_arg0 )
		if f3_local0 >= 0 then
			f1_arg0.Label1:setText( tostring( f3_local0 ) )
		else
			f1_arg0.Label1:setText( "" )
		end
		if Game.GetOmnvar( "zm_chem_number_entry_2" ) == 2 and f3_local0 < 10 and f3_local0 > 0 then
			ACTIONS.AnimateSequence( f1_arg0, "slide" )
		else
			ACTIONS.AnimateSequence( f1_arg0, "DefaultSequence" )
		end
	end )
	local f1_local3 = LUI.DataSourceFromOmnvar.new( "zm_lab_screen_beaker1" )
	f1_arg0:SubscribeToModel( f1_local3:GetModel( f1_arg1 ), function ( f4_arg0 )
		local f4_local0 = Engine.TableLookup( CSV.zombieElements.file, CSV.zombieElements.cols.index, DataModel.GetModelValue( f4_arg0 ), CSV.zombieElements.cols.name )
		if f4_local0 ~= "nil" then
			f1_arg0.beaker1:setText( Engine.Localize( f4_local0 ) )
			f1_arg0.beaker1:SetAlpha( 1, 0 )
		else
			f1_arg0.beaker1:SetAlpha( 0, 0 )
		end
	end )
	local f1_local4 = LUI.DataSourceFromOmnvar.new( "zm_lab_screen_beaker2" )
	f1_arg0:SubscribeToModel( f1_local4:GetModel( f1_arg1 ), function ( f5_arg0 )
		local f5_local0 = Engine.TableLookup( CSV.zombieElements.file, CSV.zombieElements.cols.index, DataModel.GetModelValue( f5_arg0 ), CSV.zombieElements.cols.name )
		if f5_local0 ~= "nil" then
			f1_arg0.beaker2:setText( Engine.Localize( f5_local0 ) )
			f1_arg0.beaker2:SetAlpha( 1, 0 )
		else
			f1_arg0.beaker2:SetAlpha( 0, 0 )
		end
	end )
	local f1_local5 = LUI.DataSourceFromOmnvar.new( "zm_lab_screen_beaker3" )
	f1_arg0:SubscribeToModel( f1_local5:GetModel( f1_arg1 ), function ( f6_arg0 )
		local f6_local0 = Engine.TableLookup( CSV.zombieElements.file, CSV.zombieElements.cols.index, DataModel.GetModelValue( f6_arg0 ), CSV.zombieElements.cols.name )
		if f6_local0 ~= "nil" then
			f1_arg0.beaker3:setText( Engine.Localize( f6_local0 ) )
			f1_arg0.beaker3:SetAlpha( 1, 0 )
		else
			f1_arg0.beaker3:SetAlpha( 0, 0 )
		end
	end )
	local f1_local6 = LUI.DataSourceFromOmnvar.new( "zm_lab_screen_beaker4" )
	f1_arg0:SubscribeToModel( f1_local6:GetModel( f1_arg1 ), function ( f7_arg0 )
		local f7_local0 = Engine.TableLookup( CSV.zombieElements.file, CSV.zombieElements.cols.index, DataModel.GetModelValue( f7_arg0 ), CSV.zombieElements.cols.name )
		if f7_local0 ~= "nil" then
			f1_arg0.beaker4:setText( Engine.Localize( f7_local0 ) )
			f1_arg0.beaker4:SetAlpha( 1, 0 )
		else
			f1_arg0.beaker4:SetAlpha( 0, 0 )
		end
	end )
end

function labScreen( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 400 * _1080p, 0, 380 * _1080p )
	self.id = "labScreen"
	self._animationSets = {}
	self._sequences = {}
	local f8_local1 = controller and controller.controllerIndex
	if not f8_local1 and not Engine.InFrontend() then
		f8_local1 = self:getRootController()
	end
	assert( f8_local1 )
	local f8_local2 = self
	local Label1 = nil
	
	Label1 = LUI.UIText.new()
	Label1.id = "Label1"
	Label1:setText( "2", 0 )
	Label1:SetFontSize( 64 * _1080p )
	Label1:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	Label1:SetAlignment( LUI.Alignment.Left )
	Label1:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 172, _1080p * 269, _1080p * 301.58, _1080p * 365.58 )
	self:addElement( Label1 )
	self.Label1 = Label1
	
	local Label0 = nil
	
	Label0 = LUI.UIText.new()
	Label0.id = "Label0"
	Label0:setText( "0", 0 )
	Label0:SetFontSize( 64 * _1080p )
	Label0:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	Label0:SetAlignment( LUI.Alignment.Left )
	Label0:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 171.5, _1080p * 207.5, _1080p * 301.58, _1080p * 365.58 )
	self:addElement( Label0 )
	self.Label0 = Label0
	
	local results = nil
	
	results = LUI.UIImage.new()
	results.id = "results"
	results:setImage( RegisterMaterial( "cp_town_chem_sum_results" ), 0 )
	results:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 11, _1080p * 90, _1080p * 296.86, _1080p * 370.3 )
	self:addElement( results )
	self.results = results
	
	local line0 = nil
	
	line0 = LUI.UIImage.new()
	line0.id = "line0"
	line0:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 173.5, _1080p * 198.5, _1080p * 357.8, _1080p * 361.91 )
	self:addElement( line0 )
	self.line0 = line0
	
	local beaker4 = nil
	
	beaker4 = LUI.UIText.new()
	beaker4.id = "beaker4"
	beaker4:SetAlpha( 0, 0 )
	beaker4:setText( Engine.Localize( "MENU_NEW" ), 0 )
	beaker4:SetFontSize( 32 * _1080p )
	beaker4:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	beaker4:SetAlignment( LUI.Alignment.Left )
	beaker4:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 11, _1080p * 400, _1080p * 192, _1080p * 225 )
	self:addElement( beaker4 )
	self.beaker4 = beaker4
	
	local beaker3 = nil
	
	beaker3 = LUI.UIText.new()
	beaker3.id = "beaker3"
	beaker3:SetAlpha( 0, 0 )
	beaker3:setText( Engine.Localize( "MENU_NEW" ), 0 )
	beaker3:SetFontSize( 62 * _1080p )
	beaker3:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	beaker3:SetAlignment( LUI.Alignment.Left )
	beaker3:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 11, _1080p * 400, _1080p * 131, _1080p * 162 )
	self:addElement( beaker3 )
	self.beaker3 = beaker3
	
	local beaker2 = nil
	
	beaker2 = LUI.UIText.new()
	beaker2.id = "beaker2"
	beaker2:SetAlpha( 0, 0 )
	beaker2:setText( Engine.Localize( "MENU_NEW" ), 0 )
	beaker2:SetFontSize( 32 * _1080p )
	beaker2:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	beaker2:SetAlignment( LUI.Alignment.Left )
	beaker2:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 11, _1080p * 400, _1080p * 68, _1080p * 101 )
	self:addElement( beaker2 )
	self.beaker2 = beaker2
	
	local beaker1 = nil
	
	beaker1 = LUI.UIText.new()
	beaker1.id = "beaker1"
	beaker1:SetAlpha( 0, 0 )
	beaker1:setText( Engine.Localize( "MENU_NEW" ), 0 )
	beaker1:SetFontSize( 50 * _1080p )
	beaker1:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	beaker1:SetAlignment( LUI.Alignment.Left )
	beaker1:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 10, _1080p * 463, _1080p * 5, _1080p * 38 )
	self:addElement( beaker1 )
	self.beaker1 = beaker1
	
	local line0Copy0 = nil
	
	line0Copy0 = LUI.UIImage.new()
	line0Copy0.id = "line0Copy0"
	line0Copy0:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 208, _1080p * 233, _1080p * 357.8, _1080p * 361.91 )
	self:addElement( line0Copy0 )
	self.line0Copy0 = line0Copy0
	
	self._animationSets.DefaultAnimationSet = function ()
		Label1:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.Label1:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 172, _1080p * 269, _1080p * 301.58, _1080p * 365.58, 0 )
				end
			}
		} )
		Label0:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.Label0:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.DefaultSequence = function ()
			Label1:AnimateSequence( "DefaultSequence" )
			Label0:AnimateSequence( "DefaultSequence" )
		end
		
		Label1:RegisterAnimationSequence( "slide", {
			{
				function ()
					return self.Label1:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 206, _1080p * 303, _1080p * 301.58, _1080p * 365.58, 0 )
				end
			}
		} )
		Label0:RegisterAnimationSequence( "slide", {
			{
				function ()
					return self.Label0:SetAlpha( 1, 0 )
				end
			}
		} )
		self._sequences.slide = function ()
			Label1:AnimateSequence( "slide" )
			Label0:AnimateSequence( "slide" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	PostLoadFunc( self, f8_local1, controller )
	ACTIONS.AnimateSequence( self, "DefaultSequence" )
	return self
end

MenuBuilder.registerType( "labScreen", labScreen )
LockTable( _M )
