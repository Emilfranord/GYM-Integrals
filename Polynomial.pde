class Polynomial implements Functor {
  float[] coefficients;

  Polynomial(float[] coefficients) { // x^0 is index 0, x^1 is index 1.... 
    this.coefficients = coefficients;
  }

  float call(float x) {
    float sum =0;
    for (int i =0; i<this.coefficients.length; i++) {
      sum += this.coefficients[i]* pow(x, i);
    }
    return sum;
  }
}