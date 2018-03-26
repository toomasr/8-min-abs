using Toybox.WatchUi as Ui;

class SuccessView extends Ui.View {
    function initialize() {
        View.initialize();
    }

    function onLayout(dc) {
        setLayout(Rez.Layouts.SuccessLayout(dc));
    }
}

class SuccessViewDelegate extends Ui.InputDelegate {
    function initialize() {
        InputDelegate.initialize();
    }

    function onKey(keyEvent) {
    	Ui.popView(Ui.SLIDE_IMMEDIATE);
    }
}