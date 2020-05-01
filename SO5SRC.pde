void setup() {
  size(1000, 1000);
  // scale is 1:50
}

void draw() {
  translate(width/2, height/2);
  rotate(3*PI/2); // this makes cordinates to (y;x) instead.
  println((mouseY-500) +" ; "+(mouseX-500));

  cartesian();
  grid();
  pointA(2,4);
  renderFunction();
}

void cartesian() {
  strokeWeight(4);

  line(-500, 0, 500, 0);
  line(0, -500, 0, 500);

  for (int i=0; i<20; i++) {
    if (i!=10) {
      line(0, -500+50*i, 10, -500+50*i);
      line(-500+50*i, 0, -500+50*i, 10);

      fill(0);
      rotate(-3*PI/2);
      text(10-i, 20, -500+50*i);
      text(-10+i, -500+50*i, 20);
      rotate(3*PI/2);
    }
  }
}


void grid() {
  fill(100);
  strokeWeight(1);
  for (int i=0; i<20; i++) {
    line(-500, -500+50*i, 500, -500+50*i);
  }
  
   for (int i=0; i<20; i++) {
     line(-500+50*i, -500, -500+50*i, 500);
  }
}


void pointA(float x, float y) { // this reverses the problem caused by rotate.
  strokeWeight(6);
  point(y*50, x*50);
}

void pointA(float x, float y, color c) { 
  strokeWeight(6);
  fill(c);
  point(y*50, x*50);
}

void renderFunction(){
for(float i = -10;i<10;i+=0.001){
  pointA(i,i);
}



}
