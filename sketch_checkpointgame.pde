import processing.sound.*;

//jenny yu
//block 2-4
//april 29, 2025

//global variables
//mode = INTRO;
//mode = GAME;
//mode = GAMEOVER;


color bblue = #dfeaee;
color kpurple = #bbabd8;
color kppurple = #9670d1;
color mdpink = #ce6f79;
color mpink = #fbc4d3;
color cdblue = #92c8e2;
color cblue = #89aad3;
color butter = #fff4c7;
color bee = #fce6a9;

float x1, y1, d1;
float x2, y2, d2;
float ballx, bally, balld;

int kscore, mscore;

float vx, vy; //ball's velocity
float ax, ay; //ball's gravity

//key variables
boolean wKey, aKey, sKey, dKey, upKey, leftKey, downKey, rightKey;

//sound variables
SoundFile music;

//mode framework
int mode;
final int INTRO = 0;
final int GAME = 1;
final int PAUSE = 2;
final int GAMEOVER = 3;


void setup() {
  size(800, 600, P2D);
  x1 = width/2;
  y1 = height/2;
  d1 = 80;

  x2 = width/2;
  y2 = height/2;
  d2 = 80;

  ballx = width/2;
  bally = 50;
  balld = 40;

  //vx = vx + ax;
  //vy = vy + ay;

  vx = 2;
  vy = 3;

  ax = 0;
  ay = 1;

  mscore = 0;
  kscore = 0;

  mode = INTRO;

  music = new SoundFile(this, "tune.mp3");

  music.loop();
  music.amp(0.5);
}


void draw() {

  if (mode == INTRO) {
    intro();
  } else if (mode == GAME) {
    game();
  } else if (mode == GAMEOVER) {
    gameOver();
  } else {
    println("ERROR! Mode is" + mode);
  }
}

void keyPressed() {
  if (key == 'w') wKey = true;
  if (key == 'a') aKey = true;
  if (key == 's') sKey = true;
  if (key == 'd') dKey = true;

  if (keyCode == UP) upKey = true;
  if (keyCode == LEFT) leftKey = true;
  if (keyCode == DOWN) downKey = true;
  if (keyCode == RIGHT) rightKey = true;
}

void keyReleased() {
  if (key == 'w') wKey = false;
  if (key == 'a') aKey = false;
  if (key == 's') sKey = false;
  if (key == 'd') dKey = false;

  if (keyCode == UP) upKey = false;
  if (keyCode == LEFT) leftKey = false;
  if (keyCode == DOWN) downKey = false;
  if (keyCode == RIGHT) rightKey = false;
}

void mouseReleased() {

  if (mouseX > 300 && mouseX < 500 && mouseY > 400 && mouseY < 460) {
    mode = 0;
  }


  if (mouseX > 330 && mouseX < 470 && mouseY > 320 && mouseY < 380) {
    mode = 1;
    mscore = 0;
    kscore = 0;
    x1 = 400;
    y1= 300;
    x2 = 400;
    y2 = 300;
  }
}
