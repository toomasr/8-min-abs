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
using Toybox.Timer;
using Toybox.Attention;

class ActivityStartedView extends Ui.View {
	var myTimer = null;
	
	var exerciseInSeconds;
	var pauseInSeconds;
	var myCount;
	var display;
	var exercise = 0;
	
	var getReady = true;
	var doExit = false;
	var status = :chill;
	
	var session = null;

	enum {
		BasicCrunch,
		RightObliqueCrunch,
		LeftObliqueCrunch,
		ToeTouchCrunch,
		ReverseCrunch,
		RightCrunch,
		LeftCrunch,
		PushThroughCrunch,
		LegPushCrunch,
		AlterCurlsCrunch,
		CurlsCrunch
	}
	
	var crunchNames = [:BasicCrunch,
		:RightObliqueCrunch,
		:LeftObliqueCrunch,
		:ToeTouchCrunch,
		:ReverseCrunch,
		:RightCrunch,
		:LeftCrunch,
		:PushThroughCrunch,
		:LegPushCrunch,
		:AlterCurlsCrunch,
		:CurlsCrunch
	];
	
    function initialize() {
        System.println("ActivityStartedView - initialize");
        View.initialize();
        
        exerciseInSeconds = MinuteAbsApp.loadState("ExerciseLengthInSeconds") + 1;
		pauseInSeconds = MinuteAbsApp.loadState("PauseLengthInSeconds") + 1;

		myCount = pauseInSeconds-1;
		display = myCount+"";

   		if (Toybox has :ActivityRecording) {
       		if ((session == null) || (session.isRecording() == false)) {
           		session = ActivityRecording.createSession(
                	{
                	 :name=>"8 Minute Abs",
                	 :sport=>ActivityRecording.SPORT_TRAINING,
               		 :subSport=>ActivityRecording.SUB_SPORT_STRENGTH_TRAINING
                	});
           		session.start();
       		}
       	}
    }
    
    function timerCallback() {
        System.println("ActivityStartedView - timerCallback");
    	myCount = myCount - 1;
    	display = myCount+"";
    	status = :chill;
    	if (getReady) {
    		if (myCount == 0) {    		
				display = Rez.Strings[:start];
				
				myCount = exerciseInSeconds;
				status = :clean;
				getReady = false;
				
				notifyUser();
    		}
    	}
    	else {
    		if (myCount == 0) {
    			myCount = pauseInSeconds;
    			getReady= true;
    			exercise = exercise + 1;
    			display = Rez.Strings[:done];
    			status = :clean;
    			
    			notifyUser();
    		}
    		else if(myCount<3) {
    			notifyUser();
    		}
    	}
    	
    	Ui.requestUpdate();
	}
	
	function notifyUser() {
	   System.println("ActivityStartedView - notifyUser");
		if(Attention has :playTone){
	    	Attention.playTone(Attention.TONE_START);
		}
		if(Attention has :vibrate){
	    	Attention.vibrate([new Attention.VibeProfile(50, 100)]);
		}
	}

    // Load your resources here
    function onLayout(dc) {    
        System.println("ActivityStartedView - onLayout");	
        setLayout(Rez.Layouts.ActivityLayout(dc));
        myTimer = new Timer.Timer();
    	myTimer.start(self.method(:timerCallback), 1000, true);
    }
    
    // Called when this View is brought to the foreground. Restore
    // the state of this View and prepare it to be shown. This includes
    // loading resources into memory.
    function onShow() {
        System.println("ActivityStartedView - onShow");
    }

    // Update the view
    function onUpdate(dc) {
        System.println("ActivityStartedView - onUpdate");
        if (doExit) {
            return;
        }

    	if (exercise == 11) {
    		myTimer.stop();
    		if (Toybox has :ActivityRecording) {
    			if ((session != null) && session.isRecording()) {
           			session.stop();
           			session.save();
           			session = null;
       			}
       		}

      		Ui.pushView(new SuccessView(), new SuccessViewDelegate(), Ui.SLIDE_UP);
      		doExit = true;
    		return;
    	}
    
    	// Change the title of the view
        if (status == :clean) {
        	View.findDrawableById("countdownTitle").setText("");
        }
        else if (getReady) {
        	View.findDrawableById("countdownTitle").setText(Rez.Strings[:getReady]);
        }
        else {
        	View.findDrawableById("countdownTitle").setText(Rez.Strings[crunchNames[exercise]]);
        }

		// Change the countdown numbers of the screen
    	if (myCount == 0) {
    		View.findDrawableById("countdown").setText("");
    	}
    	else if (status == :clean) {
    		View.findDrawableById("countdown").setText("");
        	View.findDrawableById("countdownText").setText(display);
        	View.findDrawableById("countdownSmall").setText("");
        }
        else {
        	if (getReady) {
        		View.findDrawableById("countdownText").setText(Rez.Strings[crunchNames[exercise]]);
        		View.findDrawableById("countdown").setText("");
        		View.findDrawableById("countdownSmall").setText(display);
        	}
        	else {
        		View.findDrawableById("countdownText").setText("");
        		View.findDrawableById("countdown").setText(display);
        		View.findDrawableById("countdownSmall").setText("");
        	}
        }

        View.onUpdate(dc);
    }

    // Called when this View is removed from the screen. Save the
    // state of this View here. This includes freeing resources from
    // memory.
    function onHide() {
        System.println("ActivityStartedView - onHide");
    	myTimer.stop();
		if ((session != null) && session.isRecording()) {
			session.stop();
			session.discard();
			session = null;
       	}
    }
}
