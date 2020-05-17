class Ingredient {
  float x, y; //location
  float speed; //speed of ingredient
  float type;
  PImage img;
  boolean inBurger;

  Ingredient() {
    inBurger = false;
    type = random(5);
    img= ings [int(type)];
    x = random(50, width - 50); //random x coordinate within the screen, ensures the whole ingredient is displayed
    y = random(-1000, -10); //starts from above the window
    speed = random(3, 6); //randomizes speed of ingredient
  }

  void move() { //moving the ingredient downwards
    if (inBurger) x = bottomBun.x;
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
    //println("----------ing caught-----------");
    count = 0;
    for (OrderIngredient ing : order.order) {
      if ( int(ing.type) == int(type) && ing.number > 0) { //checks if the ingredient caught is the same as the one in the order
        ing.number --; //decrease the number
        tip+= ing.value; //add value to the price and tip
        if ( int(ing.type) == 4) { // if it's the top bun
          order.complete = true;
        }
        break;
      } else {
        count += 1;
      }
    }
    println(count);
    if (count == 4) {
      tip -= 0.1;
    }
  }
}

class OrderIngredient extends Ingredient { //inherits from ingredient class
  int number, originalNumber;
  float value;
  OrderIngredient(int _type) {
    super();
    number = int(random(0, 4));
    value = .25*int(random(10));
    type = _type;
    img = ings[int(type)];
    if (type == 4) number = 1;
    originalNumber = number;
  }
  void display() {
    imageMode(CENTER); //uses the x and y below as the center of the image
    image(img, x, y, img.width/5, img.height/5); //gives the image x and y coordinates and makes the size smaller
    text(number, x, y + 25); //displays number of ingreduents required below image
  }
}
