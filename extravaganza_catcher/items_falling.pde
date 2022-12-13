class Beandrops {
  PVector loc;
  PVector vel;
  PVector acc;
  PImage Coffeedrop;
  PImage Oceandrop;
  int d;

  Beandrops() {
    d = 40;
    loc = new PVector(random(d, width-d), -40);
    vel = new PVector(0, 2.5);
    acc = new PVector(0, .1);
    Coffeedrop = loadImage("Bean.png"); //loads picture
    Oceandrop = loadImage("Fish.png");
  }

  void display() {
    if (Ocean == false && Bean == true) {
      image(Coffeedrop, loc.x, loc.y, d, d);
    }
    if (Ocean == true && Bean == false) {
      image(Oceandrop, loc.x, loc.y, d, d);
    }
  }

  void move() {
    if (loc.y > 0) {
      acc.set(0, gameTime*.000001);
    }
    else {
      acc.set(0, 0);
    }
    loc.add(vel);
    vel.add(acc);
  }

  void recognize(Catcher c) { 
    if (dist(loc.x, loc.y, c.loc.x, c.loc.y) <= d/2 + c.d/2) { //checks for Beans touching catcher
      loc.set(-500, -500);
      vel.set(0, 0);
      acc.set(0, 0);
      score++; //increases score if bean is caught
    }
    if (loc.y > height+100) {
      lives--;
      loc.set(-500, -500);
      vel.set(0, 0);
      acc.set(0, 0);
    }
    if (start == false && stop == true) {
      loc.set(-500, -500);
      vel.set(0, 0);
      acc.set(0, 0);
    }
  }
}
