/**
 * Noise Wave
 * by Daniel Shiffman.  
 * 
 * Using Perlin Noise to generate a wave-like pattern. 
 */
import processing.pdf.*;
float yoff = 0.0;        // 2nd dimension of perlin noise

void setup() {
  size(400, 600);
}

void draw() {
  //background(66, 134, 244);
  background(255);
 noStroke();
  
  // We are going to draw a polygon out of the wave points
  beginShape(); 
  fill(200);
  yoff = 0;
  float xoff = 0;       // Option #1: 2D Noise
  // float xoff = yoff; // Option #2: 1D Noise
  
  // Iterate over horizontal pixels
  for (float x = 0; x <= width; x += 10) {
    // Calculate a y value according to noise, map to 
    noiseDetail(100);
    float y = map(noise(xoff, yoff), 0, 1, 150,350); // Option #1: 2D Noise
   //float y = map(noise(xoff), 0, 1, 200,300);    // Option #2: 1D Noise
    
    // Set the vertex
    vertex(x, y); 
    // Increment x dimension for noise
    xoff += 0.05;
  }
  // increment y dimension for noise
  yoff += 0.1;
  vertex(width, height);
  vertex(0, height);
  endShape();
  
  
    // We are going to draw a polygon out of the wave points
  beginShape(); 
  fill(150);
  float xoff2 = 0; // Option #1: 2D Noise
  
  // float xoff = yoff; // Option #2: 1D Noise
  
  // Iterate over horizontal pixels
  for (float x = 0; x <= width; x += 10) {
    // Calculate a y value according to noise, map to 
    //noiseDetail(10,0.5);
    float y = map(noise(xoff2, yoff) * cos(xoff2), 0, 2, 250,500); // Option #1: 2D Noise
   //float y = map(noise(xoff), 0, 1, 200,300);    // Option #2: 1D Noise
    
    // Set the vertex
    vertex(x, y); 
    // Increment x dimension for noise
    xoff2 += 0.09;
  }
  // increment y dimension for noise
  yoff += 0.01;
  vertex(width, height);
  vertex(0, height);
  endShape();
  
  
   // We are going to draw a polygon out of the wave points
  beginShape(); 
  fill(120);
  float xoff3 = 0;       // Option #1: 2D Noise
  // float xoff = yoff; // Option #2: 1D Noise
  
  // Iterate over horizontal pixels
  for (float x = 0; x <= width; x += 10) {
    // Calculate a y value according to noise, map to 
    //noiseDetail(10,0.5);
    float y = map(noise(xoff3, yoff) * sin(xoff3), 0, 3, 250,700); // Option #1: 2D Noise
   //float y = map(noise(xoff), 0, 1, 200,300);    // Option #2: 1D Noise
    
    // Set the vertex
    vertex(x, y); 
    // Increment x dimension for noise
    xoff3 += 0.06;
  }
  // increment y dimension for noise
  yoff += 0.01;
  vertex(width, height);
  vertex(0, height);
  endShape();
  
     // We are going to draw a polygon out of the wave points
  beginShape(); 
  fill(100);
  float xoff4 = 0;       // Option #1: 2D Noise
  // float xoff = yoff; // Option #2: 1D Noise
  
  // Iterate over horizontal pixels
  for (float x = 0; x <= width; x += 10) {
    // Calculate a y value according to noise, map to 
    //noiseDetail(10,0.5);
    float y = map(noise(xoff4, yoff) * sin(xoff4), 0, 2, 300,700); // Option #1: 2D Noise
   //float y = map(noise(xoff), 0, 1, 200,300);    // Option #2: 1D Noise
    
    // Set the vertex
    vertex(x, y); 
    // Increment x dimension for noise
    xoff4 += 0.08;
  }
  // increment y dimension for noise
  yoff += 0.01;
  vertex(width, height);
  vertex(0, height);
  endShape();
     // We are going to draw a polygon out of the wave points
  beginShape(); 
  fill(80);
  float xoff5 = 0;       // Option #1: 2D Noise
  // float xoff = yoff; // Option #2: 1D Noise
  
  // Iterate over horizontal pixels
  for (float x = 0; x <= width; x += 10) {
    // Calculate a y value according to noise, map to 
    //noiseDetail(10,0.5);
    float y = map(noise(xoff5, yoff) * cos(xoff5), 0, 2, 400,700); // Option #1: 2D Noise
   //float y = map(noise(xoff), 0, 1, 200,300);    // Option #2: 1D Noise
    
    // Set the vertex
    vertex(x, y); 
    // Increment x dimension for noise
    xoff5 += 0.07;
  }
  // increment y dimension for noise
  yoff += 0.01;
  vertex(width, height);
  vertex(0, height);
  endShape();
     // We are going to draw a polygon out of the wave points
  beginShape(); 
  fill(60);
  float xoff6 = 0;       // Option #1: 2D Noise
  // float xoff = yoff; // Option #2: 1D Noise
  
  // Iterate over horizontal pixels
  for (float x = 0; x <= width; x += 10) {
    // Calculate a y value according to noise, map to 
    //noiseDetail(10,0.5);
    float y = map(noise(xoff6, yoff) * sin(xoff6), 0, 2, 500,700); // Option #1: 2D Noise
   //float y = map(noise(xoff), 0, 1, 200,300);    // Option #2: 1D Noise
    
    // Set the vertex
    vertex(x, y); 
    // Increment x dimension for noise
    xoff6 += 0.06;
  }
  // increment y dimension for noise
  yoff += 0.01;
  vertex(width, height);
  vertex(0, height);
  endShape();
     // We are going to draw a polygon out of the wave points
  beginShape(); 
  fill(40);
  float xoff7 = 0;       // Option #1: 2D Noise
  // float xoff = yoff; // Option #2: 1D Noise
  
  // Iterate over horizontal pixels
  for (float x = 0; x <= width; x += 10) {
    // Calculate a y value according to noise, map to 
    //noiseDetail(10,0.5);
    float y = map(noise(xoff7, yoff) * cos(xoff7), 0, 1, 550,700); // Option #1: 2D Noise
   //float y = map(noise(xoff), 0, 1, 200,300);    // Option #2: 1D Noise
    
    // Set the vertex
    vertex(x, y); 
    // Increment x dimension for noise
    xoff7 += 0.06;
  }
  // increment y dimension for noise
  yoff += 0.01;
  vertex(width, height);
  vertex(0, height);
  endShape();
     // We are going to draw a polygon out of the wave points
  beginShape(); 
  fill(20);
  float xoff8 = 0;       // Option #1: 2D Noise
  // float xoff = yoff; // Option #2: 1D Noise
  
  // Iterate over horizontal pixels
  for (float x = 0; x <= width; x += 10) {
    // Calculate a y value according to noise, map to 
    //noiseDetail(10,0.5);
    float y = map(noise(xoff8, yoff) * sin(xoff8), 0, 2, 550,800); // Option #1: 2D Noise
   //float y = map(noise(xoff), 0, 1, 200,300);    // Option #2: 1D Noise
    
    // Set the vertex
    vertex(x, y); 
    // Increment x dimension for noise
    xoff8 += 0.06;
  }
  // increment y dimension for noise
  yoff += 0.01;
  vertex(width, height);
  vertex(0, height);
  endShape();
  
  
}
