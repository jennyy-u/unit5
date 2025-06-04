void intro() { 
  background(duskBlue);
  textSize(100);
  textAlign(CENTER, CENTER);
  fill(sun);
  textFont(fontKirby);
  text("breakout", width/2, height/3);
  
  tactileIntro(300, 450, 200, 50);
  strokeWeight(5);
  fill(duskBlue);
  rect(300, 450, 200, 50);
  
  textSize(50);
  textFont(fontPlay);
  textAlign(CENTER, CENTER);
  fill(babyPink);
  text("play", 400, 475);
}


void tactileIntro(int x, int y, int w, int h) {
  if (mouseX > 300 && mouseX < 500 && mouseY > 450 && mouseY < 500) {
    stroke(tulipPink);
  } else {
    stroke(babyPink);
  }
}
