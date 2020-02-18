int pushButton = 7;

void setup() {
  pinMode(pushButton, INPUT);
  pinMode(13, OUTPUT);
  pinMode(12, OUTPUT);
  pinMode(11, OUTPUT);
  Serial.begin(9600);
}

void loop() {
  float ValueRead = analogRead(A0) * 0.004882813;
  float temperature = (ValueRead - 0.5) * 100.0;

  Serial.print("The temperature is = ");
  Serial.print(temperature);
  delay(2000);

  int buttonState = digitalRead(pushButton);
  if (buttonState == 1) {
    analogWrite(13, 150);
    analogWrite(12, 150);
    analogWrite(11, 150);
  }

  else if (buttonState == 0) {
    if (temperature < 23) {
      digitalWrite(13, LOW);
      digitalWrite(12, LOW);
      digitalWrite(11, LOW);
    }

    if (temperature >= 23 && temperature <= 23.25) {
      digitalWrite(13, LOW);
      digitalWrite(12, LOW);
      digitalWrite(11, HIGH);
    }

    else if (temperature > 23.25 && temperature <= 24.0) {
      digitalWrite(13, LOW);
      digitalWrite(12, HIGH);
      digitalWrite(11, LOW);
    }

    else if (temperature > 24.0 && temperature <= 24.25) {
      digitalWrite(13, HIGH);
      digitalWrite(12, LOW);
      digitalWrite(11, LOW);
    }

    else if (temperature > 24.25) {
      digitalWrite(13, HIGH);
      delay(100);
      digitalWrite(13, LOW);
    }
  }
}
