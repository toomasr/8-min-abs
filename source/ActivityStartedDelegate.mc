using Toybox.WatchUi as Ui;
using Toybox.System as Sys;

class ActivityStartedDelegate extends Ui.InputDelegate {

    function initialize() {
        InputDelegate.initialize();
    }
    
    function onKey(keyEvent) {
        System.println(keyEvent.getKey());         // e.g. KEY_MENU = 7
    }
}