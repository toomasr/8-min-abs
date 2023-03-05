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

using Toybox.Graphics as Gfx;
using Toybox.WatchUi as Ui;
import Toybox.Lang;

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
    
    function getIndex(value as Number) as Number {
    	var index = (value / mIncrement) - 1;
    	return index;
    }

    function getDrawable(index as Number, selected as Number) {
        return new Ui.Text( { :text=> (getValue(index) as Number).format(mFormatString), :color=>Gfx.COLOR_WHITE, :font=> mFont, :locX =>Ui.LAYOUT_HALIGN_CENTER, :locY=>Ui.LAYOUT_VALIGN_CENTER } );
    }

    function getValue(index) {
        return mStart + (index * mIncrement);
    }

    function getSize() {
        return ( mStop - mStart ) / mIncrement + 1;
    }

}
