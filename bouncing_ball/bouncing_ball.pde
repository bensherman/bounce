int w = 640;
int h = 480;
int fr = 30;

void setup() {
  size(w, h);
  frameRate = fr;
  smooth();
}

float xPosition = w / 2;
float yPosition = 0;
float g = 9.804;
float v = 0;
float xv = 10;
float a = g / fr; 
int d = 1;
int xd = 1;
float t = 0;
int ballSize = 100;
float bounciness = .75;
float pixel_size = 1; // in meters
float roughness = .90;

void draw() {
  background(255, 192, 0); // a nice yellow orange
  ellipse(xPosition, yPosition, ballSize, ballSize);
  move();
}

void move() {
  if (d == 1) {
    v += a ;
  } else {
    v -= a;
  }
  yPosition += v * d / pixel_size;
  if (yPosition > h - (ballSize / 2)) {
    d *= -1;
    v *= bounciness;
    println("boing");
    yPosition = h - (ballSize / 2);
  }
  
  if ((yPosition == h - (ballSize / 2)) && v < 1) {
    v *= bounciness;
    xv *= bounciness;
    println("slow");
  }
  
  xPosition += xv * xd / pixel_size;
  if (xPosition > (w - (ballSize / 2))) {
    xd *= -1;
    xv *= bounciness;
    xPosition = w - (ballSize / 2);
  } else if (xPosition < 0 + (ballSize / 2) ) {
    xd *= -1;
    xv *= bounciness;
    xPosition = ballSize / 2;
  } 
  println(xPosition, yPosition, xv, v);
}

