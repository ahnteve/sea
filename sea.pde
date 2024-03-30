int x = 120;
int y = 500;
int xDir = 2;

void setup() {
  size(1280, 1024);
}

void draw() {
  background(#0000FF);

  if (xDir > 0) {
    drawFlippedFish(x, y, 100, color(#FFB74B)); // right +1
  } else {
    drawFish(x, y, 100, color(#FFB74B)); // left -1
  }
  x += xDir;

  if (x <= 0) {
    xDir *= -1;
    x = 120;
  } else if (x >= 1280) {
    xDir *= -1;
    x = 1160;
  }
}

void mouseClicked() {
  if (mouseY >= y - 100 / 3 && mouseY <= y + 100 / 3) {
    if (xDir > 0 && mouseX <= x && mouseX >= x - 120) {
      xDir *= -1;
      x = x - 120;
    } else if (xDir < 0 && mouseX >= x && mouseX <= x + 120) {
      x = x + 120;
      xDir *= -1;
    }
  }
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

void drawFlippedFish(float x, float y, int size, color c) {
  // fin
  pushStyle();

  noStroke();
  color finColor = darkerColor(c);
  fill(finColor);

  beginShape();
  vertex(x - size * 0.25, y - (size * 0.2));
  vertex(x - size * 0.62, y - (size * 0.35));
  vertex(x - size * 0.66, y - (size * 0.2));
  endShape();

  beginShape();
  vertex(x - size * 0.25, y + (size * 0.2));
  vertex(x - size * 0.62, y + (size * 0.35));
  vertex(x - size * 0.66, y + (size * 0.2));
  endShape();

  popStyle();

  // body
  pushStyle();

  noStroke();
  fill(c);

  beginShape();
  vertex(x, y);
  bezierVertex(x - size * 0.25, y - size / 3, x - size * 0.75, y - size / 3, x - size, y);
  vertex(x - size * 1.2, y + size * 0.2);
  bezierVertex(
    x - (size + size * 0.2) * 0.95,
    y + size * 0.2,
    x - (size + size * 0.2) * 0.95,
    y - size * 0.2,
    x - size - size * 0.2,
    y - size * 0.2
    );
  vertex(x - size, y);
  bezierVertex(x - size * 0.75, y + size / 3, x - size * 0.25, y + size / 3, x, y);
  endShape();

  popStyle();

  // pupil
  pushStyle();

  noStroke();
  fill(#FFFFFF);
  circle(x - size * 0.15, y - size * 0.05, size * 0.08);
  fill(#000000);
  circle(x - size * 0.16, y - size * 0.05, size * 0.06);
  fill(#FFFFFF);
  circle(x - size * 0.14, y - size * 0.04, size * 0.03);

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
