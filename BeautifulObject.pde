// オブジェクト（具）の形と位置に関するクラス

class BeautifulObject {
  PShape shape;  // 基本となる形
  int x;
  int y;
  String type;  // 形のタイプを指定するために使う
  int size;
  color c;

  BeautifulObject(int x, int y, String type, int size, color c) {
    this.x = x;
    this.y = y; 
    this.type = type;
    this.size = size;
    this.c = c;
    setShape();
  }

  // ポジション以外ランダム
  BeautifulObject(int x, int y) {
    this(x, y,
      new String[]{"o", "d", "s", "h"}[int(random(4))],
      int(random(80, 180)),
      color(int(random(256)), int(random(256)), int(random(256)))
    );
  }

  // すべてランダム
  BeautifulObject() { this(int(random(50, width - 50)), int(random(50, height - 50))); }

  void setPos(int x, int y) {
    this.x = x;
    this.y = y;
  }

  void setColor(color c) {
    this.c = c;
    shape.setFill(c);
  }

  void setSize(int size) {
    this.size = size;
    setShape();
  }

  void setType(String type) {
    this.type = type;
    setShape();
  }
  
  // プロパティをもとに形を描画
  // 形を追加したい場合はここに描画
  void setShape() {
    noStroke();  // オブジェクトは基本的に輪郭線なし
    // 円
    if (type.equals("o")) {
      shape = createShape(ELLIPSE, 0, 0, size, size);
    }
    // ダイア
    else if (type.equals("d")) {
      int r = size / 2;
      shape = createShape(QUAD, 0, -r, r, 0, 0, r, -r, 0);
    }
    // 星
    else if (type.equals("s")) {
      int R;
      shape = createShape();
      shape.beginShape();
      shape.rotate(radians(-90));
      for (int i = 0; i < 10; i++) {
        if (i%2 == 0) {
          R = size / 2;
        } else {
          R = size / 4;
        }
        shape.vertex(R*cos(radians(360*i/10)), R*sin(radians(360*i/10)));
      }
      shape.endShape(CLOSE);
    }
    // ハート
    else if (type.equals("h")) {
      float R = (1.0 / 16.0) * (size / 2);
      shape = createShape();
      shape.beginShape();
      for (int theta = 0; theta < 360; theta++) {
        float tx = R * (16 * sin(radians(theta)) * sin(radians(theta)) * sin(radians(theta)));
        float ty = (-1) * R * (13 * cos(radians(theta)) - 5 * cos(radians(2 * theta)) 
          - 2 * cos(radians(3 * theta)) - cos(radians(4 * theta)) + 2.0);
        shape.vertex(tx, ty);
      }
      shape.endShape(CLOSE);
    }
    shape.setFill(c);
  }
  
  boolean isMouseOver() {
    int r = size / 2;
    if (mouseX > x - r && mouseX < x + r &&
        mouseY > y - r && mouseY < y + r) {
      return true;
    }
    return false;
  }

}
