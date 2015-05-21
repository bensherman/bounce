void setup(){
  size(1000,950);
  background(255);
  smooth(8);
  int triangleSize=height/20;
  int x = 0;
  int y = 0;
  noStroke();
  for(int i=0; i < width; i += triangleSize){
    for(int j=0; j < height; j += triangleSize){
      int redish = int(random(1,10));
      int greenish = int(random(180,200));
      int blueish = int(random(200,220));
      float r = random(0,100);
      if (r > 99){
        fill(0);
      } else if (r < 5){
        fill(0,0,200);
      } else {
        fill (redish, greenish, blueish);
      }
      int ax = x;
      int ay = y + triangleSize;
      int bx = x + triangleSize; 
      int by = y + triangleSize;
      int cx = x + triangleSize/2;
      int cy = y;
      triangle(ax, ay, bx, by, cx, cy);
      y += triangleSize;
    }
    y = 0;
    x += triangleSize;
  }
}


void draw(){
    int triangleSize=height/20;
  int x = 0;
  int y = 0;
  noStroke();
  for(int i=0; i < width; i += triangleSize){
    for(int j=0; j < height; j += triangleSize){
      int ax = x;
      int ay = y + triangleSize;
      int bx = x + triangleSize; 
      int by = y + triangleSize;
      int cx = x + triangleSize/2;
      int cy = y;
      if(mousePressed && insideTriangle(ax,ay,bx,by,cx,cy,mouseX,mouseY)){
        color fillcolor = get(mouseX,mouseY);
        int r = (fillcolor >> 16) & 0xFF;  // Faster way of getting red(fillcolor)
        int g = (fillcolor >> 8) & 0xFF;   // Faster way of getting green(fillcolor)
        int b = fillcolor & 0xFF;
        r *= .90;
        g *= .90;
        b *= .90;
        fill(r,g,b);
      } else {
        noFill();
      }
      triangle(ax, ay, bx, by, cx, cy);
      ax = x;
      ay = y + triangleSize;
      bx = x - triangleSize / 2; 
      by = y;
      cx = x + triangleSize/2;
      cy = y;
      if(mousePressed && insideTriangle(ax,ay,bx,by,cx,cy,mouseX,mouseY)){
        color fillcolor = get(mouseX,mouseY);
        int r = (fillcolor >> 16) & 0xFF;  // Faster way of getting red(fillcolor)
        int g = (fillcolor >> 8) & 0xFF;   // Faster way of getting green(fillcolor)
        int b = fillcolor & 0xFF;
        r *= .90;
        g *= .90;
        b *= .90;
        fill(r,g,b);
      } else {
        noFill();
      }
      triangle(ax, ay, bx, by, cx, cy);
      y += triangleSize;    
    }
    y = 0;
    x += triangleSize;
  }
}

boolean insideTriangle(int ax, int ay, int bx, int by, 
                    int cx, int cy, int x, int y){
  /* figure out if a point is inside of a triangle.
     make a triangle out each of the vertexes and the x,y 
     of the point to be diescovered.  sum area.  if equal, 
     point is inside.  if greater, it is not.
  */
 float total = triangleArea(ax, ay, bx, by, cx, cy);
 float ta = triangleArea(x, y, bx, by, cx, cy);
 float tb = triangleArea(ax, ay, x, y, cx, cy);
 float tc = triangleArea(ax, ay, bx, by, x, y);
 return (ta + tb + tc == total);
}

float triangleArea(int ax, int ay, int bx, int by, int cx, int cy){
  int ta = ax - cx;
  int tb = ay - cy;
  int tc = bx - cx;
  int td = by - cy;
  float area = (.5 * (abs((ta*td) - (tb*tc))));
  return area;
}

  

