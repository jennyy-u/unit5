void gameOver() {
  background(bblue);
  textSize(50);
  textAlign(CENTER, CENTER);
  fill(mpink);
  if (mscore == 5) {
    mode  = 3;
    stroke(mpink);
    fill(mpink);
    text("game over! pink wins!", width/2, height/2.5);
  } else if (kscore == 5) {
    mode = 3;
    stroke(kpurple);
    fill(kpurple);
    text("game over! purple wins!", width/2, height/2.5);
  }

  tactileg(300, 400, 200, 60);
  strokeWeight(5);
  fill(butter);
  rect(300, 400, 200, 60);

  textSize(40);
  textAlign(CENTER, CENTER);
  fill(mpink);
  text("play again?", 400, 420);
}

void tactileg(int x, int y, int w, int h) {
  if (mouseX > x && mouseX < x + w && mouseY > y && mouseY < y + h) {
    stroke(bee);
  } else {
    stroke(butter);
  }
}
