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
