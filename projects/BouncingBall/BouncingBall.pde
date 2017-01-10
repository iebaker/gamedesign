float ballPositionX = 400;
float ballPositionY = 300;
float ballRadius = 20;

void setup() {
  size(800, 600); 
}

void draw() {
  background(255);
  ellipse(ballPositionX, ballPositionY, ballRadius * 2, ballRadius * 2);
}