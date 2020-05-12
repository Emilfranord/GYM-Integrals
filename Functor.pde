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
    // they do not work, there is a conflict in calling them.
  }

  float call(float x) {
    for (int i = 0; i<this.functions.length; i++ ) {
      if (x>this.breaks[i] && x<this.breaks[i+1]) {
        return this.functions[i].call(x);
      }
    }
    return 0;
  }

  float getBreak(int i) {
    return this.breaks[i];
  }
}

class Polynomial implements Functor {
  float[] coefficients;
  
  Polynomial(float[] coefficients){ // x^0 is index 0, x^1 is index 1.... 
    this.coefficients = coefficients;
  }
  
  float call(float x) {
    float sum =0;
    for(int i =0; i<this.coefficients.length; i++){
      sum += this.coefficients[i]* pow(x,i);
    }
    return sum;
  }
}


class Integral {
  //float precision;
  //Integral() {
  //}

  float call(Functor func, float precision, float lowerBound, float upperBound) {
    float sum = 0;
    for (float x = lowerBound; x<upperBound; x+=precision) {
      sum += area(func, precision, x);
    }
    return sum;
  }

  float area(Functor func, float precision, float x) {
    return 0;
  }

  float call(GlassFunction glass, float precision) {
    return call(glass, precision, glass.breaks[0], glass.breaks[breaks.length-1]);
  }
}

public class LeftIntegral extends Integral { // move the render functions to here, wednesday.

  //LeftIntegral() {
  //  super();
  //}

  //@Override
  float area(Functor func, float precision, float x) {
    return func.call(x)*precision;
  }
}

public class RightIntegral extends Integral {
  float area(Functor func, float precision, float x) {
    return func.call(x+precision)*precision;
  }
}

public class AverageIntegral extends Integral {

  //@Override
  float area(Functor func, float precision, float x) {
    return func.call(x + precision/2)*precision;
  }
}

public class TrapetzIntegral extends Integral {

  //@Override
  float area(Functor func, float precision, float x) {
    return precision * (func.call((x)+precision) + func.call(x))/2;
  }
}

public class SimpsonsIntegral extends Integral {
  float area(Functor func, float precision, float x) {
    return 0;
  }
} 
