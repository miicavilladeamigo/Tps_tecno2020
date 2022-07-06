class Punto {
  int posX, posY, puntos;

  Resize resize;

  Punto(int posX, int posY,  Resize resize) {
    puntos = 0;
    this.posX = posX;
    this.posY = posY;
    this.resize = resize;
  }
  void dibujar() {
    textSize(20);
    fill(255);
    text("Puntos: " + puntos, resize.resizePosX(this.posX), resize.resizePosY(this.posY));
  }
  void incrementar() {
    puntos++;
  }
  boolean controlarPuntos() {
    return puntos == 5;
  }
}
