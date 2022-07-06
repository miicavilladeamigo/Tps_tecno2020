class Punto {
  int posX, posY, puntos, puntosInicial;

  Punto(int p_posX, int p_posY) {
    posX = p_posX;
    posY = p_posY;
    puntos = 0;
    puntosInicial = puntos;
  }
  void dibujar() {
    textSize(20);
    fill(255);
    text("Puntos: " + puntos, posX, posY);
  }
  void incrementar() {
    puntos++;
  }
  boolean controlarPuntos(){
    return puntos == 5;
  }
}
