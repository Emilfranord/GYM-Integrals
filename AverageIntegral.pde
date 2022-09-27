public class AverageIntegral extends Integral {
  float area(Functor func, float precision, float x) {
    return func.call(x + precision/2)*precision;
  }
}