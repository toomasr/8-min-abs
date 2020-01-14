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
    function initialize() {
        MenuInputDelegate.initialize();
    }

    function onMenuItem(item) {
        System.println("SettingsMenuDelegate - onMenuItem");
        if (item == :menu_exercise_length1) {
        	System.println("menu_exercise_length1");
        	var numberPickerEx = new MyNumberPicker("ExerciseLengthInSeconds");
            Ui.pushView(numberPickerEx, new MyNumberPickerDelegate(numberPickerEx), Ui.SLIDE_IMMEDIATE);
            System.println("/menu_exercise_length1");
        }
        else if (item == :menu_pause_length1) {
        	System.println("menu_pause_length1");
        	var numberPickerPause = new MyNumberPicker("PauseLengthInSeconds");
        	Ui.pushView(numberPickerPause, new MyNumberPickerDelegate(numberPickerPause), Ui.SLIDE_IMMEDIATE);
        	System.println("/menu_pause_length1");
        }
        // no need to do anything here as the menu seems
        // to pop all by itself to previous; if I pop then it
        // goes back to very beginning screen
        else if (item == :menu_back1) {
        	// this block is not actually needed
        }
        System.println("/SettingsMenuDelegate - onMenuItem");
    }
}