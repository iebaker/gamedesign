class TimeTrigger {
  long period;
  long timeLastTick;
  long timeAccumulated;
  boolean fired;
  
  TimeTrigger(float seconds) {
    period = (long) seconds * 1000;
    timeLastTick = System.currentTimeMillis();
    timeAccumulated = 0;
    fired = false;
  }
  
  void tick() {
    timeAccumulated += (System.currentTimeMillis() - timeLastTick);
    timeLastTick = System.currentTimeMillis();
    fired = false;
    if (timeAccumulated > period) {
      fired = true;
      timeAccumulated = 0;
    }
  }
  
  boolean fired() {
    return fired;
  }
}