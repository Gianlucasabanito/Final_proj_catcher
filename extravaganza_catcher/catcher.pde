class Catcher {
  PVector loc;
  int d;

  Catcher() {
    d = 75;
    loc = new PVector(mouseX, height-50);

  }
  
  void display() {
    loc.set(mouseX, height-50); //moves the catcher by mouseX
    if (Ocean == true && Bean == false) {
      image(Crab, loc.x, loc.y, d, d);
    }
    if (Ocean == false && Bean == true) {
      image(Coffee, loc.x, loc.y, d, d);
    }
  }
}
