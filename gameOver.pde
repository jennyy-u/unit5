void gameOver() {
  background(navyBlue);
  music.stop();

  if (pscore == 650) {
    image(gif[f], 0, 0, width, height);
    if (frameCount % 3 == 0) f = f + 1;
    if (f == numberOfFrames) f= 0;
  }

  if (plives == 0) {
    image(gif2[l], 0, 0, width, height);
    if (frameCount % 4 == 0) l = l + 1;
    if (l == numberOfFrames2) l = 0;
  }
}
