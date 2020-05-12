interface Functor {

  float call(float x); // makes all the other classes have a call function, and makes the classes the same datatype.
}

class Inverse implements Functor {
  float xOffset; 
  float power;

  Inverse(float xOffset, float power) {
    this.xOffset = xOffset;
    this.power = power;
  }

  Inverse() {
    this.xOffset = 0;
    this.power = 1;
  }

  float call(float x) {
    return 1/pow(x+this.xOffset, this.power);
  }
}

//float exponentialFuction(float x, float scale, float yOffset ) {
//  return exp(x)/scale+yOffset;
//}

class Exponential implements Functor {
  float scale;
  float yOffset;

  Exponential(float scale, float yOffset) {
    this.scale = scale;
    this.yOffset = yOffset;
  }

  Exponential() {
    this.scale = 1;
    this.yOffset = 0;
  }

  float call(float x) {
    return exp(x)/this.scale+this.yOffset;
  }
}


class SecondDegreePolynomial implements Functor {
  float curvature;
  float b;
  float yOffset;

  SecondDegreePolynomial(float curvature, float b, float yOffset) {
    this.curvature = curvature;
    this.b = b;
    this.yOffset = yOffset;
  }

  SecondDegreePolynomial() {
    this.curvature = 1;
    this.b = 0;
    this.yOffset = 0;
  }

  float call(float x) {
    return this.curvature*x*x + this.b*x + this.yOffset;
  }
}

float tangens(float x, float xOffset, float yOffset) {
  return tan(x+xOffset)+yOffset;
}

class Tangens implements Functor {
  float xOffset;
  float yOffset;

  Tangens(float xOffset, float yOffset) {
    this.xOffset = xOffset;
    this.yOffset = yOffset;
  }

  Tangens() {
    this.xOffset = 0;
    this.yOffset = 0;
  }

  float call(float x) {
    return tan(x+this.xOffset)+this.yOffset;
  }
}

class GlassFunction implements Functor {
  Functor[] functions;
  float[] breaks;

  GlassFunction(Functor[] functions, float[] breaks) {
    this.functions = functions;
    this.breaks = breaks;
  }

  GlassFunction() {
    this.functions = new Functor[] {new Inverse(0.5, 1), new Exponential(1500, 0.4), new SecondDegreePolynomial(-1, 19, -82.5), new Tangens(1, 1.1)};
    this.breaks = new float[] {0, 1.97046, 6.91583, 11.9898, 13};
  }

  float call(float x) {
    for (int i = 0; i<this.functions.length; i++ ) {
      if (x>this.breaks[i] && x<this.breaks[i+1]) {
        return this.functions[i].call(x);
      }
    }
    return 0;
  }
}


class StraightLine implements Functor {
  float slope;
  float yOffset;

  StraightLine(float slope, float yOffset) {
    this.slope = slope;
    this.yOffset = yOffset;
  }
  
  StraightLine(){
    this.slope = 1;
    this.yOffset = 0;
  }

  float call(float x) {
    return this.slope *x + this.yOffset;
  }
}
