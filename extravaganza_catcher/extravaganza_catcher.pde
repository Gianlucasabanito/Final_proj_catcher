import ddf.minim.*;
AudioPlayer song;
Minim m;
Catcher c;
Beandrops [] r1 = new Beandrops [1000];
int index = 1;
int oldTime = 0;
int fTime = 0;
int newTime = 0;
int startTime = 0;
int gameTime = 0;
int score = 0;
int lives = 3;
float frequency = 1;
PImage heart;
PImage Oceanback;
PImage Coffeeshop;
PImage Crab;
PImage Coffee;
boolean start = true;
boolean stop = true;
boolean Ocean = false;
boolean Bean = false;
String Beandirections;
String Oceandirections;

void setup() {
  size(500, 500);
  colorMode(HSB, 360, 100, 100);
  imageMode(CENTER);
  textAlign(CENTER);
  rectMode(CENTER);
  c = new Catcher(); //creates catcher
  for (int i = 0; i<r1.length; i++) { //creates beans
    r1[i] = new Beandrops();
  }
  images();
  Beandirections = "Directions:\n Move your mouse to move the Coffee from\n side to side to catch the Beans that are falling.\nThe more you catch, the higher your score.";
  Oceandirections = "Directions:\n Move your mouse to move the Crab from\n side to side to catch the Fish that are falling.\nThe more you catch, the higher your score.";
}

void draw() {
  background(0);
  thememenu();
  startmenu();
  playgame();
  gameover();
}

void mousePressed() {
  if (mouseX>100 && mouseX < 200 && mouseY>225 && mouseY<275 && start==false && stop==false) { //start button on start menu
    reset();
  }
  if (mouseX > 300 && mouseX<400 && mouseY>225 && mouseY<275 && start == false && stop == false && Ocean == true && Bean == false) { //change theme button on start menu
    background(0);
    start = true;
    stop = true;
    Ocean = false;
    Bean = false;
    song.pause();
  }
  if (mouseX > 300 && mouseX<400 && mouseY>225 && mouseY<275 && start == false && stop == false && Ocean == false && Bean == true) { //change theme button on start menu
    background(0);
    start = true;
    stop = true;
    Ocean = false;
    Bean = false;
    song.pause();
  }
  if (mouseX>100 && mouseX < 200 && mouseY>225 && mouseY<275 && start==false && stop==true) { //restart button on game over
    reset();
  }
  if (mouseX>300 && mouseX < 400 && mouseY>225 && mouseY<275 && start == false && stop == true && Ocean == true && Bean == false) { //change theme button on game over
    background(0);
    start = true;
    stop = true;
    Ocean = false;
    Bean = false;
    song.pause();
  }
  if (mouseX>300 && mouseX < 400 && mouseY>225 && mouseY<275 && start == false && stop == true && Ocean == false && Bean == true) { //change theme button on game over
    background(0);
    start = true;
    stop = true;
    Ocean = false;
    Bean = false;
    song.pause();
  }
  if (mouseX>100 && mouseX<150 && mouseY>75 && mouseY<125 && start == true && stop == true && Ocean == false && Bean == false) { //Coffee gamemode button on theme menu
    start = false;
    stop = false;
    Bean = true;
    Ocean = false;
    m= new Minim(this);
     song = m.loadFile("coffeemusic.mp3");
  
  //plays the song
  song.play();
  }
  if (mouseX>350 && mouseX<400 && mouseY>75 && mouseY<125 && start == true && stop == true && Ocean == false && Bean == false) { //Ocean gamemode button on theme menu
    start = false;
    stop = false;
    Bean = false;
    Ocean = true;
    m= new Minim(this);
song = m.loadFile("sea.mp3");
  
  //plays the song
  song.play();
  }
}

void reset() { //resets all values used in game and changes the gamemode to start the game
  oldTime=0;
  lives=3;
  score = 0;
  frequency = 1;
  startTime=millis();
  start = true;
  stop = false;
}

void images() { //loads all images used in game
  heart = loadImage("Heart.png");
  Coffeeshop = loadImage("Coffeeshop.png");
  Oceanback = loadImage("Oceanback.jpg");
  Crab = loadImage("Crab.png");
  Coffee = loadImage("Coffee.png");
}

void checkbackground() { //checks which game mode is currently on, Ocean or Coffee, and then chooses the resulting background
  if (Ocean == true && Bean == false) {
    background(Oceanback);
  }
  if (Bean == true && Ocean == false) {
    background(Coffeeshop);
  }
}

void timecheck() { //checks time so acceleration can change over the period of the game.
  if (millis() - fTime >= 1000) {
    fTime = millis();
    frequency = frequency - .02;
  }
  if (millis() - oldTime >= 1500*frequency) {
    oldTime = millis();
    index++;
  }
  gameTime = oldTime - startTime;
}

void thememenu() { //lets you choose either Ocean theme or Coffee theme by clicking the corresponding box
  if (start == true && stop == true && Ocean == false && Bean == false) {
    image(Coffeeshop, 0, 250);
    image(Oceanback, 500, 250);
    image(Crab, 375, 375, 75, 75);
    image(Coffee, 125, 375, 75, 75);
    fill(360);
    textSize(30);
    text("SELECT BOX TO\n<- CHOOSE THEME ->", 250, 440);
    fill(360);
    stroke(0);
    strokeWeight(8);
    rect(125, 100, 50, 50);
    if (mouseX>100 && mouseX<150 && mouseY>75 && mouseY<125) { //if the mouse hovers over the Coffee theme the box has a check mark and the Coffee text changes color
      fill(0, 100, 100);
      stroke(0, 100, 100);
      strokeWeight(8);
      line(100, 100, 112.5, 125);
      line(112.5, 125, 150, 75);
      

    }
    text("Coffee Shop", 125, 200);
    fill(360);
    stroke(0);
    strokeWeight(8);
    rect(375, 100, 50, 50);
    if (mouseX>350 && mouseX<400 && mouseY>75 && mouseY<125) { //if the mouse hovers over the Ocean theme the box has a check mark and Ocean text changes color
      fill(0, 100, 100);
      stroke(0, 100, 100);
      strokeWeight(8);
      line(350, 100, 362.5, 125);
      line(362.5, 125, 400, 75);
    }
    text("Ocean", 375, 200);
    fill(360);
    stroke(0);
    strokeWeight(1);
  }
}

void startmenu() { //start menu, lets you start game or change the theme
  if (start == false && stop == false) {
    checkbackground();
    fill(120, 100, 100);
    rect(150, 250, 100, 50);
    rect(350, 250, 100, 50);
    fill(0);
    textSize(13);
    text("Start", 150, 250);
    text("Change Theme", 350, 250);
    textSize(15);
    fill(360);
    rect(250, 80, 375, 100);
    fill(0);
    if (Bean == true && Ocean == false){
      text(Beandirections, 250, 50);
    }
    if (Ocean == true && Bean == false){
      text(Oceandirections, 250, 50);
    }
  }
}


void playgame() { //lets you play game
  if (start == true && stop == false) {  
    checkbackground();
    fill(360);
    textAlign(CENTER);
    textSize(40);
    text("Score: " +score, 230, 50); //displays scores
    timecheck();
    c.display();
    for (int i=1; i < index; i++) { 
      r1[i].display();
      r1[i].move();
      r1[i].recognize(c);
    }
    for (int i= 0; i< lives; i++) { // displays heart (lives)
      image(heart, 400+40*i, 75, 35, 35);
    }
    if (lives == 0) { //if no lives left it changes to game over screen and clears screen
      start = false;
      stop = true;
      for (int i=1; i< index; i++) {
        r1[i].vel.set(0, 0);
        r1[i].acc.set(0, 0);
        r1[i].loc.set(-500, -500);
      }
    }
  }
}

void gameover() { //game over screen displays score from last run, restart button and change theme button
  if (start == false && stop == true) {
    checkbackground();
    fill(360);
    textSize(50);
    text("GAME OVER!", 250, 150);
    text("Score:" +score, 250, 400);
    fill(120, 100, 100);
    rect(150, 250, 100, 50);
    rect(350, 250, 100, 50);
    fill(0);
    textSize(13);
    text("Restart", 150, 250);
    text("Change Theme", 350, 250);
  }
}
