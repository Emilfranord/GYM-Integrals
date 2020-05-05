// returns the value of x given a tenth or lower polynomial. if something is 0, it just dissapears.
float poly(float x, float a, float b, float c, float d, float e, float f, float g, float h, float i, float j, float k, float l) {
  return a*pow(x, 10)+ b*pow(x, 9)+c*pow(x, 8)+d*pow(x, 7)+e*pow(x, 6)+f*pow(x, 5)+g*pow(x, 4)+h*pow(x, 4)+i*pow(x, 3)+j*pow(x, 2)+k*x+l;
}

float poly(float x, float b, float c, float d, float e, float f, float g, float h, float i, float j, float k, float l) {
  return b*pow(x, 9)+c*pow(x, 8)+d*pow(x, 7)+e*pow(x, 6)+f*pow(x, 5)+g*pow(x, 4)+h*pow(x, 4)+i*pow(x, 3)+j*pow(x, 2)+k*x+l;
}

float poly(float x, float c, float d, float e, float f, float g, float h, float i, float j, float k, float l) {
  return c*pow(x, 8)+d*pow(x, 7)+e*pow(x, 6)+f*pow(x, 5)+g*pow(x, 4)+h*pow(x, 4)+i*pow(x, 3)+j*pow(x, 2)+k*x+l;
}

float poly(float x, float d, float e, float f, float g, float h, float i, float j, float k, float l) {
  return d*pow(x, 7)+e*pow(x, 6)+f*pow(x, 5)+g*pow(x, 4)+h*pow(x, 4)+i*pow(x, 3)+j*pow(x, 2)+k*x+l;
}

float poly(float x, float e, float f, float g, float h, float i, float j, float k, float l) {
  return e*pow(x, 6)+f*pow(x, 5)+g*pow(x, 4)+h*pow(x, 4)+i*pow(x, 3)+j*pow(x, 2)+k*x+l;
}
float poly(float x, float f, float g, float h, float i, float j, float k, float l) {
  return f*pow(x, 5)+g*pow(x, 4)+h*pow(x, 4)+i*pow(x, 3)+j*pow(x, 2)+k*x+l;
}
float poly(float x, float g, float h, float i, float j, float k, float l) {
  return g*pow(x, 4)+h*pow(x, 4)+i*pow(x, 3)+j*pow(x, 2)+k*x+l;
}
float poly(float x, float h, float i, float j, float k, float l) {
  return h*pow(x, 4)+i*pow(x, 3)+j*pow(x, 2)+k*x+l;
}
float poly(float x, float i, float j, float k, float l) {
  return i*pow(x, 3)+j*pow(x, 2)+k*x+l;
}
float poly(float x, float j, float k, float l) {
  return j*pow(x, 2)+k*x+l;
}
float poly(float x, float k, float l) {
  return k*x+l;
}
float poly(float x, float l) {
  return 0*x+l;
}
