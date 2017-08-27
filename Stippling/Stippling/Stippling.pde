import punktiert.math.Vec;
import punktiert.physics.*;

//world object
VPhysics physics;

//number of particles in the scene
int amount = 600;
//initial size of the particle
float rad = 2;

PImage img;

public void setup() {
  size(1010, 1278);
  frameRate(30);
  //size(672, 800);
  noStroke();
  fill(255);

 img = loadImage("girl.jpg");
  img.loadPixels();
  loadPixels();
  physics = new VPhysics(width, height);
  physics.setfriction(.12f);

  for (int i = 0; i < amount; i++) {
    //vector for position
    Vec pos = new Vec (random( width/2 - 10, width/2 + 10 ), random(height/2 - 10, height/2 +10));
    //create particle (Vec pos, mass, radius)
    Dot particle = new Dot(pos, 10, rad);
    //add particle to world
    physics.addParticle(particle);
  }
    
}

public void draw() {
  
  background(0);

  physics.update();

   for (int i = 0; i < physics.particles.size(); i++) {
    
    Dot p =  (Dot) physics.particles.get(i);
    
    int loc = (int)p.x + ((int)p.y * width);
    
    if(loc < width * height & loc > 0){
    float newsize =  ( (brightness(img.pixels[loc]))/256 ) * rad;
    //p.setRadius(newsize);
    // float sep =  rad * 0.7;
    //p.setSeparation(sep); 
    //noFill();
    //ellipse(p.x, p.y, newsize, newsize);
    
    noStroke();
    fill(255);
    if (p.getRadius() > 1){
    ellipse(p.x, p.y, newsize * 2, newsize * 2);  
    } else{
      p.clear();
      //physics.particles.get(i).clear();
    }
  }
   }

 for (int i = 0; i < amount/30; i++) {
    physics.addParticle(new Dot(new Vec(random( width/2 - 10, width/2 + 10 ), random(height/2 - 10, height/2 +10)),5, rad));
 } 
 
 saveFrame("frames/####.tiff"); 
}