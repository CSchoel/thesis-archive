float pe1(float phase) {
  float res = pow(phase,1.3);
  res *= (phase-0.45);
  res *= pow(1-phase,3);
  res /= (pow(0.2,3) + pow(1-phase,3));
  return res;
}
float pe2(float phase) {
  return pow(phase,1.3)*(phase-0.45)/(pow(0.2/(1-phase),3) + 1);
}
void drawFunction(int nr) {
  int len = 1000;
  float lasty = 0;
  float lastx = 0; 
  for(int i = 0; i < len; i++) {
    float t = 1.0*i/len;
    float x = t*width;
    float y = nr == 0 ? pe1(t) : pe2(t);
    y *= -1000;
    if (i > 0) line(x,y,lastx,lasty);
    lastx = x;
    lasty = y;
  }
}

void setup() {
  size(800,600);
  background(255);
  translate(0,height/2.0);
  stroke(255,0,0);
  drawFunction(0);
  stroke(0,0,255);
  drawFunction(1);
}


