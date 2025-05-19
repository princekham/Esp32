### Delay Timer

- I will use Free Rtos
-


## Arduino Program
- delay is 10 sec

```

boolean initialDelayCompleted;


void setup() {
  pinMode(2, OUTPUT);
  
  // One-time 10-second delay at startup
  delay(10000);
  initialDelayCompleted = true;
}

void loop() {
  if (initialDelayCompleted) {
    // Blink LED with 1-second interval
    digitalWrite(2, HIGH);  // Turn LED on
    delay(1000);                  // Wait 1 second
    digitalWrite(2, LOW);   // Turn LED off
    delay(1000);                  // Wait 1 second
  }
}

```
