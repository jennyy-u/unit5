void intro() {
  background(bblue);
  textSize(100);
  textAlign(CENTER, CENTER);
  fill(mpink);
  text("soccer", width/2, height/3);

  tactile(330, 320, 140, 60);
  strokeWeight(5);
  fill(butter);
  rect(330, 320, 140, 60);

  textSize(50);
  textAlign(CENTER, CENTER);
  fill(mpink);
  text("play", 400, 340);
}

void tactile(int x, int y, int w, int h) {
  if (mouseX > x && mouseX < x + w && mouseY > y && mouseY < y + h) {
    stroke(bee);
  } else {
    stroke(butter);
  }
}
