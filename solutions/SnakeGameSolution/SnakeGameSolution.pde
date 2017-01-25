final float squareSize = 20;
final int updatePeriod = 5;
final PVector RIGHT_DIR = new PVector(1, 0);
final PVector LEFT_DIR = new PVector(-1, 0);
final PVector DOWN_DIR = new PVector(0, 1);
final PVector UP_DIR = new PVector(0, -1);

ArrayList<PVector> snake;
PVector foodLocation;
PVector currentDirection;

void setup() {
  size(600, 600);
  snake = new ArrayList<PVector>();
  snake.add(new PVector(5, 5));
  currentDirection = DOWN_DIR;
  foodLocation = new PVector(10, 10);
}

void draw() {
  if (frameCount % updatePeriod == 0) {
    if (foodAhead()) {
      growSnake();
      moveSnake();
      moveFood();
    } else {
      moveSnake(); 
    }
  }
  
  background(0, 0, 0);
  drawSnake();
  drawFood();
}

void keyPressed() {
  if (keyCode == RIGHT) {
    currentDirection = RIGHT_DIR;
  } else if (keyCode == LEFT) {
    currentDirection = LEFT_DIR;
  } else if (keyCode == DOWN) {
    currentDirection = DOWN_DIR; 
  } else if (keyCode == UP) {
    currentDirection = UP_DIR; 
  }
}

boolean foodAhead() {
  return PVector.add(snake.get(0), currentDirection).equals(foodLocation);
}

void moveSnake() {
  PVector newHead = PVector.add(snake.get(0), currentDirection);
  snake.add(0, newHead);
  snake.remove(snake.size() - 1);
}

void growSnake() {
  PVector newHead = PVector.add(snake.get(0), currentDirection);
  snake.add(newHead);
}

void moveFood() {
  int maxFoodLocation = 600 / (int) squareSize;
  foodLocation = new PVector((int) random(maxFoodLocation), (int) random(maxFoodLocation));
  println(foodLocation);
}

void drawSnake() {
  for (PVector piece : snake) {
    rect(piece.x * squareSize, piece.y * squareSize, squareSize, squareSize); 
  }
}

void drawFood() {
  rect(foodLocation.x * squareSize, foodLocation.y * squareSize, squareSize, squareSize);
}