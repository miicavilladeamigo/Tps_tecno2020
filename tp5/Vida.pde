class Vida {
  int posX, posY, vidas, vidasInicial;

  Vida(int p_posX, int p_posY) {
    posX = p_posX;
    posY = p_posY;
    vidas = 3;
    vidasInicial = vidas;
  }
  void dibujar() {
    textSize(20);
    fill(255);
    text("Vidas: " + vidas, posX, posY);
  }

  //Si el enemigo sale de la pantalla, pirde una vida. Lo mismo sucede cuando toca un hechizo enemigo.
  void pierdeVidas() {
    vidas = vidas - 1;
  }
  boolean controlarVidas(){
    return vidas == 0;
  }
}
