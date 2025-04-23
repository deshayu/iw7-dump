LUI.BinkSkipPromptLayer = LUI.Class( LUI.UIElement )
LUI.BinkSkipPromptLayer.init = function ( f1_arg0 )
	LUI.BinkSkipPromptLayer.super.init( f1_arg0 )
	f1_arg0.id = "BinkSkipPromptLayer"
end

LUI.BinkSkipPromptLayer.ShouldBeVisible = function ( f2_arg0 )
	return Game.GetOmnvar( "ui_is_bink_skippable" )
end

LUI.BinkSkipPromptLayer.InitLayer = function ( f3_arg0 )
	f3_arg0:addElement( MenuBuilder.BuildRegisteredType( "BinkSkipPrompt", {
		onSkipInput = function ()
			Engine.NotifyServer( "skip_bink_input", 0 )
		end
	} ) )
end

LUI.BinkSkipPromptLayer.ClearLayer = function ( f5_arg0, f5_arg1 )
	f5_arg0:closeChildren()
end

