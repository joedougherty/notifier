import gntp.notifier
import serial

# Device name of Arduino connected via USB
dev = '/dev/tty.usbmodem1411'

growl = gntp.notifier.GrowlNotifier(
    applicationName = "Hey! Listen!",
    notifications = ["New Messages"],
    defaultNotifications = ["New Messages"]
)

growl.register()

ser = serial.Serial(dev, 9600)

while True:
    serialMsg = ser.readline()

    if serialMsg == 'on\r\n':
        growl.notify(
            noteType = "New Messages",
            title = "Pay attention...",
            description = "Someone wishes to speak with you.",
            sticky = False,
            priority = 1,
        )
