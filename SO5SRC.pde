float precision = 4.0; // the same as \Delta x.
final float EXPECTED_INTEGRAL = 35.6775400000;
boolean showLeft, showAverage, showTrapetz, showSimpsons;

Integral leftInt = new LeftIntegral();
Integral averageInt = new AverageIntegral();
Integral rightInt = new RightIntegral();
Integral traInt = new TrapetzIntegral();
Integral simpKeperInt = new SimpsonsIntegral();
GlassFunction theGlass = new GlassFunction();

void setup() {
  size(1200, 1000);
  // scale is 1:50
}

void draw() {
  translate(0, height);
  rotate(3*PI/2); // this makes cordinates (y;x) instead.
  background(200);
  cartesian(); // cordinate system
  grid(); // gray grid
  sidebar(); // info the the side
  renderFunction(); // draws the dots in the function. 

  // renders integrals based on the choosen one.
  fill(50, 25);
  if (showLeft) {
    renderLeftIntegral();
  }
  if (showAverage) {
    renderAverageIntegral();
  }
  if (showTrapetz) {
    renderTrapezoidalIntegral();
  }
}

void cartesian() { // draws the axies and numbers.
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

void grid() { // draws vertical and horizontal lines every 50 pixels.
  stroke(100);
  strokeWeight(1);
  for (int i=0; i<40; i++) {
    line(-1000, -1000+50*i, 1000, -1000+50*i);
  }

  for (int i=0; i<40; i++) {
    line(-1000+50*i, -1000, -1000+50*i, 1000);
  }
}

void pointA(float x, float y) { 
  pointA(x, y, #000000); // if no color is specified, use black
}

void pointA(float x, float y, color c) {
  strokeWeight(2);
  stroke(c);
  point(y*50, x*50); // this reverses the problem caused by rotate.
  stroke(100);
}

// the function section.
void renderFunction() {
  renderFunction(theGlass);
}

void renderFunction(Functor f){
  strokeWeight(1);
  stroke(0);
  for (float x = 0; x<20; x+=precision) {
    pointA(x, f.call(x));
  }
}

//time measuring system
float time(int cycles, Integral methode, float precision) {
  int t = millis();
  for (int c = 0; c<cycles; c++) {
    method.call(theGlass, precision);
  }
  return (millis()-t)/cycles; // returns the time it takes to do one function.
}

float time(int cycels, Integral methode) {
  return time(cycels, methode, precision); // less specific case that uses the global precision
}

// The integral rendering section.
void renderLeftIntegral(Functor f) {
  for (float i = 0; i<20; i+=precision) {
    rect(f.call(i)*50, i*50, -f.call(i)*50, precision*50);
  }
}

void renderAverageIntegral(Functor f) {
  for (float i = 0; i<20; i+=precision) {
    rect(0, i*50, f.call(i+precision/2)*50, precision*50);
  }
}

void renderTrapezoidalIntegral(functor f) {
  for (float i = 0; i<20; i+=precision) {
    quad(0, i*50, 0, (i+precision)*50, f.call(i+precision)*50, (i+precision)*50, f.call(i)*50, (i)*50 );
  }
}

// sidebar control
void mousePressed() {
  if (mouseY >390 && mouseY <400 && mouseX < 1100 && mouseX >1000) { // related to show left
    showLeft = true;
    showAverage = false;
    showTrapetz = false;
    showSimpsons = false;
  }

  if (mouseY >440 && mouseY <450 && mouseX < 1100 && mouseX >1000) { // related to show Average
    showLeft = false;
    showAverage = true;
    showTrapetz = false;
    showSimpsons = false;
  }
  if (mouseY >480 && mouseY <500 && mouseX < 1100 && mouseX >1000) { // related to show Trapetz
    showLeft = false;
    showAverage = false;
    showTrapetz = true;
    showSimpsons = false;
  }

  if (mouseY >640 && mouseY <660 && mouseX < 1100 && mouseX >1000) { // related to increase pre
    precision/=2;
  }
  if (mouseY >690 && mouseY <700 && mouseX < 1100 && mouseX >1000) { // related to decrease pre 
    precision*=2;
  }
}

// sidebar rendering

void sidebar(Functor f) {  // shows all relavent data, and % error from the expected value. 
  float integralLeft = leftInt.call(f, precision);
  float integralRight = rightInt.call(f, precision);
  float integralAver = averageInt.call(f, precision);
  float integralTrap = traInt.call(f, precision);
  float integralSimp = simpKeperInt.call(f, precision);

  fill(0);
  rotate(-3*PI/2); // rotates the field to have left to right text.
  text("\u0394x: "+precision, 1020, -950);
  text("True: " +EXPECTED_INTEGRAL, 1020, -900);

  String format = "%s: %d \n %% %d"
  String left = String.join(format,"Left", integralLeft, (integralLeft - EXPECTED_INTEGRAL)/ EXPECTED_INTEGRAL);
  String right = String.join(format,"Right", integralRight, (integralRight - EXPECTED_INTEGRAL)/ EXPECTED_INTEGRAL);
  String ave = String.join(format,"Average", integralAver, (integralAver - EXPECTED_INTEGRAL)/ EXPECTED_INTEGRAL);
  String trap = String.join(format,"Trapezoidal", integralTrap, (integralTrap - EXPECTED_INTEGRAL)/ EXPECTED_INTEGRAL);

  text(left, 1020, -850);
  text(right, 1020, -800);
  text(ave, 1020, -750);
  text(trap, 1020, -700);

  text("Show Left", 1020, -600);
  text("Show Average", 1020, -550); 
  text("Show Trapezoidal", 1020, -500);
  //text("Show Simpsons", 1020, -450);

  text("Increase Precision", 1020, -350);
  text("Decrease Precision", 1020, -300);
  rotate(3*PI/2);
}
