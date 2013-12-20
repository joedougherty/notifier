const int buttonPin = 8;
const int ledPin = 13;

int buttonState = 0;
int lastButtonState = 0;

void setup() {
  pinMode(buttonPin, INPUT);
  Serial.begin(9600); 
}

void loop() {
  buttonState = digitalRead(buttonPin);
  
  if (buttonState != lastButtonState) {
    if (buttonState == HIGH) {      
      Serial.println("on");
    } else {
      Serial.println("off");
    }
  }
  
  lastButtonState = buttonState;
}
