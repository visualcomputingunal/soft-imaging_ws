PImage img;
int conv[][] = new int[img.width][img.height];
float mask[][] = {{1/16,1/8,1/16},
                  {1/8,1/4,1/8},
                  {1/16,1/8,1/16}};

void setup() {
  size(1000,500);
  img = loadImage("img01.jpg");
  
}

void draw() {
  image(img,50,50);
  for(int i=0; i<img.width; i++){
    for(int j=0; j<img.height; j++){
      try{
        color pix = get(i,j);
        float red = red(get(i-1,j-1))*mask[0][0] + red(get(i-1,j))*mask[0][1] + red(get(i-1,j+1))*mask[0][2] +
                    red(get(i,j-1))*mask[1][0] + red(get(i,j))*mask[1][1] + red(get(i,j+1))*mask[1][2] +
                    red(get(i+11,j-1))*mask[2][0] + red(get(i+1,j))*mask[2][1] + red(get(i+1,j+1))*mask[2][2];
        float green = green(get(i-1,j-1))*mask[0][0] + green(get(i-1,j))*mask[0][1] + green(get(i-1,j+1))*mask[0][2] +
                      green(get(i,j-1))*mask[1][0] + green(get(i,j))*mask[1][1] + green(get(i,j+1))*mask[1][2] +
                      green(get(i+11,j-1))*mask[2][0] + green(get(i+1,j))*mask[2][1] + green(get(i+1,j+1))*mask[2][2];
        float blue = blue(get(i-1,j-1))*mask[0][0] + blue(get(i-1,j))*mask[0][1] + blue(get(i-1,j+1))*mask[0][2] +
                     blue(get(i,j-1))*mask[1][0] + blue(get(i,j))*mask[1][1] + blue(get(i,j+1))*mask[1][2] +
                     blue(get(i+11,j-1))*mask[2][0] + blue(get(i+1,j))*mask[2][1] + blue(get(i+1,j+1))*mask[2][2];
        
        color conv_pix = color(red,green,blue);
        
      }catch(Exception e){}
    }
  }
}
