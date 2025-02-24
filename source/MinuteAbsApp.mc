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
			return [ new MinuteAbsView() ];
	}

}
