using Toybox.WatchUi as Ui;

class MinuteAbsDelegate extends Ui.BehaviorDelegate {

    function initialize() {
        BehaviorDelegate.initialize();
    }

    function onMenu() {
        Ui.pushView(new Rez.Menus.MainMenu(), new MinuteAbsMenuDelegate(), Ui.SLIDE_UP);
        return true;
    }
    
    // Detect Menu button input
    function onKey(keyEvent) {
        if (keyEvent.getKey() == 13) {
        	return onMenu();
        }
    }
}