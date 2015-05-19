float g = 9.804;
int frameRate = 30;

class Ball {
  color mycolor;
  float xpos;
  float ypos;
  float xspeed;  // positive is right
  float yspeed;  // positive is down
  float bounciness; 
  float roughness;
  float size;
  float age;
  
  Ball(color aColor, float aXpos, float aYpos, float aSize, float aBounciness, float aRoughness){
    mycolor = aColor;
    xpos = aXpos;
    ypos = aYpos;
    size = aSize;
    bounciness = aBounciness;
    roughness = aRoughness;
    xspeed = random(-10, 10);
    age = 0;
  }
    
  void display(){
    fill(mycolor);
    ellipse(xpos, ypos, size, size);
  }
  
  void move(){
    yspeed = yspeed + force();
    xpos += xspeed;
    ypos += yspeed;
    if ( xpos >= width - ( size / 2 )) {
      xpos = width - (size / 2);
      xspeed *= -1 * bounciness;     
    }
    if ( xpos <= size / 2 ) {
      xpos = size / 2;
      xspeed *= -1 * bounciness;
    }
    if ( ypos > height - ( size / 2 )) {
      yspeed *= -1 * bounciness;
      ypos = height - (size/2);  
    }
    if ( ypos == height - ( size / 2 )) {
     xspeed *= roughness;
    }
  } 
  
  void status(){
    println(xpos, ypos, yspeed, xspeed);
  }

  float force(){
    return g / frameRate;
  }

  void age(){
    age += 1;
  }  
  
  void shrink(float i){
    if (size > 0) {
        size -= i;
    }
  }
}

ArrayList<Ball> balls = new ArrayList<Ball>();

void setup(){
  size(640, 480, P2D);
}

void draw(){
  background(255, 192, 0);
  if (balls.size() > 0) {
    for (int i=0; i < balls.size(); i++){
      Ball ball = balls.get(i);
      ball.display();
      ball.move();
      ball.age();
      if (ball.age > 20 * frameRate ){
        ball.shrink(2.0/frameRate);
      }
      println(ball.age, ball.size);
      println("balls: ", balls.size()); 
      if (ball.size < 1) {
        balls.remove(i);
      }
    }
  } else {
    println("no more balls");
  }
}

void mouseClicked(){
  balls.add(new Ball(255, mouseX, mouseY, 50, .90, .90));
}
