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

using Toybox.WatchUi as Ui;

class SettingsMenuDelegate extends Ui.MenuInputDelegate {
	// I'm caching these as everything was super slow
	// maybe helps
	hidden var numberPickerEx;
	hidden var numberPickerDelegateEx;
	hidden var numberPickerPause;
	hidden var numberPickerDelegatePause;
	
    function initialize() {
        System.println("SettingsMenuDelegate - initialize");
        MenuInputDelegate.initialize();
        
        // WOW, I cannot use the const from MinuteAbsApp because then the simulator
        // blows up with Symbol Not Found Error
        numberPickerEx = new MyNumberPicker("ExerciseLengthInSeconds");
        System.println("numberPickerEx - done");
        numberPickerDelegateEx = new MyNumberPickerDelegate(numberPickerEx);
        System.println("numberPickerDelegateEx - done");
        numberPickerPause = new MyNumberPicker("PauseLengthInSeconds");
        System.println("numberPickerPause - done");
        numberPickerDelegatePause = new MyNumberPickerDelegate(numberPickerPause);
        System.println("numberPickerDelegatePause - done");
    }

    function onMenuItem(item) {
        System.println("SettingsMenuDelegate - onMenuItem");
        if (item == :menu_exercise_length1) {	
            Ui.pushView(numberPickerEx, numberPickerDelegateEx, Ui.SLIDE_IMMEDIATE);
        }
        else if (item == :menu_pause_length1) {
        	Ui.pushView(numberPickerPause, numberPickerDelegatePause, Ui.SLIDE_IMMEDIATE);
        }
        else if (item == :menu_back1) {
        	Ui.popView(Ui.SLIDE_IMMEDIATE);
        }
    }
}