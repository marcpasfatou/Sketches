 //<>//
Cell[][] grid;
Cell[][] next;
Cell[][] temp;

float Da = 1.0;
float Db = 0.5;
float f = 0.055; //feed rate
float k = 0.062; //kill rate

float[][] convMat = new float[][]{
  { 0.05, 0.2, 0.05}, 
  {  0.2, - 1.0, 0.2}, 
  { 0.05, 0.2, 0.05}, 
};

void setup() {
  size(600, 600, P2D);
  frameRate(120);
  grid = new Cell[600][600];
  next = new Cell[600][600];
  //initialize dish
  for (int i = 0; i < width; i++) {
    for (int j = 0; j < height; j++) {
      //grid[i][j] = new Cell(random(1), random(1));
      grid[i][j] = new Cell(1, 0);
      next[i][j] = new Cell(1, 0);
    }
  }

  //seed reagent
  for (int x = 250; x < 350; x++) {
    for (int y = 250; y < 350; y++) {
      grid[x][y].b =1;
    }
  }
}

void draw() {
  background(51);
  
  //TODO pararellize
  for (int x = 1; x < width -1; x++) {
    for (int y = 1; y < height -1; y++) {
      float a =  grid[x][y].a;
      float b = grid[x][y].b;
      next[x][y].a = a + (Da * laplaceA(x, y) - (a * b * b) + (f *(1-a)));
      next[x][y].b = b + (Db * laplaceB(x, y) + (a * b * b) - (b *(k + f)));
    }
  }

  loadPixels();
  for (int x = 0; x < width; x++) {
    for (int y = 0; y < height; y++) {


      int pix = (x + y * width);
      float a =  grid[x][y].a;
      float b = grid[x][y].b;

      //color c = color(floor(grid[x][y].a*255), floor(grid[x][y].b*255), 0);
      color c = color(floor((a -b )*255), floor((a -b )*255), floor((a -b )*255));
      pixels[pix] = c;
    }
  }
  updatePixels();
  swap();
}


class Cell {
  float a, b;
  Cell(float tempa, float tempb) {
    a = tempa;
    b = tempb;
  }
}

void swap() {
  temp = grid;
  grid = next;
  next = temp;
}

float laplaceA(int x, int y) {
  float result = 0;
  //Cell[][] padded_grid = new Cell[width + 2][height + 2];


  result += grid[x - 1 ][y - 1].a * 0.05;
  result += grid[x][y - 1].a * 0.2;
  result += grid[x + 1][y - 1 ].a * 0.05;
  result += grid[x - 1][y].a * 0.2;
  result += grid[x][y].a * -1.0;
  result += grid[x + 1][y].a * 0.2;
  result += grid[x - 1 ][y + 1].a * 0.05;
  result += grid[x][y + 1].a * 0.2;
  result += grid[x + 1][y +1 ].a * 0.05;

  return result;
}

float laplaceB(int x, int y) {
  float result = 0;

  result += grid[x - 1 ][y - 1].b * 0.05;
  result += grid[x][y - 1].b * 0.2;
  result += grid[x + 1][y - 1 ].b * 0.05;
  result += grid[x - 1][y].b * 0.2;
  result += grid[x][y].b * -1.0;
  result += grid[x + 1][y].b * 0.2;
  result += grid[x - 1 ][y + 1].b * 0.05;
  result += grid[x][y + 1].b * 0.2;
  result += grid[x + 1][y +1 ].b * 0.05;

  return result;
}
