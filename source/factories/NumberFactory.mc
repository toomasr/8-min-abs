using Toybox.Graphics as Gfx;
using Toybox.WatchUi as Ui;

class NumberFactory extends Ui.PickerFactory {
    hidden var mStart;
    hidden var mStop;
    hidden var mIncrement;
    hidden var mFormatString;
    hidden var mFont;

    function initialize(start, stop, increment) {
        Ui.PickerFactory.initialize();

        mStart = start;
        mStop = stop;
        mIncrement = increment;

        mFont = Gfx.FONT_NUMBER_HOT;
        mFormatString = "%d";
    }
    
    function getIndex(value) {
    	var index = (value / mIncrement) - 1;
    	return index;
    }

    function getDrawable(index, selected) {
        return new Ui.Text( { :text=>getValue(index).format(mFormatString), :color=>Gfx.COLOR_WHITE, :font=> mFont, :locX =>Ui.LAYOUT_HALIGN_CENTER, :locY=>Ui.LAYOUT_VALIGN_CENTER } );
    }

    function getValue(index) {
        return mStart + (index * mIncrement);
    }

    function getSize() {
        return ( mStop - mStart ) / mIncrement + 1;
    }

}
