final int ARROW_HEAD_LENGTH = 10;
final int LABEL_SIZE = 18;
final int LINK_THICKNESS = 2;

void setup(){
  size(300, 300);
  background(255);
  drawLink(100, 100, 200, 200, 0.2, "A->B"); //A -> B
  //drawLink(200, 200, 100, 100, 0.25, "B->A"); //B -> A
  //drawLink(100, 100, 200, 200, 0, "A->B");
};

void draw(){
}

// positive curvature => clockwise direction curve
// curve = 0 => straight line
void drawLink(float x1, float y1,float x2, float y2, float curvature, String label){
  double l = Math.sqrt(Math.pow(x2 - x1, 2) + Math.pow(y2 - y1, 2));
  double a = Math.atan2(y2 - y1, x2 - x1);
  println(a);
  double d = l * curvature;
  float x = (float)((x1 + x2) / 2 + d * Math.cos(a - Math.PI / 2));
  float y = (float)((y1 + y2) / 2 + d * Math.sin(a - Math.PI / 2));
  pushMatrix();
  fill(0);
  translate((float)x, (float)y);  
  rotate((float )a);
  textSize(LABEL_SIZE);
  text(label, 0, 0); 
  popMatrix();
  noFill();
  stroke(0);
  strokeWeight(LINK_THICKNESS);
  bezier(x1, y1, x, y, x, y, x2, y2);
  drawArrow(x2, y2, x, y, ARROW_HEAD_LENGTH);
}

void drawArrow(float headX, float headY, double cx, double cy, int length){
  double a = Math.atan2(headY - cy, headX - cx);
  pushMatrix();
  translate(headX, headY);
  rotate((float)(a + Math.PI/4));
  stroke(0);
  line(0, 0, 0, length);
  line(0, 0, -length, 0);
  popMatrix();
}
