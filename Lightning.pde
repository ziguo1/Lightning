void setup()
{
  size(512,512);
  background(color(64, 64, 64));
}

void walk(int startX, int startY, int endX) {
  push();
  stroke(color(16, 251, 219));
  int diff = endX - startX;
  float inc = diff * 0.02;
  
  float pointX = startX, pointY = startY;
  while (pointX < endX) {
    float incX = pointX + (float) (Math.random() * inc);
    float incY = pointY + (float) (Math.random() * inc * (Math.random() > 0.5 ? 1 : -1));
    line(pointX, pointY, incX, incY);
    pointX = incX;
    pointY = incY;
    
  }
  
  pop();
}

boolean toggled = false;
long flashDebounce = System.currentTimeMillis();
boolean flashIsOn = false;

void draw()
{  
  if (toggled) {
    walk(120, 256, 512);
    if (System.currentTimeMillis() - flashDebounce >= 100) {
      flashDebounce = System.currentTimeMillis();
      if (flashIsOn) background(color(64, 64, 64));
      else background(color(255, 255, 255));
      flashIsOn = !flashIsOn;
    }
  }
  if (keyPressed && key == 'r') background(color(64, 64, 64));
  drawWand();
}

void drawWand() {
   fill(color(168, 114, 49));
   rect(0, 240, 100, 40);
  
  fill(color(27, 27, 27));
  circle(110, 256, 100);
}

void mouseClicked() {
  toggled = !toggled;
  flashIsOn = false;
  background(color(64, 64, 64));
}
