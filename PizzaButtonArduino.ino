/* This sketch is an adjusted version of the origianl sketch produced by Tom Igoe
Reference:
http://www.arduino.cc/en/Tutorial/ButtonStateChange
*/

const int buttonPin = 7;     // the pin that the pushbutton is attached to
const int ledPin = 5;       //the pin the led is attached to

// Variables will change:
int buttonPushCounter = 0;   // counter for the number of button presses
int buttonState = 0;         // current state of the button
int lastButtonState = 0; // previous state of the button

boolean ledBlinking = false; //function for blinking the led

void setup() {
    pinMode(buttonPin, INPUT); // initialize the button pin as a input
    pinMode(ledPin, OUTPUT); // initialize the LED as an output

    Serial.begin(9600); // initialize serial communication
}


void loop() {
    // read the pushbutton input pin
    buttonState = digitalRead(buttonPin);

    // compare the buttonState to its previous state
    if (buttonState != lastButtonState) {
        // if the state has changed, increment the counter
        if (buttonState == HIGH) {
            // if the current state is HIGH then the button
            // wend from off to on:
            buttonPushCounter++;
            Serial.println("on"); //print when the button is pushed with "on"

            lastButtonState = buttonState; //define state of the button;
            ledBlinking = !ledBlinking; //if the button state is high then start blinking

        }
        delay(50);
    }

    // lastButtonState = buttonState;

    if (ledBlinking == true) //if the led blinking function is true...
    {
        digitalWrite (ledPin, HIGH); //then output, turn led on
        delay(500);
        digitalWrite (ledPin, LOW); //then turn led off
        delay(500);
    }
    else { //otherwise...
        digitalWrite(ledPin, LOW); //turn led off
    }
}
