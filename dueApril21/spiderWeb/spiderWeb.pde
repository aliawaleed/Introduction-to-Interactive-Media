Rotator[] rotators;
PImage img;

void setup() {
  size (890, 500);
  rotators = new Rotator[1000]; //creates an array of 1000 lines
  for (int i=0; i<1000; i++) {
    float x = random(-100, width); //can start from outside the window on the left
    float y = random(-100, height); //can start from outside the window on top
    rotators[i] = new Rotator(x, y, i); //goes through each line in the array sets location of the line
  }
}

void draw() {
  background(0);
  for (Rotator r : rotators) {
    r.rotateLine();
    r.checkMouse();
    r.drawLine(rotators);
  }
  displaySpider();
}

void displaySpider() { //function to display the spider
  img = loadImage("spider.png"); //importing spider image
  image(img, mouseX -100/2, mouseY - 100/2, 100, 100); //places (the middle) of the image at x and y cooridnates of the mouse with size 100x100
}

class Rotator {
  float x, y, centerX, centerY, angle, acceleration, velocity, radius, direction; //initializes variables
  int index; //self rotator

  Rotator(float _centerX, float _centerY, int _index) { //make a constructor for the rotator
    centerX = _centerX;
    centerY = _centerY;
    index = _index;
    angle = acceleration = velocity = 0;
    radius = random(20, 50);
    x = y = 0;

    float coinFlip = random(1); 
    if (coinFlip> 0.5) {
      direction = 1; //moves rotators clockwise
    } else {
      direction = -1; //to move rotators in the opposite direction
    }
  }

  void rotateLine() { //function to rotate the lines
    velocity += acceleration;
    velocity *= direction; //multiply angle to go to opposite direction
    angle += velocity;
    acceleration = 0;
    velocity *= 0.98;
  }

  void drawLine(Rotator[] rotators) { //array with all rotators
    x = cos(angle)* radius + centerX; //translates (0,0) to specific x and y
    y = sin(angle)* radius + centerY;

    for (Rotator r : rotators) { //loops through all rotators
      if (index != r.index) { //if not self
        if (dist(x, y, r.x, r.y) < radius) { //checks distance between self and all ellipses
          if (dist(mouseX, mouseY, r.x, r.y) < 60) { // lines around the mouse would be colored pink
            pushStyle();
            stroke(178,34,34);
            line(r.x, r.y, x, y);
            popStyle();
          } 
          if (dist(mouseX, mouseY, r.x, r.y) < 20) { //closest lines to the mouse are colored in red
            pushStyle();
            stroke(255, 0, 0);
            line(r.x, r.y, x, y);
            popStyle();
          } else { //creates and colors all the lines white
            pushStyle();
            stroke(255);
            line(r.x, r.y, x, y);
            popStyle();
          }
        }
      }
    }
  }

  void checkMouse() {
    if (dist(mouseX, mouseY, centerX, centerY) < radius // if mouse position is within the radius of the line
      && mouseX != pmouseX && mouseY != pmouseY) { 
      acceleration += 0.008 * direction; //adding this force to the acceleration
    }
  }
}
