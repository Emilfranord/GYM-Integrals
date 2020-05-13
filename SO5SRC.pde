float precision = 4.0; // the same as \Delta x.
final float EXPECTED_INTEGRAL = 35.6775400000;
boolean showLeft, showAverage, showTrapetz, showSimpsons;

Integral leftInt = new LeftIntegral();
Integral averageInt = new AverageIntegral();
Integral rightInt = new RightIntegral();
Integral traInt = new TrapetzIntegral();
GlassFunction theGlass = new GlassFunction();

//Functor[] secondFunctionList = {};
//float[] secondBreakList = {};
//GlassFunction secondGlass = new GlassFunction(secondFunctionList, secondBreakList);

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

void grid() { // draws certical and horisontal lines every 50 pixels.
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
  pointA(x, y, #000000);
}

void pointA(float x, float y, color c) { 
  strokeWeight(2);
  stroke(c);
  point(y*50, x*50);
  stroke(100);
}

// the function section.
void renderFunction() {
  strokeWeight(1);
  stroke(0);
  for (float x = 0; x<20; x+=precision) {
    pointA(x, theGlass.call(x));
  }
}

float time(int cycles, int methode, float precision) {
  //time measuring system
  int t = millis();
  for (int c = 0; c<cycles; c++) {
    if (methode == 0) {
      leftInt.call(theGlass, precision);
    }
    if (methode == 1) {
      averageInt.call(theGlass, precision);
    }
    if (methode == 2) {
      rightInt.call(theGlass, precision);
    }
    if (methode == 3) {
      traInt.call(theGlass, precision);
    }
  }
  return (millis()-t)/cycles; // returns the time it takes to do one function.
}

float time(int cycels, int methode) {
  return time(cycels, methode, precision);
}

// exampels of Functor objects.

//Functor inverse = new Inverse(0.5, 1);
//Functor exponential = new Exponential(1500, 0.4);
//Functor secondDegreePolynomial = new SecondDegreePolynomial(-1, 19, -82.5);
//Functor tangens = new Tangens(1, 1.1);
//Functor[] functions = {new Inverse(0.5, 1), new Exponential(1500, 0.4), new SecondDegreePolynomial(-1, 19, -82.5), new Tangens(1, 1.1)};
//float[] breaks = {0, 1.97046, 6.91583, 11.9898, 13};

//float[] second = {-82.5, 19.0, -1.0};
//float[] fourth = {5,7,7,8};

//Functor[] functions = {}; 
//Functor[] functions = {new Inverse(0.5, 1), new Exponential(1500, 0.4), new SecondDegreePolynomial(-1, 19, -82.5), new Tangens(1, 1.1)};
// lists the order the functions will be in and their arguments/ parameters 
//float[] breaks = {0, 1.97046, 6.91583, 11.9898, 13};
// lists for what values of x the functions will be defined. the upper bound and lower bound is shared between two adjesent functions. 

//Functor glass = new GlassFunction(functions, breaks); //functions, breaks, using specific arrays
//Functor glass = new GlassFunction(); //functions, breaks, using default cases 

// The integral rendering section.
void renderLeftIntegral() {
  for (float i = 0; i<20; i+=precision) {
    rect(theGlass.call(i)*50, i*50, -theGlass.call(i)*50, precision*50);
  }
}

void renderAverageIntegral() {
  for (float i = 0; i<20; i+=precision) {
    rect(0, i*50, theGlass.call(i+precision/2)*50, precision*50);
  }
}

void renderTrapezoidalIntegral() {
  for (float i = 0; i<20; i+=precision) {
    quad(0, i*50, 0, (i+precision)*50, theGlass.call(i+precision)*50, (i+precision)*50, theGlass.call(i)*50, (i)*50 );
  }
}

// sidebar controll 
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

void sidebar() {  // shows all relavent data, and % error from the expected value. 
  float integralLeft = leftInt.call(theGlass, precision);
  float integralRight = rightInt.call(theGlass, precision);
  float integralAver = averageInt.call(theGlass, precision);
  float integralTrap = traInt.call(theGlass, precision);

  fill(0);
  rotate(-3*PI/2); // rotates the field to have left to right text.
  text("\u0394x: "+precision, 1020, -950);
  //  text("# dots: "+22, 1020, -940); // change 22 to the real number.
  text("True: " +EXPECTED_INTEGRAL, 1020, -900);

  text("Left: "+ integralLeft + 
    "\n %"+ (integralLeft - EXPECTED_INTEGRAL)/ EXPECTED_INTEGRAL, 1020, -850);

  text("Right: "+ integralRight + 
    "\n %"+ (integralRight- EXPECTED_INTEGRAL)/ EXPECTED_INTEGRAL, 1020, -800);

  text("Average: "+integralAver+ 
    "\n %"+ (integralAver - EXPECTED_INTEGRAL)/ EXPECTED_INTEGRAL, 1020, -750);

  text("Trapezoidal: "+integralTrap+ 
    "\n %"+ (integralTrap - EXPECTED_INTEGRAL)/ EXPECTED_INTEGRAL, 1020, -700);

  text("Show Left", 1020, -600);
  text("Show Average", 1020, -550); 
  text("Show Trapezoidal", 1020, -500);
  //text("Show Simpsons", 1020, -450);

  text("Increase Precision", 1020, -350);
  text("Decrease Precision", 1020, -300);
  rotate(3*PI/2);
}
