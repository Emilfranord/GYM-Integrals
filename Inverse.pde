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