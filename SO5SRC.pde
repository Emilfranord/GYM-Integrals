float precision = 4.0; // functionaly the same as \Delta x. 
final float MAX_FUNCTION_VALUE = 13.0;
final float EXPECTED_INTEGRAL =35.6775400000; 
boolean showLeft = false;
boolean showAverage = false;
boolean showTrapetz = false;
boolean showSimpsons = false;
int highestRecortedTime = 0;

void setup() {
  size(1200, 1000);
  // scale is 1:50
}

void draw() {
  translate(0, height);
  rotate(3*PI/2); // this makes cordinates to (y;x) instead.
  //println((mouseY) +" ; "+(mouseX));
  background(200);
  cartesian();
  grid();
  sidebar();
  renderFunction();

  if (showLeft) {
    renderLeftIntegral();
  }
  if (showAverage) {
    renderAverageIntegral();
  }
  if (showTrapetz) {
    renderTrapezoidalIntegral();
  }

  //time measuring system
  //int t = millis();
  //leftIntegral();
  //println(millis()-t);
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
  stroke(c);
  point(y*50, x*50);
  stroke(100);
}

// the function section.
void renderFunction() {
  strokeWeight(1);
  stroke(0);
  for (float i = 0; i<20; i+=precision) {
    pointA(i, glassFunction(i));
  }
}

float glassFunction(float j) { // returns the value of the function given some number.
  //return tests(j);

  // max val = 13
  // expedted number =  35.67754
 
  if (0<j && j<1.97046) {
    return  1/(j+0.5);
  }
  if (j>1.97046 && j<6.91583) {
    return (exp(j)/1500)+0.4;
  }
  if (j>6.91583 && j<11.9898) {
    return -j*j+19*j-82.5;
  }
  if (j>11.9898 && j<13) {s
    return tan(j+1)+1.1;
  }
  return 0;
}

// The integral section.

void renderLeftIntegral() {
  for (float i = 0; i<20; i+=precision) {
    rect(glassFunction(i)*50, i*50, -glassFunction(i)*50, precision*50);
  }
}

float leftIntegral() {
  float sum = 0;
  for (float i = 0; i<MAX_FUNCTION_VALUE/precision; i++) {
    sum += glassFunction(i*precision)*precision;
  }
  return sum;
}

void renderAverageIntegral() {
  for (float i = 0; i<20; i+=precision) {
    rect(0, i*50, glassFunction(i+precision/2)*50, precision*50);
  }
}

float averageIntegral() {
  float sum = 0;
  for (float i = 0; i< MAX_FUNCTION_VALUE/precision; i++) {
    sum += glassFunction(precision*i + precision/2)*precision;
  }
  return sum;
}

void renderTrapezoidalIntegral() {
  for (float i = 0; i<20; i+=precision) {
    quad(0, i*50, 0, (i+precision)*50, glassFunction(i+precision)*50, (i+precision)*50, glassFunction(i)*50, (i)*50 );
  }
}

float trapezoidalIntegral() {
  float sum = 0;
  for (float i = 0; i<MAX_FUNCTION_VALUE/precision; i++) {
    sum += precision * (glassFunction((i*precision)+precision) + glassFunction(i*precision))/2;
  }
  return sum;
}

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

  if (mouseY >540 && mouseY <560 && mouseX < 1100 && mouseX >1000) { // related to show Simpsons
    showLeft = false;
    showAverage = false;
    showTrapetz = false;
    showSimpsons = true;
  }

  if (mouseY >640 && mouseY <660 && mouseX < 1100 && mouseX >1000) { // related to show Simpsons
    precision/=2;
  }
  if (mouseY >690 && mouseY <700 && mouseX < 1100 && mouseX >1000) { // related to show Simpsons
    precision*=2;
  }
}

// sidebar part

void sidebar() {

  fill(0);
  rotate(-3*PI/2); // rotates the field to have left to right text.
  text("Delta x: "+precision, 1020, -950);
  text("# dots: "+MAX_FUNCTION_VALUE/precision, 1020, -940);
  text("True: " +EXPECTED_INTEGRAL, 1020, -900);
  text("Left: "+leftIntegral() + "\n %"+ (leftIntegral()- EXPECTED_INTEGRAL)/ EXPECTED_INTEGRAL, 1020, -850);
  text("Average: "+averageIntegral()+ "\n %"+ (averageIntegral()- EXPECTED_INTEGRAL)/ EXPECTED_INTEGRAL, 1020, -800);
  text("Trapezoidal: "+trapezoidalIntegral()+ "\n %"+ (trapezoidalIntegral()- EXPECTED_INTEGRAL)/ EXPECTED_INTEGRAL, 1020, -750);
  text("Simpsons integral: N/A", 1020, -700);

  text("Show Left", 1020, -600);
  text("Show Average", 1020, -550); 
  text("Show Trapezoidal", 1020, -500);
  text("Show Simpsons", 1020, -450);

  text("Increase Precision", 1020, -350);
  text("Decrease Precision", 1020, -300);
  rotate(3*PI/2);
}
