void game() {

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
    //fail.play();
    //fail.stop();
  }

  if (dist(x2, y2, ballx, bally) <= (d2/2 + balld/2)) {
    vx = (ballx - x2)/5;
    vy = (bally - y2)/5;
    //success.play();
    //success.stop();
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


  //win
  textSize(80);
  textAlign(CENTER, CENTER);
  fill(mpink);
  if (mscore == 5) {
    mode  = 3;
    text("game over! my melody wins!", width/2, height/2);
  } else if (kscore == 5) {
    mode = 3;
    text("game over! kuromi wins!", width/2, height/2);
  }


  //pause
  tactilePause(50, 525, 150, 50);
  strokeWeight(4);
  fill(bblue);
  rect(50, 525, 150, 50);

  textSize(50);
  textAlign(CENTER, CENTER);
  fill(butter);
  text("pause", 125, 535);
}

void tactilePause(int x, int y, int w, int h) {
  if (mouseX > x && mouseX < x + w && mouseY > y && mouseY < y + h) {
    stroke(cblue);
  } else {
    stroke(cdblue);
  }
}
