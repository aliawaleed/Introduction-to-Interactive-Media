PImage top_bun;

class TopBun {
  float x, y; //location
  float speed; //speed of ingredient
  float type;

  TopBun() {
    x = random(50, width - 50); //random x coordinate within the screen, ensures the whole ingredient is displayed
    y = -10; //starts from above the window
    speed = random(1, 3); //randomizes speed of ingredient
  }

  void move() { //moving the ingredient downwards
    y += speed; //increments the y coordinate 
  }

  void display() {
    top_bun = loadImage("topBun.png");
    imageMode(CENTER);
    image(top_bun, x, y, top_bun.width/4, top_bun.height/4);
  }

  void caught() { //if the ingredient is caught
    speed = 0; //stop the y-coordinate movement
    x = bottomBun.x; //moves with x coordinate of bottomBun
    y = bottomBun.y - 10*burger.size(); 
  }
}
