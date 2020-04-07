class Fish { //creating fish class
  float x, y;   // Variables for x and y coordinates of fish
  float speed;  // Speed of fish
  int dir = 1; //left direction

  Fish() {
    x = width;                // Starting x-coordinate at the very right of the window
    y = random(75,height - 15);  // Starting with a random y-coordinate in the sea/ocean area + ensures body of fish is on the screen
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
