class Timer {
  int savedTime; // start of timer
  int totalTime; // how long the timer lasts

  Timer(int tempTotalTime) {
    totalTime = tempTotalTime;
  }

  void start() { //starts the timer
    savedTime = millis(); //stores current time in ms
  }
  
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
