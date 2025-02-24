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
using Toybox.WatchUi;
using Toybox.System;
using Toybox.Application;
using Toybox.Graphics as Gfx;

class MyNumberPicker extends WatchUi.Picker {
	hidden var mPropName;
	hidden var numberFactory = new NumberFactory(5, 95, 5);
	hidden var title = new WatchUi.Text({:text=>"Seconds",
    							 :locX=>WatchUi.LAYOUT_HALIGN_CENTER});
	
    function initialize(propName) {
      System.println("MyNumberPicker.initialize");
    	mPropName = propName;

    	var value = loadState(mPropName);
    	System.println("MyNumberPicker - initialize - loadState done");
      WatchUi.Picker.initialize({:title => title,
        					  :pattern => [numberFactory],
        					  :defaults => [numberFactory.getIndex(value)]});
      System.println("/MyNumberPicker.initialize");
    }
    
    function onUpdate(dc) {
    	WatchUi.Picker.onUpdate(dc);
    	System.println("MyNumberPicker.onUpdate");
      	dc.setColor(Gfx.COLOR_BLACK, Gfx.COLOR_BLACK);
        dc.clear();
        System.println("/MyNumberPicker.onUpdate");
    }

    function saveState(value) {
    	System.println("MyNumberPicker.saveState (" + value + ")");
    	saveStateGlobal(mPropName, value);
      System.println("/MyNumberPicker.saveState (" + value + ")");
    }

    function saveStateGlobal(key, value) {
			System.println("MinuteAbsApp.saveState");
      if (App has :Storage) {
        System.println("hasStorage");
        App.Storage.setValue(key, value);
      }
      else {
        System.println("saveProperty");
        var myApp = Application.getApp();
        myApp.setProperty(key, value);
        myApp.saveProperties();
      }
      System.println("/MinuteAbsApp.saveState");
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
          // cannot use constant - fenix watch blows up!
        if ("ExerciseLengthInSeconds" == key) {
          return 45;
        }
        else {
          return 5;
        }    		
      }
      return rtrn;
    }
}

class MyNumberPickerDelegate extends WatchUi.PickerDelegate {
	hidden var mPicker;
	
    function initialize(picker) {
        System.println("MyNumberPickerDelegate.initialize");
        WatchUi.PickerDelegate.initialize();
        mPicker = picker;
        System.println("/MyNumberPickerDelegate.initialize");
    }

	function onCancel() {
		WatchUi.popView(WatchUi.SLIDE_IMMEDIATE);
		return true;
	}

	function onAccept(values) {
		System.println("MyNumberPickerDelegate.onAccept");
		mPicker.saveState(values[0]);
		WatchUi.popView(WatchUi.SLIDE_IMMEDIATE);
		System.println("/MyNumberPickerDelegate.onAccept");
		return true;
	}
}