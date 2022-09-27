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
}