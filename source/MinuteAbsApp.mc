/**
 *    Copyright (C) 2018 Toomas Römer <toomasr@gmail.com>
 *
 *    Licensed under the Apache License, Version 2.0 (the "License");
 *    you may not use this file except in compliance with the License.
 *    You may obtain a copy of the License at
 *
 *        http://www.apache.org/licenses/LICENSE-2.0
 *
 *    Unless required by applicable law or agreed to in writing, software
 *    distributed under the License is distributed on an "AS IS" BASIS,
 *    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 *    See the License for the specific language governing permissions and
 *    limitations under the License.
 */

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
        System.println("onStart");
    }

    // onStop() is called when your application is exiting
    function onStop(state) {
        System.println("onStop");
    }

    // Return the initial view of your application here
    function getInitialView() {
        System.println("getInitialView");
    	var view = new MinuteAbsView(); 
        return [ view, new MinuteAbsDelegate() ];
    }

    function saveState(key, value) {
        System.println("saveState");
    	if (App has :Storage) {
    		App.Storage.setValue(key, value);
    	}
    	else {
    		var myApp = Application.getApp();
    		myApp.setProperty(key, value);
    		myApp.saveProperties();
    	}
    }
    
    function loadState(key) {
        System.println("loadState");
    	var rtrn = null;
    	// works on SDK 2.4
    	if (App has :Storage) {
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
