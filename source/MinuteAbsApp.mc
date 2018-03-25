using Toybox.Application as App;
using Toybox.WatchUi as Ui;

class MinuteAbsApp extends App.AppBase {

    function initialize() {
        AppBase.initialize();
    }

    // onStart() is called on application start up
    function onStart(state) {
    	System.print("onStart()");
    }

    // onStop() is called when your application is exiting
    function onStop(state) {
    }

    // Return the initial view of your application here
    function getInitialView() {
        return [ new MinuteAbsView(), new MinuteAbsDelegate() ];
    }

}