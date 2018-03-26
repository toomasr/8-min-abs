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

class MinuteAbsMenuDelegate extends Ui.MenuInputDelegate {

    function initialize() {
        MenuInputDelegate.initialize();
    }

    function onMenuItem(item) {
        if (item == :menu_start) {
            Ui.pushView(new ActivityStartedView(), new ActivityStartedDelegate(), Ui.SLIDE_UP);
        }
        else if (item == :menu_settings) {
            Ui.pushView(new Rez.Menus.SettingsMenu(), new SettingsMenuDelegate(), Ui.SLIDE_UP);
        }
        else if (item == :menu_quit) {
        	Ui.popView(Ui.SLIDE_IMMEDIATE);
        }
    }

}