Grid grid;
GridSquare snakeSquare;

void setup() {
  size(600, 600);
  grid = new Grid(20, 30, 30);
  snakeSquare = grid.randomSquare();
  grid.setColor(snakeSquare, color(255, 255, 255));
}

void draw() {
  grid.render();
}

void keyPressed() {
  grid.setColor(snakeSquare, color(0, 0, 0));
  if (keyCode == UP) {
    snakeSquare = grid.neighbor(snakeSquare, grid.UP);
  } else if (keyCode == DOWN) {
    snakeSquare = grid.neighbor(snakeSquare, grid.DOWN);
  } else if (keyCode == LEFT) {
    snakeSquare = grid.neighbor(snakeSquare, grid.LEFT); 
  } else if (keyCode == RIGHT) {
    snakeSquare = grid.neighbor(snakeSquare, grid.RIGHT);
  }
  grid.setColor(snakeSquare, color(255, 255, 255));
}