void setup()
{
  size(500,500);
  background(30);
  frameRate(20);
}
CarBuild c1 = new CarBuild(width/2,300,75,3.0,'r');
CarBuild c2 = new CarBuild(width,150,85,8.0,'l');
CarBuild c3 = new CarBuild(width,450,90,6.0,'r');
void draw()
{
  background(30);
  c1.CarUpdate();
  c2.CarUpdate();
  c3.CarUpdate();
}
class CarBuild
{
    boolean mouve;
    float centerX, yPos, largest,speed;
    char direction;
    CarBuild(float x, float y,float larg,float spd , char dir)
    {
        centerX = x;
        yPos = y;
        largest = larg;
        speed = spd;
        direction = dir;
    }
    void CarUpdate()
    {
      
      if(!(((mouseX>centerX-largest)&&(mouseX<centerX+largest))&&((mouseY>yPos-largest/1.2)&&(mouseY<yPos))))
      {
        mouve = true;
        if(direction == 'r')
          centerX +=speed;
        if(direction == 'l')
          centerX -=speed;
        if(centerX <= 0)
        {
           centerX = height;
        }
        else if(centerX >=height)
        {
          centerX=0;
        }
      }
      else mouve = false;
      //costruzione
      if(mouve)
        fill(255,255,0);
      else
        fill(255,0,0);
      ellipse(centerX-(largest/2),yPos,largest/2,largest/2);
      ellipse(centerX+(largest/2),yPos,largest/2,largest/2);
      if(mouve)
        fill(255,0,0);
       else
         fill(255,255,0);
         
      beginShape();
      vertex(centerX,yPos);
      vertex(centerX-largest,yPos);
      vertex(centerX-largest,yPos-(largest/2));
      vertex(centerX-(largest/2),yPos-(largest/2));
      vertex(centerX-(largest/2),yPos-(largest/1.2));
      vertex(centerX+(largest/2),yPos-(largest/1.2));
      vertex(centerX+(largest/2),yPos-(largest/2));
      vertex(centerX+largest,yPos-(largest/2));
      vertex(centerX+largest,yPos);
      endShape(CLOSE);
    }
}
