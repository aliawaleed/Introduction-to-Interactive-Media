Net net; // One net object
Timer timer;        // One timer object
Fish[] fishs;       // An array of fish objects
int totalFishs = 0; // totalFishs
int cnt = 0; 

void setup() {
  size(480, 270);
  net = new Net(32); // Create the net with a radius of 32
  fishs = new Fish[1000];    // Create 1000 spots in the array
  timer = new Timer(300);    // Create a timer that goes off every 300 milliseconds
  timer.start();             // Starting the timer
}

void draw() {
  background(173,211,230);
  fill(0, 102, 153);
  textSize(12);
  text("Score:" + cnt, width - 60, 20);

  // Set net location
  net.setLocation(mouseX -128/2, mouseY); 
  // Display the net
  net.display(); 

  // Check the timer
  if (timer.isFinished()) {
    // Deal with fishs
    // Initialize one fish
    fishs[totalFishs] = new Fish();
    // Increment totalFishs
    totalFishs ++ ;
    // If we hit the end of the array
    if (totalFishs >= fishs.length) {
      totalFishs = 0; // Start over
    }
    timer.start();
  }

  // Move and display all fishs
  for (int i = 0; i < totalFishs; i++ ) {
    fishs[i].move();
    fishs[i].display();
    if (net.intersect(fishs[i])) {
      fishs[i].caught();
      cnt += 1;
    }
  }
}
