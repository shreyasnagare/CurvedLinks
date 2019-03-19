var LABEL_SIZE = 14
var LINK_WIDTH = 2
var ARROW_HEAD_LENGTH = 10

function setup() {
  createCanvas(300, 300);
  drawLink(100, 100, 200, 200, 0.2, "A -> B")
  //drawLink(200, 200, 100, 100, 0.25, "B -> A")
  //drawLink(100, 100, 200, 200, 0, "A -> B")
}

function draw() {

}

// positive curvature => clockwise direction curve
// curve = 0 => straight line
function drawLink(x1, y1, x2, y2, curvature, label){
  var l = Math.sqrt(Math.pow(x2 - x1, 2) + Math.pow(y2 - y1, 2));
  var a = Math.atan2(y2 - y1, x2 - x1);
  var d = l * curvature;
  var x = (x1 + x2) / 2 + d * Math.cos(a - Math.PI / 2);
  var y = (y1 + y2) / 2 + d * Math.sin(a - Math.PI / 2);
  push();
  fill(0);
  translate(x, y);  
  rotate(a);
  textSize(LABEL_SIZE);
  text(label, 0, 0); 
  pop();
  noFill();
  stroke(0);
  strokeWeight(LINK_WIDTH);
  bezier(x1, y1, x, y, x, y, x2, y2);
  drawArrow(x2, y2, x, y, ARROW_HEAD_LENGTH);
}

function drawArrow(headX, headY, cx, cy, length){
  var a = Math.atan2(headY - cy, headX - cx);
  push();
  translate(headX, headY);
  rotate(a + Math.PI/4);
  stroke(0);
  line(0, 0, 0, length);
  line(0, 0, -length, 0);
  pop();
}
