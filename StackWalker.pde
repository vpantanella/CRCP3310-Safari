class StackWalker extends Walker {
  Stack stack; 

  StackWalker(PVector initialPosition) {
    super(initialPosition);
    stack = new Stack();
    
  }

  void eat(Food f) {
    stack.push(f);
  }

  void draw() {
    ellipse(location.x, location.y, WIDTH, WIDTH);
    stack.display();
  }

}