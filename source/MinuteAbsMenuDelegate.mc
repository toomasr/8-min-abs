using Toybox.WatchUi as Ui;
using Toybox.System as Sys;

class MinuteAbsMenuDelegate extends Ui.MenuInputDelegate {

    function initialize() {
        MenuInputDelegate.initialize();
    }

    function onMenuItem(item) {
        if (item == :item_1) {
            Ui.pushView(new ActivityStartedView(), new ActivityStartedDelegate(), Ui.SLIDE_UP);
        } else if (item == :item_2) {
        	Ui.popView(Ui.SLIDE_IMMEDIATE);
        }
    }

}