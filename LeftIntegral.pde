public class LeftIntegral extends Integral {
  float area(Functor func, float precision, float x) {
    return func.call(x)*precision;
  }
}