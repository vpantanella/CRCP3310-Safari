class HashTable {
  Food[] foods;
  final int SIZE = 100;
  int positionX;
  int positionY;


  HashTable() {
    foods = new Food[SIZE];
    positionX = 400;
    positionY = height- 200;
  }

  void add(Food f) {
    int idKey = abs((f.c) % SIZE);
    
    foods[idKey] = f;
  }

  void remove(Food f) {
    int idKey = abs((f.c) % SIZE);
    foods[idKey] = null;
  }

  void display() {
    for (int i = 0; i < SIZE; i++) {
      Food f = foods[i];
      if (f != null) {
        int foodX = positionX;
        int foodY = positionY + ((Food.DIAMETER/2*SIZE)-Food.DIAMETER/2*(i+1));
        f.draw(foodX, foodY, 10, 10);
      }
    
  }
}
}