#include "pitches.h"
#include <Servo.h>

Servo servo8;
Servo servo9;

int pos = 0;

int melody[] = {
  NOTE_D6, NOTE_E6, NOTE_E6, NOTE_GS6, NOTE_E6, NOTE_DS6, NOTE_DS6, NOTE_D6
};

int noteDurations[] = {
  4, 4, 8, 8, 8, 8, 4, 4
};

void setup() {
  servo8.attach(8);
  servo9.attach(9);
}

void loop() {
  for (int thisNote = 0; thisNote < 8; thisNote++) {
    int noteDuration = 1000 / noteDurations[thisNote];
    tone(13, melody[thisNote], noteDuration);

    int pauseBetweenNotes = noteDuration * 1.10;
    delay(pauseBetweenNotes);
    noTone(13);

    for (pos = 0; pos <= 45; pos += 5) {
      servo8.write(pos);
      servo9.write(pos);
      delay(10);
    }
    for (pos = 45; pos >= 0; pos -= 5) {
      servo8.write(pos);
      servo9.write(pos);
      delay(10);
    }
  }
}
