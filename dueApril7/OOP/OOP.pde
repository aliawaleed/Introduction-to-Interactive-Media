Net net; // One net object
Timer timer;        // One timer object
Fish[] fishs;       // Creating an array for the fish objects
int totalFishs = 0; // Creating totalFishs variable
int cnt = 0; // initializing count as 0 to later use for the score

void setup() {
  size(480, 270);
  net = new Net(); // Creating net 
  fishs = new Fish[500];    // Create 500 fishs in the array
  timer = new Timer(500);    // Creating a timer that goes off every 500 milliseconds
  timer.start();             // Starts the the timer
}

void draw() {
  background(0,179,179); // for the ocean
  fill(173,211,230);
  rect(0, 0, width, 65); // for the sky
  fill(0, 102, 153);
  textSize(12);
  text("Score:" + cnt, width - 60, 20); //printing score on top right corner of window

  net.setLocation(mouseX -128/2, mouseY); //setting location of net, moving from the handle
  net.display(); //calling display function for net

  if (timer.isFinished()) { //checking the timer
    fishs[totalFishs] = new Fish(); //create or initialize a new fish
    totalFishs ++ ; //increments totalFishs by 1
    if (totalFishs >= fishs.length) { //checks if all fishs are done
      totalFishs = 0; // Start over
      cnt = 0; // change count to 0
    }
    timer.start();
  }

  for (int i = 0; i < totalFishs; i++) { //goes through all the fish in the array
    fishs[i].move(); //calls move function for the fish
    fishs[i].display(); //calls display function for the fish 
    if (net.intersect(fishs[i])) { //checks if net and fish intersect
      fishs[i].caught(); //calls caught() function
      cnt ++; // add 1 to the count, used for the score
    }
  }
}
