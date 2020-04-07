Net net; // One net object
Timer timer;        // One timer object
Fish[] fishs;       // Creating an array for the fish objects
int totalFishs = 0; // Creating totalFishs variable
int cnt = 0; // initializing count as 0 to later use for the score

void setup() {
  size(480, 270);
  net = new Net(); // Creating net 
  fishs = new Fish[500];    // Create 500 fishs in the array
  timer = new Timer(500);    // Creating a timer that goes off every 500 milliseconds
  timer.start();             // Starts the the timer
}

void draw() {
  background(0,179,179); // for the ocean
  fill(173,211,230);
  rect(0, 0, width, 65); // for the sky
  fill(0, 102, 153);
  textSize(12);
  text("Score:" + cnt, width - 60, 20); //printing score on top right corner of window

  net.setLocation(mouseX -128/2, mouseY); //setting location of net, moving from the handle
  net.display(); //calling display function for net

  if (timer.isFinished()) { //checking the timer
    fishs[totalFishs] = new Fish(); //create or initialize a new fish
    totalFishs ++ ; //increments totalFishs by 1
    if (totalFishs >= fishs.length) { //checks if all fishs are done
      totalFishs = 0; // Start over
      cnt = 0; // change count to 0
    }
    timer.start();
  }

  for (int i = 0; i < totalFishs; i++) { //goes through all the fish in the array
    fishs[i].move(); //calls move function for the fish
    fishs[i].display(); //calls display function for the fish 
    if (net.intersect(fishs[i])) { //checks if net and fish intersect
      fishs[i].caught(); //calls caught() function
      cnt ++; // add 1 to the count, used for the score
    }
  }
}

class Fish { //creating fish class
  float x, y;   // Variables for x and y coordinates of fish
  float speed;  // Speed of fish
  int dir = 1; //left direction

  Fish() {
    x = width;                // Starting x-coordinate at the very right of the window
    y = random(75,height);       // Starting with a random y-coordinate in the sea/ocean area
    speed = random(2, 5);    // randomizing the speed of the fish
  }

  void move() { //moves fish to the left
    x -= speed; 
  }

  void display() { //function to display the fish
    fill(179,0,179);
    noStroke();
    triangle (x + 5 * dir, y, x + 15 * dir, y - 8, x + 15 * dir, y + 8); //tail
    ellipse (x, y, 20, 15); //body
  }

  void caught() { //function to catch the fish 
    speed = 0; //stops its movement
    y = -100; //sets location of fish outside the screen 
  }
}

PImage img;

class Net {
  float x, y; // x and y coordinates of the net

  void setLocation(float tempX, float tempY) { //sets location of the net
    x = tempX;
    y = tempY;
    if (net.y + 128 > height) { //prevents net from leaving the screen at the bottom
    net.y = height - 128;
    }
    if (mouseX - 128/2 < -20) { //prevents net from leaving the screen at the left
    net.x = -22;
    }
  }

  void display() { //function to display the net
    img = loadImage("fishnet.png"); //importing net image
    image(img,x,y,128,128); //places image x and y cooridnates of the mouse with size 128x128
  }

  boolean intersect(Fish f) { //checks if net intersects with fish
    float distance = dist(x + 50, y+120, f.x, f.y); //calculating distance from the net itself to the coordinates of the fish
    if (distance < 25) { //checks if distance is less than the width of the fish
      return true;
    } else {
      return false;
    }
  }
}

class Timer {
  int savedTime; // start of timer
  int totalTime; // how long the timer lasts

  Timer(int tempTotalTime) {
    totalTime = tempTotalTime;
  }

  void start() { //starts the timer
    savedTime = millis(); //stores current time in ms
  }
  
  boolean isFinished() { 
    // checks how much time has passed
    int passedTime = millis()- savedTime;
    if (passedTime > totalTime) {
      return true;
    } else {
      return false;
    }
  }
}
