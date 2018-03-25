using Toybox.WatchUi as Ui;
using Toybox.Timer;
using Toybox.Attention;

class ActivityStartedView extends Ui.View {
	var myTimer = null;
	
	var exercise = 0;
	var exerciseInSeconds = 11;
	var pauseInSeconds = 6;
	var myCount = pauseInSeconds-1;
	var display = myCount+"";
	
	var getReady = true;
	var status = :chill;

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
        View.initialize();
    }
    
    function timerCallback() {
    	myCount = myCount - 1;
    	display = myCount+"";
    	status = :chill;
    	if (getReady) {
    		if (myCount == 0) {    		
				display = Rez.Strings[:start];
				
				myCount = exerciseInSeconds;
				status = :clean;
				getReady = false;
				
    			if(Attention has :playTone){
                	Attention.playTone(Attention.TONE_START);
            	}
            	if(Attention has :vibrate){
                	Attention.vibrate(new Attention.VibeProfile(50, 100));
            	}
    		}
    	}
    	else {
    		if (myCount == 0) {
    			myCount = pauseInSeconds;
    			getReady= true;
    			exercise = exercise + 1;
    			display = Rez.Strings[:done];
    			status = :clean;
    			
    			if(Attention has :playTone){
                	Attention.playTone(Attention.TONE_START);
            	}
            	if(Attention has :vibrate){
                	Attention.vibrate(new Attention.VibeProfile(50, 100));
            	}
    		}
    	}
    	
    	Ui.requestUpdate();
	}

    // Load your resources here
    function onLayout(dc) {    	
        setLayout(Rez.Layouts.ActivityLayout(dc));
        myTimer = new Timer.Timer();
    	myTimer.start(self.method(:timerCallback), 1000, true);
    }
    
    // Called when this View is brought to the foreground. Restore
    // the state of this View and prepare it to be shown. This includes
    // loading resources into memory.
    function onShow() {
    }

    // Update the view
    function onUpdate(dc) {
        if (status == :clean) {
        	View.findDrawableById("countdownTitle").setText("");
        }
        else if (getReady) {
        	View.findDrawableById("countdownTitle").setText(Rez.Strings[:getReady]);
        }
        else {
        	View.findDrawableById("countdownTitle").setText(Rez.Strings[crunchNames[exercise]]);
        }

    	if (myCount == 0) {
    		View.findDrawableById("countdown").setText("");
    	}
    	else {
        	View.findDrawableById("countdown").setText(display);
        }

        View.onUpdate(dc);
    }

    // Called when this View is removed from the screen. Save the
    // state of this View here. This includes freeing resources from
    // memory.
    function onHide() {
    }

}