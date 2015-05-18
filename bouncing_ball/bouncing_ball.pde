int w = 640;  // width
int h = 480;  // height
int fr = 30;  // framerate

void setup() {
  size(w, h);
  frameRate = fr;
  smooth();
}

float xPosition = w / 2;
float yPosition = 0;
float g = 9.804;  // gravitational constant
float v = 0;      // velocity on y axis
float xv = 10;    // velocity on x axis
float a = g / fr; // acceleration
int d = 1;        // direction in y axis ( 1 is down )
int xd = 1;       // direction in x axis ( 1 is right )
int ballSize = 100;
float bounciness = .75;
float pixel_size = 1; // in meters, to calculate correct acceleration.
float roughness = .90;

void draw() {
  background(255, 192, 0); // a nice yellow orange
  ellipse(xPosition, yPosition, ballSize, ballSize);
  move();
}

void move() {
  if (d == 1) {  // if we are moving down, accelerate.
    v += a ;
  } else {       
    v -= a;      // if we aren't, decelerate
  }

  yPosition += v * d / pixel_size;
  if (yPosition > h - (ballSize / 2)) {   // if the ball hits the floor, bounce it.
    println("boing");
    d *= -1;
    yPosition = h - (ballSize / 2); // and make sure we don't go past the floor.
  }
  if (yPosition == h - (ballSize / 2)) { 
    v *= bounciness;
    xv *= roughness;
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

