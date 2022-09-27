public class SimpsonsIntegral extends Integral {
  float area(Functor func, float precision, float x) {
    float a = x; float  b = a+precision; 
    
  return (b-a)/(6) * (func.call(a) + 4* func.call((a+b)/2) + func.call(b));
  }
} 