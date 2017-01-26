class Grid {
  color[][] squares;
  int dimX;
  int dimY;
  float squareSize;
  
  public Direction RIGHT = new Direction(1, 0);
  public Direction LEFT = new Direction(-1, 0);
  public Direction DOWN = new Direction(0, 1);
  public Direction UP = new Direction(0, -1);
  
  public Grid(float squareSize, int dimX, int dimY) {
    this.squares = new color[dimX][dimY];
    this.dimX = dimX;
    this.dimY = dimY;
    this.squareSize = squareSize;
  }
  
  void flood(color c) {
    for (int x = 0; x < dimX; x++) {
      for (int y = 0; y < dimY; y++) {
        squares[x][y] = c;
      }
    }
  }
  
  void setColor(GridSquare location, color c) {
    squares[(int)location.x][(int)location.y] = c; 
  }
  
  color getColor(GridSquare location) {
    return squares[(int)location.x][(int)location.y]; 
  }
  
  color getNeighborColor(GridSquare location, Direction direction) {
    return getColor(new GridSquare(PVector.add(location, direction))); 
  }
  
  public void render() {
    for (int x = 0; x < dimX; x++) {
      for (int y = 0; y < dimY; y++) {
        fill(squares[x][y]);
        rect(x * squareSize, y * squareSize, squareSize, squareSize);
      }
    }
  }
  
  GridSquare square(int x, int y) {
    return new GridSquare(x, y); 
  }
  
  GridSquare randomSquare() {
    return new GridSquare((int) random(dimX), (int) random(dimY)); 
  }
  
  GridSquare neighbor(GridSquare square, PVector direction) {
    return new GridSquare(PVector.add(square, direction)); 
  }
  
  int width() {
    return dimX; 
  }
  
  int height() {
    return dimY; 
  }
}