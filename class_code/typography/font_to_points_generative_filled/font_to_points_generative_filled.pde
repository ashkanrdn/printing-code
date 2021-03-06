import geomerative.*;

String charToDraw = "a";
float danceFactor = 4;

RFont font;
RGroup grp;
RPoint[] pnts;

void setup() 
{
  size(1280, 800); 
  colorMode(HSB, 360, 100, 100);
  
  smooth();

  frameRate(15);

  // always initialize the library in setup
  RG.init(this);
  font = new RFont("FreeSansNoPunch.ttf", 600, RFont.LEFT);

  RCommand.setSegmentLength(25);
  RCommand.setSegmentator(RCommand.UNIFORMLENGTH);

  grp = font.toGroup(charToDraw);
  pnts = grp.getPoints();
  
  background(360);
}

void draw() 
{
  pushMatrix();

  // translate to the middle. Use plus in y because text is drawn from y and up
  translate((width / 2) - (grp.getWidth() / 2), (height / 2) + (grp.getHeight() / 2));

  // randomize the points
  for (int i = 0; i < pnts.length; i++ ) {
    pnts[i].x += random(-danceFactor, danceFactor);
    pnts[i].y += random(-danceFactor, danceFactor);
  }

  noStroke();
  fill(0, 0, 0, 5);

  // draw curved lines between points
  strokeWeight(0.08);
  beginShape();
  curveVertex(pnts[pnts.length-1].x, pnts[pnts.length-1].y);
  for (int i=0; i<pnts.length; i++) {
    curveVertex(pnts[i].x, pnts[i].y);
  }
  curveVertex(pnts[0].x, pnts[0].y);
  curveVertex(pnts[1].x, pnts[1].y);
  endShape();

  popMatrix();
}

