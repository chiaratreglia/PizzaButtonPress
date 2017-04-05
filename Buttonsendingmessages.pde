//  This sketch integrates the Processing code provided at
//  https://learn.sparkfun.com/tutorials/connecting-arduino-to-processing
//  to an adjusted version of the library sketch OOCSI for Processing > Channel Sender


import nl.tue.id.oocsi.*;  //import oocsi
import processing.serial.*; //!!very important: import processing.serial. It allows serial commnication between arduino and processing

Serial myPort;  // Create object from Serial class
String val = "";     // Data received from the serial port
String oocsiServer = "oocsi.id.tue.nl"; //define server
String oocsiChannel = "choosePizza";  //define channel

OOCSI oocsi;

void setup() {
    // Setup Processing
    size(100, 100);

    // Setup Serial Connection
    String portName = Serial.list()[1]; //change the 0 to a 1 or 2 etc. to match your port
    myPort = new Serial(this, portName, 9600);
    // connect ot OOCSI server running on the same machine (localhost)
    // with "senderName" to be my channel others can send data to

    // Setup OOCSI
    oocsi = new OOCSI(this, "marijebaars", oocsiServer);
    oocsi.subscribe(oocsiChannel, "eventHandler");
}

void draw() {

    if ( myPort.available() > 0) // If data from myPort is available,
    {
        val = myPort.readStringUntil('\n'); // read it and store it in val

        if (val!=null) { //if the value is not null
            if(val.indexOf("on") != -1) { //this corrects the data (if the data received is "no" instead of "on"

                println("ORDERED PIZZA !"); //check via printing that the order is executed
                // send to OOCSI ...
                oocsi
                // on channel...
                .channel("choosePizza")
                // call function buttonPress and set it true...
                .data("buttonPress", true)
                // send finally
                .send();
            }
        }
    }

}
