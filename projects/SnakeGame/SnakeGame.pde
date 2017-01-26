Grid grid;
GridSquare snakeSquare;
GridSquare foodSquare;

void setup() {
  size(600, 600);
  grid = new Grid(20, 30, 30);
  snakeSquare = grid.randomSquare();
  foodSquare = grid.square(15, 15);
}

void draw() {
  grid.flood(color(0, 0, 0));
  grid.setColor(foodSquare, color(255, 0, 0));
  grid.setColor(snakeSquare, color(255, 255, 255));
  grid.render();
}

void keyPressed() {
  if (keyCode == UP) {
    snakeSquare = grid.neighbor(snakeSquare, grid.UP);
  } else if (keyCode == DOWN) {
    snakeSquare = grid.neighbor(snakeSquare, grid.DOWN);
  } else if (keyCode == LEFT) {
    snakeSquare = grid.neighbor(snakeSquare, grid.LEFT); 
  } else if (keyCode == RIGHT) {
    snakeSquare = grid.neighbor(snakeSquare, grid.RIGHT);
  }
}