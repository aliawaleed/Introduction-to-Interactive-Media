PImage img;

class Net {
  float r;    // radius
  color col;  // color
  float x, y; // location

  Net(float tempR) {
    r = tempR;
    col = color(50, 10, 10, 150);
    x = 0;
    y = 0;
  }

  void setLocation(float tempX, float tempY) {
    x = tempX;
    y = tempY;
  }

  void display() {
    //stroke(0);
    //fill(col);
    //ellipse(x, y, r*2, r*2);
    img = loadImage("fishnet.png");
    image(img,x,y,128,128);
  }

  // A function that returns true or false based on
  // if the net intersects a fish
  boolean intersect(Fish f) {
    // Calculate distance
    float distance = dist(x + 30, y+100, f.x, f.y); 

    // Compare distance to sum of radii
    if (distance < r + f.r) { 
      return true;
    } else {
      return false;
    }
  }
}
