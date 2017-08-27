class Dot extends VParticle{
  
  BSeparate separation;
  BCollision collision;
  
  Dot(Vec pos, float weight,float  rad) {
    super(pos,weight, rad);
    
    separation = new BSeparate(0, 3.5f, .1f);
    collision = new BCollision();
    this.addBehavior(separation);
    this.addBehavior(collision);
    
  }
  
  void setSeparation(float radius) {
  
  separation.setDesiredSeperation(radius);
  }
}