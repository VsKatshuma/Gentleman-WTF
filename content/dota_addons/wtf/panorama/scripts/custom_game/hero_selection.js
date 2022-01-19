function Debug() {
    $.Msg( "Running client JavaScript debug." );
    $.Msg( "Root panel child count: " + $.GetContextPanel().GetChildCount() + " (should be 1)" );
    $.Msg( "Hero selection child count: " + $.GetContextPanel().GetChild(0).GetChildCount() + " (should be 2)" )
    $.Msg( "Text container child count: " + $.GetContextPanel().GetChild(0).GetChild(0).GetChildCount() + " (should be 1)" );
    $.Msg( "Hero container child count: " + $.GetContextPanel().GetChild(0).GetChild(1).GetChildCount() + " (should be 3)" );
    $.Msg( "hero1 child count: " + $.GetContextPanel().GetChild(0).GetChild(1).GetChild(0).GetChildCount() );
    $.Msg( "hero2 child count: " + $.GetContextPanel().GetChild(0).GetChild(1).GetChild(1).GetChildCount() );
    $.Msg( "hero3 child count: " + $.GetContextPanel().GetChild(0).GetChild(1).GetChild(2).GetChildCount() );
    $.Msg( "End." );
}

/*
 * Show hero options to client
 */
function ShowHeroOptions( event_data ) {
    // Clear previous hero images and load new ones
    $( "#hero1" ).RemoveAndDeleteChildren();
    $( "#hero1" ).BLoadLayoutSnippet(event_data["1"]);
    $( "#hero2" ).RemoveAndDeleteChildren();
    $( "#hero2" ).BLoadLayoutSnippet(event_data["2"]);
    $( "#hero3" ).RemoveAndDeleteChildren();
    $( "#hero3" ).BLoadLayoutSnippet(event_data["3"]);

    // Get button handles
    let button1 = $( "#hero1" ).GetChild(0).GetChild(1).GetChild(0);
    let button2 = $( "#hero2" ).GetChild(0).GetChild(1).GetChild(0);
    let button3 = $( "#hero3" ).GetChild(0).GetChild(1).GetChild(0);

    // Configure buttons to send hero selection to server and hide hero selection UI
    button1.SetPanelEvent( "onactivate", function () {
            GameEvents.SendCustomGameEventToServer( "next_hero_selection", { "selection": 1 } );
            $.GetContextPanel().GetChild(0).visible = false;
    } );
    button2.SetPanelEvent( "onactivate", function () {
            GameEvents.SendCustomGameEventToServer( "next_hero_selection", { "selection": 2 } );
            $.GetContextPanel().GetChild(0).visible = false;
    } );
    button3.SetPanelEvent( "onactivate", function () {
            GameEvents.SendCustomGameEventToServer( "next_hero_selection", { "selection": 3 } );
            $.GetContextPanel().GetChild(0).visible = false;
    } );

    // Show hero selection UI
    $.GetContextPanel().GetChild(0).visible = true;
}

/*
 * Hide hero selection UI
 */
function HideHeroOptions( event_data ) {
    $.GetContextPanel().GetChild(0).visible = false;
}

$.GetContextPanel().GetChild(0).visible = false;
GameEvents.Subscribe( "next_hero_options", ShowHeroOptions );
GameEvents.Subscribe( "hide_hero_options", HideHeroOptions );

//Debug();
