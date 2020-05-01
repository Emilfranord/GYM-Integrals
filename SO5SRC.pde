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
  pointA(2, 4);
  renderFunction();
}

void cartesian() {
  stroke(0);
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

  stroke(100);
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

void renderFunction() {
  for (float i = -10; i<10; i+=0.001) {
    pointA(i,poly(i,0,0,0,0,0,0,0,0,0,0.125,0,-2));
  }
}

// returns the value of x given a tenth or lower polynomial. if something is 0, it just dissapears 
float poly(float x, float a, float b, float c, float d, float e, float f, float g, float h, float i, float j, float k, float l) {
  return a*pow(x, 10)+ b*pow(x, 9)+c*pow(x, 8)+d*pow(x, 7)+e*pow(x, 6)+f*pow(x, 5)+g*pow(x,4)+h*pow(x,4)+i*pow(x,3)+j*pow(x,2)+k*x+l;
  //pointA(i,poly(i,0,0,0,0,0,0,0,0,0,0,0,0));
}

// Output to a txt file.
// Make a config file?
