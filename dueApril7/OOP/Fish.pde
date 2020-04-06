class Fish {
  float x, y;   // Variables for location of fish
  float speed;  // Speed of fish
  float r;      // Radius of fish
  int dir = 1; //left direction

  Fish() {
    r = 8;                   // All fishs are the same size
    x = 480;                // Start a little to the left of the window
    y = random(40,height);       // Start with a random y location
    speed = random(1, 5);    // Pick a random speed
  }

  // Move the fish down
  void move() {
    // Increment by speed
    x -= speed;
  }

  // Display the fish
  void display() {
    // Display the fish
    fill(179,0,179);
    noStroke();
    triangle (x+5*dir, y, x+15*dir, y-8, x+15*dir, y+8);
    ellipse (x, y, 20, 15);
  }

  // If the drop is caught
  void caught() {
    // Stop it from moving by setting speed equal to zero
    speed = 0; 
    // Set the location to somewhere way off-screen
    y = -1000;
  }
}
