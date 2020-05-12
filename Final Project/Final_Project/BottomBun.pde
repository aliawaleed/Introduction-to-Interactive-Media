PImage bottom_bun;

class BottomBun {
  float x, y; //location
  int size;

  void setLocation(float tempX, float tempY) {
    x = tempX;
    y = tempY;
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

  boolean intersect(Ingredient d) { //returns true or false if bottomBun intersects with ingredient
    float distance;
    if (burger.size() > 0) {
      Ingredient top = burger.get(burger.size()-1);
      distance = dist(top.x, top.y, d.x, d.y);
      ;
    } else distance = dist(x, y, d.x, d.y); 

    if (distance < 20) { 
      return true;
    } else {
      return false;
    }
  }

  boolean intersect(TopBun t) { //returns true or false if bottomBun intersects with ingredient
    float distance = dist(x, y, t.x, t.y); 

    if (distance < 20) { 
      return true;
    } else {
      return false;
    }
  }
}
