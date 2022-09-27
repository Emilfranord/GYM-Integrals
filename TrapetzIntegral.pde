public class TrapetzIntegral extends Integral {

  float area(Functor func, float precision, float x) {
    return precision * (func.call((x)+precision) + func.call(x))/2;
  }
}