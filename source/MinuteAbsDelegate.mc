using Toybox.WatchUi as Ui;

class MinuteAbsDelegate extends Ui.BehaviorDelegate {

    function initialize() {
        BehaviorDelegate.initialize();
    }

    function onMenu() {
    	System.println("onMenu - showing new menu");
        Ui.pushView(new Rez.Menus.MainMenu(), new MinuteAbsMenuDelegate(), Ui.SLIDE_UP);
        return true;
    }
    
    // Detect Menu button input
    function onKey(keyEvent) {
        System.println(keyEvent.getKey()); // e.g. KEY_MENU = 7
        if (keyEvent.getKey() == 13) {
        	return onMenu();
        }
    }
}