PImage photo;
int value = 0;

void setup() {
  size(1090, 680); 
  photo = loadImage("photo.png");
}

void draw() {
  image(photo, 0, 0);

  loadPixels();
  photo.loadPixels();
  for (int x = 0; x < width; x++) {
    for (int y = 0; y < height; y++) {
      int index = x + (y * width); 
      float r = red(photo.pixels[index]);
      float g = green(photo.pixels[index]);
      float b = blue(photo.pixels[index]);

      if (mousePressed == true) {
        if (x <= width/2 && y <= height/2) {
          pixels[index] = color(r, g, b*2);
        }
        if (x >= width/2 && y <= height/2) {
          pixels[index] = color(r, g*2, b);
        }
        if (x <= width/2 && y >= height/2) {
          pixels[index] = color(r*2, g, b);
        }
        if (x >= width/2 && y >= height/2) {
          pixels[index] = color(r*2, g*2, b*2);
        }
      }
    }
    updatePixels();
  }
}
