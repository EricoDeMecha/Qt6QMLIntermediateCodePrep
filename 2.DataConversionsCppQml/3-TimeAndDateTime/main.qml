/*

        . Exploring the exchange of data between C++ and QML
            . In the context of
                . date
                . datetime

        . We also show string formatting in QML an addition to regular JS
            . property string mValue: "Clicked %1 times, double is %2"

  */

import QtQuick
import QtQuick.Controls

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("String,Date and Time")

    property string mValue: "Clicked %1 times, double is %2"
    property int clickCount: 0

    Connections{
        target: CppClass
        //Receiving data from C++
        function onSendDateTime (datetimeparam)
        {
            console.log("Received datetime :"+ datetimeparam);
            //Extract info
            console.log("Year :" + datetimeparam.getFullYear())
            console.log("...",datetimeparam.toGMTString())
        }

        function onSendTime(timeparam){
            console.log("Received time :"+ timeparam);

        }
    }

    Button{
        id : mButton
        text : "Click Me"
        onClicked: {
            //Receiving data from C++
            //CppClass.cppSlot()


            //Sending data to C++
            var date = new Date()
            //CppClass.timeSlot(date);
            //CppClass.dateTimeSlot(date)

            //String formatting
            clickCount++
            mButton.text = mValue.arg(clickCount).arg(clickCount*2)

        }
    }
}
