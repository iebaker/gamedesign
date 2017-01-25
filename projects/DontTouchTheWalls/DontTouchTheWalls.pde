GameState gameState;
color backgroundColor;
color winScreenColor;

void setup() {
  size(600, 600);
  textAlign(CENTER, CENTER);
  gameState = GameState.START;
  backgroundColor = color(0);
  winScreenColor = color(0, 255, 0);
}

void draw() {
 if (gameState == GameState.START) {
   background(0); 
 } else if (gameState == GameState.WON) {
   background(winScreenColor); 
   fill(0);
   text("You Win!", width / 2, height / 2);
 }
}

void mousePressed() {
 if (gameState == GameState.START) {
   gameState = GameState.WON; 
 }
}