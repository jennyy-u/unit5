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
float x1, y1, d1;
float x2, y2, d2;
float kscore, mscore;

float ballx, bally, balld;
float vx, vy; //ball's velocity
float ax, ay; //ball's gravity

//key variables
boolean wKey, aKey, sKey, dKey, upKey, leftKey, downKey, rightKey;

//sound variables
SoundFile fail;
SoundFile success;
SoundFile music;

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

  fail = new SoundFile(this, "FAILURE.wav");
  music = new SoundFile(this, "MUSIC.mp3");
  success = new SoundFile(this, "SUCCESS.wav");

  music.loop();
  music.amp(0.5);
}


void draw() {

  //if (mode == INTRO) {
  //  intro();
  //} else if (mode == GAME) {
  //  game();
  //} else if (mode == GAMEOVER) {
  //  gameOver();
  //} else {
  //  println("ERROR! Mode is" + mode);
  //}

  //field
  background(bblue);
  strokeWeight(5);
  stroke(cdblue);
  fill(bblue);
  circle(400, 300, 80);
  line(400, 0, 400, 600);

  ellipse(100, 300, 50, 80);
  ellipse(700, 300, 50, 80);

  stroke(cdblue);
  rect(-5, 180, 105, 240);
  rect(700, 180, 105, 240);

  rect(-5, 250, 40, 100);
  rect(760, 250, 45, 100);


  //balls
  strokeWeight(3);
  stroke(kppurple);
  fill(kpurple);
  circle(x1, y1, d1);
  if (wKey) y1 -= 10;
  if (aKey) x1 -= 10;
  if (sKey) y1 += 10;
  if (dKey) x1 += 10;
  textSize(40);
  textAlign(CENTER, CENTER);
  text(kscore, width - 200, height/10);

  stroke(mdpink);
  fill(mpink);
  circle(x2, y2, d2);
  if (upKey) y2 -= 10;
  if (leftKey) x2 -= 10;
  if (downKey) y2 += 10;
  if (rightKey) x2 += 10;
  textSize(40);
  textAlign(CENTER, CENTER);
  text(mscore, width - 600, height/10);

  stroke(cdblue);
  fill(cblue);
  circle(ballx, bally, balld);

  //movement
  ballx = ballx + vx;
  bally = bally + vy;
  //ballx +- vx;
  //bally +- vy;


  //bouncing code
  if (bally <= 0) { //top
    vy = vy * -0.9;
    bally = 0;
  }
  if (bally >= height) { //bottom
    vy = vy * -0.9;
    bally = height;
  }
  if (ballx <= 0) {//right
    vx = vx * -0.9;
    ballx = 0;
  }
  if (ballx >= width) { //left
    vx = vx * -0.9;
    ballx = width;
  }

  //bouncing off walls
  //if (bally <= 0 || bally >= height) vy = -vy;
  //if (ballx <= 0 || ballx >= width) vx = -vx;

  //if (ballx <= balld/2 || ballx >= width-balld/2) vx = -vx;
  //if (bally <= balld/2 || bally >= height-balld/2) vy = -vy;

  //bouncing off players
  if (dist(x1, y1, ballx, bally) <= (d1/2 + balld/2)) {
    vx = (ballx - x1)/5;
    vy = (bally - y1)/5;
    fail.play();
    fail.stop();
  }

  if (dist(x2, y2, ballx, bally) <= (d2/2 + balld/2)) {
    vx = (ballx - x2)/5;
    vy = (bally - y2)/5;
    success.play();
    success.stop();
  }

  //scoring a goal
  if (ballx < 40 && bally > 255 && bally < 345) {
    mscore = mscore + 1;
    ballx = width/2;
    bally = 300;
    vx = 0;
    vy = 0;
  }

  if (ballx > 760 && bally > 255 && bally < 345) {
    kscore = kscore + 1;
    ballx = width/2;
    bally = 300;
    vx = 0;
    vy = 0;
  }

  //scores
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
