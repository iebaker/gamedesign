float redBlockPositionX;
float redBlockPositionY;
float redBlockWidth;
float redBlockHeight;
color redBlockColor;

float blueBlockPositionX;
float blueBlockPositionY;
float blueBlockWidth;
float blueBlockHeight;
color blueBlockColor;

void setup() {
  size(600, 800, P2D);
  redBlockPositionX = 260;
  redBlockPositionY = 370;
  redBlockWidth = 80;
  redBlockHeight = 60;
  redBlockColor = color(255, 0, 0);
  
  blueBlockPositionX = 260;
  blueBlockPositionY = 450;
  blueBlockWidth = 80;
  blueBlockHeight = 100;
  blueBlockColor = color(0, 0, 255);
}
 
void draw() {
  background(255);
  
  fill(redBlockColor);
  rect(redBlockPositionX, redBlockPositionY, redBlockWidth, redBlockHeight);
  
  fill(blueBlockColor);
  rect(blueBlockPositionX, blueBlockPositionY, blueBlockWidth, blueBlockHeight);
}