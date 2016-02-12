class Walker {

  final int MAX_VELOCITY = 1;
  final float NOISE_DELTA = 0.01;
  final int WIDTH = 80;
  PVector location;
  PVector velocity;
  PVector acceleration;
  PVector tendency;
  float xOffset;

  ArrayList<Food> data = new ArrayList<Food>();

  public Walker(PVector initialLocation) {
    this.location = initialLocation;
    velocity = new PVector(0, 0);
    acceleration = new PVector(0, 0);
    tendency = new PVector(1.4, 0);
    xOffset = 0.0;
  }

  public void walk() {
    acceleration = PVector.fromAngle( noise(xOffset) * TWO_PI  );
    velocity.add(acceleration);
    velocity.add(tendency);
    location.add(velocity);
    velocity.limit(MAX_VELOCITY);
    xOffset += NOISE_DELTA;
    if (location.y < 0) location.y = height-215;
    if (location.y > height-215) location.y = 0;
    if (location.x < 0) location.x = width;
    if (location.x > width) location.x = 0;
  }

  void draw() {
    ellipse(location.x, location.y, WIDTH, WIDTH);
    for (Food f : data) {
      f.draw((int) f.location.x, (int)f.location.y, 10, 10);
    //} else if 225 < location.x < 450 && 675 < location.x < 900 {
    //  ellipse.remove();
    //}
  }
  }

  boolean isTouching(Food f) {
    return dist(location.x, location.y, f.location.x, f.location.y) < (WIDTH/ 2 + f.DIAMETER/2);
  }

  void eat(Food f) {
    data.add(f);
    f.location.x = random(0, 200);
    f.location.y = random(height-200, height);
  }
}