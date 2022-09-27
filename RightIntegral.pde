public class RightIntegral extends Integral {
  float area(Functor func, float precision, float x) {
    return func.call(x+precision)*precision;
  }
}