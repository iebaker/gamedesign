class GridSquare extends PVector { 
  public GridSquare(int x, int y) {
    super(x, y); 
  }
  
  public GridSquare(PVector wrapped) {
    super(wrapped.x, wrapped.y); 
  }
}