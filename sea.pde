void setup() {
  size(1280, 1024);
  
  new Fish();
}

void draw() {
  background(#0000FF);
  drawFish(10, 100, 100, color(#FFB74B));
  drawFish(200, 200, 200, color(#FF0000));
}


void drawFish(float x, float y, int size, color c) {
  // fin
  pushStyle();

  noStroke();
  color finColor = darkerColor(c);
  fill(finColor);

  beginShape();
  vertex(x + size * 0.25, y - (size * 0.2));
  vertex(x + size * 0.62, y - (size * 0.35));
  vertex(x + size * 0.66, y - (size * 0.2));
  endShape();

  beginShape();
  vertex(x + size * 0.25, y + (size * 0.2));
  vertex(x + size * 0.62, y + (size * 0.35));
  vertex(x + size * 0.66, y + (size * 0.2));
  endShape();
  
  popStyle();
  
  // body
  pushStyle();
  
  noStroke();
  fill(c);
  
  beginShape();
  vertex(x, y);
  bezierVertex(x + size * 0.25, y - size / 3, x + size * 0.75, y - size / 3, x + size, y);
  vertex(x + size * 1.2, y + size * 0.2);
  bezierVertex(
    x + (size + size * 0.2) * 0.95,
    y + size * 0.2,
    x + (size + size * 0.2) * 0.95,
    y - size * 0.2,
    x + size + size * 0.2,
    y - size * 0.2
  );
  vertex(x + size, y);
  bezierVertex(x + size * 0.75, y + size / 3, x + size * 0.25, y + size / 3, x, y);
  endShape();
  
  popStyle();

  // pupil
  pushStyle();
  
  noStroke();
  fill(#FFFFFF);
  circle(x + size * 0.15, y - size * 0.05, size * 0.08);
  fill(#000000);
  circle(x + size * 0.16, y - size * 0.05, size * 0.06);
  fill(#FFFFFF);
  circle(x + size * 0.14, y - size * 0.04, size * 0.03);

  popStyle();
}

color darkerColor(color c) {
  return darkerColor(c, 50);
}

color darkerColor(color c, int amount) {
  float r = max(red(c) - amount, 0);
  float g = max(green(c) - amount, 0);
  float b = max(blue(c) - amount, 0);
  return color(r, g, b);
}
