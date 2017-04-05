# PizzaButtonPress
PizzaButtonPress is the user input module for the PizzaButton ecosystem. It will handle physical button presses and relay them to the system. It uses an Arduino, a phsical button and a computer running Processing.

## Setup
First of all, wire the button up to your Arduino, using the diagram below:

![diagram](http://i.imgur.com/C4rgo94.jpg)

Secondly, upload the firmware to your Arduino.

## Set up Buttonsendingmessages 

First of all, set up variables:

val (String): this is the value that is sent from the Arduino board to processing via serial port;
OOCSI Server: define the server (e.g. oocsi.id.tue.nl)
OOCSI Channel: define the Channel. In this case, the module communicates with pizzaChoose to this will be the selected channel.
username: specify a username of a Twitter account owner to allow the execution of all the steps of the service.

#### That's it!

