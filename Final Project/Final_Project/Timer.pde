class Timer {
  int savedTime; // when the timer started
  int totalTime; // how long the timer should last

  Timer(int tempTotalTime) {
    totalTime = tempTotalTime;
  }

  void start() { //starting the timer
    savedTime = millis(); //stores current time in milliseconds when the timer starts
  }

  // The function isFinished() returns true if 5,000 ms have passed. 
  // The work of the timer is farmed out to this method.
  boolean isFinished() { 
    // checks how much time has passed
    int passedTime = millis()- savedTime;
    if (passedTime > totalTime) {
      return true;
    } else {
      return false;
    }
  }
}
