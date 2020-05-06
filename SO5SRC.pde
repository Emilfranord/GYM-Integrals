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
  
  //pointA(2, 4);
  pointA(4, glassFunction(4));
  renderFunction();
  //rectangelIntegration(4);
}

void cartesian() {
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
  for (float i = 0; i<20; i+=precision) {
    if (0<i && i<1.97046) {
      pointA(i, 1/(i+0.5));
      //println("hi");
    }
    if (i>1.97046 && i<6.91583) {
      pointA(i, (exp(i)/1500)+0.4);
    }

    if (i>6.91583 && i<11.9898) {
      pointA(i, -i*i+19*i-82.5);
    }

    if (i>11.9898 && i<13) {
      pointA(i, tan(i+1)+1.1);
    }
  }
}

float glassFunction(float j) { // returns the value of the function given some number.
  if (0<j && j<1.97046) {
    return  1/(j+0.5);
  }
  if (j>1.97046 && j<6.91583) {
    return (exp(j)/1500)+0.4;
  }
  if (j>6.91583 && j<11.9898) {
    return -j*j+19*j-82.5;
  }
  if (j>11.9898 && j<13) {
    return tan(j+1)+1.1;
  }
  return -1;
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
