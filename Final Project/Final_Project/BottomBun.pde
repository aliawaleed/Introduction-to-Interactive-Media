PImage bottom_bun;

class BottomBun {
  float x, y; //location
  int size;

  void setLocation(float tempX, float tempY) {
    x = tempX;
    y = tempY;
    //ensures that the bun stays within the screen (horizontally)
    if (mouseX - 50 < 0) { 
      bottomBun.x = 48;
    }
    if (mouseX + 50 > width) { 
      bottomBun.x = width - 46;
    }
  }

  void display() {
    bottom_bun = loadImage("bottomBun.png");
    imageMode(CENTER);
    image(bottom_bun, x, y, bottom_bun.width/4, bottom_bun.height/4);
  }

  boolean intersect(Ingredient d) { //returns true or false if ingredients intersect
    float distance;
    if (burger.size() > 0) { //if burger has components
      Ingredient top = burger.get(burger.size()-1);
      distance = dist(top.x, top.y, d.x, d.y); //check the distance from the uppermost component of the burger
    } else {
      distance = dist(x, y, d.x, d.y); //ingredient intersecting with the bottom bun
    }

    if (distance < 16) { 
      return true;
    } else {
      return false;
    }
  }

  //boolean intersect(TopBun t) { //returns true or false if bottomBun intersects with ingredient
  //  float distance = dist(x, y, t.x, t.y); 
  //  if (distance < 20) { 
  //    return true;
  //  } else {
  //    return false;
  //  }
  //}
}
