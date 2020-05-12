class Ingredient {
  float x, y; //location
  float speed; //speed of ingredient
  float type;
  PImage img;
  boolean inBurger;

  Ingredient() {
    inBurger = false;
    type = random(4);
    img= ings [int(type)];
    x = random(50, width - 50); //random x coordinate within the screen, ensures the whole ingredient is displayed
    y = random(-1000,-10); //starts from above the window
    speed = random(5, 8); //randomizes speed of ingredient
  }

  void move() { //moving the ingredient downwards
    if(inBurger) x = bottomBun.x;
    else y += speed; //increments the y coordinate 
  }

  void display() {
    imageMode(CENTER); //uses the x and y below as the center of the image
    image(img, x, y, img.width/4, img.height/4); //gives the image x and y coordinates and makes the size smaller
  }

  void caught() { //if the ingredient is caught
    speed = 0; //stop the y-coordinate movement
    x = bottomBun.x; //moves with x coordinate of bottomBun
    y = bottomBun.y - 10*burger.size(); //gets placed above the bottomBun
    inBurger = true;
    cnt ++;
    //println("----------ing caught-----------");
  }
}
