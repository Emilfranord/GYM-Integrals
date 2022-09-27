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