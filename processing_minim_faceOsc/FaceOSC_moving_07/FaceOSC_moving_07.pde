import oscP5.*;
OscP5 oscP5;

PVector headPosition;
int found;
float noiseColorFactor;

void setup() 
{
  size(640, 480);
  frameRate(30);

  oscP5 = new OscP5(this, 8338);

  headPosition = new PVector();
  found = 0;
  noiseColorFactor = 0;
  colorMode(HSB, 255);
}

void draw() 
{  
  // background(120);

  rectMode(CORNER);
  fill(0, 4);
  rect(0, 0, width, height);

  noiseColorFactor = noiseColorFactor + 0.01;

  noStroke();
  fill(noise(noiseColorFactor)*255, 255, 255, 255);
  rectMode(CENTER);
  if (found==1) rect(headPosition.x, headPosition.y, 10, 10);
}

void oscEvent(OscMessage m) 
{
  if (m.checkAddrPattern("/found"))
  {
    found = m.get(0).intValue();
  }

  if (m.checkAddrPattern("/pose/position")) 
  {
    headPosition.x = m.get(0).floatValue()*-1+width;
    headPosition.y = m.get(1).floatValue();
    println("x : " + headPosition.x);
    println("y : " + headPosition.y);
  }
}

