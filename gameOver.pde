void gameOver() {
  background(navyBlue);
  music.stop();

  if (pscore == 30) {
    //win.stop();
    win.play();
    win.amp(1);
    image(gif[f], 0, 0, width, height);
    f = f + 1;
    if (f == numberOfFrames) f= 0;
  }

  if (plives == 0) {
    lose.stop();
    lose.play();
    lose.amp(1);
    image(gif[l], 0, 0, width, height);
    l = l + 1;
    if (l == numberOfFrames2) l = 0;
  }
}
