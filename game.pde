void game() {
  background(sand);

  px = constrain(px, 0, width);


  //balls
  strokeWeight(3);
  stroke(dBlue);
  fill(dBlue);
  circle(px, py, pd);
  if (leftKey) px -= 10;
  if (rightKey) px += 10;

  stroke(white);
  fill(white);
  circle(ballx, bally, balld);

  //movement
  ballx = ballx + vx;
  bally = bally + vy;


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

  //bouncing off players
  if (dist(px, py, ballx, bally) <= (pd/2 + balld/2)) {
    vx = (ballx - px)/7;
    vy = (bally - py)/7;
  }


  //bricks + bouncing off bricks
  int i = 0;
  while (i < n) {
    manageBrick(i);
    i++;
  }
}


void gameClicks() {
}


void manageBrick(int i) {
  if (y[i] == 100) fill(orange);
  if (y[i] == 160) fill(yellow);
  if (y[i] == 220) fill(green);
  if (y[i] == 280) fill(blue);
  if (y[i] == 340) fill(dBlue);
  circle(x[i], y[i], brickd);
  if (dist(x[i], y[i], ballx, bally) <= (brickd/2 + balld/2)) {
    vx = (ballx - x[i])/5;
    vy = (bally - y[i])/5;
  }
}
