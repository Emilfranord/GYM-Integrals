class Tangens implements Functor {
  float xOffset;
  float yOffset;

  Tangens(float xOffset, float yOffset) {
    this.xOffset = xOffset;
    this.yOffset = yOffset;
  }

  Tangens() {
    this.xOffset = 0;
    this.yOffset = 0;
  }

  float call(float x) {
    return tan(x+this.xOffset)+this.yOffset;
  }
}