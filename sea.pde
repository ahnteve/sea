void setup() {
  size(1280, 1024);
}

void draw() {
  background(#0000FF);
  drawFish(100, 100);
}


void drawFish(float x, float y) {
  pushStyle();

  noStroke();
  fill(#CB780A);

  beginShape();
  vertex(26, 80);
  vertex(62, 65);
  vertex(66, 77);
  endShape();


  beginShape();
  vertex(25, 117);
  vertex(51, 135);
  vertex(56, 120);
  endShape();


  fill(#FFB74B);
  beginShape();

  vertex(0, 100);
  bezierVertex(25, 66, 75, 66, 100, 100);
  vertex(120, 120);
  bezierVertex(115, 120, 115, 80, 120, 80);
  vertex(100, 100);
  bezierVertex(75, 133, 25, 133, 0, 100);

  endShape();

  fill(#FFFFFF);
  circle(15, 95, 8);

  fill(#000000);
  circle(16, 95, 6);

  fill(#FFFFFF);
  circle(14, 94, 3);

  strokeWeight(3);
  noFill();
  stroke(#CB780A);


  popStyle();
}
