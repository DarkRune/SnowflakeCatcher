//DB-F
SnowFlake[] sFlake;
void setup()
{
  size(500, 500);
  background(0);
  frameRate(100);
  strokeWeight(15);
  sFlake=new SnowFlake[500];
  for (int i = 0; i < sFlake.length; i++)
  {
    sFlake[i]=new SnowFlake();
  }
}
void draw()
{
  for (int i = 0; i < sFlake.length; i++) 
  {
    sFlake[i].erase();
    sFlake[i].lookDown();
    sFlake[i].wrap();
    sFlake[i].move();
    sFlake[i].show();
  }
}
void mouseDragged()
{
  if (mouseButton == LEFT)
  {
    stroke(255, 0, 0);
    line(pmouseX, pmouseY, mouseX, mouseY);
  } 
  else if (mouseButton == RIGHT) 
  {
    stroke(0);
    line(pmouseX, pmouseY, mouseX, mouseY);
  }
}
class SnowFlake
{
  int myX, myY;
  boolean Move;
  SnowFlake()
  {
    myX = (int)(Math.random()*500);
    myY = (int)(Math.random()*500);
  }
  void show()
  {
    noStroke();
    fill(255);
    ellipse(myX, myY, 10, 10);
  }
  void lookDown()
  {
    if (get(myX, myY+8) == color(0)) 
    {
      Move=true;
    }
    else 
    {
      Move=false;
    }
  }
  void erase()
  {
    noStroke();
    fill(0);
    ellipse(myX, myY, 12, 12);
  }
  void move()
  {
    if (Move == true) 
    {
      myY++;
    }
  }
  void wrap()
  {
    if (myY>=492) {
      myY=0;
      myX=(int)(Math.random()*500);
    }
  }
}
