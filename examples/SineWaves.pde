import processing.sound.*;

SinOsc sineWaveY;
SinOsc sineWaveX;

void setup() {
  size(600, 600);
  background(255);
  
  sineWaveY = new SinOsc(this);
  sineWaveY.play();
  sineWaveY.amp(0.5f);
  
  sineWaveX = new SinOsc(this);
  sineWaveX.play();
  sineWaveX.amp(0.5f);
}

void draw() {
  float yOffset = map(mouseY, 0, height, 0, 1);
  float frequencyY = pow(1000, yOffset) + 150;
  sineWaveY.freq(frequencyY);
  
  float xOffset = map(mouseX, 0, height, 0, 1);
  float frequencyX = pow(1000, xOffset) + 150;
  sineWaveX.freq(frequencyX);
}