void setup(){
size(400, 400);
}

void draw(){
  
background(255*mouseX/800+255*mouseY/800, 255*mouseX/800+255*mouseY/800, 255*mouseX/800+255*mouseY/800);

noStroke();

//fingers
fill(255, 255, 255);
strokeWeight(1);
stroke(0, 0, 0);
//left fingers
triangle(77, 283, 74, 294, 82, 288);
triangle(84, 290, 84, 301, 90, 292);
triangle(92, 292, 95, 303, 100, 289);
//right fingers
triangle(323, 283, 326, 294, 318, 288);
triangle(316, 290, 316, 301, 310, 292);
triangle(308, 292, 305, 303, 300, 289);

//reset
noStroke();

//arm (left)
fill(0, 139, 139); //cyan
translate(120, 233);
rotate(-PI/3);
ellipse(0, 0, 140, 70);
rotate(PI/3);
translate(-120, -233);
//arm (right)
translate(280, 233);
rotate(PI/3);
ellipse(0, 0, 140, 70);
rotate(-PI/3);
translate(-280, -233);

//head
fill(0, 139, 139); //cyan
ellipse(200, 165, 120, 120); //head
fill(255, 237, 189); //tan
ellipse(200, 165, 100, 100); //face
fill(0, 139, 139); //cyan
triangle(200, 130, 182, 115, 218, 115); //face

//ear (left)
beginShape();
curveVertex(180, 109);
curveVertex(180, 109);
curveVertex(152, 100);
curveVertex(155, 126);
curveVertex(155, 126);
endShape();

//ear (right)
beginShape();
curveVertex(220, 109);
curveVertex(220, 109);
curveVertex(248, 100);
curveVertex(245, 126);
curveVertex(245, 126);
endShape();

//body
fill(0, 139, 139); //cyan
ellipse(200, 255, 220, 190); //body

//stomach
fill(255, 237, 189);
beginShape();
curveVertex(200, 156); //top middle
curveVertex(200, 156); //top middle
curveVertex(260, 175); //top right
curveVertex(290, 225); //middle right
curveVertex(270, 285); //bottom right
curveVertex(200, 275); //bottom middle
curveVertex(130, 285); //bottom left
curveVertex(110, 225); //middle left
curveVertex(140, 175); //top left
curveVertex(200, 156); //top middle
curveVertex(200, 156); //top middle
endShape();

//toes
fill(255, 255, 255);
strokeWeight(1);
stroke(0, 0, 0);
//left toes
triangle(109, 317, 102, 303, 114, 307);
triangle(115, 305, 113, 293, 124, 298);
triangle(127, 298, 126, 286, 136, 297);
//right toes
triangle(291, 317, 298, 303, 286, 307);
triangle(285, 305, 287, 293, 276, 298);
triangle(273, 298, 274, 286, 264, 297);

//foot (left)
fill(255, 237, 189);
translate(140, 325);
rotate(PI/5);
ellipse(0, 0, 70, 55);
fill(155, 103, 60);
ellipse(10, 5, 25, 20);
rotate(-PI/5);
translate(-140, -325);

//foot (right)
fill(255, 237, 189);
translate(260, 325);
rotate(-PI/5);
ellipse(0, 0, 70, 55);
fill(155, 103, 60);
ellipse(-10, 5, 25, 20);
rotate(PI/5);
translate(-260, -325);

/*
//toes
fill(255, 255, 255);
strokeWeight(1);
stroke(0, 0, 0);
//left toes
triangle(109, 317, 102, 303, 114, 307);
triangle(116, 305, 114, 293, 124, 299);
triangle(127, 298, 126, 286, 134, 297);
//right toes
triangle(291, 317, 298, 303, 286, 307);
triangle(284, 305, 286, 293, 276, 299);
triangle(273, 298, 274, 286, 266, 297);
*/

//reset
noStroke();

fill(255, 255, 255);
stroke(0, 0, 0);
strokeWeight(1);

//tooth (left)
beginShape();
curveVertex(182, 155); //tooth left bottom left
curveVertex(182, 155); //tooth left bottom left
curveVertex(186, 146); //tooth left top
curveVertex(190, 156); //tooth left bottom right
curveVertex(190, 156); //tooth left bottom right
endShape();

//tooth (right)
beginShape();
curveVertex(218, 155); //tooth left bottom left
curveVertex(218, 155); //tooth left bottom left
curveVertex(214, 146); //tooth left top
curveVertex(210, 156); //tooth left bottom right
curveVertex(210, 156); //tooth left bottom right
endShape();

//mouth
stroke(0, 0, 0);
strokeWeight(2);
curve(150, 150, 180, 155, 220, 155, 250, 150);

//eyes
curve(140, 143, 170, 138, 185, 138, 200, 143); //left
curve(260, 143, 230, 138, 215, 138, 200, 143); //right

fill(0, 0, 0);
} 


/*import processing.serial.*;
import cc.arduino.*;
Arduino arduino;

boolean dark = false;
float a;
boolean increasing = false;
float r = 0;
boolean r_exp = false;
float r_exp_var = 0;
class Beam {
  float x;
  float y;
  float decay = 0.98;
  float targetX = 200;
  float targetY = 150;
  color c;
  
  Beam() {
    float angle = random(TWO_PI);
    float radius = random(70, 120);
    x = targetX + cos(angle) * radius;
    y = targetY + sin(angle) * radius;
    
    c = color(255, 255, random(130, 230));
  }
  
  void update() {
    float dx = x - targetX;
    float dy = y - targetY;
    dx *= decay;
    dy *= decay;
    decay *= 0.99;
    
    x = targetX + dx;
    y = targetY + dy;
  }
  
  void display() {
    fill(c);
    noStroke();
    ellipse(x, y, 8, 8);
  }
}

ArrayList<Beam> beams = new ArrayList<Beam>();

public void setup() {
  size(400, 400);
  arduino = new Arduino(this, Arduino.list()[1], 57600); //change the [0] to a [1] or [2] etc. if your program doesn't work
}

public void draw() {
  background(192);
  float b = arduino.analogRead(5);
  float buttonOne = arduino.analogRead(1);
  //nightcap float ButtonTwo = arduino.analogRead(6);
  System.out.println(b);
  
  background(167, 167, 167);
  //float munchlax = cos(a-PI)+1;

  if (b < 150) {dark = true;} else {dark = false;}

  if (dark == true) {r += 0.25;} else {r = 0; r_exp_var = 0; beams.clear();}
  if (a > 2*PI) {increasing = false;}
  if (a < 0) {increasing = true;}
  if (increasing == true) {a += 0.01;}
  if (increasing == false) {a -= 0.01;}
  
  /*
  stroke(0);
  line(100, 350, munchlax*100+100, 350);
  translate(200, 150);
  ellipse(0, 0, r, r);
  translate(-200, -150);
  */
  
  if (dark == true) {r += 0.25;}
  if (dark == false) {r = 0; r_exp_var = 0;}
  
  if (r > 50) {r_exp = true;}
  if (r_exp == true) {
    r_exp_var = r_exp_var + 0.01/sqrt(r);
    r = pow(r, 1+r_exp_var);
  if (r > 1000) {r = 0; r_exp_var = 0; r_exp = false; beams.clear();}
}

int targetCount = int(2*r/3);

if (r > 0 && r < 45) {
  while (beams.size() < targetCount) {
    beams.add(new Beam());
  }
}

while (beams.size() > targetCount) {
  beams.remove(0);
}

noStroke();

//fingers
fill(255, 255, 255);
strokeWeight(1);
stroke(0, 0, 0);
//left fingers
triangle(77, 283, 74, 294, 82, 288);
triangle(84, 290, 84, 301, 90, 292);
triangle(92, 292, 95, 303, 100, 289);
//right fingers
triangle(323, 283, 326, 294, 318, 288);
triangle(316, 290, 316, 301, 310, 292);
triangle(308, 292, 305, 303, 300, 289);

//reset
noStroke();

//arm (left)
fill(0, 139, 139); //cyan
translate(120, 233);
rotate(-PI/3);
ellipse(0, 0, 140, 70);
rotate(PI/3);
translate(-120, -233);
//arm (right)
translate(280, 233);
rotate(PI/3);
ellipse(0, 0, 140, 70);
rotate(-PI/3);
translate(-280, -233);

//head
fill(0, 139, 139); //cyan
ellipse(200, 165, 120, 120); //head
fill(255, 237, 189); //tan
ellipse(200, 165, 100, 100); //face
fill(0, 139, 139); //cyan
triangle(200, 130, 182, 115, 218, 115); //face

fill(0, 139, 139);
if (buttonOne != 1023) {
  //ear (left)
  beginShape();
  curveVertex(180, 109);
  curveVertex(180, 109);
  curveVertex(152, 100);
  curveVertex(155, 126);
  curveVertex(155, 126);
  endShape();
  
  //ear (right)
  beginShape();
  curveVertex(220, 109);
  curveVertex(220, 109);
  curveVertex(248, 100);
  curveVertex(245, 126);
  curveVertex(245, 126);
  endShape();
}

//body
fill(0, 139, 139); //cyan
ellipse(200, 255, 220, 190); //body

//stomach
fill(255, 237, 189);
beginShape();
curveVertex(200, 156); //top middle
curveVertex(200, 156); //top middle
curveVertex(260, 175); //top right
curveVertex(290, 225); //middle right
curveVertex(270, 285); //bottom right
curveVertex(200, 275); //bottom middle
curveVertex(130, 285); //bottom left
curveVertex(110, 225); //middle left
curveVertex(140, 175); //top left
curveVertex(200, 156); //top middle
curveVertex(200, 156); //top middle
endShape();

//mouf
if (dark == true && buttonOne != 1023) {
  fill(255, 108, 108);
  ellipse(200, 156, 60, 30);
  fill(255, 237, 189);
  ellipse(200, 205, 150, 88);
  
}
if (dark == true && buttonOne == 1023) {
  noStroke();
  fill(255, 108, 108);
  rect(172, 153, 56, 6);

}

//toes
fill(255, 255, 255);
strokeWeight(1);
stroke(0, 0, 0);
//left toes
triangle(109, 317, 102, 303, 114, 307);
triangle(115, 305, 113, 293, 124, 298);
triangle(127, 298, 126, 286, 136, 297);
//right toes
triangle(291, 317, 298, 303, 286, 307);
triangle(285, 305, 287, 293, 276, 298);
triangle(273, 298, 274, 286, 264, 297);

//foot (left)
fill(255, 237, 189);
translate(140, 325);
rotate(PI/5);
ellipse(0, 0, 70, 55);
fill(155, 103, 60);
ellipse(10, 5, 25, 20);
rotate(-PI/5);
translate(-140, -325);

//foot (right)
fill(255, 237, 189);
translate(260, 325);
rotate(-PI/5);
ellipse(0, 0, 70, 55);
fill(155, 103, 60);
ellipse(-10, 5, 25, 20);
rotate(PI/5);
translate(-260, -325);

//reset
noStroke();

fill(255, 255, 255);
stroke(0, 0, 0);
strokeWeight(1);

//tooth (left)
if (dark == false && buttonOne != 1023) {
  beginShape();
  curveVertex(182, 155); //tooth left bottom left
  curveVertex(182, 155); //tooth left bottom left
  curveVertex(186, 146); //tooth left top
  curveVertex(190, 156); //tooth left bottom right
  curveVertex(190, 156); //tooth left bottom right
  endShape();
  
  //tooth (right)
  beginShape();
  curveVertex(218, 155); //tooth left bottom left
  curveVertex(218, 155); //tooth left bottom left
  curveVertex(214, 146); //tooth left top
  curveVertex(210, 156); //tooth left bottom right
  curveVertex(210, 156); //tooth left bottom right
  endShape();
} else {
//toof teef
}

//mouth

strokeWeight(2);

if (dark == false) {
  stroke(0, 0, 0);
  strokeWeight(2);
  curve(150, 150, 180, 155, 220, 155, 250, 150);
}

//eyes
curve(140, 143, 170, 138, 185, 138, 200, 143); //left
curve(260, 143, 230, 138, 215, 138, 200, 143); //right

//sensei wu
if (buttonOne == 1023) {
  //hat
  noStroke();
  fill(0, 0, 0, 70);
  arc(200, 165, 120, 120, PI+QUARTER_PI/2, 2*PI-QUARTER_PI/2, OPEN);
  fill(200, 175, 110);
  triangle(120, 130, 280, 130, 200, 90);
  strokeWeight(2);
  stroke(175, 150, 90);
  line(200, 90, 135, 130);
  line(200, 90, 155, 129);
  line(200, 90, 175, 130);
  line(200, 90, 200, 130);
  line(200, 90, 225, 130);
  line(200, 90, 245, 129);
  line(200, 90, 265, 130);
  
  //beard
  noStroke();
  fill(255, 255, 255);
  //left
  triangle(200, 148, 180, 143, 170, 148);
  rect(170, 148, 30, 5);
  triangle(170, 148, 178, 148, 180, 195);
  //right
  triangle(200, 148, 220, 143, 230, 148);
  rect(200, 148, 30, 5);
  triangle(230, 148, 222, 148, 220, 195);
  //main beard
  beginShape();
  curveVertex(176, 159);
  curveVertex(176, 159);
  curveVertex(200, 220);
  curveVertex(224, 159);
  curveVertex(224, 159);
  endShape();
}

fill(255, 255, 255);
noStroke();

//hyper beam
translate(200, 150);
noStroke();
ellipse(0, 0, r, r);
translate(-200, -150);

for (int i = 0; i < beams.size(); i++) {
  Beam beam = beams.get(i);
  beam.update();
  beam.display();
}

noFill();
noStroke();
fill(255, 255, 210);
ellipse(200, 150, r, r);

fill(0, 0, 0);

//text(mouseX+", "+mouseY, 350, 380);
println(dark);
}
*/
