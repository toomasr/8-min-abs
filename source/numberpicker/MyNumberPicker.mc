using Toybox.WatchUi as Ui;
using Toybox.Graphics as Gfx;
using Toybox.System as System;
using Toybox.Application as App;

class MyNumberPicker extends Ui.Picker {
	hidden var mPropName;
	
    function initialize(propName) {
    	mPropName = propName;
    	
    	var numberFactory = new NumberFactory(5, 95, 5);
    	var title = new Ui.Text({:text=>"Seconds",
    							 :locX=>WatchUi.LAYOUT_HALIGN_CENTER});
    	
    	var value = MinuteAbsApp.loadState(mPropName);
        Ui.Picker.initialize({:title => title,
        					  :pattern => [numberFactory],
        					  :defaults=>[numberFactory.getIndex(value)]});
    }
    
    function onUpdate(dc) {
        dc.setColor(Gfx.COLOR_BLACK, Gfx.COLOR_BLACK);
        dc.clear();
        Ui.Picker.onUpdate(dc);
    }
    
    function saveState(value) {
    	MinuteAbsApp.setValue(mPropName, value);
    }
}

class MyNumberPickerDelegate extends Ui.PickerDelegate {
	hidden var mPicker;
	
    function initialize(picker) {
        Ui.PickerDelegate.initialize();
        mPicker = picker;
    }

	function onCancel() {
		Ui.popView(Ui.SLIDE_IMMEDIATE);
	}

	function onAccept(values) {
		mPicker.saveState(values[0]);
		Ui.popView(Ui.SLIDE_IMMEDIATE);
	}
}