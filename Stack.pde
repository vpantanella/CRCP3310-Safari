class Stack {
  ArrayList<Food> stack;
  int counter;
  int positionX;
  int positionY;


  Stack() {
    positionX = 300;
    positionY = height-200;
    stack = new ArrayList<Food>();
    counter = 0;
  }

  void push(Food food) {
    stack.add(food);
    counter++;
  }

  Food pop() {
    counter--;
    return stack.remove(counter);
  }

  void display() {
    for (int i = 0; i < counter; i++) {
      Food f = stack.get(i);
      int foodX = positionX;
      int foodY = positionY + ((Food.DIAMETER/2*counter)-Food.DIAMETER/2*(i+1));
      f.draw(foodX, foodY, 10, 10);
    }
  }
}