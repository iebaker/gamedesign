class TimeTrigger {
  long period;
  long timeLastTick;
  long timeAccumulated;
  boolean fired;
  
  TimeTrigger(long period) {
    this.period = period;
    this.timeLastTick = System.currentTimeMillis();
    this.timeAccumulated = 0;
    this.fired = false;
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