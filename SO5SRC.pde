float precision = 4.0; // the same as \Delta x.
final float EXPECTED_INTEGRAL = 35.6775400000;
boolean showLeft, showAverage, showTrapetz , showSimpsons;

void setup() {
  size(1200, 1000);
  // scale is 1:50
}

void draw() {
  translate(0, height);
  rotate(3*PI/2); // this makes cordinates to (y;x) instead.
  background(200);
  cartesian(); // cordinate system
  grid(); // gray grid
  sidebar(); // info on
  renderFunction();

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
    pointA(x, glassFunction(x));
  }
}

float time(int cycles ){
  //time measuring system
  int t = millis();
  for (int c = 0; c<cycles; c++) {
    //leftIntegral();
    //averageIntegral();
    //trapezoidalIntegral();
  }
  return (millis()-t)/cycles; // returns the time it takes to do one function.

}

float glassFunction(float x) { // returns the value of the function given some number.
  //return tests(x);

  return glass.call(x);
}

//Functor inverse = new Inverse(0.5, 1);
//Functor exponential = new Exponential(1500, 0.4);
//Functor secondDegreePolynomial = new SecondDegreePolynomial(-1, 19, -82.5);
//Functor tangens = new Tangens(1, 1.1);
//Functor[] functions = {new Inverse(0.5, 1), new Exponential(1500, 0.4), new SecondDegreePolynomial(-1, 19, -82.5), new Tangens(1, 1.1)};
//float[] breaks = {0, 1.97046, 6.91583, 11.9898, 13};


Functor[] functions = {new Exponential(1500,5), new StraightLine(2.5, -5)}; 
  // lists the order the functions will be in and their arguments/ parameters 
float[] breaks = {4, 6, 10}; 
  // lists for what values of x the functions will be defined. the upper bound and lower bound is shared between two adjesent functions. 

Functor glass = new GlassFunction(functions,breaks); //functions, breaks, using specific arrays
//Functor glass = new GlassFunction(); //functions, breaks, using default cases 


// The integral section.
void renderLeftIntegral() {
  for (float i = 0; i<20; i+=precision) {
    rect(glassFunction(i)*50, i*50, -glassFunction(i)*50, precision*50);
  }
}

float leftIntegral(float lowerBound, float upperBound ) {
  float sum = 0;
  for (float x = lowerBound; x<upperBound; x+=precision) {
    sum += glassFunction(x)*precision;
  }
  return sum;
}

float leftIntegral() {
  return leftIntegral(0, 20); // default case if there are no arguments. 
}

void renderAverageIntegral() {
  for (float i = 0; i<20; i+=precision) {
    rect(0, i*50, glassFunction(i+precision/2)*50, precision*50);
  }
}

float averageIntegral(float lowerBound, float upperBound) {
  float sum = 0;
  for (float x = lowerBound; x< upperBound; x+=precision) {

    sum += glassFunction(x + precision/2)*precision;
  }
  return sum;
}

float averageIntegral() {
  return averageIntegral(0, 20);
}

void renderTrapezoidalIntegral() {
  for (float i = 0; i<20; i+=precision) {
    quad(0, i*50, 0, (i+precision)*50, glassFunction(i+precision)*50, (i+precision)*50, glassFunction(i)*50, (i)*50 );
  }
}

float trapezoidalIntegral(float lowerBound, float upperBound) {
  float sum = 0;
  for (float x = lowerBound; x< upperBound; x+=precision) {

    sum += precision * (glassFunction((x)+precision) + glassFunction(x))/2;
  }
  return sum;
}

float trapezoidalIntegral() {
  return trapezoidalIntegral(0, 20);
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

  if (mouseY >640 && mouseY <660 && mouseX < 1100 && mouseX >1000) { // related to increase pre.
    precision/=2;
  }
  if (mouseY >690 && mouseY <700 && mouseX < 1100 && mouseX >1000) { // related to decrease pre 
    precision*=2;
  }
}

// sidebar rendering

void sidebar() {  // shows all relavent data, and % error from the expected value. 

  fill(0);
  rotate(-3*PI/2); // rotates the field to have left to right text.
  text("Delta x: "+precision, 1020, -950);
  text("# dots: "+(abs(breaks[0]-breaks[breaks.length-1]))/precision, 1020, -940);
  text("True: " +EXPECTED_INTEGRAL, 1020, -900);
  
  text("Left: "+leftIntegral(breaks[0], breaks[breaks.length-1]) + 
  "\n %"+ (leftIntegral(breaks[0], breaks[breaks.length-1])- EXPECTED_INTEGRAL)/ EXPECTED_INTEGRAL, 1020, -850);
  
  text("Average: "+averageIntegral(breaks[0], breaks[breaks.length-1])+ 
  "\n %"+ (averageIntegral(breaks[0], breaks[breaks.length-1])- EXPECTED_INTEGRAL)/ EXPECTED_INTEGRAL, 1020, -800);
 
  text("Trapezoidal: "+trapezoidalIntegral(breaks[0], breaks[breaks.length-1])+ 
  "\n %"+ (trapezoidalIntegral(breaks[0], breaks[breaks.length-1])- EXPECTED_INTEGRAL)/ EXPECTED_INTEGRAL, 1020, -750);
  //text("Simpsons integral: N/A", 1020, -700);

  text("Show Left", 1020, -600);
  text("Show Average", 1020, -550); 
  text("Show Trapezoidal", 1020, -500);
  text("Show Simpsons", 1020, -450);

  text("Increase Precision", 1020, -350);
  text("Decrease Precision", 1020, -300);
  rotate(3*PI/2);
}
