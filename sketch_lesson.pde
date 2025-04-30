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
  size(600, 600, P2D);
  x1 = width/2;
  y1 = height/2;
  d1 = 100;

  x2 = width/2;
  y2 = height/2;
  d2 = 100;

  ballx = width/2;
  bally = height/2;
  balld = 50;

  vx = vx + ax;
  vy = vy + ay;
  
  ax = 0;
  ay = 1;
}


void draw() {
  background(yellow);
  strokeWeight(3);
  stroke(coral);
  fill(pink);
  circle(x1, y1, d1);
  if (wKey) y1 = y1 - 10;
  if (aKey) x1 = x1 - 10;
  if (sKey) y1 = y1 + 10;
  if (dKey) x1 = x1 + 10;

  stroke(peach);
  fill(green);
  circle(x2, y2, d2);
  if (upKey) y2 = y2 - 10;
  if (leftKey) x2 = x2 - 10;
  if (downKey) y2 = y2 + 10;
  if (rightKey) x2 = x2 + 10;

  stroke(green);
  fill(blue);
  circle(ballx, bally, balld);

  //movement
  ballx = ballx + vx;
  bally = bally + vy;
  //ballx +- vx;
  //bally +- vy;

  //bouncing off walls
  if (bally <= 0 || bally >= height) vy = -vy;
  if (ballx <= 0 || ballx >= width) vx = -vx;
  
  if (ballx <= balld/2 || ballx >= width-balld/2) vx = -vx;
  if(bally <= balld/2 || bally >= height-balld/2) vy = -vy; 

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
