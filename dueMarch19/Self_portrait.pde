//Self-portrait - Alia Waleed

//frame-size
size (200, 200);

//sky
fill(173,221,230);
rect(1,1,200,200);

//blouse
fill(255,192,203);
stroke(0);
strokeWeight(2);

beginShape();
vertex(53, 200);
vertex(53,160);
vertex(63, 151);
vertex(147,149);
vertex(155,163);
vertex(150,200);
vertex(53,200);
endShape();

//hair
fill(90, 56, 37);
stroke(0);
strokeWeight(2);
//curls/waves
beginShape();
vertex(111, 26);
vertex(96, 12);
vertex(65, 21);
vertex(35,72);
vertex(41,89);
vertex(34,110);
vertex(40,112);
vertex(40,129);
vertex(43,137);
vertex(43,160);
vertex(62,142);
vertex(58,160);
vertex(125,160);
vertex(149,155);
vertex(137,140);
vertex(141,128);
vertex(152,143);
vertex(152,112);
vertex(158,102);
vertex(135,24);
vertex(111,25);
endShape ();

//neck
fill(248, 218, 195);
stroke(0);
strokeWeight(2);

beginShape();
vertex(120,109);
vertex(89,123);
vertex(89,142);
vertex(80,160);
vertex(87,163);
vertex(94,165);
vertex(106,163);
vertex(115,160);
vertex(108,142);
endShape ();

//face
fill(248, 218, 195);
stroke(0);
strokeWeight(2);
ellipse (100, 85, 70, 95);

//eyebrows
fill(90, 56, 37);
stroke(0);
strokeWeight(2);
line(78,68,93,68);
line(108,68,125,68);

//left eye
fill(255);
stroke(0);
strokeWeight(1);
ellipse (85, 78, 13,10);
//pupil
fill(139,69,19);
stroke(0);
strokeWeight(1);
ellipse (85, 78, 5,5);

//right eye
fill(255);
stroke(0);
strokeWeight(1);
ellipse (115, 78, 15,10);
//pupil
fill(139,69,19);
stroke(0);
strokeWeight(1);
ellipse (115, 78, 5,5);

//lips
fill(183, 36, 56);

beginShape();
vertex(80,110);
vertex(100,118);
vertex(120,110);
endShape ();

//nose
fill(248, 218, 195);
stroke(210,180,140);
strokeWeight(1.5);
triangle(95, 100, 100, 90, 105, 100);
