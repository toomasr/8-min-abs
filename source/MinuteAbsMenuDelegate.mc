using Toybox.WatchUi as Ui;
using Toybox.System as Sys;

class MinuteAbsMenuDelegate extends Ui.MenuInputDelegate {

    function initialize() {
        MenuInputDelegate.initialize();
    }

    function onMenuItem(item) {
        if (item == :item_1) {
            Sys.println("item 1");
            Ui.pushView(new ActivityStartedView(), new ActivityStartedDelegate(), Ui.SLIDE_UP);
        } else if (item == :item_2) {
            Sys.println("item 2");
        }
    }

}