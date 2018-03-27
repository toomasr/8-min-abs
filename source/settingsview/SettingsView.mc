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