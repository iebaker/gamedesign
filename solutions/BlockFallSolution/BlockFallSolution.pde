ArrayList<Block> blocks;
TimeTrigger timeTrigger;
float playerRadius = 10;
PVector playerPosition;
int score;
int topScore;

void setup() {
  size(600, 800, P2D);
  blocks = new ArrayList<Block>();
  timeTrigger = new TimeTrigger(250);
  score = 0;
  topScore = 0;
  playerPosition = new PVector(mouseX, height - playerRadius);
}

void draw() {
  background(0);
  score++;
  topScore = max(topScore, score);
  
  playerPosition.set(mouseX, height - playerRadius);
  
  timeTrigger.tick();
  if (timeTrigger.fired()) {
    float blockWidth = random(50, 150);
    float blockHeight = 10;
    float blockSpeed = random(2, 10);
    PVector blockPosition = new PVector(random(0, width), -blockHeight);
    PVector blockVelocity = new PVector(0, blockSpeed);
    blocks.add(new Block(blockWidth, blockHeight, blockPosition, blockVelocity));
  }
  
  for (int i = 0; i < blocks.size(); i++) {
    Block current = blocks.get(i);
    current.update();
    current.render();
    if (current.collidesWithCircle(playerPosition, playerRadius)) {
      score = 0; 
    }
  }
  
  fill(0, 0, 200);
  ellipse(playerPosition.x, playerPosition.y, playerRadius * 2, playerRadius * 2);
  
  textSize(32);
  text(score, 25, 50);
  
  fill(0, 200, 0);
  text(topScore, 25, 100);
}