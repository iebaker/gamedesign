float ballPositionX;
float ballPositionY;
float ballRadius;

float ballVelocityX;
float ballVelocityY;

float gravity;
float elasticity;

void setup() {
  size(800, 600, P2D); 
  ballPositionX = 400;
  ballPositionY = 300;
  ballRadius = 20;
  
  ballVelocityX = 5;
  ballVelocityY = -2;
  gravity = 0.5;
  elasticity = 0.9;
}

void draw() {
  ballVelocityY = ballVelocityY + gravity;
  ballPositionX = ballPositionX + ballVelocityX;
  ballPositionY = ballPositionY + ballVelocityY;
  
  if (ballPositionX + ballRadius > width) {
    ballPositionX = ballPositionX - (ballPositionX + ballRadius - width);
    ballVelocityX = -ballVelocityX * elasticity;
  }
  
  if (ballPositionX - ballRadius < 0) {
    ballPositionX = ballPositionX + (ballRadius - ballPositionX);
    ballVelocityX = -ballVelocityX * elasticity; 
  }
  
  if (ballPositionY + ballRadius > height) {
    ballPositionY = ballPositionY - (ballPositionY + ballRadius - height);
    ballVelocityY = -ballVelocityY * elasticity;
  }
  
  if (ballPositionY - ballRadius < 0) {
    ballPositionY = ballPositionY + (ballRadius - ballPositionY);
    ballVelocityY = -ballVelocityY * elasticity; 
  }
  
  fill(255, 70);
  noStroke();
  rect(0, 0, width, height);
  fill(255);
  stroke(0);
  ellipse(ballPositionX, ballPositionY, ballRadius * 2, ballRadius * 2);
}