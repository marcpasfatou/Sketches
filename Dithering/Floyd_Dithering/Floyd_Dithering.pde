
PImage img;
PImage result;

PImage toGray(PImage source) {
  PImage result = source;
  result.loadPixels();
  for (int loc = 0; loc < result.pixels.length; loc++) {
    float r = red(img.pixels[loc]);
    float g = green(img.pixels[loc]);
    float b = blue(img.pixels[loc]);

    color c = color ( 0.2126 * r + 0.7152  * g + 0.0722 * b);

    result.pixels[loc] = c;
  }

  result.updatePixels();
  return result;
}
void errorDiffusion(PImage img) {
  img.loadPixels();
  for (int y = 0; y < height; y++) {
    for (int x = 0; x < width; x ++) {
      int loc = x + (y * width);
      //closest color
      color oldPixel =img.pixels[loc];
      if (brightness(img.pixels[loc])> 127) {
        img.pixels[loc] = color(255);
      } else {
        img.pixels[loc] = color(0);
      }
      color newPixel = img.pixels[loc];
      float error = brightness(oldPixel) - brightness(newPixel);

      if ( y <  (height - 1) ) {
        img.pixels[loc + width] = img.pixels[loc + width] + color(error * 0.3125);
        if ( x < (width - 1) ) {
          img.pixels[loc + 1 + width] = img.pixels[loc + 1 + width] +color(error * 0.0625);
        }
        if ( x != 0 ) { 
          img.pixels[loc -1 + width] = img.pixels[loc -1 + width] + color(error * 0.1875);
        }
      }
      if ( x < (width - 1) ) {
        img.pixels[loc + 1] = img.pixels[loc + 1] + color(error * 0.4375);
      }
      //print(img.pixels[loc]);


      //return img;
    }
  }

  img.updatePixels();
}
void setup() {
  size(320, 400);
  //img = loadImage("David.gif");
  img = loadImage("pearl.jpg");
  //img = loadImage("checkers.jpg");
  //img = loadImage("smile.png");
}

void draw() {
  background(255);
  image(img, 0, 0);
  result = toGray(img);
  image(result, 0, 0);
  errorDiffusion(result);
}