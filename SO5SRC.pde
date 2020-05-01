void setup(){
  size(1000,1000);

}

void draw(){
  translate(width/2, height/2);
  rotate(3*PI/2); // this makes cordinates to (y;x) instead.
    println((mouseY-500) +" ; "+(mouseX-500));
  cartesian();
  
}

void cartesian(){
  strokeWeight(4);

  line(-500,0,500,0);
  line(0,-500,0,500);
  
  for(int i=0;i<20;i++){
  line(0,-500+50*i,10,-500+50*i);
  line(-500+50*i,0,-500+50*i,10);
  }
  
}
