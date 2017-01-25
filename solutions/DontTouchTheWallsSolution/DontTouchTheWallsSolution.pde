GameState gameState;
color pathColor;
color backgroundColor;
color goalColor;
color startColor;
color winScreenColor;
color lostScreenColor;
float brushRadius;

void setup() {
  size(600, 600);
  
  gameState = GameState.START;
  pathColor = color(255);
  backgroundColor = color(0);
  goalColor = color(0, 255, 0);
  startColor = color(0, 0, 255);
  winScreenColor = color(0, 255, 0);
  lostScreenColor = color(255, 0, 0);
  brushRadius = 20;
  
  background(backgroundColor);
  noStroke();
}

void draw() {
  color colorUnderMouse;
  if (gameState == GameState.DRAWING_PATH) {
    fill(pathColor);
    ellipse(mouseX, mouseY, brushRadius * 2, brushRadius * 2);
  } else if (gameState == GameState.PLAYING) {
    colorUnderMouse = get(mouseX, mouseY);
    if (colorUnderMouse == backgroundColor) {
      gameState = GameState.LOST;
    } else if (colorUnderMouse == goalColor) {
      gameState = GameState.WON; 
    }
  } else if (gameState == GameState.WON) {
    background(winScreenColor);
  } else if (gameState == GameState.LOST) {
    background(lostScreenColor); 
  }
}

void mousePressed() {
  if (gameState == GameState.START) {
    gameState = GameState.DRAWING_PATH; 
  }
}

void mouseReleased() {
  if (gameState == GameState.DRAWING_PATH) {
    gameState = GameState.SETTING_GOAL;
  } else if (gameState == GameState.SETTING_GOAL) {
    fill(goalColor);
    ellipse(mouseX, mouseY, brushRadius * 2, brushRadius * 2);
    gameState = GameState.SETTING_START; 
  } else if (gameState == GameState.SETTING_START) {
    fill(startColor);
    ellipse(mouseX, mouseY, brushRadius * 2, brushRadius * 2);
    gameState = GameState.PLAYING; 
  }
}

void keyReleased() {
 if (gameState == GameState.WON || gameState == GameState.LOST) {
   background(backgroundColor);
   gameState = GameState.START; 
 }
}