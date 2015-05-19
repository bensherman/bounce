float g = 9.804;
int fr = 30;

class Ball {
  color mycolor;
  float xpos;
  float ypos;
  float xspeed;  // positive is right
  float yspeed;  // positive is down
  float bounciness; 
  float roughness;
  float size;
  
  Ball(color aColor, float aXpos, float aYpos, float aSize, float aBounciness, float aRoughness){
    mycolor = aColor;
    xpos = aXpos;
    ypos = aYpos;
    size = aSize;
    bounciness = aBounciness;
    roughness = aRoughness;
    xspeed = random(-10, 10);
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
      println("boing");   
    }
    if ( ypos == height - ( size / 2 )) {
     xspeed *= roughness;
     println("slow");
    }
  } 
  void status(){
    println(xpos, ypos, yspeed, xspeed);
  }

  float force(){
    return g / fr;
  }  
}

Ball b;

void setup(){
  size(640, 480, P2D);
  frameRate = fr;
  b = new Ball(255, width/2, height/2, 50, .90, .90);
}

void draw(){
  background(255, 192, 0);
  b.display();
  b.move();
  b.status();
}

void mouseClicked(){
  b = new Ball(255, mouseX, mouseY, 50, .90, .90);
}
