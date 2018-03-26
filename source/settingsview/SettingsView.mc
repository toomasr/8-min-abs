using Toybox.WatchUi as Ui;

class SettingsView extends Ui.View {

    function initialize() {
        View.initialize();
    }

    function onLayout(dc) {
        setLayout(Rez.Layouts.MainLayout(dc));
    }

    function onShow() {
    	Ui.pushView(new Rez.Menus.SettingsMenu(), new SettingsMenuDelegate(), Ui.SLIDE_UP);
    }

    function onUpdate(dc) {
        View.onUpdate(dc);
    }
}

class SettingsMenuDelegate extends Ui.MenuInputDelegate {

    function initialize() {
        MenuInputDelegate.initialize();
    }

    function onMenuItem(item) {
        if (item == :menu_exercise_length1) {
        	// WOW, I cannot use the const from MinuteAbsApp because then the simulator
        	// blows up with Symbol Not Found Error
        	var numberPicker = new MyNumberPicker("ExerciseLengthInSeconds");
            Ui.pushView(numberPicker, new MyNumberPickerDelegate(numberPicker), Ui.SLIDE_UP);
        }
        else if (item == :menu_pause_length1) {
        	// WOW, I cannot use the const from MinuteAbsApp because then the simulator
        	// blows up with Symbol Not Found Error
        	var numberPicker = new MyNumberPicker("PauseLengthInSeconds");
        	Ui.pushView(numberPicker, new MyNumberPickerDelegate(numberPicker), Ui.SLIDE_UP);
        }
        else if (item == :menu_back1) {
        	// pop this view
        	Ui.popView(Ui.SLIDE_IMMEDIATE);
        }
    }

}