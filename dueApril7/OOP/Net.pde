PImage img;

class Net {
  float x, y; // x and y coordinates of the net

  void setLocation(float tempX, float tempY) { //sets location of the net
    x = tempX;
    y = tempY;
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
