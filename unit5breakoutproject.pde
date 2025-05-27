//jenny yu
//block 2-4
//may 26, 2025

//global variables

//colour variables
color dBlue = #276189;
color blue = #92aac3;
color green = #b8a750;
color orange = #e2690d;
color yellow = #e3aa52;
color sand = #feecc1;
color white = #ffffff;

//game variables
float px, py, pd;
float ballx, bally, balld;
float vx, vy; //velocity
float ax, ay; //gravity

//keyboard variables
boolean leftKey, rightKey;

//array variables
int[] x; //declaration (naming it)
int[] y;
boolean[] alive;
int brickd;
int n;
int tempx, tempy;

//mode framework
int mode;
final int INTRO = 0;
final int GAME = 1;
final int PAUSE = 2;
final int GAMEOVER = 3;


void setup() {
  size(800, 800, P2D);

  px = width/2;
  py = height;
  pd = 100;

  ballx = width/2;
  bally = 700;
  balld = 20;


  vx = 2;
  vy = 2;

  ax = 0;
  ay = 1;

  //set up array of bricks
  brickd = 40;
  n = 65;
  x = new int[n]; //instantiation (choosing how many pages)
  y = new int[n];
  tempx = 100;
  tempy = 100;

  int i = 0;
  while (i < n) {
    x[i] = tempx;
    y[i] = tempy;
    tempx = tempx + 50;
    if (tempx == 750) {
      tempx = 100;
      tempy = tempy + 60;
    }
    i = i + 1;
  }



  mode = GAME;
}


void draw() {
  if (mode == INTRO) {
    intro();
  } else if (mode == GAME) {
    game();
  } else if (mode == PAUSE) {
    pause();
  } else if (mode == GAMEOVER) {
    gameOver();
  } else {
    println("ERROR! Mode is" + mode);
  }
}


void keyPressed() {
  if (keyCode == LEFT) leftKey = true;
  if (keyCode == RIGHT) rightKey = true;
}


void keyReleased() {
  if (keyCode == LEFT) leftKey = false;
  if (keyCode == RIGHT) rightKey = false;
}


void mouseReleased() {
  if (mouseX > 0 && mouseX < 800 && mouseY > 0 && mouseY < 800) {
    mode = 2;
  }
}
