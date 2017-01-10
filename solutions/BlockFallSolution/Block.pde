class Block {
  float blockWidth;
  float blockHeight;
  PVector position;
  PVector velocity;
  
  Block(float w, float h, PVector p, PVector v) {
    blockWidth = w;
    blockHeight = h;
    position = p;
    velocity = v;
  }
  
  void update() {
    position.add(velocity);
  }
  
  void render() {
    rectMode(CENTER);
    noStroke();
    fill(velocity.y * 8, 100, 100);
    rect(position.x, position.y, blockWidth, blockHeight);
  }
  
  boolean collidesWithCircle(PVector center, float radius) {
    float closestPointX = clamp(center.x, position.x - blockWidth / 2, position.x + blockWidth / 2);
    float closestPointY = clamp(center.y, position.y - blockHeight / 2, position.y + blockHeight / 2);
    PVector closestPoint = new PVector(closestPointX, closestPointY);
    float distance = PVector.dist(center, closestPoint);
    return distance < radius;
  }
  
  float clamp(float value, float min, float max) {
    if (value < min) return min;
    if (value > max) return max;
    return value;
  }
}