class BeautifulObject {
  int x;
  int y;
  String shape;
  int size;
  color c;

  BeautifulObject(int x, int y, String shape, int size, color c) {
    this.x = x;
    this.y = y; 
    this.shape = shape;
    this.size = size;
    this.c = c;
  }
  
  BeautifulObject() {
    this.x = int(random(50, width - 50));
    this.y = int(random(50, height - 50)); 
    this.shape = "o";
    this.size = int(random(50, 100));
    this.c = color(int(random(256)), int(random(256)), int(random(256)));
  }

  void draw(PGraphics mirror) {
    mirror.fill(c);
    mirror.noStroke();
    if (shape == "o") {
      mirror.ellipse(x, y, size / 2, size / 2);
    }
    else if (shape == "d") {
      int r = size / 2;
      mirror.quad(x, y - r, x + r, y, x, y + r, x - r, y);
    }
  }

}
