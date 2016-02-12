Walker walker;
StackWalker stackWalker;
HashTableWalker hashTableWalker;

ArrayList<Food> foods = new ArrayList<Food>();
final int NUMBER_OF_FOODS = 100;
final int NUMBER_OF_COLORS = 20;
color[] colors = new color[NUMBER_OF_COLORS];

PFont font;


void setup() {
  size(900, 600);
  font = loadFont("AvenirNextCondensed-Heavy-48.vlw");
  textFont(font, 15);
  walker = new Walker(new PVector(10, height / 2));
  stackWalker = new StackWalker(new PVector(10, height /3));
  hashTableWalker = new HashTableWalker(new PVector(10, height /5));
  for (int i = 0; i < NUMBER_OF_COLORS; ++i) {
    colors[i] = color(random(0, 255), random(0, 255), random(0, 255));
  }
  for (int i = 0; i < NUMBER_OF_FOODS; ++i) {
    PVector l = new PVector(random(0, width), random(0, height-215));
    PVector S = new PVector(random(0, width), random(0, height-215));
    color c = colors[(int)random(0, NUMBER_OF_COLORS)];
    foods.add(new Food(l, c));
  }
}


void draw() {
  background(255);
  line(0, 390, 900, 390);
  text("Bag", 50, height-190);
  stroke(75);
  walker.walk();
  walker.draw();
  stackWalker.walk();
  stackWalker.draw(); 
  hashTableWalker.walk();
  hashTableWalker.draw();
  //traverse from back to front
  for (int i = foods.size() - 1; i >= 0; --i) {
    Food f = foods.get(i);
    f.draw();
    if (walker.isTouching(f)) {
      walker.eat(f);
      foods.remove(f);
    }
    if (stackWalker.isTouching(f)) {
      stackWalker.eat(f);
      foods.remove(f);
    }
    if (hashTableWalker.isTouching(f)) {
      hashTableWalker.eat(f);
      foods.remove(f);
    }
  }
}