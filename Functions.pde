float tests(float j) {

  //tests of the math part of the function. 
 
  //if (j>0 && j<13.0) {
  //  return -j*j;
  //}
  // can it integrate negative numbers: yes

  //if (j>0 && j<13.0) {
  //  return 5;
  //}
  // can it do constant functions: yes

  //if (j>0 && j<13.0) {
  //
  //}
  // can it do empty function: yes

  //if (j>0 && j<13.0) {
  //  return j*j-6*j+5;
  //}
  // can it do integral or area: integral, y under 0 subtracts from the value.

  //if (j>-5.0 && j<7.0) {
  //  return j*j;
  //}
  // can it do x less than 0: no

  //if (j>0 && j<13.0) {
  //  return pow(j, 6)+1000;
  //}
  // can it do higher exponents: yes

  //if (j>0 && j<13.0) {
  //  return pow(j, 7);
  //}
  // can it do higher exponents: yes

  //if (j>0 && j<13.0) {
  //  return pow(j, -2);
  //}
  // can it do negative exponents: no

  //if (j>0 && j<13.0) {
    //return sin(j);
    //return cos(j);
    //return tan(j);
  //}
  // can it do trig.

  if (j>0 && j<13.0) {
    return 1/1000*j + 5;
  }

  return 0;
}
