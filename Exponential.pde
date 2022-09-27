class Exponential implements Functor {
  float scale;
  float yOffset;

  Exponential(float scale, float yOffset) {
    this.scale = scale;
    this.yOffset = yOffset;
  }

  Exponential() {
    this.scale = 1;
    this.yOffset = 0;
  }

  float call(float x) {
    return exp(x)/this.scale+this.yOffset;
  }
}