
void setup(){
  size(1000,500);
  background(255);
  frameRate(15);
}






//float xM = (xObj * dy2 - yObj * dx2) / (dy1 * dx2 - dx1 * dy2);
//float yM = (yObj * dx1 - xObj * dy1) / (dy2 * dx1 - dx2 * dy1);
//(xM, yM) = ((x1Lens - x2Lens) * (yObj - yF) - (xObj - x3Project) * (y2Lens - y1Lens)) / ((xObj - x3Project) * (dy2 - dy1) - (yObj - yF) * (dx2 - dx1)
/*
float xM = (x1Lens-x2Lens)/(xObj-x3Project);
float yM = (y1Lens-y2Lens)/(yObj-y3Project);
*/





//fuoco


void draw(){
  background(255);
  strokeWeight(10);
  stroke(0,255,0);
   
  float xF = width/3;
  float yF = height/2;
  float xF2 = width-(xF);
  float yF2 = yF;
  
  float x1Lens = width/2; 
  float x2Lens = width/2;
  
  float y1Lens = 0;
  float y2Lens = height;
  line(x1Lens,y1Lens,x2Lens,y2Lens);
  strokeWeight(0);
  
  float xObj = mouseX; 
  float yObj= mouseY;
  float xSensor = x1Lens; // Posizione x del sensore
  float ySensor = yF2; // Posizione y del sensore
  float U = x1Lens - xObj;
  float F = x1Lens - xF;
  float V = width + (F-U);
  // Calcola la direzione del raggio dal fuoco all'oggetto
  float angleRaggio = atan2(yObj - yF, xObj - xF);

  // Calcola le coordinate di intersezione tra il raggio e il sensore
  float xIntersezione = xSensor;
  float yIntersezione = yObj + (xSensor - xObj) * tan(angleRaggio);
  //line
  stroke(0,0,255);
  strokeWeight(5);
  line(xObj,yObj,xIntersezione,yIntersezione);
  
  line(xIntersezione,yIntersezione,V,yIntersezione);
  line(xObj,yObj,x1Lens,yObj);
  line(x1Lens,yObj,V,yIntersezione);
  
  //oggetto e immagine
  fill(255,0,0);
  ellipse(V,yIntersezione,20,20);
  
  fill(255,0,0);
  ellipse(xObj,yObj,20,20);
  fill(75,0,50);
  ellipse(xF,yF,20,10);
  ellipse(xF,yF,10,20);
  ellipse(xF2,yF2,20,10);
  ellipse(xF2,yF2,10,20);
}
