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

using Toybox.WatchUi;

class MinuteAbsMenuDelegate extends WatchUi.MenuInputDelegate {    
    function initialize() {
        MenuInputDelegate.initialize(); 
    }

    function onMenuItem(item) {
        System.println("MinuteAbsMenuDelegate.onMenuItem "+item);
        if (item == :menu_start) {
        	System.println("menuStart");
            WatchUi.pushView(new ActivityStartedView(), new ActivityStartedDelegate(), WatchUi.SLIDE_UP);
            System.println("/menuStart");
        }
        else if (item == :menu_settings) {
        	System.println("menuSettings");
            WatchUi.pushView(new Rez.Menus.SettingsMenu(), new SettingsMenuDelegate(), WatchUi.SLIDE_UP);
            System.println("/menuSettings");
        }
        else if (item == :menu_quit) {
        	System.println("menuQuit");
            WatchUi.popView(WatchUi.SLIDE_IMMEDIATE);
            System.println("/menuQuit");
        }
        System.println("/MinuteAbsMenuDelegate.onMenuItem "+item);
    }
}