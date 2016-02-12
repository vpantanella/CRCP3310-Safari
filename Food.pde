class Food{
  PVector location; 
  static final int DIAMETER = 20;
  color c;
  

  
  Food(PVector location, color c){
    this.location = location;
    this.c = c;
  }
  
  void draw() {
    fill(c);
    ellipse(location.x, location.y, DIAMETER, DIAMETER);
  }
  
  void draw(int x, int y, int w, int h){
    fill(c);
    location.x = x;
    location.y = y; 
    ellipse(location.x, location.y, w, h); 
  }
 
  
  
}