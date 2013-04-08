import ddf.minim.*;
Minim minim;

AudioPlayer loopSamp;

void setup() {
  size(640, 480);
  frameRate(30);

  minim = new Minim(this);
  loopSamp = minim.loadFile("drum_loop_short.wav");

}

void draw() {
  background(120);

  loopSamp.play();
}
