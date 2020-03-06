/* https://www.instructables.com/id/Arduino-Reaction-Time-Tester/ used for reference */

#include <LiquidCrystal.h>

const int rs = 9, en = 8, d4 = 5, d5 = 4, d6 = 3, d7 = 2; /* giving LCD pins constant variable names*/
LiquidCrystal lcd(rs, en, d4, d5, d6, d7);

const int yellow = 10;
const int red = 11;
const int green = 12;
const int blue = 13;
const int yellowPushButton = A0;
const int redPushButton = A1;
const int greenPushButton = A2;
const int bluePushButton = A3;
boolean lastButton = LOW;
boolean currentButton = LOW;
boolean Started = false; /* initializes the start of the game as false */
boolean timer = false; /* initializes the timer as false */
long startTime;
long endTime;
long randomTime;
float elapsedTime;

void setup()
{
  pinMode(yellowPushButton, INPUT);
  pinMode(redPushButton, INPUT);
  pinMode(greenPushButton, INPUT);
  pinMode(bluePushButton, INPUT);
  pinMode(yellow, OUTPUT);
  pinMode(red, OUTPUT);
  pinMode(green, OUTPUT);
  pinMode(blue, OUTPUT);
  Serial.begin(9600);
  lcd.begin(16, 2); /*specifies size of LCD*/
  lcd.print("Press any button");
  lcd.setCursor(0, 2);
  lcd.print("    to start!");
}

// Debounce function double checks that the pushbuttons are actually pressed
boolean yellowDebounce(boolean last)
{
  boolean yellowCurrent = digitalRead(yellowPushButton); // checks whether the value of the switch is high or low
  if (last != yellowCurrent) //compares it to the stored value
  {
    delay(5); //waits for switch to settle
    yellowCurrent = digitalRead(yellowPushButton); //saves the new value
  }
  return yellowCurrent; //returns to main loop
}

boolean redDebounce(boolean last)
{
  boolean redCurrent = digitalRead(redPushButton);
  if (last != redCurrent)
  {
    delay(5);
    redCurrent = digitalRead(redPushButton);
  }
  return redCurrent;
}

boolean greenDebounce(boolean last)
{
  boolean greenCurrent = digitalRead(greenPushButton);
  if (last != greenCurrent)
  {
    delay(5);
    greenCurrent = digitalRead(greenPushButton);
  }
  return greenCurrent;
}

boolean blueDebounce(boolean last)
{
  boolean blueCurrent = digitalRead(bluePushButton);
  if (last != blueCurrent)
  {
    delay(5);
    blueCurrent = digitalRead(bluePushButton);
  }
  return blueCurrent;
}

void loop()
{
  lcd.setCursor(0, 1);
  currentButton = yellowDebounce(lastButton);
  if (lastButton == LOW && currentButton == HIGH) /* checks if yellowPushButton is pressed */
  {
    Started = !Started; /* changes start of game to true */
    lastButton = HIGH;
  }
  lastButton = currentButton;
  if (Started == true && timer == false) /* checks to see if game started but timer has not started*/
  {
    boolean hold = true;
    while (yellowDebounce(lastButton))
    {
      if (hold) { /* checks if the player has their hand on the button before game starts */
        lcd.clear();
        lcd.print("  Remove hand");
        hold = false;
      }
    }
    lcd.clear();
    lcd.print("   Get Ready!"); /* prints get ready on the screen and keeps it there */
    Random(); /* calls random function */
    timer = true; /* starts the timer */
  }
  if (Started == false && timer == true) /* checks if game has stopped and timer was on */
  {
    yellowStop(); /* calls stop function to stop the game */
    timer = false;
    delay(2000); /* pauses for 2 seconds when time is printed */
    setup(); /* calls the start of a new game */
  }

  currentButton = redDebounce(lastButton);
  if (lastButton == LOW && currentButton == HIGH)
  {
    Started = !Started;
    lastButton = HIGH;
  }
  lastButton = currentButton;
  if (Started == true && timer == false)
  {
    boolean hold = true;
    while (redDebounce(lastButton))
    {
      if (hold) {
        lcd.clear();
        lcd.print("  Remove hand");
        hold = false;
      }
    }
    lcd.clear();
    lcd.print("   Get Ready!");
    Random();
    timer = true;
  }
  if (Started == false && timer == true)
  {
    redStop();
    timer = false;
    delay(2000);
    setup();
  }

  currentButton = greenDebounce(lastButton);
  if (lastButton == LOW && currentButton == HIGH)
  {
    Started = !Started;
    lastButton = HIGH;
  }
  lastButton = currentButton;
  if (Started == true && timer == false)
  {
    boolean hold = true;
    while (greenDebounce(lastButton))
    {
      if (hold) {
        lcd.clear();
        lcd.print("  Remove hand");
        hold = false;
      }
    }
    lcd.clear();
    lcd.print("   Get Ready!");
    Random();
    timer = true;
  }
  if (Started == false && timer == true)
  {
    greenStop();
    timer = false;
    delay(2000);
    setup();
  }

  currentButton = blueDebounce(lastButton);
  if (lastButton == LOW && currentButton == HIGH)
  {
    Started = !Started;
    lastButton = HIGH;
  }
  lastButton = currentButton;
  if (Started == true && timer == false)
  {
    boolean hold = true;
    while (blueDebounce(lastButton))
    {
      if (hold) {
        lcd.clear();
        lcd.print("  Remove hand");
        hold = false;
      }
    }
    lcd.clear();
    lcd.print("   Get Ready!");
    Random();
    timer = true;
  }
  if (Started == false && timer == true)
  {
    blueStop();
    timer = false;
    delay(2000);
    setup();
  }

}
void Random()
{
  randomTime = random(2, 5); /* creating a variable with a random number of seconds from 2-5 */
  randomTime = randomTime * 1000;
  /* lights remain off until the randomTime passes */
  digitalWrite(yellow, LOW);
  digitalWrite(red, LOW);
  digitalWrite(green, LOW);
  digitalWrite(blue, LOW);
  delay(randomTime); /* gets random number of seconds from 2-5 before the LEDs light up */
  Start();
}

void Start() { /* function to start the game */
  lcd.clear();
  lcd.print("      Go!"); /* prints go when the LEDs light up*/
  startTime = millis();
  /* turns on all LEDs */
  digitalWrite(yellow, HIGH);
  digitalWrite(red, HIGH);
  digitalWrite(green, HIGH);
  digitalWrite(blue, HIGH);
}

void yellowStop() {
  endTime = millis();
  elapsedTime = (endTime - startTime) + 5; /* equation used to measure the time taken from the moment bulbs light up to the moment the button is pressed*/
  elapsedTime = elapsedTime / 1000;
  Serial.print("Time Seconds: "); /* making sure that the timer is correct */
  Serial.println(elapsedTime);
  lcd.clear();
  lcd.print(String("   ") + String("Time: ") + String(elapsedTime)); /* printing the time taken on the screen */
  lcd.setCursor(0, 2); /* goes to second line of LCD */
  lcd.print(String("   Yellow " ) + String("Won!"));
  /* turning off the light of the LEDs when button is pressed*/
  digitalWrite(yellow, LOW);
  digitalWrite(red, LOW);
  digitalWrite(green, LOW);
  digitalWrite(blue, LOW);

}

void redStop() {
  endTime = millis();
  elapsedTime = (endTime - startTime) + 5;
  elapsedTime = elapsedTime / 1000;
  Serial.print("Time Seconds: ");
  Serial.println(elapsedTime);
  lcd.clear();
  lcd.print(String("   ") + String("Time: ") + String(elapsedTime));
  lcd.setCursor(0, 2);
  lcd.print(String("    Red " ) + String("Won!"));
  digitalWrite(yellow, LOW);
  digitalWrite(red, LOW);
  digitalWrite(green, LOW);
  digitalWrite(blue, LOW);

}

void greenStop() {
  endTime = millis();
  elapsedTime = (endTime - startTime) + 5;
  elapsedTime = elapsedTime / 1000;
  Serial.print("Time Seconds: ");
  Serial.println(elapsedTime);
  lcd.clear();
  lcd.print(String("   ") + String("Time: ") + String(elapsedTime));
  lcd.setCursor(0, 2);
  lcd.print(String("   Green " ) + String("Won!"));
  digitalWrite(yellow, LOW);
  digitalWrite(red, LOW);
  digitalWrite(green, LOW);
  digitalWrite(blue, LOW);

}

void blueStop() {
  endTime = millis();
  elapsedTime = (endTime - startTime) + 5;
  elapsedTime = elapsedTime / 1000;
  Serial.print("Time Seconds: ");
  Serial.println(elapsedTime);
  lcd.clear();
  lcd.print(String("   ") + String("Time: ") + String(elapsedTime));
  lcd.setCursor(0, 2);
  lcd.print(String("    Blue " ) + String("Won!"));
  digitalWrite(yellow, LOW);
  digitalWrite(red, LOW);
  digitalWrite(green, LOW);
  digitalWrite(blue, LOW);

}
