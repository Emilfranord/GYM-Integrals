class Integral {
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
    return call(glass, precision, glass.breaks[0], glass.breaks[glass.breaks.length-1]);
  }
}