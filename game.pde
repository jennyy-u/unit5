void game() {
  background(sandBG);

  px = constrain(px, 0, width);


  //player
  strokeWeight(3);
  stroke(duskBlue);
  fill(duskBlue);
  circle(px, py, pd);
  if (leftKey) px -= 10;
  if (rightKey) px += 10;

  textSize(40);
  textAlign(CENTER, CENTER);
  textFont(fontPlay);
  text(pscore, width - 400, height*2/3);

  //ball
  stroke(lavendar);
  fill(lavendar);
  circle(ballx, bally, balld);

  //movement
  ballx = ballx + vx;
  bally = bally + vy;


  //bouncing code
  if (bally <= 0) { //top
    vy = vy * -1.1;
    bally = 0;
  }
  if (bally >= height) { //bottom
    vy = vy * -1.1;
    bally = height;
  }
  if (ballx <= 0) {//right
    vx = vx * -1.1;
    ballx = 0;
  }
  if (ballx >= width) { //left
    vx = vx * -1.1;
    ballx = width;
  }

  //bouncing off players
  if (dist(px, py, ballx, bally) <= (pd/2 + balld/2)) {
    vx = (ballx - px)/5;
    vy = (bally - py)/5;
  }


  //bricks + bouncing off bricks
  int i = 0;
  while (i < n) {
    if (alive[i] == true) {
      manageBrick(i);
    }
    i++;
  }


  //lives
  if (bally == 800) {
    delay(300);
    ballx = 400;
    bally = 600;
    vx = 0;
    vy = 3;

    plives = plives - 1;
  }
  textFont(fontPlay);
  textAlign(CENTER, CENTER);
  fill(duskBlue);
  textSize(20);
  text("lives:", 370, 600);
  text(plives, 430, 600);



  //win
  if (pscore == 650) {
    mode = GAMEOVER;
  }


  //lose
  if (plives == 0) {
    mode = GAMEOVER;
  }
}


void gameClicks() {
}


void manageBrick(int i) {
  if (y[i] == 100) fill(tulipPink);
  if (y[i] == 160) fill(babyPink);
  if (y[i] == 220) fill(sun);
  if (y[i] == 280) fill(matcha);
  if (y[i] == 340) fill(blue);
  stroke(sandBG);
  circle(x[i], y[i], brickd);
  if (dist(x[i], y[i], ballx, bally) <= (brickd/2 + balld/2)) {
    vx = (ballx - x[i])/4;
    vy = (bally - y[i])/4;
    alive[i] = false;
    pscore += 10;
  }
}
