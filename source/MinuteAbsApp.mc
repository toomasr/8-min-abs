using Toybox.Application as App;
using Toybox.WatchUi as Ui;

class MinuteAbsApp extends App.AppBase {
	const EXERCISE_LEN_KEY = "ExerciseLengthInSeconds";
	const PAUSE_LEN_KEY = "PauseLengthInSeconds";
	
    function initialize() {
        AppBase.initialize();
    }

    // onStart() is called on application start up
    function onStart(state) {
    }

    // onStop() is called when your application is exiting
    function onStop(state) {
    }

    // Return the initial view of your application here
    function getInitialView() {
        return [ new MinuteAbsView(), new MinuteAbsDelegate() ];
    }

    function saveState(key, value) {
    	if (App.Storage has :setValue) {
    		App.Storage.setValue(key, value);
    	}
    	else {
    		var myApp = Application.getApp();
    		myApp.setProperty(key, value);
    		myApp.saveProperties();
    	}
    }
    
    function loadState(key) {
    	var rtrn = null;
    	// works on SDK 2.4
    	if (App.Storage has :getValue) {
    		rtrn = App.Storage.getValue(key);
    	}
    	// works on SDK 1.0 but currently told
    	// that will be deprecated soon
    	else {
    		var myApp = Application.getApp();
    		rtrn = myApp.getProperty(key); 
    	}
    	
    	if (rtrn == null) {
    		if (MinuteAbsApp.EXERCISE_LEN_KEY == key) {
    			return 45;
    		}
    		else {
    			return 5;
    		}    		
    	}
    	return rtrn;
    }
}
