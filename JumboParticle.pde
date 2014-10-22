Particle [] particle;
boolean drawAgain=false;
double red=(double)(Math.random()*155+40);
double green=(double)(Math.random()*155+40);
double blue=(double)(Math.random()*155+40);
int OddColor; 
int ArrayLength=800;
void setup()
{
  size(800, 800);
  background(0);
  noStroke();
  particle=new Particle[ArrayLength];
  for (int i=0; i<particle.length; i++)
  {
    particle[i]=new NormalParticle();
  }
  particle[0]=new OddballParticle();
  particle[1]=new Jumbo();
}
void draw()
{
  fill(0);
  rect(0, 0, 800, 800);
  red=(int)(Math.random()*155+40);
  green=(int)(Math.random()*155+40);
  blue=(int)(Math.random()*155+40);
  OddColor=color((int)red, (int)green, (int)blue);
  for (int i=0; i<particle.length; i++)
  {
    particle[i].move();
    particle[i].show();
  }
}

class NormalParticle implements Particle
{
  double x, y, speed, angle;
  int Color, shade, Size;
  NormalParticle() {
    x=(double)(Math.random()*10+390);
    y=(double)(Math.random()*10+390);
    speed=(double)(Math.random()*10+.2);
    angle=(double)(Math.random()*20);
    shade=(int)(Math.random()*90+10);
    Color=color((int)red+shade, (int)green+shade, (int)blue+shade);
    Size=3;
  }
  public void move()
  {
    x=x+Math.cos(angle)*speed;
    y=y+Math.sin(angle)*speed;
  }
  public void show()
  {
    fill(Color);
    ellipse((float)x, (float)y, Size, Size);
    if (drawAgain==true)
    {
      particle=new Particle[500];
      for (int i=0; i<particle.length; i++)
      {
        particle[i]=new NormalParticle();
      }
      particle[0]=new OddballParticle();
      particle[1]=new Jumbo();
      x=(double)(Math.random()*10+290);
      y=(double)(Math.random()*10+290);
      Color=color((int)red+shade, (int)green+shade, (int)blue+shade);
      drawAgain=false;
    }
  }
}

class Jumbo extends NormalParticle
{
  Jumbo()
  {
    Size=75;
  }
}
interface Particle
{
  public void move ();
  public void show();
}

class OddballParticle implements Particle
{
  double x, y, speed, angle;
  int Color;
  OddballParticle() {
    //x=300;
    //y=300;
    x=((double)(Math.random()*800));
    y=((double)(Math.random()*800));
    speed=(double)(Math.random()*3+1);
    angle=(double)(Math.random()*100);
    //Color=color((int)red,(int)green,(int)blue);
  }
  public void move()
  {
    if (x>=0 && x<=400 && y>=0 && y<=400)
    {
      x=x+speed;
      y=y+speed;
    }
    if (x>=400 && y>=400 && x<=800 && y<=800)
    {
      x=x-speed;
      y=y-speed;
    }
    if (x>=400 && y<=400 && x<=800)
    {
      x=x-speed;
      y=y+speed;
    }
    if (x<=400 && x>=0 && y>=400)
    {
      x=x+speed;
      y=y-speed;
    }
    //x=x-Math.cos(angle)*speed;
    //y=y-Math.sin(angle)*speed;
  }
  public void show()
  {
    fill(OddColor);
    ellipse((float)x, (float)y, 4, 4);   
    //if (!(x>=0 && x<=600 && y<=600 && y>=0))
    //{
    //drawAgain=true;
    //x=300;
    //y=300;
    //}
    if (x<=400+10 && y<=400+10 && x>=400-10 && y>=400-10)
    {
      drawAgain=true;
      x=((double)(Math.random()*800));
      y=((double)(Math.random()*800));
    }
  }
}

