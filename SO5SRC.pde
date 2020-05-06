float precision = 4.0;

void setup() {
  size(1000, 1000);
  // scale is 1:50
}

void draw() {
  translate(0, height);
  rotate(3*PI/2); // this makes cordinates to (y;x) instead.
  println((mouseY-500) +" ; "+(mouseX-500));
  background(200);
  cartesian();
  grid();
  pointA(2, 4);
  renderFunction();
  //rectangelIntegration(4);
}

void cartesian(){
  stroke(0);
  strokeWeight(4);

  line(-1000, 0, 1000, 0);
  line(0, -1000, 0, 1000);

  for (int i=0; i<40; i++) {
    if (i!=0) {
      line(0, 0+50*i, 10, 0+50*i);
      line(0+50*i, 0, 0+50*i, 10);

      fill(0);
      rotate(-3*PI/2);
      text(20-i, 20, -1000+50*i); // up
      text(-10+i, -500+50*i, -25); // right
      rotate(3*PI/2);
    }
  }
}

void grid() {
  stroke(100);
  strokeWeight(1);
  for (int i=0; i<40; i++) {
    line(-1000, -1000+50*i, 1000, -1000+50*i);
  }

  for (int i=0; i<40; i++) {
    line(-1000+50*i, -1000, -1000+50*i, 1000);
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

// Output to a txt file.
// Make a config file?
// Numerical integration.

void renderFunction() {
  strokeWeight(1);
  for (float i = -10; i<10; i+=precision) {
  }
}

void keyPressed() {
  if (key=='1') {
    precision*=2;
  }
  if (key=='2') {
    precision/=2;
  }
  if (key=='3') {
    precision*=10;
  }
  if (key=='4') {
    precision/=10;
  }
}
