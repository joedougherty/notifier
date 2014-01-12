# Notifier: A simple cubicle doorbell project #
## Give your co-workers an easy way, non-intrusive to get your attention if you happen to have headphones on ##

## Mac OS X: ##
### Materials/Packages Used ###

 + Arduino (I used the Uno) + USB cable
 + [RF Receiver Module (Momentary type)] (http://www.adafruit.com/products/1096)
 + [Keyfob (to pair with RF receiver)] (http://www.adafruit.com/products/1095)
 + [Growl] (http://growl.info/)
 + Python 2.7.2
 + [GNTP module] (http://pythonhosted.org/gntp/) 

### Setup ###
#### Hardware ####
Wire the RF receiver up to your Arduino. 

 + Connect GND on the RF module to a Ground pin on the Arduino
 + Connect +5V on the RF module to a 5v pin on the Arduino
 + Connect D0 to pin 8 on the Arduino. This RF pin corresponds to the 'D' button on the keyfob.

This code uses pin 8 to listen for a signal from the keyfob, but you can feel free to use any pin you like. 
Just make sure to update line 1 of notify.ino to point to the new pin.

Upload your code to the Arduino. You can use the Arduino IDE's built-in serial monitor to make sure your signals are being sent/received properly.

#### Software ####
##### Install Growl. #####
(I had no problems installing via the App Store.) 

##### Install GNTP module. ######
`sudo pip install gntp`

##### Ensure Serial is Working #####
If the Serial Monitor is receiving data from the Arduino, your Arduino environment is pointing to the correct serial port. 

Use that serial port as the value of the 'dev' variable on line 5 of notify.py. On my machine, this is `/dev/tty.usbmodem1411`. 

##### Run notify.py. #####
I prefer to run this in a screen/tmux session and detach the session. It could also simply be run as a background process:
`python notify.py &`

### Use it! ###
 + Put the keyfob in a visible/accessible place on your cubicle/office door. 
 + Include a quick legend so that your coworkers have some idea what this contraption is and how to use it.
 + Put on headphones and blast some jams.
 + Be content in your knowledge that you've given your colleagues an easy way to get your attention without compromising personal space.

### Known Issues ###
If I put my machine into a sleep state, the Python script needs to be restarted. Hence my usage of screen/tmux above. 
This could potentially be mitigated by the use of something like [SleepWatcher] (http://www.bernhard-baehr.de/) if you really want to go the extra mile.
