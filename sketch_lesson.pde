//jenny yu
//block 2-4
//april 29, 2025

//global variables
color pink = #f5c8c4;
color coral = #f59c9a;
color peach = #ffbe98;
color yellow = #ffe7ab;
color green = #c5dba9;
color blue = #96add6;
float x1, y1, d1;
float x2, y2, d2;

float ballx, bally, balld;
float vx, vy; //ball's velocity
float ax, ay; //ball's gravity

//key variables
boolean wKey, aKey, sKey, dKey, upKey, leftKey, downKey, rightKey;

void setup() {
  size(800, 800, P2D);
  x1 = width/2;
  y1 = height/2;
  d1 = 100;

  x2 = width/2;
  y2 = height/2;
  d2 = 100;

  ballx = width/2;
  bally = 50;
  balld = 50;

  //vx = vx + ax;
  //vy = vy + ay;

  vx = 2;
  vy = 3;

  ax = 0;
  ay = 1;
}


void draw() {
  background(yellow);
  strokeWeight(3);
  stroke(coral);
  fill(pink);
  circle(x1, y1, d1);
  if (wKey) y1 -= 10;
  if (aKey) x1 -= 10;
  if (sKey) y1 += 10;
  if (dKey) x1 += 10;
  textSize(40);
  textAlign(CENTER, CENTER);

  stroke(peach);
  fill(green);
  circle(x2, y2, d2);
  if (upKey) y2 -= 10;
  if (leftKey) x2 -= 10;
  if (downKey) y2 += 10;
  if (rightKey) x2 += 10;

  stroke(green);
  fill(blue);
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
  }

  if (dist(x2, y2, ballx, bally) <= (d2/2 + balld/2)) {
    vx = (ballx - x2)/5;
    vy = (bally - y2)/5;
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
