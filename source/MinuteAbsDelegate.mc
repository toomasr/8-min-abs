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

class MinuteAbsDelegate extends Ui.BehaviorDelegate {

    function initialize() {
        BehaviorDelegate.initialize();
    }

    function onMenu() {
        Ui.pushView(new Rez.Menus.MainMenu(), new MinuteAbsMenuDelegate(), Ui.SLIDE_UP);
        return true;
    }
    
    // Detect Menu button input
    function onKey(keyEvent) {
        if (keyEvent.getKey() == 13) {
        	return onMenu();
        }
        return false;
    }
}

class MinuteAbsMenuDelegate extends Ui.MenuInputDelegate {

    function initialize() {
        MenuInputDelegate.initialize();
    }

    function onMenuItem(item) {
        if (item == :menu_start) {
            Ui.pushView(new ActivityStartedView(), new ActivityStartedDelegate(), Ui.SLIDE_UP);
        }
        else if (item == :menu_settings) {
            Ui.pushView(new Rez.Menus.SettingsMenu(), new SettingsMenuDelegate(), Ui.SLIDE_UP);
        }
        else if (item == :menu_quit) {
        	Ui.popView(Ui.SLIDE_IMMEDIATE);
        }
    }

}