import ddf.minim.*;
Minim minim;

AudioPlayer loopSamp;

void setup() 
{
  size(640, 480);
  frameRate(30);

  minim = new Minim(this);
  loopSamp = minim.loadFile("drum_loop_short.wav");
}

void draw() {
  background(120);

  if (mouseX < width/2) 
  {
    fill(0, 180, 180);
    loopSamp.rewind();
    loopSamp.play();
  } 
  else {
    fill(120, 120, 120);
  }
  rect(0, 0, width/2, height);
}
