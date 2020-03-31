void setup() 
{ 
  size(676, 676); //setting size as the exact same size as the screenshot 
  background(255); //white background
  for (int x = 0; x < width; x = x+7) { // x starts at 0 and adds 7 to the x coordinate before drawing the next line, until the width (full screen) is full
    line(x, 0, x, height); // x coordinate of all lines stays the same from start to end, y coorinate starts at 0 and ends with height of the screen
    translate(2,0); // there are more lines translated to the right 
    line(x, 0, x, height - 30); // does the same process but ending y coordinate of the line does not end with the height of the screen, it ends earlier
  }
  frameRate(20); // decreases number of frames per second, for better accuracy when drawing the horizontal lines
} 

void draw() {
  stroke(0); //sets color to black
  if (mousePressed == true) { //checks if mouse is pressed, and if it is --> 
    horizontal_lines();  // the horizontal_lines function keeps getting called
  }
}

void horizontal_lines(){ //function for drawing a set of horizontal lines
    for (int y = mouseY; y < mouseY + 100; y = y+10) { // starts the first line at the y coordinate of the mouse and adds 10 to the y coordinate before starting the next line until we reach the y coordinate of the mouse + 100 --> draws 10 lines at the same time 
      line(0, y, mouseX, y); // y coordinate is constant for each line as it is horizontal, end of line is determined by current mouse position
    }
  }
