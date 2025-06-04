import processing.sound.*;

//jenny yu
//block 2-4
//may 26, 2025

//global variables
//colour variables
color white = #ffffff;
color sandBG = #fffbf0;
color tulipPink = #e37083;
color babyPink = #f49aa2;
color sun = #fccd86;
color matcha = #a8bf8a;
color blue = #89b7c2;
color duskBlue = #4d7cbf;
color navyBlue = #003265;
color lavendar = #bbb7e5;

//font variables
PFont fontKirby;
PFont fontPlay;
PFont fontHydrogenWhiskey;

//game variables
float px, py, pd;
float ballx, bally, balld;
float vx, vy; //velocity
int plives;
int pscore;

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

//gif variables
PImage [] gif;
int numberOfFrames;
int f;
PImage [] gif2;
int numberOfFrames2;
int l;

//sound variables
SoundFile music;
SoundFile pop;
SoundFile lose;
SoundFile win;


void setup() {
  size(800, 800, P2D);

  px = width/2;
  py = height;
  pd = 100;

  ballx = width/2;
  bally = 700;
  balld = 20;

  vx = 0;
  vy = 2;

  plives = 5;
  pscore = 0;


  //font setup
  fontPlay = createFont("Ch Games Black.otf", 32);
  fontHydrogenWhiskey = createFont("Hydrogen Whiskey.otf", 32);
  fontKirby = createFont("kirbyss.otf", 100);


  //set up array of bricks
  brickd = 40;
  n = 65;
  x = new int[n]; //instantiation (choosing how many pages)
  y = new int[n];
  tempx = 100;
  tempy = 100;
  alive = new boolean[n];

  int i = 0;
  while (i < n) {
    x[i] = tempx;
    y[i] = tempy;
    alive[i] = true;
    tempx = tempx + 50;
    if (tempx == 750) {
      tempx = 100;
      tempy = tempy + 60;
    }
    i = i + 1;
  }


  //gif setup
  numberOfFrames = 12;
  gif = new PImage [numberOfFrames];

  int g = 0;
  while (g < numberOfFrames) {
    gif[g] = loadImage("frame_" + g + "_delay-0.07s.gif");
    g++;
  }

  numberOfFrames2 = 19;
  gif2 = new PImage [numberOfFrames2];

  int g2 = 0;
  while (g2 < numberOfFrames2) {
    gif2[g2] = loadImage("frame_" + g2 + "_delay-0.4s.gif");
    g2++;
  }


  //sound setup
  pop = new SoundFile(this, "ballpop.mp3");
  win = new SoundFile(this, "kirbys-victory-dance.mp3");
  lose = new SoundFile(this, "kirby-death-noise.mp3");
  music = new SoundFile(this, "5 P.M. - Animal Crossing_ New Leaf.mp3");
  music.loop();
  music.amp(0.5);


  mode = INTRO;
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

  if (mouseX > 300 && mouseX < 500 && mouseY > 450 && mouseY < 500) {
    mode = 1;
  }
}
